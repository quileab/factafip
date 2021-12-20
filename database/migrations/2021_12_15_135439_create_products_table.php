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
            $table->string('barcode', 50)->unique()->nullable();
            $table->string('origin_code', 50)->nullable();
            $table->foreignIdFor(App\Models\Category::class)->constrained();;
            $table->string('brand', 30)->nullable();
            $table->string('model', 30)->nullable();
            $table->string('description', 50);
            $table->decimal('quantity',12,2)->default(0);
            $table->decimal('quantity_min',12,2)->default(0);
            $table->decimal('price',12,2)->default(0);
            $table->foreignIdFor(App\Models\TaxConditionType::class)->constrained();
            $table->foreignIdFor(App\Models\UnitType::class)->constrained();
            $table->decimal('sale_price1',12,2)->default(0);
            $table->decimal('profit_percentage1',12,2)->default(0);
            $table->decimal('sale_price2',12,2)->default(0);
            $table->decimal('profit_percentage2',12,2)->default(0);
            $table->decimal('discount_max',5,2)->default(0);
            
            //$table->foreign('category_id')->references('id')->on('categories');
            //$table->foreign('taxcondition_id')->references('id')->on('tax_condition_types');
            //$table->foreign('unit_id')->references('id')->on('unit_types');
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
