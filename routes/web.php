<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\pdfController;

Route::get('/', function () {
    // return view('welcome');
    return redirect('/login');
});
Route::get('/register', function () {
    return redirect('/login');
});

// logged only routes
Route::middleware(['auth:sanctum', 'verified'])->group(function () {
   
    Route::get('/dashboard', [DashboardController::class,'index'])->name('dashboard');
    Route::get('/pdf/invoice', [pdfController::class,'invoice'])->name('pdf.invoice');
    Route::get('/pdf/qrcode', [pdfController::class,'qrcode'])->name('pdf.qrcode');
    Route::get('/pdf/htmlinvoice', [pdfController::class,'htmlinvoice'])->name('pdf.htmlinvoice');

    Route::get('/customers', App\Http\Livewire\Customers\Show::class)->name('customers');
    Route::get('/warehouses', App\Http\Livewire\Warehouses\Show::class)->name('warehouses');
    Route::get('/products', App\Http\Livewire\Products\Show::class)->name('products');
    Route::get('/invoices/{customer_id?}/{CbteTipo?}/{PtoVta?}', App\Http\Livewire\Invoice\Create::class)->name('invoices');
    
    // Inform to user that Printed Document is ready to download
    Route::get('/printed/{filename?}', function ($filename) { 
        return view('printDocument', compact('filename'));
    })->name('printed');

});