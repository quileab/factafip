<?php

namespace App\Http\Controllers;
use Afip;
use Illuminate\Http\Request;

class DashboardController extends Controller
{
    public function index()
    {
        $data=[];
        /* 
        El seteo de warehouse_id lo
        hace AppServiceProvider
        */
        $afip = new Afip([
            'CUIT' => (int) preg_replace('/[^0-9]/', '', \App\Models\Config::find('cuit')->value),
            'production' => false,
            'cert' => 'DN1.crt',
            'key' => 'Private.key',
            'environment' => 'homologation',
            ]);

        // AFIP server status    
        $server_status = $afip->ElectronicBilling->GetServerStatus();
        foreach ($server_status as $key => $value) {
            $data[$key] = $value;
        }
        
        //último comprobante p.de venta 1, comprobante 6 (Factura B)
        $data['Factura A 2'] = $afip->ElectronicBilling->GetLastVoucher(2,1);
        $data['Factura B 2'] = $afip->ElectronicBilling->GetLastVoucher(2,6);

        return view('dashboard',compact('data'));
    }
}
