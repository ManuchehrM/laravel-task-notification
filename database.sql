/*
SQLyog Ultimate v12.14 (64 bit)
MySQL - 10.0.38-MariaDB : Database - task_notification
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`task_notification` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `task_notification`;

/*Table structure for table `failed_jobs` */

DROP TABLE IF EXISTS `failed_jobs`;

CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `failed_jobs` */

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`migration`,`batch`) values 
(1,'2014_10_12_000000_create_users_table',1),
(2,'2014_10_12_100000_create_password_resets_table',1),
(3,'2019_08_19_000000_create_failed_jobs_table',1),
(4,'2020_06_02_044104_create_notifications_log_table',1),
(5,'2020_06_02_044106_create_product_table',1),
(6,'2020_06_02_044127_create_order_table',1);

/*Table structure for table `notifications_log` */

DROP TABLE IF EXISTS `notifications_log`;

CREATE TABLE `notifications_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `orders` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `message` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_description` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `notify_type` enum('email','phone') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'email',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_log_user_id_foreign` (`user_id`),
  CONSTRAINT `notifications_log_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `notifications_log` */

insert  into `notifications_log`(`id`,`orders`,`user_id`,`message`,`status_description`,`status`,`notify_type`,`created_at`,`updated_at`) values 
(1,'[{\"name\":\"Samsung S6 Edge\",\"phone\":\"992927001911\",\"email\":\"muzafarov9797@gmail.com\"},{\"name\":\"Samsung S5\",\"phone\":\"992927001911\",\"email\":\"muzafarov9797@gmail.com\"},{\"name\":\"IPhone X\",\"phone\":',2,'Thank you for your purchase!!!','success',1,'email','2020-06-02 13:32:54','2020-06-02 13:32:54'),
(2,'[{\"name\":\"Samsung S6 Edge\",\"phone\":\"992927001911\",\"email\":\"muzafarov9797@gmail.com\"},{\"name\":\"Samsung S5\",\"phone\":\"992927001911\",\"email\":\"muzafarov9797@gmail.com\"},{\"name\":\"IPhone X\",\"phone\":',2,'Thank you for your purchase!!!','success',1,'email','2020-06-02 13:37:41','2020-06-02 13:37:41'),
(3,'[{\"name\":\"Samsung S6 Edge\",\"phone\":\"992927001911\",\"email\":\"muzafarov9797@gmail.com\"},{\"name\":\"Samsung S5\",\"phone\":\"992927001911\",\"email\":\"muzafarov9797@gmail.com\"},{\"name\":\"IPhone X\",\"phone\":',2,'Thank you for your purchase!!!','554 - Expected response code 250 but got code \"554\", with message \"554 5.7.1 [2] Message rejected under suspicion of SPAM; https://ya.cc/1IrBc 1591105070-ioOx63ynHU-bo2C7bnQ\r\n\"',0,'email','2020-06-02 13:37:50','2020-06-02 13:37:50'),
(4,'[{\"name\":\"Samsung S6 Edge\",\"phone\":\"992927001911\",\"email\":\"muzafarov9797@gmail.com\"},{\"name\":\"Samsung S5\",\"phone\":\"992927001911\",\"email\":\"muzafarov9797@gmail.com\"},{\"name\":\"IPhone X\",\"phone\":',2,'Thank you for your purchase!!!','success',1,'email','2020-06-02 13:39:30','2020-06-02 13:39:30'),
(5,'[{\"name\":\"Samsung S6 Edge\",\"phone\":\"992927001911\",\"email\":\"muzafarov9797@gmail.com\"},{\"name\":\"Samsung S5\",\"phone\":\"992927001911\",\"email\":\"muzafarov9797@gmail.com\"},{\"name\":\"IPhone X\",\"phone\":',2,'Thank you for your purchase!!!','success',1,'email','2020-06-02 14:31:15','2020-06-02 14:31:15'),
(6,'[{\"name\":\"Samsung S6 Edge\",\"phone\":\"992927001911\",\"email\":\"muzafarov9797@gmail.com\"},{\"name\":\"Samsung S5\",\"phone\":\"992927001911\",\"email\":\"muzafarov9797@gmail.com\"},{\"name\":\"IPhone X\",\"phone\":',2,'Thank you for your purchase!!!','success',1,'phone','2020-06-02 14:32:06','2020-06-02 14:32:06'),
(7,'[{\"name\":\"IPhone X\",\"phone\":\"992927001911\",\"email\":\"user1@gmail.com\"},{\"name\":\"IPhone X\",\"phone\":\"992927001911\",\"email\":\"user1@gmail.com\"},{\"name\":\"Samsung S5\",\"phone\":\"992927001911\",\"email\":',3,'Thank you for your purchase!!!','554 - Expected response code 250 but got code \"554\", with message \"554 5.7.1 [2] Message rejected under suspicion of SPAM; https://ya.cc/1IrBc 1591108974-m4wXB3QkuZ-gskWV1KL\r\n\"',0,'email','2020-06-02 14:42:54','2020-06-02 14:42:54');

