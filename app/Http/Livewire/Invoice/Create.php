<?php

namespace App\Http\Livewire\Invoice;

use Afip;
use Livewire\Component;
use Illuminate\Support\Facades\Storage;
use Gloudemans\Shoppingcart\Facades\Cart;

use function PHPUnit\Framework\isEmpty;

class Create extends Component
{
    // Livewire utilities
    public $search = '';
    public $searchType=false;
    public $ProdSearch = '';
    public $openModal = false;
    public $openSaveModal = false;
    public $fiscal; // Global state if Enabled Fiscal Vouchers
    public $afipModal = false;
    public $afipError = '';
    public $readyToLoad = false;
    public $debugging = false;
    public $rg5329 = true; // AFIP RG 5329/2023 enabled
    public $highlightIndex=0;
    
    // Livewire properties
    public $defaultPriceCol=1;
    public $invoice;
    public $invoiceSaveName='';
    public $invoices=[];
    public $customer_id_type=96;
    public $customer;
    public $customers=[];
    public $warehouse;
    public $voucher_types=[];
    public $products=[];
    public $selectedProduct;
    public $quantity=1;
    public $price=null;
    public $discount=0;
    //public $subtotal;
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
    public $invoice_warehouse_id;
    public $invoice_currency_id;

    // listen to redirect event
    protected $listeners = [
        'voucherReset' => 'voucherReset',
    ];

    // function listen to redirect event
    public function voucherReset()
    {
        Cart::destroy();
        $this->emit('toast','Factura creada correctamente','success');
        $this->render();
    }

    public function mount() {
        //$this->voucher_type_id=6;
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

        // if fiscal enabled read 'enabled voucher types' else NON FIscal types
        $this->fiscal=(bool)\App\Models\Config::find('fiscal')->value;
        $this->voucher_types=\App\Models\VoucherType::where('enabled', true)
            ->when(!$this->fiscal, function($query) {
                return $query->where('id','>', 5000);
            })->get();

        if (!$this->fiscal) {
            $this->CbteTipo=$this->voucher_types->first()->id;
        }
    }

    public function render() {
        $cart=Cart::content();
        // check if cart is empty
        if (count($cart)) {
            $data=$this->invoiceCreate(false); // false means just return data
            //dd($data);
            $this->total=number_format($data['ImpTotal'],2,'.','');
            $ivas=$data['Iva'];
            $tributos=$data['Tributos'] ?? [];
        } else {
            $this->total=number_format(0,2,'.','');
            $ivas=[];
            $tributos=[];
        }

        // format total
          $split=explode('.',$this->total);
          $total_integer=number_format($split[0],0,'','.');
          $total_decimal=$split[1];
        return view('livewire.invoice.create',compact('cart','total_integer','total_decimal','ivas','tributos'));
    }

    public function UpdatedProdSearch($search) {
        if (strlen($search)>2) {
            //$this->search = $search;
            $searchValues = preg_split('/\s+/', $search, -1, PREG_SPLIT_NO_EMPTY);
            $this->products=\App\Models\Product::where(function($query) use ($searchValues){
                foreach ($searchValues as $srch) {
                    $query->whereRaw(\Illuminate\Support\Facades\DB::raw('CONCAT(description,model,brand) LIKE "%'.$srch.'%"'));
                }
            })->get();
        }else{
            if (strlen($search)!=0) {
                $this->emit('toast', 'Debe ingresar más de 2 caracteres', 'error');
            }
        }
        // --- selected product !! ---
        if (strpos($search,'·')!==false) {
            $this->defaultPriceCol='';
            $this->selectedProduct=\App\Models\Product::
                find(
                    substr($search,0,strpos($search,'·'))
                );
            $this->emit('setfocus','priceDropdown');
        }
    }

    public function inputBarcode(){
        $search=$this->search;
        $this->search='';
        if (strlen($search)==13) {
            $this->selectedProduct=\App\Models\Product::where('barcode', $search)->first();
            if ($this->selectedProduct==null) {
                $this->emit('toast','No se encontró el producto','error');
            }else{
                $price=$this->defaultPriceCol==1?$this->selectedProduct->sale_price1:$this->selectedProduct->sale_price2;
                $this->addToCart($this->selectedProduct->id,$price);
            }
        } else {
            $this->emit('toast','Error en código de barras','error');
        }
    }

