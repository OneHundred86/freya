/*
SQLyog Ultimate v11.24 (32 bit)
MySQL - 5.5.19 : Database - freya
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `auth_character_controller` */

DROP TABLE IF EXISTS `auth_character_controller`;

CREATE TABLE `auth_character_controller` (
  `character_id` int(11) unsigned NOT NULL,
  `controller` varchar(64) NOT NULL,
  `action` varchar(64) NOT NULL,
  PRIMARY KEY (`character_id`,`controller`,`action`),
  KEY `controller` (`controller`),
  KEY `action` (`action`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `auth_controller` */

DROP TABLE IF EXISTS `auth_controller`;

CREATE TABLE `auth_controller` (
  `controller` varchar(64) NOT NULL,
  `action` varchar(64) NOT NULL,
  `controller_desc` varchar(64) NOT NULL,
  `action_desc` varchar(64) NOT NULL,
  KEY `controller` (`controller`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `auth_controller_ignore` */

DROP TABLE IF EXISTS `auth_controller_ignore`;

CREATE TABLE `auth_controller_ignore` (
  `controller` varchar(64) NOT NULL,
  `action` varchar(64) NOT NULL,
  PRIMARY KEY (`controller`,`action`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `cache_basic` */

DROP TABLE IF EXISTS `cache_basic`;

CREATE TABLE `cache_basic` (
  `key` varchar(120) NOT NULL COMMENT '键',
  `value` varchar(1024) NOT NULL COMMENT '值',
  PRIMARY KEY (`key`) COMMENT 'key'
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='基本缓存表';

/*Table structure for table `character` */

DROP TABLE IF EXISTS `character`;

CREATE TABLE `character` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `log_admin` */

DROP TABLE IF EXISTS `log_admin`;

CREATE TABLE `log_admin` (
  `type` varchar(10) NOT NULL,
  `uid` int(11) unsigned NOT NULL,
  `time` int(11) unsigned NOT NULL,
  `data` text NOT NULL,
  KEY `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管理日志';

/*Table structure for table `log_user` */

DROP TABLE IF EXISTS `log_user`;

CREATE TABLE `log_user` (
  `type` varchar(10) NOT NULL COMMENT '类型',
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `data` text NOT NULL COMMENT '数据',
  `time` int(11) NOT NULL COMMENT '执行时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户日志';

/*Table structure for table `runtime_var` */

DROP TABLE IF EXISTS `runtime_var`;

CREATE TABLE `runtime_var` (
  `key` varchar(20) NOT NULL,
  `value` varchar(500) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `user_basic` */

DROP TABLE IF EXISTS `user_basic`;

CREATE TABLE `user_basic` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` varchar(30) NOT NULL COMMENT '用户名',
  `password` varchar(50) NOT NULL COMMENT '密码',
  `salt` varchar(8) NOT NULL COMMENT '加密盐',
  `email` varchar(200) NOT NULL COMMENT '邮箱',
  `regdate` int(11) unsigned NOT NULL COMMENT '注册日期',
  `lastlogin` int(11) unsigned NOT NULL COMMENT '最后登录日期',
  `logintimes` int(11) unsigned NOT NULL COMMENT '登陆次数',
  `lastip` varchar(15) NOT NULL COMMENT '上次登录IP',
  `group` int(11) NOT NULL COMMENT '用户组',
  `ban` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) COMMENT '用户ID主键',
  KEY `group` (`group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户_基本信息表';

/*Table structure for table `user_character` */

DROP TABLE IF EXISTS `user_character`;

CREATE TABLE `user_character` (
  `uid` bigint(20) unsigned NOT NULL,
  `cid` int(11) unsigned NOT NULL,
  PRIMARY KEY (`uid`,`cid`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `user_group` */

DROP TABLE IF EXISTS `user_group`;

CREATE TABLE `user_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(30) NOT NULL COMMENT '名称',
  `char_list` text COMMENT '角色',
  `parent` int(11) unsigned NOT NULL COMMENT '父用户组',
  PRIMARY KEY (`id`) COMMENT 'id',
  KEY `parent` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户组';

/*Table structure for table `user_group_character` */

DROP TABLE IF EXISTS `user_group_character`;

CREATE TABLE `user_group_character` (
  `gid` int(11) unsigned NOT NULL,
  `cid` int(11) unsigned NOT NULL,
  PRIMARY KEY (`gid`,`cid`),
  KEY `gid` (`gid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
