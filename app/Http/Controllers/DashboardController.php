<?php

namespace App\Http\Controllers;
use Afip;
use Illuminate\Http\Request;

class DashboardController extends Controller
{
    public function index()
    {
        $data=[];
        // definir el warehouse por defecto
        if(!session()->has('warehouse_id')){
            $default_warehouse= \App\Models\Config::find('warehouse_id')->value ?? null;
            $default_warehouse_name= \App\Models\Warehouse::find($default_warehouse)->name ?? null;
            session(['warehouse_id'=>$default_warehouse ?? null]);
            session(['warehouse_name'=>$default_warehouse_name ?? null]);
        }
        $afip = new Afip([
            'CUIT' => (int) preg_replace('/[^0-9]/', '', \App\Models\Config::find('cuit')->value),
            'production' => \App\Models\Config::find('production')->value==1 ? true : false,
            'cert' => \App\Models\Config::find('afip_cert')->value,
            'key' => \App\Models\Config::find('afip_key')->value,
            'environment' => \App\Models\Config::find('environment')->value,
            'exceptions'=>true,
            ]);

        // AFIP server status    
        $server_status = $afip->ElectronicBilling->GetServerStatus();
        foreach ($server_status as $key => $value) {
            $data[$key] = $value;
        }
        $fiscal=(bool)\App\Models\Config::find('fiscal')->value;
        if ($fiscal) { // AFIP try access to last voucher
            //último comprobante p.de venta 1, comprobante 6 (Factura B)
            try { // to create ApiTokenForm ElectronicBilling
                $data['Factura A 2'] = $afip->ElectronicBilling->GetLastVoucher(2, 1);
                $data['Factura B 2'] = $afip->ElectronicBilling->GetLastVoucher(2, 6);
            } catch (\Exception $e) {
                $data['ERROR !']=$e->getMessage();
                // set fiscal value to 0 in config
                \App\Models\Config::whereId('fiscal')->update(['value' => 0]);
                $data['Fiscal']='Ha sido deshabilitado';
            }
        }
        return view('dashboard',compact('data'));
    }
}