    public function selectProduct($product_id){
        $this->products=\App\Models\Product::where('id', $product_id)->get();
        $this->discount = 0;
        $this->price='';
        $this->emit('setfocus','priceDropdown');
    }

    public function addToCart($product,$price){
        if (Cart::content()->count()>30) {
            $this->emit('toast','No se pueden agregar más de 30 productos','error');
            return;
        }
        $product=\App\Models\Product::find($product);
        // check if $price is greater or equal than product's sale_price1
        if ($price<$product->sale_price1) {
            $this->emit('toast','Precio por debajo de lo permitido','error');
            return;
        }

        $cartItem=Cart::add(
            $product->id,
            $product->brand.': '.$product->model.': '.$product->description,
            $this->quantity,
            $price,0)->associate('App\Models\Product');
        Cart::setTax($cartItem->rowId,floatval($product->tax->value));
        Cart::setDiscount($cartItem->rowId,floatval($this->discount));

        $this->price=null;
        $this->selectedProduct=null;
        $this->quantity=1;
        $this->ProdSearch='';

        $this->emit('setfocus','ProdSearch');
    }

    public function removeItem($rowId) {
        Cart::remove($rowId);
    }

    public function removeOneItem($rowId)
    {
        $cart=Cart::get($rowId);
        if ($cart->qty>1) {
            Cart::update($rowId,$cart->qty-1);
        }
    }

    public function cartContentToArray($cart){
        $data=[];
        foreach ($cart as $item) {
            $data[]=[
                'id'=>$item->id,
                'qty'=>$item->qty,
                'name'=>$item->name,
                'price'=>$item->price,
                'weight'=>$item->weight,
                'options'=>$item->options,
                'taxRate'=>$item->taxRate,
                'discountRate'=>$item->discountRate,
            ];
        }
        return $data;
    }

    function calcTributes(array $Ivas){
        $decimals = config('cart.format.decimals', 2);
        $taxes=&$Ivas;// arreglar
        // RG5329/23 tributes from BaseImp (neto)
        $tributes=[]; $importeTrib=0;
        foreach ($taxes as $tax) {
            switch ($tax['Id']) {
                case 4:
                    $importe=round($tax['BaseImp']*1.5/100, $decimals);
                    $tributes[]=[
                    'Id' 		=>  6, // Id del tipo de tributo (ver tipos disponibles)
                    'Desc' 		=> 'RG 5329/23', // (Opcional) Descripcion
                    'BaseImp' 	=> $tax['BaseImp'], // Base imponible para el tributo
                    'Alic' 		=> 1.5, // Alícuota
                    'Importe' 	=> $importe // Importe del tributo
                    ];
                    break;
                case 5:
                    $importe=round($tax['BaseImp']*3/100, $decimals);
                    $tributes[]=[
                    'Id' 		=>  6, // Id del tipo de tributo (ver tipos disponibles)
                    'Desc' 		=> 'RG 5329/23', // (Opcional) Descripcion
                    'BaseImp' 	=> $tax['BaseImp'], // Base imponible para el tributo
                    'Alic' 		=> 3, // Alícuota
                    'Importe' 	=> $importe // Importe del tributo
                    ];
                    break;
            }
            $importeTrib=$importeTrib+$importe;
        }
        return [
            'tributes'=>$tributes,
            'impTrib'=>$importeTrib
        ];    
    }

