<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateSuppliersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('suppliers', function (Blueprint $table) {
            $table->id();
            $table->foreignIdFor(App\Models\CustomerIdType::class)->constrained();
            $table->string('name');
            $table->string('address')->nullable();
            $table->string('city',80)->nullable();
            $table->foreignIdFor(App\Models\ProvinceIdType::class)->constrained();
            $table->string('phone',40)->nullable();
            $table->string('email',127)->unique();
            $table->string('CUIT',11)->nullable();
            $table->foreignIdFor(App\Models\TaxConditionType::class)->constrained();
            
            //$table->foreign('id_type')->references('id')->on('customer_id_types');
            //$table->foreign('province_id')->references('id')->on('province_id_types');
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
        Schema::dropIfExists('suppliers');
    }
}
