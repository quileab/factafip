<?php

namespace App\Http\Livewire\Customers;

use App\Models\Customer;
use Livewire\Component;

class Show extends Component
{
    // Livewire utilities
    public $search = '';
    public $openModal = false;
    public $readyToLoad = false;
    public $updating = false;

    // Livewire properties
    public $customer;
    public $customers=[];
    // customer properties
    public $customers_id_type_id=[];
    public $province_id_type_id=[];
    public $responsibility_types_id=[];
    
    public $customer_id;
    public $customer_id_type=96;
    public $customer_name;
    public $customer_business_name;
    public $customer_address;
    public $customer_city;
    public $customer_province_id=12;
    public $customer_phone;
    public $customer_email;
    public $customer_responsibility_type_id=5;
    public $customer_CUIT;

    public function mount()
    {
        $this->customers=\App\Models\Customer::limit(20)->get();
        $this->customers_id_type_id=\App\Models\CustomerIdType::orderBy('id','desc')->get();
        $this->province_id_type_id=\App\Models\ProvinceIdType::all();
        $this->responsibility_types_id=\App\Models\ResponsibilityType::all();
    }

    public function render()
    {
        return view('livewire.customers.show',[
            'customers'=>$this->customers,
            'customers_id_type_id'=>$this->customers_id_type_id,
            'province_id_type_id'=>$this->province_id_type_id,
            'responsibility_types_id'=>$this->responsibility_types_id,
        ]);
    }

    public function loadData()
    {
        $this->readyToLoad = true;
    }

    public function UpdatingSearch($search)
    {
        $this->search = $search;

        $searchValues = preg_split('/\s+/', $this->search, -1, PREG_SPLIT_NO_EMPTY);
        $this->customers=\App\Models\Customer::where(function($query) use ($searchValues){
            foreach ($searchValues as $srch) {
                $query->whereRaw(\Illuminate\Support\Facades\DB::raw('CONCAT(business_name,name) LIKE "%'.$srch.'%"'));
            }
        })->get();
        //->orderBy($this->sort,$this->direction)->paginate($this->cant);
        $this->render();
    } 
    
    public function newCustomerModalShow()
    {
        $this->reset([
            "customer_id",
            "customer_id_type",
            "customer_name",
            "customer_business_name",
            "customer_address",
            "customer_city",
            "customer_province_id",
            "customer_phone",
            "customer_email",
            "customer_responsibility_type_id",
            "customer_CUIT" 
        ]);
        $this->updating = false;
        $this->openModal = true;
    }
    
    public function delete(Customer $customer){
        $customer->delete();
        $this->customers=\App\Models\Customer::all();
        $this->render();
    }

    public function edit(Customer $customer){
        //dd($customer);
        $this->customer=$customer;
        $this->customer_id=$customer->id;
        $this->customer_id_type=$customer->customer_id_type_id;
        $this->customer_name=$customer->name;
        $this->customer_business_name=$customer->business_name;
        $this->customer_address=$customer->address;
        $this->customer_city=$customer->city;
        $this->customer_province_id=$customer->province_id_type_id;
        $this->customer_phone=$customer->phone;
        $this->customer_email=$customer->email;
        $this->customer_responsibility_type_id=$customer->responsibility_type_id;
        $this->customer_CUIT=$customer->CUIT;
        $this->updating=true;
        $this->openModal=true;
    }

    public function update()
    {
        $this->validate([
            'customer_id' => 'required',
            'customer_name' => 'required',
            'customer_business_name' => 'required',
            'customer_address' => 'required',
            'customer_city' => 'required',
            'customer_province_id' => 'required',
            'customer_phone' => 'required',
            'customer_email' => 'required',
            'customer_responsibility_type_id' => 'required',
            'customer_CUIT' => 'required',
        ]);

        if ((integer)$this->customer->id != (integer)$this->customer_id)
        {
            $customer_exists = Customer::find($this->customer_id);
            if ($customer_exists)
            {
                $this->emit('toast','El nuevo ID se encuentra OCUPADO','warning');
                return;
            }
        }
        $this->customer->id= (integer)$this->customer_id;
        $this->customer->customer_id_type_id=$this->customer_id_type;
        $this->customer->name=$this->customer_name;
        $this->customer->business_name=$this->customer_business_name;
        $this->customer->address=$this->customer_address;
        $this->customer->city=$this->customer_city;
        $this->customer->province_id_type_id=$this->customer_province_id;
        $this->customer->phone=$this->customer_phone;
        $this->customer->email=$this->customer_email;
        $this->customer->responsibility_type_id=$this->customer_responsibility_type_id;
        $this->customer->CUIT=$this->customer_CUIT;
        $this->customer->save();
        $this->customers=\App\Models\Customer::limit(20)->get();
        $this->render();
        $this->openModal=false;
    }
    
    public function create(){
        $this->validate([
            'customer_id' => 'required',
            'customer_id_type' => 'required',
            'customer_name' => 'required',
            //'customer_business_name' => 'required',
            'customer_address' => 'required',
            'customer_city' => 'required',
            'customer_province_id' => 'required',
            'customer_phone' => 'required',
            'customer_email' => 'required',
            'customer_responsibility_type_id' => 'required',
            'customer_CUIT' => 'required',
        ]);

        $customer = new Customer();
        $customer->id=$this->customer_id;
        $customer->customer_id_type_id=$this->customer_id_type;
        $customer->name=$this->customer_name;
        $customer->business_name=$this->customer_business_name;
        $customer->address=$this->customer_address;
        $customer->city=$this->customer_city;
        $customer->province_id_type_id=$this->customer_province_id;
        $customer->phone=$this->customer_phone;
        $customer->email=$this->customer_email;
        $customer->responsibility_type_id=$this->customer_responsibility_type_id;
        $customer->CUIT=$this->customer_CUIT;
        $customer->save();
        $this->customers=\App\Models\Customer::all();
        $this->render();
        $this->openModal=false;
    }

    public function invoice($customer_id){
        return redirect()->route('invoices',['customer_id'=>$customer_id]);
    }

}
