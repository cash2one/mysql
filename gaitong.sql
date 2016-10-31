/*
Navicat MySQL Data Transfer

Source Server         : 206
Source Server Version : 50524
Source Host           : 172.18.7.206:3306
Source Database       : gaitong

Target Server Type    : MYSQL
Target Server Version : 50524
File Encoding         : 65001

Date: 2016-10-31 10:52:56
*/

SET FOREIGN_KEY_CHECKS=0;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`gaitong` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `gaitong`;
-- ----------------------------
-- Table structure for applog
-- ----------------------------
DROP TABLE IF EXISTS `applog`;
CREATE TABLE `applog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `level` varchar(128) DEFAULT NULL,
  `category` varchar(128) DEFAULT NULL,
  `logtime` int(11) DEFAULT NULL,
  `message` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4870 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for debug_log
-- ----------------------------
DROP TABLE IF EXISTS `debug_log`;
CREATE TABLE `debug_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `source` tinyint(2) unsigned DEFAULT '0',
  `controller` varchar(128) DEFAULT NULL,
  `action` varchar(128) DEFAULT NULL,
  `type` varchar(128) DEFAULT NULL,
  `logtime` datetime DEFAULT NULL,
  `message` text,
  `batch` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `source` (`source`),
  KEY `action` (`action`)
) ENGINE=InnoDB AUTO_INCREMENT=41822 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for gt_advert_time
-- ----------------------------
DROP TABLE IF EXISTS `gt_advert_time`;
CREATE TABLE `gt_advert_time` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `day_start` char(8) DEFAULT NULL,
  `day_end` char(8) DEFAULT NULL,
  `time_start` char(6) DEFAULT NULL,
  `time_end` char(6) DEFAULT NULL,
  `user_id` mediumint(8) unsigned DEFAULT NULL COMMENT '管理员id',
  `user_ip` int(11) unsigned DEFAULT NULL COMMENT '管理员ip',
  `create_time` int(11) unsigned DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) unsigned DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for gt_advert_time_bind
-- ----------------------------
DROP TABLE IF EXISTS `gt_advert_time_bind`;
CREATE TABLE `gt_advert_time_bind` (
  `advert_id` int(11) unsigned NOT NULL COMMENT '广告id',
  `time_id` int(11) unsigned NOT NULL COMMENT '时间id',
  `user_id` mediumint(8) unsigned DEFAULT NULL COMMENT '管理员id',
  `user_ip` int(11) unsigned DEFAULT NULL COMMENT '管理员ip',
  `create_time` int(11) unsigned DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) unsigned DEFAULT NULL COMMENT '更新时间',
  KEY `advert_id` (`advert_id`,`time_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for gt_apk_manage
-- ----------------------------
DROP TABLE IF EXISTS `gt_apk_manage`;
CREATE TABLE `gt_apk_manage` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `filename` varchar(100) NOT NULL COMMENT '文件名称(xxx.apk)，必填',
  `version` varchar(5) NOT NULL COMMENT '版本号，最大的就是需要升级的apk，必填',
  `user_id` mediumint(8) unsigned NOT NULL COMMENT '上传该apk的用户id',
  `update_time` int(10) unsigned NOT NULL COMMENT '修改时间',
  `create_time` int(10) unsigned NOT NULL COMMENT '创建时间',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1、Coupon_KB_APK  2、Coupon_NOKB_APK 3、Goods_KB_APK 4、Goods_NOKB_APK',
  `md5` char(32) NOT NULL COMMENT 'apk的md5值',
  `filesize` int(11) unsigned NOT NULL COMMENT '文件的长度',
  `firmware_type` varchar(256) DEFAULT NULL COMMENT '固件类型',
  `use_national` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否用于全国 0 否 1是',
  PRIMARY KEY (`id`),
  KEY `type` (`type`) USING BTREE,
  KEY `firmware_type` (`firmware_type`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=396 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for gt_apk_manage_copy
-- ----------------------------
DROP TABLE IF EXISTS `gt_apk_manage_copy`;
CREATE TABLE `gt_apk_manage_copy` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `filename` varchar(100) NOT NULL COMMENT '文件名称(xxx.apk)，必填',
  `version` varchar(5) NOT NULL COMMENT '版本号，最大的就是需要升级的apk，必填',
  `user_id` mediumint(8) unsigned NOT NULL COMMENT '上传该apk的用户id',
  `update_time` int(10) unsigned NOT NULL COMMENT '修改时间',
  `create_time` int(10) unsigned NOT NULL COMMENT '创建时间',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1、Coupon_KB_APK  2、Coupon_NOKB_APK 3、Goods_KB_APK 4、Goods_NOKB_APK',
  `md5` char(32) NOT NULL COMMENT 'apk的md5值',
  `filesize` int(11) unsigned NOT NULL COMMENT '文件的长度',
  `firmware_type` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `type` (`type`) USING BTREE,
  KEY `firmware_type` (`firmware_type`)
) ENGINE=MyISAM AUTO_INCREMENT=368 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for gt_apk_plugins
-- ----------------------------
DROP TABLE IF EXISTS `gt_apk_plugins`;
CREATE TABLE `gt_apk_plugins` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `filename` varchar(100) NOT NULL COMMENT '文件名称(xxx.apk)，必填',
  `package_name` varchar(100) NOT NULL COMMENT '应用包名',
  `version` varchar(10) NOT NULL COMMENT '版本号，最大的就是需要升级的apk，必填',
  `type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '插件类型 0：通用 1：普通版 2：信发版',
  `md5` char(32) NOT NULL COMMENT '插件的md5值',
  `filesize` int(11) NOT NULL COMMENT '文件 的大小',
  `force_install` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否强制安装 1表示强制安装 0表示不强制安装',
  `use_national` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否用于全国 （0：否，1：是）',
  `user_id` mediumint(8) unsigned NOT NULL COMMENT '上传该插件的用户id',
  `create_time` int(10) unsigned NOT NULL COMMENT '创 建时间',
  `update_time` int(10) unsigned NOT NULL COMMENT '修改时间',
  `images` text COMMENT '游戏图片（当type=3 游戏）最少需上传2张图片',
  `logoimage` text COMMENT '游戏logo图片',
  `appdesc` text COMMENT '游戏应用描述',
  `game_name` varchar(100) DEFAULT NULL COMMENT '游戏名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for gt_apk_region_bind
-- ----------------------------
DROP TABLE IF EXISTS `gt_apk_region_bind`;
CREATE TABLE `gt_apk_region_bind` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `apk_manage_id` int(11) unsigned NOT NULL COMMENT 'apk_manage_id',
  `update_type` tinyint(1) unsigned NOT NULL COMMENT '1、盖网通程序更新 2、盖网通插件更新',
  `province_id` int(11) NOT NULL DEFAULT '0' COMMENT '所属省份',
  `city_id` int(11) NOT NULL DEFAULT '0' COMMENT '所属城市',
  `district_id` int(11) NOT NULL DEFAULT '0' COMMENT '所属区县',
  `user_id` mediumint(8) unsigned DEFAULT NULL COMMENT '管理员id',
  `create_time` int(11) unsigned DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) unsigned DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8 COMMENT='盖机更新大区设置表';

-- ----------------------------
-- Table structure for gt_category
-- ----------------------------
DROP TABLE IF EXISTS `gt_category`;
CREATE TABLE `gt_category` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `pid` smallint(5) unsigned NOT NULL,
  `name` varchar(128) NOT NULL COMMENT '分类名称',
  `en_name` varchar(256) NOT NULL COMMENT '英文名称',
  `description` varchar(256) NOT NULL,
  `is_visible` tinyint(1) NOT NULL COMMENT '是否显示1、是  0 否',
  `sort` tinyint(3) unsigned NOT NULL COMMENT '排序（大的在前，小的在后）',
  `tree_path` varchar(100) NOT NULL,
  `icon_normal_file_id` int(10) unsigned NOT NULL COMMENT '正常状态的图片id（40*40）',
  `icon_selected_file_id` int(10) unsigned NOT NULL COMMENT '选中状态的图片id（40*40）',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '分类类型 1、广告 2、商品',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=81 DEFAULT CHARSET=utf8 COMMENT='广告分类设置表';

