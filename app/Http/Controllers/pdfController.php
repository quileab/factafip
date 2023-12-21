<?php

namespace App\Http\Controllers;

use ArgumentCountError;
use SimpleSoftwareIO\QrCode\Facades\QrCode;
use Illuminate\Support\Facades\Storage;

class pdfController extends Controller{
    public function invoice(){
        $data=session('invoiceData');
        //$items=new stdClass();
        $items=(object)$data['items'];

        // dd($data, $items);

        $datos_qr = json_encode([
            "ver" => 1,
            "fecha" => substr($data['CbteFch'],0,4).'-'.substr($data['CbteFch'],4,2).'-'.substr($data['CbteFch'],6,2),
            "cuit" => $data['res']['CUIT'],
            "ptoVta" => (int) $data['PtoVta'],
            "tipoCmp" => (int) $data['CbteTipo'],
            "nroCmp" => (int) $data['CbteDesde'],
            "importe" => (float) $data['ImpTotal'],
            "moneda" => "PES",
            "ctz" => (float) 1,
            "tipoDocRec" => (int) $data['DocTipo'],
            "nroDocRec" => (int) $data['DocNro'],
            "tipoCodAut" => "E",
            "codAut" => (int) $data['res']['CAE']
        ]);
        $datos_cmp_base_64 = base64_encode($datos_qr);
        $url = 'https://www.afip.gob.ar/fe/qr/';
        $to_qr = $url.'?p='.$datos_cmp_base_64;

        // otros datos
        $customer=\App\Models\Customer::find($data['DocNro']);
        // if customer null search customer by CUIT field
        if(!$customer){
            $customer=\App\Models\Customer::where('cuit',$data['DocNro'])->first();
        }
        $data['customer']=$customer;
        //dd($customer,$data);
        $data['customer']->responsibility_type_id=\App\Models\ResponsibilityType::find($data['customer']->responsibility_type_id)->value;

        $conf=\App\Models\Config::pluck('value','id')->toArray('id','value');
        $tipo_cbte=\App\Models\VoucherType::find($data['CbteTipo']);
        // extraer de $tipo_cbte->value todo menos los 2 ultimos caracteres
        $data['inv_type']=$tipo_cbte->type;
        // extraer de $tipo_cbte->value el ultimo caracter
        $data['inv_letter']=$tipo_cbte->letter;
        // convertir $data['iva']['Id'] en \App\Model\TaxCondition->description
        foreach($data['Iva'] as $key=>$value){
            $data['Iva'][$key]['Id']=\App\Models\TaxConditionType::find($value['Id'])->description;
        }
        
        $data['conf']=$conf;
        $data['res']['CAEFchVto']=date('d/m/Y', strtotime($data['res']['CAEFchVto']));

        $data['CbteTipo']=str_pad($data['CbteTipo'], 2, '0', STR_PAD_LEFT);
        $data['Customer']=\App\Models\Customer::find($data['DocNro']);
        $data['tax_cond']=\App\Models\ResponsibilityType::find($data['conf']['tax_cond'])->value;
        $data['ptoVta']=str_pad($data['PtoVta'], 4, '0', STR_PAD_LEFT);
        $data['invoice_number']=str_pad($data['CbteDesde'], 8, '0', STR_PAD_LEFT);
        $data['invoice_date']=date('d/m/Y', strtotime($data['CbteFch']));

        //dd($data, $items);

        $pdf=app('dompdf.wrapper');
        $pdf->loadView('pdf.invoice',[
            'data'=>$data,
            'datos_qr'=>$to_qr,
            'items'=>$items
        ]);
        $pdf->setPaper('A4', 'portrait');

        //clear invoiceData session 
        session()->forget('invoiceData');

        // return $pdf->stream("preview.pdf");
        $filename='invoice-'.$data['CbteTipo'].'-'.$data['PtoVta'].'-'.$data['CbteDesde'].'.pdf';
        $pdf->save(storage_path('app/public/invoices/'.$filename));
        // return $pdf->download($filename);
        return redirect()->route('printed',['filename'=>$filename ]);   
    }

    public function htmlinvoice(){
        $qr=QrCode::size(300)->generate('http://www.google.com');
        // retornar la vista invoice.blade.php
        return view('pdf.invoice',['qr'=>$qr]);
    }

    public function qrcode(){
        $qr=QrCode::format('png')->size(300)->generate('http://www.google.com');
        return $qr;
    }

