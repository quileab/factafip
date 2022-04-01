<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        // definir el warehouse por defecto
        // if(!session()->has('warehouse_id')){
        //     $default_warehouse= \App\Models\Config::find('warehouse_id')->value ?? null;
        //     $default_warehouse_name= \App\Models\Warehouse::find($default_warehouse)->name ?? null;
        //     session(['warehouse_id'=>$default_warehouse ?? null]);
        //     session(['warehouse_name'=>$default_warehouse_name ?? null]);
        // }

    }
}
