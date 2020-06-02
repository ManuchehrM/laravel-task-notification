<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class NotificationsLog extends Model
{
    protected $table = 'notifications_log';

    protected $attributes = [
        'status' => 1,
        'notify_type' => 'email',
    ];

    public function __construct($orders, $uid, $message, $status=1, $status_description, $notify_type='email')
    {
        $this->orders = $orders;
        $this->user_id = $uid;
        $this->message = $message;
        $this->status = $status;
        $this->status_description = $status_description;
        $this->notify_type = $notify_type;
    }

}
