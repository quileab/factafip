<?php

namespace App\Http\Livewire;

use Livewire\Component;

class ConfigComponent extends Component
{
    public $uid;
    public $group;
    public $description;
    public $value;
    public $type;
    public $formAction = 'store';
    public $updateForm = false;

    public function render(){
        $configs = \App\Models\Configs::orderBy('description','ASC')->get();
        //dd($configs);
        return view('livewire.config-component', compact('configs'));
    }

    public function saveChange(){
        $config = \App\Models\Configs::find($this->uid);
        $config->value = $this->value;
        $config->type = $this->type;

        $config->save();
        $this->updateForm = false;
    }

    public function showModalForm(\App\Models\Configs $config){
        $this->uid = $config->id;
        $this->description = $config->description;
        $this->value = $config->value;
        $this->type = $config->type;
        $this->updateForm = true;
    }

}
