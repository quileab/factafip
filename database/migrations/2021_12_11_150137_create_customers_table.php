<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCustomersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('customers', function (Blueprint $table) {
            $table->id();
            $table->foreignIdFor(App\Models\CustomerIdType::class)->constrained();
            $table->string('business_name', 100);
            $table->string('name', 100);
            $table->string('address')->nullable();
            $table->string('city',80)->nullable();
            $table->foreignIdFor(App\Models\ProvinceIdType::class)->constrained();
            $table->string('phone',40)->nullable();
            $table->string('email',127)->unique()->nullable();
            $table->string('CUIT',11)->nullable();
            $table->foreignIdFor(App\Models\ResponsibilityType::class)->constrained();
            
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
        Schema::dropIfExists('customers');
    }
}
