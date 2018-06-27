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
/*Data for the table `auth_character_controller` */

insert  into `auth_character_controller`(`character_id`,`controller`,`action`) values (1,'Admin','auth'),(1,'Admin','character'),(1,'Admin','main'),(1,'Admin','user'),(1,'Admin','usergroup'),(1,'Auth','addCAIgnore'),(1,'Auth','addCharacterCA'),(1,'Auth','delCAIgnore'),(1,'Auth','delCharacterCA'),(1,'Auth','listCA'),(1,'Auth','listCharacterCA'),(1,'Auth','main'),(1,'Index','main'),(1,'User','addCharacter'),(1,'User','addGroup'),(1,'User','addGroupCharacter'),(1,'User','addUser'),(1,'User','addUserCharacter'),(1,'User','banUser'),(1,'User','checkLogin'),(1,'User','delCharacter'),(1,'User','delGroupCharacter'),(1,'User','delUserCharacter'),(1,'User','editUser'),(1,'User','groupList'),(1,'User','listCharacter'),(1,'User','listGroupCharacter'),(1,'User','listUserCharacter'),(1,'User','login'),(1,'User','logined'),(1,'User','logout'),(1,'User','moveGroup'),(1,'User','moveUser'),(1,'User','removeGroup'),(1,'User','removeUser'),(1,'User','renameCharacter'),(1,'User','renameGroup'),(1,'User','searchList'),(1,'User','setGroupCharacter'),(1,'User','userList'),(1,'Vericode','check'),(1,'Vericode','simple');

/*Data for the table `auth_controller` */

insert  into `auth_controller`(`controller`,`action`,`controller_desc`,`action_desc`) values ('Admin','main','管理模块','概述'),('Admin','user','管理模块','用户管理'),('Admin','auth','管理模块','权限列表'),('Admin','usergroup','管理模块','用户组管理'),('Admin','character','管理模块','角色定义'),('Auth','main','权限管理模块','主页面'),('Auth','listCA','权限管理模块','获取CA权限列表'),('Auth','addCAIgnore','权限管理模块','添加CA不验证登录'),('Auth','delCAIgnore','权限管理模块','删除CA不验证登录'),('Auth','listCharacterCA','权限管理模块','列出角色CA'),('Auth','addCharacterCA','权限管理模块','添加角色CA'),('Auth','delCharacterCA','权限管理模块','删除角色CA'),('Foo','main','FooController模块','主页面'),('Index','main','IndexController模块','主页面'),('User','login','用户模块','登陆'),('User','logined','用户模块','登陆成功'),('User','logout','用户模块','注销'),('User','checkLogin','用户模块','检查登陆信息'),('User','groupList','用户模块','获取用户组列表'),('User','addGroup','用户模块','添加用户组'),('User','renameGroup','用户模块','重命名用户组'),('User','moveGroup','用户模块','移动用户组'),('User','setGroupCharacter','用户模块','设置用户组角色'),('User','removeGroup','用户模块','删除用户组'),('User','userList','用户模块','获取用户列表'),('User','searchList','用户模块','搜索用户列表'),('User','addUser','用户模块','添加用户'),('User','editUser','用户模块','修改用户信息'),('User','moveUser','用户模块','移动用户组'),('User','removeUser','用户模块','删除用户'),('User','banUser','用户模块','封禁用户'),('User','listCharacter','用户模块','列出角色'),('User','addCharacter','用户模块','增加角色'),('User','delCharacter','用户模块','删除角色'),('User','renameCharacter','用户模块','角色重命名'),('User','listUserCharacter','用户模块','列出用户角色'),('User','addUserCharacter','用户模块','增加用户角色'),('User','delUserCharacter','用户模块','删除用户角色'),('User','listGroupCharacter','用户模块','列出用户组角色'),('User','addGroupCharacter','用户模块','增加用户组角色'),('User','delGroupCharacter','用户模块','删除用户组角色'),('Vericode','simple','验证码模块','获取验证码'),('Vericode','check','验证码模块','检查验证码');

/*Data for the table `auth_controller_ignore` */

insert  into `auth_controller_ignore`(`controller`,`action`) values ('Core','call'),('Index','main'),('User','checkLogin'),('User','login'),('User','logined'),('Vericode','check'),('Vericode','simple');

/*Data for the table `cache_basic` */

/*Data for the table `character` */

insert  into `character`(`id`,`name`) values (1,'系统管理员');

/*Data for the table `log_admin` */

/*Data for the table `log_user` */

/*Data for the table `runtime_var` */

/*Data for the table `user_character` */

/*Data for the table `user_group` */

insert  into `user_group`(`id`,`name`,`char_list`,`parent`) values (1,'管理员',NULL,0),(2,'普通用户',NULL,0);

/*Data for the table `user_group_character` */

insert  into `user_group_character`(`gid`,`cid`) values (1,1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
