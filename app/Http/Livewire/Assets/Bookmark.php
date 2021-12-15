<?php

namespace App\Http\Livewire\Assets;

use Livewire\Component;
use App\Models\User;

class Bookmark extends Component
{
    public $bkmk;

    // Listener para los EMIT - Conexión entre PHP-JS
    protected $listeners=['setBookmark','removeBookmark']; 

    public function render()
    {
        $bkmk=$this->bkmk;

        //check if session bookmark exists and set it to $boormarked
        if (session()->has('bookmark')) {
            //$this->bookmark=session()->get('bookmark');
            $bookmarked=User::where('id',session('bookmark'))->first();
            //dd($bookmarked);
        }else{
            $bookmarked=[];
        }
        return view('livewire.assets.bookmark',compact('bookmarked'));
    }

    public function setBookmark($id){
        session(['bookmark'=>$id]);
        $this->bkmk=$id;
        //$this->emit('toast',' Registro eliminado','error');
    }
    public function removeBookmark(){
        session()->forget('bookmark');
        $this->bkmk=null;
        $this->emit('bookmarkCleared');
    }
}
