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
            $table->smallInteger('doctype_id')->unsigned()->default(96);
            $table->string('name');
            $table->smallInteger('city_id')->unsigned()->nullable();
            $table->smallInteger('taxcondition_id')->unsigned()->nullable();
            $table->string('address')->nullable();
            $table->string('city');
            $table->string('phone')->nullable();
            $table->string('email')->unique();
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
