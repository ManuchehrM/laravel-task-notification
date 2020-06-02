<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;

class ProductSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('product')->insert([
            'name' => 'Samsung S5',
            'category_id' => 'Telephone',
            'price' => '800',
            'created_at' => date('Y-m-d H:i:s')
        ]);
        DB::table('product')->insert([
            'name' => 'Samsung S6 Edge',
            'category_id' => 'Telephone',
            'price' => '1200',
            'created_at' => date('Y-m-d H:i:s')
        ]);
        DB::table('product')->insert([
            'name' => 'Samsung S7',
            'category_id' => 'Telephone',
            'price' => '1500',
            'created_at' => date('Y-m-d H:i:s')
        ]);
        DB::table('product')->insert([
            'name' => 'Samsung S10',
            'category_id' => 'Telephone',
            'price' => '4500',
            'created_at' => date('Y-m-d H:i:s')
        ]);
        DB::table('product')->insert([
            'name' => 'IPhone X',
            'category_id' => 'Telephone',
            'price' => '7500',
            'created_at' => date('Y-m-d H:i:s')
        ]);
    }
}
