<?php

namespace App\Http\Livewire;

use Livewire\Component;

class Reports extends Component
{
    public $voucher_types=[];
    public $CbteTipo;
    public $PtoVta=2;
    public $FchDesde;
    public $FchHasta;

    public function mount(){
        $this->voucher_types=\App\Models\VoucherType::where('enabled', true)
        ->get();
        $this->CbteTipo=$this->voucher_types->first()->id;
        // FchDesde = first day of month
        $this->FchDesde=date('Y-m-01');
        // FchHasta = last day of month
        $this->FchHasta=date('Y-m-t');
        }

    public function render()
    {
        return view('livewire.reports');
    }

}
