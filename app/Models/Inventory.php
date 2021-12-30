<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Inventory extends Model
{
    //use HasFactory;
    protected $primaryKey = null;
    public $incrementing = false;

    protected $fillable = ['warehouse_id','category_id','product_id','quantity','price'];
}
