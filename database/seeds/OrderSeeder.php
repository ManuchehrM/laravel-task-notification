<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class OrderSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $users = \App\User::where('role', 'user')->get();
        foreach ($users as $user):
        DB::table('order')->insert([
            'user_id' => $user->id,
            'product_id' => rand(1, 5),
            'quantity' => rand(1, 5),
            'status' => '0',
            'created_at' => date('Y-m-d H:i:s')
        ]);
        DB::table('order')->insert([
            'user_id' => $user->id,
            'product_id' => rand(1, 5),
            'quantity' => rand(1, 5),
            'status' => '0',
            'created_at' => date('Y-m-d H:i:s')
        ]);
        DB::table('order')->insert([
            'user_id' => $user->id,
            'product_id' => rand(1, 5),
            'quantity' => rand(1, 5),
            'status' => '0',
            'created_at' => date('Y-m-d H:i:s')
        ]);
        DB::table('order')->insert([
            'user_id' => $user->id,
            'product_id' => rand(1, 5),
            'quantity' => rand(1, 5),
            'status' => '0',
            'created_at' => date('Y-m-d H:i:s')
        ]);
        DB::table('order')->insert([
            'user_id' => $user->id,
            'product_id' => rand(1, 5),
            'quantity' => rand(1, 5),
            'status' => '0',
            'created_at' => date('Y-m-d H:i:s')
        ]);
        endforeach;
    }
}
