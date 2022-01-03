<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class DashboardController extends Controller
{
    public function index()
    {
        /* Pasé a AppServiceProvider */

        // verifico que existan las sessiones de warehouse y customer
        // if(!session()->has('warehouse_id')){
        //     $default_warehouse= \App\Models\Config::find('warehouse_id')->value ?? null;
        //     $default_warehouse_name= \App\Models\Warehouse::find($default_warehouse)->name ?? null;
        //     session(['warehouse_id'=>$default_warehouse ?? null]);
        //     session(['warehouse_name'=>$default_warehouse_name ?? null]);
        // }
        return view('dashboard');
    }
}