/*Table structure for table `order` */

DROP TABLE IF EXISTS `order`;

CREATE TABLE `order` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `product_id` bigint(20) unsigned DEFAULT NULL,
  `status` tinyint(4) DEFAULT '0',
  `quantity` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_user_id_foreign` (`user_id`),
  KEY `order_product_id_foreign` (`product_id`),
  CONSTRAINT `order_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `order_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `order` */

insert  into `order`(`id`,`user_id`,`product_id`,`status`,`quantity`,`created_at`,`updated_at`) values 
(1,2,2,0,3,'2020-06-02 07:30:56',NULL),
(2,2,1,0,1,'2020-06-02 07:30:56',NULL),
(3,2,5,0,4,'2020-06-02 07:30:56',NULL),
(4,2,3,0,3,'2020-06-02 07:30:56',NULL),
(5,2,5,0,5,'2020-06-02 07:30:56',NULL),
(6,3,5,0,4,'2020-06-02 07:30:56',NULL),
(7,3,5,0,1,'2020-06-02 07:30:56',NULL),
(8,3,1,0,1,'2020-06-02 07:30:56',NULL),
(9,3,1,0,5,'2020-06-02 07:30:56',NULL),
(10,3,2,0,1,'2020-06-02 07:30:56',NULL),
(11,4,3,0,1,'2020-06-02 07:30:56',NULL),
(12,4,1,0,5,'2020-06-02 07:30:56',NULL),
(13,4,4,0,5,'2020-06-02 07:30:56',NULL),
(14,4,4,0,2,'2020-06-02 07:30:56',NULL),
(15,4,2,0,2,'2020-06-02 07:30:56',NULL),
(16,5,4,0,3,'2020-06-02 07:30:56',NULL),
(17,5,5,0,5,'2020-06-02 07:30:56',NULL),
(18,5,5,0,2,'2020-06-02 07:30:56',NULL),
(19,5,4,0,1,'2020-06-02 07:30:56',NULL),
(20,5,2,0,2,'2020-06-02 07:30:56',NULL);

/*Table structure for table `password_resets` */

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `password_resets` */

/*Table structure for table `product` */

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `product` */

insert  into `product`(`id`,`name`,`category_id`,`price`,`status`,`created_at`,`updated_at`) values 
(1,'Samsung S5','Telephone','800',1,'2020-06-02 07:30:56',NULL),
(2,'Samsung S6 Edge','Telephone','1200',1,'2020-06-02 07:30:56',NULL),
(3,'Samsung S7','Telephone','1500',1,'2020-06-02 07:30:56',NULL),
(4,'Samsung S10','Telephone','4500',1,'2020-06-02 07:30:56',NULL),
(5,'IPhone X','Telephone','7500',1,'2020-06-02 07:30:56',NULL);

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('user','operator','admin') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`phone`,`email`,`email_verified_at`,`password`,`role`,`remember_token`,`created_at`,`updated_at`) values 
(1,'992927001911','admin@gmail.com',NULL,'$2y$10$GVmbXkRE4jcZjav3VBjxCeup6GOHGUUe7FQXlkZwguQ0XQ9vl/7Yq','admin',NULL,NULL,NULL),
(2,'992927001911','muzafarov9797@gmail.com',NULL,'$2y$10$N06.hEMaOf9VCO0gMCa5VuY/F1x.x/U.b3Y9y7NVsaxE9u0R9fQpe','user',NULL,NULL,NULL),
(3,'992927001911','user1@gmail.com',NULL,'$2y$10$YkBdtWhpU/AsJNfiHo22R.dw5SKXXpPZaSX0IdKd8/1FKrYzuUwlO','user',NULL,NULL,NULL),
(4,'992927001911','user2@gmail.com',NULL,'$2y$10$Ic1vo7RiuLgmxTwmeSc34e1dM7NvpmmN1.olvsw.pa/NaYIBgdFDa','user',NULL,NULL,NULL),
(5,'992927001911','user3@gmail.com',NULL,'$2y$10$OLs1AnOHe6OU29QXRL4ZHeNPV.qWRXiFK1IN48.92SxdHrig0LJti','user',NULL,NULL,NULL),
(6,'992927001911','muzafarov@yandex.ru',NULL,'$2y$10$8RkkBGV/KWp7qakp0rQ0SuTcr2R79.JXBD7v8QI4DboYVNMLbnImO','operator',NULL,NULL,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
