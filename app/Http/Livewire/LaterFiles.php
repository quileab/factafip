<?php

namespace App\Http\Livewire;

use Livewire\Component;
use Illuminate\Support\Facades\Storage;
use Gloudemans\Shoppingcart\Facades\Cart;

class LaterFiles extends Component
{
    public $files=[];
    public $selectedFile=null;
    public $loadData=false;
    
    public function mount(){
        // get all files from storage folder laterUse
        $this->files = Storage::files('private/laterUse');
    }

    public function render(){
        return view('livewire.later-files');
    }

    public function loadData(){
        $this->loadData = true;
    }

    public function invoice($file){
        $file=urldecode($file);
        list($type, $customer_id, $name)=explode('-', $file);
        
        // load in Cart::content() the content of json file
        $data = json_decode(Storage::disk('local')->get('/private/laterUse/'.$file), true);

        Cart::destroy();
        foreach($data as $item){
            //$product = \App\Models\Product::find($item['id']);
            $cartItem=Cart::add(
                $item['id'],
                $item['name'],
                $item['qty'],
                $item['price'],0)->associate('App\Models\Product');
            Cart::setTax($cartItem->rowId, $item['taxRate']);
            Cart::setDiscount($cartItem->rowId, $item['discountRate']);
        }
        // redirect to invoice
        return redirect()->route('invoices',['customer_id'=>$customer_id]);
    }

}
