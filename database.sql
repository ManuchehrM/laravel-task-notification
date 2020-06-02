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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `notifications_log` */

insert  into `notifications_log`(`id`,`orders`,`user_id`,`message`,`status_description`,`status`,`notify_type`,`created_at`,`updated_at`) values 
(1,'[{\"name\":\"Samsung S5\",\"phone\":\"992917004471\",\"email\":\"manu6699@mail.ru\"},{\"name\":\"Samsung S10\",\"phone\":\"992917004471\",\"email\":\"manu6699@mail.ru\"},{\"name\":\"IPhone X\",\"phone\":\"992917004471\",\"em',2,'Thank you for your purchase!!!','success',1,'email','2020-06-02 18:35:27','2020-06-02 18:35:27');

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
(1,2,1,0,2,'2020-06-02 18:35:00',NULL),
(2,2,4,0,4,'2020-06-02 18:35:00',NULL),
(3,2,5,0,1,'2020-06-02 18:35:00',NULL),
(4,2,2,0,5,'2020-06-02 18:35:00',NULL),
(5,2,4,0,5,'2020-06-02 18:35:00',NULL),
(6,3,3,0,4,'2020-06-02 18:35:00',NULL),
(7,3,2,0,1,'2020-06-02 18:35:00',NULL),
(8,3,5,0,2,'2020-06-02 18:35:00',NULL),
(9,3,3,0,4,'2020-06-02 18:35:00',NULL),
(10,3,5,0,4,'2020-06-02 18:35:00',NULL),
(11,4,1,0,5,'2020-06-02 18:35:00',NULL),
(12,4,5,0,2,'2020-06-02 18:35:00',NULL),
(13,4,1,0,5,'2020-06-02 18:35:00',NULL),
(14,4,5,0,5,'2020-06-02 18:35:00',NULL),
(15,4,3,0,3,'2020-06-02 18:35:00',NULL),
(16,5,2,0,4,'2020-06-02 18:35:00',NULL),
(17,5,2,0,1,'2020-06-02 18:35:00',NULL),
(18,5,3,0,4,'2020-06-02 18:35:00',NULL),
(19,5,1,0,2,'2020-06-02 18:35:00',NULL),
(20,5,4,0,3,'2020-06-02 18:35:00',NULL);

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
(1,'Samsung S5','Telephone','800',1,'2020-06-02 18:35:00',NULL),
(2,'Samsung S6 Edge','Telephone','1200',1,'2020-06-02 18:35:00',NULL),
(3,'Samsung S7','Telephone','1500',1,'2020-06-02 18:35:00',NULL),
(4,'Samsung S10','Telephone','4500',1,'2020-06-02 18:35:00',NULL),
(5,'IPhone X','Telephone','7500',1,'2020-06-02 18:35:00',NULL);

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
(1,'992917004471','admin@gmail.com',NULL,'$2y$10$XdNZI9T/kNrLfrTEQ1NCVukdtb.rGSOAQzRFHimSM7p2Aks1vc9Ay','admin',NULL,NULL,NULL),
(2,'992917004471','manu6699@mail.ru',NULL,'$2y$10$2R6m2xMqWDTRb6cXpQmsTO1Vmk5fePLDgXG0H/1XTRfZWUtzREM8.','user',NULL,NULL,NULL),
(3,'992917004471','manu66992@mail.ru',NULL,'$2y$10$Dxhr8YRtOKu9MyAIUAvfn.rG.vG0oXGPcB6W0Qt6JL8dzQScjEvk6','user',NULL,NULL,NULL),
(4,'992917004471','manu66991@mail.ru',NULL,'$2y$10$O9RZSnBpihg51SBorUJ3d.vs8xBqZySoZddKQwoHI100Xx9cwXrL6','user',NULL,NULL,NULL),
(5,'992917004471','user3@gmail.com',NULL,'$2y$10$JA1woFm0A848rZvXSFfFOOnMchhChvD4LccmqlWXspSSEWbkWCEiS','user',NULL,NULL,NULL),
(6,'992927001911','muzafarov@yandex.ru',NULL,'$2y$10$oKm.arUY1r.Pyp3hGrHaK.CxIbee5W/y.RB.0DZr3LMSLjMLYKAgK','operator',NULL,NULL,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
