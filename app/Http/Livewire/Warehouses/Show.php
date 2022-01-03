<?php

namespace App\Http\Livewire\Warehouses;

use App\Models\Warehouse;
use Livewire\Component;

class Show extends Component
{
    // Livewire utilities
    public $search = '';
    public $openModal = false;
    public $readyToLoad = false;
    public $updating = false;

    // Livewire properties
    public $warehouse;
    public $warehouses=[];
    // warehouse properties
    public $warehouse_id;
    public $warehouse_name;
    public $warehouse_location;
    public $warehouse_phone;
    public $warehouse_email;
    public $warehouse_contact_person;

    public function mount()
    {
        $this->warehouses=\App\Models\Warehouse::all();
    }
    
    public function render()
    {
        return view('livewire.warehouses.show',[
            'warehouses'=>$this->warehouses,
        ]);

    }

    public function loadData()
    {
        $this->readyToLoad = true;
    }

    public function UpdatingSearch($search)
    { 
        $this->search = $search;
        $this->warehouses=\App\Models\Warehouse::where('name','like','%'.$this->search.'%')
            ->orWhere('location','like','%'.$this->search.'%')
            ->get();
        $this->render();
    } 

    public function newWarehouse()
    {
        // reset properties
        $this->reset([
            'warehouse_name',
            'warehouse_location',
            'warehouse_phone',
            'warehouse_email',
            'warehouse_contact_person',
        ]);
        $this->openModal = true;
    }

    public function update(Warehouse $warehouse)
    {
        $this->validate([
            'warehouse_name' => 'required',
            'warehouse_location' => 'required',
            'warehouse_phone' => 'required',
            'warehouse_email' => 'required',
            'warehouse_contact_person' => 'required',
        ]);
        $warehouse=\App\Models\Warehouse::find($this->warehouse_id);
        $warehouse->name=$this->warehouse_name;
        $warehouse->location=$this->warehouse_location;
        $warehouse->phone=$this->warehouse_phone;
        $warehouse->email=$this->warehouse_email;
        $warehouse->contact_person=$this->warehouse_contact_person;
        $warehouse->save();

        $this->warehouses = \App\Models\Warehouse::all();
        $this->updating = false;
        $this->openModal = false;
        $this->render();
    }

    public function edit(Warehouse $warehouse){
        $this->warehouse=$warehouse;
        $this->warehouse_id=$warehouse->id;
        $this->warehouse_name=$warehouse->name;
        $this->warehouse_location=$warehouse->location;
        $this->warehouse_phone=$warehouse->phone;
        $this->warehouse_email=$warehouse->email;
        $this->warehouse_contact_person=$warehouse->contact_person;
        $this->updating=true;
        $this->openModal = true;
    }

    public function create()
    {
        $this->validate([
            'warehouse_name' => 'required',
            'warehouse_location' => 'required',
            'warehouse_phone' => 'required',
            'warehouse_email' => 'required',
            'warehouse_contact_person' => 'required',
        ]);

        $warehouse = new Warehouse;
        $warehouse->name = $this->warehouse_name;
        $warehouse->location = $this->warehouse_location;
        $warehouse->phone = $this->warehouse_phone;
        $warehouse->email = $this->warehouse_email;
        $warehouse->contact_person = $this->warehouse_contact_person;
        $warehouse->save();

        $this->warehouses=\App\Models\Warehouse::all();
        $this->updating = false;
        $this->openModal = false;
        $this->render();
    }

    public function delete(Warehouse $warehouse)
    {
        $warehouse->delete();
        $this->warehouses=\App\Models\Warehouse::all();
        $this->render();
    }

    public function setDefault(Warehouse $warehouse)
    {
        session(['warehouse_id'=>$warehouse->id]);
        session(['warehouse_name'=>$warehouse->name]);
        //$this->warehouses=\App\Models\Warehouse::all();
        $this->render();
    }

}
