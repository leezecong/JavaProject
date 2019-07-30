/*
SQLyog Ultimate v13.1.1 (64 bit)
MySQL - 8.0.15 : Database - base_upms
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`base_upms` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `base_upms`;

/*Table structure for table `sys_datasource` */

DROP TABLE IF EXISTS `sys_datasource`;

CREATE TABLE `sys_datasource` (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `url` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新',
  `del_flag` char(50) DEFAULT '0' COMMENT '删除标记',
  `tenant_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '租户ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='数据源表';

/*Data for the table `sys_datasource` */

insert  into `sys_datasource`(`id`,`name`,`url`,`username`,`password`,`create_time`,`update_time`,`del_flag`,`tenant_id`) values 
('10','base_wx2','jdbc:mysql://base-mysql:3306/base_wx?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=GMT%2B8&allowMultiQueries=true','root','z6hVGBOMkEqLCmMhA+FHhA==','2019-05-14 14:50:32','2019-07-12 15:39:18','0','2'),
('11','base_wx','jdbc:mysql://base-mysql:3306/base_wx?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=GMT%2B8&allowMultiQueries=true','root','z6hVGBOMkEqLCmMhA+FHhA==','2019-05-24 21:47:43','2019-05-24 21:47:43','0','1');

/*Table structure for table `sys_dict` */

DROP TABLE IF EXISTS `sys_dict`;

CREATE TABLE `sys_dict` (
  `id` varchar(32) NOT NULL COMMENT '编号',
  `type` varchar(100) NOT NULL COMMENT '类型',
  `description` varchar(100) NOT NULL COMMENT '描述',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `sys_dict_del_flag` (`del_flag`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='字典表';

/*Data for the table `sys_dict` */

insert  into `sys_dict`(`id`,`type`,`description`,`create_time`,`update_time`,`remarks`,`del_flag`) values 
('1','log_type','日志类型','2019-01-22 11:06:44','2019-07-25 16:30:52','异常、正常','0'),
('11','wx_rep_type','微信回复消息类型','2019-04-12 16:46:24','2019-07-25 16:30:55','text：文本；image：图片；voice：语音；video：视频；music：音乐；news：图文','0'),
('12','wx_req_type','微信请求消息类型','2019-04-04 10:23:41','2019-07-25 16:30:58','text：文本；image：图片；voice：语音；video：视频；shortvideo：小视频；location：地理位置；event：事件推送','0'),
('13','wx_rep_mate','微信回复类型文本匹配类型','2019-04-13 11:11:57','2019-07-25 16:31:00','微信回复类型文本匹配类型','0'),
('14','weixin_type','公众号类型','2019-04-12 09:35:56','2019-07-25 16:31:05','公众号类型','0'),
('15','wx_qr_scene_str','微信二维码扫码场景','2019-04-29 11:50:57','2019-06-11 21:34:24','微信二维码扫码场景','0'),
('17','wx_subscribe','微信用户关注状态','2019-06-02 10:21:59','2019-06-11 21:34:24','微信用户关注状态','0'),
('18','wx_subscribe_scene','微信用户关注渠道','2019-06-02 10:27:25','2019-06-11 21:34:24','微信用户关注渠道','0'),
('19','wx_sex','微信性别','2019-06-02 10:31:16','2019-06-11 21:34:24','微信性别','0'),
('2','third_party_type','第三方登录类型','2019-03-19 11:09:44','2019-06-11 21:34:24','微信、QQ','0'),
('20','yes_no','是/否','2019-06-09 12:37:37','2019-06-11 21:34:24','是/否','0'),
('21','wx_event','微信事件类型','2019-06-09 12:42:02','2019-06-11 21:34:24','微信事件类型','0'),
('24','wx_verify_type','认证类型','2019-06-25 10:27:39','2019-06-25 10:27:39','认证类型','0'),
('26','wx_mass_msg_status','微信群发消息状态','2019-07-03 09:04:19','2019-07-03 09:04:19','微信群发消息状态','0'),
('3947ade00eea6517e2b66a1f7985fe1a','organ_type','机构类型','2019-07-25 18:29:07','2019-07-25 18:29:07','机构类型','0'),
('53372a6873b2d03e5fb8c1918de82d9f','authorized_grant_types','授权类型','2019-07-30 17:08:13','2019-07-30 17:08:13',NULL,'0'),
('6c5ab5650155a1b4cc3c1a2c881fa137','request_method','请求类型','2019-07-26 12:11:37','2019-07-26 12:11:37',NULL,'0');

/*Table structure for table `sys_dict_value` */

DROP TABLE IF EXISTS `sys_dict_value`;

CREATE TABLE `sys_dict_value` (
  `id` varchar(32) NOT NULL COMMENT '编号',
  `dict_id` varchar(32) NOT NULL,
  `value` varchar(100) NOT NULL COMMENT '数据值',
  `label` varchar(100) NOT NULL COMMENT '标签名',
  `type` varchar(100) NOT NULL COMMENT '类型',
  `description` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '描述',
  `sort` int(10) NOT NULL COMMENT '排序（升序）',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `sys_dict_value` (`value`) USING BTREE,
  KEY `sys_dict_label` (`label`) USING BTREE,
  KEY `sys_dict_del_flag` (`del_flag`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='字典项';

/*Data for the table `sys_dict_value` */

insert  into `sys_dict_value`(`id`,`dict_id`,`value`,`label`,`type`,`description`,`sort`,`create_time`,`update_time`,`remarks`,`del_flag`) values 
('1','1','9','异常','log_type','日志异常',1,'2019-03-19 11:08:59','2019-03-25 12:49:13','','0'),
('14758623adf70d753af951a5f4df0643','53372a6873b2d03e5fb8c1918de82d9f','authorization_code','授权码模式','authorized_grant_types','Web服务端应用与第三方移动App应用',0,'2019-07-30 17:11:08','2019-07-30 17:11:08',NULL,'0'),
('2','1','0','正常','log_type','日志正常',0,'2019-03-19 11:09:17','2019-03-25 12:49:18','','0'),
('29','11','text','文本','wx_rep_type','文本',1,'2019-04-23 16:47:14','2019-04-23 16:47:14','文本','0'),
('2f2a733749ead9eb7ad9d32b4930ca0c','3947ade00eea6517e2b66a1f7985fe1a','3','小组','organ_type','小组',2,'2019-07-25 21:45:06','2019-07-25 21:45:06','小组','0'),
('3','2','WX','微信','third_party_type','微信登录',0,'2019-03-19 11:10:02','2019-07-25 16:26:54','','0'),
('30','11','image','图片','wx_rep_type','图片',2,'2019-04-23 16:47:36','2019-04-23 16:47:36','图片','0'),
('30cb1469d0f571a7febb45c6e8386cdd','6c5ab5650155a1b4cc3c1a2c881fa137','POST','新增','request_method','新增',1,'2019-07-26 12:12:48','2019-07-26 12:12:48',NULL,'0'),
('31','11','voice','语音','wx_rep_type','语音',3,'2019-04-23 16:47:57','2019-04-23 16:47:57','语音','0'),
('32','11','video','视频','wx_rep_type','视频',4,'2019-04-23 16:48:12','2019-04-23 16:48:12','视频','0'),
('33','11','music','音乐','wx_rep_type','音乐',5,'2019-04-23 16:48:27','2019-04-23 16:48:27','音乐','0'),
('34','11','news','图文','wx_rep_type','图文',6,'2019-04-23 16:48:42','2019-04-23 16:48:42','图文','0'),
('35','12','text','文本','wx_req_type','文本',1,'2019-04-24 10:24:03','2019-04-24 10:24:03','文本','0'),
('36','12','image','图片','wx_req_type','图片',2,'2019-04-24 10:24:18','2019-04-24 10:24:18','图片','0'),
('37','12','voice','语音','wx_req_type','语音',3,'2019-04-24 10:24:32','2019-04-24 10:24:32','语音','0'),
('38','12','video','视频','wx_req_type','视频',4,'2019-04-24 10:24:46','2019-04-24 10:24:46','视频','0'),
('39','12','shortvideo','小视频','wx_req_type','小视频',5,'2019-04-24 10:25:01','2019-04-24 10:25:01','小视频','0'),
('4','2','QQ','QQ','third_party_type','QQ登录',1,'2019-03-19 11:10:14','2019-07-25 16:26:54','','0'),
('40','12','location','地理位置','wx_req_type','地理位置',6,'2019-04-24 10:25:15','2019-04-24 10:25:15','地理位置','0'),
('41','13','1','全匹配','wx_rep_mate','全匹配',1,'2019-04-24 11:12:12','2019-04-24 11:12:12','全匹配','0'),
('42','13','2','半匹配','wx_rep_mate','半匹配',2,'2019-04-24 11:12:26','2019-04-24 11:12:26','半匹配','0'),
('43','14','0','订阅号','weixin_type','订阅号',0,'2019-04-29 09:36:12','2019-06-21 09:49:12','订阅号','0'),
('44','14','2','服务号','weixin_type','服务号',1,'2019-04-29 09:36:30','2019-06-21 09:51:09','服务号','0'),
('45','14','1','老帐号升级后的订阅号','weixin_type','老帐号升级后的订阅号',2,'2019-04-29 09:36:41','2019-06-21 09:51:10','老帐号升级后的订阅号','0'),
('46','15','1','后台默认二维码','wx_qr_scene_str','后台默认二维码',1,'2019-04-29 11:51:51','2019-04-29 11:51:51','后台默认二维码','0'),
('471fccf38af3aca7d4a6ea9242de64f9','53372a6873b2d03e5fb8c1918de82d9f','refresh_token','刷新令牌','authorized_grant_types','刷新并延迟访问令牌时长',0,'2019-07-30 17:10:47','2019-07-30 17:10:47',NULL,'0'),
('55','12','link','链接消息','wx_req_type','链接消息',7,'2019-05-30 11:05:00','2019-05-30 11:05:00','链接消息','0'),
('56','17','0','已关注','wx_subscribe','已关注',0,'2019-06-02 10:23:46','2019-06-02 10:23:46','已关注','0'),
('57','17','1','取消关注','wx_subscribe','取消关注',1,'2019-06-02 10:24:11','2019-06-02 10:24:11','取消关注','0'),
('58','17','2','网页授权用户','wx_subscribe','网页授权用户',2,'2019-06-02 10:24:34','2019-06-02 10:24:34','网页授权用户','0'),
('59','18','ADD_SCENE_SEARCH','公众号搜索','wx_subscribe_scene','公众号搜索',0,'2019-06-02 10:28:04','2019-06-02 10:28:04','公众号搜索','0'),
('5b86d249fa9db2c9cde7b3793b516d44','53372a6873b2d03e5fb8c1918de82d9f','client_credentials','客户端模式','authorized_grant_types','没有用户参与的,内部服务端与第三方服务端',0,'2019-07-30 17:11:26','2019-07-30 17:11:26',NULL,'0'),
('60','18','ADD_SCENE_ACCOUNT_MIGRATION','公众号迁移','wx_subscribe_scene','公众号迁移',1,'2019-06-02 10:28:21','2019-06-02 10:28:21','公众号迁移','0'),
('61','18','ADD_SCENE_PROFILE_CARD','名片分享','wx_subscribe_scene','名片分享',2,'2019-06-02 10:28:40','2019-06-02 10:28:40','名片分享','0'),
('62','18','ADD_SCENE_QR_CODE','扫描二维码','wx_subscribe_scene','扫描二维码',3,'2019-06-02 10:28:58','2019-06-02 10:28:58','扫描二维码','0'),
('63','18','ADD_SCENE_PROFILE_LINK','图文页内名称点击','wx_subscribe_scene','图文页内名称点击',4,'2019-06-02 10:29:18','2019-06-02 10:29:18','图文页内名称点击','0'),
('64','18','ADD_SCENE_PROFILE_ITEM','图文页右上角菜单','wx_subscribe_scene','图文页右上角菜单',5,'2019-06-02 10:29:36','2019-06-02 10:29:36','图文页右上角菜单','0'),
('65','18','ADD_SCENE_PAID','支付后关注','wx_subscribe_scene','支付后关注',7,'2019-06-02 10:29:50','2019-06-02 10:29:50','支付后关注','0'),
('66','18','ADD_SCENE_OTHERS','其他','wx_subscribe_scene','其他',7,'2019-06-02 10:30:06','2019-06-02 10:30:06','其他','0'),
('67','19','0','未知','wx_sex','未知',0,'2019-06-02 10:31:31','2019-06-02 10:31:31','未知','0'),
('68','19','1','男','wx_sex','男',1,'2019-06-02 10:31:43','2019-06-02 10:31:43','男','0'),
('69','19','2','女','wx_sex','女',2,'2019-06-02 10:31:55','2019-06-02 10:31:55','女','0'),
('70','12','event','事件推送','wx_req_type','事件推送',7,'2019-06-09 12:31:18','2019-06-09 12:31:18','事件推送','0'),
('705f57cfc5d58f6a9f71b880a2efdf76','6c5ab5650155a1b4cc3c1a2c881fa137','GET','查询','request_method','查询',4,'2019-07-26 12:13:49','2019-07-26 12:13:49',NULL,'0'),
('71','20','0','是','yes_no','是',0,'2019-06-09 12:37:54','2019-06-09 12:37:54','是','0'),
('72','20','1','否','yes_no','否',1,'2019-06-09 12:38:06','2019-06-09 12:38:06','否','0'),
('73','21','subscribe','关注','wx_event','关注',0,'2019-06-09 12:42:37','2019-06-09 12:42:37','关注','0'),
('74','21','unsubscribe','取关','wx_event','取关',1,'2019-06-09 12:42:55','2019-06-09 12:42:55','取关','0'),
('75','21','CLICK','点击菜单','wx_event','点击菜单',2,'2019-06-09 12:43:32','2019-06-09 12:43:32','点击菜单','0'),
('76','21','VIEW','点击菜单链接','wx_event','点击菜单链接',3,'2019-06-09 12:43:59','2019-06-09 12:43:59','点击菜单链接','0'),
('76064a463d0f06300dccfffb654d1fe9','53372a6873b2d03e5fb8c1918de82d9f','implicit','隐式授权','authorized_grant_types','Web网页应用或第三方移动App应用',0,'2019-07-30 17:13:41','2019-07-30 17:13:41',NULL,'0'),
('77','24','-1','未认证','wx_verify_type','未认证',0,'2019-06-25 10:28:39','2019-06-25 10:28:39','未认证','0'),
('78','24','0','微信认证','wx_verify_type','微信认证',1,'2019-06-25 10:28:56','2019-06-25 10:28:56','微信认证','0'),
('79','24','1','新浪微博认证','wx_verify_type','新浪微博认证',2,'2019-06-25 10:29:10','2019-06-25 10:29:10','新浪微博认证','0'),
('7a2d5f98b2f60fa309aa4dd69c111ea2','6c5ab5650155a1b4cc3c1a2c881fa137','PUT','修改','request_method','修改',2,'2019-07-26 12:12:18','2019-07-26 12:12:18',NULL,'0'),
('80','24','2','腾讯微博认证','wx_verify_type','腾讯微博认证',3,'2019-06-25 10:29:22','2019-06-25 10:29:22','腾讯微博认证','0'),
('81','24','3','已资质认证通过但还未通过名称认证','wx_verify_type','已资质认证通过但还未通过名称认证',4,'2019-06-25 10:29:38','2019-06-25 10:29:38','已资质认证通过但还未通过名称认证','0'),
('82','24','4','已资质认证通过、还未通过名称认证，但通过了新浪微博认证','wx_verify_type','已资质认证通过、还未通过名称认证，但通过了新浪微博认证',5,'2019-06-25 10:29:52','2019-06-25 10:29:52','已资质认证通过、还未通过名称认证，但通过了新浪微博认证','0'),
('83','24','5','已资质认证通过、还未通过名称认证，但通过了腾讯微博认证','wx_verify_type','已资质认证通过、还未通过名称认证，但通过了腾讯微博认证',6,'2019-06-25 10:30:05','2019-06-25 10:30:05','已资质认证通过、还未通过名称认证，但通过了腾讯微博认证','0'),
('86','26','SUB_SUCCESS','提交成功','wx_mass_msg_status','提交成功',0,'2019-07-03 09:04:47','2019-07-03 09:04:47','提交成功','0'),
('87','26','SUB_FAIL','提交失败','wx_mass_msg_status','提交失败',1,'2019-07-03 09:05:15','2019-07-03 09:05:15','提交失败','0'),
('88','26','SEND_SUCCESS','发送成功','wx_mass_msg_status','发送成功',2,'2019-07-03 09:05:31','2019-07-03 09:05:31','发送成功','0'),
('89','26','SENDING','发送中','wx_mass_msg_status','发送中',3,'2019-07-03 09:06:11','2019-07-03 09:06:11','发送中','0'),
('90','26','SEND_FAIL','发送失败','wx_mass_msg_status','发送失败',4,'2019-07-03 09:06:30','2019-07-03 09:06:30','发送失败','0'),
('91','26','DELETE','已删除','wx_mass_msg_status','已删除',5,'2019-07-03 09:06:48','2019-07-03 09:06:48','已删除','0'),
('91be97d29d6849492c0b279478957f4e','3947ade00eea6517e2b66a1f7985fe1a','1','公司','organ_type','公司',0,'2019-07-25 18:30:20','2019-07-25 18:30:20','公司','0'),
('97ac1672e010af552517a46e5d150678','6c5ab5650155a1b4cc3c1a2c881fa137','DELETE','删除','request_method','删除',3,'2019-07-26 12:13:08','2019-07-26 12:13:08',NULL,'0'),
('9b75d4968ea73c2cd494f3688a043878','3947ade00eea6517e2b66a1f7985fe1a','4','其它','organ_type','其它',3,'2019-07-25 21:45:32','2019-07-25 21:45:32','其它','0'),
('a5f575a44038c13900feaab29704e4f3','3947ade00eea6517e2b66a1f7985fe1a','2','部门','organ_type','部门',1,'2019-07-25 21:44:47','2019-07-25 21:44:47','部门','0'),
('b369cb683678b6b2e913187277799b83','53372a6873b2d03e5fb8c1918de82d9f','password','密码模式','authorized_grant_types','内部Web网页应用与内部移动App应用',0,'2019-07-30 17:10:29','2019-07-30 17:10:29',NULL,'0');

/*Table structure for table `sys_log` */

DROP TABLE IF EXISTS `sys_log`;

CREATE TABLE `sys_log` (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编号',
  `type` char(1) DEFAULT '1' COMMENT '日志类型',
  `title` varchar(255) DEFAULT '' COMMENT '日志标题',
  `service_id` varchar(32) DEFAULT NULL COMMENT '服务ID',
  `create_id` varchar(32) DEFAULT NULL COMMENT '创建者ID',
  `create_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `remote_addr` varchar(255) DEFAULT NULL COMMENT '操作IP地址',
  `user_agent` varchar(1000) DEFAULT NULL COMMENT '用户代理',
  `request_uri` varchar(255) DEFAULT NULL COMMENT '请求URI',
  `method` varchar(10) DEFAULT NULL COMMENT '操作方式',
  `params` text COMMENT '操作提交的数据',
  `time` mediumtext COMMENT '执行时间',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标记',
  `exception` text COMMENT '异常信息',
  `tenant_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '0' COMMENT '所属租户',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `sys_log_create_by` (`create_by`) USING BTREE,
  KEY `sys_log_request_uri` (`request_uri`) USING BTREE,
  KEY `sys_log_type` (`type`) USING BTREE,
  KEY `sys_log_create_date` (`create_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='日志表';

/*Data for the table `sys_log` */

insert  into `sys_log`(`id`,`type`,`title`,`service_id`,`create_id`,`create_by`,`create_time`,`update_time`,`remote_addr`,`user_agent`,`request_uri`,`method`,`params`,`time`,`del_flag`,`exception`,`tenant_id`) values 
('008d663d87de921e6f33b056d0831454','0','添加字典','upms','1','admin','2019-07-26 15:23:30',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36','/dict','POST','','96','0',NULL,'1'),
('018966d18ea9cc96d649680b4c992fd4','0','新增字典项','admin','1','admin','2019-07-30 17:11:08',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36','/dict/item','POST','','58','0',NULL,'1'),
('03aa08717a358b77d106ebfb1574e2b3','0','更新用户信息','admin','5','test','2019-07-27 17:20:49',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','/user','PUT','','553','0',NULL,'1'),
('05a7f807e00a43c7f20255b2190e11fb','0','更新菜单','admin','5','test','2019-07-26 21:51:42',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','/menu','PUT','','19','0',NULL,'1'),
('0a1377f5887bb62964fc2e1533dc42dd','0','删除用户信息','admin','4','admin2','2019-07-27 17:39:48',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','/user/4','DELETE','','64','0',NULL,'2'),
('0ce95594f782e4e3571309035993e64d','0','删除用户信息','admin','4','admin2','2019-07-27 17:40:10',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','/user/eda96002b04a19401b071382cfd37b68','DELETE','','88','0',NULL,'2'),
('10971d7beb2a832a7db9595c9d52bd68','0','修改个人信息','admin','5','test','2019-07-26 21:38:22',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','/user/edit','PUT','','42','0',NULL,'1'),
('143b6240a6c6b1aec4efcbd9112a9bc6','0','更新角色菜单','admin','4','admin2','2019-07-27 12:19:59',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','/role/menu','PUT','roleId=%5B2%5D&menuIds=%5B2000000%2C2100000%2C2101000%2C2600000%2C2601000%2C2300000%2C2200000%2C8000000%2C8100000%2C8130000%2C8133000%2C8134000%2C8131000%2C8132000%2C8120000%2C8124000%2C8123000%2C8127000%2C8122000%2C8126000%2C8125000%2C8121000%2C8110000%2C8114000%2C8113000%2C8112000%2C8111000%2C8150000%2C8153000%2C8154000%2C8151000%2C8152000%2C8140000%2C8141000%2C8142000%2C8170000%2C8172000%2C8171000%2C8174000%2C8173000%2C8160000%2C8162000%2C8161000%2C8164000%2C8163000%2C8180000%2C8181000%2C8182000%2C8183000%2C8184000%2C1000000%2C1300000%2C1304000%2C1303000%2C1302000%2C1305000%2C1301000%2C1200000%2C1400000%2C1403000%2C1402000%2C1401000%2C1404000%2C1100000%2C1101000%2C1102000%2C1103000%2C1104000%2C%5D','5','0',NULL,'2'),
('171fb3cf1e5b7ca3a081913130aa4d83','0','更新用户信息','admin','5','test','2019-07-27 17:21:04',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','/user','PUT','','425','0',NULL,'1'),
('1d45971fa891da6c1953a8cddb01b47f','0','删除用户信息','admin','4','admin2','2019-07-27 16:59:56',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','/user/4','DELETE','','51','0',NULL,'2'),
('1da343d373241df81cc80b23deeb5b05','0','删除机构','admin','4','admin2','2019-07-27 17:51:27',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','/organ/2','DELETE','','14','0',NULL,'2'),
('1db995c25b95b75ca12fa44e687f983c','0','添加用户','admin','4','admin2','2019-07-27 17:40:05',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','/user','POST','','411','0',NULL,'2'),
('2013dcedc2d3787f8ad991f1814a0c46','0','更新用户信息','admin','1','admin','2019-07-27 19:03:33',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','/user','PUT','','24','0',NULL,'1'),
('219c6b0275a8aa5b285b4ccaf658ee0a','0','新增字典项','admin','1','admin','2019-07-30 17:13:41',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36','/dict/item','POST','','57','0',NULL,'1'),
('25cff89d1a13af91ea5ffeb540178f4f','0','删除机构','admin','4','admin2','2019-07-27 19:17:42',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','/organ/2','DELETE','','10','0',NULL,'2'),
('27eb33058b64ed23a58fbb8b47585c4f','0','新增字典项','upms','1','admin','2019-07-26 15:31:30',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36','/dict/item','POST','','53','0',NULL,'1'),
('28443ee9a535096c31f7f65339e8358a','0','删除字典','upms','1','admin','2019-07-26 15:27:15',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36','/dict/e7837c4cf381804e16078890fe422a44','DELETE','','172','0',NULL,'1'),
('2c9ecac44cf90b8cf69b428684fb0e16','0','删除机构','admin','4','admin2','2019-07-27 17:51:10',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','/organ/11','DELETE','','69','0',NULL,'2'),
('2e881e507bd7018196b8ec1e24cdaa07','0','更新用户信息','admin','1','admin','2019-07-27 10:59:54',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','/user','PUT','','281','0',NULL,'1'),
('304c55e2f80797da420986a2b79baca6','0','删除机构','upms','1','admin','2019-07-26 12:44:14',NULL,'110.53.253.189','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36','/organ/3931397cead7b21427b20a4f30cb221e','DELETE','','155','0',NULL,'1'),
('39a1c745ed59db3509957d3f5d098f15','0','删除字典','upms','1','admin','2019-07-26 15:32:14',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36','/dict/dd640eb0f2f945e302a7a91948ef697e','DELETE','','52','0',NULL,'1'),
('40f3b0954d0d5bdd0d8fde2ae5a8f91e','0','编辑机构','admin','f52533324a0f06d14b70683252b9928f','535382760','2019-07-26 21:53:05',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','/organ','PUT','','18','0',NULL,'f0c8e6bf6481424f9b54f85121e54028'),
('429251f963f9bf49c4a25565694bcf82','0','删除用户信息','admin','4','admin2','2019-07-27 17:53:01',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','/user/4','DELETE','','54','0',NULL,'2'),
('436a4ac82bff462d477718ebbb9b4942','0','修改用户密码','admin','5','test','2019-07-27 19:16:18',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','/user/password','PUT','','116','0',NULL,'1'),
('4373bc548a2e524b176294c1e34ef6c1','0','修改字典项','admin','1','admin','2019-07-30 17:20:31',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36','/dict/item','PUT','','71','0',NULL,'1'),
('4daa05a432d48ad013af2dedaeadbd52','0','更新用户信息','admin','4','admin2','2019-07-27 16:49:31',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','/user','PUT','','38','0',NULL,'2'),
('4eda3c3b1ae4788077bc9248dd0ffc7c','0','修改用户密码','admin','5','test','2019-07-27 19:15:02',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','/user/password','PUT','','138','0',NULL,'1'),
('528c81abcd4ac578310ad0c550f62a61','0','新增字典项','upms','1','admin','2019-07-26 15:24:17',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36','/dict/item','POST','','65','0',NULL,'1'),
('54e473cfc5996ce6b32a795304985a33','0','修改用户密码','admin','5','test','2019-07-27 19:15:45',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','/user/password','PUT','','110','0',NULL,'1'),
('555054fc1b1b832c47b75b723d7b9d5c','0','删除角色','admin','4','admin2','2019-07-27 16:50:08',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','/role/2','DELETE','','16','0',NULL,'2'),
('568b04a568b4c989c9cc834fad276dc9','0','添加机构','admin','4','admin2','2019-07-27 17:47:52',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','/organ','POST','','1298','0',NULL,'2'),
('570a5e7fd271d3a0272715991b7b386d','0','修改字典项','admin','1','admin','2019-07-30 17:21:18',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36','/dict/item','PUT','','85','0',NULL,'1'),
('573f5e05356eb8ae9aa6d62c1c8cecbc','0','删除角色','admin','4','admin2','2019-07-27 16:50:13',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','/role/88808ce7ec64824470303920549b49ca','DELETE','','78','0',NULL,'2'),
('5cc87e5277c6962cccd14164870a8878','0','添加角色','admin','4','admin2','2019-07-27 17:27:50',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','/role','POST','','26','0',NULL,'2'),
('63080aeca5c23ded920f60f4ea0c9276','0','删除机构','admin','4','admin2','2019-07-27 17:48:06',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','/organ/2e3ee1d638aa73024825434948f6eb2a','DELETE','','110','0',NULL,'2'),
('6480c976d7930b449ab7d3650b207327','0','新增字典项','admin','1','admin','2019-07-30 17:11:26',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36','/dict/item','POST','','59','0',NULL,'1'),
('64eb790ca6d0d281052579353498e967','0','添加机构','admin','4','admin2','2019-07-27 17:51:03',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','/organ','POST','','72','0',NULL,'2'),
('655d1859845e415279f0c1c38c183550','0','添加终端','upms','1','admin','2019-07-26 16:21:41',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36','/client','POST','','129','0',NULL,'1'),
('6c7cd959ef4c0b92902242e2869af4cb','0','更新用户信息','admin','4','admin2','2019-07-27 16:46:35',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','/user','PUT','','507','0',NULL,'2'),
('6ed28d5c8078f20d7976e706b952efe5','0','更新菜单','admin','5','test','2019-07-26 21:51:34',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','/menu','PUT','','30','0',NULL,'1'),
('6f9514ec5e6f3b16b0c7c2cc415e53ab','0','添加角色','admin','4','admin2','2019-07-27 16:47:14',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','/role','POST','','31','0',NULL,'2'),
('71b4f377fafd91e924feff8d597bc717','0','修改角色','admin','1','admin','2019-07-27 11:09:54',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','/role','PUT','','5','0',NULL,'1'),
('75bdfa79ffa47e7f4730cec3ccf00f58','0','新增字典项','admin','1','admin','2019-07-30 17:10:30',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36','/dict/item','POST','','128','0',NULL,'1'),
('75e070ab930a4a5489b56e143ac97611','0','新增菜单','admin','1','admin','2019-07-27 11:43:06',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','/menu','POST','','28','0',NULL,'1'),
('7a035b5d5dffebeb67388d12dad48799','0','删除角色','admin','4','admin2','2019-07-27 12:20:24',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','/role/fce4fd6746cd8e43b9bb11cd8594f046','DELETE','','69','0',NULL,'2'),
('7bd7a7754dec349b028b520814e883b9','0','编辑机构','admin','5','test','2019-07-26 21:39:59',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','/organ','PUT','','26','0',NULL,'1'),
('7c1e595f24e0062b4c2a75f4632200f2','0','删除用户信息','admin','4','admin2','2019-07-27 16:49:56',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','/user/355f6afdd815c30272bc05dedb52a6bc','DELETE','','71','0',NULL,'2'),
('7cd36f17c12ec5ea87aba8c5da5a7f5c','0','新增字典项','upms','1','admin','2019-07-26 15:27:00',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36','/dict/item','POST','','68','0',NULL,'1'),
('9e9e9f62790139f8090f9b9240b6acc7','0','添加字典','admin','1','admin','2019-07-30 17:08:13',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36','/dict','POST','','256','0',NULL,'1'),
('9f20938659ce212ac4c162cb3c45a57b','0','更新用户信息','admin','4','admin2','2019-07-27 17:28:10',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','/user','PUT','','426','0',NULL,'2'),
('a11a0415795f8394da6dcab0b324ea1e','0','修改字典项','admin','1','admin','2019-07-30 17:20:11',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36','/dict/item','PUT','','136','0',NULL,'1'),
('a2a76a24588e80a10d6677ed66272396','0','更新菜单','admin','5','test','2019-07-26 21:51:27',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','/menu','PUT','','35','0',NULL,'1'),
('a2b2cecd1900c32a640309ecee662e3e','0','编辑机构','admin','5','test','2019-07-26 21:39:42',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','/organ','PUT','','46','0',NULL,'1'),
('a8ae151d01bc816c7d15f21d58049d10','0','新增菜单','admin','1','admin','2019-07-27 11:34:23',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','/menu','POST','','48','0',NULL,'1'),
('aed4f996c7e6148926959229896eaffe','0','删除角色','admin','4','admin2','2019-07-27 19:17:36',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','/role/2','DELETE','','8','0',NULL,'2'),
('b4efeaf508752a6c27c47359bd6a7bde','0','新增菜单','admin','1','admin','2019-07-27 11:31:27',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','/menu','POST','','47','0',NULL,'1'),
('b9cacfc092175314a0ee56c3257d9489','0','编辑机构','upms','4','admin2','2019-07-26 12:46:57',NULL,'110.53.253.189','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36','/organ','PUT','','82','0',NULL,'2'),
('bb398a94aec3474944aeac4873e380e3','0','更新用户信息','admin','4','admin2','2019-07-27 16:49:44',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','/user','PUT','','351','0',NULL,'2'),
('bd15aa5ea217488b0b9484d7bc39b250','0','新增菜单','admin','1','admin','2019-07-27 18:07:09',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','/menu','POST','','77','0',NULL,'1'),
('c1206e85ec7b64a5149e0320c656b751','0','删除角色','admin','4','admin2','2019-07-27 17:52:06',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','/role/2','DELETE','','14','0',NULL,'2'),
('c48a1c3772dc7e9e998160db127e6a12','0','更新用户信息','admin','4','admin2','2019-07-27 16:49:18',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','/user','PUT','','372','0',NULL,'2'),
('c4d65e11bf3397343ed899a304019206','0','添加用户','admin','4','admin2','2019-07-27 17:26:44',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','/user','POST','','1574','0',NULL,'2'),
('c99394fd22e2d336b056d7098496c41a','0','新增字典项','admin','1','admin','2019-07-30 17:10:47',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36','/dict/item','POST','','113','0',NULL,'1'),
('cb269eef00cb9d7dc10b2a2d5ab4f6f1','0','更新用户信息','admin','4','admin2','2019-07-27 16:48:40',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','/user','PUT','','379','0',NULL,'2'),
('cb98f66f9c8bca8b23bcfaaa06be9f07','0','添加用户','admin','4','admin2','2019-07-27 16:48:28',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','/user','POST','','321','0',NULL,'2'),
('cf1b19f2fe59f7525f8a46e2b6312c8e','0','编辑机构','admin','f52533324a0f06d14b70683252b9928f','535382760','2019-07-26 21:52:59',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','/organ','PUT','','22','0',NULL,'f0c8e6bf6481424f9b54f85121e54028'),
('d044d0cfb566dbe4c7eb3533da203a04','0','更新角色菜单','admin','4','admin2','2019-07-27 17:52:41',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','/role/menu','PUT','roleId=%5B2%5D&menuIds=%5B2000000%2C2100000%2C2101000%2C2600000%2C2601000%2C2300000%2C2200000%2C8000000%2C8100000%2C8130000%2C8133000%2C8134000%2C8131000%2C8132000%2C8120000%2C8124000%2C8123000%2C8127000%2C8122000%2C8126000%2C8125000%2C8121000%2C8110000%2C8114000%2C8113000%2C8112000%2C8111000%2C8150000%2C8153000%2C8154000%2C8151000%2C8152000%2C8140000%2C8141000%2C8142000%2C8170000%2C8172000%2C8171000%2C8174000%2C8173000%2C8160000%2C8162000%2C8161000%2C8164000%2C8163000%2C8180000%2C8181000%2C8182000%2C8183000%2C8184000%2C1000000%2C1300000%2C1304000%2C1303000%2C1302000%2C1305000%2C1301000%2C1200000%2C1400000%2C1403000%2C1402000%2C1401000%2C1404000%2C1100000%2C1101000%2C1102000%2C1103000%2C1104000%2C%5D','13','0',NULL,'2'),
('d3337be4f52bfa3871cae783ac2975de','0','删除角色','admin','4','admin2','2019-07-27 17:40:24',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','/role/2','DELETE','','19','0',NULL,'2'),
('d421eaa7738f6af34da7c7253011e7b9','0','添加角色','admin','4','admin2','2019-07-27 12:20:19',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','/role','POST','','19','0',NULL,'2'),
('d611fcbf5cbb2b97140b84738202c8dc','0','新增菜单','upms','1','admin','2019-07-26 14:26:22',NULL,'110.53.253.189','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36','/menu','POST','','57','0',NULL,'1'),
('db9fedb8444cf59bd1a52e41a979e859','0','更新用户信息','admin','4','admin2','2019-07-27 16:47:33',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','/user','PUT','','46','0',NULL,'2'),
('e05e6205dd746ab7820bfcf2a01a2b72','0','更新角色菜单','admin','1','admin','2019-07-26 21:34:11',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','/role/menu','PUT','roleId=%5B3%5D&menuIds=%5B2100000%2C2101000%2C2600000%2C2601000%2C2300000%2C2200000%2C2203000%2C2202000%2C2201000%2C8000000%2C8100000%2C8130000%2C8133000%2C8134000%2C8131000%2C8132000%2C8120000%2C8124000%2C8123000%2C8127000%2C8122000%2C8126000%2C8125000%2C8121000%2C8110000%2C8114000%2C8113000%2C8112000%2C8111000%2C8150000%2C8153000%2C8154000%2C8151000%2C8152000%2C8140000%2C8141000%2C8142000%2C8170000%2C8172000%2C8171000%2C8174000%2C8173000%2C8160000%2C8162000%2C8161000%2C8164000%2C8163000%2C8180000%2C8181000%2C8182000%2C8183000%2C8184000%2C1000000%2C1300000%2C1304000%2C1303000%2C1302000%2C1301000%2C1200000%2C1201000%2C1203000%2C1202000%2C1400000%2C1403000%2C1402000%2C1401000%2C1100000%2C1101000%2C1102000%2C1103000%2C2000000%5D','122','0',NULL,'1'),
('e0c54fe2b046cd9c0ac3f1afb7bc70f0','0','更新用户信息','admin','5','test','2019-07-27 16:52:58',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','/user','PUT','','38','0',NULL,'1'),
('e18e139705ddfe36977dcc12485ff9fe','0','编辑机构','admin','5','test','2019-07-26 21:39:49',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','/organ','PUT','','94','0',NULL,'1'),
('e2d0827adda99530578ff84f8747bff0','0','添加字典','upms','1','admin','2019-07-26 15:31:13',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36','/dict','POST','','57','0',NULL,'1'),
('e5500c718f16ae4baaae94c42ae409fb','0','更新用户信息','admin','4','admin2','2019-07-27 17:28:28',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','/user','PUT','','381','0',NULL,'2'),
('e65011d43a9241c12ab6ab9fbe3daec3','0','删除角色','admin','4','admin2','2019-07-27 17:40:18',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','/role/ad63cab4499fdfa8da2327653f03b6da','DELETE','','84','0',NULL,'2'),
('e7d86482899ccb348b1ac164e3a6b278','0','删除字典项','upms','1','admin','2019-07-26 15:27:10',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36','/dict/item/a66bc7864c286d3abf4e8abb64b79218','DELETE','','94','0',NULL,'1'),
('ec05e54bbbb334f2cf7edafcaeded57f','0','修改字典项','admin','1','admin','2019-07-30 17:20:45',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36','/dict/item','PUT','','107','0',NULL,'1'),
('f1ba935ba29e6c4c822a1a62e5c2fc96','0','删除角色','admin','4','admin2','2019-07-27 12:20:03',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','/role/2','DELETE','','5','0',NULL,'2'),
('f209381f1baae036a70a2a460b18e1d3','0','更新用户信息','admin','4','admin2','2019-07-27 16:47:57',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','/user','PUT','','400','0',NULL,'2'),
('f3cac2d3557a1336df4634056186d4b3','0','删除用户信息','admin','4','admin2','2019-07-27 17:27:28',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','/user/24ed74e2ac00ceef69c5ae4c85f98029','DELETE','','50','0',NULL,'2'),
('f634a6af6f8182dd3c6bd6738021fb67','0','更新用户信息','admin','1','admin','2019-07-27 18:49:41',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','/user','PUT','','40','0',NULL,'1'),
('f9933abdceaaa122c810a92c29345220','0','修改角色','admin','4','admin2','2019-07-27 12:19:28',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','/role','PUT','','5','0',NULL,'2'),
('fa9a2eed38a539100eda911c665cbad6','0','修改字典项','admin','1','admin','2019-07-30 17:21:07',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36','/dict/item','PUT','','87','0',NULL,'1'),
('fbc239f2a9c56bc9649b6ce0638f1c1b','0','修改个人信息','admin','5','test','2019-07-27 19:16:59',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','/user/edit','PUT','','211','0',NULL,'1'),
('fc368fc7c611bb1e287e5056759ef78c','0','删除用户信息','admin','4','admin2','2019-07-27 17:28:16',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','/user/24ed74e2ac00ceef69c5ae4c85f98029','DELETE','','28','0',NULL,'2'),
('fecf94ea5315d48a4dbea32f44fdd5c4','0','修改角色','admin','1','admin','2019-07-26 21:37:22',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','/role','PUT','','13','0',NULL,'1'),
('fef9d8c7940a408be4e17814ef8432b3','0','更新用户信息','admin','1','admin','2019-07-27 18:42:48',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','/user','PUT','','47','0',NULL,'1');

/*Table structure for table `sys_menu` */

DROP TABLE IF EXISTS `sys_menu`;

CREATE TABLE `sys_menu` (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单ID',
  `name` varchar(32) NOT NULL COMMENT '菜单名称',
  `permission` varchar(32) DEFAULT NULL COMMENT '菜单权限标识',
  `path` varchar(128) DEFAULT NULL COMMENT '前端URL',
  `parent_id` varchar(32) DEFAULT NULL COMMENT '父菜单ID',
  `icon` varchar(32) DEFAULT NULL COMMENT '图标',
  `component` varchar(64) DEFAULT NULL COMMENT 'VUE页面',
  `sort` int(11) DEFAULT '1' COMMENT '排序值',
  `keep_alive` char(1) DEFAULT '0' COMMENT '0-开启，1- 关闭',
  `type` char(1) DEFAULT NULL COMMENT '菜单类型 （0菜单 1按钮）',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `del_flag` char(1) DEFAULT '0' COMMENT '逻辑删除标记(0--正常 1--删除)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='菜单权限表';

/*Data for the table `sys_menu` */

insert  into `sys_menu`(`id`,`name`,`permission`,`path`,`parent_id`,`icon`,`component`,`sort`,`keep_alive`,`type`,`create_time`,`update_time`,`del_flag`) values 
('1000000','权限管理',NULL,'/upms','-1','icon-quanxianguanli','Layout',2,'0','0','2018-09-28 08:29:53','2019-04-06 19:49:40','0'),
('1100000','用户管理',NULL,'user','1000000','icon-yonghu','views/admin/user/index',1,'0','0','2017-11-02 22:24:37','2019-04-13 12:15:27','0'),
('1101000','用户新增','sys_user_add',NULL,'1100000',NULL,NULL,NULL,'0','1','2017-11-08 09:52:09','2019-04-06 19:50:56','0'),
('1102000','用户修改','sys_user_edit',NULL,'1100000',NULL,NULL,NULL,'0','1','2017-11-08 09:52:48','2019-04-06 19:50:56','0'),
('1103000','用户删除','sys_user_del',NULL,'1100000',NULL,NULL,NULL,'0','1','2017-11-08 09:54:01','2019-04-06 19:50:56','0'),
('1104000','用户详情','sys_user_get',NULL,'1100000',NULL,NULL,1,'0','1','2019-07-27 11:34:23',NULL,'0'),
('1105000','用户密码修改','sys_user_password',NULL,'1100000',NULL,NULL,1,'0','1','2019-07-27 18:07:08',NULL,'0'),
('1200000','菜单管理',NULL,'menu','1000000','icon-caidanguanli','views/admin/menu/index',4,'0','0','2017-11-08 09:57:27','2019-04-06 19:50:56','0'),
('1201000','菜单新增','sys_menu_add',NULL,'1200000',NULL,NULL,NULL,'0','1','2017-11-08 10:15:53','2019-04-06 19:50:56','0'),
('1202000','菜单修改','sys_menu_edit',NULL,'1200000',NULL,NULL,NULL,'0','1','2017-11-08 10:16:23','2019-04-06 19:50:56','0'),
('1203000','菜单删除','sys_menu_del',NULL,'1200000',NULL,NULL,NULL,'0','1','2017-11-08 10:16:43','2019-04-06 19:50:56','0'),
('1300000','角色管理',NULL,'role','1000000','icon-jiaose','views/admin/role/index',2,'0','0','2017-11-08 10:13:37','2019-04-13 12:17:52','0'),
('1301000','角色新增','sys_role_add',NULL,'1300000',NULL,NULL,NULL,'0','1','2017-11-08 10:14:18','2019-04-06 19:50:56','0'),
('1302000','角色修改','sys_role_edit',NULL,'1300000',NULL,NULL,NULL,'0','1','2017-11-08 10:14:41','2019-04-06 19:50:56','0'),
('1303000','角色删除','sys_role_del',NULL,'1300000',NULL,NULL,NULL,'0','1','2017-11-08 10:14:59','2019-04-06 19:50:56','0'),
('1304000','角色详情','sys_role_get',NULL,'1300000',NULL,NULL,1,'0','1','2019-07-27 11:43:06',NULL,'0'),
('1305000','分配权限','sys_role_perm',NULL,'1300000',NULL,NULL,NULL,'0','1','2018-04-20 07:22:55','2019-07-27 11:37:12','0'),
('1400000','机构管理',NULL,'organ','1000000','icon-bumen','views/admin/organ/index',3,'0','0','2018-01-20 13:17:19','2019-04-06 20:14:04','0'),
('1401000','机构新增','sys_organ_add',NULL,'1400000',NULL,NULL,NULL,'0','1','2018-01-20 14:56:16','2019-04-06 19:50:56','0'),
('1402000','机构修改','sys_organ_edit',NULL,'1400000',NULL,NULL,NULL,'0','1','2018-01-20 14:56:59','2019-04-06 19:50:56','0'),
('1403000','机构删除','sys_organ_del',NULL,'1400000',NULL,NULL,NULL,'0','1','2018-01-20 14:57:28','2019-04-06 19:50:56','0'),
('1404000','机构详情','sys_organ_get',NULL,'1400000',NULL,NULL,1,'0','1','2019-07-27 11:31:26',NULL,'0'),
('2000000','系统管理',NULL,'/admin','-1','icon-xitongguanli','Layout',1,'0','0','2017-11-07 20:56:00','2019-04-06 19:49:40','0'),
('2100000','日志管理',NULL,'log','2000000','icon-rizhi','views/admin/log/index',5,'0','0','2017-11-20 14:06:22','2019-04-06 20:15:43','0'),
('2101000','日志删除','sys_log_del',NULL,'2100000',NULL,NULL,NULL,'0','1','2017-11-20 20:37:37','2019-04-06 19:50:56','0'),
('2200000','字典管理',NULL,'dict','2000000','icon-zidian','views/admin/dict/index',6,'0','0','2017-11-29 11:30:52','2019-04-06 20:15:43','0'),
('2201000','字典删除','sys_dict_del',NULL,'2200000',NULL,NULL,NULL,'0','1','2017-11-29 11:30:11','2019-04-06 19:50:56','0'),
('2202000','字典新增','sys_dict_add',NULL,'2200000',NULL,NULL,NULL,'0','1','2018-05-11 22:34:55','2019-04-06 19:50:56','0'),
('2203000','字典修改','sys_dict_edit',NULL,'2200000',NULL,NULL,NULL,'0','1','2018-05-11 22:36:03','2019-04-06 19:50:56','0'),
('2300000','代码生成','','gen','2000000','icon-daimashengcheng','views/gen/index',4,'0','0','2018-01-20 13:17:19','2019-04-06 20:18:50','0'),
('2400000','终端管理','','client','2000000','icon-shouji','views/admin/client/index',9,'0','0','2018-01-20 13:17:19','2019-04-06 19:50:56','0'),
('2401000','客户端新增','sys_client_add',NULL,'2400000','1',NULL,NULL,'0','1','2018-05-15 21:35:18','2019-04-06 19:50:56','0'),
('2402000','客户端修改','sys_client_edit',NULL,'2400000',NULL,NULL,NULL,'0','1','2018-05-15 21:37:06','2019-04-06 19:50:56','0'),
('2403000','客户端删除','sys_client_del',NULL,'2400000',NULL,NULL,NULL,'0','1','2018-05-15 21:39:16','2019-04-06 19:50:56','0'),
('2500000','第三方登录管理','','thirdparty','2000000','icon-miyue','views/admin/thirdparty/index',10,'0','0','2018-01-20 13:17:19','2019-05-28 11:27:09','0'),
('2501000','第三方登录新增','sys_third_party_add',NULL,'2500000','1',NULL,0,'0','1','2018-05-15 21:35:18','2019-04-06 19:50:56','0'),
('2502000','第三方登录修改','sys_third_party_edit',NULL,'2500000','1',NULL,1,'0','1','2018-05-15 21:35:18','2019-04-06 19:50:56','0'),
('2503000','第三方登录删除','sys_third_party_del',NULL,'2500000','1',NULL,2,'0','1','2018-05-15 21:35:18','2019-04-06 19:50:56','0'),
('2600000','令牌管理',NULL,'token','2000000','icon-lingpai','views/admin/token/index',11,'0','0','2018-09-04 05:58:41','2019-04-06 20:20:04','0'),
('2601000','令牌删除','sys_token_del',NULL,'2600000',NULL,NULL,1,'0','1','2018-09-04 05:59:50','2019-04-06 19:50:56','0'),
('8000000','微信模块','','/weixin','-1','icon-weixin','Layout',0,'0','0','2018-01-20 13:17:19','2019-04-02 09:48:13','0'),
('8100000','公众号管理','','wxmp/wxapp','8000000','icon-gongzhonghao','views/wxmp/wxapp/index',0,'0','0','2018-01-20 13:17:19','2019-04-02 09:50:46','0'),
('8110000','公众号配置','wxmp_wxapp_index','wxapp','8100000','icon-peizhi','views/wxmp/wxapp/index',1,'0','1','2018-01-20 13:17:19','2019-04-02 09:50:46','0'),
('8111000','公众号配置新增','wxmp_wxapp_add',NULL,'8110000','1',NULL,0,'0','1','2018-05-15 21:35:18','2019-04-02 09:50:46','0'),
('8112000','公众号配置修改','wxmp_wxapp_edit',NULL,'8110000','1',NULL,1,'0','1','2018-05-15 21:35:18','2019-04-02 09:50:46','0'),
('8113000','公众号配置删除','wxmp_wxapp_del',NULL,'8110000','1',NULL,2,'0','1','2018-05-15 21:35:18','2019-04-02 09:50:46','0'),
('8114000','公众号配置详情','wxmp_wxapp_get',NULL,'8110000','1',NULL,3,'0','1','2018-05-15 21:35:18','2019-04-02 09:50:46','0'),
('8120000','公众号用户','wxmp_wxuser_index','wxuser','8100000','icon-yonghu','views/wxmp/wxuser/index',3,'0','1','2018-01-20 13:17:19','2019-04-02 09:50:46','0'),
('8121000','公众号用户新增','wxmp_wxuser_add',NULL,'8120000','1',NULL,0,'0','1','2018-05-15 21:35:18','2019-04-02 09:50:46','0'),
('8122000','公众号用户修改','wxmp_wxuser_edit',NULL,'8120000','1',NULL,1,'0','1','2018-05-15 21:35:18','2019-04-02 09:50:46','0'),
('8123000','公众号用户删除','wxmp_wxuser_del',NULL,'8120000','1',NULL,2,'0','1','2018-05-15 21:35:18','2019-04-02 09:50:46','0'),
('8124000','公众号用户详情','wxmp_wxuser_get',NULL,'8120000','1',NULL,3,'0','1','2018-05-15 21:35:18','2019-04-02 09:50:46','0'),
('8125000','公众号用户同步','wxmp_wxuser_synchro',NULL,'8120000',NULL,NULL,1,'0','1','2019-04-14 17:35:01','2019-04-17 14:35:39','0'),
('8126000','公众号用户备注修改','wxmp_wxuser_edit_remark',NULL,'8120000',NULL,NULL,1,'0','1','2019-04-17 14:35:14',NULL,'0'),
('8127000','公众号用户打标签','wxmp_wxuser_tagging',NULL,'8120000',NULL,NULL,1,'0','1','2019-04-17 15:26:18',NULL,'0'),
('8130000','素材管理','wxmp_wxmaterial_index',NULL,'8100000','1',NULL,4,'0','1','2018-01-20 13:17:19','2019-04-02 09:50:46','0'),
('8131000','素材新增','wxmp_wxmaterial_add',NULL,'8130000','1',NULL,0,'0','1','2018-05-15 21:35:18','2019-04-02 09:50:46','0'),
('8132000','素材修改','wxmp_wxmaterial_edit',NULL,'8130000','1',NULL,1,'0','1','2018-05-15 21:35:18','2019-04-02 09:50:46','0'),
('8133000','素材删除','wxmp_wxmaterial_del',NULL,'8130000','1',NULL,2,'0','1','2018-05-15 21:35:18','2019-04-02 09:50:46','0'),
('8134000','素材详情','wxmp_wxmaterial_get',NULL,'8130000','1',NULL,3,'0','1','2018-05-15 21:35:18','2019-04-02 09:50:46','0'),
('8140000','自定义菜单管理','wxmp_wxmenu_index',NULL,'8100000','1',NULL,8,'0','1','2018-01-20 13:17:19','2019-04-02 09:50:46','0'),
('8141000','自定义菜单发布','wxmp_wxmenu_add',NULL,'8140000','1',NULL,4,'0','1','2018-05-15 21:35:18','2019-04-02 09:50:46','0'),
('8142000','自定义菜单详情','wxmp_wxmenu_get',NULL,'8140000','1',NULL,5,'0','1','2018-05-15 21:35:18','2019-04-02 09:50:46','0'),
('8150000','用户标签管理',NULL,NULL,'8100000',NULL,NULL,1,'0','1','2019-04-16 17:28:44',NULL,'0'),
('8151000','用户标签列表','wxmp_wxusertags_list',NULL,'8150000',NULL,NULL,1,'0','1','2019-04-16 17:30:24','2019-04-17 09:05:25','0'),
('8152000','用户标签新增','wxmp_wxusertags_add',NULL,'8150000',NULL,NULL,1,'0','1','2019-04-17 09:03:56','2019-04-17 09:05:19','0'),
('8153000','用户标签修改','wxmp_wxusertags_edit',NULL,'8150000',NULL,NULL,1,'0','1','2019-04-17 09:04:33','2019-04-17 09:05:14','0'),
('8154000','用户标签删除','wxmp_wxusertags_del',NULL,'8150000',NULL,NULL,1,'0','1','2019-04-17 09:05:08',NULL,'0'),
('8160000','消息自动回复管理','wxmp_wxautoreply_index','wxautoreply','8100000','icon-bangzhushouji','views/wxmp/wxautoreply/index',8,'0','1','2018-01-20 13:17:19','2018-07-29 13:38:19','0'),
('8161000','消息自动回复新增','wxmp_wxautoreply_add',NULL,'8160000','1',NULL,0,'0','1','2018-05-15 21:35:18','2018-07-29 13:38:59','0'),
('8162000','消息自动回复修改','wxmp_wxautoreply_edit',NULL,'8160000','1',NULL,1,'0','1','2018-05-15 21:35:18','2018-07-29 13:38:59','0'),
('8163000','消息自动回复删除','wxmp_wxautoreply_del',NULL,'8160000','1',NULL,2,'0','1','2018-05-15 21:35:18','2018-07-29 13:38:59','0'),
('8164000','消息自动回复详情','wxmp_wxautoreply_get',NULL,'8160000','1',NULL,3,'0','1','2018-05-15 21:35:18','2018-07-29 13:38:59','0'),
('8170000','用户消息管理','wxmp_wxmsg_index',NULL,'8100000',NULL,NULL,1,'0','1','2019-05-28 16:04:18','2019-07-26 14:23:34','0'),
('8171000','用户消息新增','wxmp_wxmsg_add',NULL,'8170000',NULL,NULL,1,'0','1','2019-05-28 16:05:48','2019-06-09 12:20:09','0'),
('8172000','用户消息修改','wxmp_wxmsg_edit',NULL,'8170000',NULL,NULL,1,'0','1','2019-05-28 16:06:15','2019-06-09 12:20:14','0'),
('8173000','用户消息删除','wxmp_wxmsg_del',NULL,'8170000',NULL,NULL,1,'0','1','2019-05-28 16:11:06','2019-06-09 12:20:18','0'),
('8174000','用户消息详情','wxmp_wxmsg_get',NULL,'8170000',NULL,NULL,1,'0','1','2019-05-28 16:11:35','2019-06-09 12:20:02','0'),
('8180000','微信群发消息管理','wxmp_wxmassmsg_index','wxmassmsg','8100000','icon-bangzhushouji','views/wxmp/wxmassmsg/index',8,'0','1','2018-01-20 13:17:19','2018-07-29 13:38:19','0'),
('8181000','微信群发消息新增','wxmp_wxmassmsg_add',NULL,'8180000','1',NULL,0,'0','1','2018-05-15 21:35:18','2018-07-29 13:38:59','0'),
('8182000','微信群发消息修改','wxmp_wxmassmsg_edit',NULL,'8180000','1',NULL,1,'0','1','2018-05-15 21:35:18','2018-07-29 13:38:59','0'),
('8183000','微信群发消息删除','wxmp_wxmassmsg_del',NULL,'8180000','1',NULL,2,'0','1','2018-05-15 21:35:18','2018-07-29 13:38:59','0'),
('8184000','微信群发消息详情','wxmp_wxmassmsg_get',NULL,'8180000','1',NULL,3,'0','1','2018-05-15 21:35:18','2018-07-29 13:38:59','0');

/*Table structure for table `sys_oauth_client` */

DROP TABLE IF EXISTS `sys_oauth_client`;

CREATE TABLE `sys_oauth_client` (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `resource_ids` varchar(256) DEFAULT NULL,
  `client_secret` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '密钥',
  `scope` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '域',
  `authorized_grant_types` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '授权模式',
  `web_server_redirect_uri` varchar(256) DEFAULT NULL,
  `authorities` varchar(256) DEFAULT NULL,
  `access_token_validity` int(11) DEFAULT NULL,
  `refresh_token_validity` int(11) DEFAULT NULL,
  `additional_information` varchar(4096) DEFAULT NULL,
  `autoapprove` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='终端信息表';

/*Data for the table `sys_oauth_client` */

insert  into `sys_oauth_client`(`id`,`resource_ids`,`client_secret`,`scope`,`authorized_grant_types`,`web_server_redirect_uri`,`authorities`,`access_token_validity`,`refresh_token_validity`,`additional_information`,`autoapprove`) values 
('admin',NULL,'admin','server','password,refresh_token,authorization_code,client_credentials','',NULL,NULL,NULL,NULL,'true'),
('gen',NULL,'gen','server','password,refresh_token',NULL,NULL,NULL,NULL,NULL,'true'),
('swagger','','swagger','server','password,refresh_token','','',NULL,NULL,'','true'),
('weixin','','weixin','server','password,refresh_token','','',NULL,NULL,'','true');

/*Table structure for table `sys_organ` */

DROP TABLE IF EXISTS `sys_organ`;

CREATE TABLE `sys_organ` (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `parent_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `sort` int(11) DEFAULT '1' COMMENT '排序',
  `type` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '机构类型',
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '机构编码',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '机构名称',
  `phone` varchar(20) DEFAULT NULL COMMENT '电话',
  `fax` varchar(32) DEFAULT NULL COMMENT '传真',
  `email` varchar(32) DEFAULT NULL COMMENT '邮箱',
  `address` varchar(500) DEFAULT NULL COMMENT '地址',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '0' COMMENT '是否删除  -1：已删除  0：正常',
  `tenant_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_tenant_id_code` (`code`,`tenant_id`),
  KEY `ids_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='机构管理';

/*Data for the table `sys_organ` */

insert  into `sys_organ`(`id`,`create_time`,`update_time`,`parent_id`,`sort`,`type`,`code`,`name`,`phone`,`fax`,`email`,`address`,`remarks`,`del_flag`,`tenant_id`) values 
('1','2018-01-22 19:00:23','2019-07-26 10:52:43','0',1,'1','10000','腾讯公司',NULL,NULL,NULL,NULL,NULL,'0','1'),
('2','2018-01-22 19:00:38','2019-07-26 21:40:20','0',2,'1','10000','阿里公司',NULL,NULL,NULL,NULL,NULL,'0','2'),
('3','2018-01-22 19:00:44','2019-07-26 21:39:42','1',0,'2','10001','腾讯部门一','188888888','556558444','156545588@qq.com','中国广东省深圳高南山区机械厂32号',NULL,'0','1'),
('4','2018-01-22 19:00:52','2019-07-26 21:39:59','1',2,'2','10002','腾讯部门二',NULL,NULL,NULL,NULL,NULL,'0','1'),
('7','2018-01-22 19:01:57','2019-07-26 21:40:24','2',1,'2','10001','阿里一公司',NULL,NULL,NULL,NULL,NULL,'0','2'),
('8','2018-01-22 19:02:03','2019-07-26 21:40:29','2',2,'2','10002','阿里二公司',NULL,NULL,NULL,NULL,NULL,'0','2');

/*Table structure for table `sys_organ_relation` */

DROP TABLE IF EXISTS `sys_organ_relation`;

CREATE TABLE `sys_organ_relation` (
  `ancestor` varchar(32) NOT NULL COMMENT '祖先节点',
  `descendant` varchar(32) NOT NULL COMMENT '后代节点',
  PRIMARY KEY (`ancestor`,`descendant`) USING BTREE,
  KEY `idx1` (`ancestor`) USING BTREE,
  KEY `idx2` (`descendant`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC COMMENT='机构关系表';

/*Data for the table `sys_organ_relation` */

insert  into `sys_organ_relation`(`ancestor`,`descendant`) values 
('1','1'),
('1','3'),
('1','4'),
('2','2'),
('2','7'),
('2','8'),
('3','3'),
('4','4'),
('7','7'),
('8','8');

/*Table structure for table `sys_role` */

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `role_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `role_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `role_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `ds_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '2' COMMENT '数据权限类型',
  `ds_scope` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '数据权限范围',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '0' COMMENT '删除标识（0-正常,1-删除）',
  `tenant_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `role_idx1_role_code` (`role_code`,`tenant_id`),
  KEY `ids_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='系统角色表';

/*Data for the table `sys_role` */

insert  into `sys_role`(`id`,`role_name`,`role_code`,`role_desc`,`ds_type`,`ds_scope`,`create_time`,`update_time`,`del_flag`,`tenant_id`) values 
('1','管理员','ROLE_ADMIN','管理员','0','','2017-10-29 15:45:51','2019-07-27 12:06:49','0','1'),
('2','管理员','ROLE_ADMIN','管理员实例（自助注册会用到，请勿删除）','0',NULL,'2018-11-11 19:42:26','2019-07-27 12:29:43','0','2'),
('3','test','test','test','0','','2019-03-30 17:44:20','2019-07-18 15:01:23','0','1');

/*Table structure for table `sys_role_menu` */

DROP TABLE IF EXISTS `sys_role_menu`;

CREATE TABLE `sys_role_menu` (
  `role_id` varchar(32) NOT NULL COMMENT '角色ID',
  `menu_id` varchar(32) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='角色菜单表';

/*Data for the table `sys_role_menu` */

insert  into `sys_role_menu`(`role_id`,`menu_id`) values 
('1','1000000'),
('1','1100000'),
('1','1101000'),
('1','1102000'),
('1','1103000'),
('1','1104000'),
('1','1105000'),
('1','1200000'),
('1','1201000'),
('1','1202000'),
('1','1203000'),
('1','1300000'),
('1','1301000'),
('1','1302000'),
('1','1303000'),
('1','1304000'),
('1','1305000'),
('1','1400000'),
('1','1401000'),
('1','1402000'),
('1','1403000'),
('1','1404000'),
('1','2000000'),
('1','2100000'),
('1','2101000'),
('1','2200000'),
('1','2201000'),
('1','2202000'),
('1','2203000'),
('1','2300000'),
('1','2400000'),
('1','2401000'),
('1','2402000'),
('1','2403000'),
('1','2500000'),
('1','2501000'),
('1','2502000'),
('1','2503000'),
('1','2600000'),
('1','2601000'),
('1','8000000'),
('1','8100000'),
('1','8110000'),
('1','8111000'),
('1','8112000'),
('1','8113000'),
('1','8114000'),
('1','8120000'),
('1','8121000'),
('1','8122000'),
('1','8123000'),
('1','8124000'),
('1','8125000'),
('1','8126000'),
('1','8127000'),
('1','8130000'),
('1','8131000'),
('1','8132000'),
('1','8133000'),
('1','8134000'),
('1','8140000'),
('1','8141000'),
('1','8142000'),
('1','8150000'),
('1','8151000'),
('1','8152000'),
('1','8153000'),
('1','8154000'),
('1','8160000'),
('1','8161000'),
('1','8162000'),
('1','8163000'),
('1','8164000'),
('1','8170000'),
('1','8171000'),
('1','8172000'),
('1','8173000'),
('1','8174000'),
('1','8180000'),
('1','8181000'),
('1','8182000'),
('1','8183000'),
('1','8184000'),
('2','1000000'),
('2','1100000'),
('2','1101000'),
('2','1102000'),
('2','1103000'),
('2','1104000'),
('2','1105000'),
('2','1200000'),
('2','1300000'),
('2','1301000'),
('2','1302000'),
('2','1303000'),
('2','1304000'),
('2','1305000'),
('2','1400000'),
('2','1401000'),
('2','1402000'),
('2','1403000'),
('2','1404000'),
('2','2000000'),
('2','2100000'),
('2','2101000'),
('2','2200000'),
('2','2300000'),
('2','2600000'),
('2','2601000'),
('2','8000000'),
('2','8100000'),
('2','8110000'),
('2','8111000'),
('2','8112000'),
('2','8113000'),
('2','8114000'),
('2','8120000'),
('2','8121000'),
('2','8122000'),
('2','8123000'),
('2','8124000'),
('2','8125000'),
('2','8126000'),
('2','8127000'),
('2','8130000'),
('2','8131000'),
('2','8132000'),
('2','8133000'),
('2','8134000'),
('2','8140000'),
('2','8141000'),
('2','8142000'),
('2','8150000'),
('2','8151000'),
('2','8152000'),
('2','8153000'),
('2','8154000'),
('2','8160000'),
('2','8161000'),
('2','8162000'),
('2','8163000'),
('2','8164000'),
('2','8170000'),
('2','8171000'),
('2','8172000'),
('2','8173000'),
('2','8174000'),
('2','8180000'),
('2','8181000'),
('2','8182000'),
('2','8183000'),
('2','8184000'),
('3','1000000'),
('3','1100000'),
('3','1101000'),
('3','1102000'),
('3','1103000'),
('3','1104000'),
('3','1105000'),
('3','1200000'),
('3','1201000'),
('3','1202000'),
('3','1203000'),
('3','1300000'),
('3','1301000'),
('3','1302000'),
('3','1303000'),
('3','1304000'),
('3','1305000'),
('3','1400000'),
('3','1401000'),
('3','1402000'),
('3','1403000'),
('3','1404000'),
('3','2000000'),
('3','2100000'),
('3','2101000'),
('3','2200000'),
('3','2201000'),
('3','2202000'),
('3','2203000'),
('3','2300000'),
('3','2600000'),
('3','2601000'),
('3','8000000'),
('3','8100000'),
('3','8110000'),
('3','8111000'),
('3','8112000'),
('3','8113000'),
('3','8114000'),
('3','8120000'),
('3','8121000'),
('3','8122000'),
('3','8123000'),
('3','8124000'),
('3','8125000'),
('3','8126000'),
('3','8127000'),
('3','8130000'),
('3','8131000'),
('3','8132000'),
('3','8133000'),
('3','8134000'),
('3','8140000'),
('3','8141000'),
('3','8142000'),
('3','8150000'),
('3','8151000'),
('3','8152000'),
('3','8153000'),
('3','8154000'),
('3','8160000'),
('3','8161000'),
('3','8162000'),
('3','8163000'),
('3','8164000'),
('3','8170000'),
('3','8171000'),
('3','8172000'),
('3','8173000'),
('3','8174000'),
('3','8180000'),
('3','8181000'),
('3','8182000'),
('3','8183000'),
('3','8184000');

/*Table structure for table `sys_third_party` */

DROP TABLE IF EXISTS `sys_third_party`;

CREATE TABLE `sys_third_party` (
  `id` varchar(32) NOT NULL COMMENT '主鍵',
  `type` varchar(16) NOT NULL COMMENT '类型',
  `remark` varchar(64) DEFAULT NULL COMMENT '描述',
  `app_id` varchar(64) NOT NULL COMMENT 'appid',
  `app_secret` varchar(64) NOT NULL COMMENT 'app_secret',
  `redirect_url` varchar(128) DEFAULT NULL COMMENT '回调地址',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='第三方登录配置表';

/*Data for the table `sys_third_party` */

insert  into `sys_third_party`(`id`,`type`,`remark`,`app_id`,`app_secret`,`redirect_url`,`create_time`,`update_time`,`del_flag`) values 
('1','WX','微信互联参数','wx35654735724y56','346565464575475498e8534','demo.joolun.com','2018-08-16 14:24:25','2019-07-12 15:31:06','0');

/*Table structure for table `sys_user` */

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '主键ID',
  `username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '用户名',
  `email` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '邮箱',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `salt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '随机盐',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '简介',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '头像',
  `organ_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '机构ID',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `lock_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '0' COMMENT '0-正常，9-锁定',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '0' COMMENT '0-正常，1-删除',
  `wx_openid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '微信openid',
  `qq_openid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'QQ openid',
  `gitee_login` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `osc_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `tenant_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '0' COMMENT '所属租户',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_username` (`username`),
  UNIQUE KEY `uk_email` (`email`),
  KEY `user_wx_openid` (`wx_openid`) USING BTREE,
  KEY `user_qq_openid` (`qq_openid`) USING BTREE,
  KEY `ids_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='用户表';

/*Data for the table `sys_user` */

insert  into `sys_user`(`id`,`username`,`email`,`password`,`salt`,`phone`,`avatar`,`organ_id`,`create_time`,`update_time`,`lock_flag`,`del_flag`,`wx_openid`,`qq_openid`,`gitee_login`,`osc_id`,`tenant_id`) values 
('1','admin','1023530620@qq.com','$2a$10$QOfWxxFyAMmEEmnuw9UI/..1s4B4eF/u9PzE2ZaGO.ij9YfmcUy.u',NULL,'18652365421','http://joolun-base-test.oss-cn-zhangjiakou.aliyuncs.com/5.png','1','2018-04-20 07:15:18','2019-07-20 23:16:06','0','0','o_0FT0uyg_H1vVy2H0JpSwlVGhWQ',NULL,NULL,NULL,'1'),
('4','admin2',NULL,'$2a$10$QOfWxxFyAMmEEmnuw9UI/..1s4B4eF/u9PzE2ZaGO.ij9YfmcUy.u',NULL,NULL,'http://joolun-base-test.oss-cn-zhangjiakou.aliyuncs.com/2.png','2','2019-07-27 17:02:42','2019-07-27 17:06:47','0','0',NULL,NULL,NULL,NULL,'2'),
('5','test',NULL,'$2a$10$ynRI6XU4AqZA2JFJpDrj4e4Q.jT2wedk3tDwT7g0iEYABuDSB.pzy',NULL,'','http://joolun-base-test.oss-cn-zhangjiakou.aliyuncs.com/u%3D392081896%2C3689918515%26fm%3D173.jpg','4','2019-07-13 15:46:06','2019-07-27 19:16:59','0','0',NULL,NULL,NULL,NULL,'1');

/*Table structure for table `sys_user_role` */

DROP TABLE IF EXISTS `sys_user_role`;

CREATE TABLE `sys_user_role` (
  `user_id` varchar(32) NOT NULL COMMENT '用户ID',
  `role_id` varchar(32) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户角色表';

/*Data for the table `sys_user_role` */

insert  into `sys_user_role`(`user_id`,`role_id`) values 
('1','1'),
('4','2'),
('5','3');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
