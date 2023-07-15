<?php

namespace App\Http\Livewire;

use Livewire\Component;
use Illuminate\Support\Facades\Storage;

class ManageFiles extends Component
{
    public $files=[];

    public function mount(){
        //$this->files=Storage::disk('public')->directories("/invoices");
        $this->files=Storage::disk('public')->files('/invoices');
    }

    public function render()
    {
        return view('livewire.manage-files');
    }
}
