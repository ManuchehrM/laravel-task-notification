<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateNotificationsLogTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('notifications_log', function (Blueprint $table) {
            $table->id();
            $table->string('orders');
            $table->bigInteger('user_id')->unsigned()->nullable();
            $table->string('message');
            $table->text('status_description')->nullable();
            $table->tinyInteger('status')->default(1);
            $table->enum('notify_type', ['email', 'phone'])->default('email');
            $table->timestamps();
            $table->foreign('user_id')->references('id')->on('users');

        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('notifications_log');
    }
}
