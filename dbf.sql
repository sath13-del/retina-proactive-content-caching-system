/*
SQLyog Community Edition- MySQL GUI v7.15 
MySQL - 5.5.29 : Database - collaborative
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`collaborative` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `collaborative`;

/*Table structure for table `cloud` */

DROP TABLE IF EXISTS `cloud`;

CREATE TABLE `cloud` (
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cloud` */

insert  into `cloud`(`username`,`password`) values ('cloud','cloud');

/*Table structure for table `cloud_files` */

DROP TABLE IF EXISTS `cloud_files`;

CREATE TABLE `cloud_files` (
  `filename` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `data` text,
  `cipher` text,
  `skey` varchar(100) DEFAULT NULL,
  `tm` text,
  PRIMARY KEY (`filename`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cloud_files` */

insert  into `cloud_files`(`filename`,`email`,`data`,`cipher`,`skey`,`tm`) values ('exec','abc@gmail.com','hi hello\r\nadsfghjkl','OceNX5aVEBZbQerHF3AcN/n2TafXtnToqiWJUgmDvRM=','WVo30TdnvrKGSBBsX2HdEA==','24/12/2024   10:03:40'),('new','myra@gmail.com','check this data\r\nhello\r\nexternal','Xpr0QvJrsprr5naJe6vHBmbsPGIYPES712RBhl3t8hA=','TSinbyUOikOcq9Ki6K3ePw==','24/12/2024   08:45:50'),('samm','abc@gmail.com','check this data\r\nhello\r\nexternal','V8PFyxVD89nR+bEVhosFPYL42WsuQBMh2V8IDn+nSEY=','t62WtiSbYkqr4Plah+SyVg==','24/12/2024   09:52:54');

/*Table structure for table `dt` */

DROP TABLE IF EXISTS `dt`;

CREATE TABLE `dt` (
  `dt` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `dt` */

insert  into `dt`(`dt`,`name`) values (1,'1'),(2,'2');

/*Table structure for table `edgeserver` */

DROP TABLE IF EXISTS `edgeserver`;

CREATE TABLE `edgeserver` (
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `edgeserver` */

insert  into `edgeserver`(`username`,`password`) values ('edge','edge');

/*Table structure for table `edgeserver_files` */

DROP TABLE IF EXISTS `edgeserver_files`;

CREATE TABLE `edgeserver_files` (
  `filename` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `data` text,
  `cipher` text,
  `skey` varchar(100) DEFAULT NULL,
  `tm` text,
  PRIMARY KEY (`filename`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `edgeserver_files` */

insert  into `edgeserver_files`(`filename`,`email`,`data`,`cipher`,`skey`,`tm`) values ('exec','abc@gmail.com','hi hello\r\nadsfghjkl','OceNX5aVEBZbQerHF3AcN/n2TafXtnToqiWJUgmDvRM=','WVo30TdnvrKGSBBsX2HdEA==','24/12/2024   10:03:01'),('new','myra@gmail.com','check this data\r\nhello\r\nexternal','Xpr0QvJrsprr5naJe6vHBmbsPGIYPES712RBhl3t8hA=','TSinbyUOikOcq9Ki6K3ePw==','24/12/2024   08:45:32'),('samm','abc@gmail.com','check this data\r\nhello\r\nexternal','V8PFyxVD89nR+bEVhosFPYL42WsuQBMh2V8IDn+nSEY=','t62WtiSbYkqr4Plah+SyVg==','24/12/2024   09:52:12');

/*Table structure for table `manager` */

DROP TABLE IF EXISTS `manager`;

CREATE TABLE `manager` (
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `manager` */

insert  into `manager`(`username`,`password`) values ('manager','manager');

/*Table structure for table `md_files` */

DROP TABLE IF EXISTS `md_files`;

CREATE TABLE `md_files` (
  `filename` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `md` varchar(100) DEFAULT NULL,
  `data` text,
  `cipher` text,
  `skey` varchar(100) DEFAULT NULL,
  `tm` text,
  PRIMARY KEY (`filename`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `md_files` */

insert  into `md_files`(`filename`,`email`,`md`,`data`,`cipher`,`skey`,`tm`) values ('exec','abc@gmail.com','sk','hi hello\r\nadsfghjkl','OceNX5aVEBZbQerHF3AcN/n2TafXtnToqiWJUgmDvRM=','WVo30TdnvrKGSBBsX2HdEA==','24/12/2024   10:04:54'),('new','myra@gmail.com','sk','check this data\r\nhello\r\nexternal','Xpr0QvJrsprr5naJe6vHBmbsPGIYPES712RBhl3t8hA=','TSinbyUOikOcq9Ki6K3ePw==','24/12/2024   08:46:41'),('samm','abc@gmail.com','sk','check this data\r\nhello\r\nexternal','V8PFyxVD89nR+bEVhosFPYL42WsuQBMh2V8IDn+nSEY=','t62WtiSbYkqr4Plah+SyVg==','24/12/2024   09:53:44');

/*Table structure for table `mobiledestination` */

DROP TABLE IF EXISTS `mobiledestination`;

CREATE TABLE `mobiledestination` (
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `gender` varchar(100) DEFAULT NULL,
  `address` text,
  `mobile` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `mobiledestination` */

insert  into `mobiledestination`(`username`,`password`,`email`,`gender`,`address`,`mobile`) values ('sk','shiva','shivakrish573@gmail.com','MALE','hyd','9099990909');

/*Table structure for table `mobilesource` */

DROP TABLE IF EXISTS `mobilesource`;

CREATE TABLE `mobilesource` (
  `username` varchar(100) NOT NULL,
  `password` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `gender` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `mobile` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `mobilesource` */

insert  into `mobilesource`(`username`,`password`,`email`,`gender`,`address`,`mobile`,`status`,`image`) values ('Abc','anc','abc@gmail.com','MALE','Gnits, Hyd','9999988888','dd.txt','status'),('shiva','shiva','myra@gmail.com','MALE','malaysian township, KPHB\r\nnear D-Mart','7702177291','new2.jpg','status');

/*Table structure for table `request` */

DROP TABLE IF EXISTS `request`;

CREATE TABLE `request` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `filename` varchar(100) DEFAULT NULL,
  `ms` varchar(100) DEFAULT NULL,
  `data` longtext,
  `cipher` longtext,
  `skey` varchar(100) DEFAULT NULL,
  `md` varchar(100) DEFAULT NULL,
  `dt` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `stk` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

/*Data for the table `request` */

insert  into `request`(`id`,`filename`,`ms`,`data`,`cipher`,`skey`,`md`,`dt`,`status`,`stk`) values (13,'new','myra@gmail.com','check this data\r\nhello\r\nexternal','Xpr0QvJrsprr5naJe6vHBmbsPGIYPES712RBhl3t8hA=','TSinbyUOikOcq9Ki6K3ePw==','sk','24','sent','Edge'),(14,'new','myra@gmail.com','check this data\r\nhello\r\nexternal','Xpr0QvJrsprr5naJe6vHBmbsPGIYPES712RBhl3t8hA=','TSinbyUOikOcq9Ki6K3ePw==','sk','24','waiting','Edge'),(15,'exec','abc@gmail.com','hi hello\r\nadsfghjkl','OceNX5aVEBZbQerHF3AcN/n2TafXtnToqiWJUgmDvRM=','WVo30TdnvrKGSBBsX2HdEA==','sk','24','waiting','Edge'),(16,'exec','abc@gmail.com','hi hello\r\nadsfghjkl','OceNX5aVEBZbQerHF3AcN/n2TafXtnToqiWJUgmDvRM=','WVo30TdnvrKGSBBsX2HdEA==','sk','24','waiting','Edge');

/*Table structure for table `upload` */

DROP TABLE IF EXISTS `upload`;

CREATE TABLE `upload` (
  `file` longtext,
  `filename` varchar(100) NOT NULL,
  `CDate` varchar(100) DEFAULT NULL,
  `cipher` longtext,
  `email` varchar(100) DEFAULT NULL,
  `skey` varchar(100) DEFAULT NULL,
  `cloud` varchar(100) DEFAULT NULL,
  `dt` int(100) DEFAULT NULL,
  `size` int(11) DEFAULT 0,
  `count` int(11) DEFAULT 0,
  PRIMARY KEY (`filename`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `upload` */

insert  into `upload`(`file`,`filename`,`CDate`,`cipher`,`email`,`skey`,`cloud`,`dt`,`size`,`count`) values ('hi hello\r\nadsfghjkl','exec','24/12/2024','OceNX5aVEBZbQerHF3AcN/n2TafXtnToqiWJUgmDvRM=','abc@gmail.com','WVo30TdnvrKGSBBsX2HdEA==','',24,0,0),('check this data\r\nhello\r\nexternal','new','24/12/2024','Xpr0QvJrsprr5naJe6vHBmbsPGIYPES712RBhl3t8hA=','myra@gmail.com','TSinbyUOikOcq9Ki6K3ePw==','',24,0,0),('check this data\r\nhello\r\nexternal','samm','24/12/2024','V8PFyxVD89nR+bEVhosFPYL42WsuQBMh2V8IDn+nSEY=','abc@gmail.com','t62WtiSbYkqr4Plah+SyVg==','',24,0,0),('check this data\r\nhello\r\nexternal','sample','24/12/2024','othlgMMbFe8g9ZAOWa2dUmbt3JkzphAIWov/R7XsrA4=','abc@gmail.com','6EKt2Se/LXUAmisTr9wtdw==','',24,0,0);


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
