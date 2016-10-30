/*
Navicat MariaDB Data Transfer

Source Server         : app_djtestframework
Source Server Version : 100018
Source Host           : localhost:3306
Source Database       : app_djtestframework

Target Server Type    : MariaDB
Target Server Version : 100018
File Encoding         : 65001

Date: 2015-12-25 21:26:22
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_23962d04_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissi_permission_id_23962d04_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_58c48ba9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_51277a81_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('2', 'Can change log entry', '1', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete log entry', '1', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('4', 'Can add permission', '2', 'add_permission');
INSERT INTO `auth_permission` VALUES ('5', 'Can change permission', '2', 'change_permission');
INSERT INTO `auth_permission` VALUES ('6', 'Can delete permission', '2', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('7', 'Can add group', '3', 'add_group');
INSERT INTO `auth_permission` VALUES ('8', 'Can change group', '3', 'change_group');
INSERT INTO `auth_permission` VALUES ('9', 'Can delete group', '3', 'delete_group');
INSERT INTO `auth_permission` VALUES ('10', 'Can add user', '4', 'add_user');
INSERT INTO `auth_permission` VALUES ('11', 'Can change user', '4', 'change_user');
INSERT INTO `auth_permission` VALUES ('12', 'Can delete user', '4', 'delete_user');
INSERT INTO `auth_permission` VALUES ('13', 'Can add content type', '5', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('14', 'Can change content type', '5', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete content type', '5', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('16', 'Can add session', '6', 'add_session');
INSERT INTO `auth_permission` VALUES ('17', 'Can change session', '6', 'change_session');
INSERT INTO `auth_permission` VALUES ('18', 'Can delete session', '6', 'delete_session');
INSERT INTO `auth_permission` VALUES ('37', 'Can add 日志', '13', 'add_mycustomlog');
INSERT INTO `auth_permission` VALUES ('38', 'Can change 日志', '13', 'change_mycustomlog');
INSERT INTO `auth_permission` VALUES ('39', 'Can delete 日志', '13', 'delete_mycustomlog');
INSERT INTO `auth_permission` VALUES ('40', 'Can add 手机版接口', '14', 'add_mobileservice');
INSERT INTO `auth_permission` VALUES ('41', 'Can change 手机版接口', '14', 'change_mobileservice');
INSERT INTO `auth_permission` VALUES ('42', 'Can delete 手机版接口', '14', 'delete_mobileservice');
INSERT INTO `auth_permission` VALUES ('43', 'Can add TV版接口', '15', 'add_tvservice');
INSERT INTO `auth_permission` VALUES ('44', 'Can change TV版接口', '15', 'change_tvservice');
INSERT INTO `auth_permission` VALUES ('45', 'Can delete TV版接口', '15', 'delete_tvservice');
INSERT INTO `auth_permission` VALUES ('46', 'Can add 插件接口', '16', 'add_pluginservice');
INSERT INTO `auth_permission` VALUES ('47', 'Can change 插件接口', '16', 'change_pluginservice');
INSERT INTO `auth_permission` VALUES ('48', 'Can delete 插件接口', '16', 'delete_pluginservice');
INSERT INTO `auth_permission` VALUES ('49', 'Can add 开放平台接口', '17', 'add_openservice');
INSERT INTO `auth_permission` VALUES ('50', 'Can change 开放平台接口', '17', 'change_openservice');
INSERT INTO `auth_permission` VALUES ('51', 'Can delete 开放平台接口', '17', 'delete_openservice');
INSERT INTO `auth_permission` VALUES ('52', 'Can add 环境配置', '18', 'add_server');
INSERT INTO `auth_permission` VALUES ('53', 'Can change 环境配置', '18', 'change_server');
INSERT INTO `auth_permission` VALUES ('54', 'Can delete 环境配置', '18', 'delete_server');
INSERT INTO `auth_permission` VALUES ('55', 'Can add 执行结果', '19', 'add_result');
INSERT INTO `auth_permission` VALUES ('56', 'Can change 执行结果', '19', 'change_result');
INSERT INTO `auth_permission` VALUES ('57', 'Can delete 执行结果', '19', 'delete_result');
INSERT INTO `auth_permission` VALUES ('58', 'Can add 组合接口', '20', 'add_module');
INSERT INTO `auth_permission` VALUES ('59', 'Can change 组合接口', '20', 'change_module');
INSERT INTO `auth_permission` VALUES ('60', 'Can delete 组合接口', '20', 'delete_module');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES ('1', 'pbkdf2_sha256$20000$YYRcgEqtzk1a$RIgr1ANFAGjw69GNUqlGT9g+BcsHfJ4jdQeSlxZjaDI=', '2015-12-19 06:20:04', '1', 'ryan', '', '', 'ryan@zxye.me', '1', '1', '2015-12-19 06:19:57');

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_30a071c9_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_30a071c9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_24702650_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_perm_permission_id_3d7071f0_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_perm_permission_id_3d7071f0_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_7cd7acb6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_5151027a_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_1c5f563_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin__content_type_id_5151027a_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_1c5f563_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_3ec8c61c_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('4', 'auth', 'user');
INSERT INTO `django_content_type` VALUES ('5', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('13', 'log', 'mycustomlog');
INSERT INTO `django_content_type` VALUES ('14', 'migu', 'mobileservice');
INSERT INTO `django_content_type` VALUES ('20', 'migu', 'module');
INSERT INTO `django_content_type` VALUES ('17', 'migu', 'openservice');
INSERT INTO `django_content_type` VALUES ('16', 'migu', 'pluginservice');
INSERT INTO `django_content_type` VALUES ('19', 'migu', 'result');
INSERT INTO `django_content_type` VALUES ('18', 'migu', 'server');
INSERT INTO `django_content_type` VALUES ('15', 'migu', 'tvservice');
INSERT INTO `django_content_type` VALUES ('6', 'sessions', 'session');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2015-12-19 05:58:37');
INSERT INTO `django_migrations` VALUES ('2', 'auth', '0001_initial', '2015-12-19 05:58:43');
INSERT INTO `django_migrations` VALUES ('3', 'admin', '0001_initial', '2015-12-19 05:58:44');
INSERT INTO `django_migrations` VALUES ('4', 'contenttypes', '0002_remove_content_type_name', '2015-12-19 05:58:45');
INSERT INTO `django_migrations` VALUES ('5', 'auth', '0002_alter_permission_name_max_length', '2015-12-19 05:58:46');
INSERT INTO `django_migrations` VALUES ('6', 'auth', '0003_alter_user_email_max_length', '2015-12-19 05:58:47');
INSERT INTO `django_migrations` VALUES ('7', 'auth', '0004_alter_user_username_opts', '2015-12-19 05:58:47');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0005_alter_user_last_login_null', '2015-12-19 05:58:47');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0006_require_contenttypes_0002', '2015-12-19 05:58:47');
INSERT INTO `django_migrations` VALUES ('10', 'log', '0001_initial', '2015-12-19 05:58:49');
INSERT INTO `django_migrations` VALUES ('11', 'log', '0002_mycustomlog', '2015-12-19 05:58:49');
INSERT INTO `django_migrations` VALUES ('12', 'migu', '0001_initial', '2015-12-19 05:58:52');
INSERT INTO `django_migrations` VALUES ('13', 'migu', '0002_auto_20151218_0452', '2015-12-19 05:58:54');
INSERT INTO `django_migrations` VALUES ('14', 'sessions', '0001_initial', '2015-12-19 05:58:54');
INSERT INTO `django_migrations` VALUES ('15', 'log', '0003_auto_20151219_1859', '2015-12-19 10:59:09');
INSERT INTO `django_migrations` VALUES ('16', 'migu', '0003_auto_20151225_0945', '2015-12-25 12:16:46');

-- ----------------------------
-- Table structure for django_my_custom_log
-- ----------------------------
DROP TABLE IF EXISTS `django_my_custom_log`;
CREATE TABLE `django_my_custom_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `asctime` datetime NOT NULL,
  `created` double NOT NULL,
  `funcName` varchar(255) DEFAULT NULL,
  `levelname` varchar(255) NOT NULL,
  `lineno` int(11) NOT NULL,
  `module` varchar(255) NOT NULL,
  `message` longtext NOT NULL,
  `pathname` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_my_custom_log
-- ----------------------------

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_session
-- ----------------------------

-- ----------------------------
-- Table structure for migu_mobile_service
-- ----------------------------
DROP TABLE IF EXISTS `migu_mobile_service`;
CREATE TABLE `migu_mobile_service` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `service` varchar(50) NOT NULL,
  `version` varchar(5) NOT NULL,
  `data` longtext NOT NULL,
  `description` longtext,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `migu_mobile_service_version_uniq` (`version`,`service`)
) ENGINE=InnoDB AUTO_INCREMENT=206 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of migu_mobile_service
-- ----------------------------
INSERT INTO `migu_mobile_service` VALUES ('1', '评论接口', 'comment', '2.0', '{\"from\": 1230208, \"pid\": \"\", \"content\": \"仲夏叶评论仲夏叶的歌曲作品《暗涌》\", \"to\": 1230208, \"tag\": [\"娇媚无骨入艳三分\"], \"rid\": \"79ff9aae81ac4bcbb06031713b9eb730\", \"type\": \"mv\"}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('2', '删除评论接口', 'delComment', '2.0', '{\"uid\": 1230208, \"uuid\": \"332a51a9b8c44c97a23aded0165e348c\"}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('3', '点赞接口', 'followMV', '2.0', '{\"mid\": \"79ff9aae81ac4bcbb06031713b9eb730\", \"uid\": 1230208}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('4', '关注用户接口', 'followUser', '2.0', '{\"uid\": 1230208, \"fid\": 2635274}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('5', '查询评论接口', 'listComment', '2.0', '{\"rid\": \"79ff9aae81ac4bcbb06031713b9eb730\", \"limit\": 10, \"page\": 1}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('6', '查询好友动态接口', 'listFriendsDynamic', '2.0', '{\"limit\": 10, \"uid\": 1230208, \"page\": 1}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('7', '查看fans接口', 'listFans', '2.0', '{\"limit\": 10, \"uid\": 1230208, \"page\": 1}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('8', '查询用户点赞MV作品接口', 'listFollowMV', '2.0', '{\"limit\": 10, \"uid\": 1230208, \"page\": 1}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('9', '查询对mv点赞的用户接口', 'listFollowMVUser', '2.0', '{\"limit\": 10, \"mid\": \"79ff9aae81ac4bcbb06031713b9eb730\", \"page\": 1}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('10', '查看用户MV作品接口', 'listUserMV', '2.0', '{\"status\": [\"active\"], \"tag\": \"\", \"limit\": 10, \"uid\": 1228507, \"page\": 1}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('11', '修改昵称接口', 'modifyNickname', '2.0', '{\"nickname\": \"仲夏叶\", \"uid\": 1230208}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('12', '修改密码接口', 'modifyPassword', '2.0', '{\"newPassword\": \"123456\", \"oldPassword\": \"123456\", \"uid\": 1230208}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('13', '保存用户token接口', 'cmccToken', '2.0', '{\"token\": \"w11RWiraaGmGXg4TglUyMr7e8mnO0whT\", \"uid\": 1230208}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('14', '制作MV接口', 'makeMV', '2.0', '{\"city\": \"成都市\", \"serverValue\": \"\", \"uid\": 1230208, \"gisTag\": \"孵化园(地铁站)\", \"pieceSize\": \"1024\", \"device\": \"android\", \"totalSize\": \"1024\", \"serverKey\": \"\", \"mtid\": \"0b9b3c8fc83e40238eb10c49f818b3f4\", \"start\": \"0\", \"tag\": \"成都市\", \"currentPieceSize\": \"1024\", \"sn\": \"makeMV_sn_400088\", \"coverId\": \"\", \"sid\": \"79ff9aae81ac4bcbb06031713b9eb730\", \"lat\": \"30.654321\", \"lng\": \"104.0123\", \"desc\": \"制作MV描述\", \"startPosition\": \"1\", \"pieceMd5\": \"pieceMd5\", \"name\": \"万里长城永不倒\"}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('15', '修改签名接口', 'modifySignature', '2.0', '{\"uid\": 1230208, \"signature\": \"修改签名接口\"}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('16', '用户登录接口', 'login', '2.0', '{\"guid\": \"guid\", \"password\": \"123456\", \"os\": \"android\", \"phoneOrEmail\": \"18782947838\"}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('17', '用户注册接口', 'userRegisterService', '2.0', '{\"password\": \"123456\", \"os\": \"android\", \"poster\": \"http://acmain.migu.cn:90/group1/M00/01/03/ChmFyFYbBq2AJa90AAEs8aIP71M319.jpg\", \"phone\": \"18782947838\", \"gender\": \"male\", \"guid\": \"guid\", \"nickname\": \"仲夏叶\"}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('18', '个人主页接口', 'showUserDetail', '2.0', '{\"oid\": 1230208, \"uid\": 1230208}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('20', '检查手机是否注册接口', 'checkPhone', '2.0', '{\"phone\": \"18782947838\"}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('21', '登录检查接口', 'checkLogin', '2.0', '{\"token\": \"w11RWiraaGmGXg4TglUyMr7e8mnO0whT\", \"uid\": 1230208}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('23', '根据Tag查询MV模板接口', 'listMVTemplate', '2.0', '{\"tag\": [\"心情\"], \"limit\": 10, \"page\": 1}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('24', '根据Tag查询MV接口', 'listMV', '2.0', '{\"tag\": \"成都市\", \"limit\": 10, \"page\": 1, \"order\": \"hot\"}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('25', '自然语义标签接口', 'listNatureTag', '2.0', '{\"limit\": 10, \"page\": 1}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('26', '编辑用户信息接口(v2.0)', 'editUser', '2.0', '{\"city\": \"成都市\", \"uid\": 2927796, \"gender\": \"male\", \"age\": 24, \"signature\": \"最是那一低头的温柔，像一朵水莲花不胜凉风的娇羞，道一声珍重，道一声珍重，那一声珍重里有蜜甜的忧愁——沙扬娜拉！\", \"poster\": \"http://acmain.migu.cn:90/group1/M00/01/03/ChmFyFYbBq2AJa90AAEs8aIP71M319.jpg\", \"birthday\": \"1991-08-22\", \"address\": \"美城云庭\", \"lat\": 31.5, \"lng\": 103.4, \"nickname\": \"仲夏叶\"}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('27', '查询推荐标签接口', 'listRecommendTag', '2.0', '{\"limit\": 10, \"page\": 1}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('28', '查询主题歌单接口', 'listSongList', '2.0', '{\"limit\": 10, \"page\": 1}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('29', '获取系统时间接口', 'systemTime', '2.0', '{}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('30', '上传和绑定接口', 'userBind', '2.0', '{\"uid\": 1230208, \"idStr\": \"tencent_CC3B2133401F05312A8333B1A4DDA0A7\", \"name\": \"叶尔羌\", \"source\": \"tencent\", \"avatar\": \"http://qzapp.qlogo.cn/qzapp/100526240/CC3B2133401F05312A8333B1A4DDA0A7/100\", \"screenName\": \"叶尔羌\"}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('31', 'MV播放接口', 'incMvPlay', '2.0', '{\"mid\": \"79ff9aae81ac4bcbb06031713b9eb730\"}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('32', '检查用户是否关注MV接口', 'checkFollowMV', '2.0', '{\"uid\": 1230208, \"mids\": [\"79ff9aae81ac4bcbb06031713b9eb730\"]}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('33', '检查手机是否注册接口', 'checkNickname', '2.0', '{\"nickname\": \"﻿叶尔羌\"}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('34', '删除MV接口', 'delMV', '2.0', '{\"uid\": 1230208, \"uuid\": \"4744a4bfbb5c42bd82248cc239af63d7\"}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('35', 'MV分享次数接口', 'incMvShare', '2.0', '{\"platform\": \"qqzone\", \"from\": 1230208, \"mid\": \"79ff9aae81ac4bcbb06031713b9eb730\"}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('37', '查询我的TAG接口', 'listMyTag', '2.0', '{\"limit\": 10, \"uid\": 1230208, \"page\": 1}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('38', '第三方用户登录接口', 'tLogin', '2.0', '{\"openId\": \"CC3B2133401F05312A8333B1A4DDA0A7\", \"guid\": \"guid\", \"source\": \"tencent\"}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('39', '取消关注用户接口', 'unFollowUser', '2.0', '{\"uid\": 1230208, \"fid\": 2635274}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('40', '第三方注册接口', 'tUserRegisterService', '2.0', '{\"province\": \"四川省\", \"openId\": \"CC3B2133401F05312A8333B1A4DDA0A7\", \"name\": \"叶尔羌\", \"city\": \"成都市\", \"gender\": \"male\", \"description\": \"第三方注册接口\", \"os\": \"android\", \"profileImageUrl\": \"http://qzapp.qlogo.cn/qzapp/100526240/CC3B2133401F05312A8333B1A4DDA0A7/100\", \"profileUrl\": \"http://about.me/stornado\", \"source\": \"tencent\", \"avatarLarge\": \"http://qzapp.qlogo.cn/qzapp/100526240/CC3B2133401F05312A8333B1A4DDA0A7/100\", \"location\": \"剑南大道南段338号\", \"poster\": \"http://qzapp.qlogo.cn/qzapp/100526240/CC3B2133401F05312A8333B1A4DDA0A7/100\", \"guid\": \"guid\", \"nickname\": \"叶尔羌\", \"screenName\": \"叶尔羌\"}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('41', '上传头像接口', 'uploadUserHeader', '2.0', '{}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('42', '获取验证码接口', 'getVerificationCode', '2.0', '{\"emailOrPhone\": \"18782947838\", \"serviceType\": \"104\", \"type\": \"phone\"}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('43', '检查验证码接口', 'checkVerificationCode', '2.0', '{\"emailOrPhone\": \"18782947838\", \"serviceType\": \"104\", \"type\": \"phone\", \"verifyCode\": \"123456\"}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('44', '退出登录接口', 'logout', '2.0', '{\"uid\": 1230208}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('45', '根据id集合查询歌曲接口', 'listSongs', '2.0', '{\"ids\": [\"98eeb355105a42aa97eaa458945bc203\"]}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('46', '检查用户关系接口', 'checkRelation', '2.0', '{\"uid\": 1230208, \"oids\": [\"2635274\"]}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('47', '查看我的关注接口', 'listFollowUser', '2.0', '{\"limit\": 10, \"uid\": 1230208, \"page\": 1}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('48', '模糊查询tag接口', 'listTag', '2.0', '{\"limit\": 10, \"tag\": \"\", \"type\": \"mv\", \"page\": 1}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('49', '举报接口', 'report', '2.0', '{\"rid\": \"2635274\", \"type\": \"user\", \"uid\": 1230208, \"reasonType\": \"other\", \"desc\": \"举报接口\"}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('50', '意见反馈', 'feedback', '2.0', '{\"content\": \"反馈接口\", \"uid\": 1230208}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('51', '重新制作MV接口', 'reMakeMV', '2.0', '{\"uid\": 1230208, \"uuid\": \"uuid_reMakeMV\"}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('52', '根据tag查询制作mv的用户接口', 'listMVUser', '2.0', '{\"tag\": \"成都市\", \"limit\": 10, \"page\": 1}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('53', '取消点赞接口', 'unFollowMV', '2.0', '{\"uid\": 1230208, \"mid\": \"79ff9aae81ac4bcbb06031713b9eb730\"}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('54', '获取最新版本接口v.20', 'getLastVersion', '2.0', '{\"channel\": \"0146585\", \"versionType\": \"android\"}', '{\r\n    \"channel\": [\r\n        \"014002F\",\r\n        \"014002F_mgh1\",\r\n        \"014002J\",\r\n        \"014002J_mgh2\",\r\n        \"014093Y\",\r\n        \"014093Z\",\r\n        \"0140941\",\r\n        \"0140942\",\r\n        \"0140943\",\r\n        \"0140944\",\r\n        \"0140945\",\r\n        \"0140946\",\r\n        \"0140947\",\r\n        \"0140948\",\r\n        \"0140949\",\r\n        \"014094A\",\r\n        \"014094B\",\r\n        \"014094C\",\r\n        \"014094D\",\r\n        \"014094E\",\r\n        \"014094F\",\r\n        \"014094G\",\r\n        \"014094H\",\r\n        \"014094I\",\r\n        \"014094J\",\r\n        \"014094K\",\r\n        \"014094L\",\r\n        \"014094M\",\r\n        \"014094N\",\r\n        \"014094O\",\r\n        \"014094P\",\r\n        \"014094Q\",\r\n        \"014094R\",\r\n        \"014094S\",\r\n        \"014094T\",\r\n        \"014094U\",\r\n        \"014094V\",\r\n        \"014094W\",\r\n        \"014095X\",\r\n        \"014095Z\",\r\n        \"014652C\",\r\n        \"014656D_uc01\",\r\n        \"014656D_uc02\",\r\n        \"0146585\",\r\n        \"014658Q\",\r\n        \"014658R\",\r\n        \"014658S\",\r\n        \"014658T_gong3\",\r\n        \"014658T\",\r\n        \"014658U\",\r\n        \"014658V\",\r\n        \"014658X\",\r\n        \"014658Y\",\r\n        \"014658Z\",\r\n        \"0146618_sz01\",\r\n        \"014661C\",\r\n        \"0146663\",\r\n        \"0146673\",\r\n        \"0146683\",\r\n        \"0146693\",\r\n        \"0146703\",\r\n        \"0146718_wd01\",\r\n        \"0146718_wd02\",\r\n        \"0146718_wd03\",\r\n        \"0146718_wd04\",\r\n        \"0146718_wd05\",\r\n        \"0146718_wd06\",\r\n        \"0146718_wd07\",\r\n        \"0146718_wd08\",\r\n        \"0146718_wd09\",\r\n        \"0146718_wd10\",\r\n        \"0146723\",\r\n        \"0146723_my01\",\r\n        \"0146733\",\r\n        \"0146743\",\r\n        \"0146753\",\r\n        \"0146763\",\r\n        \"0146773\",\r\n        \"0146783\",\r\n        \"0146793_3g01\",\r\n        \"0146793_3g02\",\r\n        \"0146793_3g03\",\r\n        \"0146793_3g04\",\r\n        \"0146793_3g05\",\r\n        \"0146793_3g06\",\r\n        \"0146793_3g07\",\r\n        \"0146793_3g08\",\r\n        \"0146836\",\r\n        \"0146854_fz01\",\r\n        \"0146854_fz02\",\r\n        \"0146854_fz03\",\r\n        \"0146854_fz04\",\r\n        \"0146854_fz05\",\r\n        \"0146854_fz06\",\r\n        \"0146854_fz07\",\r\n        \"0146854_fz08\",\r\n        \"0146854_fz09\",\r\n        \"0146854_fz10\",\r\n        \"0146854_fz11\",\r\n        \"0146854_fz12\",\r\n        \"0146854_fz13\",\r\n        \"0146854_fz14\",\r\n        \"0146854_fz15\",\r\n        \"0146854_fz16\",\r\n        \"0146854_fz17\",\r\n        \"0146854_fz18\",\r\n        \"0146854_fz19\",\r\n        \"0146854_fz20\",\r\n        \"0146863_yh01\",\r\n        \"0146863_yh02\",\r\n        \"0146863_yh03\",\r\n        \"0146863_yh04\",\r\n        \"0146863_yh05\",\r\n        \"014687U\",\r\n        \"014687Y\",\r\n        \"014687Z_0001\",\r\n        \"014687Z_0002\",\r\n        \"014687Z_0003\",\r\n        \"014687Z_0004\",\r\n        \"014687Z_0005\",\r\n        \"014687Z_0006\",\r\n        \"014687Z_0007\",\r\n        \"014687Z_0008\",\r\n        \"014687Z_0009\",\r\n        \"014687Z_0010\",\r\n        \"014687Z_0011\",\r\n        \"014687Z_0012\",\r\n        \"014687Z_0013\",\r\n        \"014687Z_0015\",\r\n        \"014687Z_gd01\",\r\n        \"014687Z_ss01\",\r\n        \"0146883_sjnz\",\r\n        \"0146883_zx01\",\r\n        \"0146883_zx02\",\r\n        \"0146883_zx03\",\r\n        \"0146893\",\r\n        \"0146903\",\r\n        \"0146907\",\r\n        \"0146923\",\r\n        \"0146923_lmlt\",\r\n        \"0146933\",\r\n        \"0146933_tmmh\",\r\n        \"0146943\",\r\n        \"0146943_sgzs\",\r\n        \"0146953\",\r\n        \"0146957\",\r\n        \"0146961\",\r\n        \"0146962\",\r\n        \"0146963\",\r\n        \"0146972\",\r\n        \"014698B\",\r\n        \"0146993\",\r\n        \"0146993_ly01\",\r\n        \"0146993_ly02\",\r\n        \"0147004\",\r\n        \"0147012\",\r\n        \"0147013\",\r\n        \"0147013_kz01\",\r\n        \"0147013_kz02\",\r\n        \"0147013_kz03\",\r\n        \"0147013_kz04\",\r\n        \"0147013_kz05\",\r\n        \"0147013_kz06\",\r\n        \"0147013_kz07\",\r\n        \"0147013_kz08\",\r\n        \"0147013_kz09\",\r\n        \"0147013_kz10\",\r\n        \"0147017\",\r\n        \"0147022_nm01\",\r\n        \"0147022_nm02\",\r\n        \"0147022_nm03\",\r\n        \"0147022_nm04\",\r\n        \"0147022_nm05\",\r\n        \"0147022_nm06\",\r\n        \"0147022_nm07\",\r\n        \"0147022_nm08\",\r\n        \"0147022_nm09\",\r\n        \"0147022_nm10\",\r\n        \"0147022_nm11\",\r\n        \"0147022_nm12\",\r\n        \"0147022_nm13\",\r\n        \"0147022_nm14\",\r\n        \"0147022_nm15\",\r\n        \"0147022_nm16\",\r\n        \"0147022_nm17\",\r\n        \"0147022_nm18\",\r\n        \"0147022_nm19\",\r\n        \"0147022_nm20\",\r\n        \"0147032_mp01\",\r\n        \"0147032_mp02\",\r\n        \"0147032_mp03\",\r\n        \"0147032_mp04\",\r\n        \"0147032_sk01\",\r\n        \"0147032_sk02\",\r\n        \"0147036\",\r\n        \"0147042_jz01\",\r\n        \"0147042_jz02\",\r\n        \"0147042_jz03\",\r\n        \"0147042_jz04\",\r\n        \"0147042_jz05\",\r\n        \"0147042_jz06\",\r\n        \"0147042_jz07\",\r\n        \"0147042_jz08\",\r\n        \"0147042_jz09\",\r\n        \"0147042_jz10\",\r\n        \"0147042_jz11\",\r\n        \"0147042_jz12\",\r\n        \"0147042_jz13\",\r\n        \"0147042_jz14\",\r\n        \"0147042_jz15\",\r\n        \"0147042_jz16\",\r\n        \"0147042_jz17\",\r\n        \"0147042_jz18\",\r\n        \"0147042_jz19\",\r\n        \"0147042_jz20\",\r\n        \"0147063_hs01\",\r\n        \"0147063_hs02\",\r\n        \"0147063_hs03\",\r\n        \"0147063_hs04\",\r\n        \"0147063_hs05\",\r\n        \"0147063_hs06\",\r\n        \"0147063_hs07\",\r\n        \"0147063_hs08\",\r\n        \"0147063_hs09\",\r\n        \"0147063_hs10\",\r\n        \"0147063_hs11\",\r\n        \"0147063_hs12\",\r\n        \"0147063_hs13\",\r\n        \"0147063_hs14\",\r\n        \"0147063_hs15\",\r\n        \"0147063_hs16\",\r\n        \"0147063_hs17\",\r\n        \"0147063_hs18\",\r\n        \"0147063_hs19\",\r\n        \"0147063_hs20\",\r\n        \"0147071\",\r\n        \"0147071_xf01\",\r\n        \"0147071_xf02\",\r\n        \"0147083_jj01\",\r\n        \"0147083_jj02\",\r\n        \"0147083_jj03\",\r\n        \"0147083_jj04\",\r\n        \"0147083_jj05\",\r\n        \"0147101_kd01\",\r\n        \"0147101_kd02\",\r\n        \"0147101_kd03\",\r\n        \"0147101_kd04\",\r\n        \"0147101_kd05\",\r\n        \"0147101_kd06\",\r\n        \"0147101_kd07\",\r\n        \"0147101_kd08\",\r\n        \"0147101_kd09\",\r\n        \"0147101_kd10\",\r\n        \"0147101_kd11\",\r\n        \"0147101_kd12\",\r\n        \"0147101_kd13\",\r\n        \"0147101_kd14\",\r\n        \"0147101_kd15\",\r\n        \"0147101_kd16\",\r\n        \"0147101_kd17\",\r\n        \"0147101_kd18\",\r\n        \"0147101_kd19\",\r\n        \"0147101_kd20\",\r\n        \"0147101_kd21\",\r\n        \"0147101_kd22\",\r\n        \"0147101_kd23\",\r\n        \"0147101_kd24\",\r\n        \"0147101_kd25\",\r\n        \"0147101_kd26\",\r\n        \"0147101_kd27\",\r\n        \"0147101_kd28\",\r\n        \"0147101_kd29\",\r\n        \"0147101_kd30\",\r\n        \"0147101_kd31\",\r\n        \"0147101_kd32\",\r\n        \"0147101_kd33\",\r\n        \"0147101_kd34\",\r\n        \"0147101_kd35\",\r\n        \"0147101_kd36\",\r\n        \"0147101_kd37\",\r\n        \"0147101_kd38\",\r\n        \"0147101_kd39\",\r\n        \"0147101_kd40\",\r\n        \"0147101_kd41\",\r\n        \"0147101_kd42\",\r\n        \"0147113\",\r\n        \"014711B\",\r\n        \"014711C\",\r\n        \"014711D\",\r\n        \"014711I\",\r\n        \"014711J\",\r\n        \"014711K\",\r\n        \"014711L\",\r\n        \"014711Y\",\r\n        \"0147133_tt01\",\r\n        \"0147137\",\r\n        \"0147143_zr01\",\r\n        \"0147143_zr02\",\r\n        \"0147143_zr03\",\r\n        \"0147143_zr04\",\r\n        \"0147143_zr05\",\r\n        \"0147143_zr06\",\r\n        \"0147143_zr07\",\r\n        \"0147143_zr08\",\r\n        \"0147143_zr09\",\r\n        \"0147143_zr10\",\r\n        \"0147143_zr11\",\r\n        \"0147143_zr12\",\r\n        \"0147143_zr13\",\r\n        \"0147143_zr14\",\r\n        \"0147143_zr15\",\r\n        \"0147143_zr16\",\r\n        \"0147143_zr17\",\r\n        \"0147143_zr18\",\r\n        \"0147143_zr19\",\r\n        \"0147143_zr20\",\r\n        \"0147153\",\r\n        \"0147183_jb01\",\r\n        \"0147183_jb02\",\r\n        \"0147183_jb03\",\r\n        \"0147183_jb04\",\r\n        \"0147183_jb05\",\r\n        \"0147183_jb06\",\r\n        \"0147183_jb07\",\r\n        \"0147183_jb08\",\r\n        \"0147183_jb09\",\r\n        \"0147183_jb10\",\r\n        \"0147183_jb11\",\r\n        \"0147183_jb12\",\r\n        \"0147183_jb13\",\r\n        \"0147183_jb14\",\r\n        \"0147183_jb15\",\r\n        \"0147187\",\r\n        \"0147193_xq01\",\r\n        \"0147193_xq02\",\r\n        \"0147193_xq03\",\r\n        \"0147193_xq04\",\r\n        \"0147193_xq05\",\r\n        \"0147193_xq06\",\r\n        \"0147193_xq07\",\r\n        \"0147193_xq08\",\r\n        \"0147193_xq09\",\r\n        \"0147193_xq10\",\r\n        \"0147213_ht01\",\r\n        \"0147213_ht02\",\r\n        \"0147213_ht03\",\r\n        \"0147213_ht04\",\r\n        \"0147213_ht05\",\r\n        \"0147223_sx01\",\r\n        \"0147233_fb01\",\r\n        \"0147233_fb02\",\r\n        \"0147233_fb03\",\r\n        \"0147243_ml01\",\r\n        \"0147243_ml02\",\r\n        \"0147243_ml03\",\r\n        \"0147243_ml04\",\r\n        \"0147243_ml05\",\r\n        \"0147243_ml06\",\r\n        \"0147243_ml07\",\r\n        \"0147243_ml08\",\r\n        \"0147243_ml09\",\r\n        \"0147253\",\r\n        \"0147263\",\r\n        \"0147273\",\r\n        \"0147285\",\r\n        \"0147286\",\r\n        \"0147287\",\r\n        \"0147288\",\r\n        \"014728R\",\r\n        \"014728S\",\r\n        \"014728T\",\r\n        \"014728U\",\r\n        \"014728V\",\r\n        \"014728W\",\r\n        \"014728X\",\r\n        \"014728X_yist\",\r\n        \"014728Y\",\r\n        \"014728Z\",\r\n        \"014730F\",\r\n        \"014730G\",\r\n        \"014730H\",\r\n        \"014731K\",\r\n        \"014731L\",\r\n        \"014731M\",\r\n        \"0147333\",\r\n        \"0147343\",\r\n        \"0147353\",\r\n        \"0147363\",\r\n        \"0147373\"\r\n    ]\r\n}', '1');
INSERT INTO `migu_mobile_service` VALUES ('55', '用户行为接口', 'userBehavior', '2.0', '{\"device\": \"android\", \"code\": \"CODE_HEARTBEEP\", \"uid\": 1230208}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('56', '绑定手机接口', 'bindPhone', '2.0', '{\"phone\": \"18782947838\", \"password\": \"123456\", \"uid\": 1230208}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('57', '绑定email接口', 'bindEmail', '2.0', '{\"password\": \"123456\", \"uid\": 1230208, \"email\": \"xwxia@iflytek.com\"}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('58', '重置密码', 'resetPassword', '2.0', '{\"emailOrPhone\": \"18782947838\", \"password\": \"123456\", \"code\": \"\", \"type\": \"phone\", \"serviceType\": \"103\"}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('59', '检查email是否注册接口', 'checkEmail', '2.0', '{\"email\": \"xwxia@iflytek.com\"}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('60', 'K歌房列表', 'kRoomList', '2.0', '{\"limit\": 10, \"page\": 1, \"key\": \"咪咕\"}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('61', 'K歌房验证密码', 'kRoomAgreement', '2.0', '{\"token\": \"w11RWiraaGmGXg4TglUyMr7e8mnO0whT\", \"password\": \"123456\", \"uid\": 1230208, \"kRoomId\": \"4347de11af4745fcb74e5659280e6c4a\"}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('62', 'K歌房删除评论', 'kRoomCommentDel', '2.0', '{\"token\": \"w11RWiraaGmGXg4TglUyMr7e8mnO0whT\", \"kRoomCommentId\": \"kRoomCommentId\", \"uid\": 1230208, \"kRoomId\": \"4347de11af4745fcb74e5659280e6c4a\"}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('63', 'K歌房评论列表', 'kRoomCommentList', '2.0', '{\"limit\": 10, \"page\": 1, \"kRoomId\": \"4347de11af4745fcb74e5659280e6c4a\"}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('64', 'K歌房评论', 'kRoomComment', '2.0', '{\"comment\": \"K歌房评论接口\", \"to\": 2257, \"token\": \"w11RWiraaGmGXg4TglUyMr7e8mnO0whT\", \"from\": 1230208, \"kRoomId\": \"4347de11af4745fcb74e5659280e6c4a\"}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('65', 'K歌房z作品列表', 'kRoomCover', '2.0', '{\"limit\": 10, \"page\": 1, \"kRoomId\": \"22e5cd83311845ed9519b6fa58b64c60\"}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('66', 'K歌房解散', 'kRoomDel', '2.0', '{}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('67', 'K歌房详情', 'kRoomDetail', '2.0', '{\"kRoomId\": \"4347de11af4745fcb74e5659280e6c4a\"}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('68', 'K歌房是否加入', 'kRoomIsJoin', '2.0', '{\"token\": \"w11RWiraaGmGXg4TglUyMr7e8mnO0whT\", \"uid\": 1230208, \"kRoomId\": \"4347de11af4745fcb74e5659280e6c4a\"}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('69', 'K歌房加入', 'kRoomJoin', '2.0', '{\"token\": \"w11RWiraaGmGXg4TglUyMr7e8mnO0whT\", \"uid\": 1230208, \"kRoomId\": \"4347de11af4745fcb74e5659280e6c4a\"}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('70', 'K歌房管理（删除）', 'kRoomMemberDel', '2.0', '{\"token\": \"Ryk5g3ca4QopCkuh498E0TVcV1zXxZrzoPYON3HupOVdApYXLE4GMQMfAHG89yDC\", \"opUid\": 1230208, \"uid\": 1230208, \"kRoomId\": \"4347de11af4745fcb74e5659280e6c4a\"}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('71', 'K歌房退出', 'kRoomMemberLeave', '2.0', '{\"token\": \"w11RWiraaGmGXg4TglUyMr7e8mnO0whT\", \"uid\": 1230208, \"kRoomId\": \"4347de11af4745fcb74e5659280e6c4a\"}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('72', 'K歌房列表（我的）', 'kRoomMyList', '2.0', '{\"token\": \"w11RWiraaGmGXg4TglUyMr7e8mnO0whT\", \"limit\": 10, \"uid\": 1230208, \"page\": 1}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('73', 'K歌房创建', 'kRoomNew', '2.0', '{}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('74', 'K歌房个歌单列表', 'kRoomSongList', '2.0', '{\"limit\": 10, \"page\": 1, \"kRoomId\": \"4347de11af4745fcb74e5659280e6c4a\"}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('75', 'K歌房修改', 'kRoomUpdate', '2.0', '{}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('76', 'K歌房用户列表', 'kRoomMember', '2.0', '{\"limit\": 10, \"nickname\": \"\", \"page\": 1, \"kRoomId\": \"4347de11af4745fcb74e5659280e6c4a\"}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('77', '送花', 'flower', '2.0', '{\"to\": 2635274, \"from\": 1230208, \"mvid\": \"79ff9aae81ac4bcbb06031713b9eb730\"}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('78', '送花列表', 'flowerList', '2.0', '{\"limit\": 10, \"page\": 1, \"mvid\": \"79ff9aae81ac4bcbb06031713b9eb730\"}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('79', 'Banner列表接口', 'listBanner', '2.0', '{\"os\": \"android_phone\", \"clientVersion\": \"3.6.47\", \"limit\": 5, \"page\": 1, \"channel\": \"0146586\"}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('80', '活动列表接口', 'listActivity', '2.0', '{\"province\": \"四川省\", \"uid\": 1230208, \"limit\": \"10\", \"mode\": \"Default\", \"page\": \"1\", \"channel\": \"0146585\"}', 'mode：Default（默认）, Country（全国）, Local（当前省份）, Other（其他）, Mine（我的活动）', '1');
INSERT INTO `migu_mobile_service` VALUES ('81', '闪屏图片', 'splashPic', '2.0', '{\"device\": \"android\", \"channel\": \"channel_splashPic\"}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('82', '上传相册动态接口', 'createDynamic', '2.0', '{\"token\": \"G5ZXkhMGktrmbTSAkqJ6zmS6AiEYzZOi\", \"uid\": 2927498, \"urls\": [\"http://acmain.migu.cn:90/group1/M00/01/04/ChmFyFYbF4eAbUbQAAEs8aIP71M043.jpg\"]}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('83', '删除动态接口', 'delDynamic', '2.0', '{\"uid\": 1230208, \"uuid\": \"d254a5732c4643578cf642651e9df393\"}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('84', '删除相片接口', 'delPhoto', '2.0', '{\"uid\": 1230208, \"uuids\": [\"79d6433a99134ad1bdb97324a9811376\"]}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('85', '查询热门搜索词接口', 'listHotKeyword', '2.0', '{\"limit\": 10, \"page\": 1}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('86', '查询热门Tag接口', 'listHotTag', '2.0', '{\"limit\": 10, \"page\": 1}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('87', '查询用户相片接口', 'listPhoto', '2.0', '{\"limit\": 10, \"uid\": 1230208, \"page\": 1}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('88', '查询歌手接口', 'searchArtist', '2.0', '{\"keys\": [\"王菲\"], \"limit\": 10, \"page\": 1}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('89', '查询歌曲接口', 'searchSongAll', '2.0', '{\"keys\": [\"王菲\"], \"limit\": 10, \"page\": 1}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('90', '查询歌手和歌曲接口', 'searchSongAndArtist', '2.0', '{\"limit\": 10, \"page\": 1, \"keyword\": \"王菲\"}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('91', '根据歌单查询歌曲接口', 'searchSongBySongList', '2.0', '{\"limit\": 10, \"songListType\": \"official\", \"songListUUIDs\": [\"d15f1cb2d9c04eeb9d2d27051d04cc44\"], \"page\": 1}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('92', '查询用户接口', 'searchUser', '2.0', '{\"limit\": 10, \"nickname\": \"仲夏叶\", \"page\": 1}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('93', '作品详情接口', 'showMVDetail', '2.0', '{\"uuid\": \"79ff9aae81ac4bcbb06031713b9eb730\"}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('94', '上传相片接口', 'uploadPhoto', '2.0', '{}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('95', '根据gis查询用户接口', 'searchGisUser', '2.0', '{\"lat\": 30.654321, \"lng\": 104.0123, \"limit\": 10, \"page\": 1}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('96', '根据名称查询歌手接口', 'searchArtistByName', '2.0', '{\"name\": \"王菲\"}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('97', '推荐作品接口', 'listRecommendMV', '2.0', '{\"limit\": 10, \"page\": 1}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('98', '大家都在唱接口', 'listRecommendSong', '2.0', '{\"limit\": 10, \"page\": 1}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('99', 'K歌房评论数量', 'kRoomCommentSize', '2.0', '{\"kRoomIds\": [\"4347de11af4745fcb74e5659280e6c4a\"], \"token\": \"w11RWiraaGmGXg4TglUyMr7e8mnO0whT\", \"uid\": 1230208}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('100', '查询用户动态接口', 'listUserDynamic', '2.0', '{\"limit\": 10, \"uid\": 1230208, \"page\": 1}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('101', '批量关注用户接口', 'followMultiUser', '2.0', '{\"fids\": [\"2635274\"], \"token\": \"w11RWiraaGmGXg4TglUyMr7e8mnO0whT\", \"uid\": 1230208}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('102', '推荐关注用户接口', 'listRecommendUser', '2.0', '{\"limit\": 10, \"page\": 1}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('103', 'K歌房tag列表', 'kRoomTagList', '2.0', '{\"limit\": 10, \"page\": 1}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('104', '查询更多主题接口', 'listMoreThemes', '2.0', '{}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('105', '送花列表(聚合用户)', 'flowerListGroupByUser', '2.0', '{\"limit\": 10, \"page\": 1, \"mvid\": \"79ff9aae81ac4bcbb06031713b9eb730\"}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('106', '演唱作品上传接口', 'mvSubmit', '2.0', '{}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('107', '作品图片上传接口', 'mvPictureUpload', '2.0', '{\"pieceSize\": \"1024\", \"totalSize\": \"1024\", \"currentPieceSize\": \"1024\", \"coverId\": \"f07dafe60f274a6ab0485cd7810755a2\", \"startPosition\": \"1\", \"pieceMd5\": \"pieceMd5\", \"sn\": \"mvPictureUpload_sn_685143\"}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('108', '修改作品封面', 'mvPosterUrlChange', '2.0', '{}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('109', '歌曲详情接口', 'showSongDetail', '2.0', '{\"uuid\": \"0d25b8e01b1648db81a10c8593a0394a\"}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('110', '批量添加联系人接口（手机和微博）', 'addMultiContact', '2.0', '{\"contactJson\": \"[{}]\", \"token\": \"w11RWiraaGmGXg4TglUyMr7e8mnO0whT\", \"uid\": 1230208, \"contactType\": \"sina\"}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('111', '查询联系人', 'listContact', '2.0', '{\"token\": \"w11RWiraaGmGXg4TglUyMr7e8mnO0whT\", \"page\": 1, \"limit\": 10, \"uid\": 1230208, \"contactType\": \"sina\"}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('112', 'K歌房歌单修改', 'kRoomSongListUpdate', '2.0', '{\"token\": \"w11RWiraaGmGXg4TglUyMr7e8mnO0whT\", \"uid\": 1230208, \"kRoomId\": \"4347de11af4745fcb74e5659280e6c4a\", \"songs\": [\"\"]}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('113', 'K歌房管理（邀请）', 'kRoomMemberAdd', '2.0', '{\"token\": \"w11RWiraaGmGXg4TglUyMr7e8mnO0whT\", \"opuid\": 2635274, \"uid\": 1230208, \"kRoomId\": \"74144dc5b4b54b558e030c144d08bc8d\"}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('114', '查询对某个用户的送花列表', 'flowerListToUser', '2.0', '{\"token\": \"w11RWiraaGmGXg4TglUyMr7e8mnO0whT\", \"limit\": 10, \"uid\": 1230208, \"page\": 1}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('115', '查询评论接口2.0', 'listUserComment', '2.0', '{\"token\": \"w11RWiraaGmGXg4TglUyMr7e8mnO0whT\", \"limit\": 10, \"uid\": 1230208, \"page\": 1}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('116', '崩溃接口', 'crash', '2.0', '{\"uid\": 1230208}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('117', '歌手和歌曲自动补全接口', 'autoCompleteSongAndArtist', '2.0', '{\"limit\": 10, \"page\": 1, \"keyword\": \"王菲\"}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('118', '查询任务接口', 'taskListService', '2.0', '{\"limit\": 10, \"page\": 1}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('119', '完成任务接口', 'taskComplete', '2.0', '{\"tid\": \"aa4ad2ca45674d4fae59814fd51b84f5\", \"token\": \"w11RWiraaGmGXg4TglUyMr7e8mnO0whT\", \"uid\": 1230208}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('120', '检查任务是否完成接口', 'taskCheck', '2.0', '{\"token\": \"w11RWiraaGmGXg4TglUyMr7e8mnO0whT\", \"uid\": 1230208, \"tids\": [\"aa4ad2ca45674d4fae59814fd51b84f5\"]}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('121', '检查mv模板是否下架接口', 'mvTemplateCheckValid', '2.0', '{\"mids\": [\"0b9b3c8fc83e40238eb10c49f818b3f4\"]}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('122', '检查是否已经兑换mv模板接口', 'mvTemplateCheckExchange', '2.0', '{\"token\": \"w11RWiraaGmGXg4TglUyMr7e8mnO0whT\", \"uid\": 1230208, \"mids\": [\"0b9b3c8fc83e40238eb10c49f818b3f4\"]}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('123', '金币兑换模板接口', 'mvTemplateExchange', '2.0', '{\"token\": \"w11RWiraaGmGXg4TglUyMr7e8mnO0whT\", \"uid\": 1230208, \"mid\": \"0b9b3c8fc83e40238eb10c49f818b3f4\"}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('124', 'K歌房byName', 'kRoomByName', '2.0', '{\"name\": \"私密房间\"}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('125', '删除作品轮播图接口', 'delCoverPhoto', '2.0', '{}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('126', '苹果注册token接口', 'appleToken', '2.0', '{\"token\": \"w11RWiraaGmGXg4TglUyMr7e8mnO0whT\", \"uid\": 1230208}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('127', '根据热门标签MV接口', 'listHotTagMV', '2.0', '{\"tag\": \"一路上有你\", \"limit\": 10, \"page\": 1}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('128', '根据推荐标签MV接口', 'listRecommendTagMV', '2.0', '{\"tag\": \"冬天快乐\", \"limit\": 10, \"page\": 1}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('129', '验证是否为彩铃用户接口', 'ringCheck', '2.0', '{\"phone\": 15102897274}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('130', '彩铃上传分发接口', 'ringUpload', '2.0', '{}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('131', '活动点击记录接口', 'reportActivityClick', '2.0', '{}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('132', '伴奏下载记录记录接口', 'reportSongDownload', '2.0', '{\"uuid\": \"68b023fb0cba46e4a03a564360c20bab\", \"name\": \"棋子\"}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('133', '作品保存本地接口', 'reportSaveMVLocalhost', '2.0', '{}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('134', '热门作品标签推荐', 'listHotOpusTag', '2.0', '{\"limit\": 10, \"page\": 1}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('135', '获取反馈类型接口', 'feedbackTypeList', '2.0', '{}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('136', 'tag详情接口', 'tagDetail', '2.0', '{\"tag\": \"你好，2015\", \"type\": \"mv\"}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('137', '根据歌曲查询MV接口', 'listMVBySong', '2.0', '{\"order\": \"hot\", \"limit\": 10, \"mp3\": \"http://acstatic.migu.cn/Resource/mp3/2014-05-22/让我为你唱首歌(高潮版)-魏晨和俞灏明和朱梓骁和张翰.mp3\", \"page\": 1}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('138', '刷新动态数量接口', 'dynamicCount', '2.0', '{\"createAt\": 1419497174, \"uid\": 1228507}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('139', '金币大作战活动详情v3.0', 'goldDetail', '3.0', '{\"uid\": 1228507}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('140', '金币大作战歌曲列表接口v3.0', 'goldSongList', '3.0', '{\"limit\": 10, \"uuid\": \"5491730abfdc4fa69829b43f6506b871\", \"page\": 1}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('141', '金币大作战动态接口v3.0', 'goldTrend', '3.0', '{\"limit\": 10, \"page\": 1}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('142', '金币大作战用户推荐接口v3.0', 'goldUserRecommend', '3.0', '{\"gender\": \"male\"}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('143', '金币大作战开始v3.0', 'goldStart', '3.0', '{\"uid\": 1228507, \"sn\": \"1f904b3ffcffae7e0d960491440a5ae3\"}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('144', '金币大作战结束v3.0', 'goldEnd', '3.0', '{\"status\": \"ok\", \"songId\": \"d848a0852a734764ac02afffcadaf734\", \"uid\": 1228507, \"sn\": \"1f904b3ffcffae7e0d960491440a5ae3\"}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('145', '金币大作战打赏v3.0', 'goldTip', '3.0', '{\"to\": 1230208, \"from\": 1228507, \"gold\": 1}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('146', '引导提示(v3.0)', 'guideTip', '3.0', '{\"os\": \"android_phone\", \"channel\": \"0146585\", \"clientVersion\": \"3.6.47\"}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('147', '排行榜接口(v3.0)', 'opusRankingList', '3.0', '{\"limit\": 10, \"page\": 1, \"isNew\": true}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('148', '解绑接口', 'unBind', '2.0', '{\"source\": \"sina\", \"uid\": 1226567}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('149', '查看歌单详情', 'showSongListDetail', '2.0', '{\"uuid\": \"5b5bdd0317f64e4fa40ad3ec8bad5188\"}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('150', '批量删除MV接口(v3.0)', 'delMV', '3.0', '{\"token\": \"X4LzWZ1pFX3xBjxioHiutHmln3pQ1wH4DOdKbZlV3sw=\", \"uuids\": [\"4ec19674e72542fc998d4dfb2c19c68e\"], \"uid\": 1226567}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('151', '兑换鲜花v3.0', 'goldFlower', '3.0', '{\"count\": 1, \"uid\": 1226567}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('152', '送花v3.0', 'flower', '3.0', '{\"count\": 1, \"to\": 2635274, \"from\": 1230208, \"mvid\": \"79ff9aae81ac4bcbb06031713b9eb730\"}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('153', '签到接口(v3.0)', 'userSignTable', '3.0', '{\"token\": \"X4LzWZ1pFX3xBjxioHiutHmln3pQ1wH4DOdKbZlV3sw=\", \"uid\": 1226567}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('154', '用户签到表信息(v3.0)', 'userSignInfo', '3.0', '{\"token\": \"G5ZXkhMGktrmbTSAkqJ6zmS6AiEYzZOi\", \"uid\": 2927498}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('155', '评论点赞接口3.0', 'commentPraise', '3.0', '{\"token\": \"G5ZXkhMGktrmbTSAkqJ6zmS6AiEYzZOi\", \"uuid\": \"3fcbb6c2e70c40c6a376066a5bf3f74a\", \"uid\": 2927498}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('156', '查询精彩评论评论接口3.0', 'commentPraiseList', '3.0', '{\"uuid\": \"858e445523b6413297bb52caffcce0f8\"}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('157', '任务列表接口(v3.0)', 'taskList', '3.0', '{\"token\": \"4FRdKJf6+/IiawAthxrctCZg4PPwWqD2\", \"uid\": 1228507}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('158', '检查任务是否完成接口(v3.0)', 'taskCheck', '3.0', '{\"token\": \"4FRdKJf6+/IiawAthxrctCZg4PPwWqD2\", \"uid\": 1228507, \"types\": [\"comment\"]}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('159', '任务领取接口(v3.0)', 'taskHandler', '3.0', '{\"token\": \"4FRdKJf6+/IiawAthxrctCZg4PPwWqD2\", \"type\": \"comment\", \"uid\": 1228507}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('160', '用户登录接口(v3.0)', 'qLogin', '3.0', '{\"guid\": \"guid\", \"phone\": \"18782947838\", \"serviceType\": \"104\", \"code\": \"\", \"os\": \"android\"}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('161', '获取最新歌单接口(v3.0)', 'latestSongList', '3.0', '{}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('162', '邀请好友记录接口v3.0', 'incInvite', '3.0', '{\"platform\": \"qzone\", \"from\": 1226567}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('163', '查询好友动态接口3.0', 'listFriendsDynamic', '3.0', '{\"limit\": 10, \"page\": 1, \"uid\": 1228507}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('164', '查询用户动态接口3.0', 'listUserDynamic', '3.0', '{\"limit\": 10, \"page\": 1, \"uid\": 1228507}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('165', '根据Gis信息查询MV接口(v3.0)', 'opusGisSearch', '3.0', '{\"uid\": 2927498, \"gender\": \"male\", \"limit\": 20, \"lat\": 30.577057, \"lng\": 104.062284, \"page\": 1}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('166', '是否屏蔽Gis信息查询MV接口(v3.0)', 'opusInvisible', '3.0', '{\"gisInvisible\": false, \"uid\": 2927498}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('167', '系统推送', 'systemPush', '2.0', '{\"uuid\": \"\"}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('168', '推送历史3.0', 'historyPush', '3.0', '{\"limit\": 10, \"uid\": 2927498, \"page\": 1}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('169', '转发作品3.0', 'shareOpus', '3.0', '{\"content\": \"这首歌不错哦\", \"mid\": \"f72989b74f064f2c964323bb460b142b\", \"uid\": 816}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('170', 'K歌房消息统计3.0', 'kRoomMessages', '3.0', '{\"uid\": 2927498}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('171', '根据歌曲查询合唱伴奏v4.0', 'chorusListBySid', '4.0', '{\"type\": 1, \"limit\": 10, \"page\": 1, \"sid\": \"3ac45cc33547415099e9983617562fc9\"}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('172', '好友合唱伴奏列表v4.0', 'friendChorusList', '4.0', '{\"limit\": 10, \"uid\": 2927498, \"page\": 1}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('173', '热门合唱伴奏列表v4.0', 'hotChorusList', '4.0', '{\"limit\": 10, \"page\": 1}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('174', '明星合唱伴奏列表v4.0', 'starSongList', '4.0', '{\"limit\": 10, \"page\": 1}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('175', '合唱邀请v4.0', 'inviteChorus', '4.0', '{\"coverId\": \"\", \"uids\": [2927498]}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('176', '合唱邀请列表v4.0', 'inviteChorusInfoList', '4.0', '{\"limit\": 10, \"uid\": 2927498, \"page\": 1}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('178', '单曲排行榜/独唱排行(v4.0)', 'listMVBySong', '4.0', '{\"limit\": 10, \"page\": 1, \"sid\": \"3ac45cc33547415099e9983617562fc9\"}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('179', '参与合唱(v4.0)', 'opusListByCid', '4.0', '{\"limit\": 10, \"type\": \"lately\", \"page\": 1, \"cid\": \"\"}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('180', '用户合唱伴奏列表4.0', 'listUserSong', '4.0', '{\"limit\": 10, \"uid\": 2927498, \"page\": 1}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('181', '查询用户动态接口4.0', 'listUserDynamic', '4.0', '{\"limit\": 10, \"uid\": 2927498, \"page\": 1}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('182', '查询好友动态接口4.0', 'listFriendsDynamic', '4.0', '{\"limit\": 10, \"uid\": 2927498, \"page\": 1}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('183', '获取动态数量接口4.0', 'dynamicCount', '4.0', '{\"createAt\": 1419497174, \"uid\": 2927498}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('184', '获取动态数量接口3.0', 'dynamicCount', '3.0', '{\"createAt\": 1419497174, \"uid\": 2927498}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('185', '帐号更改验证v3.0', 'accountVerify', '3.0', '{\"miguParam\": {\"sessionID\": \"\", \"validCode\": \"\", \"businessID\": \"bindPhone\"}, \"uid\": 2927675, \"accountName\": \"18782947838\"}', '帐号更改验证接口，用于换绑手机号或者邮箱。在调用该接口前，需调用getVerificationCode获取到该接口的输入参数sessionID和validCode。该接口返回的token，会用于changeBindAccount接口的输入参数中的miguParam中的token。', '1');
INSERT INTO `migu_mobile_service` VALUES ('186', '换绑手机，邮箱接口v3.0', 'changeBindAccount', '3.0', '{\"newAccountName\": \"stornado@qq.com\", \"miguParam\": {\"passID\": \"3315216967216\", \"sessionID\": \"\", \"validCode\": \"\", \"token\": \"\", \"businessID\": \"bindEmail\"}, \"uid\": 2927498}', '在该接口之前，需要依次用旧手机号或邮箱调用获取验证码getVerificationCode（businessID=unBindAccount），再调用accountVerify接口，对老手机或账号进行验证得到token，再用新手机号或邮箱调用getVerificationCode获取绑定账号验证码获取sessionID，validCode', '1');
INSERT INTO `migu_mobile_service` VALUES ('187', '业务账号升级v3.0', 'servicePassportUpgrade', '3.0', '{\"phone\": \"18782947838\", \"password\": \"123456\", \"email\": \"ryan@zxye.me\"}', '非统一认证账号通过调用该接口可升级为统一认证账号。', '1');
INSERT INTO `migu_mobile_service` VALUES ('188', '修改密码接口(v3.0)', 'modifyPassword', '3.0', '{\"newPassword\": \"123456\", \"oldPassword\": \"123456\", \"uid\": 2927498}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('189', '用户登录接口(v3.0)', 'login', '3.0', '{\"guid\": \"guid\", \"password\": \"123456\", \"os\": \"android\", \"phoneOrEmail\": \"18782947838\"}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('190', '用户注册接口(v3.0)', 'userRegisterService', '3.0', '{\"password\": \"123456\", \"miguParam\": {\"sessionID\": \"\", \"validCode\": \"\", \"validType\": \"MESSAGE\"}, \"os\": \"android\", \"poster\": \"http://acmain.migu.cn:90/group1/M00/01/03/ChmFyFYbBq2AJa90AAEs8aIP71M319.jpg\", \"phone\": \"18782947838\", \"gender\": \"male\", \"guid\": \"guid\", \"nickname\": \"仲夏叶\"}', 'v3.0版本在注册时，需要传入miguParam对象，对象包含获取账号注册请求获取到的验证码和sessionID', '1');
INSERT INTO `migu_mobile_service` VALUES ('191', '第三方用户登录接口(v3.0)', 'tLogin', '3.0', '{\"openId\": \"CC3B2133401F05312A8333B1A4DDA0A7\", \"guid\": \"guid\", \"os\": \"android\", \"source\": \"tencent\"}', 'v3.0和v2.0的输入参数一致，统一认证，必须走v3.0，v3.0的接口会返回passID和servicePassportUpgradeStatus', '1');
INSERT INTO `migu_mobile_service` VALUES ('192', '第三方注册接口(v3.0)', 'tUserRegisterService', '3.0', '{\"province\": \"四川省\", \"openId\": \"CC3B2133401F05312A8333B1A4DDA0A7\", \"miguParam\": {\"sessionID\": \"\", \"validCode\": \"\"}, \"name\": \"叶尔羌\", \"city\": \"成都市\", \"gender\": \"male\", \"description\": \"第三方注册接口\", \"os\": \"android\", \"profileImageUrl\": \"http://qzapp.qlogo.cn/qzapp/100526240/CC3B2133401F05312A8333B1A4DDA0A7/100\", \"profileUrl\": \"http://about.me/stornado\", \"source\": \"tencent\", \"avatarLarge\": \"http://qzapp.qlogo.cn/qzapp/100526240/CC3B2133401F05312A8333B1A4DDA0A7/100\", \"location\": \"剑南大道南段338号\", \"poster\": \"http://qzapp.qlogo.cn/qzapp/100526240/CC3B2133401F05312A8333B1A4DDA0A7/100\", \"guid\": \"guid\", \"nickname\": \"叶尔羌\", \"screenName\": \"叶尔羌\"}', 'v3.0版本在第三方注册时，需要传入miguParam对象，对象包含获取账号注册请求获取到的验证码和sessionID', '1');
INSERT INTO `migu_mobile_service` VALUES ('193', '获取验证码接口(v3.0)', 'getVerificationCode', '3.0', '{\"businessID\": \"register\", \"accountType\": \"PHONE_NO\", \"accountName\": \"18782947838\"}', '该接口v3.0版本为统一认证版本。获取验证码调用该接口，但单独验证验证码的接口已被废除，该接口会返回sessionID，客户端拿到sessionID后做缓存，在真正提交业务操作数据时，将sessionID和手机或者邮箱收到的验证码，放入到miguParam对象中，然后将miguParam对象和业务数据一并提交。', '1');
INSERT INTO `migu_mobile_service` VALUES ('194', '绑定手机接口v3.0', 'bindPhone', '3.0', '{\"phone\": \"18782947838\", \"miguParam\": {\"sessionID\": \"\", \"validCode\": \"\"}, \"uid\": 1230208}', 'v3.0为统一认证接口，调用该接口需传入miguParam参数，miguParam参数通过调用getVerificationCode获取验证码和sessionID', '1');
INSERT INTO `migu_mobile_service` VALUES ('195', '绑定email接口v3.0', 'bindEmail', '3.0', '{\"miguParam\": {\"sessionID\": \"\", \"validCode\": \"\"}, \"uid\": 2927498, \"email\": \"xwxia@iflytek.com\"}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('196', '重置密码(v3.0)', 'resetPassword', '3.0', '{\"password\": \"123456\", \"miguParam\": {\"sessionID\": \"\", \"validCode\": \"\", \"validType\": \"MESSAGE\"}, \"accountType\": \"PHONE_NO\", \"accountName\": \"18782947838\"}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('197', '上传和绑定接口v3.0', 'userBind', '3.0', '{\"uid\": 1230208, \"idStr\": \"tencent_CC3B2133401F05312A8333B1A4DDA0A7\", \"name\": \"叶尔羌\", \"source\": \"tencent\", \"avatar\": \"http://qzapp.qlogo.cn/qzapp/100526240/CC3B2133401F05312A8333B1A4DDA0A7/100\", \"screenName\": \"叶尔羌\"}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('198', '解绑接口v3.0', 'unBind', '3.0', '{\"source\": \"sina\", \"uid\": 2927498}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('199', '编辑用户信息接口(v3.0)', 'editUser', '3.0', '{\"city\": \"成都市\", \"uid\": 2927796, \"gender\": \"male\", \"age\": 24, \"signature\": \"最是那一低头的温柔，像一朵水莲花不胜凉风的娇羞，道一声珍重，道一声珍重，那一声珍重里有蜜甜的忧愁——沙扬娜拉！\", \"poster\": \"http://acmain.migu.cn:90/group1/M00/01/03/ChmFyFYbBq2AJa90AAEs8aIP71M319.jpg\", \"birthday\": \"1991-08-22\", \"address\": \"美城云庭\", \"lat\": 31.5, \"lng\": 103.4, \"nickname\": \"仲夏叶\"}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('200', '登录检查接口(v3.0)', 'checkLogin', '3.0', '{\"token\": \"w11RWiraaGmGXg4TglUyMr7e8mnO0whT\", \"uid\": 1230208}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('201', '推荐应用列表/大家都在玩（4.0）', 'recommendAppList', '4.0', '{\"limit\": 10, \"os\": \"android_phone\", \"page\": 1}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('202', '获取反馈类型接口(4.0)', 'feedbackTypeList', '4.0', '{}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('203', '获取动态数量接口5.0', 'dynamicCount', '5.0', '{\"createAt\": 1419497174, \"uid\": 2927498}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('204', '查询用户动态接口5.0', 'listUserDynamic', '5.0', '{\"limit\": 10, \"uid\": 2927498, \"page\": 1}', null, '1');
INSERT INTO `migu_mobile_service` VALUES ('205', '查询好友动态接口5.0', 'listFriendsDynamic', '5.0', '{\"limit\": 10, \"uid\": 2927498, \"page\": 1}', null, '1');

-- ----------------------------
-- Table structure for migu_module
-- ----------------------------
DROP TABLE IF EXISTS `migu_module`;
CREATE TABLE `migu_module` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `service_list` longtext NOT NULL,
  `param_dict` longtext NOT NULL,
  `additional` longtext NOT NULL,
  `description` longtext,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of migu_module
-- ----------------------------
INSERT INTO `migu_module` VALUES ('1', '登录模块', '[\"login\",\"checkLogin\",\"systemTime\",\"dynamicCount\",\"logout\",\"checkLogin\"]', '{\"checkLogin\":{\"token\":{\"login\":\"token\"},\"uid\":{\"login\":\"id\"}},\"dynamicCount\":{\"createAt\":{\"systemTime\":\"time\"},\"uid\":{\"login\":\"id\"}},\"login\":{\"guid\":\"guid\",\"os\":\"android\",\"password\":\"123456\",\"phoneOrEmail\":\"18782947838\"},\"logout\":{\"uid\":{\"login\":\"id\"}},\"systemTime\":{}}', '{}', '', '1');
INSERT INTO `migu_module` VALUES ('2', '推荐标签', '[\"listRecommendTag\",\"listRecommendTagMV\",\"tagDetail\",\"listMV\"]', '{\"listMV\":{\"limit\":10,\"order\":\"createAt\",\"page\":1,\"tag\":[\"listRecommendTag\",0,\"name\"]},\"listRecommendTag\":{\"limit\":10,\"page\":1},\"listRecommendTagMV\":{\"limit\":10,\"page\":1,\"tag\":[\"listRecommendTag\",0,\"name\"]},\"tagDetail\":{\"tag\":[\"listRecommendTag\",0,\"name\"]}}', '{}', '', '1');
INSERT INTO `migu_module` VALUES ('3', '热门标签', '[\"listHotTag\",\"listHotTagMV\",\"tagDetail\",\"listMV\"]', '{\"listHotTag\":{\"limit\":10,\"page\":1},\"listHotTagMV\":{\"limit\":10,\"page\":1,\"tag\":[\"listHotTag\",0,\"tag\"]},\"listMV\":{\"limit\":10,\"order\":\"createAt\",\"page\":1,\"tag\":[\"listHotTag\",0,\"tag\"]},\"tagDetail\":{\"tag\":[\"listHotTag\",0,\"tag\"]}}', '{}', '', '1');
INSERT INTO `migu_module` VALUES ('4', '金币大作战', '[\"getLastVersion\",\"guideTip\",\"login\",\"showUserDetail\",\"goldDetail\",\"goldSongList\",\"goldStart\",\"goldEnd\",\"goldUserRecommend\",\"goldTip\",\"goldTrend\",\"showUserDetail\",\"logout\",\"login\",\"showUserDetail\",\"logout\"]', '{\"getLastVersion\":{\"channel\":\"0146585\",\"versionType\":\"android\"},\"goldDetail\":{\"uid\":{\"login\":\"id\"}},\"goldEnd\":{\"sn\":\"1f904b3ffcffae7e0d960491440a5ae3\",\"songId\":[\"goldSongList\",0,\"uuid\"],\"status\":\"ok\",\"uid\":{\"login\":\"id\"}},\"goldSongList\":{\"limit\":10,\"page\":1,\"uuid\":{\"goldDetail\":\"songListId\"}},\"goldStart\":{\"sn\":\"1f904b3ffcffae7e0d960491440a5ae3\",\"uid\":{\"login\":\"id\"}},\"goldTip\":{\"from\":{\"login\":\"id\"},\"gold\":3,\"to\":1226567},\"goldTrend\":{\"limit\":10,\"page\":1},\"goldUserRecommend\":{\"gender\":\"male\"},\"guideTip\":{\"clientVersion\":\"3.4.30\",\"os\":\"android_phone\"},\"login\":{\"guid\":\"guid\",\"os\":\"android\",\"password\":\"123456\",\"phoneOrEmail\":\"18782947838\"},\"logout\":{\"uid\":{\"login\":\"id\"}},\"showUserDetail\":{\"oid\":{\"login\":\"id\"},\"uid\":{\"login\":\"id\"}}}', '{}', '', '1');
INSERT INTO `migu_module` VALUES ('5', '鲜花相关接口', '[\"login\",\"listUserMV\",\"showMVDetail\",\"flowerList\",\"flowerListGroupByUser\",\"flowerListToUser\",\"flower\",\"showMVDetail\",\"flowerList\",\"flowerListGroupByUser\",\"flowerListToUser\",\"logout\"]', '{\"flower\":{\"from\":{\"login\":\"id\"},\"mvid\":[\"listUserMV\",0,\"uuid\"],\"to\":{\"login\":\"id\"}},\"flowerList\":{\"limit\":10,\"mvid\":[\"listUserMV\",0,\"uuid\"],\"page\":1},\"flowerListGroupByUser\":{\"limit\":10,\"mvid\":[\"listUserMV\",0,\"uuid\"],\"page\":1},\"flowerListToUser\":{\"limit\":10,\"page\":1,\"token\":{\"login\":\"token\"},\"uid\":{\"login\":\"id\"}},\"listUserMV\":{\"limit\":10,\"page\":1,\"status\":[\"active\"],\"uid\":{\"login\":\"id\"}},\"login\":{\"guid\":\"guid\",\"os\":\"android\",\"password\":\"123456\",\"phoneOrEmail\":\"18782947838\"},\"logout\":{\"uid\":{\"login\":\"id\"}},\"showMVDetail\":{\"uuid\":[\"listUserMV\",0,\"uuid\"]}}', '{}', '', '1');
INSERT INTO `migu_module` VALUES ('6', '电视版压测接口', '[\r\n    \"tvSplashPic\",\r\n    \"tvGetConfig\",\r\n    \"tvGetRollSubtitles\",\r\n    \"tvGetFoundTags\",\r\n    \"tvGetCoversByTag\",\r\n    \"tvGetUserInfoById\",\r\n    \"tvFollowUser\",\r\n    \"tvUnFollowUser\",\r\n    \"tvGetFollowUsers\",\r\n    \"tvGetFans\",\r\n    \"tvGetColumnByNo\",\r\n    \"tvGetSongsByClm\",\r\n    \"tvGetSingersByClm\",\r\n    \"tvGetSongsByMuliType\",\r\n    \"tvGetSingersByCapital\",\r\n    \"tvGetRecommendSongs\",\r\n    \"tvGetCarouselFigures\",\r\n    \"tvGetPhotosByCoverId\",\r\n    \"tvGetUserPhotos\",\r\n    \"tvCheckPhoto\",\r\n    \"tvFlower\",\r\n    \"tvGetCoverInfoById\",\r\n    \"tvGetFamilyCovers\",\r\n    \"tvGetCommentsByCoverId\",\r\n    \"tvGetSongInfoById\",\r\n    \"tvGetActivityList\",\r\n    \"tvGetActivityInfoById\",\r\n    \"tvGetActivityCovers\",\r\n    \"tvGetActivityUserInfo\",\r\n    \"tvGetActivityUserCovers\",\r\n    \"tvGetActivityPrize\"\r\n]', '{\r\n    \"tvGetSingersByCapital\": {\r\n        \"count\": 10,\r\n        \"protocolver\": \"2.0.0\",\r\n        \"signinfo\": \"W\",\r\n        \"start\": 1\r\n    },\r\n    \"tvGetSongInfoById\": {\r\n        \"hwlevel\": 1,\r\n        \"protocolver\": \"2.0.0\",\r\n        \"resourceno\": {\r\n            \"tvGetSongsByMuliType\": [\r\n                \"list\",\r\n                0,\r\n                \"resourceno\"\r\n            ]\r\n        }\r\n    },\r\n    \"tvGetCommentsByCoverId\": {\r\n        \"count\": 10,\r\n        \"protocolver\": \"2.0.0\",\r\n        \"coverid\": {\r\n            \"tvGetCoversByTag\": [\r\n                \"list\",\r\n                0,\r\n                \"coverid\"\r\n            ]\r\n        },\r\n        \"start\": 1\r\n    },\r\n    \"tvGetFollowUsers\": {\r\n        \"count\": 10,\r\n        \"protocolver\": \"2.0.0\",\r\n        \"accountid\": {\r\n            \"tvGetCoversByTag\": [\r\n                \"list\",\r\n                0,\r\n                {\r\n                    \"userinfo\": \"accountid\"\r\n                }\r\n            ]\r\n        },\r\n        \"start\": 1\r\n    },\r\n    \"tvGetSongsByMuliType\": {\r\n        \"count\": 10,\r\n        \"protocolver\": \"2.0.0\",\r\n        \"signtype\": \"1\",\r\n        \"signinfo\": \"W\",\r\n        \"start\": 1\r\n    },\r\n    \"tvCheckPhoto\": {\r\n        \"protocolver\": \"2.0.0\",\r\n        \"list\": [\r\n            {\r\n                \"id\": \"b635c545b6684e3f8d5b1615933d7def\"\r\n            },\r\n            {\r\n                \"id\": {\r\n                    \"tvGetUserPhotos\": [\r\n                        \"list\",\r\n                        0,\r\n                        \"id\"\r\n                    ]\r\n                }\r\n            }\r\n        ]\r\n    },\r\n    \"tvGetActivityPrize\": {\r\n        \"protocolver\": \"2.0.0\",\r\n        \"accountid\": {\r\n            \"tvGetCoversByTag\": [\r\n                \"list\",\r\n                0,\r\n                {\r\n                    \"userinfo\": \"accountid\"\r\n                }\r\n            ]\r\n        }\r\n    },\r\n    \"tvGetPhotosByCoverId\": {\r\n        \"count\": 10,\r\n        \"protocolver\": \"2.0.0\",\r\n        \"coverid\": \"0\",\r\n        \"start\": 1\r\n    },\r\n    \"tvGetCoversByTag\": {\r\n        \"count\": 10,\r\n        \"protocolver\": \"2.0.0\",\r\n        \"tag\": {\r\n            \"tvGetFoundTags\": [\r\n                \"list\",\r\n                1,\r\n                \"tag\"\r\n            ]\r\n        },\r\n        \"start\": \"1\",\r\n        \"tagtype\": {\r\n            \"tvGetFoundTags\": [\r\n                \"list\",\r\n                1,\r\n                \"tagtype\"\r\n            ]\r\n        }\r\n    },\r\n    \"tvGetActivityUserCovers\": {\r\n        \"count\": 10,\r\n        \"protocolver\": \"2.0.0\",\r\n        \"accountid\": {\r\n            \"tvGetCoversByTag\": [\r\n                \"list\",\r\n                0,\r\n                {\r\n                    \"userinfo\": \"accountid\"\r\n                }\r\n            ]\r\n        },\r\n        \"uuid\": {\r\n            \"tvGetActivityList\": [\r\n                \"list\",\r\n                0,\r\n                \"uuid\"\r\n            ]\r\n        },\r\n        \"start\": 1\r\n    },\r\n    \"tvFollowUser\": {\r\n        \"protocolver\": \"2.0.0\",\r\n        \"targetaccountid\": {\r\n            \"tvGetCoversByTag\": [\r\n                \"list\",\r\n                1,\r\n                {\r\n                    \"userinfo\": \"accountid\"\r\n                }\r\n            ]\r\n        },\r\n        \"accountid\": {\r\n            \"tvGetCoversByTag\": [\r\n                \"list\",\r\n                0,\r\n                {\r\n                    \"userinfo\": \"accountid\"\r\n                }\r\n            ]\r\n        }\r\n    },\r\n    \"tvGetCoverInfoById\": {\r\n        \"protocolver\": \"2.0.0\",\r\n        \"coverid\": {\r\n            \"tvGetCoversByTag\": [\r\n                \"list\",\r\n                0,\r\n                \"coverid\"\r\n            ]\r\n        }\r\n    },\r\n    \"tvGetColumnByNo\": {\r\n        \"count\": 10,\r\n        \"programno\": \"0\",\r\n        \"protocolver\": \"2.0.0\",\r\n        \"channel\": \"014BD09\",\r\n        \"start\": 1\r\n    },\r\n    \"tvUnFollowUser\": {\r\n        \"protocolver\": \"2.0.0\",\r\n        \"targetaccountid\": {\r\n            \"tvGetCoversByTag\": [\r\n                \"list\",\r\n                1,\r\n                {\r\n                    \"userinfo\": \"accountid\"\r\n                }\r\n            ]\r\n        },\r\n        \"accountid\": {\r\n            \"tvGetCoversByTag\": [\r\n                \"list\",\r\n                0,\r\n                {\r\n                    \"userinfo\": \"accountid\"\r\n                }\r\n            ]\r\n        }\r\n    },\r\n    \"tvGetSongsByClm\": {\r\n        \"count\": 10,\r\n        \"programno\": {\r\n            \"tvGetColumnByNo\": [\r\n                \"list\",\r\n                0,\r\n                \"columnno\"\r\n            ]\r\n        },\r\n        \"protocolver\": \"2.0.0\",\r\n        \"start\": 1\r\n    },\r\n    \"tvFlower\": {\r\n        \"to\": {\r\n            \"tvGetCoversByTag\": [\r\n                \"list\",\r\n                0,\r\n                {\r\n                    \"userinfo\": \"uid\"\r\n                }\r\n            ]\r\n        },\r\n        \"mvid\": {\r\n            \"tvGetCoversByTag\": [\r\n                \"list\",\r\n                0,\r\n                \"coverid\"\r\n            ]\r\n        },\r\n        \"from\": {\r\n            \"tvGetCoversByTag\": [\r\n                \"list\",\r\n                1,\r\n                {\r\n                    \"userinfo\": \"uid\"\r\n                }\r\n            ]\r\n        }\r\n    },\r\n    \"tvGetUserInfoById\": {\r\n        \"protocolver\": \"2.0.0\",\r\n        \"targetaccountid\": {\r\n            \"tvGetCoversByTag\": [\r\n                \"list\",\r\n                1,\r\n                {\r\n                    \"userinfo\": \"accountid\"\r\n                }\r\n            ]\r\n        },\r\n        \"accountid\": {\r\n            \"tvGetCoversByTag\": [\r\n                \"list\",\r\n                0,\r\n                {\r\n                    \"userinfo\": \"accountid\"\r\n                }\r\n            ]\r\n        }\r\n    },\r\n    \"tvSplashPic\": {\r\n        \"channel\": \"0146585\"\r\n    },\r\n    \"tvGetFamilyCovers\": {\r\n        \"count\": 10,\r\n        \"protocolver\": \"2.0.0\",\r\n        \"sorttype\": \"2\",\r\n        \"start\": 1,\r\n        \"osid\": \"Android-TV\",\r\n        \"accountid\": {\r\n            \"tvGetCoversByTag\": [\r\n                \"list\",\r\n                0,\r\n                {\r\n                    \"userinfo\": \"accountid\"\r\n                }\r\n            ]\r\n        }\r\n    },\r\n    \"tvGetActivityInfoById\": {\r\n        \"protocolver\": \"2.0.0\",\r\n        \"uuid\": {\r\n            \"tvGetActivityList\": [\r\n                \"list\",\r\n                0,\r\n                \"uuid\"\r\n            ]\r\n        }\r\n    },\r\n    \"tvGetActivityList\": {\r\n        \"count\": 10,\r\n        \"programno\": {\r\n            \"tvGetColumnByNo\": [\r\n                \"list\",\r\n                0,\r\n                \"columnno\"\r\n            ]\r\n        },\r\n        \"protocolver\": \"2.0.0\",\r\n        \"channel\": \"0146585\",\r\n        \"start\": 1\r\n    },\r\n    \"tvGetFoundTags\": {\r\n        \"protocolver\": \"2.0.0\"\r\n    },\r\n    \"tvGetCarouselFigures\": {\r\n        \"protocolver\": \"2.0.0\"\r\n    },\r\n    \"tvGetUserPhotos\": {\r\n        \"count\": 10,\r\n        \"protocolver\": \"2.0.0\",\r\n        \"accountid\": {\r\n            \"tvGetCoversByTag\": [\r\n                \"list\",\r\n                0,\r\n                {\r\n                    \"userinfo\": \"accountid\"\r\n                }\r\n            ]\r\n        },\r\n        \"targetaccountid\": {\r\n            \"tvGetCoversByTag\": [\r\n                \"list\",\r\n                1,\r\n                {\r\n                    \"userinfo\": \"accountid\"\r\n                }\r\n            ]\r\n        },\r\n        \"start\": 1\r\n    },\r\n    \"tvGetFans\": {\r\n        \"count\": 10,\r\n        \"protocolver\": \"2.0.0\",\r\n        \"accountid\": {\r\n            \"tvGetCoversByTag\": [\r\n                \"list\",\r\n                0,\r\n                {\r\n                    \"userinfo\": \"accountid\"\r\n                }\r\n            ]\r\n        },\r\n        \"start\": 1\r\n    },\r\n    \"tvGetActivityUserInfo\": {\r\n        \"protocolver\": \"2.0.0\",\r\n        \"uuid\": {\r\n            \"tvGetActivityList\": [\r\n                \"list\",\r\n                0,\r\n                \"uuid\"\r\n            ]\r\n        },\r\n        \"accountid\": {\r\n            \"tvGetCoversByTag\": [\r\n                \"list\",\r\n                0,\r\n                {\r\n                    \"userinfo\": \"accountid\"\r\n                }\r\n            ]\r\n        }\r\n    },\r\n    \"tvGetActivityCovers\": {\r\n        \"count\": 10,\r\n        \"programno\": \"0\",\r\n        \"uuid\": {\r\n            \"tvGetActivityList\": [\r\n                \"list\",\r\n                0,\r\n                \"uuid\"\r\n            ]\r\n        },\r\n        \"start\": 1\r\n    },\r\n    \"tvGetRecommendSongs\": {\r\n        \"count\": 10,\r\n        \"protocolver\": \"2.0.0\",\r\n        \"toplist\": [\r\n            {\r\n                \"tvGetSingersByCapital\": [\r\n                    \"list\",\r\n                    0,\r\n                    \"singername\"\r\n                ]\r\n            }\r\n        ],\r\n        \"start\": 1\r\n    },\r\n    \"tvGetSingersByClm\": {\r\n        \"count\": 10,\r\n        \"programno\": \"0\",\r\n        \"protocolver\": \"2.0.0\",\r\n        \"signinfo\": \"W\",\r\n        \"start\": 1\r\n    },\r\n    \"tvGetConfig\": {\r\n        \"protocolver\": \"2.0.0\"\r\n    },\r\n    \"tvGetRollSubtitles\": {\r\n        \"protocolver\": \"2.0.0\",\r\n        \"province\": \"四川省\",\r\n        \"channel\": \"014BD09\"\r\n    }\r\n}', '{}', '', '1');
INSERT INTO `migu_module` VALUES ('7', '评论模块', '[\"login\",\"listHotTag\",\"listHotTagMV\",\"listTag\",\"showMVDetail\",\"listComment\",\"listUserComment\",\"comment\",\"showMVDetail\",\"listComment\",\"listUserComment\",\"delComment\",\"showMVDetail\",\"listComment\",\"listUserComment\",\"logout\"]', '{\"comment\":{\"content\":\"哎哟，不错哦\",\"from\":{\"login\":\"id\"},\"pid\":\"\",\"rid\":[\"listHotTagMV\",0,\"uuid\"],\"tag\":[[\"listTag\",0,\"tag\"]],\"to\":[\"listHotTagMV\",0,\"uid\"],\"type\":\"mv\"},\"delComment\":{\"token\":{\"login\":\"token\"},\"uid\":{\"login\":\"id\"},\"uuid\":{\"comment\":\"uuid\"}},\"listComment\":{\"limit\":10,\"page\":1,\"rid\":[\"listHotTagMV\",0,\"uuid\"]},\"listHotTag\":{\"limit\":10,\"page\":1},\"listHotTagMV\":{\"limit\":10,\"page\":1,\"tag\":[\"listHotTag\",0,\"tag\"]},\"listTag\":{\"limit\":10,\"page\":1,\"type\":\"comment\"},\"listUserComment\":{\"limit\":10,\"page\":1,\"token\":{\"login\":\"token\"},\"uid\":{\"login\":\"id\"}},\"login\":{\"guid\":\"guid\",\"os\":\"android\",\"password\":\"123456\",\"phoneOrEmail\":\"18782947838\"},\"logout\":{\"uid\":{\"login\":\"id\"}},\"showMVDetail\":{\"uuid\":[\"listHotTagMV\",0,\"uuid\"]}}', '{}', '', '1');
INSERT INTO `migu_module` VALUES ('8', '金币任务模块', '[\"login\",\"showUserDetail\",\"taskListService\",\"taskCheck\",\"taskComplete\",\"taskCheck\",\"taskListService\",\"showUserDetail\",\"logout\"]', '{\"login\":{\"guid\":\"guid\",\"os\":\"android\",\"password\":\"123456\",\"phoneOrEmail\":\"18782947838\"},\"logout\":{\"uid\":{\"login\":\"id\"}},\"showUserDetail\":{\"oid\":{\"login\":\"id\"},\"uid\":{\"login\":\"id\"}},\"taskCheck\":{\"tids\":[[\"taskListService\",0,\"uuid\"]],\"token\":{\"login\":\"token\"},\"uid\":{\"login\":\"id\"}},\"taskComplete\":{\"tid\":[\"taskListService\",0,\"uuid\"],\"token\":{\"login\":\"token\"},\"uid\":{\"login\":\"id\"}},\"taskListService\":{\"limit\":10,\"page\":1}}', '{}', '', '1');
INSERT INTO `migu_module` VALUES ('9', '用户信息相关接口', '[\"login\",\"showUserDetail\",\"searchUser\",\"modifyNickname\",\"modifyPassword\",\"modifySignature\",\"showUserDetail\",\"searchUser\",\"unBind\",\"showUserDetail\",\"userBind\",\"showUserDetail\",\"userBehavior\",\"bindEmail\",\"bindPhone\",\"checkEmail\",\"checkNickname\",\"checkPhone\",\"editUser\",\"showUserDetail\",\"searchUser\",\"logout\"]', '{\"bindEmail\":{\"email\":\"xwxia@iflytek.com\",\"password\":\"123456\",\"uid\":{\"login\":\"id\"}},\"bindPhone\":{\"password\":\"123456\",\"phone\":\"18782947838\",\"uid\":{\"login\":\"id\"}},\"checkEmail\":{\"email\":\"xwxia@iflytek.com\"},\"checkNickname\":{\"nickname\":\"﻿叶尔羌\"},\"checkPhone\":{\"phone\":\"18782947838\"},\"editUser\":{\"address\":\"美城云庭\",\"age\":24,\"birthday\":\"1991-08-22\",\"city\":\"成都市\",\"gender\":\"male\",\"lat\":31.5,\"lng\":103.4,\"nickname\":{\"login\":\"nickname\"},\"poster\":\"http://qzapp.qlogo.cn/qzapp/100526240/CC3B2133401F05312A8333B1A4DDA0A7/100\",\"signature\":\"编辑用户信息接口\",\"uid\":{\"login\":\"id\"}},\"login\":{\"guid\":\"guid\",\"os\":\"android\",\"password\":\"123456\",\"phoneOrEmail\":\"18782947838\"},\"logout\":{\"uid\":{\"login\":\"id\"}},\"modifyNickname\":{\"nickname\":\"zxye\",\"uid\":{\"login\":\"id\"}},\"modifyPassword\":{\"newPassword\":\"123456\",\"oldPassword\":\"123456\",\"uid\":{\"login\":\"id\"}},\"modifySignature\":{\"signature\":\"修改签名接口\",\"uid\":{\"login\":\"id\"}},\"searchUser\":{\"limit\":10,\"nickname\":\"仲夏叶\",\"page\":1},\"showUserDetail\":{\"oid\":{\"login\":\"id\"},\"uid\":{\"login\":\"id\"}},\"unBind\":{\"source\":\"tencent\",\"uid\":{\"login\":\"id\"}},\"userBehavior\":{\"code\":\"CODE_HEARTBEEP\",\"device\":\"android\",\"uid\":{\"login\":\"id\"}},\"userBind\":{\"avatar\":\"http://qzapp.qlogo.cn/qzapp/100526240/CC3B2133401F05312A8333B1A4DDA0A7/100\",\"idStr\":\"CC3B2133401F05312A8333B1A4DDA0A7\",\"name\":\"叶尔羌\",\"screenName\":\"叶尔羌\",\"source\":\"tencent\",\"uid\":{\"login\":\"id\"}}}', '{}', '', '1');
INSERT INTO `migu_module` VALUES ('10', 'K歌房相关接口', '[\"login\",\"kRoomList\",\"kRoomTagList\",\"kRoomNew\",\"kRoomByName\",\"kRoomComment\",\"kRoomCommentList\",\"kRoomCommentDel\",\"kRoomCommentSize\",\"kRoomCover\",\"kRoomDetail\",\"kRoomIsJoin\",\"kRoomJoin\",\"kRoomMember\",\"kRoomMemberAdd\",\"kRoomMemberDel\",\"kRoomMemberLeave\",\"kRoomMyList\",\"kRoomUpdate\",\"kRoomAgreement\",\"kRoomSongList\",\"kRoomSongListUpdate\",\"kRoomDel\",\"logout\"]', '{\"kRoomAgreement\":{\"kRoomId\":{\"kRoomNew\":\"kRoomId\"},\"password\":\"123456\",\"token\":{\"login\":\"token\"},\"uid\":{\"login\":\"id\"}},\"kRoomByName\":{\"name\":[\"kRoomList\",0,\"name\"]},\"kRoomComment\":{\"comment\":\"K歌房评论接口\",\"from\":{\"login\":\"id\"},\"kRoomId\":{\"kRoomNew\":\"kRoomId\"},\"to\":{\"login\":\"id\"},\"token\":{\"login\":\"token\"}},\"kRoomCommentDel\":{\"kRoomCommentId\":[\"kRoomCommentList\",0,\"kRoomCommentId\"],\"kRoomId\":{\"kRoomNew\":\"kRoomId\"},\"token\":{\"login\":\"token\"},\"uid\":{\"login\":\"id\"}},\"kRoomCommentList\":{\"kRoomId\":{\"kRoomNew\":\"kRoomId\"},\"limit\":10,\"page\":1},\"kRoomCommentSize\":{\"kRoomIds\":[{\"kRoomNew\":\"kRoomId\"}],\"token\":{\"login\":\"token\"},\"uid\":{\"login\":\"id\"}},\"kRoomCover\":{\"kRoomId\":{\"kRoomNew\":\"kRoomId\"},\"limit\":10,\"page\":1},\"kRoomDel\":{\"token\":{\"login\":\"token\"},\"kRoomId\":{\"kRoomNew\":\"kRoomId\"},\"uid\":{\"login\":\"id\"},\"opUid\":{\"login\":\"id\"}},\"kRoomDetail\":{\"kRoomId\":{\"kRoomNew\":\"kRoomId\"}},\"kRoomIsJoin\":{\"kRoomId\":{\"kRoomNew\":\"kRoomId\"},\"token\":{\"login\":\"token\"},\"uid\":{\"login\":\"id\"}},\"kRoomJoin\":{\"kRoomId\":\"4347de11af4745fcb74e5659280e6c4a\",\"token\":{\"login\":\"token\"},\"uid\":{\"login\":\"id\"}},\"kRoomList\":{\"limit\":10,\"page\":1},\"kRoomMember\":{\"kRoomId\":{\"kRoomNew\":\"kRoomId\"},\"limit\":10,\"nickname\":\"\",\"page\":1},\"kRoomMemberAdd\":{\"kRoomId\":{\"kRoomNew\":\"kRoomId\"},\"opUid\":[{\"login\":\"id\"}],\"token\":{\"login\":\"token\"},\"uid\":{\"login\":\"id\"}},\"kRoomMemberDel\":{\"kRoomId\":{\"kRoomNew\":\"kRoomId\"},\"opUid\":[{\"login\":\"id\"}],\"token\":{\"login\":\"token\"},\"uid\":{\"login\":\"id\"}},\"kRoomMemberLeave\":{\"kRoomId\":{\"kRoomNew\":\"kRoomId\"},\"token\":{\"login\":\"token\"},\"uid\":{\"login\":\"id\"}},\"kRoomMyList\":{\"limit\":10,\"page\":1,\"token\":{\"login\":\"token\"},\"uid\":{\"login\":\"id\"}},\"kRoomNew\":{\"token\":{\"login\":\"token\"},\"poster\":\"\",\"name\":\"创建K歌房接口\",\"password\":\"\",\"desc\":\"创建K歌房接口\",\"uid\":{\"login\":\"id\"},\"role\":\"public_role\",\"tag\":[\"kRoomTagList\",0,\"tag\"],\"songs\":[]},\"kRoomSongList\":{\"kRoomId\":{\"kRoomNew\":\"kRoomId\"},\"limit\":10,\"page\":1},\"kRoomSongListUpdate\":{\"kRoomId\":{\"kRoomNew\":\"kRoomId\"},\"songs\":[\"\"],\"token\":{\"login\":\"token\"},\"uid\":{\"login\":\"id\"}},\"kRoomTagList\":{\"limit\":10,\"page\":1},\"kRoomUpdate\":{\"kRoomId\":{\"kRoomNew\":\"kRoomId\"},\"token\":{\"login\":\"token\"},\"poster\":\"\",\"password\":\"123456\",\"desc\":\"\",\"uid\":{\"login\":\"id\"},\"role\":\"private_role\",\"tag\":[\"kRoomTagList\",0,\"tag\"]},\"login\":{\"guid\":\"guid\",\"os\":\"android\",\"password\":\"123456\",\"phoneOrEmail\":\"18782947838\"},\"logout\":{\"uid\":{\"login\":\"id\"}}}', '{}', '', '1');
INSERT INTO `migu_module` VALUES ('11', '歌单接口', '[\"listSongList\",\"searchSongBySongList\",\"listSongs\"]', '{\"listSongList\":{\"limit\":10,\"page\":1},\"listSongs\":{\"ids\":[[\"searchSongBySongList\",0,\"uuid\"],[\"searchSongBySongList\",1,\"uuid\"]]},\"searchSongBySongList\":{\"limit\":10,\"page\":1,\"songListType\":\"official\",\"songListUUIDs\":[[\"listSongList\",0,\"uuid\"],[\"listSongList\",1,\"uuid\"]]}}', '{}', '', '1');
INSERT INTO `migu_module` VALUES ('12', '签到相关接口', '[\"login\",\"showUserDetail\",\"userSignInfo\",\"userSignTable\",\"userSignInfo\",\"showUserDetail\",\"logout\"]', '{\"login\":{\"guid\":\"guid\",\"os\":\"android\",\"password\":\"123456\",\"phoneOrEmail\":\"18782947838\"},\"logout\":{\"uid\":{\"login\":\"id\"}},\"showUserDetail\":{\"oid\":{\"login\":\"id\"},\"uid\":{\"login\":\"id\"}},\"userSignInfo\":{\"token\":{\"login\":\"token\"},\"uid\":{\"login\":\"id\"}},\"userSignTable\":{\"token\":{\"login\":\"token\"},\"uid\":{\"login\":\"id\"}}}', '{}', '', '1');
INSERT INTO `migu_module` VALUES ('13', '三方登录相关接口', '[\"tLogin\",\"checkLogin\",\"systemTime\",\"dynamicCount\",\"logout\",\"checkLogin\"]', '{\"checkLogin\":{\"token\":{\"tLogin\":\"token\"},\"uid\":{\"tLogin\":\"id\"}},\"dynamicCount\":{\"createAt\":{\"systemTime\":\"time\"},\"uid\":{\"tLogin\":\"id\"}},\"logout\":{\"uid\":{\"tLogin\":\"id\"}},\"systemTime\":{},\"tLogin\":{\"guid\":\"guid\",\"openId\":\"CC3B2133401F05312A8333B1A4DDA0A7\",\"source\":\"tencent\"}}', '{}', '', '1');
INSERT INTO `migu_module` VALUES ('14', '三方登录签到', '[\"tLogin\",\"showUserDetail\",\"userSignInfo\",\"userSignTable\",\"userSignInfo\",\"showUserDetail\",\"logout\"]', '{\"logout\":{\"uid\":{\"tLogin\":\"id\"}},\"showUserDetail\":{\"oid\":{\"tLogin\":\"id\"},\"uid\":{\"tLogin\":\"id\"}},\"tLogin\":{\"guid\":\"guid\",\"openId\":\"CC3B2133401F05312A8333B1A4DDA0A7\",\"source\":\"tencent\"},\"userSignInfo\":{\"token\":{\"tLogin\":\"token\"},\"uid\":{\"tLogin\":\"id\"}},\"userSignTable\":{\"token\":{\"tLogin\":\"token\"},\"uid\":{\"tLogin\":\"id\"}}}', '{}', '', '1');
INSERT INTO `migu_module` VALUES ('15', '三方账户用户信息模块', '[\"tLogin\",\"showUserDetail\",\"searchUser\",\"modifyNickname\",\"modifyPassword\",\"modifySignature\",\"showUserDetail\",\"searchUser\",\"unBind\",\"showUserDetail\",\"userBind\",\"showUserDetail\",\"userBehavior\",\"bindEmail\",\"bindPhone\",\"checkEmail\",\"checkNickname\",\"checkPhone\",\"editUser\",\"showUserDetail\",\"searchUser\",\"logout\"]', '{\"bindEmail\":{\"email\":\"xwxia@iflytek.com\",\"password\":\"123456\",\"uid\":{\"tLogin\":\"id\"}},\"bindPhone\":{\"password\":\"123456\",\"phone\":\"18782947838\",\"uid\":{\"tLogin\":\"id\"}},\"checkEmail\":{\"email\":\"xwxia@iflytek.com\"},\"checkNickname\":{\"nickname\":{\"tLogin\":\"nickname\"}},\"checkPhone\":{\"phone\":\"18782947838\"},\"editUser\":{\"address\":\"美城云庭\",\"age\":24,\"birthday\":\"1991-08-22\",\"city\":\"成都市\",\"gender\":\"male\",\"lat\":31.5,\"lng\":103.4,\"nickname\":{\"tLogin\":\"nickname\"},\"poster\":\"http://qzapp.qlogo.cn/qzapp/100526240/CC3B2133401F05312A8333B1A4DDA0A7/100\",\"signature\":\"呵呵哈哈哈\",\"uid\":{\"tLogin\":\"id\"}},\"logout\":{\"uid\":{\"tLogin\":\"id\"}},\"modifyNickname\":{\"nickname\":\"zxye\",\"uid\":{\"tLogin\":\"id\"}},\"modifyPassword\":{\"newPassword\":\"123456\",\"oldPassword\":\"123456\",\"uid\":{\"tLogin\":\"id\"}},\"modifySignature\":{\"signature\":\"呵呵呵呵呵呵呵呵呵呵\",\"uid\":{\"tLogin\":\"id\"}},\"searchUser\":{\"limit\":10,\"nickname\":{\"tLogin\":\"nickname\"},\"page\":1},\"showUserDetail\":{\"oid\":{\"tLogin\":\"id\"},\"uid\":{\"tLogin\":\"id\"}},\"tLogin\":{\"guid\":\"guid\",\"openId\":\"CC3B2133401F05312A8333B1A4DDA0A7\",\"source\":\"tencent\"},\"unBind\":{\"source\":\"tencent\",\"uid\":{\"tLogin\":\"id\"}},\"userBehavior\":{\"code\":\"CODE_HEARTBEEP\",\"device\":\"android\",\"uid\":{\"tLogin\":\"id\"}},\"userBind\":{\"avatar\":\"http://qzapp.qlogo.cn/qzapp/100526240/CC3B2133401F05312A8333B1A4DDA0A7/100\",\"idStr\":\"CC3B2133401F05312A8333B1A4DDA0A7\",\"name\":\"叶尔羌\",\"screenName\":\"叶尔羌\",\"source\":\"tencent\",\"uid\":{\"tLogin\":\"id\"}}}', '{}', '', '1');
INSERT INTO `migu_module` VALUES ('16', '首页接口', '[\"splashPic\",\"listBanner\",\"listRecommendTag\",\"opusRankingList\"]', '{\"listBanner\":{\"channel\":\"0146585\",\"limit\":100,\"page\":1,\"province\":\"北京\",\"showPosition\":\"homepageBanner\",\"uid\":1230208},\"listRecommendTag\":{\"page\":1},\"opusRankingList\":{\"isNew\":false,\"page\":1},\"splashPic\":{\"channel\":\"0146585\",\"device\":\"android\"}}', '{}', '', '1');
INSERT INTO `migu_module` VALUES ('17', '上报接口', '[\"listActivity\",\"reportActivityClick\",\"listRecommendSong\",\"reportSongDownload\",\"reportSaveMVLocalhost\"]', '{\"listRecommendSong\":{\"limit\":10,\"page\":1},\"reportActivityClick\":{\"activityId\":[\"listActivity\",0,\"uuid\"],\"bannerOrList\":\"list\",\"activityName\":[\"listActivity\",0,\"name\"]},\"reportSaveMVLocalhost\":{\"songid\":[\"listRecommendSong\",0,\"uuid\"],\"songName\":[\"listRecommendSong\",0,\"name\"],\"singerName\":[\"listRecommendSong\",0,[\"artist\",0]]},\"listActivity\":{\"province\":\"四川省\",\"uid\":\"1230208\",\"limit\":\"10\",\"mode\":\"Default\",\"page\":\"1\",\"channel\":\"0146585\"},\"reportSongDownload\":{\"downStatus\":\"success\",\"songid\":[\"listRecommendSong\",0,\"uuid\"],\"downloadType\":\"common\",\"songName\":[\"listRecommendSong\",0,\"name\"],\"singerName\":[\"listRecommendSong\",0,[\"artist\",0]]}}', '{}', '', '1');
INSERT INTO `migu_module` VALUES ('18', 'TV发现页面', '[\r\n    \"tvGetFoundTags\",\r\n    \"tvGetCoversByTag\"\r\n]', '{\r\n    \"tvGetCoversByTag\": {\r\n        \"count\": 10,\r\n        \"protocolver\": \"2.0.0\",\r\n        \"tag\": {\r\n            \"tvGetFoundTags\": [\r\n                \"list\",\r\n                0,\r\n                \"tag\"\r\n            ]\r\n        },\r\n        \"tagtype\": {\r\n            \"tvGetFoundTags\": [\r\n                \"list\",\r\n                0,\r\n                \"tagtype\"\r\n            ]\r\n        },\r\n        \"start\": \"1\"\r\n    },\r\n    \"tvGetFoundTags\": {\r\n        \"protocolver\": \"2.0.0\"\r\n    }\r\n}', '{}', '', '1');
INSERT INTO `migu_module` VALUES ('19', '附近的人模块', '[\"login\",\"opusInvisible\",\"opusGisSearch\"]', '{\r\n    \"login\": {\r\n        \"guid\": \"guid\",\r\n        \"os\": \"android\",\r\n        \"password\": \"123456\",\r\n        \"phoneOrEmail\": \"18782947838\"\r\n    },\r\n    \"opusGisSearch\": {\r\n        \"gender\": \"male\",\r\n        \"lng\": 104.3,\r\n        \"limit\": 10,\r\n        \"lat\": 23.3,\r\n        \"page\": 1\r\n    },\r\n    \"opusInvisible\": {\r\n\"token\":{\"login\":\"token\"},\r\n        \"gisInvisible\": false,\r\n        \"uid\": {\"login\":\"id\"}\r\n    }\r\n}', '{}', '', '1');
INSERT INTO `migu_module` VALUES ('20', 'K歌房消息统计', '[\r\n    \"login\",\r\n    \"kRoomMyList\",\r\n    \"kRoomComment\",\r\n    \"kRoomCommentList\",\r\n    \"kRoomCommentSize\",\r\n    \"kRoomMessages\"\r\n]', '{\r\n    \"kRoomMessages\": {\r\n        \"uid\": {\r\n            \"login\": \"id\"\r\n        }\r\n    },\r\n    \"kRoomCommentSize\": {\r\n        \"kRoomIds\": [\r\n            [\r\n                \"kRoomMyList\",\r\n                0,\r\n                \"kRoomId\"\r\n            ],\r\n            \"\"\r\n        ],\r\n        \"token\": {\r\n            \"login\": \"token\"\r\n        },\r\n        \"uid\": {\r\n            \"login\": \"id\"\r\n        }\r\n    },\r\n    \"kRoomComment\": {\r\n        \"comment\": \"K歌房评论接口\",\r\n        \"to\": {\r\n            \"login\": \"id\"\r\n        },\r\n        \"token\": {\r\n            \"login\": \"token\"\r\n        },\r\n        \"from\": {\r\n            \"login\": \"id\"\r\n        },\r\n        \"kRoomId\": [\r\n            \"kRoomMyList\",\r\n            0,\r\n            \"kRoomId\"\r\n        ]\r\n    },\r\n    \"kRoomMyList\": {\r\n        \"token\": {\r\n            \"login\": \"token\"\r\n        },\r\n        \"limit\": 10,\r\n        \"page\": 1,\r\n        \"uid\": {\r\n            \"login\": \"id\"\r\n        }\r\n    },\r\n    \"kRoomCommentList\": {\r\n        \"limit\": 10,\r\n        \"page\": 1,\r\n        \"kRoomId\": [\r\n            \"kRoomMyList\",\r\n            0,\r\n            \"kRoomId\"\r\n        ]\r\n    },\r\n    \"login\": {\r\n        \"password\": \"123456\",\r\n        \"guid\": \"guid\",\r\n        \"os\": \"android\",\r\n        \"phoneOrEmail\": \"18782947838\"\r\n    }\r\n}', '{}', '', '1');
INSERT INTO `migu_module` VALUES ('21', '统一认证-编辑用户信息', '[\r\n    \"login\",\r\n    \"modifyNickname\",\r\n    \"login\",\r\n    \"modifySignature\",\r\n    \"login\",\r\n    \"editUser\",\r\n    \"login\",\r\n    \"modifyPassword\",\r\n    \"login\"\r\n]', '{\r\n    \"modifyNickname\": {\r\n        \"nickname\": \"仲夏叶@统一改名\",\r\n        \"uid\": {\r\n            \"login\": \"id\"\r\n        }\r\n    },\r\n    \"login\": {\r\n        \"password\": \"123456\",\r\n        \"guid\": \"guid\",\r\n        \"os\": \"android\",\r\n        \"phoneOrEmail\": \"18782947838\"\r\n    },\r\n    \"modifySignature\": {\r\n        \"uid\": {\r\n            \"login\": \"id\"\r\n        },\r\n        \"signature\": \"统一@修改签名接口\"\r\n    },\r\n    \"editUser\": {\r\n        \"city\": \"成都市\",\r\n        \"uid\": {\r\n            \"login\": \"id\"\r\n        },\r\n        \"gender\": \"male\",\r\n        \"age\": 24,\r\n        \"signature\": \"统一@编辑用户信息接口\",\r\n        \"poster\": \"http://qzapp.qlogo.cn/qzapp/100526240/CC3B2133401F05312A8333B1A4DDA0A7/100\",\r\n        \"birthday\": \"1991-08-22\",\r\n        \"address\": \"美城云庭\",\r\n        \"lat\": 31.5,\r\n        \"lng\": 103.4,\r\n        \"nickname\": \"仲夏叶@统一editUser\"\r\n    },\r\n    \"modifyPassword\": {\r\n        \"newPassword\": \"654321\",\r\n        \"oldPassword\": \"123456\",\r\n        \"uid\": {\r\n            \"login\": \"id\"\r\n        }\r\n    }\r\n}', '{}', '', '1');
INSERT INTO `migu_module` VALUES ('22', '统一认证-检查接口', '[\r\n    \"checkEmail\",\r\n    \"checkNickname\",\r\n    \"checkPhone\"\r\n]', '{\r\n    \"checkEmail\": {\r\n        \"email\": \"xwxia@iflytek.com\"\r\n    },\r\n    \"checkNickname\": {\r\n        \"nickname\": \"﻿仲夏叶\"\r\n    },\r\n    \"checkPhone\": {\r\n        \"phone\": \"18782947838\"\r\n    }\r\n}', '{}', '', '1');
INSERT INTO `migu_module` VALUES ('23', '统一认证-修改密码', '[\r\n    \"login\",\r\n    \"modifyPassword\",\r\n    \"login\"\r\n]', '{\r\n    \"login\": {\r\n        \"guid\": \"guid\",\r\n        \"os\": \"android\",\r\n        \"password\": \"123456\",\r\n        \"phoneOrEmail\": \"18782947838\"\r\n    },\r\n    \"modifyPassword\": {\r\n        \"newPassword\": \"654321\",\r\n        \"oldPassword\": \"123456\",\r\n        \"uid\": {\"login\":\"id\"}\r\n    }\r\n}', '{}', '', '1');
INSERT INTO `migu_module` VALUES ('24', '统一认证-绑定接口', '[\r\n    \"login\",\r\n    \"bindEmail\",\r\n\"login\",\r\n\"bindPhone\",\r\n    \"login\",\"userBind\",\"login\"\r\n]', '{\r\n    \"bindEmail\": {\r\n        \"email\": \"xwxia@iflytek.com\",\r\n        \"password\": \"123456\",\r\n        \"uid\": {\r\n            \"login\": \"id\"\r\n        }\r\n    },\r\n    \"bindPhone\": {\r\n        \"password\": \"123456\",\r\n        \"phone\": \"18782947838\",\r\n        \"uid\": {\r\n            \"login\": \"id\"\r\n        }\r\n    },\r\n    \"login\": {\r\n        \"guid\": \"guid\",\r\n        \"os\": \"android\",\r\n        \"password\": \"123456\",\r\n        \"phoneOrEmail\": \"18782947838\"\r\n    },\r\n    \"userBind\": {\r\n        \"avatar\": \"http://qzapp.qlogo.cn/qzapp/100526240/CC3B2133401F05312A8333B1A4DDA0A7/100\",\r\n        \"idStr\": \"CC3B2133401F05312A8333B1A4DDA0A7\",\r\n        \"name\": \"叶尔羌\",\r\n        \"screenName\": \"叶尔羌\",\r\n        \"source\": \"tencent\",\r\n        \"uid\": {\r\n            \"login\": \"id\"\r\n        }\r\n    }\r\n}', '{}', '', '1');
INSERT INTO `migu_module` VALUES ('25', '统一认证-注册登录', '[\r\n    \"userRegisterService\",\r\n    \"login\",\r\n    \"tUserRegisterService\",\r\n    \"tLogin\",\r\n    \"tvTUserRegister\",\r\n    \"tvTLogin\"\r\n]', '{\r\n    \"tvTLogin\": {\r\n        \"openid\": \"仲夏叶\",\r\n        \"stbid\": \"stbid\",\r\n        \"source\": \"taobao\",\r\n        \"osid\": \"tv\"\r\n    },\r\n    \"tUserRegisterService\": {\r\n        \"province\": \"四川省\",\r\n        \"city\": \"成都市\",\r\n        \"description\": \"第三方注册接口\",\r\n        \"openId\": \"CC3B2133401F05312A8333B1A4DDA0A7\",\r\n        \"gender\": \"male\",\r\n        \"os\": \"android\",\r\n        \"screenName\": \"叶尔羌\",\r\n        \"profileImageUrl\": \"http://qzapp.qlogo.cn/qzapp/100526240/CC3B2133401F05312A8333B1A4DDA0A7/100\",\r\n        \"profileUrl\": \"http://about.me/stornado\",\r\n        \"source\": \"tencent\",\r\n        \"avatarLarge\": \"http://qzapp.qlogo.cn/qzapp/100526240/CC3B2133401F05312A8333B1A4DDA0A7/100\",\r\n        \"location\": \"剑南大道南段338号\",\r\n        \"poster\": \"http://qzapp.qlogo.cn/qzapp/100526240/CC3B2133401F05312A8333B1A4DDA0A7/100\",\r\n        \"guid\": \"guid\",\r\n        \"nickname\": \"叶尔羌\",\r\n        \"name\": \"叶尔羌\"\r\n    },\r\n    \"tvTUserRegister\": {\r\n        \"province\": \"四川省\",\r\n        \"city\": \"成都市\",\r\n        \"stbid\": \"stbid\",\r\n        \"description\": \"第三方注册接口淘宝TV\",\r\n        \"openid\": \"仲夏叶\",\r\n        \"gender\": \"male\",\r\n        \"profileImageUrl\": \"http://qzapp.qlogo.cn/qzapp/100526240/CC3B2133401F05312A8333B1A4DDA0A7/100\",\r\n        \"profileUrl\": \"http://about.me/stornado\",\r\n        \"source\": \"taobao\",\r\n        \"avatarLarge\": \"http://qzapp.qlogo.cn/qzapp/100526240/CC3B2133401F05312A8333B1A4DDA0A7/100\",\r\n        \"location\": \"剑南大道南段338号\",\r\n        \"poster\": \"http://qzapp.qlogo.cn/qzapp/100526240/CC3B2133401F05312A8333B1A4DDA0A7/100\",\r\n        \"osid\": \"android\",\r\n        \"screenName\": \"仲夏叶\",\r\n        \"nickname\": \"仲夏叶\",\r\n        \"name\": \"仲夏叶\"\r\n    },\r\n    \"login\": {\r\n        \"password\": \"123456\",\r\n        \"guid\": \"guid\",\r\n        \"os\": \"android\",\r\n        \"phoneOrEmail\": \"18782947838\"\r\n    },\r\n    \"userRegisterService\": {\r\n        \"guid\": \"guid\",\r\n        \"os\": \"android\",\r\n        \"gender\": \"male\",\r\n        \"phone\": \"18782947838\",\r\n        \"poster\": \"http://qzapp.qlogo.cn/qzapp/100526240/CC3B2133401F05312A8333B1A4DDA0A7/100\",\r\n        \"password\": \"123456\",\r\n        \"nickname\": \"仲夏叶\"\r\n    },\r\n    \"tLogin\": {\r\n        \"openId\": \"CC3B2133401F05312A8333B1A4DDA0A7\",\r\n        \"guid\": \"guid\",\r\n        \"source\": \"tencent\"\r\n    }\r\n}', '{}', '', '1');
INSERT INTO `migu_module` VALUES ('26', '统一认证-绑定解绑', '[\"login\",\"tLogin\",\"userBind\",\"tLogin\",\"login\",\"unBind\",\"login\",\"tLogin\"]', '{\r\n    \"login\": {\r\n        \"guid\": \"guid\",\r\n        \"os\": \"android\",\r\n        \"password\": \"123456\",\r\n        \"phoneOrEmail\": \"18782947838\"\r\n    },\r\n    \"tLogin\": {\r\n        \"guid\": \"guid\",\r\n        \"openId\": \"CC3B2133401F05312A8333B1A4DDA0A7\",\r\n        \"source\": \"tencent\"\r\n    },\r\n    \"unBind\": {\r\n        \"source\": \"tencent\",\r\n        \"uid\": {\r\n            \"login\": \"id\"\r\n        }\r\n    },\r\n    \"userBind\": {\r\n        \"avatar\": \"http://qzapp.qlogo.cn/qzapp/100526240/CC3B2133401F05312A8333B1A4DDA0A7/100\",\r\n        \"idStr\": \"CC3B2133401F05312A8333B1A4DDA0A7\",\r\n        \"name\": \"叶尔羌\",\r\n        \"screenName\": \"叶尔羌\",\r\n        \"source\": \"tencent\",\r\n        \"uid\": {\r\n            \"login\": \"id\"\r\n        }\r\n    }\r\n}', '{}', '', '1');
INSERT INTO `migu_module` VALUES ('27', 'TV抽奖活动', '[\r\n    \"tvGetConfig\",\r\n    \"tvChannelActivity\",\r\n    \"tvChannelActivityProc\",\r\n    \"tvChannelActivityResult\"\r\n]', '{\r\n    \"tvChannelActivity\": {\r\n        \"mac\": \"00-FF-3A-A1-35-D5\",\r\n        \"channel\": \"0146585\"\r\n    },\r\n    \"tvChannelActivityResult\": {\r\n        \"phone\": \"18782947838\",\r\n        \"activityId\": {\r\n            \"tvChannelActivity\": \"activityId\"\r\n        },\r\n        \"mac\": \"00-FF-3A-A1-35-D5\",\r\n        \"channel\": \"0146585\",\r\n        \"uuid\": {\r\n            \"tvChannelActivityProc\": \"uuid\"\r\n        }\r\n    },\r\n    \"tvChannelActivityProc\": {\r\n        \"sn\": \"452a6ed2-b173-4462-b7ec-b6a256ce01d4\", \r\n        \"activityId\": {\r\n            \"tvChannelActivity\": \"activityId\"\r\n        },\r\n        \"mac\": \"00-FF-3A-A1-35-D5\",\r\n        \"channel\": \"0146585\"\r\n    },\r\n    \"tvGetConfig\": {\r\n        \"mac\": \"00-FF-3A-A1-35-D5\",\r\n        \"channel\": \"0146585\"\r\n    }\r\n}', '{}', '', '1');

-- ----------------------------
-- Table structure for migu_open_service
-- ----------------------------
DROP TABLE IF EXISTS `migu_open_service`;
CREATE TABLE `migu_open_service` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `service` varchar(50) NOT NULL,
  `version` varchar(5) NOT NULL,
  `data` longtext NOT NULL,
  `description` longtext,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `migu_open_service_version_uniq` (`version`,`service`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of migu_open_service
-- ----------------------------
INSERT INTO `migu_open_service` VALUES ('1', '搜索歌曲资源接口', 'openSearchSong', '2.0', '{\"song\": \"冰雨\", \"artist\": \"刘德华\"}', '', '1');
INSERT INTO `migu_open_service` VALUES ('2', '获取歌单接口', 'openGetColumn', '2.0', '{\"count\": 10, \"start\": 1}', '', '1');
INSERT INTO `migu_open_service` VALUES ('3', '获取歌单歌曲列表接口', 'openGetSongsByClm', '2.0', '{\"programno\": \"1f113e8e5d08422ea8837e7091b0af63\", \"start\": 1, \"count\": 10}', '', '1');
INSERT INTO `migu_open_service` VALUES ('4', '锁定歌单接口', 'openLock', '2.0', '{\"ids\": [\"1e675e2d78d3423aa2124a971a3a5a49\"]}', '', '1');
INSERT INTO `migu_open_service` VALUES ('5', '解锁歌单接口', 'openUnLock', '2.0', '{\"ids\": [\"1e675e2d78d3423aa2124a971a3a5a49\"]}', '', '1');
INSERT INTO `migu_open_service` VALUES ('6', '获取歌单接口', 'openGetColumnByNo', '3.0', '{\"programno\": \"0\", \"start\": 1, \"count\": 10}', '0 返回电视版歌单\r\n1 返回分类歌单+最新歌单', '1');

-- ----------------------------
-- Table structure for migu_plugin_service
-- ----------------------------
DROP TABLE IF EXISTS `migu_plugin_service`;
CREATE TABLE `migu_plugin_service` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `service` varchar(50) NOT NULL,
  `version` varchar(5) NOT NULL,
  `data` longtext NOT NULL,
  `description` longtext,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `migu_plugin_service_version_uniq` (`version`,`service`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of migu_plugin_service
-- ----------------------------
INSERT INTO `migu_plugin_service` VALUES ('1', '自动匹配歌曲及歌手', 'pluginAutoCompleteSongAndArtist', '2.0', '{\"limit\": 10, \"page\": 1, \"keyword\": \"你的\"}', '根据输入自动查找匹配的歌手、歌曲', '1');
INSERT INTO `migu_plugin_service` VALUES ('2', '热门搜索词', 'pluginListHotKeyword', '2.0', '{\"limit\": 10, \"page\": 1}', '获取热门搜索词（歌手名称或歌曲名称）', '1');
INSERT INTO `migu_plugin_service` VALUES ('3', '搜索歌曲及歌手', 'pluginSearchSongAndArtist', '2.0', '{\"limit\": 10, \"page\": 1, \"keyword\": \"你的\"}', '搜索歌手、歌曲 ', '1');
INSERT INTO `migu_plugin_service` VALUES ('4', '歌单列表', 'pluginGetColumnByNo', '2.0', '{}', '获取栏目的子栏目列表。返回结果按照序号排列，序号在后台歌单管理中配置。栏目支持渠道号可在后台管理系统配置。', '1');
INSERT INTO `migu_plugin_service` VALUES ('5', '获取歌单歌曲', 'pluginGetSongsByClm', '2.0', '{\"count\": 10, \"programno\": \"105\", \"start\": 1}', '获取歌曲栏目中的歌曲列表。当没有取到资源时候，依然返回成功，只是返回的结果为空。 该接口只返回歌曲的基本信息，下载地址等由下载接口返回，歌单歌曲顺序由后台管理系统配置。', '1');
INSERT INTO `migu_plugin_service` VALUES ('6', '歌手全名点歌', 'pluginGetSongsByMuliType', '2.0', '{\"count\": 10, \"start\": 1, \"signtype\": \"0\", \"signinfo\": \"\"}', '获取歌曲信息列表。signtype 为5。', '1');
INSERT INTO `migu_plugin_service` VALUES ('7', '栏目歌手', 'pluginGetSingersByClm', '2.0', '{}', '按照关键词搜索，获取歌手栏目中的歌手列表，返回结果按歌手点唱次数倒序。当没有取到作品时候，依然返回成功，只是返回的结果为空。', '1');
INSERT INTO `migu_plugin_service` VALUES ('8', '用户详情', 'pluginShowUserDetail', '2.0', '{}', '获取用户详情 ', '1');
INSERT INTO `migu_plugin_service` VALUES ('9', '用户作品列表', 'pluginListUserMV', '2.0', '{}', '获取用户作品列表', '1');
INSERT INTO `migu_plugin_service` VALUES ('10', '用户相册列表', 'pluginListPhoto', '2.0', '{}', '获取用户相片', '1');
INSERT INTO `migu_plugin_service` VALUES ('11', '用户动态列表', 'pluginListUserDynamic', '2.0', '{}', '获取用户动态', '1');
INSERT INTO `migu_plugin_service` VALUES ('12', '根据ucid获取用户详情', 'pluginGetUserInfoById', '2.0', '{}', '根据ucid获取用户详情', '1');
INSERT INTO `migu_plugin_service` VALUES ('13', '关注用户', 'pluginFollowUser', '2.0', '{}', '关注用户。', '1');
INSERT INTO `migu_plugin_service` VALUES ('14', '取消关注', 'pluginUnFollowUser', '2.0', '{}', '取消对用户的关注。', '1');
INSERT INTO `migu_plugin_service` VALUES ('15', '查询用户关注状态', 'pluginCheckRelation', '2.0', '{}', '查询关注关系', '1');
INSERT INTO `migu_plugin_service` VALUES ('16', '关注列表', 'pluginListFollowUser', '2.0', '{}', '获取用户关注列表', '1');
INSERT INTO `migu_plugin_service` VALUES ('17', '获取用户关注列表', 'pluginListFans', '2.0', '{}', '获取用户粉丝列表', '1');
INSERT INTO `migu_plugin_service` VALUES ('18', '举报', 'pluginReport', '2.0', '{}', '举报接口', '1');

-- ----------------------------
-- Table structure for migu_server
-- ----------------------------
DROP TABLE IF EXISTS `migu_server`;
CREATE TABLE `migu_server` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `address` varchar(255) NOT NULL,
  `key` varchar(50) DEFAULT NULL,
  `postfix` varchar(50) NOT NULL,
  `postfix_file` varchar(50) NOT NULL,
  `additional` longtext NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of migu_server
-- ----------------------------
INSERT INTO `migu_server` VALUES ('1', '现网测试环境', 'http://test.migu.cn:90', '', '/do', '/do_file', '{}', '1');
INSERT INTO `migu_server` VALUES ('2', '现网环境', 'http://jk.ising.migu.cn', '', '/do', '/do_file', '{\"log\":\"y\"}', '1');
INSERT INTO `migu_server` VALUES ('3', '现网环境-电视版接口', 'http://tv.ising.migu.cn', '', '/do', '/do_file', '{\"log\":\"y\"}', '1');
INSERT INTO `migu_server` VALUES ('4', '现网环境-第三方测试', 'http://test.migu.cn:90/testinterface', '', '/do', '/do_file', '{\"log\":\"y\"}', '1');
INSERT INTO `migu_server` VALUES ('5', '现网测试环境-天猫唤起接口', 'http://test.migu.cn:90', '5GEYBZMPCRFLH1KU79WXNSOI6DTJQ834', '/open', '/open', '{\"secure_key\":\"61467404667417\"}', '1');

-- ----------------------------
-- Table structure for migu_test_result
-- ----------------------------
DROP TABLE IF EXISTS `migu_test_result`;
CREATE TABLE `migu_test_result` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service` varchar(50) NOT NULL,
  `version` varchar(25) NOT NULL,
  `data` longtext NOT NULL,
  `url` longtext NOT NULL,
  `headers` longtext,
  `status` int(11) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `result` longtext,
  `ExecutionTime` double NOT NULL,
  `CreateTime` datetime NOT NULL,
  `server_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `migu_test_result_5dc6e1b7` (`server_id`),
  CONSTRAINT `migu_test_result_server_id_c017d42_fk_migu_server_id` FOREIGN KEY (`server_id`) REFERENCES `migu_server` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of migu_test_result
-- ----------------------------

-- ----------------------------
-- Table structure for migu_tv_service
-- ----------------------------
DROP TABLE IF EXISTS `migu_tv_service`;
CREATE TABLE `migu_tv_service` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `service` varchar(50) NOT NULL,
  `version` varchar(5) NOT NULL,
  `data` longtext NOT NULL,
  `description` longtext,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `migu_tv_service_version_uniq` (`version`,`service`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of migu_tv_service
-- ----------------------------
INSERT INTO `migu_tv_service` VALUES ('1', '运行时配置getConfig', 'tvGetConfig', '2.0', '{\"protocolver\": \"2.0.0\"}', '接口说明：程序启动时调用，获取一些配置信息、判断是否需要进行升级、记录启动日志。激活用户信息，获取用户唯一标示。 1、判断客户端渠道是否有特殊升级配置，如果有，则使用特殊升级配置；如果没有，则使用默认升级配置     2、如果客户端版本在某个配置的升级区间内，则返回该区间的升级配置信息：         updatetype=1（自主升级）或2（强制升级），updateinfo=升级提示语         updateversion=升级到的版本编号，downloadurl=升级包下载地址     3、如果客户端版本不在任何配置的升级区间内，则返回updatetype=0(不升级)，其他字段为空 需要在后台配置客户端版本及版本', '1');
INSERT INTO `migu_tv_service` VALUES ('2', '获取滚动字幕getRollSubtitles ', 'tvGetRollSubtitles', '2.0', '{\"province\": \"四川省\", \"protocolver\": \"2.0.0\", \"channel\": \"A0001\"}', '客户端获取滚动的字幕信息', '1');
INSERT INTO `migu_tv_service` VALUES ('3', '获取用户信息getUserInfoById', 'tvGetUserInfoById', '2.0', '{\"protocolver\": \"2.0.0\", \"targetaccountid\": \"94f58396-2038-48c1-8444-70941c3f2110\", \"accountid\": \"94f58396-2038-48c1-8444-70941c3f2110\"}', '根据用户ID获取用户信息', '1');
INSERT INTO `migu_tv_service` VALUES ('4', '关注用户followUser', 'tvFollowUser', '2.0', '{\"targetaccountid\": \"94f58396-2038-48c1-8444-70941c3f2110\", \"accountid\": \"94f58396-2038-48c1-8444-70941c3f2110\"}', '关注用户', '1');
INSERT INTO `migu_tv_service` VALUES ('5', '取消关注用户unFollowUser ', 'tvUnFollowUser', '2.0', '{\"targetaccountid\": \"94f58396-2038-48c1-8444-70941c3f2110\", \"accountid\": \"94f58396-2038-48c1-8444-70941c3f2110\"}', '取消对用户的关注', '1');
INSERT INTO `migu_tv_service` VALUES ('6', '获取关注用户列表getFollowUsers', 'tvGetFollowUsers', '2.0', '{\"protocolver\": \"2.0.0\", \"start\": 1, \"count\": 10, \"accountid\": \"94f58396-2038-48c1-8444-70941c3f2110\"}', '获取当前账号所关注的用户列表，按关注时间倒序', '1');
INSERT INTO `migu_tv_service` VALUES ('7', '获取粉丝列表getFans', 'tvGetFans', '2.0', '{\"protocolver\": \"2.0.0\", \"start\": 1, \"count\": 10, \"accountid\": \"94f58396-2038-48c1-8444-70941c3f2110\"}', '获取关注了当前账号的所有用户列表，按关注时间倒序', '1');
INSERT INTO `migu_tv_service` VALUES ('8', '歌曲栏目列表getSongsByClm ', 'tvGetSongsByClm', '2.0', '{\"protocolver\": \"2.0.0\", \"programno\": \"76a4df2da23843de9f8ece5c67d4ebd9\", \"count\": 10, \"start\": 1}', '获取歌曲栏目中的歌曲列表。当没有取到资源时候，依然返回成功，只是返回的结果为空。 该接口只返回歌曲的基本信息，下载地址等由下载接口返回，歌单歌曲顺序由后台管理系统配置。', '1');
INSERT INTO `migu_tv_service` VALUES ('9', '歌手栏目列表getSingersByClm', 'tvGetSingersByClm', '2.0', '{\"protocolver\": \"2.0.0\", \"programno\": \"0\", \"signinfo\": \"W\", \"count\": 10, \"start\": 1}', '按照关键词搜索，获取歌手栏目中的歌手列表，返回结果按歌手点唱次数倒序。当没有取到作品时候，依然返回成功，只是返回的结果为空。栏目编号\r\n0：全部歌手列表\r\n1：男歌手\r\n2：女歌手 \r\n3：乐队组合\r\n', '1');
INSERT INTO `migu_tv_service` VALUES ('10', '子栏目列表getColumnByNo', 'tvGetColumnByNo', '2.0', '{\"protocolver\": \"2.0.0\", \"programno\": \"0\", \"count\": 10, \"channel\": \"0146585\", \"start\": 1}', '1. 栏目编号\r\n0：返回电视版所有子栏目（返回普通歌单+分类排行榜歌单）\r\n106：返回热歌榜单子栏目\r\n2. 该接口支持1.6及以前版本的业务，获取栏目的子栏目列表。返回结果按照序号排列，序号在后台歌单管理中配置。栏目支持渠道号可在后台管理系统配置。', '1');
INSERT INTO `migu_tv_service` VALUES ('11', '发现页面标签列表getFoundTags', 'tvGetFoundTags', '2.0', '{\"protocolver\": \"2.0.0\"}', '获取发现页面标签名列表，列表顺序为：1个咪咕推荐+前4个热门标签+前4个推荐标签（与手机端主页一致），其中热门标签与推荐标签的顺序由后台标签管理配置。', '1');
INSERT INTO `migu_tv_service` VALUES ('12', '获取歌曲列表getSongsByMuliType', 'tvGetSongsByMuliType', '2.0', '{\"protocolver\": \"2.0.0\", \"start\": 1, \"signtype\": \"1\", \"count\": 10, \"signinfo\": \"W\"}', '获取歌曲信息列表。该接口返回歌曲的详细信息，返回结果按点唱次数倒序排列。其中，即便搜索的是歌手，也是返回歌手的所有歌曲。（该接口使用接口缓存策略，因此返回的歌曲点唱次数不是实时数据，准确数据可由获取歌曲详情接口获得） 接口搜索方式说明：模糊搜索，但只匹配以搜索关键字开头的数据信息，其中，signtype 为2时，与歌曲名匹配的数据在前，与歌手名匹配的数据在后，signtype 为4时，与歌曲首字母匹配的数据在前，与歌手名匹配的数据在后。', '1');
INSERT INTO `migu_tv_service` VALUES ('13', '获取歌手列表getSingersByCapital', 'tvGetSingersByCapital', '2.0', '{\"protocolver\": \"2.0.0\", \"start\": 1, \"signinfo\": \"W\", \"count\": 10}', '获取歌手列表信息。该接口用于返回下载地址、更新时间等详细字段。请求个性化推荐歌手及统一歌手时，客户端需进行返回结果list与toplist的去重。', '1');
INSERT INTO `migu_tv_service` VALUES ('14', '获取推荐歌曲列表getRecommendSongs', 'tvGetRecommendSongs', '2.0', '{\"protocolver\": \"2.0.0\", \"start\": 1, \"count\": 10, \"toplist\": [\"你的样子\"]}', '获取推荐歌曲信息列表，由个性化推荐歌曲toplist和统一推荐歌曲list两部分组成返回列表。个性化推荐歌曲：客户端根据历史点歌记录传歌手名（toplist），后台随机抽取这些歌手点唱次数最高的5首歌曲中的2首（不足2首则有多少返回多少），作为toplist返回结果。统一推荐歌曲：list返回所有歌曲中点唱次数从高到低的歌曲列表。客户端需要对list与toplist的结果去重。', '1');
INSERT INTO `migu_tv_service` VALUES ('15', '获取作品图片列表getPhotosByCoverI', 'tvGetPhotosByCoverId', '2.0', '{\"protocolver\": \"2.0.0\", \"start\": 1, \"coverid\": \"0\", \"count\": 10}', '获取作品轮播图片列表。coverid传0的时候表示获取默认相册，不为0时候取出该作品对应的所有轮播图返回，如果没有，就返回空。', '1');
INSERT INTO `migu_tv_service` VALUES ('16', '校验相片checkPhoto', 'tvCheckPhoto', '2.0', '{\"list\": [{\"id\": \"b635c545b6684e3f8d5b1615933d7def\"}, {\"id\": \"168bf72e97114f0d8c5663a869fb4df3\"}]}', '上传之前调用该接口校验即将上传的相片是否已在服务器上', '1');
INSERT INTO `migu_tv_service` VALUES ('17', '上传作品图片uploadCoverPhotos', 'tvUploadCoverPhotos', '2.0', '{}', '上传作品轮播图片。', '1');
INSERT INTO `migu_tv_service` VALUES ('18', '获取用户相册列表 getUserPhotos', 'tvGetUserPhotos', '2.0', '{\"count\": 10, \"start\": 1, \"targetaccountid\": \"5cc49c7b-28ad-42e0-abc8-cbe99b7e866b\", \"accountid\": \"5cc49c7b-28ad-42e0-abc8-cbe99b7e866b\"}', '获取用户个人相册的相片。', '1');
INSERT INTO `migu_tv_service` VALUES ('19', '获取作品信息详情getCoverInfoById', 'tvGetCoverInfoById', '2.0', '{\"protocolver\": \"2.0.0\", \"coverid\": \"be9d831bd6f241d99383a820f0716a2f\"}', '获取一条翻唱记录的详细信息，作品欣赏时调用，作品播放次数+1。', '1');
INSERT INTO `migu_tv_service` VALUES ('20', '删除作品delCoverById', 'tvDelCoverById', '2.0', '{}', '删除翻唱作品，只能删除当前登陆账号下的演唱作品。', '1');
INSERT INTO `migu_tv_service` VALUES ('21', '上传作品uploadCover', 'tvUploadCover', '2.0', '{}', '将翻唱作品上传到服务端，进行存储。', '1');
INSERT INTO `migu_tv_service` VALUES ('22', '获取家庭翻唱作品getFamilyCovers', 'tvGetFamilyCovers', '2.0', '{\"protocolver\": \"2.0.0\", \"count\": 10, \"sorttype\": \"2\", \"start\": 1, \"osid\": \"Android-TV\", \"accountid\": \"94f58396-2038-48c1-8444-70941c3f2110\"}', '1. 排序 2  按照演唱时间倒序（演唱时间在上传时由客户端传，存在updateAt中）\r\n2. 获取某个家庭的翻唱记录。当没有取到作品时候，依然返回成功，只是返回的结果为空。该接口只返回作品的基本信息，欣赏地址、资源文件地址等由欣赏接口返回。该接口不返回由ae模板生成的mp4作品。', '1');
INSERT INTO `migu_tv_service` VALUES ('23', '获取作品评论列表getCommentsByCove', 'tvGetCommentsByCoverId', '2.0', '{\"count\": 10, \"start\": 1, \"coverid\": \"\"}', '获取作品的评论列表信息，包括评论内容、评论标签、评论时间，其中评论内容包含表情，放在[]中。返回结果按评论创建时间倒序，当没有评论时依然返回成功，只是返回的结果为空。', '1');
INSERT INTO `migu_tv_service` VALUES ('24', '获取推荐作品列表getCoversByTag', 'tvGetCoversByTag', '2.0', '{\"protocolver\": \"2.0.0\", \"start\": 1, \"tag\": \"真的再见了\", \"count\": 10, \"tagtype\": \"hot\"}', '根据标签名称获取作品列表信息，返回结果按序号、热度、创建时间联合排序，序号为正序，可由后台管理系统配置，热度及创建时间为倒序，当没有作品时依然返回成功，返回结果为空。', '1');
INSERT INTO `migu_tv_service` VALUES ('25', '获取歌曲详细信息getSongInfoById', 'tvGetSongInfoById', '2.0', '{\"protocolver\": \"2.0.0\", \"hwlevel\": 1, \"resourceno\": \"3ac45cc33547415099e9983617562fc9\"}', '获取歌曲详细信息。点唱时调用该接口，需将对应歌曲及歌手的点唱次数+1。', '1');
INSERT INTO `migu_tv_service` VALUES ('26', '获取热搜词列表getHotKeywords', 'tvGetHotKeywords', '2.0', '{\"protocolver\": \"2.0.0\", \"start\": 1, \"count\": 10}', '获取热门搜索词。热搜词可在后台热门搜索管理中进行配置，返回结果按照后台配置顺序进行排序。', '1');
INSERT INTO `migu_tv_service` VALUES ('27', '搜索词匹配autoCompleteKeywords', 'tvAutoCompleteKeywords', '2.0', '{\"protocolver\": \"2.0.0\", \"count\": 10, \"keyword\": \"王\"}', '根据输入内容自动匹配歌手名或歌曲名。根据^keyword进行匹配，输入“周”，则匹配“周”开头的歌手歌手及歌曲名；返回结果前5个为匹配歌手，name为歌手名，type为artist，后5个为匹配歌曲，name为歌曲 名，type为song，均按下载次数由高到低，不足5个则有多少返回多少。（返回的歌手可唱歌曲数大于0，返回的歌曲为支持电视版的歌曲） 备注：返回的歌曲名可能会重复', '1');
INSERT INTO `migu_tv_service` VALUES ('28', '第三方账号登陆tvTLoginc', 'tvTLogin', '2.0', '{\"osid\": \"tv\", \"openid\": \"咪咕TB2\", \"stbid\": \"stbid\", \"source\": \"taobao\"}', '若返回108说明账号不存在，需调用注册接口', '1');
INSERT INTO `migu_tv_service` VALUES ('29', '第三方账号注册tvTUserRegister', 'tvTUserRegister', '2.0', '{\"province\": \"四川省\", \"openid\": \"仲夏园\", \"stbid\": \"stbid\", \"name\": \"仲夏园\", \"city\": \"成都市\", \"gender\": \"male\", \"description\": \"第三方注册接口淘宝TV\", \"profileImageUrl\": \"http://qzapp.qlogo.cn/qzapp/100526240/CC3B2133401F05312A8333B1A4DDA0A7/100\", \"profileUrl\": \"http://about.me/stornado\", \"source\": \"taobao\", \"avatarLarge\": \"http://qzapp.qlogo.cn/qzapp/100526240/CC3B2133401F05312A8333B1A4DDA0A7/100\", \"location\": \"剑南大道南段338号\", \"poster\": \"http://qzapp.qlogo.cn/qzapp/100526240/CC3B2133401F05312A8333B1A4DDA0A7/100\", \"osid\": \"android\", \"nickname\": \"仲夏园\", \"screenName\": \"仲夏园\"}', '返回id nickname poster signature gender phone email birthday city token', '1');
INSERT INTO `migu_tv_service` VALUES ('31', '获取活动列表 tvGetActivityList', 'tvGetActivityList', '2.0', '{\"count\": 10, \"programno\": \"0\", \"osid\": \"Android-TV\", \"channel\": \"A0001\", \"start\": 1}', '活动列表及我的活动列表，均只显示全国活动，不显示地市活动，活动支持配置渠道可见。活动顺序可由后台管理系统配置。', '1');
INSERT INTO `migu_tv_service` VALUES ('32', '获取活动详情 tvGetActivityInfoById', 'tvGetActivityInfoById', '2.0', '{\"uuid\": \"\"}', '获取活动详情', '1');
INSERT INTO `migu_tv_service` VALUES ('33', '活动作品列表 tvGetActivityCovers', 'tvGetActivityCovers', '2.0', '{\"programno\": \"\", \"start\": 1, \"uuid\": \"\", \"count\": \"\"}', '获取活动作品列表，热门作品按照作品鲜花数倒序，最新榜按上传时间倒序。', '1');
INSERT INTO `migu_tv_service` VALUES ('34', '活动用户报名信息tvGetActivityUse', 'tvGetActivityUserInfo', '2.0', '{\"uuid\": \"\", \"accountid\": \"32767dd4-0d14-42b9-a888-f0d3ce263780\"}', '获取活动用户报名信息。', '1');
INSERT INTO `migu_tv_service` VALUES ('35', '活动报名tvActivityRegister', 'tvActivityRegister', '2.0', '{\"phone\": \"\", \"uuid\": \"\"}', '活动用户报名、修改资料接口。', '1');
INSERT INTO `migu_tv_service` VALUES ('36', '用户活动作品列表tvGetActivityUserCovers', 'tvGetActivityUserCovers', '2.0', '{\"count\": 10, \"start\": 1, \"uuid\": \"\", \"accountid\": \"\"}', '获取用户活动作品列表。', '1');
INSERT INTO `migu_tv_service` VALUES ('37', '删除活动作品tvDelActivityCover', 'tvDelActivityCover', '2.0', '{\"coverid\": \"\"}', '删除活动作品。成功后，作品变为普通作品。只有作品发布账号有操作权限。', '1');
INSERT INTO `migu_tv_service` VALUES ('38', '获取活动获奖通知getActivityPrize', 'tvGetActivityPrize', '2.0', '{\"accountid\": \"32767dd4-0d14-42b9-a888-f0d3ce263780\"}', '获取当前用户是否在活动中获奖。', '1');
INSERT INTO `migu_tv_service` VALUES ('39', '子栏目列表getColumnByNo(3.0)', 'tvGetColumnByNo', '3.0', '{\"protocolver\": \"2.0.0\", \"programno\": \"0\", \"count\": 10, \"channel\": \"0146585\", \"start\": 1}', '1. 栏目编号0：返回电视版所有子栏目（只返回普通歌单）;1：返回电视版分类排行榜歌单\r\n2. 该接口支持1.7及以后版本的业务，获取栏目的子栏目列表。返回结果按照序号排列，序号在后台歌单管理中配置。栏目支持渠道号可在后台管理系统配置。', '1');
INSERT INTO `migu_tv_service` VALUES ('40', '献花tvFlower(3.0)', 'tvFlower', '3.0', '{\"to\": 2927498, \"from\": 1226567, \"mvid\": \"cfb80527750c4ca8a1c34a95017fa265\"}', '给作品献花。默认一次献花献1朵，献花会消耗账户鲜花数量，账户鲜花数量不足时献花失败。', '1');
INSERT INTO `migu_tv_service` VALUES ('41', '获取家庭翻唱作品getFamilyCovers(3.0)', 'tvGetFamilyCovers', '3.0', '{\"protocolver\": \"2.0.0\", \"count\": 10, \"sorttype\": \"2\", \"start\": 1, \"osid\": \"Android-TV\", \"accountid\": \"94f58396-2038-48c1-8444-70941c3f2110\"}', '获取某个家庭的翻唱记录。当没有取到作品时候，依然返回成功，只是返回的结果为空。该接口只返回作品的基本信息，欣赏地址、资源文件地址等由欣赏接口返回。该接口返回包含由ae模板生成的mp4作品（covertype=3）。', '1');
INSERT INTO `migu_tv_service` VALUES ('42', '获取推荐作品列表getCoversByTag(3.0)', 'tvGetCoversByTag', '3.0', '{\"count\": 10, \"protocolver\": \"2.0.0\", \"tag\": \"咪咕推荐\", \"tagtype\": \"migu\", \"start\": 1}', '根据标签名称获取作品列表信息，返回结果按序号、热度、创建时间联合排序，序号为正序，可由后台管理系统配置，热度及创建时间为倒序，当没有作品时依然返回成功，返回结果为空。该接口返回包含由ae模板生成的mp4作品（covertype=3）。', '1');
INSERT INTO `migu_tv_service` VALUES ('43', '伴奏下载上报 tvReportSongDownload', 'tvReportSongDownload', '2.0', '{\"songid\": \"183f7b3151824038aeb8d878297876d9\", \"downloadType\": \"songList\", \"singerName\": \"童声\", \"songListId\": \"100259a535af4403a51ac05fad11000cx\", \"downStatus\": \"success\", \"songName\": \"童心是小鸟(高潮版)\"}', '客户端下载伴奏后调用，用于记录伴奏下载来源及情况，用于统计。', '1');
INSERT INTO `migu_tv_service` VALUES ('44', '获取轮播图 tvGetCarouselFigures(3.0)', 'tvGetCarouselFigures', '3.0', '{\"protocolver\": \"2.0.0\"}', '获取轮播图片列表。', '1');
INSERT INTO `migu_tv_service` VALUES ('45', '快速登录tvQLogin', 'tvQLogin', '3.0', '{\"guid\": \"guid\", \"phone\": \"18782947838\", \"serviceType\": \"104\", \"code\": \"\", \"os\": \"Android-TV\"}', '通过手机号与验证码登录。\r\n业务类型：\r\n101：绑定/换绑账号验证码\r\n102：激活账号验证码\r\n103：密码重置验证码\r\n104：注册登录\r\n105：设置/重置支付密码\r\n106：取消支付密码\r\n系统：\r\nandroid_phone\r\niphone\r\nAndroid-TV', '1');
INSERT INTO `migu_tv_service` VALUES ('46', '获取验证码tvGetVerificationCode', 'tvGetVerificationCode', '2.0', '{\"emailOrPhone\": \"18782947838\", \"serviceType\": \"104\", \"type\": \"phone\"}', '根据手机号获取验证码。\r\n业务类型：\r\n101：绑定/换绑账号验证码\r\n102：激活账号验证码\r\n103：密码重置验证码\r\n104：注册登录\r\n105：设置/重置支付密码\r\n106：取消支付密码', '1');
INSERT INTO `migu_tv_service` VALUES ('47', '获取闪屏图片tvSplashPic', 'tvSplashPic', '2.0', '{\"channel\": \"0146585\"}', '', '1');
INSERT INTO `migu_tv_service` VALUES ('48', '获取渠道活动tvChannelActivity(3.0)', 'tvChannelActivity', '3.0', '{\"mac\": \"00-FF-3A-A1-35-D5\", \"channel\": \"0146585\"}', '', '1');
INSERT INTO `migu_tv_service` VALUES ('49', '中奖后提交手机号码tvChannelActivityResult(3.0)', 'tvChannelActivityResult', '3.0', '{\"phone\": \"18782947838\", \"activityId\": \"aad07a78da644c828c8a0ca48ec9ec16\", \"mac\": \"00-FF-3A-A1-35-D5\", \"channel\": \"0146585\"}', '', '1');
INSERT INTO `migu_tv_service` VALUES ('50', '抽奖接口tvChannelActivityProc(3.0)', 'tvChannelActivityProc', '3.0', '{\"activityId\": \"aad07a78da644c828c8a0ca48ec9ec16\", \"mac\": \"00-FF-3A-A1-35-D5\", \"channel\": \"0146587\"}', '', '1');
INSERT INTO `migu_tv_service` VALUES ('51', 'cdn诊断上报接口tvCDNDiagnosticReport(3.0)', 'tvCDNDiagnosticReport', '3.0', '{\"traceRouteInfo\": \"trace\", \"networkInfo\": \"network\", \"httpInfo\": \"http\", \"dnsInfo\": \"dns\"}', '', '1');
INSERT INTO `migu_tv_service` VALUES ('52', '查询好友关系tvCheckRelation(3.0)', 'tvCheckRelation', '3.0', '{\"uid\": 2927498, \"fid\": 2927558}', '0：未关注  1：已关注  2：被关注 3：相互关注', '1');
