<?php

namespace App\Http\Controllers;

use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;


class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        return view('home');
    }

    public function cabinet(){
        $orders = DB::table('order')
            ->select(DB::raw('order.user_id, group_concat(product.name) as products, sum(product.price) as price, users.email, users.phone'))
            ->leftJoin('product', 'order.product_id', '=', 'product.id')
            ->join('users', 'order.product_id', '=', 'users.id')
            ->where('order.status', '=', 0)
            ->groupBy('user_id')
            ->get();
        return view('cabinet', ['orders' => $orders]);
    }
}
