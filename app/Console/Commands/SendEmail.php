<?php

namespace App\Console\Commands;

use App\Mail\SendMail;
use App\User;
use Illuminate\Console\Command;
use Illuminate\Support\Facades\Mail;

class SendEmail extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'email:send {mail} {text}';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Send Email to user';

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
    public function handle()
    {
        $objDemo = new \stdClass();
        $objDemo->demo_one = 'TEST TASK ONE';
        $objDemo->demo_two = 'TEST TASK TWO';
        $objDemo->sender = 'muzafarov7001911@yandex.ru';
        $objDemo->receiver = $this->argument('mail');
        $letter = new SendMail($objDemo);
        $letter->operatorMessage = $this->argument('text');
        Mail::to($this->argument('mail'))->send($letter);
    }
}
