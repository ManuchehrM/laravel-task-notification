<?php

namespace App\Console\Commands;

use App\User;
use Illuminate\Console\Command;
use Illuminate\Support\Facades\App;

class SendSms extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'sms:send {phone} {text}';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Send sms to user';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return mixed
     */
    //7ITflO7NjhwZQUD9
    //021947d2
    public function handle()
    {
        $basic  = new \Nexmo\Client\Credentials\Basic('26d65fc0', 'aBsQz8E7n6qOpAP3');
        $client = new \Nexmo\Client($basic);
        $message = $client->message()->send([
            'to' => $this->argument('phone'),
            'from' => 'Test Task:)',
            'text' => $this->argument('text')
        ]);
    }
}
