<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        // \App\Models\User::factory(10)->create();
        \App\Models\User::truncate();
        \App\Models\User::create([
            'name'=>'admin',
            'email'=>'admin@admin.com',
            'password'=>Hash::make('Sadmin12345'),
        ]);

        \App\Models\Warehouse::create([
            'name'=>'Main',
            'location'=>'This is the main warehouse',
            'phone'=>'+254712345678',
            'email'=>'this@email.com',
            'contact_person'=>'Admin',
        ]);

        \App\Models\Category::create([
            'name'=>'General',
        ]);
        \App\Models\Category::create([
            'name'=>'Almacen',
        ]);

        \App\Models\Config::create([
            'id'=>'warehouse_id',
            'value'=>'1',
            'type'=>'int',
            'description'=>'Default warehouse',
        ]);
        \App\Models\Config::create([
            'id'=>'default_category',
            'value'=>'1',
            'type'=>'int',
            'description'=>'Default category',
        ]);

    }
}
