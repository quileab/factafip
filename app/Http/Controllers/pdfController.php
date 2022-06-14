<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use SimpleSoftwareIO\QrCode\Facades\QrCode;
use stdClass;

class pdfController extends Controller
{
    public function invoice(){
        $data=session('invoiceData');
        //$items=new stdClass();
        $items=(object)$data['items'];

        //dd($data, $items);

        $datos_qr = json_encode([
            "ver" => 1,
            "fecha" => $data['CbteFch'],
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
        return $pdf->download($filename);
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

}
