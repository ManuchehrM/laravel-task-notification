<p align="center"><img src="https://res.cloudinary.com/dtfbvvkyp/image/upload/v1566331377/laravel-logolockup-cmyk-red.svg" width="400"></p>

<p align="center">
<a href="https://travis-ci.org/laravel/framework"><img src="https://travis-ci.org/laravel/framework.svg" alt="Build Status"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://poser.pugx.org/laravel/framework/d/total.svg" alt="Total Downloads"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://poser.pugx.org/laravel/framework/v/stable.svg" alt="Latest Stable Version"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://poser.pugx.org/laravel/framework/license.svg" alt="License"></a>
</p>

## About Project

This project is designed to notify users of purchases. 
Implemented on the Laravel framework

## Why Laravel?

Laravel is accessible, powerful, and provides tools required for large, robust applications.

## Used Components
- [Routing](https://laravel.com/docs/routing).
- [Migration](https://laravel.com/docs/7.x/migrations).
- [Seeding](https://laravel.com/docs/7.x/seeding).
- Console Commands.
- NEXMO - for sms send.
- Laravel class MAIL - for email send.
- AJAX - show logs in modal window.


REQUIREMENTS
------------

The minimum requirement by this project template that your Web server supports PHP > 7.0 and DB MySql.

INSTALLATION
------------

After cloning or download project run:

 ~~~
 composer install
 ~~~

## Database

Create Database by name:
 ~~~
 task_notification
 ~~~

For seeding your database with test data use seed classes:
All seed classes are stored in the database/seeds directory.


You can also use MySql dump file. Where located in the root folder (database.sql).

 ~~~
php artisan db:seed
 ~~~

Console Commands and PHP Scripts located in:

 ~~~
app/Console/Commands/SendEmail
app/Console/Commands/SendSms
 ~~~

For using this Console Commands run:
You can also use this command from WebSite with operator role.
 ~~~
php artisan email:send test@gmail.com text-or-operator-message
php artisan phone:send 992927001911 text-or-operator-message
 ~~~

Login (url: /login):

 ~~~
operator login: muzafarov@yandex.ru
operator password: operator123
 ~~~
