<?php

use Illuminate\Database\Seeder;

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('users')->insert([
            'phone' => '+992927001911',
            'email' => 'admin@gmail.com',
            'password' => Hash::make('admin123'),
            'role' => 'admin'
        ]);
        DB::table('users')->insert([
            'phone' => '+992927001911',
            'email' => 'user@gmail.com',
            'password' => Hash::make('user123'),
            'role' => 'user'
        ]);
        DB::table('users')->insert([
            'phone' => '+992927001911',
            'email' => 'user1@gmail.com',
            'password' => Hash::make('user123'),
            'role' => 'user'
        ]);
        DB::table('users')->insert([
            'phone' => '+992927001911',
            'email' => 'user2@gmail.com',
            'password' => Hash::make('user123'),
            'role' => 'user'
        ]);
        DB::table('users')->insert([
            'phone' => '+992927001911',
            'email' => 'user3@gmail.com',
            'password' => Hash::make('user123'),
            'role' => 'user'
        ]);
        DB::table('users')->insert([
            'phone' => '+992927001911',
            'email' => 'operator@gmail.com',
            'password' => Hash::make('operator123'),
            'role' => 'operator'
        ]);
    }
}
