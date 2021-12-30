<?php

namespace App\Http\Livewire\Products;

use App\Models\Product;
use Livewire\Component;

class Show extends Component
{
    // Livewire emit events
    // protected $listeners=['setfocus']; 

    // Livewire utilities
    public $search = '';
    public $openModal = false;
    public $inventoryModal = false;
    public $readyToLoad = false;
    public $updating = false;

    // Livewire properties
    public $product;
    public $products=[];
    public $warehouse_id=1;
    public $warehouse_name='';
    
    // product foreign data
    public $foreign_categories=[];
    public $foreign_taxes=[];
    public $foreign_units=[];

    // product properties
    public $product_id;
    public $product_barcode="";
    public $product_origin_code="";
    public $product_category_id=1;
    public $product_brand="";
    public $product_model="";
    public $product_description="";
    public $product_price=0.00;
    public $product_quantity_min=1;
    public $product_unit_type_id=7;
    public $product_tax_condition_type_id=5;
    public $product_sale_price1=0.00;
    public $product_profit_percentage1=0.00;
    public $product_sale_price2=0.00;
    public $product_profit_percentage2=0.00;
    public $product_discount_max=0.00;
    
    // inventory properties
    public $add_qty=0;
    public $inventory_qty=0;
    
    public function mount()
    {
        $this->foreign_categories=\App\Models\Category::all();
        $this->foreign_taxes=\App\Models\TaxConditionType::where('value','>','0')->get();
        $this->foreign_units=\App\Models\UnitType::all();
        $this->products=\App\Models\Product::all();
        $this->warehouse_id=session('default_warehouse');
    }

    public function render()
    {
        return view('livewire.products.show');
    }

    public function loadData()
    {
        $this->readyToLoad = true;
    }

    public function UpdatingSearch($search)
    { 
        $this->search = $search;
        $this->products=\App\Models\Product::where('description','like','%'.$this->search.'%')
            ->orWhere('brand','like','%'.$this->search.'%')
            ->orWhere('barcode','like','%'.$this->search.'%')
            ->get();
        $this->render();
    }

    public function newProduct(){
        // reset properties
        $this->reset([
            'product_barcode',
            'product_origin_code',
            'product_category_id',
            'product_brand',
            'product_model',
            'product_description',
            'product_price',
            'product_quantity_min',
            'product_unit_type_id',
            'product_tax_condition_type_id',
            'product_sale_price1',
            'product_profit_percentage1',
            'product_sale_price2',
            'product_profit_percentage2',
            'product_discount_max',
        ]);
        $this->emit('setfocus', 'product_category_id');
        $this->openModal = true;
    }

    public function update(Product $product)
    {
        $this->validate([
            //'product_barcode' => 'required',
            //'product_origin_code' => 'required',
            'product_category_id' => 'required',
            'product_brand' => 'required',
            'product_model' => 'required',
            'product_description' => 'required',
            'product_price' => 'required',
            'product_quantity_min' => 'required',
            'product_unit_type_id' => 'required',
            'product_tax_condition_type_id' => 'required',
            'product_sale_price1' => 'required',
            'product_profit_percentage1' => 'required',
            'product_sale_price2' => 'required',
            'product_profit_percentage2' => 'required',
            'product_discount_max' => 'required',
        ]);
        // barcode can be null
        if (empty($this->product_barcode)) {
            $this->product_barcode = null;
        }
        $product=\App\Models\Product::find($this->product_id);
        $product->barcode=$this->product_barcode;
        $product->origin_code=$this->product_origin_code;
        $product->category_id=$this->product_category_id;
        $product->brand=$this->product_brand;
        $product->model=$this->product_model;
        $product->description=$this->product_description;
        $product->price=$this->product_price;
        $product->quantity_min=$this->product_quantity_min;
        $product->unit_type_id=$this->product_unit_type_id;
        $product->tax_condition_type_id=$this->product_tax_condition_type_id;
        $product->sale_price1=$this->product_sale_price1;
        $product->profit_percentage1=$this->product_profit_percentage1;
        $product->sale_price2=$this->product_sale_price2;
        $product->profit_percentage2=$this->product_profit_percentage2;
        $product->discount_max=$this->product_discount_max;
        $product->save();

        $this->updating = false;
        $this->openModal = false;
        $this->products=\App\Models\Product::all();
    }

    public function delete(Product $product)
    {
        $product->delete();
        $this->products=\App\Models\Product::all();
    }

