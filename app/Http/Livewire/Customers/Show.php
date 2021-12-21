<?php

namespace App\Http\Livewire\Customers;

use Livewire\Component;

class Show extends Component
{
    // Livewire utilities
    public $search = '';
    public $openModal = false;
    public $readyToLoad = false;

    // Livewire properties
    public $customer;
    public $customers=[];
    public $customers_id_type_id=[];
    public $province_id_type_id=[];
    public $tax_condition_type_id=[];

    public function mount()
    {
        $this->customers=\App\Models\Customer::all();
        $this->customers_id_type_id=\App\Models\CustomerIdType::all();
        $this->province_id_type_id=\App\Models\ProvinceIdType::all();
        $this->tax_condition_type_id=\App\Models\TaxConditionType::all();
    }

    public function render()
    {
        return view('livewire.customers.show',[
            'customers'=>$this->customers,
            'customers_id_type_id'=>$this->customers_id_type_id,
            'province_id_type_id'=>$this->province_id_type_id,
            'tax_condition_type_id'=>$this->tax_condition_type_id,
        ]);
    }

    public function loadData()
    {
        $this->readyToLoad = true;
    }

    public function search()
    {
        $this->customers=\App\Models\Customer::where('name','like','%'.$this->search.'%')
            ->orWhere('business_name','like','%'.$this->search.'%')
            ->get();
    }   
}