    // @param $createInvoice false to return Data object
    public function invoiceCreate(bool $createInvoice=true){
        // false si solo debe RETORNAR los calculos
        $createInvoice ? $fiscal=(bool)\App\Models\Config::find('fiscal')->value : $fiscal=false;
        $production=(bool)\App\Models\Config::find('production')->value;
        $environment=(string)\App\Models\Config::find('environment')->value;
        $decimals = config('cart.format.decimals', 2);
        $cuit = (int) preg_replace('/[^0-9]/', '', \App\Models\Config::find('cuit')->value);
        $importeTrib=0;
        // create the taxes array and initialize it
        foreach (Cart::content() as $item) {
            $item->tax_id=$item->model->tax_condition_type_id;
            $taxes[$item->tax_id]=['Id'=>0,'BaseImp'=>0,'Importe'=>0,];
        }
        // Make calculations & add the taxes to the array
        foreach (Cart::content() as $item) {
            $tax_id=$item->model->tax_condition_type_id;
            $Discount=round($item->price,$decimals)*round($item->discountRate/100,$decimals); 
            $Subtotal=round(($item->price-$Discount)*$item->qty,$decimals);
            $Neto=round($Subtotal/(1+$item->taxRate/100),$decimals);
            $BaseImp=round($taxes[$item->tax_id]['BaseImp']+$Neto,$decimals);
            $Importe=round($taxes[$item->tax_id]['Importe']+($Subtotal-$Neto),$decimals);
            // update taxes with new values
            $taxes[$item->tax_id]=[
                'Id'=>$tax_id,
                'BaseImp'=>$BaseImp,
                'Importe'=>$Importe,
            ];

            $itemDetail[$item->rowId]=[
                'Precio'=>round($item->price,$decimals)*round($item->qty,$decimals),
                'SubTotal'=>$Subtotal,
                'Descuento'=>$Discount,
                'BaseImp'=>$BaseImp,
                'IVA'=>$Importe,
            ];
        }
        
        // elimino los keys de impuesto y quito un nivel de array
        // calculo Importe Neto y Alicuota de IVA
        $ImpNeto=0;
        $AlicIVA=0;
        $newarray=[];
        foreach($taxes as $tax){
          $ImpNeto=$ImpNeto+$tax['BaseImp'];
          $AlicIVA=$AlicIVA+$tax['Importe'];
          $newarray[]=$tax;
        }
        $taxes=$newarray;

        // create invoice using AFIP method - connect to AFIP
        if ($fiscal) {
            $afip = new Afip([
                'CUIT' => $cuit,
                'production' => $production,
                'cert' => \App\Models\Config::find('afip_cert')->value,
                'key' => \App\Models\Config::find('afip_key')->value,
                'environment' => $environment,
                'exceptions'=>true,
                ]);

            try { // to create ApiTokenForm ElectronicBilling
                $last_voucher = $afip->ElectronicBilling->GetLastVoucher($this->PtoVta,$this->CbteTipo)+1;
            } 
            catch (\Exception $e) {
                $this->afipError=$e->getMessage();
                $this->afipModal=true;
                return;
            }

        } else { // if not fiscal, create X document
            // set defaults
            if ($createInvoice==true){
                $this->PtoVta = 2; // HARDCODED
                $this->CbteTipo = 2; // HARDCODED
                // todo: get last voucher from database
            }
            $last_voucher = rand(1,999999);
        }

        // if voucher==1 get CUIT else customer_id
        $this->CbteTipo ==1 ? $DocNro=$this->customer->CUIT : $DocNro=$this->customer_id;
        $data = array(
            'CantReg' 	=> 1, // Cantidad de comprobantes a registrar
            'PtoVta' 	=> $this->PtoVta,  // Punto de venta
            'CbteTipo' 	=> $this->CbteTipo,  // Tipo de comprobante (ver tipos disponibles) 
            'Concepto' 	=> 1, //(int)$this->invoice_concepto,  // Concepto del Comprobante: (1)Productos, (2)Servicios, (3)Productos y Servicios
            'DocTipo' 	=> $this->customer->customer_id_type_id, // Tipo de documento del comprador (99 consumidor final, ver tipos disponibles)
            'DocNro' 	=> $DocNro,  // Número de documento del comprador (0 consumidor final)
            'CbteDesde' => (int)$last_voucher,  // Número de comprobante o numero del primer comprobante en caso de ser mas de uno
            'CbteHasta' => (int)$last_voucher,  // Número de comprobante o numero del último comprobante en caso de ser mas de uno
            'CbteFch' 	=> intval(date('Ymd')), // (Opcional) Fecha del comprobante (yyyymmdd) o fecha actual si es nulo
            'ImpTotal' 	=> 0, // 121 Importe total del comprobante
            'ImpTotConc'=> 0, // Importe neto no gravado ***
            'ImpNeto' 	=> $ImpNeto, // 100 Importe neto gravado
            'ImpOpEx' 	=> 0, // Importe exento de IVA ***
            'ImpIVA' 	=> $AlicIVA,  // 21 Importe total de IVA
            'ImpTrib' 	=> 0, //Importe total de tributos
            'MonId' 	=> 'PES', //Tipo de moneda usada en el comprobante (ver tipos disponibles)('PES' para pesos argentinos) 
            'MonCotiz' 	=> 1, // Cotización de la moneda usada (1 para pesos argentinos)  
            'Iva' 		=> $taxes, // (Opcional) Alícuotas asociadas al comprobante
            //'Tributos'  =>[], // assigned later on
        );
        if (($this->rg5329) && ($this->CbteTipo==1)){
            $trib=$this->calcTributes($taxes);
            $data['Tributos']=$trib['tributes'];// $tributes;
            $data['ImpTrib']=$trib['impTrib'];//$importeTrib;
        }

        // at last set the Invoice TOTAL 
        //$ImpTotal=round($ImpNeto+$importeTrib+$AlicIVA,$decimals);
        $data['ImpTotal']=round($data['ImpNeto']+$data['ImpTrib']+$data['ImpIVA'],$decimals);
        // /////// return data ----------------------***
        if ($createInvoice==false){
            return $data;
        }
        // /////// return ---------------------------***


        if($fiscal){
            try{
                $res = $afip->ElectronicBilling->CreateVoucher($data);
            } catch (\Exception $e) {
                $res = $e->getMessage();
            }
        } else {
            $res = [
                'CAE' => '---- NO FISCAL ----',
                'CAEFchVto' => date('Y-m-d'),
            ];
        }


        // si no existe $res['cae'] entonces no se pudo crear el comprobante fiscal
        if(!isset($res['CAE'])){
            $this->afipError=$res;
            $this->afipModal=true;
            return; // ERROR
        }

        // descontar stock del inventory del warehouse seleccionado
        foreach (Cart::content() as $item) {
            // get inventory quantity from warehouse
            \App\Models\Inventory::where('product_id',$item->id)->
                where('warehouse_id',$this->warehouse->id)->
                decrement('quantity',$item->qty);
        }

        $res['CUIT']=$cuit;
        $data['res']=$res;
        // original $data['items']=$this->cartContentToArray(Cart::content()); // ver data desde function
        $data['items']=Cart::content(); // ver data desde function
        $data['itemDetail']=$itemDetail;
        session()->put('invoiceData',$data);

        if ($this->debugging) {
            dd($data, strlen(serialize($data)));
        }
        // store invoice data in vouchers table
        $voucher = new \App\Models\Voucher;
        $voucher->id=$data['CbteTipo'].'-'.$data['PtoVta'].'-'.$data['CbteDesde'];
        $voucher->data=$data;
        $voucher->save();

        //$res['CAE']; //CAE asignado el comprobante
        //$res['CAEFchVto']; //Fecha de vencimiento del CAE (yyyy-mm-dd)
        
        $this->emitSelf('voucherReset');
        
        return redirect()->route('pdf.invoice');
    }

    public function invoiceSave(){
        // replace spaces with underscores
        $this->invoiceSaveName=str_replace(' ','_',$this->invoiceSaveName);
        //filter from $this->invoiceSaveName not valid characters
        $this->invoiceSaveName=preg_replace('/[^A-Za-z0-9_]/', '', $this->invoiceSaveName);
        // extract Cart content data in json format for later use
        $data=$this->cartContentToArray(Cart::content());
        //save json file in public/storage/laterUse/ folder
        $fileName='/private/laterUse/invoice-'.
            $this->customer->id.'-'.
            $this->invoiceSaveName.'.json';

        Storage::disk('local')->put($fileName,json_encode($data));
        $this->openSaveModal=false;
        $this->invoiceSaveName='';
    }

    public function resetSearch() {
        $this->ProdSearch = '';
        $this->selectedProduct =[];
        $this->products = [];
        $this->highlightIndex = 0;
    }

}