    public function edit(Product $product)
    {
        $this->product_id = $product->id;
        $this->product_barcode = $product->barcode;
        $this->product_origin_code = $product->origin_code;
        $this->product_category_id = $product->category_id;
        $this->product_brand = $product->brand;
        $this->product_model = $product->model;
        $this->product_description = $product->description;
        $this->product_price = $product->price;
        $this->product_quantity_min = $product->quantity_min;
        $this->product_unit_type_id = $product->unit_type_id;
        $this->product_tax_condition_type_id = $product->tax_condition_type_id;
        $this->product_sale_price1 = $product->sale_price1;
        $this->product_profit_percentage1 = $product->profit_percentage1;
        $this->product_sale_price2 = $product->sale_price2;
        $this->product_profit_percentage2 = $product->profit_percentage2;
        $this->product_discount_max = $product->discount_max;
        
        $this->emit('setfocus', 'product_category_id');
        $this->updating = true;
        $this->openModal = true;
        
    }

    public function create(){
        $this->validate([
            //'product_barcode' => 'required',
            //'product_origin_code' => 'required',
            'product_category_id' => 'required',
            'product_brand' => 'required',
            'product_model' => 'required',
            'product_description' => 'required',
            'product_price' => 'required',
            'product_quantity_min' => 'required',
            'product_unit_type_id' => 'required',
            'product_tax_condition_type_id' => 'required',
            'product_sale_price1' => 'required',
            'product_profit_percentage1' => 'required',
            'product_sale_price2' => 'required',
            'product_profit_percentage2' => 'required',
            'product_discount_max' => 'required',
        ]);
        // barcode can be null
        if (empty($this->product_barcode)) {
            $this->product_barcode = null;
        }
        $product = new Product([
            'barcode' => $this->product_barcode,
            'origin_code' => $this->product_origin_code,
            'category_id' => $this->product_category_id,
            'brand' => $this->product_brand,
            'model' => $this->product_model,
            'description' => $this->product_description,
            'price' => $this->product_price,
            'quantity_min' => $this->product_quantity_min,
            'unit_type_id' => $this->product_unit_type_id,
            'tax_condition_type_id' => $this->product_tax_condition_type_id,
            'sale_price1' => $this->product_sale_price1,
            'profit_percentage1' => $this->product_profit_percentage1,
            'sale_price2' => $this->product_sale_price2,
            'profit_percentage2' => $this->product_profit_percentage2,
            'discount_max' => $this->product_discount_max
        ]);
        $product->save();

        $this->products=\App\Models\Product::all();
        $this->updating = false;
        $this->openModal = false;
        $this->render();
    }


    public function calcSalePrice($n)
    {
      switch ($n) {
        case 1:
          $this->product_sale_price1=$this->product_price+($this->product_price*$this->product_profit_percentage1/100);
          break;
        case 2:
          $this->product_sale_price2=$this->product_price+($this->product_price*$this->product_profit_percentage2/100);
          break;
        default:
          return 0;
        }
    }

    public function openInventory(Product $product)
    {
        $product=\App\Models\Product::find($product->id);
        $this->product_id = $product->id;
        $this->product_model=$product->model;

        $warehouse=\App\Models\Warehouse::find($this->warehouse_id) ?? \App\Models\Warehouse::first();
        $this->warehouse_id=$warehouse->id;
        $this->warehouse_name=$warehouse->name;

        $this->inventory_qty=\App\Models\Inventory::
            where('product_id',$product->id)->
            where('warehouse_id',$this->warehouse_id)->first()->quantity ?? 0;

        $this->add_qty = 0;
        $this->emit('setfocus', 'add_qty');
        $this->inventoryModal=true;
    }

    public function calcNewQuantity()
    {
        $this->validate([
            //check if the quantity is a number greater than 0
            'inventory_qty' => 'required|numeric|min:0',
        ]);
        $this->inventory_qty=$this->inventory_qty+$this->add_qty;
        $this->add_qty=0;
    }

    public function saveInventoryQty()
    {
        $this->validate([
            //check if the quantity is a number greater than 0
            'inventory_qty' => 'required|numeric|min:0',
        ]);
        $inventory=\App\Models\Inventory::
            where('product_id',$this->product_id)->
            where('warehouse_id',$this->warehouse_id)->first();
        if ($inventory) {
            $inventory->quantity=$this->inventory_qty;
            $inventory->save();
        } else {
            $inventory=new \App\Models\Inventory([
                'product_id' => $this->product_id,
                'warehouse_id' => $this->warehouse_id,
                'quantity' => $this->inventory_qty,
            ]);
            $inventory->save();
        }
        $this->inventoryModal=false;
    }
   
}
