<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Voucher extends Model
{
    use HasFactory;

    protected $fillable = [
        'id',
        'data',
        'created_at',
        'updated_at',
    ];
    // mutator $data array to json to store in database
    public function setDataAttribute($value)
    {
        $this->attributes['data'] = json_encode($value);
    }
    // accessor to convert json to array
    public function getDataAttribute($value)
    {
        return json_decode($value, true);
    }
}
