<?php

use Illuminate\Support\Facades\Route;
use App\Http\Livewire\ConfigComponent;
use App\Http\Controllers\pdfController;
use Illuminate\Support\Facades\Artisan;
use App\Http\Controllers\DashboardController;

Route::get('/', function () {
    // return view('welcome');
    return redirect('/login');
});
Route::get('/register', function () {
    return redirect('/login');
});

// logged only routes
Route::middleware(['auth:sanctum', 'verified'])->group(function () {

    Route::get('/clear', function () {
        $log = '';
        try {
            Artisan::call('cache:clear');
            $log = $log.'Cache...clear<br />';
        } catch (\Exception $e) {
            $log = $log.'Cache...ERROR<br />';
        }
        try {
            Artisan::call('config:clear');
            $log = $log.'Config...clear<br />';
        } catch (\Exception $e) {
            $log = $log.'Config...ERROR<br />';
        }
        try {
            Artisan::call('optimize:clear');
            $log = $log.'Optimize...clear<br />';
        } catch (\Exception $e) {
            $log = $log.'Optimize...ERROR<br />';
        }
        try {
            Artisan::call('optimize');
            $log = $log.'Optimized...< OK ><br />';
        } catch (\Exception $e) {
            $log = $log.'Optimized...ERROR<br />';
        }

        $log = $log.'<hr />EXTRAS<br />';
        try {
            Artisan::call('debugbar:clear');
            $log = $log.'DebugBar...clear<br />';
        } catch (\Exception $e) {
            $log = $log.'DebugBar...ERROR<br />';
        }

        try {
            Artisan::call('storage:link');
            $log = $log.'Storage Link...< OK ><br />';
        } catch (\Exception $e) {
            $log = $log.'Storage Link...ERROR<br />';
        }

        return $log;
    });
   
    Route::get('/dashboard', [DashboardController::class,'index'])->name('dashboard');
    Route::get('/configs', App\Http\Livewire\ConfigComponent::class)->name('configs');
    Route::get('/pdf/invoice', [pdfController::class,'invoice'])->name('pdf.invoice');
    Route::get('/pdf/qrcode', [pdfController::class,'qrcode'])->name('pdf.qrcode');
    Route::get('/pdf/htmlinvoice', [pdfController::class,'htmlinvoice'])->name('pdf.htmlinvoice');

    Route::get('/customers', App\Http\Livewire\Customers\Show::class)->name('customers');
    Route::get('/warehouses', App\Http\Livewire\Warehouses\Show::class)->name('warehouses');
    Route::get('/products', App\Http\Livewire\Products\Show::class)->name('products');
    Route::get('/invoices/{customer_id?}/{CbteTipo?}/{PtoVta?}', App\Http\Livewire\Invoice\Create::class)->name('invoices');
    // LaterFiles Route class
    Route::get('/laterfiles', App\Http\Livewire\LaterFiles::class)->name('laterfiles');
    
    // Inform to user that Printed Document is ready to download
    Route::get('/printed/{filename?}', function ($filename) { 
        return view('printDocument', compact('filename'));
    })->name('printed');

});