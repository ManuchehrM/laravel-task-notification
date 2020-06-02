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
            'phone' => '992927001911',
            'email' => 'admin@gmail.com',
            'password' => Hash::make('admin123'),
            'role' => 'admin'
        ]);
        DB::table('users')->insert([
            'phone' => '+992927001911',
            'email' => 'manu6699@mail.ru',
            'password' => Hash::make('user123'),
            'role' => 'user'
        ]);
        DB::table('users')->insert([
            'phone' => '992927001911',
            'email' => 'manu66992@mail.ru',
            'password' => Hash::make('user123'),
            'role' => 'user'
        ]);
        DB::table('users')->insert([
            'phone' => '992927001911',
            'email' => 'manu66991@mail.ru',
            'password' => Hash::make('user123'),
            'role' => 'user'
        ]);
        DB::table('users')->insert([
            'phone' => '992927001911',
            'email' => 'user3@gmail.com',
            'password' => Hash::make('user123'),
            'role' => 'user'
        ]);
        DB::table('users')->insert([
            'phone' => '992927001911',
            'email' => 'muzafarov@yandex.ru',
            'password' => Hash::make('operator123'),
            'role' => 'operator'
        ]);
    }
}
