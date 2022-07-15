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

    // relation with tax with tax_condition_type value
    public function tax()
    {
        return $this->hasOne(TaxConditionType::class, 'id', 'tax_condition_type_id');
    }
    // relation with unit type with
    public function unit()
    {
        return $this->hasOne(UnitType::class, 'id', 'unit_type_id');
    }

    // relation with category with category_id value
    public function category()
    {
        return $this->hasOne(Category::class, 'id', 'category_id');
    }
}
