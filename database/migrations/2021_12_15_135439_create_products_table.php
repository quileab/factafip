<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProductsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('products', function (Blueprint $table) {
            $table->id();
            $table->string('bar_code', 50)->unique()->nullable();
            $table->string('origin_code', 50)->nullable();
            $table->unsignedBigInteger('category');
            $table->string('brand', 30)->nullable();
            $table->string('model', 30)->nullable();
            $table->string('description', 50);
            $table->decimal('quantity',12,2)->default(0);
            $table->decimal('quantity_min',12,2)->default(0);
            $table->decimal('price',12,2)->default(0);
            $table->unsignedBigInteger('taxcondition_id');
            $table->unsignedBigInteger('unit_id');
            $table->decimal('sale_price1',12,2)->default(0);
            $table->decimal('profit_percentage1',12,2)->default(0);
            $table->decimal('sale_price2',12,2)->default(0);
            $table->decimal('profit_percentage2',12,2)->default(0);
            $table->decimal('discount_max',5,2)->default(0);
            
            $table->foreign('category')->references('id')->on('categories');
            $table->foreign('taxcondition_id')->references('id')->on('tax_condition_types');
            $table->foreign('unit_id')->references('id')->on('unit_types');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('products');
    }
}
