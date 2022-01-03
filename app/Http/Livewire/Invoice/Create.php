<?php

namespace App\Http\Livewire\Invoice;

use Afip;
use Livewire\Component;

class Create extends Component
{
    // Livewire utilities
    public $search = '';
    public $openModal = false;
    public $readyToLoad = false;
    public $updating = false;

    // Livewire properties
    public $invoice;
    public $invoices=[];
    public $customer_id_type=96;
    public $customer=[];
    public $customers=[];
    public $warehouse;
    public $voucher_types=[];
    public $voucher_type_id;
    // route parameters
    public $customer_id;
    public $CbteTipo;
    public $PtoVta=2;

    // invoice properties
    public $invoice_PtoVta=2;
    public $invoice_number=0;
    public $invoice_date=0;
    public $invoice_concepto=0; // 0: Productos, 1: Servicios, 2: Productos y Servicios
    public $invoice_type_id;
    public $invoice_customer_id;
    public $invoice_warehouse_id;
    public $invoice_currency_id;
    public $invoice_exchange_rate;


    // en mount tomar parametros
    public function mount()
    {
        $this->invoice_customer_id=$this->customer_id;
        $this->voucher_type_id=6;
        $this->invoice_PtoVta=$this->PtoVta;
        //$this->invoice_type_id=$this->CbteTipo;
        // resto de los datos
        $this->customer=\App\Models\Customer::find($this->customer_id);
        if ($this->customer==null) {
            $this->emit('toast','No se encontró el cliente','error');
        }
        $this->warehouse=\App\Models\Warehouse::find(session('warehouse_id'));
        if ($this->warehouse==null) {
            $this->emit('toast','No se encontró el Depósito','error');
        }

        $this->voucher_types=\App\Models\VoucherType::all();
    }


    public function render()
    {
        return view('livewire.invoice.create');
    }

    public function invoiceCreate(){
        // create invoice using AFIP method
        $afip = new Afip(array('CUIT' => 20111111112));
        $data = array(
            'CantReg' 	=> 1,  // Cantidad de comprobantes a registrar
            'PtoVta' 	=> 1,  // Punto de venta
            'CbteTipo' 	=> 6,  // Tipo de comprobante (ver tipos disponibles) 
            'Concepto' 	=> 1,  // Concepto del Comprobante: (1)Productos, (2)Servicios, (3)Productos y Servicios
            'DocTipo' 	=> 99, // Tipo de documento del comprador (99 consumidor final, ver tipos disponibles)
            'DocNro' 	=> 0,  // Número de documento del comprador (0 consumidor final)
            'CbteDesde' 	=> 1,  // Número de comprobante o numero del primer comprobante en caso de ser mas de uno
            'CbteHasta' 	=> 1,  // Número de comprobante o numero del último comprobante en caso de ser mas de uno
            'CbteFch' 	=> intval(date('Ymd')), // (Opcional) Fecha del comprobante (yyyymmdd) o fecha actual si es nulo
            'ImpTotal' 	=> 121, // Importe total del comprobante
            'ImpTotConc' 	=> 0,   // Importe neto no gravado
            'ImpNeto' 	=> 100, // Importe neto gravado
            'ImpOpEx' 	=> 0,   // Importe exento de IVA
            'ImpIVA' 	=> 21,  //Importe total de IVA
            'ImpTrib' 	=> 0,   //Importe total de tributos
            'MonId' 	=> 'PES', //Tipo de moneda usada en el comprobante (ver tipos disponibles)('PES' para pesos argentinos) 
            'MonCotiz' 	=> 1,     // Cotización de la moneda usada (1 para pesos argentinos)  
            'Iva' 		=> array( // (Opcional) Alícuotas asociadas al comprobante
                array(
                    'Id' 		=> 5, // Id del tipo de IVA (5 para 21%)(ver tipos disponibles) 
                    'BaseImp' 	=> 100, // Base imponible
                    'Importe' 	=> 21 // Importe 
                )
            ), 
        );
        
        $res = $afip->ElectronicBilling->CreateVoucher($data);
        
        $res['CAE']; //CAE asignado el comprobante
        $res['CAEFchVto']; //Fecha de vencimiento del CAE (yyyy-mm-dd)        
        
    }

}
