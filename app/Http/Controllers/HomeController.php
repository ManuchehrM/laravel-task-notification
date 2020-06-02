<?php

namespace App\Http\Controllers;

use App\Mail\SendMail;
use App\NotificationsLog;
use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Artisan;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use mysql_xdevapi\Exception;
use function Psy\debug;

use Illuminate\Support\Facades\Mail;
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
            ->join('users', 'order.user_id', '=', 'users.id')
            ->where('order.status', '=', 0)
            ->groupBy('user_id')
            ->get();
        return view('cabinet', ['orders' => $orders]);
    }

    public function send(Request $request){

        $uid = $request->uid;
        $orders = DB::table('order')->select(DB::raw('product.name, users.phone, users.email'))
                ->leftJoin('product', 'order.product_id', '=', 'product.id')
                ->join('users', 'order.user_id', '=', 'users.id')
                ->where('order.status', '=', 0)->where('order.user_id', '=', $uid)
                ->get()->toArray();
        $orders_json = json_encode($orders);
        switch ($request->notify_type){
            case 'email':
                try {
                    Artisan::call('email:send', ['mail' => $orders[0]->email, 'text' => $request->message]);
                    $notify = new NotificationsLog($orders_json, $uid, $request->message, 1, 'success', 'email');
                    $notify->save();
                }catch (\Exception $e){
                    $notify = new NotificationsLog($orders_json, $uid, $request->message, 0, $e->getCode().' - '.$e->getMessage(), 'email');
                    $notify->save();
                }
                break;
            case 'phone':
                try {
                    Artisan::call('sms:send', ['phone' => $orders[0]->phone, 'text' => $request->message]);
                    $notify = new NotificationsLog($orders_json, $uid, $request->message, 1, 'success', 'phone');
                    $notify->save();
                }catch (\Exception $e){
                    $notify = new NotificationsLog($orders_json, $uid, $request->message, 0, $e->getCode().' - '.$e->getMessage(), 'phone');
                    $notify->save();
                }
                break;
            default:
                try {
                    Artisan::call('email:send', ['mail' => $orders[0]->email, 'text' => $request->message]);
                    $notify = new NotificationsLog($orders_json, $uid, $request->message, 1, 'success', 'email');
                    $notify->save();
                }catch (\Exception $e){
                    $notify = new NotificationsLog($orders_json, $uid, $request->message, 0, $e->getCode().' - '.$e->getMessage(), 'email');
                    $notify->save();
                }
                break;
        }


        return redirect('/cabinet');
    }


    public function getnotifylogs($uid){
        $logs = DB::table('notifications_log')
            ->select(DB::raw('*'))->where('user_id', '=', $uid)
            ->get()->toArray();
        return response()->json(['logs' => $logs, 'status' => 'success']);
    }
}
