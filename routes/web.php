<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\DashboardController;  

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

// logged only routes
Route::middleware(['auth:sanctum', 'verified'])->group(function () {
   
    Route::get('/dashboard', [DashboardController::class,'index'])->name('dashboard');

    Route::get('/customers/show', App\Http\Livewire\Customers\Show::class)->name('customers');
    Route::get('/warehouses/show', App\Http\Livewire\Warehouses\Show::class)->name('warehouses');
    Route::get('/products/show', App\Http\Livewire\Products\Show::class)->name('products');
});