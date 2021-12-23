<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    use HasFactory;

    protected $fillable = [
        'barcode',
        'origin_code',
        'category_id',
        'brand',
        'model',
        'description',
        'price',
        'quantity_min',
        'unit_type_id',
        'tax_condition_type_id',
        'sale_price1',
        'profit_percentage1',
        'sale_price2',
        'profit_percentage2',
        'discount_max',
    ];
}
