<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class DashboardController extends Controller
{
    public function index()
    {
        /* Pasé a AppServiceProvider */

        // verifico que existan las sessiones de warehouse y customer
        // if(!session()->has('default_warehouse')){
        //     $default_warehouse= \App\Models\Config::find('default_warehouse')->value ?? null;
        //     $default_warehouse_name= \App\Models\Warehouse::find($default_warehouse)->name ?? null;
        //     session(['default_warehouse'=>$default_warehouse ?? null]);
        //     session(['default_warehouse_name'=>$default_warehouse_name ?? null]);
        // }
        return view('dashboard');
    }
}
