/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 10.1.19-MariaDB : Database - bot_telegram
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `bot_ticket_inbox` */

DROP TABLE IF EXISTS `bot_ticket_inbox`;

CREATE TABLE `bot_ticket_inbox` (
  `ticketinboxId` bigint(20) NOT NULL AUTO_INCREMENT,
  `ticketinboxPengirimTanggal` datetime DEFAULT NULL,
  `ticketinboxPengirimId` varchar(250) DEFAULT NULL,
  `ticketinboxChatId` varchar(250) DEFAULT NULL,
  `ticketinboxMessageHelp` text,
  `ticketinboxMessageReplay` text,
  `ticketinboxStatus` enum('New','Replied') DEFAULT 'New',
  PRIMARY KEY (`ticketinboxId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `bot_ticket_inbox` */

/*Table structure for table `sys_backup_app` */

DROP TABLE IF EXISTS `sys_backup_app`;

CREATE TABLE `sys_backup_app` (
  `BackupId` int(11) NOT NULL AUTO_INCREMENT,
  `BackupName` varchar(250) DEFAULT NULL,
  `BackupTime` datetime DEFAULT NULL,
  `BackupUnitId` int(11) DEFAULT NULL,
  `BackupAddUserId` int(11) DEFAULT NULL,
  `BackupAddTime` datetime DEFAULT NULL,
  `BackupUpdateUserId` int(11) DEFAULT NULL,
  `BackupUpdateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`BackupId`),
  KEY `FK_ci_backup` (`BackupUnitId`),
  KEY `FK_ci_backup_add_user` (`BackupAddUserId`),
  KEY `FK_ci_backup_update_user` (`BackupUpdateUserId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `sys_backup_app` */

/*Table structure for table `sys_backup_db` */

DROP TABLE IF EXISTS `sys_backup_db`;

CREATE TABLE `sys_backup_db` (
  `BackupId` int(11) NOT NULL AUTO_INCREMENT,
  `BackupName` varchar(250) DEFAULT NULL,
  `BackupTime` datetime DEFAULT NULL,
  `BackupUnit` varchar(255) DEFAULT NULL,
  `BackupAddUser` varchar(255) DEFAULT NULL,
  `BackupAddTime` datetime DEFAULT NULL,
  `BackupUpdateUser` varchar(255) DEFAULT NULL,
  `BackupUpdateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`BackupId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `sys_backup_db` */

insert  into `sys_backup_db`(`BackupId`,`BackupName`,`BackupTime`,`BackupUnit`,`BackupAddUser`,`BackupAddTime`,`BackupUpdateUser`,`BackupUpdateTime`) values (1,'backup_2013_10_01_20_56.zip','2013-10-01 20:56:00','1','1','2013-10-02 03:56:25','1','2013-10-02 03:56:25'),(2,'backup_2013_10_17_14_35.zip','2013-10-17 14:35:00','1','1','2013-10-17 21:35:30','1','2013-10-17 21:35:30'),(3,'backup_2013_10_18_07_54.zip','2013-10-18 07:54:00','1','1','2013-10-18 14:54:07','1','2013-10-18 14:54:07');

/*Table structure for table `sys_captcha` */

DROP TABLE IF EXISTS `sys_captcha`;

CREATE TABLE `sys_captcha` (
  `captcha_id` bigint(13) unsigned NOT NULL AUTO_INCREMENT,
  `captcha_time` int(10) unsigned NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `word` varchar(20) NOT NULL,
  PRIMARY KEY (`captcha_id`),
  KEY `word` (`word`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `sys_captcha` */

/*Table structure for table `sys_config` */

DROP TABLE IF EXISTS `sys_config`;

CREATE TABLE `sys_config` (
  `ConfigId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ConfigCode` varchar(25) DEFAULT NULL,
  `ConfigName` varchar(50) DEFAULT NULL,
  `ConfigType` enum('text','radio','checkbox','combo','file') DEFAULT NULL,
  `ConfigValue` varchar(255) DEFAULT NULL,
  `ConfigUnitId` int(11) DEFAULT NULL,
  `ConfigAddUser` varchar(255) DEFAULT NULL,
  `ConfigAddTime` datetime DEFAULT NULL,
  `ConfigUpdateUser` varchar(255) DEFAULT NULL,
  `ConfigUpdateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`ConfigId`),
  UNIQUE KEY `NewIndex1a` (`ConfigCode`,`ConfigUnitId`),
  KEY `FK_ci_config` (`ConfigUnitId`),
  CONSTRAINT `FK_ci_config` FOREIGN KEY (`ConfigUnitId`) REFERENCES `sys_unit` (`UnitId`) ON DELETE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `sys_config` */

insert  into `sys_config`(`ConfigId`,`ConfigCode`,`ConfigName`,`ConfigType`,`ConfigValue`,`ConfigUnitId`,`ConfigAddUser`,`ConfigAddTime`,`ConfigUpdateUser`,`ConfigUpdateTime`) values (1,'COUNTER_PAS','Nomor yang dilompati','text','5,6,7,8,9,10',NULL,NULL,'2016-01-28 09:13:58',NULL,NULL),(2,'ACTIVE_TAHUN','Tahun aktif system','text','2016',NULL,NULL,'2016-01-28 09:13:49',NULL,NULL);

/*Table structure for table `sys_fav` */

DROP TABLE IF EXISTS `sys_fav`;

CREATE TABLE `sys_fav` (
  `FavId` int(11) NOT NULL AUTO_INCREMENT,
  `FavUserId` int(11) DEFAULT NULL,
  `FavMenuId` int(11) DEFAULT NULL,
  `FavCount` int(11) DEFAULT NULL,
  PRIMARY KEY (`FavId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `sys_fav` */

/*Table structure for table `sys_group` */

DROP TABLE IF EXISTS `sys_group`;

CREATE TABLE `sys_group` (
  `GroupId` int(11) NOT NULL AUTO_INCREMENT,
  `GroupName` varchar(150) DEFAULT NULL,
  `GroupDescription` varchar(255) DEFAULT NULL,
  `GroupAddUser` varchar(255) DEFAULT NULL,
  `GroupAddTime` datetime DEFAULT NULL,
  `GroupUpdateUser` varchar(255) DEFAULT NULL,
  `GroupUpdateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`GroupId`),
  UNIQUE KEY `NewIndex1a` (`GroupName`),
  KEY `NewIndex1as` (`GroupDescription`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

/*Data for the table `sys_group` */

insert  into `sys_group`(`GroupId`,`GroupName`,`GroupDescription`,`GroupAddUser`,`GroupAddTime`,`GroupUpdateUser`,`GroupUpdateTime`) values (0,'Root','Super Administrator','system','2015-10-12 14:15:04','admin','2017-11-02 07:19:38');

/*Table structure for table `sys_group_detail` */

DROP TABLE IF EXISTS `sys_group_detail`;

CREATE TABLE `sys_group_detail` (
  `GroupDetailMenuActionId` int(11) NOT NULL,
  `GroupDetailGroupId` int(11) NOT NULL,
  `GroupDetailAddUser` varchar(255) DEFAULT NULL,
  `GroupDetailAddTime` datetime DEFAULT NULL,
  `GroupDetailUpdateUser` varchar(255) DEFAULT NULL,
  `GroupDetailUpdateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`GroupDetailMenuActionId`,`GroupDetailGroupId`),
  KEY `FK_ci_group_menu_dummy_menu` (`GroupDetailMenuActionId`),
  KEY `FK_ci_group_menu_aksi` (`GroupDetailGroupId`),
  CONSTRAINT `FK_sys_group_detail_group` FOREIGN KEY (`GroupDetailGroupId`) REFERENCES `sys_group` (`GroupId`) ON UPDATE CASCADE,
  CONSTRAINT `FK_sys_group_detail_menu_action` FOREIGN KEY (`GroupDetailMenuActionId`) REFERENCES `sys_menu_action` (`MenuActionId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

/*Data for the table `sys_group_detail` */

insert  into `sys_group_detail`(`GroupDetailMenuActionId`,`GroupDetailGroupId`,`GroupDetailAddUser`,`GroupDetailAddTime`,`GroupDetailUpdateUser`,`GroupDetailUpdateTime`) values (300,0,NULL,'2017-11-02 10:11:00','admin',NULL);

/*Table structure for table `sys_log` */

DROP TABLE IF EXISTS `sys_log`;

CREATE TABLE `sys_log` (
  `LogId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `LogUserId` int(11) DEFAULT NULL,
  `LogTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `LogIpAddress` varchar(45) DEFAULT NULL,
  `LogActivities` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`LogId`),
  KEY `FK_ci_log` (`LogUserId`),
  KEY `NewIndex1` (`LogActivities`),
  CONSTRAINT `FK_ci_log` FOREIGN KEY (`LogUserId`) REFERENCES `sys_user` (`UserId`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `sys_log` */

/*Table structure for table `sys_login_attempts` */

DROP TABLE IF EXISTS `sys_login_attempts`;

CREATE TABLE `sys_login_attempts` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(40) COLLATE utf8_bin NOT NULL,
  `login` varchar(50) COLLATE utf8_bin NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `sys_login_attempts` */

/*Table structure for table `sys_menu` */

DROP TABLE IF EXISTS `sys_menu`;

CREATE TABLE `sys_menu` (
  `MenuId` int(11) NOT NULL AUTO_INCREMENT,
  `MenuParentId` int(11) DEFAULT NULL,
  `MenuName` varchar(150) DEFAULT NULL,
  `MenuDescription` varchar(250) DEFAULT NULL,
  `MenuModule` varchar(150) DEFAULT NULL,
  `MenuIsShow` enum('Ya','Tidak') DEFAULT 'Ya',
  `MenuIcon` varchar(50) DEFAULT NULL,
  `MenuIconClass` varchar(250) DEFAULT NULL,
  `MenuOrder` int(2) DEFAULT NULL,
  PRIMARY KEY (`MenuId`),
  UNIQUE KEY `NewIndex12` (`MenuParentId`,`MenuName`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=latin1 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

/*Data for the table `sys_menu` */

insert  into `sys_menu`(`MenuId`,`MenuParentId`,`MenuName`,`MenuDescription`,`MenuModule`,`MenuIsShow`,`MenuIcon`,`MenuIconClass`,`MenuOrder`) values (115,NULL,'Helpdesk','Manajemen Helpdesk','data/Helpdesk','Ya','fa fa-envelope-o','fa fa-envelope-o',1);

/*Table structure for table `sys_menu_action` */

DROP TABLE IF EXISTS `sys_menu_action`;

CREATE TABLE `sys_menu_action` (
  `MenuActionId` int(11) NOT NULL AUTO_INCREMENT,
  `MenuActionMenuId` int(11) DEFAULT NULL,
  `MenuActionName` varchar(100) DEFAULT NULL,
  `MenuActionFunction` varchar(100) DEFAULT NULL,
  `MenuActionSegmen` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`MenuActionId`),
  UNIQUE KEY `UNIQUE_MENU` (`MenuActionMenuId`,`MenuActionSegmen`),
  KEY `FK_ci_dummy_menu_aksi` (`MenuActionMenuId`),
  CONSTRAINT `FK_sys_menu_action_menu` FOREIGN KEY (`MenuActionMenuId`) REFERENCES `sys_menu` (`MenuId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=301 DEFAULT CHARSET=latin1 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

/*Data for the table `sys_menu_action` */

insert  into `sys_menu_action`(`MenuActionId`,`MenuActionMenuId`,`MenuActionName`,`MenuActionFunction`,`MenuActionSegmen`) values (300,115,'View','index',NULL);

/*Table structure for table `sys_notif` */

DROP TABLE IF EXISTS `sys_notif`;

CREATE TABLE `sys_notif` (
  `NotifId` int(11) NOT NULL AUTO_INCREMENT,
  `NotifTipe` enum('Files','Message','Person') DEFAULT NULL,
  `NotifTitle` varchar(250) DEFAULT NULL,
  `NotifContent` varchar(250) DEFAULT NULL,
  `NotifLink` varchar(250) DEFAULT NULL,
  `NotifNoUser` varchar(250) NOT NULL DEFAULT '',
  `NotifIsDone` enum('1','0') DEFAULT NULL,
  `NotifTime` datetime DEFAULT NULL,
  PRIMARY KEY (`NotifId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `sys_notif` */

/*Table structure for table `sys_role` */

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `roleId` tinyint(4) NOT NULL DEFAULT '0',
  `roleNama` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

/*Data for the table `sys_role` */

insert  into `sys_role`(`roleId`,`roleNama`) values (0,'Normal');

/*Table structure for table `sys_sessions` */

DROP TABLE IF EXISTS `sys_sessions`;

CREATE TABLE `sys_sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) unsigned NOT NULL DEFAULT '0',
  `data` blob NOT NULL,
  KEY `ci_sessions_timestamp` (`timestamp`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `sys_sessions` */

insert  into `sys_sessions`(`id`,`ip_address`,`timestamp`,`data`) values ('eua2mecm28j3234u8hc1ra8odcpngf9c','::1',1512031308,'__ci_last_regenerate|i:1512031043;'),('25bj2h7dritpojgf3djkhhpne31gb332','::1',1512028955,'__ci_last_regenerate|i:1512028955;'),('50mnd9dv76uo9s0nfj72cd27ncmlb5eo','::1',1512351365,'__ci_last_regenerate|i:1512351365;'),('9epqismju085lbd4m59l22oochgvr9c3','::1',1512365157,'__ci_last_regenerate|i:1512365157;'),('hdl7hmepbchce0mlsrpk1cnis269hjeu','::1',1509931532,'__ci_last_regenerate|i:1509931513;user_id|s:1:\"1\";user_email|s:9:\"admin@uad\";user_name|s:5:\"admin\";user_group|s:1:\"4\";any_user_group_exist|a:2:{i:0;a:2:{s:8:\"id_group\";s:1:\"0\";s:10:\"name_group\";s:4:\"Root\";}i:1;a:2:{s:8:\"id_group\";s:1:\"4\";s:10:\"name_group\";s:3:\"HRD\";}}menu_privilege|a:3:{i:115;a:8:{s:6:\"MenuId\";s:3:\"115\";s:8:\"MenuName\";s:3:\"HRD\";s:12:\"MenuParentId\";N;s:10:\"MenuModule\";N;s:8:\"MenuIcon\";N;s:15:\"MenuDescription\";s:13:\"Manajemen HRD\";s:13:\"MenuIconClass\";N;s:9:\"MenuOrder\";s:1:\"1\";}i:114;a:8:{s:6:\"MenuId\";s:3:\"114\";s:8:\"MenuName\";s:23:\"Data Diri Pegawai(Anda)\";s:12:\"MenuParentId\";N;s:10:\"MenuModule\";s:12:\"pegawai/Data\";s:8:\"MenuIcon\";N;s:15:\"MenuDescription\";s:74:\"Input data diri pegawai mulai dari (istri, anak dan orang tua, pendidikan)\";s:13:\"MenuIconClass\";N;s:9:\"MenuOrder\";s:2:\"99\";}i:116;a:8:{s:6:\"MenuId\";s:3:\"116\";s:8:\"MenuName\";s:8:\"Data SDM\";s:12:\"MenuParentId\";s:3:\"115\";s:10:\"MenuModule\";s:11:\"sdm/Pegawai\";s:8:\"MenuIcon\";N;s:15:\"MenuDescription\";N;s:13:\"MenuIconClass\";N;s:9:\"MenuOrder\";s:1:\"1\";}}action_privilege|a:3:{i:0;a:4:{s:10:\"MenuModule\";N;s:14:\"MenuActionName\";s:4:\"View\";s:18:\"MenuActionFunction\";s:5:\"index\";s:16:\"MenuActionSegmen\";s:0:\"\";}i:1;a:4:{s:10:\"MenuModule\";s:12:\"pegawai/Data\";s:14:\"MenuActionName\";s:4:\"View\";s:18:\"MenuActionFunction\";s:5:\"index\";s:16:\"MenuActionSegmen\";s:18:\"pegawai/data/index\";}i:2;a:4:{s:10:\"MenuModule\";s:11:\"sdm/Pegawai\";s:14:\"MenuActionName\";s:4:\"View\";s:18:\"MenuActionFunction\";s:5:\"index\";s:16:\"MenuActionSegmen\";s:17:\"sdm/pegawai/index\";}}user_real_name|s:13:\"Administrator\";is_logged_in|b:1;user_role_id|N;user_unit_kode|N;user_unit_id|N;'),('5b30j3u4q14dgni3cohbqdm3msfmgq0t','::1',1510140244,'__ci_last_regenerate|i:1510140166;user_id|s:1:\"1\";user_email|s:9:\"admin@uad\";user_name|s:5:\"admin\";user_group|s:1:\"4\";any_user_group_exist|a:2:{i:0;a:2:{s:8:\"id_group\";s:1:\"0\";s:10:\"name_group\";s:4:\"Root\";}i:1;a:2:{s:8:\"id_group\";s:1:\"4\";s:10:\"name_group\";s:3:\"HRD\";}}menu_privilege|a:3:{i:115;a:8:{s:6:\"MenuId\";s:3:\"115\";s:8:\"MenuName\";s:3:\"HRD\";s:12:\"MenuParentId\";N;s:10:\"MenuModule\";N;s:8:\"MenuIcon\";N;s:15:\"MenuDescription\";s:13:\"Manajemen HRD\";s:13:\"MenuIconClass\";N;s:9:\"MenuOrder\";s:1:\"1\";}i:114;a:8:{s:6:\"MenuId\";s:3:\"114\";s:8:\"MenuName\";s:23:\"Data Diri Pegawai(Anda)\";s:12:\"MenuParentId\";N;s:10:\"MenuModule\";s:12:\"pegawai/Data\";s:8:\"MenuIcon\";N;s:15:\"MenuDescription\";s:74:\"Input data diri pegawai mulai dari (istri, anak dan orang tua, pendidikan)\";s:13:\"MenuIconClass\";N;s:9:\"MenuOrder\";s:2:\"99\";}i:116;a:8:{s:6:\"MenuId\";s:3:\"116\";s:8:\"MenuName\";s:8:\"Data SDM\";s:12:\"MenuParentId\";s:3:\"115\";s:10:\"MenuModule\";s:11:\"sdm/Pegawai\";s:8:\"MenuIcon\";N;s:15:\"MenuDescription\";N;s:13:\"MenuIconClass\";N;s:9:\"MenuOrder\";s:1:\"1\";}}action_privilege|a:3:{i:0;a:4:{s:10:\"MenuModule\";N;s:14:\"MenuActionName\";s:4:\"View\";s:18:\"MenuActionFunction\";s:5:\"index\";s:16:\"MenuActionSegmen\";s:0:\"\";}i:1;a:4:{s:10:\"MenuModule\";s:12:\"pegawai/Data\";s:14:\"MenuActionName\";s:4:\"View\";s:18:\"MenuActionFunction\";s:5:\"index\";s:16:\"MenuActionSegmen\";s:18:\"pegawai/data/index\";}i:2;a:4:{s:10:\"MenuModule\";s:11:\"sdm/Pegawai\";s:14:\"MenuActionName\";s:4:\"View\";s:18:\"MenuActionFunction\";s:5:\"index\";s:16:\"MenuActionSegmen\";s:17:\"sdm/pegawai/index\";}}user_real_name|s:13:\"Administrator\";is_logged_in|b:1;user_role_id|N;user_unit_kode|N;user_unit_id|N;'),('upuoodabpi19vh144igis5b89453rpne','::1',1510902069,'__ci_last_regenerate|i:1510902068;'),('l1so99i68rahvlmtrqbm8s1eqkf9ljsp','::1',1509616543,'__ci_last_regenerate|i:1509616543;user_id|s:1:\"1\";user_email|s:9:\"admin@uad\";user_name|s:5:\"admin\";user_group|s:1:\"4\";any_user_group_exist|a:2:{i:0;a:2:{s:8:\"id_group\";s:1:\"0\";s:10:\"name_group\";s:4:\"Root\";}i:1;a:2:{s:8:\"id_group\";s:1:\"4\";s:10:\"name_group\";s:3:\"HRD\";}}menu_privilege|a:3:{i:115;a:8:{s:6:\"MenuId\";s:3:\"115\";s:8:\"MenuName\";s:3:\"HRD\";s:12:\"MenuParentId\";N;s:10:\"MenuModule\";N;s:8:\"MenuIcon\";N;s:15:\"MenuDescription\";s:13:\"Manajemen HRD\";s:13:\"MenuIconClass\";N;s:9:\"MenuOrder\";s:1:\"1\";}i:114;a:8:{s:6:\"MenuId\";s:3:\"114\";s:8:\"MenuName\";s:23:\"Data Diri Pegawai(Anda)\";s:12:\"MenuParentId\";N;s:10:\"MenuModule\";s:12:\"pegawai/Data\";s:8:\"MenuIcon\";N;s:15:\"MenuDescription\";s:74:\"Input data diri pegawai mulai dari (istri, anak dan orang tua, pendidikan)\";s:13:\"MenuIconClass\";N;s:9:\"MenuOrder\";s:2:\"99\";}i:116;a:8:{s:6:\"MenuId\";s:3:\"116\";s:8:\"MenuName\";s:8:\"Data SDM\";s:12:\"MenuParentId\";s:3:\"115\";s:10:\"MenuModule\";s:11:\"sdm/Pegawai\";s:8:\"MenuIcon\";N;s:15:\"MenuDescription\";N;s:13:\"MenuIconClass\";N;s:9:\"MenuOrder\";s:1:\"1\";}}action_privilege|a:3:{i:0;a:4:{s:10:\"MenuModule\";N;s:14:\"MenuActionName\";s:4:\"View\";s:18:\"MenuActionFunction\";s:5:\"index\";s:16:\"MenuActionSegmen\";s:0:\"\";}i:1;a:4:{s:10:\"MenuModule\";s:12:\"pegawai/Data\";s:14:\"MenuActionName\";s:4:\"View\";s:18:\"MenuActionFunction\";s:5:\"index\";s:16:\"MenuActionSegmen\";s:18:\"pegawai/data/index\";}i:2;a:4:{s:10:\"MenuModule\";s:11:\"sdm/Pegawai\";s:14:\"MenuActionName\";s:4:\"View\";s:18:\"MenuActionFunction\";s:5:\"index\";s:16:\"MenuActionSegmen\";s:17:\"sdm/pegawai/index\";}}user_real_name|s:13:\"Administrator\";is_logged_in|b:1;user_role_id|N;user_unit_kode|N;user_unit_id|N;'),('4fj473iu2v4o40epj2l7qom88p2ceotj','::1',1509616546,'__ci_last_regenerate|i:1509616546;user_id|s:1:\"1\";user_email|s:9:\"admin@uad\";user_name|s:5:\"admin\";user_group|s:1:\"4\";any_user_group_exist|a:2:{i:0;a:2:{s:8:\"id_group\";s:1:\"0\";s:10:\"name_group\";s:4:\"Root\";}i:1;a:2:{s:8:\"id_group\";s:1:\"4\";s:10:\"name_group\";s:3:\"HRD\";}}menu_privilege|a:3:{i:115;a:8:{s:6:\"MenuId\";s:3:\"115\";s:8:\"MenuName\";s:3:\"HRD\";s:12:\"MenuParentId\";N;s:10:\"MenuModule\";N;s:8:\"MenuIcon\";N;s:15:\"MenuDescription\";s:13:\"Manajemen HRD\";s:13:\"MenuIconClass\";N;s:9:\"MenuOrder\";s:1:\"1\";}i:114;a:8:{s:6:\"MenuId\";s:3:\"114\";s:8:\"MenuName\";s:23:\"Data Diri Pegawai(Anda)\";s:12:\"MenuParentId\";N;s:10:\"MenuModule\";s:12:\"pegawai/Data\";s:8:\"MenuIcon\";N;s:15:\"MenuDescription\";s:74:\"Input data diri pegawai mulai dari (istri, anak dan orang tua, pendidikan)\";s:13:\"MenuIconClass\";N;s:9:\"MenuOrder\";s:2:\"99\";}i:116;a:8:{s:6:\"MenuId\";s:3:\"116\";s:8:\"MenuName\";s:8:\"Data SDM\";s:12:\"MenuParentId\";s:3:\"115\";s:10:\"MenuModule\";s:11:\"sdm/Pegawai\";s:8:\"MenuIcon\";N;s:15:\"MenuDescription\";N;s:13:\"MenuIconClass\";N;s:9:\"MenuOrder\";s:1:\"1\";}}action_privilege|a:3:{i:0;a:4:{s:10:\"MenuModule\";N;s:14:\"MenuActionName\";s:4:\"View\";s:18:\"MenuActionFunction\";s:5:\"index\";s:16:\"MenuActionSegmen\";s:0:\"\";}i:1;a:4:{s:10:\"MenuModule\";s:12:\"pegawai/Data\";s:14:\"MenuActionName\";s:4:\"View\";s:18:\"MenuActionFunction\";s:5:\"index\";s:16:\"MenuActionSegmen\";s:18:\"pegawai/data/index\";}i:2;a:4:{s:10:\"MenuModule\";s:11:\"sdm/Pegawai\";s:14:\"MenuActionName\";s:4:\"View\";s:18:\"MenuActionFunction\";s:5:\"index\";s:16:\"MenuActionSegmen\";s:17:\"sdm/pegawai/index\";}}user_real_name|s:13:\"Administrator\";is_logged_in|b:1;user_role_id|N;user_unit_kode|N;user_unit_id|N;'),('k0im6446k02mfvijvhk7t9oin2ipdmd6','::1',1509697200,'__ci_last_regenerate|i:1509756660;'),('pfednkqh6prvam8b309ch135iudpho7o','::1',1512364257,'__ci_last_regenerate|i:1512364166;'),('6qbkov6ir9nl1f9p31v86a6ntmgl6okh','::1',1512374364,'__ci_last_regenerate|i:1512374263;'),('pppup00c0u3n6qlqn0t1ur7agperm4r6','::1',1512374141,'__ci_last_regenerate|i:1512374078;'),('qs0tgqsljegnr5np36g3kljubsag072b','::1',1512466831,'__ci_last_regenerate|i:1512466830;'),('v07n6pebmidvbes04hegmttm9ckasbnq','::1',1517216315,'__ci_last_regenerate|i:1517216044;'),('aebo2du86r1etqvkmk7v3bufmensvlk4','::1',1517216121,'__ci_last_regenerate|i:1517216046;'),('qs4lrhehkmgpd73r53buo50k6smnbfoe','::1',1517288324,'__ci_last_regenerate|i:1517288264;user_id|s:1:\"1\";user_email|s:9:\"admin@uad\";user_name|s:5:\"admin\";user_group|s:1:\"0\";any_user_group_exist|a:2:{i:0;a:2:{s:8:\"id_group\";s:1:\"0\";s:10:\"name_group\";s:4:\"Root\";}i:1;a:2:{s:8:\"id_group\";s:1:\"4\";s:10:\"name_group\";s:3:\"HRD\";}}menu_privilege|a:3:{i:1;a:8:{s:6:\"MenuId\";s:1:\"1\";s:8:\"MenuName\";s:6:\"System\";s:12:\"MenuParentId\";N;s:10:\"MenuModule\";s:11:\"system/Menu\";s:8:\"MenuIcon\";N;s:15:\"MenuDescription\";s:16:\"Manajemen System\";s:13:\"MenuIconClass\";N;s:9:\"MenuOrder\";s:2:\"99\";}i:3;a:8:{s:6:\"MenuId\";s:1:\"3\";s:8:\"MenuName\";s:5:\"Group\";s:12:\"MenuParentId\";s:1:\"1\";s:10:\"MenuModule\";s:12:\"system/Group\";s:8:\"MenuIcon\";N;s:15:\"MenuDescription\";s:44:\"Menu dan aksi suatu kelompok pada suatu unit\";s:13:\"MenuIconClass\";N;s:9:\"MenuOrder\";s:1:\"2\";}i:4;a:8:{s:6:\"MenuId\";s:1:\"4\";s:8:\"MenuName\";s:4:\"User\";s:12:\"MenuParentId\";s:1:\"1\";s:10:\"MenuModule\";s:11:\"system/User\";s:8:\"MenuIcon\";N;s:15:\"MenuDescription\";s:34:\"Pengguna sistem dengan multi group\";s:13:\"MenuIconClass\";N;s:9:\"MenuOrder\";s:1:\"3\";}}action_privilege|a:11:{i:0;a:4:{s:10:\"MenuModule\";s:11:\"system/Menu\";s:14:\"MenuActionName\";s:4:\"View\";s:18:\"MenuActionFunction\";s:5:\"index\";s:16:\"MenuActionSegmen\";s:17:\"system/home/index\";}i:1;a:4:{s:10:\"MenuModule\";s:12:\"system/Group\";s:14:\"MenuActionName\";s:3:\"Add\";s:18:\"MenuActionFunction\";s:3:\"add\";s:16:\"MenuActionSegmen\";s:16:\"system/group/add\";}i:2;a:4:{s:10:\"MenuModule\";s:12:\"system/Group\";s:14:\"MenuActionName\";s:4:\"Ajax\";s:18:\"MenuActionFunction\";s:4:\"ajax\";s:16:\"MenuActionSegmen\";s:17:\"system/group/ajax\";}i:3;a:4:{s:10:\"MenuModule\";s:12:\"system/Group\";s:14:\"MenuActionName\";s:6:\"Delete\";s:18:\"MenuActionFunction\";s:6:\"delete\";s:16:\"MenuActionSegmen\";s:19:\"system/group/delete\";}i:4;a:4:{s:10:\"MenuModule\";s:12:\"system/Group\";s:14:\"MenuActionName\";s:4:\"View\";s:18:\"MenuActionFunction\";s:5:\"index\";s:16:\"MenuActionSegmen\";s:18:\"system/group/index\";}i:5;a:4:{s:10:\"MenuModule\";s:12:\"system/Group\";s:14:\"MenuActionName\";s:6:\"Update\";s:18:\"MenuActionFunction\";s:6:\"update\";s:16:\"MenuActionSegmen\";s:19:\"system/group/update\";}i:6;a:4:{s:10:\"MenuModule\";s:11:\"system/User\";s:14:\"MenuActionName\";s:3:\"Add\";s:18:\"MenuActionFunction\";s:3:\"add\";s:16:\"MenuActionSegmen\";s:15:\"system/user/add\";}i:7;a:4:{s:10:\"MenuModule\";s:11:\"system/User\";s:14:\"MenuActionName\";s:4:\"Ajax\";s:18:\"MenuActionFunction\";s:4:\"ajax\";s:16:\"MenuActionSegmen\";s:16:\"system/user/ajax\";}i:8;a:4:{s:10:\"MenuModule\";s:11:\"system/User\";s:14:\"MenuActionName\";s:6:\"Delete\";s:18:\"MenuActionFunction\";s:6:\"delete\";s:16:\"MenuActionSegmen\";s:18:\"system/user/delete\";}i:9;a:4:{s:10:\"MenuModule\";s:11:\"system/User\";s:14:\"MenuActionName\";s:4:\"View\";s:18:\"MenuActionFunction\";s:5:\"index\";s:16:\"MenuActionSegmen\";s:17:\"system/user/index\";}i:10;a:4:{s:10:\"MenuModule\";s:11:\"system/User\";s:14:\"MenuActionName\";s:6:\"Update\";s:18:\"MenuActionFunction\";s:6:\"update\";s:16:\"MenuActionSegmen\";s:18:\"system/user/update\";}}user_real_name|s:13:\"Administrator\";is_logged_in|b:1;user_role_id|N;user_unit_kode|N;user_unit_id|N;'),('g47qbdj9rdin49c5agfsb6hq9e3nu2r0','::1',1510904038,'__ci_last_regenerate|i:1510904027;user_id|s:1:\"1\";user_email|s:9:\"admin@uad\";user_name|s:5:\"admin\";user_group|s:1:\"4\";any_user_group_exist|a:2:{i:0;a:2:{s:8:\"id_group\";s:1:\"0\";s:10:\"name_group\";s:4:\"Root\";}i:1;a:2:{s:8:\"id_group\";s:1:\"4\";s:10:\"name_group\";s:3:\"HRD\";}}menu_privilege|a:3:{i:115;a:8:{s:6:\"MenuId\";s:3:\"115\";s:8:\"MenuName\";s:3:\"HRD\";s:12:\"MenuParentId\";N;s:10:\"MenuModule\";N;s:8:\"MenuIcon\";N;s:15:\"MenuDescription\";s:13:\"Manajemen HRD\";s:13:\"MenuIconClass\";N;s:9:\"MenuOrder\";s:1:\"1\";}i:114;a:8:{s:6:\"MenuId\";s:3:\"114\";s:8:\"MenuName\";s:23:\"Data Diri Pegawai(Anda)\";s:12:\"MenuParentId\";N;s:10:\"MenuModule\";s:12:\"pegawai/Data\";s:8:\"MenuIcon\";N;s:15:\"MenuDescription\";s:74:\"Input data diri pegawai mulai dari (istri, anak dan orang tua, pendidikan)\";s:13:\"MenuIconClass\";N;s:9:\"MenuOrder\";s:2:\"99\";}i:116;a:8:{s:6:\"MenuId\";s:3:\"116\";s:8:\"MenuName\";s:8:\"Data SDM\";s:12:\"MenuParentId\";s:3:\"115\";s:10:\"MenuModule\";s:11:\"sdm/Pegawai\";s:8:\"MenuIcon\";N;s:15:\"MenuDescription\";N;s:13:\"MenuIconClass\";N;s:9:\"MenuOrder\";s:1:\"1\";}}action_privilege|a:3:{i:0;a:4:{s:10:\"MenuModule\";N;s:14:\"MenuActionName\";s:4:\"View\";s:18:\"MenuActionFunction\";s:5:\"index\";s:16:\"MenuActionSegmen\";s:0:\"\";}i:1;a:4:{s:10:\"MenuModule\";s:12:\"pegawai/Data\";s:14:\"MenuActionName\";s:4:\"View\";s:18:\"MenuActionFunction\";s:5:\"index\";s:16:\"MenuActionSegmen\";s:18:\"pegawai/data/index\";}i:2;a:4:{s:10:\"MenuModule\";s:11:\"sdm/Pegawai\";s:14:\"MenuActionName\";s:4:\"View\";s:18:\"MenuActionFunction\";s:5:\"index\";s:16:\"MenuActionSegmen\";s:17:\"sdm/pegawai/index\";}}user_real_name|s:13:\"Administrator\";is_logged_in|b:1;user_role_id|N;user_unit_kode|N;user_unit_id|N;'),('nn4b1ti3prlqhv05fnc625tecrjfv4kn','::1',1512017583,'__ci_last_regenerate|i:1512017583;'),('a53j8b776mpsn2coe04srlo734gehmcs','::1',1517300147,'__ci_last_regenerate|i:1517300147;user_id|s:1:\"1\";user_email|s:9:\"admin@uad\";user_name|s:5:\"admin\";user_group|s:1:\"0\";any_user_group_exist|a:2:{i:0;a:2:{s:8:\"id_group\";s:1:\"0\";s:10:\"name_group\";s:4:\"Root\";}i:1;a:2:{s:8:\"id_group\";s:1:\"4\";s:10:\"name_group\";s:3:\"HRD\";}}menu_privilege|a:3:{i:1;a:8:{s:6:\"MenuId\";s:1:\"1\";s:8:\"MenuName\";s:6:\"System\";s:12:\"MenuParentId\";N;s:10:\"MenuModule\";s:11:\"system/Menu\";s:8:\"MenuIcon\";N;s:15:\"MenuDescription\";s:16:\"Manajemen System\";s:13:\"MenuIconClass\";N;s:9:\"MenuOrder\";s:2:\"99\";}i:3;a:8:{s:6:\"MenuId\";s:1:\"3\";s:8:\"MenuName\";s:5:\"Group\";s:12:\"MenuParentId\";s:1:\"1\";s:10:\"MenuModule\";s:12:\"system/Group\";s:8:\"MenuIcon\";N;s:15:\"MenuDescription\";s:44:\"Menu dan aksi suatu kelompok pada suatu unit\";s:13:\"MenuIconClass\";N;s:9:\"MenuOrder\";s:1:\"2\";}i:4;a:8:{s:6:\"MenuId\";s:1:\"4\";s:8:\"MenuName\";s:4:\"User\";s:12:\"MenuParentId\";s:1:\"1\";s:10:\"MenuModule\";s:11:\"system/User\";s:8:\"MenuIcon\";N;s:15:\"MenuDescription\";s:34:\"Pengguna sistem dengan multi group\";s:13:\"MenuIconClass\";N;s:9:\"MenuOrder\";s:1:\"3\";}}action_privilege|a:11:{i:0;a:4:{s:10:\"MenuModule\";s:11:\"system/Menu\";s:14:\"MenuActionName\";s:4:\"View\";s:18:\"MenuActionFunction\";s:5:\"index\";s:16:\"MenuActionSegmen\";s:17:\"system/home/index\";}i:1;a:4:{s:10:\"MenuModule\";s:12:\"system/Group\";s:14:\"MenuActionName\";s:3:\"Add\";s:18:\"MenuActionFunction\";s:3:\"add\";s:16:\"MenuActionSegmen\";s:16:\"system/group/add\";}i:2;a:4:{s:10:\"MenuModule\";s:12:\"system/Group\";s:14:\"MenuActionName\";s:4:\"Ajax\";s:18:\"MenuActionFunction\";s:4:\"ajax\";s:16:\"MenuActionSegmen\";s:17:\"system/group/ajax\";}i:3;a:4:{s:10:\"MenuModule\";s:12:\"system/Group\";s:14:\"MenuActionName\";s:6:\"Delete\";s:18:\"MenuActionFunction\";s:6:\"delete\";s:16:\"MenuActionSegmen\";s:19:\"system/group/delete\";}i:4;a:4:{s:10:\"MenuModule\";s:12:\"system/Group\";s:14:\"MenuActionName\";s:4:\"View\";s:18:\"MenuActionFunction\";s:5:\"index\";s:16:\"MenuActionSegmen\";s:18:\"system/group/index\";}i:5;a:4:{s:10:\"MenuModule\";s:12:\"system/Group\";s:14:\"MenuActionName\";s:6:\"Update\";s:18:\"MenuActionFunction\";s:6:\"update\";s:16:\"MenuActionSegmen\";s:19:\"system/group/update\";}i:6;a:4:{s:10:\"MenuModule\";s:11:\"system/User\";s:14:\"MenuActionName\";s:3:\"Add\";s:18:\"MenuActionFunction\";s:3:\"add\";s:16:\"MenuActionSegmen\";s:15:\"system/user/add\";}i:7;a:4:{s:10:\"MenuModule\";s:11:\"system/User\";s:14:\"MenuActionName\";s:4:\"Ajax\";s:18:\"MenuActionFunction\";s:4:\"ajax\";s:16:\"MenuActionSegmen\";s:16:\"system/user/ajax\";}i:8;a:4:{s:10:\"MenuModule\";s:11:\"system/User\";s:14:\"MenuActionName\";s:6:\"Delete\";s:18:\"MenuActionFunction\";s:6:\"delete\";s:16:\"MenuActionSegmen\";s:18:\"system/user/delete\";}i:9;a:4:{s:10:\"MenuModule\";s:11:\"system/User\";s:14:\"MenuActionName\";s:4:\"View\";s:18:\"MenuActionFunction\";s:5:\"index\";s:16:\"MenuActionSegmen\";s:17:\"system/user/index\";}i:10;a:4:{s:10:\"MenuModule\";s:11:\"system/User\";s:14:\"MenuActionName\";s:6:\"Update\";s:18:\"MenuActionFunction\";s:6:\"update\";s:16:\"MenuActionSegmen\";s:18:\"system/user/update\";}}user_real_name|s:13:\"Administrator\";is_logged_in|b:1;user_role_id|N;user_unit_kode|N;user_unit_id|N;message|s:23:\"Hak akses anda berubah.\";__ci_vars|a:1:{s:7:\"message\";s:3:\"new\";}'),('2i87n6r3igpvos2mpd43fdj748ah0fnq','::1',1518405298,'__ci_last_regenerate|i:1518405168;user_id|s:1:\"1\";user_email|s:9:\"admin@uad\";user_name|s:5:\"admin\";user_group|s:1:\"4\";any_user_group_exist|a:2:{i:0;a:2:{s:8:\"id_group\";s:1:\"0\";s:10:\"name_group\";s:4:\"Root\";}i:1;a:2:{s:8:\"id_group\";s:1:\"4\";s:10:\"name_group\";s:3:\"HRD\";}}menu_privilege|a:3:{i:115;a:8:{s:6:\"MenuId\";s:3:\"115\";s:8:\"MenuName\";s:3:\"HRD\";s:12:\"MenuParentId\";N;s:10:\"MenuModule\";N;s:8:\"MenuIcon\";N;s:15:\"MenuDescription\";s:13:\"Manajemen HRD\";s:13:\"MenuIconClass\";N;s:9:\"MenuOrder\";s:1:\"1\";}i:114;a:8:{s:6:\"MenuId\";s:3:\"114\";s:8:\"MenuName\";s:23:\"Data Diri Pegawai(Anda)\";s:12:\"MenuParentId\";N;s:10:\"MenuModule\";s:12:\"pegawai/Data\";s:8:\"MenuIcon\";N;s:15:\"MenuDescription\";s:74:\"Input data diri pegawai mulai dari (istri, anak dan orang tua, pendidikan)\";s:13:\"MenuIconClass\";N;s:9:\"MenuOrder\";s:2:\"99\";}i:116;a:8:{s:6:\"MenuId\";s:3:\"116\";s:8:\"MenuName\";s:8:\"Data SDM\";s:12:\"MenuParentId\";s:3:\"115\";s:10:\"MenuModule\";s:11:\"sdm/Pegawai\";s:8:\"MenuIcon\";N;s:15:\"MenuDescription\";N;s:13:\"MenuIconClass\";N;s:9:\"MenuOrder\";s:1:\"1\";}}action_privilege|a:3:{i:0;a:4:{s:10:\"MenuModule\";N;s:14:\"MenuActionName\";s:4:\"View\";s:18:\"MenuActionFunction\";s:5:\"index\";s:16:\"MenuActionSegmen\";s:0:\"\";}i:1;a:4:{s:10:\"MenuModule\";s:12:\"pegawai/Data\";s:14:\"MenuActionName\";s:4:\"View\";s:18:\"MenuActionFunction\";s:5:\"index\";s:16:\"MenuActionSegmen\";s:18:\"pegawai/data/index\";}i:2;a:4:{s:10:\"MenuModule\";s:11:\"sdm/Pegawai\";s:14:\"MenuActionName\";s:4:\"View\";s:18:\"MenuActionFunction\";s:5:\"index\";s:16:\"MenuActionSegmen\";s:17:\"sdm/pegawai/index\";}}user_real_name|s:13:\"Administrator\";is_logged_in|b:1;user_role_id|N;user_unit_kode|N;user_unit_id|N;message|s:23:\"Hak akses anda berubah.\";__ci_vars|a:1:{s:7:\"message\";s:3:\"old\";}'),('7sufnb388v8p3hc7ub2kstlfach3f7rk','::1',1517305707,'__ci_last_regenerate|i:1517305643;'),('vvdmjuq55fpsp54s7d4lg83f87qqmgl4','::1',1517305643,'__ci_last_regenerate|i:1517305643;'),('5unjdf683cmt1blnlqgpraac63at8pvg','::1',1522067571,'__ci_last_regenerate|i:1522067513;user_id|s:1:\"1\";user_email|s:9:\"admin@uad\";user_name|s:5:\"admin\";user_group|s:1:\"0\";user_home_uri|N;any_user_group_exist|N;menu_privilege|a:1:{i:115;a:8:{s:6:\"MenuId\";s:3:\"115\";s:8:\"MenuName\";s:8:\"Helpdesk\";s:12:\"MenuParentId\";N;s:10:\"MenuModule\";s:13:\"data/Helpdesk\";s:8:\"MenuIcon\";s:16:\"fa fa-envelope-o\";s:15:\"MenuDescription\";s:18:\"Manajemen Helpdesk\";s:13:\"MenuIconClass\";s:16:\"fa fa-envelope-o\";s:9:\"MenuOrder\";s:1:\"1\";}}action_privilege|a:1:{i:0;a:4:{s:10:\"MenuModule\";s:13:\"data/Helpdesk\";s:14:\"MenuActionName\";s:4:\"View\";s:18:\"MenuActionFunction\";s:5:\"index\";s:16:\"MenuActionSegmen\";s:0:\"\";}}user_real_name|s:13:\"Administrator\";is_logged_in|b:1;user_role_id|N;user_unit_kode|N;user_unit_id|N;'),('pe2aoj1pejbkmtqn1ib0vd1123a42nse','::1',1522151218,'__ci_last_regenerate|i:1522151217;'),('00l8emrv15ckf9k83cakr2ii6hht2c16','::1',1522151228,'__ci_last_regenerate|i:1522151219;user_id|s:1:\"1\";user_email|s:9:\"admin@uad\";user_name|s:5:\"admin\";user_group|s:1:\"0\";user_home_uri|N;any_user_group_exist|N;menu_privilege|a:1:{i:115;a:8:{s:6:\"MenuId\";s:3:\"115\";s:8:\"MenuName\";s:8:\"Helpdesk\";s:12:\"MenuParentId\";N;s:10:\"MenuModule\";s:13:\"data/Helpdesk\";s:8:\"MenuIcon\";s:16:\"fa fa-envelope-o\";s:15:\"MenuDescription\";s:18:\"Manajemen Helpdesk\";s:13:\"MenuIconClass\";s:16:\"fa fa-envelope-o\";s:9:\"MenuOrder\";s:1:\"1\";}}action_privilege|a:1:{i:0;a:4:{s:10:\"MenuModule\";s:13:\"data/Helpdesk\";s:14:\"MenuActionName\";s:4:\"View\";s:18:\"MenuActionFunction\";s:5:\"index\";s:16:\"MenuActionSegmen\";s:0:\"\";}}user_real_name|s:13:\"Administrator\";is_logged_in|b:1;user_role_id|N;user_unit_kode|N;user_unit_id|N;'),('otivbmg1jicb3a90q109ovcksulirmuq','::1',1522243555,'__ci_last_regenerate|i:1522243337;user_id|s:1:\"1\";user_email|s:9:\"admin@uad\";user_name|s:5:\"admin\";user_group|s:1:\"0\";user_home_uri|N;any_user_group_exist|N;menu_privilege|a:1:{i:115;a:8:{s:6:\"MenuId\";s:3:\"115\";s:8:\"MenuName\";s:8:\"Helpdesk\";s:12:\"MenuParentId\";N;s:10:\"MenuModule\";s:13:\"data/Helpdesk\";s:8:\"MenuIcon\";s:16:\"fa fa-envelope-o\";s:15:\"MenuDescription\";s:18:\"Manajemen Helpdesk\";s:13:\"MenuIconClass\";s:16:\"fa fa-envelope-o\";s:9:\"MenuOrder\";s:1:\"1\";}}action_privilege|a:1:{i:0;a:4:{s:10:\"MenuModule\";s:13:\"data/Helpdesk\";s:14:\"MenuActionName\";s:4:\"View\";s:18:\"MenuActionFunction\";s:5:\"index\";s:16:\"MenuActionSegmen\";s:0:\"\";}}user_real_name|s:13:\"Administrator\";is_logged_in|b:1;user_role_id|N;user_unit_kode|N;user_unit_id|N;');

/*Table structure for table `sys_setting` */

DROP TABLE IF EXISTS `sys_setting`;

CREATE TABLE `sys_setting` (
  `SettingId` int(11) NOT NULL,
  `SettingCategoryId` int(11) NOT NULL,
  `SettingValue` varchar(255) DEFAULT NULL,
  `UserAddUserId` int(11) DEFAULT NULL,
  `UserAddTime` datetime DEFAULT NULL,
  `UserUpdateUserId` int(11) DEFAULT NULL,
  `UserUpdateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`SettingId`),
  KEY `FK_sys_setting_user_add` (`UserAddUserId`),
  KEY `FK_sys_setting_user_update` (`UserUpdateUserId`),
  CONSTRAINT `FK_sys_setting_user_add` FOREIGN KEY (`UserAddUserId`) REFERENCES `sys_user` (`UserId`) ON UPDATE CASCADE,
  CONSTRAINT `FK_sys_setting_user_update` FOREIGN KEY (`UserUpdateUserId`) REFERENCES `sys_user` (`UserId`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `sys_setting` */

/*Table structure for table `sys_setting_category` */

DROP TABLE IF EXISTS `sys_setting_category`;

CREATE TABLE `sys_setting_category` (
  `CategoryId` int(11) NOT NULL AUTO_INCREMENT,
  `CategoryName` varchar(255) NOT NULL,
  `UserAddUserId` int(11) DEFAULT NULL,
  `UserAddTime` datetime DEFAULT NULL,
  `UserUpdateUserId` int(11) DEFAULT NULL,
  `UserUpdateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`CategoryId`),
  KEY `FK_sys_setting_category_user_add` (`UserAddUserId`),
  KEY `FK_sys_setting_category_user_update` (`UserUpdateUserId`),
  CONSTRAINT `FK_sys_setting_category_user_add` FOREIGN KEY (`UserAddUserId`) REFERENCES `sys_user` (`UserId`) ON UPDATE CASCADE,
  CONSTRAINT `FK_sys_setting_category_user_update` FOREIGN KEY (`UserUpdateUserId`) REFERENCES `sys_user` (`UserId`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `sys_setting_category` */

/*Table structure for table `sys_syncron` */

DROP TABLE IF EXISTS `sys_syncron`;

CREATE TABLE `sys_syncron` (
  `SyncronId` int(11) NOT NULL AUTO_INCREMENT,
  `SyncronTime` datetime DEFAULT NULL,
  `SyncronQuery` text,
  `SyncronIsDone` enum('0','1') DEFAULT '0',
  `SyncronUnitId` int(11) DEFAULT NULL,
  `SyncronUser` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`SyncronId`),
  KEY `NewIndex1` (`SyncronIsDone`,`SyncronUnitId`),
  KEY `FK_sys_syncron` (`SyncronUnitId`),
  CONSTRAINT `FK_sys_syncron_unt` FOREIGN KEY (`SyncronUnitId`) REFERENCES `sys_unit` (`UnitId`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `sys_syncron` */

/*Table structure for table `sys_unit` */

DROP TABLE IF EXISTS `sys_unit`;

CREATE TABLE `sys_unit` (
  `UnitId` int(11) NOT NULL AUTO_INCREMENT,
  `UnitKode` varchar(20) DEFAULT NULL,
  `UnitName` varchar(150) DEFAULT NULL,
  `UnitUrlApi` varchar(150) DEFAULT NULL,
  `UnitKeyApi` varchar(150) DEFAULT NULL,
  `UnitServiceAddress` varchar(255) DEFAULT NULL,
  `UnitIsHirarki` enum('Ya','Tidak') DEFAULT 'Tidak',
  `UnitDescription` varchar(255) DEFAULT NULL,
  `UnitAddUserId` int(11) DEFAULT NULL,
  `UnitAddTime` datetime DEFAULT NULL,
  `UnitUpdateUserId` int(11) DEFAULT NULL,
  `UnitUpdateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`UnitId`),
  UNIQUE KEY `NewIndex1` (`UnitName`),
  KEY `NewIndex1s` (`UnitDescription`),
  KEY `FK_ci_unit_add_user` (`UnitAddUserId`),
  KEY `FK_ci_unit_update_user` (`UnitUpdateUserId`),
  CONSTRAINT `FK_sys_unit_user_add` FOREIGN KEY (`UnitAddUserId`) REFERENCES `sys_user` (`UserId`) ON UPDATE CASCADE,
  CONSTRAINT `FK_sys_unit_user_update` FOREIGN KEY (`UnitUpdateUserId`) REFERENCES `sys_user` (`UserId`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

/*Data for the table `sys_unit` */

insert  into `sys_unit`(`UnitId`,`UnitKode`,`UnitName`,`UnitUrlApi`,`UnitKeyApi`,`UnitServiceAddress`,`UnitIsHirarki`,`UnitDescription`,`UnitAddUserId`,`UnitAddTime`,`UnitUpdateUserId`,`UnitUpdateTime`) values (23,'1',NULL,NULL,NULL,NULL,'Tidak',NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `sys_user` */

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `UserId` int(11) NOT NULL AUTO_INCREMENT,
  `UserRealName` varchar(250) DEFAULT NULL,
  `UserName` varchar(150) DEFAULT NULL,
  `UserEmail` varchar(150) DEFAULT NULL,
  `UserPassword` varchar(80) DEFAULT NULL,
  `UserSalt` varchar(10) DEFAULT NULL,
  `UserKey` varchar(100) DEFAULT NULL,
  `UserFoto` varchar(250) DEFAULT NULL,
  `UserIsActive` enum('1','0') DEFAULT '1',
  `UserUnitId` int(11) DEFAULT NULL,
  `UserRoleId` tinyint(4) DEFAULT NULL,
  `UserBanned` tinyint(1) DEFAULT '0',
  `UserBanText` text,
  `UserNewEmail` varchar(100) DEFAULT NULL,
  `UserNewEmailKey` varchar(50) DEFAULT NULL,
  `UserLastIp` varchar(45) DEFAULT NULL,
  `UserLastLogin` datetime DEFAULT NULL,
  `UserPassUpdatedUser` varchar(255) DEFAULT NULL,
  `UserPassUpdatedTime` datetime DEFAULT NULL,
  `UserAddUser` varchar(255) DEFAULT NULL,
  `UserAddTime` datetime DEFAULT NULL,
  `UserUpdateUser` varchar(255) DEFAULT NULL,
  `UserUpdateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`UserId`),
  UNIQUE KEY `NewIndex1` (`UserName`),
  KEY `FK_sys_userrole` (`UserRoleId`),
  KEY `FK_sys_user_unit` (`UserUnitId`),
  CONSTRAINT `FK_sys_user_unit` FOREIGN KEY (`UserUnitId`) REFERENCES `sys_unit` (`UnitId`) ON DELETE SET NULL ON UPDATE NO ACTION,
  CONSTRAINT `FK_sys_userrole` FOREIGN KEY (`UserRoleId`) REFERENCES `sys_role` (`roleId`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

/*Data for the table `sys_user` */

insert  into `sys_user`(`UserId`,`UserRealName`,`UserName`,`UserEmail`,`UserPassword`,`UserSalt`,`UserKey`,`UserFoto`,`UserIsActive`,`UserUnitId`,`UserRoleId`,`UserBanned`,`UserBanText`,`UserNewEmail`,`UserNewEmailKey`,`UserLastIp`,`UserLastLogin`,`UserPassUpdatedUser`,`UserPassUpdatedTime`,`UserAddUser`,`UserAddTime`,`UserUpdateUser`,`UserUpdateTime`) values (1,'Administrator','admin','admin@uad','20sqgUiJ81mJRLHPzgIgIU7qR8VkOWE3YjIzNGU4','d9a7b234e8','44408skwkkowsk08c4so8kw0kcw8kss0oog00c40','admin.png','1',NULL,NULL,0,NULL,NULL,NULL,'::1','2018-03-28 12:06:37','admin','2016-02-03 03:24:30','root','2013-07-04 10:43:46','admin','2017-01-24 14:06:50');

/*Table structure for table `sys_user_autologin` */

DROP TABLE IF EXISTS `sys_user_autologin`;

CREATE TABLE `sys_user_autologin` (
  `key_id` char(32) COLLATE utf8_bin NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `user_agent` varchar(150) COLLATE utf8_bin NOT NULL,
  `last_ip` varchar(40) COLLATE utf8_bin NOT NULL,
  `last_login` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`key_id`,`user_id`),
  KEY `FK_autologin_user` (`user_id`),
  CONSTRAINT `FK_autologin_user` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`UserId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `sys_user_autologin` */

insert  into `sys_user_autologin`(`key_id`,`user_id`,`user_agent`,`last_ip`,`last_login`) values ('0c4a2e62a0029eea9d67eeef657379a9',1,'Mozilla/5.0 (Windows NT 6.1; rv:41.0) Gecko/20100101 Firefox/41.0 FirePHP/0.7.4','127.0.0.1','2015-10-21 09:33:53'),('2a71f2fa3367d75c48c49902bc680b34',1,'Mozilla/5.0 (Windows NT 6.1; rv:41.0) Gecko/20100101 Firefox/41.0','127.0.0.1','2015-10-31 08:51:38'),('4d8d85a8c92d885e9fdfdc91152fe973',1,'Mozilla/5.0 (Windows NT 6.1; rv:40.0) Gecko/20100101 Firefox/40.0','127.0.0.1','2015-09-28 08:58:22'),('5f1a85463c188a9e0e828146e97d703f',1,'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36','::1','2016-11-24 10:05:36'),('edeaf72ff956b300752b156274af4278',1,'Mozilla/5.0 (Windows NT 6.1; rv:41.0) Gecko/20100101 Firefox/41.0','172.10.154.144','2015-10-27 08:12:41'),('ee4ad6d8aa3e123bc8f91a13f9446bef',1,'Mozilla/5.0 (Windows NT 6.1; rv:40.0) Gecko/20100101 Firefox/40.0 FirePHP/0.7.4','127.0.0.1','2015-09-21 11:44:30');

/*Table structure for table `sys_user_group` */

DROP TABLE IF EXISTS `sys_user_group`;

CREATE TABLE `sys_user_group` (
  `UserGroupId` int(11) NOT NULL AUTO_INCREMENT,
  `UserGroupUserId` int(11) NOT NULL,
  `UserGroupGroupId` int(11) NOT NULL,
  `UserGroupIsDefault` enum('Ya','Tidak') DEFAULT 'Tidak',
  PRIMARY KEY (`UserGroupId`),
  UNIQUE KEY `UNIQUE` (`UserGroupUserId`,`UserGroupGroupId`),
  KEY `FK_ci_user_group` (`UserGroupUserId`),
  KEY `FK_ci_user_groupa` (`UserGroupGroupId`),
  CONSTRAINT `FK_sys_user_group_group` FOREIGN KEY (`UserGroupGroupId`) REFERENCES `sys_group` (`GroupId`) ON DELETE CASCADE,
  CONSTRAINT `FK_sys_user_group_user` FOREIGN KEY (`UserGroupUserId`) REFERENCES `sys_user` (`UserId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=latin1;

/*Data for the table `sys_user_group` */

insert  into `sys_user_group`(`UserGroupId`,`UserGroupUserId`,`UserGroupGroupId`,`UserGroupIsDefault`) values (47,1,0,'Ya');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