    public function ListVouchers($CbteTipo,$PtoVta,$FchDesde,$FchHasta){
        $CbteTipoDesc=\App\Models\VoucherType::find($CbteTipo)->value;
        $startDate = \Carbon\Carbon::createFromFormat('Y-m-d', $FchDesde)->startOfDay();
        $endDate = \Carbon\Carbon::createFromFormat('Y-m-d', $FchHasta)->endOfDay();
        
        $vouchers=\App\Models\Voucher::whereBetween('created_at', [$startDate, $endDate])
        ->where('id','like', "$CbteTipo-$PtoVta-%")
        ->get()
        ->toArray();
        
        return view('List-Vouchers', compact('vouchers','CbteTipoDesc'));
    }

    public function ListAccounting($PtoVta,$FchDesde,$FchHasta){
        $vouchers_enabled=\App\Models\VoucherType::where('id','<',5000)
            ->where('enabled','1')->get()->toArray();

        $startDate = \Carbon\Carbon::createFromFormat('Y-m-d', $FchDesde)->startOfDay();
        $endDate = \Carbon\Carbon::createFromFormat('Y-m-d', $FchHasta)->endOfDay();

        // create text file in storage path
        if (! Storage::put('VENTAS.prn', 
        'Fecha dd/mmCpbteTipoSuc.  Número      Razón Social o Denominación Cliente      Tipo     CUIT                 Domicilio             C.P.PciaCondCód.Neto Gravado  Alíc.  IVA LiquidaIVA Débito Cód. Conceptos NGCód.  Perc./Ret. Pcia')) {
            return false;// The file could not be written to disk...
        }
        
        // loop all Enabled Fiscal Voucher Types record
        foreach($vouchers_enabled as $voucher_enabled) {
            $id=$voucher_enabled['id'];
            $vouchers=\App\Models\Voucher::whereBetween('created_at', [$startDate, $endDate])
            ->where('id','like', "$id-$PtoVta-%")
            ->get()
            ->toArray();

            // loop Vouchers
            foreach($vouchers as $voucher) {
                $CbteFch=\Carbon\Carbon::createFromFormat('Ymd', $voucher['data']['CbteFch'])->format('d/m/Y');
                $CbteTipoDesc=\App\Models\VoucherType::find($voucher['data']['CbteTipo'])->toArray();
                $Cbte=str_pad(substr($CbteTipoDesc['type'],0,5),5," ",STR_PAD_RIGHT).$CbteTipoDesc['letter'];
                $PtVt=str_pad($voucher['data']['PtoVta'],4," ",STR_PAD_LEFT);
                $Nro=str_pad($voucher['data']['CbteDesde'],8,"0",STR_PAD_LEFT);
                $DocTipo=$voucher['data']['DocTipo'];
                $DocNro=str_pad(substr($voucher['data']['DocNro'],0,11),11,'0',STR_PAD_LEFT);
                $Cliente=\App\Models\Customer::find($DocNro);
                if ($Cliente==null){
                    echo"<h2>Cliente NO ENCONTRADO » </h2>CUIT/DNI: $DocNro";
                    return false;
                }
                $Nombre=str_pad(substr(
                    // replace unicode multibyte characters
                    preg_replace('/[^\x20-\x7E]/','', $Cliente['business_name'])
                    ,0,45),45," ",STR_PAD_RIGHT);
                    $Respons=\App\Models\ResponsibilityType::find(
                        $Cliente['responsibility_type_id']
                        )->toArray();               
                        $RespAbbr=$Respons['abbr'];
                        
                $Cliente=$Cliente->toArray();

                // loop IVA types
                foreach($voucher['data']['Iva'] as $iva) {
                    $AlicId=$iva['Id'];
                    $Alicuota=\App\Models\TaxConditionType::find($AlicId)->toArray();
                    $Alicuota=str_pad(
                        number_format($Alicuota['value'],3,',',''),
                        6,' ',STR_PAD_RIGHT
                    );
                    $Neto=str_pad(
                        number_format($iva['BaseImp'],2,',',''),
                        13,' ',STR_PAD_LEFT
                    );
                    $ImpIva=str_pad(
                        number_format($iva['Importe'],2,',',''),
                        11,' ',STR_PAD_LEFT
                    );

                    Storage::append('VENTAS.prn', 
                    "$CbteFch $Cbte$PtVt    $Nro $Nombre$DocTipo  $DocNro                                             $RespAbbr      $Neto $Alicuota $ImpIva$ImpIva"
                    );

                }
            }
        }
        
        return response()->download(storage_path('app/VENTAS.prn'));
        //return response()->file(storage_path('app/VENTAS.prn'));
    }

}