-- ----------------------------
-- Table structure for gt_checkcode
-- ----------------------------
DROP TABLE IF EXISTS `gt_checkcode`;
CREATE TABLE `gt_checkcode` (
  `phone` varchar(20) NOT NULL COMMENT '手机号码',
  `checkcode` char(6) DEFAULT NULL COMMENT '短信验证码',
  `create_time` int(10) unsigned NOT NULL,
  PRIMARY KEY (`phone`),
  UNIQUE KEY `phone` (`phone`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='盖网通接口短信验证码记录表';

-- ----------------------------
-- Table structure for gt_config
-- ----------------------------
DROP TABLE IF EXISTS `gt_config`;
CREATE TABLE `gt_config` (
  `code` varchar(225) NOT NULL COMMENT '配置简码',
  `name` varchar(225) NOT NULL COMMENT '配置名',
  `value` text NOT NULL COMMENT '序列化后的配置值',
  `update_time` int(10) unsigned NOT NULL COMMENT '修改时间',
  `value_type` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for gt_coupon_bind
-- ----------------------------
DROP TABLE IF EXISTS `gt_coupon_bind`;
CREATE TABLE `gt_coupon_bind` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `coupon_id` mediumint(8) NOT NULL COMMENT '优惠码id',
  `member_id` mediumint(8) DEFAULT NULL COMMENT '用户GW账户id',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=382 DEFAULT CHARSET=utf8 COMMENT='会员绑定优惠码';

-- ----------------------------
-- Table structure for gt_custom_fun
-- ----------------------------
DROP TABLE IF EXISTS `gt_custom_fun`;
CREATE TABLE `gt_custom_fun` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(56) NOT NULL COMMENT '自定义功能名称',
  `related_url` varchar(128) NOT NULL COMMENT '关联地址',
  `status` tinyint(1) NOT NULL COMMENT '0待审核 1、审核已通过 2、审核未通过',
  `sort` smallint(6) unsigned NOT NULL COMMENT '排序 大的在前，小的在后',
  `is_full_screen` tinyint(1) NOT NULL COMMENT '是否全屏',
  `enabled` tinyint(1) NOT NULL COMMENT '是否可用',
  `activity_start_time` int(10) unsigned NOT NULL COMMENT '活动开始时间',
  `activity_end_time` int(10) unsigned NOT NULL COMMENT '活动结束时间',
  `remark` varchar(500) NOT NULL,
  `create_time` int(10) unsigned NOT NULL COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL COMMENT '更新时间',
  `version` smallint(6) NOT NULL DEFAULT '0' COMMENT '当前版本号，如果有修改，则加1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for gt_error_log
-- ----------------------------
DROP TABLE IF EXISTS `gt_error_log`;
CREATE TABLE `gt_error_log` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `machine_id` mediumint(8) unsigned NOT NULL COMMENT '盖机ID',
  `versioninfo` varchar(5) DEFAULT NULL COMMENT '应用版本信息',
  `mobileInfo` text COMMENT '设备信息',
  `errorinfo` text COMMENT '错误信息',
  `create_time` int(10) unsigned NOT NULL COMMENT '错误日志保存时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=150 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for gt_file_manage
-- ----------------------------
DROP TABLE IF EXISTS `gt_file_manage`;
CREATE TABLE `gt_file_manage` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `filename` varchar(100) NOT NULL COMMENT '文件实际名称',
  `suffix` varchar(20) NOT NULL COMMENT '文件后缀',
  `width` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '图片的宽度',
  `height` smallint(6) NOT NULL DEFAULT '0' COMMENT '图片的高度',
  `path` varchar(200) NOT NULL COMMENT '文件的相对路径',
  `classify` tinyint(3) NOT NULL COMMENT '文件所属分类',
  `user_id` mediumint(8) unsigned NOT NULL COMMENT '上传该文件的用户id',
  `create_time` int(10) unsigned NOT NULL COMMENT '文件上传的时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16407 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for gt_machine
-- ----------------------------
DROP TABLE IF EXISTS `gt_machine`;
CREATE TABLE `gt_machine` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `machine_code` char(12) NOT NULL COMMENT '盖机编码，由系统自动生成,12位数字组成',
  `name` varchar(128) NOT NULL COMMENT '盖网通名称',
  `password` varchar(128) NOT NULL COMMENT '终端机管理密码,由一定规则生成的加密串，可以解密',
  `loc_lng` double(10,6) NOT NULL COMMENT '经度',
  `loc_lat` double(10,6) NOT NULL COMMENT '纬度',
  `status` tinyint(1) NOT NULL COMMENT '盖机的状态（0、申请 1、启用 2、禁用）',
  `run_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '盖网通的运行状态（1、运行 2、停止 3、卸载 ）',
  `country_id` mediumint(8) unsigned NOT NULL DEFAULT '1' COMMENT '国家id',
  `province_id` mediumint(8) unsigned NOT NULL COMMENT '省份id',
  `city_id` mediumint(8) unsigned NOT NULL COMMENT '城市id',
  `district_id` mediumint(8) unsigned NOT NULL COMMENT '区县id',
  `address` varchar(225) NOT NULL COMMENT '盖机地址',
  `user_id` mediumint(8) unsigned NOT NULL COMMENT '管理员id',
  `user_ip` int(11) unsigned NOT NULL COMMENT '管理员ip',
  `create_time` int(10) unsigned NOT NULL COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL COMMENT '修改时间',
  `biz_info_id` mediumint(8) unsigned NOT NULL COMMENT '加盟商id',
  `ip_address` int(11) unsigned NOT NULL COMMENT '盖机的ip地址',
  `setup_time` int(10) unsigned NOT NULL COMMENT '最后安装时间/最后激活时间',
  `last_open_time` int(10) unsigned NOT NULL COMMENT '最近开机时间',
  `auto_open_time` char(5) NOT NULL COMMENT '每天自动开机时间(例如：05:30)',
  `auto_shutdown_time` char(5) NOT NULL COMMENT '每天自动关机时间(例如：05:30)',
  `remark` varchar(200) NOT NULL COMMENT '备注（记录机器比较重要的动作（例如：2013/7/3 16:21:35：已经打开终端显示系统））',
  `volume_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '盖网通音量控制方（0：后台 1:本地）',
  `sys_volume` tinyint(3) unsigned NOT NULL DEFAULT '30' COMMENT '系统音量（0-100）默认30',
  `intro_member_id` int(11) NOT NULL COMMENT '推荐人的盖网编号（GW....）的id',
  `install_member_id` int(11) unsigned NOT NULL COMMENT '铺机人',
  `operate_member_id` int(11) unsigned NOT NULL COMMENT '运维人',
  `mac_address` varchar(100) NOT NULL COMMENT '机器的mac地址',
  `activation_code` varchar(50) NOT NULL COMMENT '系统生成的激活码',
  `machine_version` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '盖机的版本（1、在线版 2、离线版）',
  `symbol` varchar(20) NOT NULL DEFAULT 'RMB' COMMENT '币种(RMB、HKD)',
  `soft_type_id` tinyint(1) NOT NULL DEFAULT '1' COMMENT '安装的软件包类型',
  `machine_monitor_id` int(11) NOT NULL COMMENT '机器最新的截图id',
  `hardware_number` varchar(100) NOT NULL COMMENT '硬件序列号',
  `private_key` text NOT NULL COMMENT '私钥',
  `public_key` text NOT NULL COMMENT '公钥',
  `max_amount` decimal(10,2) unsigned NOT NULL DEFAULT '1000000.00' COMMENT '最大消费金额',
  `activat_time` int(11) unsigned DEFAULT '0' COMMENT '首次激活时间',
  `app_switch_id` int(11) unsigned DEFAULT '0' COMMENT 'app切换任务id',
  `gt_picture` varchar(225) DEFAULT NULL COMMENT '盖网通图片',
  `is_moved` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否警告',
  `pos_code` char(11) DEFAULT NULL COMMENT 'POS终端号',
  PRIMARY KEY (`id`),
  UNIQUE KEY `machine_code` (`machine_code`) USING BTREE,
  KEY `province_id` (`province_id`) USING BTREE,
  KEY `city_id` (`city_id`) USING BTREE,
  KEY `district_id` (`district_id`) USING BTREE,
  KEY `intro_member_id` (`intro_member_id`),
  KEY `biz_info_id` (`biz_info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13693 DEFAULT CHARSET=utf8 COMMENT='盖网通主表';

-- ----------------------------
-- Table structure for gt_machine_2_advert
-- ----------------------------
DROP TABLE IF EXISTS `gt_machine_2_advert`;
CREATE TABLE `gt_machine_2_advert` (
  `machine_id` mediumint(8) unsigned NOT NULL COMMENT '盖机id',
  `advert_id` mediumint(8) unsigned NOT NULL COMMENT '视频广告id',
  `user_id` mediumint(8) NOT NULL COMMENT '管理员id',
  `user_ip` int(11) unsigned NOT NULL COMMENT '管理员ip',
  `create_time` int(10) unsigned NOT NULL COMMENT '创建时间',
  `sort` mediumint(8) unsigned NOT NULL COMMENT '排序，大的在前',
  KEY `machine_id` (`machine_id`) USING BTREE,
  KEY `advert_id` (`advert_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='盖机与广告绑定表';

-- ----------------------------
-- Table structure for gt_machine_2_advert_video
-- ----------------------------
DROP TABLE IF EXISTS `gt_machine_2_advert_video`;
CREATE TABLE `gt_machine_2_advert_video` (
  `machine_id` mediumint(8) unsigned NOT NULL COMMENT '盖机id',
  `advert_id` mediumint(8) unsigned NOT NULL COMMENT '视频广告id',
  `is_available` tinyint(1) NOT NULL COMMENT '是否启用1、是 0 否',
  `play_start_date` int(10) unsigned NOT NULL COMMENT '播放开始日期 （只保存日期）',
  `play_end_date` int(10) unsigned NOT NULL COMMENT '播放结束日期 （只保存日期）',
  `user_id` mediumint(8) NOT NULL COMMENT '管理员id',
  `user_ip` int(11) unsigned NOT NULL COMMENT '管理员ip',
  `create_time` int(10) unsigned NOT NULL COMMENT '创建时间',
  `sort` mediumint(8) unsigned NOT NULL COMMENT '排序，大的在前',
  KEY `machine_id` (`machine_id`) USING BTREE,
  KEY `advert_id` (`advert_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='盖机与视频广告绑定表';

-- ----------------------------
-- Table structure for gt_machine_2_product
-- ----------------------------
DROP TABLE IF EXISTS `gt_machine_2_product`;
CREATE TABLE `gt_machine_2_product` (
  `machine_id` mediumint(8) unsigned NOT NULL COMMENT '盖机id',
  `product_id` mediumint(8) unsigned NOT NULL COMMENT '商品管理id',
  `user_id` mediumint(8) NOT NULL COMMENT '管理员id',
  `user_ip` int(11) unsigned NOT NULL COMMENT '管理员ip',
  `create_time` int(10) unsigned NOT NULL COMMENT '创建时间',
  `sort` mediumint(8) unsigned NOT NULL COMMENT '排序，大的在前',
  KEY `machine_id` (`machine_id`) USING BTREE,
  KEY `product_id` (`product_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='盖机与商品绑定表';

-- ----------------------------
-- Table structure for gt_machine_activity
-- ----------------------------
DROP TABLE IF EXISTS `gt_machine_activity`;
CREATE TABLE `gt_machine_activity` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '活动id',
  `user_id` mediumint(8) NOT NULL DEFAULT '0' COMMENT '管理员id',
  `user_ip` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '管理员ip',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `gaiw_sum` int(10) NOT NULL DEFAULT '0' COMMENT '同一盖网号领取优惠码的次数',
  `price_money` double(11,2) NOT NULL DEFAULT '0.00' COMMENT '消费金额条件',
  `activity_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '优惠码的获取途径（1注册，2消费，3签到）',
  `start_time` int(10) NOT NULL DEFAULT '0' COMMENT '活动开始时间',
  `end_time` int(10) NOT NULL DEFAULT '0' COMMENT '活动结束时间',
  `title` varchar(100) NOT NULL COMMENT '活动描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for gt_machine_activity_code
-- ----------------------------
DROP TABLE IF EXISTS `gt_machine_activity_code`;
CREATE TABLE `gt_machine_activity_code` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'code主键',
  `discount_code` varchar(128) NOT NULL COMMENT '优惠券码',
  `code_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '优惠码类型（1UBER）',
  `activity_id` int(11) NOT NULL COMMENT '活动id',
  `code_sum` int(10) NOT NULL DEFAULT '0' COMMENT '同一优惠码在盖机上的显示次数',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `picture_url` varchar(255) NOT NULL COMMENT '图片的url地址',
  `couponName` varchar(128) NOT NULL COMMENT '优惠券名称',
  `value` decimal(9,2) NOT NULL DEFAULT '0.00' COMMENT '优惠券面值',
  `pay_percent` decimal(9,2) NOT NULL DEFAULT '100.00' COMMENT '折扣',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=597 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for gt_machine_activity_machine
-- ----------------------------
DROP TABLE IF EXISTS `gt_machine_activity_machine`;
CREATE TABLE `gt_machine_activity_machine` (
  `activity_id` int(10) unsigned NOT NULL COMMENT '活动id',
  `machine_id` int(10) NOT NULL COMMENT '盖机id',
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46251 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for gt_machine_advert
-- ----------------------------
DROP TABLE IF EXISTS `gt_machine_advert`;
CREATE TABLE `gt_machine_advert` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL COMMENT '广告标题',
  `description` varchar(255) NOT NULL COMMENT '广告介绍',
  `category_id` smallint(5) unsigned NOT NULL COMMENT '分类',
  `use_status` tinyint(1) NOT NULL COMMENT '是否可用（1、使用 0未使用）',
  `status` tinyint(1) NOT NULL COMMENT '状态（1、启用 2、删除）',
  `advert_type` tinyint(11) unsigned NOT NULL COMMENT '广告类型（1、视频 2、签到页广告 3、优惠券）',
  `sort` mediumint(8) unsigned NOT NULL COMMENT '排序（大的在前，小的在后）',
  `svc_start_time` int(10) unsigned NOT NULL COMMENT '服务开始时间',
  `svc_end_time` int(10) unsigned NOT NULL COMMENT '服务结束时间',
  `display_count` mediumint(8) unsigned NOT NULL COMMENT '展示次数',
  `coupon_start_time` int(10) unsigned NOT NULL COMMENT '优惠券使用的开始时间',
  `coupon_end_time` int(10) unsigned NOT NULL COMMENT '优惠券使用的结束时间',
  `coupon_quantity` mediumint(8) unsigned NOT NULL COMMENT '优惠券初始的数量',
  `coupon_use_count` mediumint(8) unsigned NOT NULL COMMENT '优惠券已使用数量',
  `coupon_name` varchar(50) NOT NULL COMMENT '优惠券名称',
  `coupon_content` varchar(255) NOT NULL COMMENT '优惠券内容',
  `file_id` int(10) unsigned NOT NULL COMMENT '放大图id或者签到页广告图片id或视频文件id',
  `thumbnail_id` int(10) unsigned NOT NULL COMMENT '缩略图id',
  `loc_lng` double(10,6) NOT NULL COMMENT '经度',
  `loc_lat` double(10,6) NOT NULL COMMENT '纬度',
  `country_id` mediumint(8) unsigned NOT NULL DEFAULT '1' COMMENT '国家id',
  `province_id` mediumint(8) unsigned NOT NULL COMMENT '省份id',
  `city_id` mediumint(8) unsigned NOT NULL COMMENT '城市id',
  `district_id` mediumint(8) unsigned NOT NULL COMMENT '区县id',
  `coupon_message` varchar(255) NOT NULL COMMENT '优惠券短信内容',
  `user_id` mediumint(8) unsigned NOT NULL COMMENT '管理员id',
  `user_ip` int(11) unsigned NOT NULL COMMENT '管理员ip',
  `create_time` int(10) unsigned NOT NULL COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL COMMENT '修改时间',
  `is_line` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0线下、1线上',
  `url` varchar(255) NOT NULL COMMENT '线上商品的链接地址',
  `price` decimal(10,2) unsigned NOT NULL COMMENT '格子铺的价格',
  `pay_type` varchar(255) DEFAULT '1,2' COMMENT '支付方式1:积分支付 2:银行卡支付 3:积分+银行卡支付   1,2表示支持积分支付、银行卡支付  不支持积分+银行卡支付',
  `activity_type` tinyint(2) DEFAULT '0' COMMENT '活动类型 1:一元尊享',
  `activity_rule` text COMMENT 'JSON格式的活动规则',
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`) USING BTREE,
  KEY `use_status` (`use_status`) USING BTREE,
  KEY `advert_type` (`advert_type`) USING BTREE,
  KEY `province_id` (`province_id`) USING BTREE,
  KEY `city_id` (`city_id`) USING BTREE,
  KEY `district_id` (`district_id`) USING BTREE,
  KEY `is_line` (`is_line`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=82445 DEFAULT CHARSET=utf8 COMMENT='盖网通广告表';

-- ----------------------------
-- Table structure for gt_machine_advert_video
-- ----------------------------
DROP TABLE IF EXISTS `gt_machine_advert_video`;
CREATE TABLE `gt_machine_advert_video` (
  `advert_id` mediumint(8) unsigned NOT NULL COMMENT '视频的id',
  `resolution` varchar(50) NOT NULL COMMENT '视频分辨率',
  `duration` int(10) unsigned NOT NULL COMMENT '视频时长',
  `snapshot_id` int(10) unsigned NOT NULL COMMENT '视频截图的id',
  `video_status` tinyint(1) unsigned NOT NULL COMMENT '视频状态，是否通过审核0待审核 1已通过 2未通过',
  PRIMARY KEY (`advert_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='视频广告表';

-- ----------------------------
-- Table structure for gt_machine_app_swicth
-- ----------------------------
DROP TABLE IF EXISTS `gt_machine_app_swicth`;
CREATE TABLE `gt_machine_app_swicth` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `machine_id` int(11) unsigned NOT NULL COMMENT '机器id',
  `machine_version_old` tinyint(1) unsigned NOT NULL COMMENT '旧版本',
  `machine_version_new` tinyint(1) unsigned NOT NULL COMMENT '新版本',
  `create_time` int(11) unsigned NOT NULL COMMENT '创建时间',
  `admin_id` int(11) unsigned NOT NULL COMMENT '切换人',
  `is_switch` tinyint(1) unsigned DEFAULT '0' COMMENT '已切换',
  `switch_time` int(11) unsigned DEFAULT NULL COMMENT '机器切换时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=336 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gt_machine_bak
-- ----------------------------
DROP TABLE IF EXISTS `gt_machine_bak`;
CREATE TABLE `gt_machine_bak` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `machine_code` char(12) NOT NULL COMMENT '盖机编码，由系统自动生成,12位数字组成',
  `name` varchar(128) NOT NULL COMMENT '盖网通名称',
  `password` varchar(128) NOT NULL COMMENT '终端机管理密码,由一定规则生成的加密串，可以解密',
  `loc_lng` double(10,6) NOT NULL COMMENT '经度',
  `loc_lat` double(10,6) NOT NULL COMMENT '纬度',
  `status` tinyint(1) NOT NULL COMMENT '盖机的状态（0、申请 1、启用 2、禁用）',
  `run_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '盖网通的运行状态（1、运行 2、停止 3、卸载 ）',
  `country_id` mediumint(8) unsigned NOT NULL DEFAULT '1' COMMENT '国家id',
  `province_id` mediumint(8) unsigned NOT NULL COMMENT '省份id',
  `city_id` mediumint(8) unsigned NOT NULL COMMENT '城市id',
  `district_id` mediumint(8) unsigned NOT NULL COMMENT '区县id',
  `address` varchar(225) NOT NULL COMMENT '盖机地址',
  `user_id` mediumint(8) unsigned NOT NULL COMMENT '管理员id',
  `user_ip` int(11) unsigned NOT NULL COMMENT '管理员ip',
  `create_time` int(10) unsigned NOT NULL COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL COMMENT '修改时间',
  `biz_info_id` mediumint(8) unsigned NOT NULL COMMENT '加盟商id',
  `ip_address` int(11) unsigned NOT NULL COMMENT '盖机的ip地址',
  `setup_time` int(10) unsigned NOT NULL COMMENT '最后安装时间/最后激活时间',
  `last_open_time` int(10) unsigned NOT NULL COMMENT '最近开机时间',
  `auto_open_time` char(5) NOT NULL COMMENT '每天自动开机时间(例如：05:30)',
  `auto_shutdown_time` char(5) NOT NULL COMMENT '每天自动关机时间(例如：05:30)',
  `remark` varchar(200) NOT NULL COMMENT '备注（记录机器比较重要的动作（例如：2013/7/3 16:21:35：已经打开终端显示系统））',
  `volume_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '盖网通音量控制方（0：后台 1:本地）',
  `sys_volume` tinyint(3) unsigned NOT NULL DEFAULT '30' COMMENT '系统音量（0-100）默认30',
  `intro_member_id` int(11) NOT NULL COMMENT '推荐人的盖网编号（GW....）的id',
  `install_member_id` int(11) unsigned NOT NULL COMMENT '铺机人',
  `operate_member_id` int(11) unsigned NOT NULL COMMENT '运维人',
  `mac_address` varchar(100) NOT NULL COMMENT '机器的mac地址',
  `activation_code` varchar(50) NOT NULL COMMENT '系统生成的激活码',
  `machine_version` tinyint(1) unsigned NOT NULL COMMENT '盖机的版本（1、在线版 2、离线版）',
  `symbol` varchar(20) NOT NULL DEFAULT 'RMB' COMMENT '币种(RMB、HKD)',
  `soft_type_id` tinyint(1) NOT NULL DEFAULT '1' COMMENT '安装的软件包类型',
  `machine_monitor_id` int(11) NOT NULL COMMENT '机器最新的截图id',
  `hardware_number` varchar(100) NOT NULL COMMENT '硬件序列号',
  `private_key` text NOT NULL COMMENT '私钥',
  `public_key` text NOT NULL COMMENT '公钥',
  `max_amount` decimal(10,2) unsigned NOT NULL DEFAULT '1000000.00' COMMENT '最大消费金额',
  `activat_time` int(11) unsigned DEFAULT '0' COMMENT '首次激活时间',
  `app_switch_id` int(11) unsigned DEFAULT '0' COMMENT 'app切换任务id',
  `is_moved` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否警告',
  `discount_sum` int(11) NOT NULL DEFAULT '0' COMMENT '盖机展示优惠码次数',
  PRIMARY KEY (`id`),
  UNIQUE KEY `machine_code` (`machine_code`) USING BTREE,
  KEY `province_id` (`province_id`) USING BTREE,
  KEY `city_id` (`city_id`) USING BTREE,
  KEY `district_id` (`district_id`) USING BTREE,
  KEY `biz_info_id` (`biz_info_id`) USING BTREE,
  KEY `intro_member_id` (`intro_member_id`),
  KEY `biz_info_id_2` (`biz_info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12438 DEFAULT CHARSET=utf8 COMMENT='盖网通主表';

-- ----------------------------
-- Table structure for gt_machine_copy
-- ----------------------------
DROP TABLE IF EXISTS `gt_machine_copy`;
CREATE TABLE `gt_machine_copy` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `machine_code` char(12) NOT NULL COMMENT '盖机编码，由系统自动生成,12位数字组成',
  `name` varchar(128) NOT NULL COMMENT '盖网通名称',
  `password` varchar(128) NOT NULL COMMENT '终端机管理密码,由一定规则生成的加密串，可以解密',
  `loc_lng` double(10,6) NOT NULL COMMENT '经度',
  `loc_lat` double(10,6) NOT NULL COMMENT '纬度',
  `status` tinyint(1) NOT NULL COMMENT '盖机的状态（0、申请 1、启用 2、禁用）',
  `run_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '盖网通的运行状态（1、运行 2、停止 3、卸载 ）',
  `country_id` mediumint(8) unsigned NOT NULL DEFAULT '1' COMMENT '国家id',
  `province_id` mediumint(8) unsigned NOT NULL COMMENT '省份id',
  `city_id` mediumint(8) unsigned NOT NULL COMMENT '城市id',
  `district_id` mediumint(8) unsigned NOT NULL COMMENT '区县id',
  `address` varchar(225) NOT NULL COMMENT '盖机地址',
  `user_id` mediumint(8) unsigned NOT NULL COMMENT '管理员id',
  `user_ip` int(11) unsigned NOT NULL COMMENT '管理员ip',
  `create_time` int(10) unsigned NOT NULL COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL COMMENT '修改时间',
  `biz_info_id` mediumint(8) unsigned NOT NULL COMMENT '加盟商id',
  `ip_address` int(11) unsigned NOT NULL COMMENT '盖机的ip地址',
  `setup_time` int(10) unsigned NOT NULL COMMENT '最后安装时间/最后激活时间',
  `last_open_time` int(10) unsigned NOT NULL COMMENT '最近开机时间',
  `auto_open_time` char(5) NOT NULL COMMENT '每天自动开机时间(例如：05:30)',
  `auto_shutdown_time` char(5) NOT NULL COMMENT '每天自动关机时间(例如：05:30)',
  `remark` varchar(200) NOT NULL COMMENT '备注（记录机器比较重要的动作（例如：2013/7/3 16:21:35：已经打开终端显示系统））',
  `volume_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '盖网通音量控制方（0：后台 1:本地）',
  `sys_volume` tinyint(3) unsigned NOT NULL DEFAULT '30' COMMENT '系统音量（0-100）默认30',
  `intro_member_id` int(11) NOT NULL COMMENT '推荐人的盖网编号（GW....）的id',
  `mac_address` varchar(100) NOT NULL COMMENT '机器的mac地址',
  `activation_code` varchar(50) NOT NULL COMMENT '系统生成的激活码',
  `machine_version` tinyint(1) unsigned NOT NULL COMMENT '盖机的版本（1、在线版 2、离线版）',
  `symbol` varchar(20) NOT NULL DEFAULT 'RMB' COMMENT '币种(RMB、HKD)',
  `soft_type_id` tinyint(1) NOT NULL DEFAULT '1' COMMENT '安装的软件包类型',
  `machine_monitor_id` int(11) NOT NULL COMMENT '机器最新的截图id',
  `hardware_number` varchar(100) NOT NULL COMMENT '硬件序列号',
  `private_key` text NOT NULL COMMENT '私钥',
  `public_key` text NOT NULL COMMENT '公钥',
  `max_amount` decimal(10,2) unsigned NOT NULL DEFAULT '1000000.00' COMMENT '最大消费金额',
  `activat_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '首次激活时间',
  `app_switch_id` int(11) unsigned DEFAULT '0' COMMENT 'app切换id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `machine_code` (`machine_code`) USING BTREE,
  KEY `province_id` (`province_id`) USING BTREE,
  KEY `city_id` (`city_id`) USING BTREE,
  KEY `district_id` (`district_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16777215 DEFAULT CHARSET=utf8 COMMENT='盖网通主表';

-- ----------------------------
-- Table structure for gt_machine_coupon_record
-- ----------------------------
DROP TABLE IF EXISTS `gt_machine_coupon_record`;
CREATE TABLE `gt_machine_coupon_record` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `machine_id` mediumint(8) unsigned NOT NULL COMMENT '盖机id',
  `advert_id` mediumint(8) NOT NULL COMMENT '广告id',
  `send_time` int(10) NOT NULL COMMENT '发送时间',
  `user_ip` int(11) unsigned NOT NULL COMMENT '盖机当前的ip',
  `member_id` varchar(50) NOT NULL COMMENT '会员编号，如gw....',
  `mobile` char(11) NOT NULL COMMENT '手机号码',
  `serial_number` char(12) NOT NULL COMMENT '生成的优惠券号，用于商家识别,唯一',
  `status` tinyint(1) unsigned NOT NULL COMMENT '发送状态（0、发送中 1、已发送 2、发送失败）',
  PRIMARY KEY (`id`),
  KEY `machine_id` (`machine_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=11447 DEFAULT CHARSET=utf8 COMMENT='优惠券短信发送记录表';

-- ----------------------------
-- Table structure for gt_machine_day_log
-- ----------------------------
DROP TABLE IF EXISTS `gt_machine_day_log`;
CREATE TABLE `gt_machine_day_log` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `machine_code` char(12) NOT NULL COMMENT '盖机编码，由系统自动生成,12位数字组成',
  `status` tinyint(1) NOT NULL COMMENT '盖机的状态（0、申请 1、启用 2、禁用）',
  `run_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '盖网通的运行状态（1、运行 2、停止 3、卸载 ）',
  `setup_time` int(10) unsigned NOT NULL COMMENT '最后安装时间/最后激活时间',
  `last_open_time` int(10) unsigned NOT NULL COMMENT '最近开机时间',
  `log_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `log_date` (`log_date`),
  KEY `machine_code` (`machine_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=296368 DEFAULT CHARSET=utf8 COMMENT='盖网通运行时间表';

-- ----------------------------
-- Table structure for gt_machine_forbbiden
-- ----------------------------
DROP TABLE IF EXISTS `gt_machine_forbbiden`;
CREATE TABLE `gt_machine_forbbiden` (
  `machine_id` mediumint(8) NOT NULL COMMENT '盖网通id',
  `action_type` varchar(45) NOT NULL COMMENT '动作类型，例如advert/send',
  KEY `machine_forbbdien` (`machine_id`,`action_type`) USING BTREE,
  KEY `machine_id` (`machine_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='盖网通禁用功能表';

-- ----------------------------
-- Table structure for gt_machine_inventory
-- ----------------------------
DROP TABLE IF EXISTS `gt_machine_inventory`;
CREATE TABLE `gt_machine_inventory` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `machine_id` int(11) unsigned NOT NULL COMMENT '盖机id',
  `member_id` int(11) unsigned NOT NULL COMMENT '盘点人',
  `questionnaire_id` int(8) NOT NULL COMMENT '问卷调查id',
  `answer` text NOT NULL COMMENT '答案（JSON序列化的0、1，带题号）',
  `imgs` text NOT NULL COMMENT '图片（序列化）',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `create_time` int(11) NOT NULL COMMENT '盘点时间',
  `mremark` varchar(256) DEFAULT NULL COMMENT '库存机器详情备注',
  `software_id` varchar(128) DEFAULT NULL COMMENT '盖机出厂终端号',
  `shop_address` varchar(256) DEFAULT NULL COMMENT '店铺地址备案',
  `contact_phone` varchar(128) DEFAULT NULL COMMENT '联系电话备案',
  PRIMARY KEY (`id`),
  KEY `machine_id` (`machine_id`),
  KEY `questionnaire_id` (`questionnaire_id`),
  KEY `member_id` (`member_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6551 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for gt_machine_inventory_bak
-- ----------------------------
DROP TABLE IF EXISTS `gt_machine_inventory_bak`;
CREATE TABLE `gt_machine_inventory_bak` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `machine_id` int(11) unsigned NOT NULL COMMENT '盖机id',
  `member_id` int(11) unsigned NOT NULL COMMENT '盘点人',
  `questionnaire_id` int(8) NOT NULL COMMENT '问卷调查id',
  `answer` text NOT NULL COMMENT '答案（逗号隔开的0和1）',
  `imgs` text NOT NULL COMMENT '图片（序列化）',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注（盘点备注）',
  `create_time` int(11) NOT NULL COMMENT '盘点时间',
  `software_id` varchar(128) DEFAULT NULL COMMENT '盖机出厂终端号',
  `shop_address` varchar(256) DEFAULT NULL COMMENT '店铺地址备案',
  `mremark` varchar(256) DEFAULT NULL COMMENT '库存机器详情备注',
  `contact_phone` varchar(128) DEFAULT NULL COMMENT '联系电话备案',
  PRIMARY KEY (`id`),
  KEY `machine_id` (`machine_id`),
  KEY `questionnaire_id` (`questionnaire_id`),
  KEY `member_id` (`member_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6528 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for gt_machine_monitor
-- ----------------------------
DROP TABLE IF EXISTS `gt_machine_monitor`;
CREATE TABLE `gt_machine_monitor` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `machine_id` mediumint(8) unsigned NOT NULL COMMENT '盖机id',
  `path` varchar(100) NOT NULL COMMENT '图片的路径',
  `create_time` int(10) unsigned NOT NULL COMMENT '创建时间',
  `status` tinyint(1) NOT NULL COMMENT '状态（1、正常 2、异常）',
  `ip` int(11) unsigned NOT NULL COMMENT '盖机的ip地址',
  PRIMARY KEY (`id`),
  KEY `machine_id_create_time` (`machine_id`,`create_time`) USING BTREE,
  KEY `status` (`status`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=301931980 DEFAULT CHARSET=utf8 COMMENT='盖网通监控表';

-- ----------------------------
-- Table structure for gt_machine_netspeed
-- ----------------------------
DROP TABLE IF EXISTS `gt_machine_netspeed`;
CREATE TABLE `gt_machine_netspeed` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `machine_id` mediumint(8) unsigned NOT NULL COMMENT '盖机id',
  `send_time` int(10) unsigned NOT NULL COMMENT '发送时间',
  `receive_time` int(10) unsigned NOT NULL COMMENT '返回时间',
  `time_span` mediumint(8) unsigned NOT NULL COMMENT '响应时间(存毫秒)',
  `create_time` int(10) unsigned NOT NULL COMMENT '创建时间',
  `ip` int(11) unsigned NOT NULL COMMENT '盖机的ip地址',
  PRIMARY KEY (`id`),
  KEY `machine_id` (`machine_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=18999763 DEFAULT CHARSET=utf8 COMMENT='联机监控统计';

-- ----------------------------
-- Table structure for gt_machine_online
-- ----------------------------
DROP TABLE IF EXISTS `gt_machine_online`;
CREATE TABLE `gt_machine_online` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `machine_id` mediumint(8) unsigned NOT NULL COMMENT '盖机id',
  `time_online` int(10) unsigned NOT NULL COMMENT '在线时间',
  `time_offline` int(10) unsigned NOT NULL COMMENT '下线时间',
  PRIMARY KEY (`id`),
  KEY `machine_id` (`machine_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=3544909 DEFAULT CHARSET=utf8 COMMENT='盖机运行情况统计';

-- ----------------------------
-- Table structure for gt_machine_questionnaire
-- ----------------------------
DROP TABLE IF EXISTS `gt_machine_questionnaire`;
CREATE TABLE `gt_machine_questionnaire` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `question` text NOT NULL COMMENT '题目内容（序列化）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for gt_machine_recharge_log
-- ----------------------------
DROP TABLE IF EXISTS `gt_machine_recharge_log`;
CREATE TABLE `gt_machine_recharge_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `machine_id` mediumint(8) NOT NULL COMMENT '盖网机id',
  `user_phone` char(11) NOT NULL COMMENT '手机号码',
  `recharge_card_no` varchar(100) NOT NULL COMMENT '充值卡号',
  `create_time` int(10) unsigned NOT NULL COMMENT '充值时间',
  `ip_address` int(11) unsigned NOT NULL COMMENT '盖机的ip地址',
  `member_id` varchar(50) NOT NULL COMMENT '会员编号，如gw....',
  PRIMARY KEY (`id`),
  KEY `machine_id` (`machine_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7841 DEFAULT CHARSET=utf8 COMMENT='盖网机充值记录表';

-- ----------------------------
-- Table structure for gt_machine_register
-- ----------------------------
DROP TABLE IF EXISTS `gt_machine_register`;
CREATE TABLE `gt_machine_register` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `machine_id` mediumint(8) unsigned NOT NULL COMMENT '盖机id',
  `member_id` varchar(50) NOT NULL COMMENT '会员编号，如gw....',
  `register_time` int(10) unsigned NOT NULL COMMENT '注册时间',
  PRIMARY KEY (`id`),
  KEY `machine_id` (`machine_id`) USING BTREE,
  KEY `member_id` (`member_id`)
) ENGINE=MyISAM AUTO_INCREMENT=95974 DEFAULT CHARSET=utf8 COMMENT='盖机注册会员统计';

-- ----------------------------
-- Table structure for gt_machine_register_copy
-- ----------------------------
DROP TABLE IF EXISTS `gt_machine_register_copy`;
CREATE TABLE `gt_machine_register_copy` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `machine_id` mediumint(8) unsigned NOT NULL COMMENT '盖机id',
  `member_id` varchar(50) NOT NULL COMMENT '会员编号，如gw....',
  `register_time` int(10) unsigned NOT NULL COMMENT '注册时间',
  PRIMARY KEY (`id`),
  KEY `machine_id` (`machine_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=68338 DEFAULT CHARSET=utf8 COMMENT='盖机注册会员统计';

-- ----------------------------
-- Table structure for gt_machine_run_log
-- ----------------------------
DROP TABLE IF EXISTS `gt_machine_run_log`;
CREATE TABLE `gt_machine_run_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `machine_id` int(11) unsigned NOT NULL COMMENT '盖机id',
  `create_time` int(11) unsigned NOT NULL COMMENT '创建时间',
  `loc_lng` double(10,6) DEFAULT NULL COMMENT '经度',
  `loc_lat` double(10,6) DEFAULT NULL COMMENT '纬度',
  `pos_state` tinyint(2) NOT NULL COMMENT 'pos机状态',
  `firmware_version` varchar(5) DEFAULT NULL COMMENT '盖网通主板固件版本',
  PRIMARY KEY (`id`),
  KEY `machine_id` (`machine_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2263 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for gt_machine_software
-- ----------------------------
DROP TABLE IF EXISTS `gt_machine_software`;
CREATE TABLE `gt_machine_software` (
  `software_sn` varchar(128) NOT NULL COMMENT '硬件序列号',
  `franchisee_id` int(11) unsigned DEFAULT NULL COMMENT '加盟商id',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `admin_id` int(11) NOT NULL,
  `old_franchisee_id` int(11) unsigned DEFAULT NULL COMMENT '原加盟商id',
  `machine_id` int(11) unsigned DEFAULT NULL COMMENT 'machine表id',
  `old_machine_id` int(11) unsigned DEFAULT NULL COMMENT '原machine表id',
  PRIMARY KEY (`software_sn`),
  KEY `franchisee_id` (`franchisee_id`),
  KEY `machine_id` (`machine_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='盖网通硬件关系';

-- ----------------------------
-- Table structure for gt_machine_software_bak
-- ----------------------------
DROP TABLE IF EXISTS `gt_machine_software_bak`;
CREATE TABLE `gt_machine_software_bak` (
  `software_sn` varchar(128) NOT NULL COMMENT '硬件序列号',
  `franchisee_id` int(11) unsigned DEFAULT NULL COMMENT '加盟商id',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `admin_id` int(11) NOT NULL,
  `old_franchisee_id` int(11) unsigned DEFAULT NULL COMMENT '原加盟商id',
  `machine_id` int(11) unsigned DEFAULT NULL COMMENT 'machine表id',
  `old_machine_id` int(11) unsigned DEFAULT NULL COMMENT '原machine表id',
  PRIMARY KEY (`software_sn`),
  KEY `franchisee_id` (`franchisee_id`),
  KEY `machine_id` (`machine_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='盖网通硬件关系';

-- ----------------------------
-- Table structure for gt_machine_temp_lucky_data
-- ----------------------------
DROP TABLE IF EXISTS `gt_machine_temp_lucky_data`;
CREATE TABLE `gt_machine_temp_lucky_data` (
  `member_id` int(11) unsigned NOT NULL COMMENT '会员id',
  `machine_id` int(11) unsigned NOT NULL COMMENT '机器id',
  `lucky` varchar(255) DEFAULT NULL COMMENT '奖项',
  `create_time` int(11) unsigned DEFAULT NULL COMMENT '时间',
  `batch` varchar(10) DEFAULT NULL COMMENT '批次',
  PRIMARY KEY (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='临时活动数据';

-- ----------------------------
-- Table structure for gt_phone_car
-- ----------------------------
DROP TABLE IF EXISTS `gt_phone_car`;
CREATE TABLE `gt_phone_car` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `machine_id` int(10) NOT NULL COMMENT '盖机编号',
  `phone_char` char(6) NOT NULL COMMENT '手机令牌',
  `uptime` int(10) unsigned NOT NULL COMMENT '消费时间(盖机传递过来的时间)',
  `create_time` int(10) unsigned NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `id_car_time` (`machine_id`,`phone_char`,`uptime`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for gt_picture_manage
-- ----------------------------
DROP TABLE IF EXISTS `gt_picture_manage`;
CREATE TABLE `gt_picture_manage` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `path` varchar(200) NOT NULL COMMENT '文件的路径',
  `url` varchar(200) NOT NULL COMMENT '图片的url地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gt_pos_check
-- ----------------------------
DROP TABLE IF EXISTS `gt_pos_check`;
CREATE TABLE `gt_pos_check` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `TransactionID` text NOT NULL,
  `ShopID` varchar(20) NOT NULL,
  `check_time` int(11) DEFAULT NULL,
  `result` text,
  `status` tinyint(1) unsigned DEFAULT '0' COMMENT '0未检查,1未有交易,2已有交易',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8 COMMENT='pos机消费验证';

-- ----------------------------
-- Table structure for gt_pos_machine
-- ----------------------------
DROP TABLE IF EXISTS `gt_pos_machine`;
CREATE TABLE `gt_pos_machine` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `code` char(12) NOT NULL COMMENT '装机编码，由系统自动生成,12位数字组成',
  `activation_code` varchar(50) NOT NULL COMMENT '系统生成的激活码',
  `name` varchar(128) NOT NULL COMMENT '售货机名称',
  `password` varchar(128) NOT NULL COMMENT '管理密码',
  `status` tinyint(1) unsigned NOT NULL COMMENT '状态（0、申请 1、启用 2、禁用）',
  `is_activate` tinyint(1) unsigned NOT NULL COMMENT '是否激活（0未激活、1已激活）',
  `symbol` varchar(20) NOT NULL DEFAULT 'RMB' COMMENT '币种(RMB、HKD)',
  `country_id` mediumint(8) unsigned NOT NULL DEFAULT '1' COMMENT '国家id',
  `province_id` mediumint(8) unsigned NOT NULL COMMENT '省份id',
  `city_id` mediumint(8) unsigned NOT NULL COMMENT '城市id',
  `district_id` mediumint(8) unsigned NOT NULL COMMENT '区县id',
  `address` varchar(225) NOT NULL COMMENT '地址',
  `user_id` mediumint(8) unsigned NOT NULL COMMENT '管理员id',
  `user_ip` int(11) unsigned NOT NULL COMMENT '管理员ip',
  `franchisee_id` mediumint(8) unsigned NOT NULL COMMENT '加盟商id',
  `setup_time` int(10) unsigned NOT NULL COMMENT '安装时间',
  `remark` varchar(200) NOT NULL COMMENT '备注',
  `private_key` text NOT NULL COMMENT '私钥',
  `public_key` text NOT NULL COMMENT '公钥',
  `create_time` int(10) unsigned NOT NULL COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL COMMENT '修改时间',
  `device_id` char(64) NOT NULL COMMENT '设备id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gt_product
-- ----------------------------
DROP TABLE IF EXISTS `gt_product`;
CREATE TABLE `gt_product` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` smallint(5) NOT NULL COMMENT '分类id',
  `name` varchar(128) NOT NULL COMMENT '商品名称',
  `number` varchar(20) NOT NULL COMMENT '商品编号',
  `market_price` decimal(11,2) NOT NULL COMMENT '市场价',
  `price` decimal(11,2) NOT NULL COMMENT '零售价',
  `back_rate` tinyint(3) unsigned NOT NULL COMMENT '返佣率（存1-100的整数）',
  `gt_rate` tinyint(3) unsigned NOT NULL COMMENT '盖机收益率（存1-100的整数）',
  `return_score` decimal(10,2) NOT NULL COMMENT '返还积分',
  `stock` int(11) unsigned NOT NULL COMMENT '库存',
  `sales_volume` int(11) unsigned NOT NULL COMMENT '销量',
  `activity_start_time` int(10) unsigned NOT NULL COMMENT '活动开始时间',
  `activity_end_time` int(10) unsigned NOT NULL COMMENT '活动结束时间',
  `content` text NOT NULL COMMENT '产品详情',
  `biz_info_id` mediumint(8) unsigned NOT NULL COMMENT '加盟商id',
  `biz_name` varchar(128) NOT NULL COMMENT '加盟商名称',
  `thumbnail_id` int(10) NOT NULL COMMENT '封面图图id',
  `image_list_id` varchar(100) NOT NULL COMMENT '图片列表(例如：1|2|3)',
  `country_id` mediumint(8) unsigned NOT NULL DEFAULT '1' COMMENT '国家id',
  `province_id` mediumint(8) unsigned NOT NULL COMMENT '省份id',
  `city_id` mediumint(8) unsigned NOT NULL COMMENT '城市id',
  `district_id` mediumint(8) unsigned NOT NULL COMMENT '区县id',
  `status` tinyint(1) NOT NULL COMMENT '审核状态（0、待审核 1、审核已通过 2、审核未通过3、删除）',
  `use_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否可用（1、可用 0、不可用）',
  `sort` mediumint(8) NOT NULL COMMENT '排序，大的在前',
  `user_id` mediumint(8) NOT NULL,
  `user_ip` int(11) NOT NULL,
  `create_time` int(10) unsigned NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COMMENT='商品管理表';

-- ----------------------------
-- Table structure for gt_shopkeeper
-- ----------------------------
DROP TABLE IF EXISTS `gt_shopkeeper`;
CREATE TABLE `gt_shopkeeper` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `code` char(12) NOT NULL COMMENT '装机编码，由系统自动生成,12位数字组成',
  `activation_code` varchar(50) NOT NULL COMMENT '系统生成的激活码',
  `name` varchar(128) NOT NULL COMMENT '掌柜名称',
  `status` tinyint(1) unsigned NOT NULL COMMENT '状态（0、申请 1、启用 2、禁用）',
  `is_activate` tinyint(1) unsigned NOT NULL COMMENT '是否激活（0未激活、1已激活）',
  `symbol` varchar(20) NOT NULL DEFAULT 'RMB' COMMENT '币种(RMB、HKD)',
  `country_id` mediumint(8) unsigned NOT NULL DEFAULT '1' COMMENT '国家id',
  `province_id` mediumint(8) unsigned NOT NULL COMMENT '省份id',
  `city_id` mediumint(8) unsigned NOT NULL COMMENT '城市id',
  `district_id` mediumint(8) unsigned NOT NULL COMMENT '区县id',
  `address` varchar(225) NOT NULL COMMENT '地址',
  `user_id` mediumint(8) unsigned NOT NULL COMMENT '管理员id',
  `user_ip` int(11) unsigned NOT NULL COMMENT '管理员ip',
  `franchisee_id` mediumint(8) unsigned NOT NULL COMMENT '加盟商id',
  `setup_time` int(10) unsigned NOT NULL COMMENT '安装时间',
  `remark` varchar(200) NOT NULL COMMENT '备注',
  `private_key` text NOT NULL COMMENT '私钥',
  `public_key` text NOT NULL COMMENT '公钥',
  `create_time` int(10) unsigned NOT NULL COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL COMMENT '修改时间',
  `device_id` char(64) NOT NULL COMMENT '设备id',
  `os_type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '操作系统类型（1、安卓 2、IOS）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for gt_shopping_camera
-- ----------------------------
DROP TABLE IF EXISTS `gt_shopping_camera`;
CREATE TABLE `gt_shopping_camera` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `province_id` int(11) unsigned NOT NULL COMMENT '省份',
  `city_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '城市',
  `district_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '区/县',
  `shop_id` char(12) NOT NULL COMMENT 'gt_machine.machine_code字段',
  `gai_number` varchar(32) NOT NULL COMMENT '盖网编号',
  `image_url` varchar(255) NOT NULL COMMENT '上传图片',
  `transaction_id` varchar(64) NOT NULL COMMENT '流水交易号',
  `create_time` int(10) unsigned NOT NULL COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `gai_number` (`gai_number`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='盖网通--消费拍照上传';

-- ----------------------------
-- Table structure for gt_system_log
-- ----------------------------
DROP TABLE IF EXISTS `gt_system_log`;
CREATE TABLE `gt_system_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `log_cate` smallint(5) unsigned NOT NULL COMMENT '日志的分类',
  `log_title` text NOT NULL COMMENT '日志的标题',
  `log_type` tinyint(1) unsigned NOT NULL COMMENT '日志类型(1、新增 2、编辑 3、删除)',
  `create_time` int(10) unsigned NOT NULL,
  `source` varchar(50) NOT NULL COMMENT '表名',
  `source_id` varchar(200) NOT NULL COMMENT '操作表的id',
  `user_id` int(11) NOT NULL COMMENT '管理员id',
  `user_name` varchar(128) NOT NULL,
  `user_ip` int(11) unsigned NOT NULL COMMENT '管理员ip',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74447 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gt_token_menu
-- ----------------------------
DROP TABLE IF EXISTS `gt_token_menu`;
CREATE TABLE `gt_token_menu` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(8) NOT NULL COMMENT '标题',
  `image` varchar(200) DEFAULT NULL,
  `recognition` varchar(32) NOT NULL COMMENT '对手机端栏目表识匹配',
  `is_show` tinyint(2) unsigned NOT NULL COMMENT '是否展示',
  `order` tinyint(255) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` int(11) unsigned DEFAULT NULL COMMENT '创建时间',
  `update_timie` int(11) unsigned DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for gt_user
-- ----------------------------
DROP TABLE IF EXISTS `gt_user`;
CREATE TABLE `gt_user` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(128) CHARACTER SET utf8 NOT NULL COMMENT '用户名',
  `password` varchar(128) CHARACTER SET utf8 NOT NULL COMMENT '密码',
  `status` tinyint(1) NOT NULL,
  `real_name` varchar(56) CHARACTER SET utf8 NOT NULL COMMENT '真实姓名',
  `gender` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '性别，1男  2女',
  `mobile` varchar(32) CHARACTER SET utf8 NOT NULL COMMENT '手机号码',
  `email` varchar(100) NOT NULL COMMENT '邮箱',
  `login_counts` int(10) unsigned NOT NULL COMMENT '登陆次数',
  `last_login_time` int(10) unsigned NOT NULL COMMENT '最后登录时间',
  `activity_time` int(10) unsigned NOT NULL COMMENT '用户活动的时间，用户判断该用户是否在线',
  `create_time` int(10) unsigned NOT NULL COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=57 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for gt_user_2_region
-- ----------------------------
DROP TABLE IF EXISTS `gt_user_2_region`;
CREATE TABLE `gt_user_2_region` (
  `user_id` mediumint(8) unsigned NOT NULL COMMENT '管理员id',
  `region_id` smallint(5) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gt_vending_machine
-- ----------------------------
DROP TABLE IF EXISTS `gt_vending_machine`;
CREATE TABLE `gt_vending_machine` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `code` char(12) NOT NULL COMMENT '装机编码，由系统自动生成,12位数字组成',
  `activation_code` varchar(50) NOT NULL COMMENT '系统生成的激活码',
  `name` varchar(128) NOT NULL COMMENT '售货机名称',
  `password` varchar(128) NOT NULL COMMENT '管理密码',
  `status` tinyint(1) unsigned NOT NULL COMMENT '状态（0、申请 1、启用 2、禁用）',
  `is_activate` tinyint(1) unsigned NOT NULL COMMENT '是否激活（0未激活、1已激活）',
  `symbol` varchar(20) NOT NULL DEFAULT 'RMB' COMMENT '币种(RMB、HKD)',
  `country_id` mediumint(8) unsigned NOT NULL DEFAULT '1' COMMENT '国家id',
  `province_id` mediumint(8) unsigned NOT NULL COMMENT '省份id',
  `city_id` mediumint(8) unsigned NOT NULL COMMENT '城市id',
  `district_id` mediumint(8) unsigned NOT NULL COMMENT '区县id',
  `address` varchar(225) NOT NULL COMMENT '地址',
  `user_id` mediumint(8) unsigned NOT NULL COMMENT '管理员id',
  `user_ip` int(11) unsigned NOT NULL COMMENT '管理员ip',
  `franchisee_id` mediumint(8) unsigned NOT NULL COMMENT '加盟商id',
  `setup_time` int(10) unsigned NOT NULL COMMENT '安装时间',
  `remark` varchar(200) NOT NULL COMMENT '备注',
  `private_key` text NOT NULL COMMENT '私钥',
  `public_key` text NOT NULL COMMENT '公钥',
  `create_time` int(10) unsigned NOT NULL COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL COMMENT '修改时间',
  `device_id` char(64) NOT NULL COMMENT '设备id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='售货机表';

-- ----------------------------
-- Table structure for gt_vote_company
-- ----------------------------
DROP TABLE IF EXISTS `gt_vote_company`;
CREATE TABLE `gt_vote_company` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL COMMENT '商家名称',
  `logo_id` int(10) unsigned NOT NULL COMMENT '商家logo的id，308px*308px',
  `vote_count` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '投票的数量',
  `link_man` varchar(100) NOT NULL COMMENT '联系人',
  `phone` varchar(32) NOT NULL COMMENT '联系电话',
  `qq` varchar(15) NOT NULL COMMENT '在线咨询QQ',
  `web_site_url` varchar(200) NOT NULL COMMENT '网站地址',
  `address` varchar(200) NOT NULL COMMENT '地址',
  `recom_reason` text NOT NULL COMMENT '推荐理由',
  `img_list_id` varchar(500) NOT NULL COMMENT '存图片的id，例如1|2|3',
  `flash_id` int(10) NOT NULL DEFAULT '0' COMMENT '360度全景介绍flash的id',
  `loc_lng` double(10,6) NOT NULL COMMENT '经度',
  `loc_lat` double(10,6) NOT NULL COMMENT '纬度',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0。暂存 1.发布 2.回收站',
  `sort` mediumint(8) unsigned NOT NULL COMMENT '排序，大的在前',
  `user_id` mediumint(8) unsigned NOT NULL COMMENT '管理员id',
  `user_ip` int(11) unsigned NOT NULL COMMENT '管理员ip',
  `create_time` int(10) unsigned NOT NULL COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=111 DEFAULT CHARSET=utf8 COMMENT='投票公司表';

-- ----------------------------
-- Table structure for gt_vote_record
-- ----------------------------
DROP TABLE IF EXISTS `gt_vote_record`;
CREATE TABLE `gt_vote_record` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` varchar(50) NOT NULL COMMENT '会员编号',
  `machine_id` mediumint(8) unsigned NOT NULL COMMENT '盖机id',
  `vote_company_id` int(10) unsigned NOT NULL COMMENT '被投票的公司id',
  `create_time` int(10) unsigned NOT NULL COMMENT '被投票的公司id',
  `ip` int(11) unsigned NOT NULL COMMENT '盖机的ip地址',
  PRIMARY KEY (`id`),
  KEY `machine_id` (`machine_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=47830 DEFAULT CHARSET=utf8 COMMENT='投票记录表';

-- ----------------------------
-- Table structure for gt_xinfa_config
-- ----------------------------
DROP TABLE IF EXISTS `gt_xinfa_config`;
CREATE TABLE `gt_xinfa_config` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `machine_id` mediumint(8) unsigned NOT NULL COMMENT '盖机ID',
  `cache_path` varchar(225) DEFAULT '/mnt/sdcard/' COMMENT '缓存路径',
  `terminal_id` int(11) unsigned NOT NULL COMMENT '终端ID',
  `company_id` int(11) NOT NULL COMMENT '公司ID',
  `UUID` char(35) NOT NULL COMMENT '终端生成的唯一标示符UUID',
  `domain_name` varchar(255) DEFAULT NULL COMMENT '信发服务器域名（此项有值则不用填写ip和port）',
  `server_ip` int(11) unsigned DEFAULT NULL COMMENT '信发服务器IP',
  `server_port` int(11) unsigned DEFAULT NULL COMMENT '信发服务器端口',
  `HeartbeatTime` int(11) unsigned NOT NULL DEFAULT '60' COMMENT '连接信发系统的心跳频率（单位秒）',
  `screen_width` int(6) unsigned DEFAULT NULL COMMENT '屏幕宽',
  `screen_height` int(6) unsigned DEFAULT NULL COMMENT '屏幕高',
  `player_version` varchar(20) DEFAULT NULL COMMENT '播放器版本号',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '状态、是否激活：0:未激活 1:已激活',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `connection_type` varchar(20) DEFAULT NULL COMMENT '通信模式',
  `KeyText` int(11) DEFAULT NULL COMMENT '通信端口（由信发接 口返回）',
  `version` int(11) unsigned NOT NULL COMMENT '修改次数',
  `username` varchar(128) NOT NULL COMMENT '用户名',
  `password` varchar(128) NOT NULL COMMENT '密码',
  PRIMARY KEY (`id`),
  KEY `index_machine_id` (`machine_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34976 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_authassignment
-- ----------------------------
DROP TABLE IF EXISTS `tbl_authassignment`;
CREATE TABLE `tbl_authassignment` (
  `itemname` varchar(64) NOT NULL,
  `userid` varchar(64) NOT NULL,
  `bizrule` text,
  `data` text,
  PRIMARY KEY (`itemname`,`userid`),
  CONSTRAINT `tbl_authassignment_ibfk_1` FOREIGN KEY (`itemname`) REFERENCES `tbl_authitem` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_authitem
-- ----------------------------
DROP TABLE IF EXISTS `tbl_authitem`;
CREATE TABLE `tbl_authitem` (
  `name` varchar(64) NOT NULL,
  `type` int(11) NOT NULL,
  `description` text,
  `bizrule` text,
  `data` text,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_authitemchild
-- ----------------------------
DROP TABLE IF EXISTS `tbl_authitemchild`;
CREATE TABLE `tbl_authitemchild` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_rights
-- ----------------------------
DROP TABLE IF EXISTS `tbl_rights`;
CREATE TABLE `tbl_rights` (
  `itemname` varchar(64) NOT NULL,
  `type` int(11) NOT NULL,
  `weight` int(11) NOT NULL,
  PRIMARY KEY (`itemname`),
  CONSTRAINT `tbl_rights_ibfk_1` FOREIGN KEY (`itemname`) REFERENCES `tbl_authitem_bak` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
