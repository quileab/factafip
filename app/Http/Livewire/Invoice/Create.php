<?php

namespace App\Http\Livewire\Invoice;

use Afip;
use Livewire\Component;
use Barryvdh\DomPDF\Facade as PDF;
use Gloudemans\Shoppingcart\Facades\Cart;
use SimpleSoftwareIO\QrCode\Facades\QrCode;
use stdClass;

class Create extends Component
{
    // Livewire utilities
    public $search = '';
    public $ProdSearch = '';
    public $openModal = false;
    public $readyToLoad = false;
    
    // Livewire properties
    public $defaultPriceCol=1;
    public $priceColumn=1;
    public $invoice;
    public $invoices=[];
    public $customer_id_type=96;
    public $customer;
    public $customers=[];
    public $warehouse;
    public $voucher_types=[];
    public $products=[];
    public $quantity=1;
    public $price;
    public $discount;
    public $subtotal;
    public $total;
    // route parameters
    public $customer_id;
    public $CbteTipo=6;
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
            $this->customer_id=0;
            $this->customer=\App\Models\Customer::find($this->customer_id);
        }
        $this->warehouse=\App\Models\Warehouse::find(session('warehouse_id'));
        if ($this->warehouse==null) {
            $this->emit('toast','No se encontró el Depósito','error');
        }

        $this->voucher_types=\App\Models\VoucherType::all();
    }

    public function render()
    {
        $cart=Cart::content();
        $this->total=number_format(Cart::priceTotal(),2,'.','');
        // format total
            $split=explode('.',$this->total);
            $total_integer=number_format($split[0],0,'','.');
            $total_decimal=$split[1];
        return view('livewire.invoice.create',compact('cart','total_integer','total_decimal'));
    }

    public function UpdatingProdSearch($search)
    {
        if (strlen($search)>2) {
            $this->products=\App\Models\Product::where('description', 'like', '%'.$search.'%')
            ->orWhere('model', 'like', '%'.$search.'%')
            ->orWhere('brand', 'like', '%'.$search.'%')
            ->orWhere('barcode', 'like', '%'.$search.'%')
            ->get();
            if (count($this->products)==1) {
                $this->emit('setfocus','priceDropdown');
            }
        }else{
            $this->emit('toast','Debe ingresar más de 2 caracteres','error');
        }
    }

    public function inputBarcode()
    {
        $search=$this->search;
        $this->search='';
        if (strlen($search)==13) {
            $this->product=\App\Models\Product::where('barcode', $search)->first();
            if ($this->product==null) {
                $this->emit('toast','No se encontró el producto','error');
            }else{
                $this->addToCart($this->product->id,$this->defaultPriceCol);
            }
        } else {
            $this->emit('toast','Error en código de barras','error');
        }
    }

    public function searchProductsModal(){
        $this->reset('products');
        $this->emit('setfocus','ProdSearch');
        $this->openModal = true;
    }

    public function selectProduct($product_id){
        $this->products=\App\Models\Product::where('id', $product_id)->get();
        $this->discount = 0;
        $this->emit('setfocus','priceDropdown');
    }

    public function addToCart($product,$priceColumn)
    {
        $product=\App\Models\Product::find($product);
        //dd($product, $priceColumn);
        // I´ve used if instead switch because there´s only 2 options
        if ($priceColumn==2) {
            $price=$product->sale_price2;
        } else {
            $price=$product->sale_price1;
        }


        $cartItem=Cart::add(
            $product->id,
            $product->brand.': '.$product->model.': '.$product->description,
            $this->quantity,
            $price,0)->associate('App\Models\Product');
        Cart::setTax($cartItem->rowId,floatval($product->tax->value));
        Cart::setDiscount($cartItem->rowId,$this->discount);
       
        $this->quantity=1;
        $this->barcode='';
        $this->search='';
        $this->openModal=false;
    }

    public function removeItem($rowId)
    {
        Cart::remove($rowId);
    }

    public function debugCart()
    {
        // route to controller view inside pdfController
        //redirect(route('pdf.invoice'));
        $cart=Cart::content();
        dd($cart);
     }

    public function invoiceCreate(){
        $fiscal=false;

        $decimals = config('cart.format.decimals', 2);
        $cuit = (int)\App\Models\Config::find('cuit')->value;
        // create the taxes array and initialize it
        foreach (Cart::content() as $item) {
            $item->tax_id=$item->model->tax_condition_type_id;
            $taxes[$item->tax_id]=[
                'Id'=>0,
                'BaseImp'=>0,
                'Importe'=>0,
            ];
        }
        // add the taxes to the array
        foreach (Cart::content() as $item) {
            $tax_id=$item->model->tax_condition_type_id;
            $Subtotal=round($item->price*$item->qty,$decimals);
            $Neto=round($Subtotal/(1+$item->taxRate/100),$decimals);
            $BaseImp=round($taxes[$item->tax_id]['BaseImp']+$Neto,$decimals);
            $Importe=round($taxes[$item->tax_id]['Importe']+($Subtotal-$Neto),$decimals);
            
            $taxes[$item->tax_id]=[
                'Id'=>$tax_id,
                'BaseImp'=>$BaseImp,
                'Importe'=>$Importe,
            ];
        }
        
        $ImpNeto=0;
        $AlicIVA=0;
        // elimino los keys de impuesto y quito un nivel de array
        $newarray=[];
        foreach($taxes as $tax){
          $ImpNeto=$ImpNeto+$tax['BaseImp'];
          $AlicIVA=$AlicIVA+$tax['Importe'];
          $newarray[]=$tax;
        }
        $taxes=$newarray;

        $ImpTotal=round($ImpNeto+$AlicIVA,$decimals);

        // create invoice using AFIP method - connect to AFIP
        if ($fiscal) {
            $afip = new Afip([
            'CUIT' => $cuit,
            'production' => false,
            'cert' => 'DN1.crt',
            'key' => 'Private.key',
            'environment' => 'homologation',
        ]);
        $last_voucher = $afip->ElectronicBilling->GetLastVoucher($this->PtoVta,$this->CbteTipo)+1;
        } else {
            $last_voucher = rand(1,999999);
        }


        if ($this->CbteTipo==1) {
            $DocNro=$this->customer->CUIT;
        } else {
            $DocNro=$this->customer_id;
        }

        $data = array(
            'CantReg' 	=> 1,  // Cantidad de comprobantes a registrar
            'PtoVta' 	=> $this->PtoVta,  // Punto de venta
            'CbteTipo' 	=> $this->CbteTipo,  // Tipo de comprobante (ver tipos disponibles) 
            'Concepto' 	=> 1, //(int)$this->invoice_concepto,  // Concepto del Comprobante: (1)Productos, (2)Servicios, (3)Productos y Servicios
            'DocTipo' 	=> $this->customer->customer_id_type_id, // Tipo de documento del comprador (99 consumidor final, ver tipos disponibles)
            'DocNro' 	=> $DocNro,  // Número de documento del comprador (0 consumidor final)
            'CbteDesde' => (int)$last_voucher,  // Número de comprobante o numero del primer comprobante en caso de ser mas de uno
            'CbteHasta' => (int)$last_voucher,  // Número de comprobante o numero del último comprobante en caso de ser mas de uno
            'CbteFch' 	=> intval(date('Ymd')), // (Opcional) Fecha del comprobante (yyyymmdd) o fecha actual si es nulo
            'ImpTotal' 	=> $ImpTotal, // 121 Importe total del comprobante
            'ImpTotConc' 	=> 0,   // Importe neto no gravado ***
            'ImpNeto' 	=> $ImpNeto, // 100 Importe neto gravado
            'ImpOpEx' 	=> 0,   // Importe exento de IVA ***
            'ImpIVA' 	=> $AlicIVA,  // 21 Importe total de IVA
            'ImpTrib' 	=> 0,   //Importe total de tributos
            'MonId' 	=> 'PES', //Tipo de moneda usada en el comprobante (ver tipos disponibles)('PES' para pesos argentinos) 
            'MonCotiz' 	=> 1,     // Cotización de la moneda usada (1 para pesos argentinos)  
            'Iva' 		=> $taxes, // (Opcional) Alícuotas asociadas al comprobante
                // array(
                //     'Id' 		=> 5, // Id del tipo de IVA (5 para 21%)(ver tipos disponibles) 
                //     'BaseImp' 	=> $ImpNeto,    // 100 Base imponible
                //     'Importe' 	=> $AlicIVA     // 21 Importe 
                // )
        );

        if($fiscal){
        try{
            $res = $afip->ElectronicBilling->CreateVoucher($data);
        } catch (\Exception $e) {
            $res = $e->getMessage();
        }
        } else {
            $res = [
                'CAE' => '72027983789500',
                'CAEFchVto' => '2022-01-21',
            ];
        }
        $res['CUIT']=$cuit;
        $data['res']=$res;
        $data['items']=Cart::content();
        session()->put('invoiceData',$data);
        
        //$res['CAE']; //CAE asignado el comprobante
        //$res['CAEFchVto']; //Fecha de vencimiento del CAE (yyyy-mm-dd)

        return redirect()->route('pdf.invoice');
        
    }

}
