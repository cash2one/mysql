/*
Navicat MySQL Data Transfer

Source Server         : 206
Source Server Version : 50524
Source Host           : 172.18.7.206:3306
Source Database       : gaiwang

Target Server Type    : MYSQL
Target Server Version : 50524
File Encoding         : 65001

Date: 2016-10-31 11:06:31
*/

SET FOREIGN_KEY_CHECKS=0;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`gaiwang` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `gaiwang`;
-- ----------------------------
-- Table structure for a_slow_query
-- ----------------------------
DROP TABLE IF EXISTS `a_slow_query`;
CREATE TABLE `a_slow_query` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sql` text NOT NULL,
  `ip` varchar(30) NOT NULL,
  `query_time` float(10,5) NOT NULL,
  `lock_time` float(10,5) NOT NULL,
  `test_time` float(10,5) NOT NULL COMMENT '实际测试耗时',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=149596 DEFAULT CHARSET=utf8 COMMENT='慢查询分析';

-- ----------------------------
-- Table structure for a_slow_query_bak
-- ----------------------------
DROP TABLE IF EXISTS `a_slow_query_bak`;
CREATE TABLE `a_slow_query_bak` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sql` text NOT NULL,
  `ip` varchar(30) NOT NULL,
  `query_time` float(10,5) NOT NULL,
  `lock_time` float(10,5) NOT NULL,
  `test_time` float(10,5) NOT NULL COMMENT '实际测试耗时',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16465 DEFAULT CHARSET=utf8 COMMENT='慢查询分析';

-- ----------------------------
-- Table structure for a_slow_query2_bak
-- ----------------------------
DROP TABLE IF EXISTS `a_slow_query2_bak`;
CREATE TABLE `a_slow_query2_bak` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sql` text NOT NULL,
  `ip` varchar(30) NOT NULL,
  `query_time` float(10,5) NOT NULL,
  `lock_time` float(10,5) NOT NULL,
  `test_time` float(10,5) NOT NULL COMMENT '实际测试耗时',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=670 DEFAULT CHARSET=utf8 COMMENT='慢查询分析';

-- ----------------------------
-- Table structure for a_test
-- ----------------------------
DROP TABLE IF EXISTS `a_test`;
CREATE TABLE `a_test` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `db` varchar(20) NOT NULL,
  `type` varchar(10) NOT NULL,
  `sql` text NOT NULL,
  `time` float(11,6) NOT NULL,
  `remark` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40155 DEFAULT CHARSET=utf8 COMMENT='本地临时测试表';

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
) ENGINE=InnoDB AUTO_INCREMENT=12399 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for bc_suppl_recharges_sms
-- ----------------------------
DROP TABLE IF EXISTS `bc_suppl_recharges_sms`;
CREATE TABLE `bc_suppl_recharges_sms` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mobile` varchar(128) DEFAULT NULL,
  `gai_num` varchar(128) DEFAULT NULL,
  `card_num` varchar(128) DEFAULT NULL,
  `value` decimal(12,0) DEFAULT NULL,
  `target_id` varchar(128) DEFAULT NULL,
  `content` varchar(255) NOT NULL,
  `status` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=159661 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for develop_log
-- ----------------------------
DROP TABLE IF EXISTS `develop_log`;
CREATE TABLE `develop_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `value` text,
  `datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_abnormal_merchants
-- ----------------------------
DROP TABLE IF EXISTS `gw_abnormal_merchants`;
CREATE TABLE `gw_abnormal_merchants` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `merchants_id` int(11) unsigned NOT NULL COMMENT '加盟商或者店铺的id',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '类型（1加盟商、2线上店铺）',
  PRIMARY KEY (`id`),
  KEY `type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='异常商户列表';

-- ----------------------------
-- Table structure for gw_account_manage
-- ----------------------------
DROP TABLE IF EXISTS `gw_account_manage`;
CREATE TABLE `gw_account_manage` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `gai_number` varchar(128) NOT NULL COMMENT 'GW号',
  `money` decimal(10,2) NOT NULL COMMENT '金额',
  `create_time` int(11) unsigned NOT NULL COMMENT '创建时间',
  `type` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `gai_number` (`gai_number`) USING BTREE,
  KEY `type` (`type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_activity
-- ----------------------------
DROP TABLE IF EXISTS `gw_activity`;
CREATE TABLE `gw_activity` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(128) NOT NULL COMMENT '名称',
  `money` decimal(10,2) unsigned NOT NULL COMMENT '面值',
  `sendout` int(11) unsigned NOT NULL COMMENT '发行量',
  `create_time` int(11) unsigned NOT NULL COMMENT '创建时间',
  `mode` tinyint(1) unsigned NOT NULL COMMENT '模式（1积分红包、2盖惠券）',
  `valid_end` int(11) unsigned NOT NULL COMMENT '有效时间（结束）',
  `type` tinyint(1) unsigned NOT NULL COMMENT '类型（1注册送红包、2分享送红包）',
  `status` tinyint(1) unsigned NOT NULL COMMENT '状态（0停止、1启用）',
  `valid_start` int(11) unsigned NOT NULL COMMENT '有效时间（开始）',
  `condition` int(11) unsigned NOT NULL COMMENT '使用条件',
  `excess` int(11) unsigned NOT NULL COMMENT '剩余量',
  `update_time` int(11) unsigned NOT NULL COMMENT '更新时间',
  `check` tinyint(1) unsigned NOT NULL COMMENT '审核状态（0审核中、1审核通过、2审核不通过）',
  `store_id` int(11) unsigned NOT NULL COMMENT '所属店铺',
  `thumbnail` varchar(128) NOT NULL COMMENT '代表图',
  `start_time` int(11) unsigned NOT NULL COMMENT '活动开始时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_activity_tag
-- ----------------------------
DROP TABLE IF EXISTS `gw_activity_tag`;
CREATE TABLE `gw_activity_tag` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ratio` float(6,3) unsigned NOT NULL COMMENT '消费支持比率',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态（0活动暂停、1活动开启）',
  `create_time` int(11) unsigned NOT NULL COMMENT '创建时间',
  `name` varchar(128) NOT NULL COMMENT '名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_address
-- ----------------------------
DROP TABLE IF EXISTS `gw_address`;
CREATE TABLE `gw_address` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `member_id` int(11) unsigned NOT NULL COMMENT '所属会员',
  `real_name` varchar(56) NOT NULL COMMENT '收货人姓名',
  `mobile` varchar(16) NOT NULL COMMENT '手机号码',
  `province_id` int(11) unsigned NOT NULL COMMENT '省份',
  `city_id` int(11) unsigned NOT NULL COMMENT '城市',
  `district_id` int(11) unsigned NOT NULL COMMENT '区/县',
  `street` varchar(128) NOT NULL COMMENT '详细地址',
  `zip_code` varchar(16) NOT NULL COMMENT '邮编',
  `default` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '默认地址（0否，1是）',
  `telephone` varchar(16) DEFAULT NULL COMMENT '固话',
  PRIMARY KEY (`id`),
  KEY `member_id` (`member_id`) USING BTREE,
  CONSTRAINT `fk_address_member` FOREIGN KEY (`member_id`) REFERENCES `gw_member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=53240 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_address_copy
-- ----------------------------
DROP TABLE IF EXISTS `gw_address_copy`;
CREATE TABLE `gw_address_copy` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `member_id` int(11) unsigned NOT NULL COMMENT '所属会员',
  `real_name` varchar(56) NOT NULL COMMENT '收货人姓名',
  `mobile` varchar(16) NOT NULL COMMENT '手机号码',
  `province_id` int(11) unsigned NOT NULL COMMENT '省份',
  `city_id` int(11) unsigned NOT NULL COMMENT '城市',
  `district_id` int(11) unsigned NOT NULL COMMENT '区/县',
  `street` varchar(128) NOT NULL COMMENT '详细地址',
  `zip_code` varchar(16) NOT NULL COMMENT '邮编',
  `default` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '默认地址（0否，1是）',
  PRIMARY KEY (`id`),
  KEY `member_id` (`member_id`) USING BTREE,
  CONSTRAINT `gw_address_copy_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `gw_member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18017 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='收货地址';

-- ----------------------------
-- Table structure for gw_advert
-- ----------------------------
DROP TABLE IF EXISTS `gw_advert`;
CREATE TABLE `gw_advert` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(128) NOT NULL COMMENT '名称',
  `code` varchar(128) NOT NULL COMMENT '编码',
  `content` varchar(256) NOT NULL COMMENT '说明',
  `type` tinyint(1) unsigned NOT NULL COMMENT '类型（1图片，2文字，3幻灯，4FLASH）',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态（0禁用，1启用）',
  `width` smallint(5) unsigned NOT NULL COMMENT '宽度',
  `height` smallint(5) unsigned NOT NULL COMMENT '高度',
  `direction` tinyint(1) unsigned NOT NULL COMMENT '定向投放',
  `city_id` int(11) unsigned NOT NULL COMMENT '城市',
  `category_id` int(11) unsigned NOT NULL COMMENT '分类',
  `franchisee_category_id` int(11) unsigned NOT NULL COMMENT '加盟商分类',
  `is_mshop` tinyint(2) NOT NULL DEFAULT '1' COMMENT '平台类型（1商城，2微商城）',
  PRIMARY KEY (`id`),
  KEY `code` (`code`) USING BTREE,
  KEY `city_id` (`city_id`) USING BTREE,
  KEY `category_id` (`category_id`) USING BTREE,
  KEY `franchisee_category_id` (`franchisee_category_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=485 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for gw_advert_goods
-- ----------------------------
DROP TABLE IF EXISTS `gw_advert_goods`;
CREATE TABLE `gw_advert_goods` (
  `advert_id` int(11) unsigned NOT NULL COMMENT '所属广告',
  `goods_id` int(11) unsigned NOT NULL COMMENT '商品',
  `sort` tinyint(3) unsigned NOT NULL COMMENT '排序',
  KEY `advert_id` (`advert_id`) USING BTREE,
  KEY `goods_id` (`goods_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_advert_picture
-- ----------------------------
DROP TABLE IF EXISTS `gw_advert_picture`;
CREATE TABLE `gw_advert_picture` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `advert_id` int(11) unsigned NOT NULL COMMENT '所属广告位',
  `title` varchar(128) NOT NULL COMMENT '标题',
  `start_time` int(11) unsigned NOT NULL COMMENT '开始时间',
  `end_time` int(11) unsigned NOT NULL COMMENT '结束时间',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态（0禁用，1启用）',
  `link` varchar(128) NOT NULL COMMENT '链接',
  `picture` varchar(128) NOT NULL COMMENT '图片',
  `text` varchar(256) NOT NULL COMMENT '文本内容',
  `flash` varchar(128) NOT NULL COMMENT 'FLASH',
  `group` tinyint(1) unsigned NOT NULL COMMENT '小组',
  `seat` tinyint(1) unsigned NOT NULL COMMENT '位置',
  `target` varchar(16) NOT NULL DEFAULT '_blank' COMMENT '打开方式（_self原窗口，_blank新窗口）',
  `background` varchar(56) NOT NULL COMMENT '背景颜色',
  `good_id` int(11) NOT NULL COMMENT '盖象APP广告绑定商品',
  PRIMARY KEY (`id`),
  KEY `advert_id` (`advert_id`) USING BTREE,
  CONSTRAINT `gw_advert_picture_ibfk_1` FOREIGN KEY (`advert_id`) REFERENCES `gw_advert` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1723 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for gw_agent_maintenance
-- ----------------------------
DROP TABLE IF EXISTS `gw_agent_maintenance`;
CREATE TABLE `gw_agent_maintenance` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` mediumint(8) NOT NULL COMMENT '用户名',
  `password` varchar(32) NOT NULL COMMENT '密码',
  `parent_member_id` int(11) unsigned NOT NULL COMMENT '代理商member_id',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `gt_user_id` int(8) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `memberID` (`member_id`) USING BTREE,
  KEY `gtUserID` (`gt_user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for gw_api_debug
-- ----------------------------
DROP TABLE IF EXISTS `gw_api_debug`;
CREATE TABLE `gw_api_debug` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `api_category` tinyint(1) unsigned DEFAULT '0' COMMENT '1盖网通,2盖付通',
  `action` varchar(255) DEFAULT NULL,
  `node` varchar(255) DEFAULT NULL,
  `params` text,
  `debug` text,
  `request_time` int(11) unsigned DEFAULT NULL,
  `request_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `api_category` (`api_category`,`action`,`node`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='api调试记录';

-- ----------------------------
-- Table structure for gw_app
-- ----------------------------
DROP TABLE IF EXISTS `gw_app`;
CREATE TABLE `gw_app` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '类型 1软件，2游戏',
  `system` tinyint(1) unsigned DEFAULT '0' COMMENT '系统类型:1安卓,2苹果',
  `system_type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '系统类型:1安卓,2苹果',
  `app_type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT 'APP类型 1盖付通，2掌柜',
  `name` varchar(128) NOT NULL COMMENT '名称',
  `url` varchar(128) NOT NULL COMMENT '链接',
  `img_url` varchar(128) NOT NULL COMMENT '图片链接',
  `ios_img_url` varchar(128) DEFAULT NULL COMMENT 'IOS选择后台上传安装包时所需图片',
  `size` decimal(10,2) NOT NULL COMMENT '大小',
  `version` varchar(128) NOT NULL COMMENT '版本号',
  `version_name` varchar(128) NOT NULL COMMENT '版本名称',
  `package_name` varchar(128) NOT NULL COMMENT '包名',
  `web_log` text NOT NULL COMMENT 'WEB更新日志',
  `mobile_log` text NOT NULL COMMENT '移动端更新日志',
  `remark` text NOT NULL COMMENT '备注',
  `is_visible` tinyint(1) unsigned NOT NULL COMMENT '显示（0否，1是）',
  `is_published` tinyint(1) unsigned NOT NULL COMMENT '发布（0否，1是）',
  `user_id` int(11) unsigned NOT NULL COMMENT '发布者',
  `create_time` int(11) unsigned NOT NULL COMMENT '发布时间',
  `update_time` int(11) unsigned NOT NULL COMMENT '更新时间',
  `ip` int(11) unsigned NOT NULL COMMENT '发布者IP',
  `apk_name` varchar(128) NOT NULL COMMENT 'APK文件名',
  `is_auto_download` tinyint(1) unsigned NOT NULL COMMENT '自动下载（0否，1是）',
  PRIMARY KEY (`id`),
  KEY `system` (`system`) USING BTREE,
  KEY `is_published` (`is_published`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_app_advert
-- ----------------------------
DROP TABLE IF EXISTS `gw_app_advert`;
CREATE TABLE `gw_app_advert` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(128) NOT NULL COMMENT '名称',
  `code` varchar(128) NOT NULL COMMENT '编码',
  `content` text NOT NULL COMMENT '内容',
  `type` tinyint(1) unsigned NOT NULL COMMENT '类型（1单个图片，2幻灯片，3文字）',
  `status` tinyint(1) unsigned NOT NULL COMMENT '状态（0禁用，1启用）',
  `width` smallint(5) unsigned NOT NULL COMMENT '图片宽度',
  `height` smallint(5) unsigned NOT NULL COMMENT '图片高度',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_app_advert_picture
-- ----------------------------
DROP TABLE IF EXISTS `gw_app_advert_picture`;
CREATE TABLE `gw_app_advert_picture` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(128) NOT NULL COMMENT '名称',
  `advert_id` int(11) unsigned NOT NULL COMMENT '所属广告',
  `start_time` int(11) unsigned NOT NULL COMMENT '开始时间',
  `end_time` int(11) unsigned NOT NULL COMMENT '结束时间',
  `sort` tinyint(3) unsigned NOT NULL COMMENT '排序',
  `status` tinyint(1) unsigned NOT NULL COMMENT '状态（0草稿，1发布，2回收站）',
  `target_type` tinyint(1) unsigned NOT NULL COMMENT '目标类型（1网址，2商品，3商品分类）',
  `target` varchar(128) NOT NULL COMMENT '目标（网址或商品ID或分类ID）',
  `group` tinyint(3) unsigned NOT NULL COMMENT '小组',
  `seat` tinyint(3) unsigned NOT NULL COMMENT '位置',
  `text` text NOT NULL COMMENT '文字内容',
  `picture` varchar(128) NOT NULL COMMENT '图片',
  PRIMARY KEY (`id`),
  KEY `advert_id` (`advert_id`) USING BTREE,
  CONSTRAINT `fk_app_advert_picture_app_advert` FOREIGN KEY (`advert_id`) REFERENCES `gw_app_advert` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_app_brands
-- ----------------------------
DROP TABLE IF EXISTS `gw_app_brands`;
CREATE TABLE `gw_app_brands` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL COMMENT '标题',
  `img` varchar(128) DEFAULT NULL COMMENT '图片',
  `description` varchar(255) NOT NULL COMMENT '描述',
  `sort` tinyint(4) unsigned DEFAULT '0',
  `status` tinyint(1) unsigned DEFAULT '0',
  `admin` int(11) NOT NULL COMMENT '创建人',
  `create_time` int(11) unsigned DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) unsigned DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='品牌馆';

-- ----------------------------
-- Table structure for gw_app_brands_goods
-- ----------------------------
DROP TABLE IF EXISTS `gw_app_brands_goods`;
CREATE TABLE `gw_app_brands_goods` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `brands_id` int(11) NOT NULL COMMENT '品牌馆id',
  `goods_id` int(11) NOT NULL COMMENT '商品id',
  `sequence` int(11) NOT NULL COMMENT '排序',
  `type` tinyint(1) NOT NULL COMMENT '商品类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COMMENT='品牌馆商品表';

-- ----------------------------
-- Table structure for gw_app_consum_record
-- ----------------------------
DROP TABLE IF EXISTS `gw_app_consum_record`;
CREATE TABLE `gw_app_consum_record` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `app_type` tinyint(2) unsigned NOT NULL COMMENT 'APP类型',
  `system_type` tinyint(2) unsigned DEFAULT NULL COMMENT '系统类型',
  `member_id` int(11) unsigned NOT NULL COMMENT '会员',
  `order_id` int(11) unsigned DEFAULT NULL COMMENT '订单主键',
  `order_num` varchar(256) NOT NULL COMMENT '订单号',
  `order_type` tinyint(2) unsigned NOT NULL COMMENT '订单类型',
  `amount` float(11,2) unsigned NOT NULL COMMENT '消费金额',
  `create_time` int(11) unsigned NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for gw_app_envelope
-- ----------------------------
DROP TABLE IF EXISTS `gw_app_envelope`;
CREATE TABLE `gw_app_envelope` (
  `id` bigint(18) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `red_envelope_id` varchar(100) NOT NULL COMMENT '安卓端红包标识ID',
  `gai_number` varchar(30) NOT NULL COMMENT '盖网号',
  `credit_amount` decimal(18,2) NOT NULL COMMENT '贷方发生额',
  `debit_amount` decimal(18,2) NOT NULL COMMENT '借方发生额',
  `envelope_type` tinyint(1) NOT NULL COMMENT '红包类型。1为单一红包；2为拼手气抢红包',
  `createtime` int(11) NOT NULL COMMENT '创建时间',
  `code` varchar(32) NOT NULL COMMENT '订单编号',
  `envelope_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0：未领取和未退回；1：已经被领完；2：已经被退回',
  PRIMARY KEY (`id`),
  KEY `red_envelope_id` (`red_envelope_id`)
) ENGINE=InnoDB AUTO_INCREMENT=207 DEFAULT CHARSET=utf8 COMMENT='此表是盖讯通APP红包关系表，并非是商城购物红包。用于查询红包金额平衡借贷关系';

-- ----------------------------
-- Table structure for gw_app_home_picture
-- ----------------------------
DROP TABLE IF EXISTS `gw_app_home_picture`;
CREATE TABLE `gw_app_home_picture` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL COMMENT '标题',
  `image` varchar(128) DEFAULT NULL COMMENT '主题图片',
  `start_time` int(11) NOT NULL COMMENT '开始时间',
  `end_time` int(11) NOT NULL COMMENT '结束时间',
  `admin` int(11) NOT NULL COMMENT '管理员',
  `version` int(11) DEFAULT '1' COMMENT '链接',
  `update_time` int(11) unsigned NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1119 DEFAULT CHARSET=utf8 COMMENT='优选App欢迎页';

-- ----------------------------
-- Table structure for gw_app_hot_category
-- ----------------------------
DROP TABLE IF EXISTS `gw_app_hot_category`;
CREATE TABLE `gw_app_hot_category` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` mediumint(8) unsigned NOT NULL COMMENT '分类id',
  `order` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `type` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '类型',
  `is_publish` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '是否发布1：发布 0：未发布',
  `create_time` int(10) unsigned DEFAULT NULL COMMENT '创建时间',
  `update_time` int(10) unsigned DEFAULT NULL COMMENT '修改时间',
  `picture` varchar(128) NOT NULL COMMENT '图片',
  `explain` varchar(255) DEFAULT NULL COMMENT '分类说明',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for gw_app_hot_goods
-- ----------------------------
DROP TABLE IF EXISTS `gw_app_hot_goods`;
CREATE TABLE `gw_app_hot_goods` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `goods_id` int(11) unsigned NOT NULL COMMENT '商品id',
  `order` int(11) unsigned NOT NULL COMMENT '排序',
  `type` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '类型',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='app热销推荐商品';

-- ----------------------------
-- Table structure for gw_app_installed_machine_info
-- ----------------------------
DROP TABLE IF EXISTS `gw_app_installed_machine_info`;
CREATE TABLE `gw_app_installed_machine_info` (
  `imsi` varchar(128) NOT NULL,
  `install_time` int(11) unsigned DEFAULT NULL COMMENT '安装时间',
  `system_version` varchar(50) DEFAULT NULL COMMENT '系统版本',
  `width` varchar(6) DEFAULT NULL,
  `info` text,
  PRIMARY KEY (`imsi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='安装了盖象APP的设备信息';

-- ----------------------------
-- Table structure for gw_app_pay_manage
-- ----------------------------
DROP TABLE IF EXISTS `gw_app_pay_manage`;
CREATE TABLE `gw_app_pay_manage` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `type` tinyint(1) NOT NULL COMMENT '支付类型 1积分 2积分+现金 3现金',
  `status` tinyint(1) NOT NULL COMMENT '状态 0关闭 1开启',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='优选支付渠道配置表';

-- ----------------------------
-- Table structure for gw_app_service
-- ----------------------------
DROP TABLE IF EXISTS `gw_app_service`;
CREATE TABLE `gw_app_service` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `content` text COMMENT '内容',
  `type` tinyint(2) unsigned NOT NULL COMMENT '内容类型,1订单问题,2支付问题,3消费积分',
  `create_time` int(11) unsigned NOT NULL COMMENT '创建时间',
  `update_time` int(11) unsigned DEFAULT NULL COMMENT '编辑时间',
  `create_user` int(11) unsigned NOT NULL COMMENT '创建者',
  `update_user` int(11) unsigned DEFAULT NULL COMMENT '修改者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='优选售后咨询';

-- ----------------------------
-- Table structure for gw_app_sub_pay_manage
-- ----------------------------
DROP TABLE IF EXISTS `gw_app_sub_pay_manage`;
CREATE TABLE `gw_app_sub_pay_manage` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(30) NOT NULL COMMENT '支付名称',
  `img` varchar(255) DEFAULT NULL COMMENT '图片',
  `sort` int(11) NOT NULL COMMENT '排序',
  `type` tinyint(4) NOT NULL COMMENT '支付渠道',
  `prompt` varchar(255) DEFAULT NULL COMMENT '提示语',
  `status_jfandcash` tinyint(1) NOT NULL DEFAULT '0' COMMENT '积分+现金支付状态 0关闭 1开启',
  `status_cash` tinyint(1) NOT NULL DEFAULT '0' COMMENT '现金支付状态 0关闭 1开启',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='优选现金支付配置表';

-- ----------------------------
-- Table structure for gw_app_topic
-- ----------------------------
DROP TABLE IF EXISTS `gw_app_topic`;
CREATE TABLE `gw_app_topic` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL COMMENT '标题',
  `min_title` varchar(20) DEFAULT NULL COMMENT '商务小礼标题',
  `main_img` varchar(255) NOT NULL,
  `detail_content` text NOT NULL,
  `sort` tinyint(4) unsigned DEFAULT '0',
  `status` tinyint(1) unsigned DEFAULT '0',
  `category` tinyint(2) unsigned DEFAULT '0' COMMENT '分类,1臻致生活,2商务小礼,3盖鲜汇',
  `create_time` int(11) unsigned DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) unsigned DEFAULT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`id`),
  KEY `category` (`category`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8 COMMENT='盖象商城app专题';

-- ----------------------------
-- Table structure for gw_app_topic_car
-- ----------------------------
DROP TABLE IF EXISTS `gw_app_topic_car`;
CREATE TABLE `gw_app_topic_car` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL COMMENT '标题',
  `subtitle` varchar(100) DEFAULT NULL COMMENT '副标题',
  `image` varchar(255) DEFAULT NULL COMMENT '主图',
  `subimage` varchar(255) DEFAULT NULL COMMENT '子图',
  `content` text COMMENT '内容',
  `subcontent` text COMMENT '附加内容',
  `link` varchar(128) DEFAULT NULL COMMENT '链接',
  `author` varchar(50) DEFAULT NULL COMMENT '作者',
  `photographer` varchar(50) DEFAULT NULL COMMENT '摄影者',
  `create_time` int(11) unsigned NOT NULL COMMENT '创建时间',
  `online_time` int(11) unsigned DEFAULT '0' COMMENT '上线时间',
  `comment_counts` int(5) unsigned DEFAULT '0' COMMENT '评论数',
  `status` tinyint(2) unsigned DEFAULT '0' COMMENT '状态,0新建,1已发布,2禁用',
  `admin_create` int(11) unsigned NOT NULL COMMENT '创建人',
  `admin_update` int(11) unsigned DEFAULT NULL COMMENT '最后编辑人',
  `update_time` int(11) unsigned DEFAULT NULL COMMENT '编辑时间',
  `topic_goods_name` varchar(4) NOT NULL COMMENT '专题商品查看名称',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='优选新动汽车专题';

-- ----------------------------
-- Table structure for gw_app_topic_car_comment
-- ----------------------------
DROP TABLE IF EXISTS `gw_app_topic_car_comment`;
CREATE TABLE `gw_app_topic_car_comment` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `topic_id` int(11) unsigned DEFAULT NULL COMMENT '专题id',
  `parent_id` int(11) unsigned DEFAULT NULL COMMENT '上级id(评论其他评论)',
  `member_id` int(11) unsigned NOT NULL COMMENT '会员id',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `content` text NOT NULL COMMENT '内容',
  `likes` int(4) unsigned DEFAULT '0' COMMENT '点赞',
  `status` tinyint(1) unsigned DEFAULT '0' COMMENT '状态,0未审核,1已审核,2已屏蔽',
  `create_time` int(11) unsigned NOT NULL COMMENT '评论时间',
  `passed_time` int(11) unsigned DEFAULT NULL COMMENT '审核时间',
  `admin_id` int(11) unsigned DEFAULT NULL COMMENT '管理人',
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `topic_id` (`topic_id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=227 DEFAULT CHARSET=utf8 COMMENT='优选app新动,评论';

-- ----------------------------
-- Table structure for gw_app_topic_car_comment_like
-- ----------------------------
DROP TABLE IF EXISTS `gw_app_topic_car_comment_like`;
CREATE TABLE `gw_app_topic_car_comment_like` (
  `comment_id` int(11) unsigned NOT NULL,
  `member_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`comment_id`,`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优选app评论点赞';

-- ----------------------------
-- Table structure for gw_app_topic_goods_details
-- ----------------------------
DROP TABLE IF EXISTS `gw_app_topic_goods_details`;
CREATE TABLE `gw_app_topic_goods_details` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `goods_id` int(11) NOT NULL COMMENT '商品id',
  `dateils` text COLLATE utf8_esperanto_ci NOT NULL COMMENT '商品详情',
  `label` varchar(200) COLLATE utf8_esperanto_ci NOT NULL COMMENT '商品标签（多个以|隔开）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4849 DEFAULT CHARSET=utf8 COLLATE=utf8_esperanto_ci;

-- ----------------------------
-- Table structure for gw_app_topic_house
-- ----------------------------
DROP TABLE IF EXISTS `gw_app_topic_house`;
CREATE TABLE `gw_app_topic_house` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `title` varchar(128) NOT NULL COMMENT '馆名称',
  `commodity_num` int(11) NOT NULL DEFAULT '0' COMMENT '商品数量',
  `description` varchar(128) NOT NULL COMMENT '馆描述',
  `comHeadUrl` varchar(200) NOT NULL COMMENT '馆头像',
  `pictureUrl` varchar(200) NOT NULL COMMENT '馆内专题图',
  `remark` varchar(200) NOT NULL COMMENT '馆备注',
  `link` varchar(200) DEFAULT NULL COMMENT '仕品分享连接',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='佳品馆表';

-- ----------------------------
-- Table structure for gw_app_topic_house_goods
-- ----------------------------
DROP TABLE IF EXISTS `gw_app_topic_house_goods`;
CREATE TABLE `gw_app_topic_house_goods` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `house_id` int(11) NOT NULL COMMENT '馆id',
  `goods_id` int(11) NOT NULL COMMENT '商品id',
  `sequence` int(11) NOT NULL COMMENT '排序',
  `details` text COMMENT '商品信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=139 DEFAULT CHARSET=utf8 COMMENT='馆商品表';

-- ----------------------------
-- Table structure for gw_app_topic_house_picture
-- ----------------------------
DROP TABLE IF EXISTS `gw_app_topic_house_picture`;
CREATE TABLE `gw_app_topic_house_picture` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `titlePicture` varchar(200) DEFAULT NULL COMMENT '标题图片',
  `link` varchar(200) DEFAULT NULL COMMENT '仕品分享连接',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for gw_app_topic_life
-- ----------------------------
DROP TABLE IF EXISTS `gw_app_topic_life`;
CREATE TABLE `gw_app_topic_life` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `title` varchar(128) NOT NULL COMMENT '标题',
  `rele_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '发布状态(0 未发布 1 已发布)',
  `audit_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '审核状态(0 不通过  1 通过 2 审核中)',
  `sequence` tinyint(2) NOT NULL DEFAULT '0' COMMENT '排序',
  `comHeadUrl` varchar(255) NOT NULL COMMENT '头像图片',
  `profess_proof` text NOT NULL COMMENT '专业证明',
  `author` varchar(200) NOT NULL COMMENT '作者',
  `topic_img` varchar(255) NOT NULL COMMENT '专题图片',
  `goods_list` text NOT NULL COMMENT '商品列表',
  `error_field` text NOT NULL COMMENT '不通过原因',
  `create_time` int(10) NOT NULL COMMENT '创建时间',
  `rele_time` int(10) NOT NULL COMMENT '发布时间',
  `online_time` int(10) NOT NULL COMMENT '上线时间',
  `disable` tinyint(1) NOT NULL COMMENT '使用状态(0 停用，1 启用)',
  `admin_id` int(11) NOT NULL COMMENT '代理商ID',
  `browse_num` int(11) unsigned DEFAULT '0' COMMENT '流览量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='臻致生活--专题表';

-- ----------------------------
-- Table structure for gw_app_topic_problem
-- ----------------------------
DROP TABLE IF EXISTS `gw_app_topic_problem`;
CREATE TABLE `gw_app_topic_problem` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) unsigned DEFAULT NULL COMMENT '上级评论id',
  `life_topic_id` int(11) unsigned DEFAULT NULL COMMENT '专题id',
  `member_id` int(11) unsigned NOT NULL COMMENT '会员id',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `type` tinyint(1) NOT NULL COMMENT '1 话题 2回复 3 评论',
  `status` tinyint(1) unsigned DEFAULT '0' COMMENT '状态,0未回复 1回复',
  `create_time` int(11) unsigned NOT NULL COMMENT '评论时间',
  `passed_time` int(11) unsigned DEFAULT NULL COMMENT '审核时间',
  `admin_id` int(11) unsigned DEFAULT NULL COMMENT '管理人',
  `problem` text NOT NULL COMMENT '话题',
  `likes` int(11) unsigned DEFAULT NULL COMMENT '点赞',
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `topic_id` (`life_topic_id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8 COMMENT='臻致生活--话题表';

-- ----------------------------
-- Table structure for gw_app_topic_problem_like
-- ----------------------------
DROP TABLE IF EXISTS `gw_app_topic_problem_like`;
CREATE TABLE `gw_app_topic_problem_like` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `problem_id` int(11) NOT NULL COMMENT '话题ID',
  `member_id` int(11) NOT NULL COMMENT '用户ID',
  `creat_time` int(11) NOT NULL COMMENT '点赞时间',
  PRIMARY KEY (`id`),
  KEY `problem_id` (`problem_id`) USING BTREE,
  KEY `member_id` (`member_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8 COMMENT='话题点赞表';

-- ----------------------------
-- Table structure for gw_app_topic_treasure
-- ----------------------------
DROP TABLE IF EXISTS `gw_app_topic_treasure`;
CREATE TABLE `gw_app_topic_treasure` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL COMMENT '标题',
  `subtitle` varchar(100) DEFAULT NULL COMMENT '副标题',
  `image` varchar(255) DEFAULT NULL COMMENT '主图',
  `subimage` varchar(255) DEFAULT NULL COMMENT '子图',
  `content` text COMMENT '内容',
  `subcontent` text COMMENT '附加内容',
  `create_time` int(11) unsigned NOT NULL COMMENT '创建时间',
  `online_time` int(11) unsigned DEFAULT '0' COMMENT '上线时间',
  `status` tinyint(2) unsigned DEFAULT '0' COMMENT '状态,0新建,1已发布,2禁用',
  `admin_create` int(11) unsigned NOT NULL COMMENT '创建人',
  `admin_update` int(11) unsigned DEFAULT NULL COMMENT '最后编辑人',
  `update_time` int(11) unsigned DEFAULT NULL COMMENT '编辑时间',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优选仕品专题';

-- ----------------------------
-- Table structure for gw_app_trading_log
-- ----------------------------
DROP TABLE IF EXISTS `gw_app_trading_log`;
CREATE TABLE `gw_app_trading_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '操作类型。1为绑定银行卡、2绑卡支付、3获取验证码',
  `send_req_msg_id` varchar(18) NOT NULL COMMENT '第三方平台返回的流水号',
  `gai_number` varchar(32) NOT NULL COMMENT '盖网号',
  `result` text NOT NULL COMMENT '返回结果',
  `pay_type` int(3) NOT NULL COMMENT '支付平台类别。1为高汇通',
  `code` varchar(64) NOT NULL COMMENT '流水号',
  `respcode` varchar(6) NOT NULL COMMENT '第三方答应码',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `gai_number` (`gai_number`) USING BTREE,
  KEY `pay_type` (`pay_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=536 DEFAULT CHARSET=utf8 COMMENT='API端第三方支付、绑卡接口记录表';

-- ----------------------------
-- Table structure for gw_article
-- ----------------------------
DROP TABLE IF EXISTS `gw_article`;
CREATE TABLE `gw_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL COMMENT '文章标题',
  `alias` varchar(56) NOT NULL COMMENT '英文别名(url美化用)',
  `summary` varchar(256) NOT NULL COMMENT '摘要',
  `author_id` tinyint(3) NOT NULL COMMENT '作者 id',
  `category_id` tinyint(3) NOT NULL COMMENT '分类id',
  `thumbnail` varchar(128) NOT NULL COMMENT '缩略图',
  `content` text NOT NULL COMMENT '内容',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `update_time` int(11) NOT NULL COMMENT '更新时间',
  `sort` tinyint(3) NOT NULL DEFAULT '0' COMMENT '排序',
  `keywords` varchar(128) NOT NULL COMMENT '关键词',
  `description` varchar(256) NOT NULL COMMENT 'SEO描述',
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`) USING BTREE,
  CONSTRAINT `fk_article_article_category` FOREIGN KEY (`category_id`) REFERENCES `gw_article_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_article_category
-- ----------------------------
DROP TABLE IF EXISTS `gw_article_category`;
CREATE TABLE `gw_article_category` (
  `id` tinyint(3) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL COMMENT '文章分类名称',
  `parent_id` tinyint(3) NOT NULL COMMENT '父类id',
  `sort` tinyint(3) NOT NULL DEFAULT '0' COMMENT '排序',
  `keywords` varchar(128) NOT NULL COMMENT '关键字',
  `description` varchar(256) NOT NULL COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_assistant
-- ----------------------------
DROP TABLE IF EXISTS `gw_assistant`;
CREATE TABLE `gw_assistant` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(128) NOT NULL COMMENT '用户名',
  `password` varchar(128) NOT NULL COMMENT '密码',
  `salt` varchar(128) NOT NULL COMMENT '密钥',
  `member_id` int(11) unsigned NOT NULL COMMENT '所属会员',
  `real_name` varchar(128) NOT NULL COMMENT '真实姓名',
  `avatar` varchar(128) NOT NULL COMMENT '头像',
  `sex` tinyint(1) unsigned NOT NULL COMMENT '性别',
  `mobile` varchar(16) NOT NULL COMMENT '手机号码',
  `email` varchar(128) NOT NULL COMMENT '邮箱',
  `status` tinyint(1) unsigned NOT NULL COMMENT '状态',
  `logins` int(11) unsigned NOT NULL COMMENT '登录次数',
  `description` text NOT NULL COMMENT '说明',
  `sort` tinyint(3) unsigned NOT NULL COMMENT '排序',
  `create_time` int(11) unsigned NOT NULL COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `member_id` (`member_id`) USING BTREE,
  CONSTRAINT `fk_assistant_member` FOREIGN KEY (`member_id`) REFERENCES `gw_member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1715 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_assistant_permission
-- ----------------------------
DROP TABLE IF EXISTS `gw_assistant_permission`;
CREATE TABLE `gw_assistant_permission` (
  `item` varchar(128) NOT NULL COMMENT '操作项',
  `assistant_id` int(11) unsigned NOT NULL COMMENT '所属助手',
  `franchisee_id` int(11) unsigned NOT NULL COMMENT '所属加盟商',
  KEY `assistant_id` (`assistant_id`) USING BTREE,
  KEY `franchisee_id` (`franchisee_id`) USING BTREE,
  KEY `item` (`item`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_attribute
-- ----------------------------
DROP TABLE IF EXISTS `gw_attribute`;
CREATE TABLE `gw_attribute` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(128) NOT NULL COMMENT '名称',
  `show` tinyint(1) NOT NULL DEFAULT '1' COMMENT '显示（0否，1是）',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `type_id` int(11) unsigned NOT NULL COMMENT '所属类型',
  PRIMARY KEY (`id`),
  KEY `type_id` (`type_id`) USING BTREE,
  CONSTRAINT `fk_attribute_type` FOREIGN KEY (`type_id`) REFERENCES `gw_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_attribute_index
-- ----------------------------
DROP TABLE IF EXISTS `gw_attribute_index`;
CREATE TABLE `gw_attribute_index` (
  `goods_id` int(11) unsigned NOT NULL COMMENT '所属商品',
  `category_id` int(11) unsigned NOT NULL COMMENT '所属分类',
  `type_id` int(11) unsigned NOT NULL COMMENT '所属类型',
  `attribute_id` int(11) unsigned NOT NULL COMMENT '所属属性',
  `attribute_value_id` int(11) unsigned NOT NULL COMMENT '所属属性值',
  KEY `goods_id` (`goods_id`) USING BTREE,
  KEY `category_id` (`category_id`) USING BTREE,
  KEY `type_id` (`type_id`) USING BTREE,
  KEY `attribute_id` (`attribute_id`) USING BTREE,
  KEY `attribute_value_id` (`attribute_value_id`) USING BTREE,
  CONSTRAINT `fk_attribute_index_attribute` FOREIGN KEY (`attribute_id`) REFERENCES `gw_attribute` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_attribute_index_attribute_value` FOREIGN KEY (`attribute_value_id`) REFERENCES `gw_attribute_value` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_attribute_index_category` FOREIGN KEY (`category_id`) REFERENCES `gw_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_attribute_index_goods` FOREIGN KEY (`goods_id`) REFERENCES `gw_goods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_attribute_index_type` FOREIGN KEY (`type_id`) REFERENCES `gw_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_attribute_value
-- ----------------------------
DROP TABLE IF EXISTS `gw_attribute_value`;
CREATE TABLE `gw_attribute_value` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(128) NOT NULL COMMENT '名称',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `attribute_id` int(11) unsigned NOT NULL COMMENT '所属属性',
  PRIMARY KEY (`id`),
  KEY `attribute_id` (`attribute_id`) USING BTREE,
  CONSTRAINT `fk_attribute_value_attribute` FOREIGN KEY (`attribute_id`) REFERENCES `gw_attribute` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_auditing
-- ----------------------------
DROP TABLE IF EXISTS `gw_auditing`;
CREATE TABLE `gw_auditing` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `status` tinyint(1) unsigned NOT NULL COMMENT '申请的状态',
  `apply_type` tinyint(1) unsigned NOT NULL COMMENT '申请人会员类型',
  `apply_id` int(11) unsigned NOT NULL COMMENT '申请人会员id',
  `apply_name` varchar(255) NOT NULL COMMENT '加盟商名称',
  `apply_content` text NOT NULL COMMENT '加盟商信息，存json格式',
  `author_type` tinyint(1) unsigned NOT NULL COMMENT '添加加盟商申请的人类型',
  `author_id` int(11) unsigned NOT NULL COMMENT '添加加盟商申请的人id',
  `author_name` varchar(50) NOT NULL COMMENT '添加加盟商申请的人名称',
  `create_time` int(10) unsigned NOT NULL COMMENT '创建时间',
  `submit_time` int(10) unsigned NOT NULL COMMENT '提交时间，相当于update_time',
  `auditor_type` tinyint(1) unsigned NOT NULL COMMENT '审核人的类型',
  `auditor_id` int(11) unsigned NOT NULL COMMENT '审核人的id',
  `auditor_name` varchar(50) NOT NULL COMMENT '审核人的名称',
  `audit_opinion` varchar(500) NOT NULL COMMENT '审核人的意见',
  `audit_time` int(10) unsigned NOT NULL COMMENT '审核时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_auth_assignment
-- ----------------------------
DROP TABLE IF EXISTS `gw_auth_assignment`;
CREATE TABLE `gw_auth_assignment` (
  `itemname` varchar(64) NOT NULL,
  `userid` varchar(64) NOT NULL,
  `bizrule` text,
  `data` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_auth_item
-- ----------------------------
DROP TABLE IF EXISTS `gw_auth_item`;
CREATE TABLE `gw_auth_item` (
  `name` varchar(64) NOT NULL,
  `type` int(11) unsigned NOT NULL,
  `description` text,
  `bizrule` text,
  `data` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_auth_item_child
-- ----------------------------
DROP TABLE IF EXISTS `gw_auth_item_child`;
CREATE TABLE `gw_auth_item_child` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_bank
-- ----------------------------
DROP TABLE IF EXISTS `gw_bank`;
CREATE TABLE `gw_bank` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL COMMENT '银行名称',
  `code` varchar(20) NOT NULL COMMENT '银行简码',
  `type` tinyint(3) unsigned NOT NULL COMMENT '支付平台类型（1银联2翼支付3联动4通联5高汇通6银盈通）',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(3) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=utf8 COMMENT='网银银行编码表';

-- ----------------------------
-- Table structure for gw_bank_account
-- ----------------------------
DROP TABLE IF EXISTS `gw_bank_account`;
CREATE TABLE `gw_bank_account` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `member_id` int(11) unsigned NOT NULL COMMENT '所属会员',
  `account_name` varchar(128) NOT NULL COMMENT '账户名',
  `province_id` int(11) unsigned NOT NULL COMMENT '省份',
  `city_id` int(11) unsigned NOT NULL COMMENT '城市',
  `district_id` int(11) unsigned NOT NULL COMMENT '区/县',
  `street` varchar(128) NOT NULL COMMENT '详细地址',
  `bank_name` varchar(128) NOT NULL COMMENT '开户银行',
  `bank_code` varchar(64) NOT NULL COMMENT '银行编码',
  `account` varchar(128) NOT NULL COMMENT '账号',
  `licence_image` varchar(128) NOT NULL COMMENT '开户银行许可证电子版',
  `sister_bank_number` varchar(128) NOT NULL COMMENT '支行联行号',
  PRIMARY KEY (`id`),
  KEY `member_id` (`member_id`) USING BTREE,
  CONSTRAINT `fk_bank_account_member` FOREIGN KEY (`member_id`) REFERENCES `gw_member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9042 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_bed
-- ----------------------------
DROP TABLE IF EXISTS `gw_bed`;
CREATE TABLE `gw_bed` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(128) NOT NULL COMMENT '名称',
  `sort` tinyint(3) unsigned NOT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_bit_update_log
-- ----------------------------
DROP TABLE IF EXISTS `gw_bit_update_log`;
CREATE TABLE `gw_bit_update_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL COMMENT '更新内容',
  `code` text NOT NULL COMMENT '更新代码路径',
  `dev` varchar(30) NOT NULL COMMENT '开发者',
  `test` varchar(30) NOT NULL COMMENT '测试人',
  `created` int(10) unsigned NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for gw_brand
-- ----------------------------
DROP TABLE IF EXISTS `gw_brand`;
CREATE TABLE `gw_brand` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(128) NOT NULL COMMENT '名称',
  `logo` varchar(128) NOT NULL COMMENT '品牌LOGO',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态（0禁用，1启用）',
  `code` varchar(32) NOT NULL COMMENT '简码',
  `category_id` int(11) unsigned NOT NULL COMMENT '所属分类',
  `content` varchar(512) NOT NULL COMMENT '品牌说明',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `store_id` int(11) unsigned NOT NULL COMMENT '所属店铺',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2037 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for gw_business
-- ----------------------------
DROP TABLE IF EXISTS `gw_business`;
CREATE TABLE `gw_business` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cont` varchar(1000) NOT NULL COMMENT '内容',
  `company` varchar(30) NOT NULL COMMENT '总公司',
  `create_time` int(10) unsigned NOT NULL,
  `update_time` int(10) unsigned NOT NULL,
  `gai_number` varchar(20) NOT NULL COMMENT '盖网编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_cart
-- ----------------------------
DROP TABLE IF EXISTS `gw_cart`;
CREATE TABLE `gw_cart` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `member_id` int(11) unsigned NOT NULL COMMENT '会员',
  `store_id` int(11) unsigned NOT NULL COMMENT '所属店铺',
  `goods_id` int(11) unsigned NOT NULL COMMENT '商品',
  `spec_id` int(11) unsigned NOT NULL COMMENT '规格',
  `price` decimal(11,2) NOT NULL COMMENT '价钱',
  `quantity` int(11) unsigned NOT NULL COMMENT '数量',
  `create_time` int(11) unsigned NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `member_id` (`member_id`) USING BTREE,
  KEY `company_id` (`store_id`) USING BTREE,
  KEY `goods_id` (`goods_id`) USING BTREE,
  KEY `spec_id` (`spec_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=242278 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_cash_history
-- ----------------------------
DROP TABLE IF EXISTS `gw_cash_history`;
CREATE TABLE `gw_cash_history` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `code` varchar(64) NOT NULL COMMENT '订单编号',
  `applyer` varchar(128) NOT NULL COMMENT '申请人',
  `account_name` varchar(128) NOT NULL COMMENT '账户名',
  `bank_name` varchar(128) NOT NULL COMMENT '银行名称',
  `bank_address` varchar(128) NOT NULL COMMENT '银行地址',
  `account` varchar(128) NOT NULL COMMENT '银行帐号',
  `score` decimal(10,2) NOT NULL COMMENT '积分',
  `ratio` decimal(10,2) NOT NULL COMMENT '比率',
  `money` decimal(10,2) NOT NULL COMMENT '金额',
  `apply_time` int(11) unsigned NOT NULL COMMENT '申请时间',
  `ip` int(11) unsigned NOT NULL COMMENT 'IP',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态（0申请中、1已审核、2转账中、3已转账，4转账失败）',
  `reason` text NOT NULL COMMENT '失败原因',
  `type` tinyint(1) unsigned NOT NULL COMMENT '类型（1兑现-代理商，2提现-商户，3提现-普通会员）',
  `member_id` int(11) unsigned NOT NULL COMMENT '所属会员',
  `factorage` decimal(10,2) NOT NULL COMMENT '手续费率',
  `symbol` varchar(128) NOT NULL COMMENT 'unknow',
  `base_price` decimal(10,2) NOT NULL COMMENT 'unknow',
  `update_time` int(11) unsigned DEFAULT NULL,
  `is_review` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否已经审阅',
  `is_check` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '审核（0未审核、1已审核）',
  PRIMARY KEY (`id`),
  KEY `member_id` (`member_id`) USING BTREE,
  CONSTRAINT `fk_cash_history_member` FOREIGN KEY (`member_id`) REFERENCES `gw_member` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=37682 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_category
-- ----------------------------
DROP TABLE IF EXISTS `gw_category`;
CREATE TABLE `gw_category` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `parent_id` int(11) unsigned NOT NULL COMMENT '上级分类',
  `name` varchar(128) NOT NULL COMMENT '名称',
  `short_name` varchar(128) NOT NULL COMMENT '简写（app用）',
  `alias` varchar(128) NOT NULL COMMENT '英文别名',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态（0禁用1显示）',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `title` varchar(128) NOT NULL COMMENT 'SEO标题',
  `keywords` varchar(128) NOT NULL COMMENT '关键词',
  `description` varchar(256) NOT NULL COMMENT '描述',
  `type_id` int(11) unsigned NOT NULL,
  `thumbnail` varchar(128) NOT NULL COMMENT '小图',
  `picture` varchar(128) NOT NULL COMMENT '大图',
  `recommend` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '推荐（0否，1是）',
  `tree` text NOT NULL COMMENT '树',
  `depth` int(11) unsigned NOT NULL COMMENT '级',
  `content` text NOT NULL COMMENT '说明',
  `fee` tinyint(2) unsigned NOT NULL COMMENT '手续费',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`) USING BTREE,
  KEY `type_id` (`type_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=953 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for gw_category_staple
-- ----------------------------
DROP TABLE IF EXISTS `gw_category_staple`;
CREATE TABLE `gw_category_staple` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) NOT NULL COMMENT '名称',
  `category_id` int(11) unsigned NOT NULL COMMENT '所属分类',
  `type_id` int(11) unsigned NOT NULL COMMENT '所属类型',
  `store_id` int(11) unsigned NOT NULL COMMENT '所属店铺',
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`) USING BTREE,
  CONSTRAINT `fk_category_staple_store` FOREIGN KEY (`store_id`) REFERENCES `gw_store` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2086 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_charity
-- ----------------------------
DROP TABLE IF EXISTS `gw_charity`;
CREATE TABLE `gw_charity` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `member_id` int(11) unsigned NOT NULL COMMENT '所属会员',
  `sign` varchar(128) NOT NULL COMMENT '签名',
  `qq` varchar(16) NOT NULL COMMENT 'QQ',
  `blessing` varchar(128) NOT NULL COMMENT '祝福语',
  `money` decimal(10,2) unsigned NOT NULL COMMENT '金额',
  `score` decimal(10,2) unsigned NOT NULL COMMENT '积分',
  `create_time` int(11) unsigned NOT NULL COMMENT '捐款时间',
  `pay_type` int(11) unsigned NOT NULL COMMENT '支付类型（1盖网积分，2IPS环迅支付）',
  `ip` int(11) unsigned NOT NULL COMMENT 'IP',
  `area` varchar(128) NOT NULL COMMENT '区域',
  `description` text NOT NULL COMMENT '明细',
  `code` varchar(128) NOT NULL COMMENT '编号',
  `status` tinyint(1) unsigned NOT NULL COMMENT '状态（0未支付，1支付成功，2支付失败）',
  `pay_time` int(11) unsigned NOT NULL COMMENT '支付时间',
  PRIMARY KEY (`id`),
  KEY `member_id` (`member_id`) USING BTREE,
  CONSTRAINT `fk_charity_member` FOREIGN KEY (`member_id`) REFERENCES `gw_member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=263 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_checkcode
-- ----------------------------
DROP TABLE IF EXISTS `gw_checkcode`;
CREATE TABLE `gw_checkcode` (
  `phone` varchar(20) NOT NULL COMMENT '手机号码',
  `checkcode` char(6) NOT NULL COMMENT '验证码',
  `overtime` int(10) unsigned NOT NULL COMMENT '失效时间',
  PRIMARY KEY (`phone`),
  KEY `phone` (`phone`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_cityshow
-- ----------------------------
DROP TABLE IF EXISTS `gw_cityshow`;
CREATE TABLE `gw_cityshow` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(32) NOT NULL COMMENT '标题',
  `subtitle` varchar(255) NOT NULL COMMENT '副标题',
  `encode` varchar(64) NOT NULL COMMENT '页面编码',
  `region` int(11) unsigned NOT NULL COMMENT '所在大区',
  `province` int(11) unsigned NOT NULL COMMENT '所在省份',
  `city` int(11) unsigned NOT NULL COMMENT '所在城市',
  `background_img` varchar(100) NOT NULL COMMENT '背景图片',
  `top_banner` text NOT NULL COMMENT '焦点图(序列化)',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '审核状态',
  `reason` varchar(255) NOT NULL COMMENT '不通过原因',
  `is_show` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '是否删除',
  `sort` tinyint(2) unsigned NOT NULL COMMENT '排序',
  `create_time` int(11) unsigned NOT NULL COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL COMMENT '审核时间',
  `sid` int(10) unsigned NOT NULL COMMENT '管理者店铺id',
  `source_type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '适用平台(1PC端，2盖象优选APP，0不限)',
  PRIMARY KEY (`id`),
  KEY `encode` (`encode`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='城市馆';

-- ----------------------------
-- Table structure for gw_cityshow_goods
-- ----------------------------
DROP TABLE IF EXISTS `gw_cityshow_goods`;
CREATE TABLE `gw_cityshow_goods` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `store_id` int(11) unsigned NOT NULL COMMENT 'gw_cityshow_store 商家id',
  `goods_id` int(11) NOT NULL COMMENT '商品id',
  `theme_id` int(11) NOT NULL COMMENT '主题id',
  `sort` tinyint(2) unsigned NOT NULL COMMENT '排序',
  `create_time` int(11) unsigned NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=176 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='城市馆入驻商家商品';

-- ----------------------------
-- Table structure for gw_cityshow_region
-- ----------------------------
DROP TABLE IF EXISTS `gw_cityshow_region`;
CREATE TABLE `gw_cityshow_region` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL COMMENT '大区名称',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态（1.显示，2.隐藏）',
  `sort` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='城市馆大区';

-- ----------------------------
-- Table structure for gw_cityshow_rights
-- ----------------------------
DROP TABLE IF EXISTS `gw_cityshow_rights`;
CREATE TABLE `gw_cityshow_rights` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(10) unsigned NOT NULL COMMENT '会员id',
  `create_time` int(10) unsigned NOT NULL COMMENT '添加时间',
  `gw` varchar(20) NOT NULL COMMENT 'gw号',
  `store_name` varchar(128) NOT NULL COMMENT '店铺名称',
  PRIMARY KEY (`id`),
  UNIQUE KEY `member_id` (`member_id`) USING HASH
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COMMENT='城市馆权限表';

-- ----------------------------
-- Table structure for gw_cityshow_store
-- ----------------------------
DROP TABLE IF EXISTS `gw_cityshow_store`;
CREATE TABLE `gw_cityshow_store` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cityshow_id` int(11) NOT NULL COMMENT '城市馆id',
  `store_id` int(11) NOT NULL COMMENT '入驻商家id',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  `sort` tinyint(2) unsigned NOT NULL COMMENT '排序',
  `create_time` int(11) unsigned NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='城市馆入驻商家';

-- ----------------------------
-- Table structure for gw_cityshow_theme
-- ----------------------------
DROP TABLE IF EXISTS `gw_cityshow_theme`;
CREATE TABLE `gw_cityshow_theme` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(50) NOT NULL COMMENT '主题名称',
  `cityshow_id` int(10) unsigned NOT NULL COMMENT '城市馆id',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  `sort` tinyint(2) unsigned NOT NULL COMMENT '排序',
  `create_time` int(11) unsigned NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='城市馆入驻主题';

-- ----------------------------
-- Table structure for gw_comment
-- ----------------------------
DROP TABLE IF EXISTS `gw_comment`;
CREATE TABLE `gw_comment` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `order_id` int(11) unsigned NOT NULL COMMENT '所属订单',
  `store_id` int(11) unsigned NOT NULL COMMENT '所属店铺',
  `goods_id` int(11) unsigned NOT NULL COMMENT '所属商品',
  `member_id` int(11) unsigned NOT NULL COMMENT '所属会员',
  `score` decimal(2,1) NOT NULL COMMENT '评分',
  `content` text NOT NULL COMMENT '评价内容',
  `create_time` int(11) unsigned NOT NULL COMMENT '评价时间',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态（0关闭，1显示）',
  `reply_content` text NOT NULL COMMENT '回复内容',
  `reply_time` int(11) unsigned NOT NULL COMMENT '回复时间',
  `spec_value` text NOT NULL COMMENT '规格值',
  `img_path` varchar(255) DEFAULT NULL COMMENT '评论图片',
  `impress_id` tinyint(4) DEFAULT NULL COMMENT '买家印象',
  `is_edit` tinyint(4) DEFAULT '0' COMMENT '是否修改过评价',
  `is_anonymity` tinyint(4) DEFAULT '0' COMMENT '是否匿名',
  `vote` mediumint(8) NOT NULL COMMENT '点赞数',
  PRIMARY KEY (`id`),
  KEY `member_id` (`member_id`) USING BTREE,
  KEY `order_id` (`order_id`) USING BTREE,
  KEY `store_id` (`store_id`) USING BTREE,
  KEY `goods_id` (`goods_id`) USING BTREE,
  KEY `impress_id` (`goods_id`,`impress_id`),
  KEY `vote` (`vote`),
  CONSTRAINT `fk_comment_goods` FOREIGN KEY (`goods_id`) REFERENCES `gw_goods` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_comment_member` FOREIGN KEY (`member_id`) REFERENCES `gw_member` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_comment_order` FOREIGN KEY (`order_id`) REFERENCES `gw_order` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_comment_store` FOREIGN KEY (`store_id`) REFERENCES `gw_store` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=50707 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_comment_vote
-- ----------------------------
DROP TABLE IF EXISTS `gw_comment_vote`;
CREATE TABLE `gw_comment_vote` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键自增',
  `goods_id` int(11) NOT NULL COMMENT '商品表ID',
  `comment_id` int(11) NOT NULL COMMENT '评论表ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `dateline` int(10) NOT NULL COMMENT '点赞的时间',
  PRIMARY KEY (`id`),
  KEY `goods_id` (`goods_id`,`comment_id`,`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='评价点赞表';

-- ----------------------------
-- Table structure for gw_common_account
-- ----------------------------
DROP TABLE IF EXISTS `gw_common_account`;
CREATE TABLE `gw_common_account` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(128) NOT NULL COMMENT '名称',
  `type` tinyint(3) unsigned NOT NULL COMMENT '类型（1线上公共总帐户、2线下公共总帐户、3盖网收益帐户、4线上红包池帐户、4推荐企业、5游戏收益账户、6机动、7代理区域资金池）',
  `city_id` int(11) unsigned NOT NULL COMMENT '地区（省/市/区）',
  `gai_number` varchar(128) NOT NULL COMMENT 'GW号',
  PRIMARY KEY (`id`),
  KEY `city_id` (`city_id`) USING BTREE,
  KEY `type` (`type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=366 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_common_account_agent_dist
-- ----------------------------
DROP TABLE IF EXISTS `gw_common_account_agent_dist`;
CREATE TABLE `gw_common_account_agent_dist` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `common_account_id` int(11) unsigned NOT NULL COMMENT '公共账户id',
  `dist_money` decimal(18,2) NOT NULL COMMENT '分配金额',
  `remainder_money` decimal(18,2) NOT NULL COMMENT '剩余金额',
  `province_id` int(11) unsigned NOT NULL COMMENT '省份',
  `province_member_id` int(11) unsigned NOT NULL COMMENT '省代理的id',
  `province_money` decimal(18,2) NOT NULL COMMENT '省代理分配的金额',
  `province_ratio` tinyint(3) NOT NULL COMMENT '省代理的实际分配比率',
  `city_id` int(11) unsigned NOT NULL COMMENT '市',
  `city_member_id` int(11) unsigned NOT NULL COMMENT '市代理的id',
  `city_money` decimal(18,2) NOT NULL COMMENT '市代理分配的金额',
  `city_ratio` tinyint(3) NOT NULL COMMENT '市代理的实际分配比率',
  `district_id` int(11) unsigned NOT NULL COMMENT '区',
  `district_member_id` int(11) unsigned NOT NULL COMMENT '区代理的id',
  `district_money` decimal(18,2) NOT NULL COMMENT '区代理分配的金额',
  `district_ratio` tinyint(3) NOT NULL COMMENT '区代理的实际分配比率',
  `manage_id` int(11) unsigned NOT NULL COMMENT '大区',
  `manage_member_id` int(11) unsigned NOT NULL COMMENT '大区代理id',
  `manage_money` decimal(18,2) unsigned NOT NULL COMMENT '大区代理的分配金额',
  `manage_ratio` tinyint(3) unsigned NOT NULL COMMENT '大区代理的实际分配比率',
  `target_id` int(11) unsigned NOT NULL COMMENT '来源id',
  `operate_type` tinyint(3) NOT NULL DEFAULT '19' COMMENT '操作类型',
  `create_time` int(11) unsigned NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=148314 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_common_account_log
-- ----------------------------
DROP TABLE IF EXISTS `gw_common_account_log`;
CREATE TABLE `gw_common_account_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `money` decimal(10,2) unsigned NOT NULL COMMENT '冲入金额',
  `total_money` decimal(10,2) unsigned NOT NULL COMMENT '冲入后总金额',
  `real_name` varchar(128) NOT NULL COMMENT '操作人',
  `username` varchar(128) NOT NULL COMMENT '操作人姓名',
  `create_time` int(11) unsigned NOT NULL COMMENT '创建时间',
  `common_account_id` int(11) unsigned NOT NULL COMMENT '所属公共帐户',
  PRIMARY KEY (`id`),
  KEY `common_account_id` (`common_account_id`) USING BTREE,
  CONSTRAINT `fk_common_account_log_common_account` FOREIGN KEY (`common_account_id`) REFERENCES `gw_common_account` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_complaint
-- ----------------------------
DROP TABLE IF EXISTS `gw_complaint`;
CREATE TABLE `gw_complaint` (
  `id` tinyint(11) unsigned NOT NULL AUTO_INCREMENT,
  `linkman` varchar(128) NOT NULL COMMENT '联系人',
  `mobile` varchar(45) NOT NULL COMMENT '联系电话',
  `content` text NOT NULL COMMENT '内容',
  `create_time` int(11) unsigned NOT NULL COMMENT '创建时间',
  `source` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '来源（1微信、2网站）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_contract
-- ----------------------------
DROP TABLE IF EXISTS `gw_contract`;
CREATE TABLE `gw_contract` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) unsigned NOT NULL COMMENT '合同类型（1代理版 2、直营版）',
  `content` text NOT NULL COMMENT '合同内容',
  `version` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT '合同版本',
  `is_current` tinyint(1) unsigned NOT NULL COMMENT '是否当前使用的版本（0否、1是）',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态（1、正常   2、删除）',
  `create_time` int(10) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `type_is_current` (`type`,`is_current`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for gw_conversation_order
-- ----------------------------
DROP TABLE IF EXISTS `gw_conversation_order`;
CREATE TABLE `gw_conversation_order` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `gai_number` varchar(32) NOT NULL COMMENT '盖网号',
  `uid` varchar(10) NOT NULL DEFAULT '' COMMENT '通话系统会员编号',
  `code` varchar(64) NOT NULL COMMENT '订单号',
  `pay_price` decimal(10,2) NOT NULL COMMENT '支付金额',
  `pay_type` tinyint(1) unsigned NOT NULL COMMENT '支付方式（1积分、2抵换券、3环迅、4银联、5翼支付、6汇卡）',
  `cardno` varchar(40) NOT NULL COMMENT '充值卡号',
  `createtime` varchar(11) NOT NULL,
  `orderid` varchar(64) NOT NULL DEFAULT '' COMMENT '返回回来的订单号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=187 DEFAULT CHARSET=utf8 COMMENT='电话回拨充值表';

-- ----------------------------
-- Table structure for gw_coupon
-- ----------------------------
DROP TABLE IF EXISTS `gw_coupon`;
CREATE TABLE `gw_coupon` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `member_id` int(11) unsigned NOT NULL COMMENT '所属会员',
  `store_id` int(11) unsigned NOT NULL COMMENT '所属店铺',
  `money` decimal(10,2) unsigned NOT NULL COMMENT '面值',
  `condition` int(11) unsigned NOT NULL COMMENT '使用条件',
  `surplus_money` decimal(10,2) unsigned NOT NULL COMMENT '剩余金额',
  `valid_start` int(11) unsigned NOT NULL COMMENT '有效时间（开始）',
  `valid_end` int(11) unsigned NOT NULL COMMENT '有效时间（结束）',
  `status` tinyint(1) unsigned NOT NULL COMMENT '状态（0未使用、1已使用）',
  `mode` tinyint(1) unsigned NOT NULL COMMENT '模式（1积分红包、2盖惠券）',
  `type` tinyint(1) unsigned NOT NULL COMMENT '类型（1注册送红包、2分享送红包）',
  `create_time` int(11) unsigned NOT NULL COMMENT '领取时间',
  `use_time` int(11) unsigned NOT NULL COMMENT '使用时间',
  `source` tinyint(1) unsigned NOT NULL COMMENT '来源（1商城、2盖网通）',
  `activity_id` int(11) unsigned NOT NULL COMMENT '所属活动',
  `is_compensate` tinyint(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `activity_id` (`activity_id`) USING BTREE,
  CONSTRAINT `fk_coupon_activity` FOREIGN KEY (`activity_id`) REFERENCES `gw_activity` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=159562 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_creditor
-- ----------------------------
DROP TABLE IF EXISTS `gw_creditor`;
CREATE TABLE `gw_creditor` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cont` varchar(1000) NOT NULL COMMENT '内容',
  `creditor_tran` varchar(30) NOT NULL COMMENT '债权受让方',
  `create_time` int(10) unsigned NOT NULL,
  `update_time` int(10) unsigned NOT NULL,
  `gai_number` varchar(20) NOT NULL COMMENT '盖网编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=376 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_deduct_log
-- ----------------------------
DROP TABLE IF EXISTS `gw_deduct_log`;
CREATE TABLE `gw_deduct_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `card_number` varchar(64) NOT NULL COMMENT '银行卡号',
  `platform` tinyint(1) unsigned NOT NULL COMMENT '平台（1、广州银联2、翼支付3、环迅）',
  `money` decimal(18,2) NOT NULL COMMENT '金额',
  `order_code` varchar(64) NOT NULL COMMENT '订单编号',
  `status` tinyint(1) unsigned NOT NULL COMMENT '状态（1、成功2、失败）',
  `create_time` int(11) unsigned NOT NULL COMMENT '创建时间',
  `member_id` int(11) unsigned NOT NULL COMMENT '所属会员',
  `text` text NOT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `member_id` (`member_id`) USING BTREE,
  CONSTRAINT `fk_deduct_log_member` FOREIGN KEY (`member_id`) REFERENCES `gw_member` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_design
-- ----------------------------
DROP TABLE IF EXISTS `gw_design`;
CREATE TABLE `gw_design` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `store_id` int(11) unsigned NOT NULL COMMENT '所属店铺',
  `data` text NOT NULL COMMENT '数据',
  `status` tinyint(1) unsigned NOT NULL COMMENT '状态',
  `remark` text NOT NULL COMMENT '备注',
  `create_time` int(11) unsigned NOT NULL COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`) USING BTREE,
  CONSTRAINT `fk_design_store` FOREIGN KEY (`store_id`) REFERENCES `gw_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2280 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_email_log
-- ----------------------------
DROP TABLE IF EXISTS `gw_email_log`;
CREATE TABLE `gw_email_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `email` varchar(128) NOT NULL DEFAULT '' COMMENT '收件人邮箱地址',
  `content` text NOT NULL COMMENT '邮箱内容',
  `status` tinyint(1) NOT NULL COMMENT '发送状态(1为发送成功，2为发送不成功)',
  `type` tinyint(3) NOT NULL COMMENT '邮件类型（1表示开店，2表示新订单)',
  `send_time` int(11) NOT NULL COMMENT '邮件发送时间',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `count` tinyint(3) NOT NULL COMMENT '发送次数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8 COMMENT='邮件发送日志';

-- ----------------------------
-- Table structure for gw_enterprise
-- ----------------------------
DROP TABLE IF EXISTS `gw_enterprise`;
CREATE TABLE `gw_enterprise` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(128) NOT NULL COMMENT '家商名称',
  `short_name` varchar(64) NOT NULL COMMENT '简称',
  `province_id` int(11) unsigned NOT NULL COMMENT '省份',
  `city_id` int(11) unsigned NOT NULL COMMENT '城市',
  `district_id` int(11) unsigned NOT NULL COMMENT '区/县',
  `street` varchar(128) NOT NULL COMMENT '详细地址',
  `link_man` varchar(128) NOT NULL COMMENT '联系人',
  `link_phone` varchar(32) NOT NULL COMMENT '固话',
  `mobile` varchar(16) NOT NULL COMMENT '手机号码',
  `email` varchar(128) NOT NULL COMMENT '邮箱',
  `department` tinyint(1) unsigned NOT NULL COMMENT '所属部门',
  `service_start_time` int(11) unsigned NOT NULL COMMENT '服务开始时间',
  `service_end_time` int(11) unsigned NOT NULL COMMENT '服务结束时间',
  `create_time` int(11) unsigned NOT NULL COMMENT '创建时间',
  `auditing` tinyint(1) unsigned NOT NULL COMMENT '审核状态',
  `signing_type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '标记（0新签约、1旧签约）',
  `kingdee_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '金蝶ID',
  `last_log_id` int(11) unsigned NOT NULL COMMENT '对应审核进度',
  `enterprise_type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '商户类型(0:企业，1:个体工商户)',
  `service_id` varchar(20) NOT NULL COMMENT '招商人员服务编号',
  `flag` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '标记（1线下、2线上）',
  `apply_cash_limit` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许申请提现（0.允许，1.禁止）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53175 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_enterprise_data
-- ----------------------------
DROP TABLE IF EXISTS `gw_enterprise_data`;
CREATE TABLE `gw_enterprise_data` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `license` varchar(64) NOT NULL COMMENT '营业执照',
  `license_photo` varchar(128) NOT NULL COMMENT '执照图片',
  `license_province_id` int(11) NOT NULL COMMENT '营业执照所在省',
  `license_city_id` int(11) NOT NULL COMMENT '营业执照所在市',
  `license_district_id` int(11) NOT NULL COMMENT '营业执照所在区/县',
  `license_start_time` int(11) NOT NULL COMMENT '营业执照开始时间',
  `license_end_time` int(11) NOT NULL COMMENT '营业执照结束时间',
  `business_scope` text NOT NULL COMMENT '法定经营范围',
  `organization` varchar(128) NOT NULL COMMENT '组织机构代码',
  `organization_image` varchar(128) NOT NULL COMMENT '组织机构代码证电子版',
  `tax_id` varchar(128) NOT NULL COMMENT '税务登记证号',
  `taxpayer_id` varchar(128) NOT NULL COMMENT '纳税人识别号',
  `tax_image` varchar(128) NOT NULL COMMENT '税务登记证电子版',
  `threec_image` varchar(128) NOT NULL COMMENT '3c记证电子版',
  `cosmetics_image` varchar(128) NOT NULL COMMENT '化妆品卫生许可证or全国工业生产许可证',
  `food_image` varchar(128) NOT NULL COMMENT '食品流通许可证或全国工业生产许可证',
  `jewelry_image` varchar(128) NOT NULL COMMENT '第三方鉴定证书或鉴定报告',
  `declaration_image` varchar(128) NOT NULL COMMENT '进出口商品报关单',
  `report_image` varchar(128) NOT NULL COMMENT '进出口商品检测检验报告',
  `exists_imported_goods` tinyint(1) unsigned NOT NULL COMMENT '所选类目是否存在进口商品',
  `legal_man` varchar(20) NOT NULL COMMENT '法人代表',
  `legal_phone` varchar(16) NOT NULL COMMENT '法人代表联系电话',
  `identity_image` varchar(128) NOT NULL COMMENT '法人代表身份证正面照片',
  `identity_image2` varchar(128) NOT NULL COMMENT '法人代表身份证反面照片',
  `debit_card_image` varchar(128) NOT NULL COMMENT '法人代表银行借记卡正面照片',
  `debit_card_image2` varchar(128) NOT NULL COMMENT '法人代表银行借记卡反面照片',
  `enterprise_id` int(11) unsigned NOT NULL,
  `brand_image` varchar(128) NOT NULL COMMENT '商标注册证或授权书',
  PRIMARY KEY (`id`),
  KEY `enterprise_id` (`enterprise_id`) USING BTREE,
  CONSTRAINT `fk_enterprise_data_enterprise` FOREIGN KEY (`enterprise_id`) REFERENCES `gw_enterprise` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25040 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_enterprise_log
-- ----------------------------
DROP TABLE IF EXISTS `gw_enterprise_log`;
CREATE TABLE `gw_enterprise_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `status` tinyint(1) unsigned NOT NULL COMMENT '审核状态（1通过、2不通过）',
  `content` varchar(256) NOT NULL COMMENT '审核内容',
  `auditor` varchar(128) NOT NULL COMMENT '审核人',
  `enterprise_id` int(11) unsigned NOT NULL,
  `progress` tinyint(2) unsigned NOT NULL COMMENT '进度',
  `create_time` int(11) unsigned NOT NULL COMMENT '创建时间',
  `error_field` text NOT NULL COMMENT '错误字段',
  `is_remarts` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否为备注信息（1表示备注信息，0为非备注信息）',
  `is_key_return` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '为1时表示是一键返回操作',
  PRIMARY KEY (`id`),
  KEY `enterprise_id` (`enterprise_id`) USING BTREE,
  CONSTRAINT `fk_enterprise_log_enterprise` FOREIGN KEY (`enterprise_id`) REFERENCES `gw_enterprise` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15937 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_eptok_mobile_flow_recharge_config
-- ----------------------------
DROP TABLE IF EXISTS `gw_eptok_mobile_flow_recharge_config`;
CREATE TABLE `gw_eptok_mobile_flow_recharge_config` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `province_id` int(11) unsigned DEFAULT NULL COMMENT '省份id',
  `operator` tinyint(2) unsigned DEFAULT '0' COMMENT '0未知,1移动,2联通,3电信',
  `price` decimal(6,2) DEFAULT '0.00',
  `amount` varchar(10) DEFAULT NULL COMMENT '流量值(MB,G)',
  `pay_percent` decimal(5,2) unsigned DEFAULT '100.00' COMMENT '支付比例',
  `update_time` int(11) DEFAULT NULL,
  `un_province_id` tinyint(4) unsigned DEFAULT '0' COMMENT '平台省份id',
  `use_target` int(11) unsigned DEFAULT NULL COMMENT '使用范围,省市区id',
  `un_percent` decimal(5,2) unsigned DEFAULT NULL COMMENT '平台折扣',
  PRIMARY KEY (`id`),
  KEY `province_id` (`province_id`,`operator`),
  KEY `un_province_id` (`un_province_id`)
) ENGINE=InnoDB AUTO_INCREMENT=178 DEFAULT CHARSET=utf8 COMMENT='银盛平台的手机流量充值价格配置';

-- ----------------------------
-- Table structure for gw_eptok_mobile_money_recharge_config
-- ----------------------------
DROP TABLE IF EXISTS `gw_eptok_mobile_money_recharge_config`;
CREATE TABLE `gw_eptok_mobile_money_recharge_config` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `province_id` int(11) unsigned DEFAULT NULL COMMENT '省份id',
  `operator` tinyint(2) unsigned DEFAULT '0' COMMENT '0未知,1移动,2联通,3电信',
  `price` decimal(6,2) DEFAULT '0.00' COMMENT '面值',
  `pay_percent` decimal(5,2) unsigned DEFAULT '100.00' COMMENT '盖网折扣',
  `update_time` int(11) DEFAULT NULL,
  `un_province_id` tinyint(4) unsigned DEFAULT '0' COMMENT '平台省份id',
  `un_percent` decimal(5,2) unsigned DEFAULT '100.00' COMMENT '平台折扣',
  PRIMARY KEY (`id`),
  KEY `province_id` (`province_id`,`operator`),
  KEY `un_province_id` (`un_province_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10927 DEFAULT CHARSET=utf8 COMMENT='银盛平台的手机充值价格配置';

-- ----------------------------
-- Table structure for gw_eptok_mobile_money_recharge_config_fix
-- ----------------------------
DROP TABLE IF EXISTS `gw_eptok_mobile_money_recharge_config_fix`;
CREATE TABLE `gw_eptok_mobile_money_recharge_config_fix` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `province_id` int(11) unsigned DEFAULT NULL COMMENT '省份id',
  `operator` tinyint(2) unsigned DEFAULT '0' COMMENT '0未知,1移动,2联通,3电信',
  `price` decimal(6,2) DEFAULT '0.00' COMMENT '面值',
  `pay_percent` decimal(5,2) unsigned DEFAULT '100.00' COMMENT '盖网折扣',
  `update_time` int(11) DEFAULT NULL,
  `un_province_id` tinyint(4) unsigned DEFAULT '0' COMMENT '平台省份id',
  `un_percent` decimal(5,2) unsigned DEFAULT '100.00' COMMENT '平台折扣',
  PRIMARY KEY (`id`),
  KEY `province_id` (`province_id`,`operator`),
  KEY `un_province_id` (`un_province_id`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8 COMMENT='银盛平台的手机充值价格配置';

-- ----------------------------
-- Table structure for gw_eptok_mobile_range
-- ----------------------------
DROP TABLE IF EXISTS `gw_eptok_mobile_range`;
CREATE TABLE `gw_eptok_mobile_range` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `province_id` int(11) unsigned DEFAULT NULL COMMENT '省份id',
  `operator` tinyint(2) unsigned DEFAULT '0' COMMENT '0未知,1移动,2联通,3电信',
  `range_start` varchar(20) DEFAULT NULL,
  `range_end` varchar(20) DEFAULT NULL,
  `update_time` int(11) unsigned DEFAULT NULL,
  `un_province_id` tinyint(4) DEFAULT NULL COMMENT '平台提供的省份id',
  `un_province_name` varchar(128) DEFAULT NULL COMMENT '平台提供的省份名称',
  `number_prefix` varchar(16) DEFAULT NULL COMMENT '号码段',
  `un_city_number` varchar(5) DEFAULT NULL COMMENT '区号',
  `un_city_name` varchar(128) DEFAULT NULL COMMENT '城市名称',
  PRIMARY KEY (`id`),
  KEY `range_start` (`range_start`),
  KEY `range_end` (`range_end`)
) ENGINE=InnoDB AUTO_INCREMENT=3355980 DEFAULT CHARSET=utf8 COMMENT='银盛平台手机号段';

-- ----------------------------
-- Table structure for gw_eptok_recharge_order
-- ----------------------------
DROP TABLE IF EXISTS `gw_eptok_recharge_order`;
CREATE TABLE `gw_eptok_recharge_order` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(32) NOT NULL COMMENT '订单号,流水号',
  `member_id` int(11) unsigned NOT NULL,
  `recharge_number` varchar(20) NOT NULL DEFAULT '0' COMMENT '被充值号码',
  `recharge_type` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '充值类型',
  `recharge_value` varchar(20) NOT NULL COMMENT '充值内容',
  `config_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '配置id',
  `amount` varchar(10) DEFAULT NULL COMMENT '充值面额',
  `pay_money` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '支付金额',
  `create_time` int(11) unsigned DEFAULT '0' COMMENT '创建时间',
  `pay_time` int(11) unsigned DEFAULT '0' COMMENT '支付时间',
  `status` tinyint(1) unsigned NOT NULL COMMENT '订单状态（1新订单，2交易完成，3，退款完成，4，交易关闭，5，交易异常）',
  `pay_status` tinyint(1) unsigned NOT NULL COMMENT '支付状态（1未支付，2已支付）',
  `refund_time` int(11) unsigned DEFAULT '0' COMMENT '退款成功时间',
  `refund_reason` varchar(255) DEFAULT '' COMMENT '退款原因',
  `order_type` tinyint(2) unsigned DEFAULT NULL COMMENT '订单种类',
  `machine_code` varchar(32) DEFAULT NULL,
  `machine_id` int(11) unsigned DEFAULT NULL,
  `machine_serial_number` varchar(128) NOT NULL,
  `record_type` tinyint(2) unsigned DEFAULT NULL,
  `pay_type` tinyint(2) unsigned DEFAULT NULL,
  `req_trace_date` varchar(6) NOT NULL COMMENT '月份',
  `req_trace_id` varchar(12) NOT NULL COMMENT '每月交易流水号',
  PRIMARY KEY (`id`),
  UNIQUE KEY `machine_serial_number` (`machine_serial_number`),
  UNIQUE KEY `req_trace_date` (`req_trace_date`,`req_trace_id`),
  KEY `code` (`code`),
  KEY `status` (`status`),
  KEY `recharge_type` (`recharge_type`)
) ENGINE=InnoDB AUTO_INCREMENT=613 DEFAULT CHARSET=utf8 COMMENT='银盛充值订单';

-- ----------------------------
-- Table structure for gw_eptok_recharge_order_bak
-- ----------------------------
DROP TABLE IF EXISTS `gw_eptok_recharge_order_bak`;
CREATE TABLE `gw_eptok_recharge_order_bak` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(32) NOT NULL COMMENT '订单号,流水号',
  `member_id` int(11) unsigned NOT NULL,
  `recharge_number` varchar(20) NOT NULL DEFAULT '0' COMMENT '被充值号码',
  `recharge_type` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '充值类型',
  `recharge_value` varchar(20) NOT NULL COMMENT '充值内容',
  `config_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '配置id',
  `pay_money` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '支付金额',
  `create_time` int(11) unsigned DEFAULT '0' COMMENT '创建时间',
  `pay_time` int(11) unsigned DEFAULT '0' COMMENT '支付时间',
  `status` tinyint(2) unsigned DEFAULT '0' COMMENT '状态,0未支付,1已支付',
  `order_type` tinyint(2) unsigned DEFAULT NULL COMMENT '订单种类',
  `machine_code` varchar(32) DEFAULT NULL,
  `machine_id` int(11) unsigned DEFAULT NULL,
  `machine_serial_number` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `code` (`code`),
  KEY `status` (`status`),
  KEY `recharge_type` (`recharge_type`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8 COMMENT='银盛充值订单';

-- ----------------------------
-- Table structure for gw_eptok_send_201507
-- ----------------------------
DROP TABLE IF EXISTS `gw_eptok_send_201507`;
CREATE TABLE `gw_eptok_send_201507` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(11) unsigned DEFAULT '0',
  `message_type` varchar(80) DEFAULT NULL COMMENT '消息类型',
  `create_time` int(11) unsigned DEFAULT '0',
  `send_resource` text,
  `send_data` varchar(255) DEFAULT NULL,
  `send_time` int(11) unsigned DEFAULT '0',
  `receive_data` varchar(255) DEFAULT NULL,
  `status` tinyint(1) unsigned DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='银盛接口通信数据';

-- ----------------------------
-- Table structure for gw_eptok_send_201508
-- ----------------------------
DROP TABLE IF EXISTS `gw_eptok_send_201508`;
CREATE TABLE `gw_eptok_send_201508` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `member_id` int(11) unsigned DEFAULT '0',
  `message_type` varchar(80) DEFAULT NULL COMMENT '消息类型',
  `create_time` int(11) unsigned DEFAULT '0',
  `send_resource` text,
  `send_data` varchar(255) DEFAULT NULL,
  `send_time` int(11) unsigned DEFAULT '0',
  `receive_data` varchar(255) DEFAULT NULL,
  `status` tinyint(1) unsigned DEFAULT '0',
  `error_code` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8 COMMENT='银盛接口通信数据';

-- ----------------------------
-- Table structure for gw_eptok_send_201509
-- ----------------------------
DROP TABLE IF EXISTS `gw_eptok_send_201509`;
CREATE TABLE `gw_eptok_send_201509` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) unsigned DEFAULT NULL,
  `member_id` int(11) unsigned DEFAULT '0',
  `message_type` varchar(80) DEFAULT NULL COMMENT '消息类型',
  `create_time` int(11) unsigned DEFAULT '0',
  `send_resource` text,
  `send_data` varchar(255) DEFAULT NULL,
  `send_time` int(11) unsigned DEFAULT '0',
  `receive_data` varchar(255) DEFAULT NULL,
  `status` tinyint(1) unsigned DEFAULT '0',
  `error_code` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COMMENT='银盛接口通信数据';

-- ----------------------------
-- Table structure for gw_eptok_send_201510
-- ----------------------------
DROP TABLE IF EXISTS `gw_eptok_send_201510`;
CREATE TABLE `gw_eptok_send_201510` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) unsigned DEFAULT NULL,
  `member_id` int(11) unsigned DEFAULT '0',
  `message_type` varchar(80) DEFAULT NULL COMMENT '消息类型',
  `create_time` int(11) unsigned DEFAULT '0',
  `send_resource` text,
  `send_data` varchar(255) DEFAULT NULL,
  `send_time` int(11) unsigned DEFAULT '0',
  `receive_data` varchar(255) DEFAULT NULL,
  `status` tinyint(1) unsigned DEFAULT '0',
  `error_code` varchar(12) DEFAULT NULL,
  `req_trace_date` varchar(6) NOT NULL COMMENT '月份',
  `req_trace_id` varchar(12) NOT NULL COMMENT '每月交易流水号',
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `req_trace_date` (`req_trace_date`,`req_trace_id`) USING BTREE,
  KEY `status` (`status`,`error_code`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COMMENT='银盛接口通信数据';

-- ----------------------------
-- Table structure for gw_eptok_send_201511
-- ----------------------------
DROP TABLE IF EXISTS `gw_eptok_send_201511`;
CREATE TABLE `gw_eptok_send_201511` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) unsigned DEFAULT NULL,
  `member_id` int(11) unsigned DEFAULT '0',
  `message_type` varchar(80) DEFAULT NULL COMMENT '消息类型',
  `create_time` int(11) unsigned DEFAULT '0',
  `send_resource` text,
  `send_data` varchar(255) DEFAULT NULL,
  `send_time` int(11) unsigned DEFAULT '0',
  `receive_data` varchar(255) DEFAULT NULL,
  `status` tinyint(1) unsigned DEFAULT '0',
  `error_code` varchar(12) DEFAULT NULL,
  `req_trace_date` varchar(6) NOT NULL COMMENT '月份',
  `req_trace_id` varchar(12) NOT NULL COMMENT '每月交易流水号',
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_id` (`order_id`) USING BTREE,
  KEY `req_trace_date` (`req_trace_date`,`req_trace_id`) USING BTREE,
  KEY `status` (`status`,`error_code`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COMMENT='银盛接口通信数据';

-- ----------------------------
-- Table structure for gw_eptok_send_201512
-- ----------------------------
DROP TABLE IF EXISTS `gw_eptok_send_201512`;
CREATE TABLE `gw_eptok_send_201512` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) unsigned DEFAULT NULL,
  `member_id` int(11) unsigned DEFAULT '0',
  `message_type` varchar(80) DEFAULT NULL COMMENT '消息类型',
  `create_time` int(11) unsigned DEFAULT '0',
  `send_resource` text,
  `send_data` varchar(255) DEFAULT NULL,
  `send_time` int(11) unsigned DEFAULT '0',
  `receive_data` varchar(255) DEFAULT NULL,
  `status` tinyint(1) unsigned DEFAULT '0',
  `error_code` varchar(12) DEFAULT NULL,
  `req_trace_date` varchar(6) NOT NULL COMMENT '月份',
  `req_trace_id` varchar(12) NOT NULL COMMENT '每月交易流水号',
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_id` (`order_id`) USING BTREE,
  KEY `req_trace_date` (`req_trace_date`,`req_trace_id`) USING BTREE,
  KEY `status` (`status`,`error_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='银盛接口通信数据';

-- ----------------------------
-- Table structure for gw_eptok_send_month
-- ----------------------------
DROP TABLE IF EXISTS `gw_eptok_send_month`;
CREATE TABLE `gw_eptok_send_month` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) unsigned DEFAULT NULL,
  `member_id` int(11) unsigned DEFAULT '0',
  `message_type` varchar(80) DEFAULT NULL COMMENT '消息类型',
  `create_time` int(11) unsigned DEFAULT '0',
  `send_resource` text,
  `send_data` varchar(255) DEFAULT NULL,
  `send_time` int(11) unsigned DEFAULT '0',
  `receive_data` varchar(255) DEFAULT NULL,
  `status` tinyint(1) unsigned DEFAULT '0',
  `error_code` varchar(12) DEFAULT NULL,
  `req_trace_date` varchar(6) NOT NULL COMMENT '月份',
  `req_trace_id` varchar(12) NOT NULL COMMENT '每月交易流水号',
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_id` (`order_id`) USING BTREE,
  KEY `req_trace_date` (`req_trace_date`,`req_trace_id`) USING BTREE,
  KEY `status` (`status`,`error_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='银盛接口通信数据';

-- ----------------------------
-- Table structure for gw_eptok_sign_log
-- ----------------------------
DROP TABLE IF EXISTS `gw_eptok_sign_log`;
CREATE TABLE `gw_eptok_sign_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` datetime NOT NULL,
  `message` text,
  `data` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for gw_exchange_code
-- ----------------------------
DROP TABLE IF EXISTS `gw_exchange_code`;
CREATE TABLE `gw_exchange_code` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT '兑换码',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '兑换状态',
  `money` decimal(10,2) NOT NULL COMMENT '面值',
  `account` varchar(64) NOT NULL DEFAULT '' COMMENT '兑换账号（GW号）',
  `time` int(11) NOT NULL COMMENT '兑换时间',
  `type` tinyint(1) NOT NULL COMMENT '兑换类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13229 DEFAULT CHARSET=utf8 COMMENT='红包兑换码';

-- ----------------------------
-- Table structure for gw_express
-- ----------------------------
DROP TABLE IF EXISTS `gw_express`;
CREATE TABLE `gw_express` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(128) NOT NULL COMMENT '名称',
  `url` varchar(128) NOT NULL COMMENT '网址',
  `code` varchar(64) NOT NULL COMMENT '编码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_favorite
-- ----------------------------
DROP TABLE IF EXISTS `gw_favorite`;
CREATE TABLE `gw_favorite` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `goods_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '所属商品',
  `member_id` int(11) unsigned NOT NULL COMMENT '所属会员',
  `store_id` int(11) NOT NULL DEFAULT '0' COMMENT '所属店铺',
  `type` tinyint(1) unsigned NOT NULL COMMENT '类型（1商品、2店铺）',
  PRIMARY KEY (`id`),
  KEY `member_id` (`member_id`) USING BTREE,
  CONSTRAINT `fk_favorite_member` FOREIGN KEY (`member_id`) REFERENCES `gw_member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_feedback
-- ----------------------------
DROP TABLE IF EXISTS `gw_feedback`;
CREATE TABLE `gw_feedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL COMMENT ' 内容',
  `username` varchar(30) NOT NULL COMMENT '联系人',
  `gai_number` varchar(20) NOT NULL COMMENT '盖网账号',
  `picture` varchar(255) NOT NULL COMMENT '附件',
  `mobile` varchar(20) NOT NULL COMMENT '联系方式',
  `created` int(11) NOT NULL COMMENT '创建时间',
  `ip` int(11) NOT NULL COMMENT 'ip地址',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COMMENT='用户反馈信息表';

-- ----------------------------
-- Table structure for gw_franchisee
-- ----------------------------
DROP TABLE IF EXISTS `gw_franchisee`;
CREATE TABLE `gw_franchisee` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `create_time` int(11) unsigned NOT NULL COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL COMMENT '更新时间',
  `name` varchar(128) NOT NULL COMMENT '名称',
  `password` varchar(128) NOT NULL COMMENT '密码',
  `salt` varchar(128) NOT NULL COMMENT '密钥',
  `alias_name` varchar(128) NOT NULL COMMENT '别名',
  `logo` varchar(128) NOT NULL COMMENT 'LOGO',
  `logo2` varchar(128) NOT NULL COMMENT 'logo2',
  `province_id` int(11) unsigned NOT NULL COMMENT '省份',
  `city_id` int(11) unsigned NOT NULL COMMENT '城市',
  `district_id` int(11) unsigned NOT NULL COMMENT '区/县',
  `street` varchar(128) NOT NULL COMMENT '详细地址',
  `description` text NOT NULL COMMENT '说明',
  `qq` varchar(256) NOT NULL COMMENT 'QQ',
  `url` varchar(128) NOT NULL COMMENT '网址',
  `lng` varchar(128) NOT NULL COMMENT '经度',
  `lat` varchar(128) NOT NULL COMMENT '纬度',
  `fax` varchar(32) NOT NULL COMMENT '传真',
  `zip_code` varchar(16) NOT NULL COMMENT '邮编',
  `mobile` varchar(16) NOT NULL COMMENT '手机号码',
  `member_id` int(11) unsigned NOT NULL COMMENT '所属会员',
  `max_machine` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '最大绑定盖机数',
  `main_course` varchar(128) NOT NULL COMMENT '主营',
  `summary` text NOT NULL COMMENT '简介',
  `notice` text NOT NULL COMMENT '公告',
  `keywords` varchar(128) NOT NULL COMMENT '关键词',
  `parent_id` int(11) unsigned NOT NULL COMMENT '父级加盟商',
  `thumbnail` varchar(128) NOT NULL COMMENT '缩略图',
  `background` varchar(128) NOT NULL COMMENT '背景图',
  `banner` varchar(128) NOT NULL COMMENT 'BANNER',
  `country_id` int(11) unsigned NOT NULL COMMENT '国家',
  `status` tinyint(1) unsigned NOT NULL COMMENT 'STATUS',
  `code` varchar(128) NOT NULL COMMENT '编号',
  `author_id` int(11) unsigned NOT NULL COMMENT '创建者ID',
  `author_name` varchar(128) NOT NULL COMMENT '创建者',
  `create_ip` int(11) unsigned NOT NULL COMMENT '创建者IP',
  `update_ip` int(11) unsigned NOT NULL COMMENT '更新者IP',
  `total_score` decimal(11,2) unsigned NOT NULL COMMENT '总评分',
  `comments` int(11) unsigned NOT NULL COMMENT '总评数',
  `franchisee_brand_id` int(11) unsigned NOT NULL COMMENT '所属品牌',
  `featured_content` text NOT NULL COMMENT '精品推荐',
  `tags` text NOT NULL COMMENT '标签',
  `is_recommend` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否推荐（0否、1是）',
  `gai_discount` tinyint(3) unsigned NOT NULL COMMENT '盖网折扣',
  `member_discount` tinyint(3) unsigned NOT NULL COMMENT '会员折扣',
  `auto_check` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否自动对账',
  `visit_count` int(7) NOT NULL DEFAULT '0' COMMENT '访问数量',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`) USING BTREE,
  KEY `member_id` (`member_id`) USING BTREE,
  KEY `province_id` (`province_id`),
  KEY `city_id` (`city_id`),
  KEY `district_id` (`district_id`),
  CONSTRAINT `fk_franchisee_member` FOREIGN KEY (`member_id`) REFERENCES `gw_member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13441 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_franchisee_activity_city
-- ----------------------------
DROP TABLE IF EXISTS `gw_franchisee_activity_city`;
CREATE TABLE `gw_franchisee_activity_city` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `province_id` int(11) unsigned NOT NULL COMMENT '省份',
  `city_id` int(11) unsigned NOT NULL COMMENT '城市',
  `default` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '默认（0否1是）',
  `create_time` int(11) unsigned NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_franchisee_artile
-- ----------------------------
DROP TABLE IF EXISTS `gw_franchisee_artile`;
CREATE TABLE `gw_franchisee_artile` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `author_id` tinyint(1) NOT NULL COMMENT '作者',
  `create_time` int(11) unsigned NOT NULL COMMENT '创建时间',
  `franchisee_id` int(11) unsigned NOT NULL COMMENT '所属加盟商',
  `title` varchar(128) NOT NULL COMMENT '标题',
  `content` text NOT NULL COMMENT '内容',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态（0草稿，1发布）',
  `views` int(11) unsigned NOT NULL COMMENT '浏览数',
  `thumbnail` varchar(128) NOT NULL COMMENT '缩略图',
  `external_links` varchar(128) NOT NULL COMMENT '外部链接',
  `summary` text NOT NULL COMMENT '摘要',
  PRIMARY KEY (`id`),
  KEY `franchisee_id` (`franchisee_id`) USING BTREE,
  CONSTRAINT `fk_franchisee_artile_franchisee` FOREIGN KEY (`franchisee_id`) REFERENCES `gw_franchisee_bak` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=615 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_franchisee_bak
-- ----------------------------
DROP TABLE IF EXISTS `gw_franchisee_bak`;
CREATE TABLE `gw_franchisee_bak` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `create_time` int(11) unsigned NOT NULL COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL COMMENT '更新时间',
  `name` varchar(128) NOT NULL COMMENT '名称',
  `password` varchar(128) NOT NULL COMMENT '密码',
  `salt` varchar(128) NOT NULL COMMENT '密钥',
  `alias_name` varchar(128) NOT NULL COMMENT '别名',
  `logo` varchar(128) NOT NULL COMMENT 'LOGO',
  `logo2` varchar(128) NOT NULL COMMENT 'logo2',
  `province_id` int(11) unsigned NOT NULL COMMENT '省份',
  `city_id` int(11) unsigned NOT NULL COMMENT '城市',
  `district_id` int(11) unsigned NOT NULL COMMENT '区/县',
  `street` varchar(128) NOT NULL COMMENT '详细地址',
  `description` text NOT NULL COMMENT '说明',
  `qq` varchar(256) NOT NULL COMMENT 'QQ',
  `url` varchar(128) NOT NULL COMMENT '网址',
  `lng` varchar(128) NOT NULL COMMENT '经度',
  `lat` varchar(128) NOT NULL COMMENT '纬度',
  `fax` varchar(32) NOT NULL COMMENT '传真',
  `zip_code` varchar(16) NOT NULL COMMENT '邮编',
  `mobile` varchar(16) NOT NULL COMMENT '手机号码',
  `member_id` int(11) unsigned NOT NULL COMMENT '所属会员',
  `max_machine` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '最大绑定盖机数',
  `main_course` varchar(128) NOT NULL COMMENT '主营',
  `summary` text NOT NULL COMMENT '简介',
  `notice` text NOT NULL COMMENT '公告',
  `keywords` varchar(128) NOT NULL COMMENT '关键词',
  `parent_id` int(11) unsigned NOT NULL COMMENT '父级加盟商',
  `thumbnail` varchar(128) NOT NULL COMMENT '缩略图',
  `background` varchar(128) NOT NULL COMMENT '背景图',
  `banner` varchar(128) NOT NULL COMMENT 'BANNER',
  `country_id` int(11) unsigned NOT NULL COMMENT '国家',
  `status` tinyint(1) unsigned NOT NULL COMMENT 'STATUS',
  `code` varchar(128) NOT NULL COMMENT '编号',
  `author_id` int(11) unsigned NOT NULL COMMENT '创建者ID',
  `author_name` varchar(128) NOT NULL COMMENT '创建者',
  `create_ip` int(11) unsigned NOT NULL COMMENT '创建者IP',
  `update_ip` int(11) unsigned NOT NULL COMMENT '更新者IP',
  `total_score` decimal(11,2) unsigned NOT NULL COMMENT '总评分',
  `comments` int(11) unsigned NOT NULL COMMENT '总评数',
  `franchisee_brand_id` int(11) unsigned NOT NULL COMMENT '所属品牌',
  `featured_content` text NOT NULL COMMENT '精品推荐',
  `tags` text NOT NULL COMMENT '标签',
  `is_recommend` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否推荐（0否、1是）',
  `gai_discount` tinyint(3) unsigned NOT NULL COMMENT '盖网折扣',
  `member_discount` tinyint(3) unsigned NOT NULL COMMENT '会员折扣',
  `auto_check` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否自动对账',
  `visit_count` int(7) NOT NULL DEFAULT '0' COMMENT '访问数量',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`) USING BTREE,
  KEY `member_id` (`member_id`) USING BTREE,
  KEY `province_id` (`province_id`),
  KEY `city_id` (`city_id`),
  KEY `district_id` (`district_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8574 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_franchisee_brand
-- ----------------------------
DROP TABLE IF EXISTS `gw_franchisee_brand`;
CREATE TABLE `gw_franchisee_brand` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(128) NOT NULL COMMENT '名称',
  `pinyin` varchar(64) NOT NULL COMMENT '拼音（首字母）',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '255' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_franchisee_call_info
-- ----------------------------
DROP TABLE IF EXISTS `gw_franchisee_call_info`;
CREATE TABLE `gw_franchisee_call_info` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `franchisee_id` int(11) unsigned NOT NULL COMMENT '加盟商id',
  `content` varchar(128) NOT NULL COMMENT '内容',
  `create_time` int(11) unsigned NOT NULL COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `franchisee_id` (`franchisee_id`) USING BTREE,
  CONSTRAINT `fk_call_info_franchisee` FOREIGN KEY (`franchisee_id`) REFERENCES `gw_franchisee_bak` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_franchisee_care
-- ----------------------------
DROP TABLE IF EXISTS `gw_franchisee_care`;
CREATE TABLE `gw_franchisee_care` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `franchisee_id` int(11) unsigned NOT NULL COMMENT '加盟商id',
  `member_id` int(11) unsigned NOT NULL COMMENT '会员',
  `create_time` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `franchisee_id` (`franchisee_id`) USING BTREE,
  KEY `member_id` (`member_id`) USING BTREE,
  CONSTRAINT `fk_franchisee_care_franchisee` FOREIGN KEY (`franchisee_id`) REFERENCES `gw_franchisee_bak` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_franchisee_care_member` FOREIGN KEY (`member_id`) REFERENCES `gw_member` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_franchisee_category
-- ----------------------------
DROP TABLE IF EXISTS `gw_franchisee_category`;
CREATE TABLE `gw_franchisee_category` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `parent_id` int(11) unsigned NOT NULL COMMENT '上级分类',
  `name` varchar(128) NOT NULL COMMENT '名称',
  `alias` varchar(128) NOT NULL COMMENT '别名',
  `thumbnail` varchar(128) NOT NULL COMMENT '缩略图',
  `content` varchar(256) NOT NULL COMMENT '说明',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态（0禁用，1显示）',
  `show` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '首页显示（0否，1是）',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `keywords` varchar(128) NOT NULL COMMENT '关键词',
  `description` varchar(256) NOT NULL COMMENT '描述',
  `create_time` int(11) unsigned NOT NULL COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL COMMENT '更新时间',
  `kingdee_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '金蝶ID',
  `bgclass` varchar(20) NOT NULL DEFAULT 'food' COMMENT '首页LOGO样式类',
  `bussbgclass` varchar(20) NOT NULL DEFAULT 'food' COMMENT '商家分类LOGO',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_franchisee_code
-- ----------------------------
DROP TABLE IF EXISTS `gw_franchisee_code`;
CREATE TABLE `gw_franchisee_code` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(64) NOT NULL COMMENT '预设加盟商编号',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否使用（1、已经使用  0、未使用）',
  `create_time` int(11) unsigned NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_franchisee_consumption_pay_result_log
-- ----------------------------
DROP TABLE IF EXISTS `gw_franchisee_consumption_pay_result_log`;
CREATE TABLE `gw_franchisee_consumption_pay_result_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `serial_number` varchar(32) NOT NULL COMMENT '订单号',
  `pay_type` tinyint(2) unsigned NOT NULL COMMENT '平台类型 1 UM支付',
  `platform_result` text NOT NULL COMMENT '平台执行返回 用json格式保存',
  `result_status` tinyint(3) unsigned NOT NULL COMMENT '本地执行结果 1是成功，0是错误',
  `result_log` text COMMENT '执行结果描述',
  `create_time` int(11) unsigned NOT NULL COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL COMMENT '更新时间',
  `request_times` int(5) unsigned NOT NULL DEFAULT '0' COMMENT '访问次数',
  PRIMARY KEY (`id`),
  KEY `serial_number` (`serial_number`),
  KEY `pay_type` (`pay_type`)
) ENGINE=InnoDB AUTO_INCREMENT=4596 DEFAULT CHARSET=utf8 COMMENT='支付平台推送结果';

-- ----------------------------
-- Table structure for gw_franchisee_consumption_pre_record
-- ----------------------------
DROP TABLE IF EXISTS `gw_franchisee_consumption_pre_record`;
CREATE TABLE `gw_franchisee_consumption_pre_record` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `serial_number` varchar(32) NOT NULL COMMENT '订单号',
  `machine_serial_number` varchar(128) NOT NULL COMMENT '机器交易流水号（由售货机生成）',
  `member_id` int(11) unsigned NOT NULL COMMENT '消费的会员id',
  `entered_money` decimal(12,2) unsigned NOT NULL COMMENT '消费时输入的金额(可能是港币，只做显示用)',
  `amount` decimal(10,2) unsigned NOT NULL COMMENT '消费金额，人民币',
  `point_money` decimal(10,2) unsigned NOT NULL COMMENT '消费的积分金额',
  `success_amount` decimal(10,2) unsigned NOT NULL COMMENT '成功消费的金额 人民币',
  `create_time` int(11) unsigned NOT NULL COMMENT '创建时间',
  `processed_time` int(11) unsigned NOT NULL COMMENT '处理时间',
  `machine_id` int(11) unsigned NOT NULL COMMENT '售货机的id',
  `symbol` varchar(20) NOT NULL DEFAULT 'RMB' COMMENT '币种(RMB、HKD)',
  `base_price` decimal(10,2) unsigned NOT NULL COMMENT '换算成人民币的汇率，如果是港币为78，人民币为100,具体数值在网站配置里取',
  `is_processed` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否处理了此交易',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0表示没交易完成，1表示交易完成,2表示部分完成',
  `record_type` tinyint(1) unsigned NOT NULL COMMENT '来源类型',
  `is_pay` tinyint(2) NOT NULL DEFAULT '0' COMMENT '银行卡消费是否已经支付',
  PRIMARY KEY (`id`),
  UNIQUE KEY `machine_serial_number` (`machine_serial_number`) USING BTREE,
  UNIQUE KEY `serial_number` (`serial_number`) USING BTREE,
  KEY `member_id` (`member_id`) USING BTREE,
  CONSTRAINT `fk_franchisee_consumption_pre_record_member` FOREIGN KEY (`member_id`) REFERENCES `gw_member` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10296 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_franchisee_consumption_record
-- ----------------------------
DROP TABLE IF EXISTS `gw_franchisee_consumption_record`;
CREATE TABLE `gw_franchisee_consumption_record` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `serial_number` varchar(64) NOT NULL COMMENT '交易流水号（SN11111111）,由后台生成',
  `machine_serial_number` varchar(128) NOT NULL COMMENT '机器交易流水号（有盖网机生成）',
  `franchisee_id` int(11) unsigned NOT NULL COMMENT '加盟商id',
  `member_id` int(11) unsigned NOT NULL COMMENT '消费的会员id',
  `record_type` tinyint(1) unsigned NOT NULL DEFAULT '2' COMMENT '暂不知什么作用',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态（0新纪录，1已确认）',
  `is_distributed` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否分配积分（0未分配，1已分配）',
  `entered_money` decimal(12,2) NOT NULL COMMENT '消费时输入的金额(可能是港币，只做显示用)',
  `spend_money` decimal(10,2) unsigned NOT NULL COMMENT '消费金额(如果是港币，插入时要进行换算)',
  `point_money` decimal(10,2) unsigned NOT NULL COMMENT '积分消费的金额',
  `gai_discount` tinyint(3) unsigned NOT NULL COMMENT '盖网折扣',
  `member_discount` tinyint(3) unsigned NOT NULL COMMENT '会员折扣',
  `distribute_money` decimal(10,2) unsigned NOT NULL COMMENT '分配金额',
  `create_time` int(11) unsigned NOT NULL COMMENT '创建时间',
  `remark` varchar(255) NOT NULL COMMENT '备注（会员【GW68527165】在线下加盟商【QD海梦圆美食城】的盖网机【海梦圆美食城】处消费￥150，分配金额为￥12.24，盖网折扣90%，会员折扣98%。）',
  `machine_id` mediumint(8) NOT NULL COMMENT '盖网机的id',
  `symbol` varchar(20) NOT NULL DEFAULT 'RMB' COMMENT '币种(RMB、HKD)',
  `base_price` decimal(10,2) unsigned NOT NULL COMMENT '换算成人民币的汇率，如果是港币为78，人民币为100,具体数值在网站配置里取',
  `distribute_config` varchar(1024) NOT NULL COMMENT '保存分配规则',
  `auto_check_fail` varchar(256) NOT NULL COMMENT '自动对账失败的原因',
  `is_auto` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否自动对账（0手动对账  1 自动对账）',
  `distributed_time` int(11) unsigned NOT NULL COMMENT '分配时间',
  `repeal_time` int(11) unsigned NOT NULL COMMENT '撤销时间',
  `pay_type` tinyint(2) unsigned DEFAULT '1' COMMENT '支付类型(1积分,2银行卡，3积分+银行卡)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `serial_number` (`serial_number`) USING BTREE,
  UNIQUE KEY `machine_serial_number` (`machine_serial_number`) USING BTREE,
  KEY `franchisee_id` (`franchisee_id`) USING BTREE,
  KEY `member_id` (`member_id`),
  KEY `status` (`status`),
  KEY `create_time` (`create_time`),
  CONSTRAINT `fk_franchisee_consumption_record_franchisee` FOREIGN KEY (`franchisee_id`) REFERENCES `gw_franchisee` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=148445 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_franchisee_consumption_record_advert
-- ----------------------------
DROP TABLE IF EXISTS `gw_franchisee_consumption_record_advert`;
CREATE TABLE `gw_franchisee_consumption_record_advert` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `serial_number` varchar(32) NOT NULL COMMENT '订单号',
  `advert_id` int(11) unsigned NOT NULL COMMENT '优惠劵id',
  `price` double(10,2) unsigned NOT NULL COMMENT '价格',
  `num` int(11) unsigned NOT NULL COMMENT '数目',
  PRIMARY KEY (`id`),
  KEY `serial_number` (`serial_number`),
  KEY `advert_id` (`advert_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for gw_franchisee_consumption_record_confirm
-- ----------------------------
DROP TABLE IF EXISTS `gw_franchisee_consumption_record_confirm`;
CREATE TABLE `gw_franchisee_consumption_record_confirm` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `serial_number` varchar(64) NOT NULL COMMENT '申请对账时的流水号',
  `record_id` int(11) unsigned NOT NULL COMMENT '线下消费的id',
  `apply_user_id` int(11) unsigned NOT NULL COMMENT '申请对账的人',
  `apply_time` int(10) unsigned NOT NULL COMMENT '申请对账的时间',
  `agree_user_id` int(11) unsigned NOT NULL COMMENT '同意对账的人',
  `agree_time` int(10) unsigned NOT NULL COMMENT '同意对账的时间',
  `refuse_user_id` int(11) unsigned NOT NULL COMMENT '拒绝对账的人',
  `refuse_time` int(10) unsigned NOT NULL COMMENT '拒绝对账的时间',
  `status` tinyint(1) NOT NULL COMMENT '状态（0申请中 1已对账 2已拒绝 3审核）',
  `pay_type` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '支付类型(1积分,2联动优势)',
  `auditi_user_id` int(11) unsigned NOT NULL COMMENT '审核人id',
  `auditi_time` int(10) unsigned NOT NULL COMMENT '审核时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1113 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_franchisee_consumption_record_goods
-- ----------------------------
DROP TABLE IF EXISTS `gw_franchisee_consumption_record_goods`;
CREATE TABLE `gw_franchisee_consumption_record_goods` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `serial_number` varchar(32) NOT NULL COMMENT '订单号',
  `vending_goods_id` int(11) unsigned NOT NULL COMMENT '商品ID',
  `price` double(11,2) unsigned NOT NULL COMMENT '商品价格',
  `pay_num` int(5) unsigned NOT NULL DEFAULT '0' COMMENT '下单时候商品数量',
  `success_num` int(5) NOT NULL DEFAULT '0' COMMENT '成功消费商品数量',
  `fail_num` int(5) NOT NULL DEFAULT '0' COMMENT '失败消费商品数量',
  PRIMARY KEY (`id`),
  KEY `serial_number` (`serial_number`,`vending_goods_id`),
  KEY `vending_goods_id` (`vending_goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=153 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for gw_franchisee_consumption_record_repeal
-- ----------------------------
DROP TABLE IF EXISTS `gw_franchisee_consumption_record_repeal`;
CREATE TABLE `gw_franchisee_consumption_record_repeal` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `serial_number` varchar(64) NOT NULL COMMENT '申请撤销时的流水号',
  `record_id` int(11) unsigned NOT NULL COMMENT '线下消费的id',
  `apply_user_id` int(11) unsigned NOT NULL COMMENT '申请撤销的人',
  `apply_time` int(10) unsigned NOT NULL COMMENT '申请撤销的时间',
  `agree_user_id` int(11) unsigned NOT NULL COMMENT '同意撤销的人',
  `agree_time` int(10) unsigned NOT NULL COMMENT '同意撤销的时间',
  `refuse_user_id` int(11) unsigned NOT NULL COMMENT '拒绝撤销的人',
  `refuse_time` int(10) unsigned NOT NULL COMMENT '拒绝撤销的时间',
  `status` tinyint(1) NOT NULL COMMENT '状态（0申请中 1已撤销 2已拒绝）',
  `auditi_user_id` int(11) NOT NULL COMMENT '审核人id',
  `auditi_time` int(10) unsigned NOT NULL COMMENT '审核时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=147 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_franchisee_contract
-- ----------------------------
DROP TABLE IF EXISTS `gw_franchisee_contract`;
CREATE TABLE `gw_franchisee_contract` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(11) unsigned NOT NULL COMMENT '会员id',
  `contract_id` int(11) unsigned NOT NULL COMMENT '合同id',
  `number` varchar(128) NOT NULL COMMENT '合同编号',
  `protocol_no` varchar(128) NOT NULL COMMENT '协议编号',
  `a_name` varchar(100) NOT NULL COMMENT '甲方名称',
  `a_address` varchar(255) NOT NULL COMMENT '甲方地址',
  `b_name` varchar(100) NOT NULL COMMENT '乙方名称',
  `b_address` varchar(255) NOT NULL COMMENT '乙方地址',
  `original_contract_time` int(10) unsigned NOT NULL COMMENT '原合同日期',
  `status` tinyint(1) unsigned NOT NULL COMMENT '状态（0未确认 、1确认、2、删除）',
  `confirm_time` int(10) unsigned NOT NULL COMMENT '协议确认时间',
  `create_time` int(10) unsigned NOT NULL COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `number` (`number`) COMMENT '合同编号',
  KEY `contract_id` (`contract_id`),
  KEY `status` (`status`),
  KEY `member_id` (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24133 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for gw_franchisee_goods
-- ----------------------------
DROP TABLE IF EXISTS `gw_franchisee_goods`;
CREATE TABLE `gw_franchisee_goods` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `franchisee_goods_category_id` int(11) unsigned NOT NULL COMMENT '所属线下商品分类',
  `franchisee_id` int(11) unsigned NOT NULL COMMENT '所属线下商家',
  `name` varchar(128) NOT NULL COMMENT '名称',
  `thumbnail` varchar(128) NOT NULL COMMENT '代表图',
  `sales_volume` int(11) unsigned NOT NULL COMMENT '销量',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态（0草稿、1上线、2下架）',
  `content` text NOT NULL COMMENT '说明',
  `comments` int(11) unsigned NOT NULL COMMENT '评论数',
  `total_score` decimal(11,2) unsigned NOT NULL COMMENT '总评分',
  `create_time` int(11) unsigned NOT NULL COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL COMMENT '更新时间',
  `discount` tinyint(3) unsigned NOT NULL COMMENT '折扣',
  `member_price` decimal(18,2) unsigned NOT NULL COMMENT '会员价',
  `seller_price` decimal(18,2) unsigned NOT NULL COMMENT '销售价',
  PRIMARY KEY (`id`),
  KEY `franchisee_goods_category_id` (`franchisee_goods_category_id`) USING BTREE,
  KEY `franchisee_id` (`franchisee_id`) USING BTREE,
  CONSTRAINT `fk_franchisee_goods_franchisee` FOREIGN KEY (`franchisee_id`) REFERENCES `gw_franchisee_bak` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_franchisee_goods_franchisee_goods_category` FOREIGN KEY (`franchisee_goods_category_id`) REFERENCES `gw_franchisee_goods_category` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_franchisee_goods_category
-- ----------------------------
DROP TABLE IF EXISTS `gw_franchisee_goods_category`;
CREATE TABLE `gw_franchisee_goods_category` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `franchisee_id` int(11) unsigned NOT NULL COMMENT '所属线下商家',
  `parent_id` int(11) unsigned NOT NULL COMMENT '父级',
  `name` varchar(128) NOT NULL COMMENT '名称',
  `tree` text NOT NULL COMMENT '节点',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '255' COMMENT '排序',
  PRIMARY KEY (`id`),
  KEY `franchisee_id` (`franchisee_id`) USING BTREE,
  CONSTRAINT `fk_franchisee_goods_category_franchisee` FOREIGN KEY (`franchisee_id`) REFERENCES `gw_franchisee_bak` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_franchisee_goods_comment
-- ----------------------------
DROP TABLE IF EXISTS `gw_franchisee_goods_comment`;
CREATE TABLE `gw_franchisee_goods_comment` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL COMMENT '评价内容',
  `score` decimal(2,1) unsigned NOT NULL COMMENT '综合评分',
  `service_score` decimal(2,1) unsigned NOT NULL COMMENT '商家服务评分',
  `quality_score` decimal(2,1) unsigned NOT NULL COMMENT '商品质量评分',
  `create_time` int(11) unsigned NOT NULL COMMENT '评论时间',
  `member_id` int(11) unsigned NOT NULL COMMENT '会员id',
  `franchisee_id` int(11) unsigned NOT NULL COMMENT '加盟商id',
  `franchisee_goods_id` int(11) unsigned NOT NULL COMMENT '线下商品id',
  `franchisee_goods_order_id` int(11) unsigned NOT NULL COMMENT '线下订单id',
  PRIMARY KEY (`id`),
  KEY `member_id` (`member_id`) USING BTREE,
  KEY `franchisee_id` (`franchisee_id`) USING BTREE,
  KEY `franchisee_goods_id` (`franchisee_goods_id`) USING BTREE,
  KEY `franchisee_goods_comment_gw_franchisee_goods_order_id` (`franchisee_goods_order_id`) USING BTREE,
  CONSTRAINT `fk_franchisee_goods_comment_franchisee` FOREIGN KEY (`franchisee_id`) REFERENCES `gw_franchisee_bak` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_franchisee_goods_comment_franchisee_goods` FOREIGN KEY (`franchisee_goods_id`) REFERENCES `gw_franchisee_goods` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_franchisee_goods_comment_franchisee_goods_order` FOREIGN KEY (`franchisee_goods_order_id`) REFERENCES `gw_franchisee_goods_order` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_franchisee_goods_comment_member` FOREIGN KEY (`member_id`) REFERENCES `gw_member` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_franchisee_goods_order
-- ----------------------------
DROP TABLE IF EXISTS `gw_franchisee_goods_order`;
CREATE TABLE `gw_franchisee_goods_order` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `code` varchar(45) NOT NULL COMMENT '商品订单编号',
  `mobile` varchar(20) NOT NULL COMMENT '购买人的手机号码',
  `open_type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '开单方式（1现开、2预定）',
  `book_time` int(11) unsigned NOT NULL COMMENT '预定时间',
  `open_time` int(11) unsigned NOT NULL COMMENT '开台时间',
  `pay_type` tinyint(1) unsigned NOT NULL COMMENT '支付方式（1、会员支付    2、非会员支付--直接给现金）',
  `pay_time` int(11) unsigned NOT NULL COMMENT '支付时间',
  `seller_price` decimal(18,2) NOT NULL COMMENT '销售总价',
  `pay_price` decimal(18,2) NOT NULL COMMENT '支付总价',
  `status` tinyint(1) unsigned NOT NULL COMMENT '状态（0预定 1已开台 2已支付）',
  `member_id` int(11) unsigned NOT NULL COMMENT '购买者的会员id',
  `franchisee_id` int(11) unsigned NOT NULL COMMENT '加盟商id',
  `franchisee_table_id` int(10) unsigned NOT NULL COMMENT '台号id',
  `award` decimal(18,2) unsigned NOT NULL COMMENT '会员的奖励',
  `is_comment` tinyint(1) unsigned NOT NULL COMMENT '是否评价（0未评价、1已评价）',
  `distribution_ratio` text NOT NULL COMMENT '订单生成的时候保存分配比率',
  `franchisee_staff_id` int(11) unsigned NOT NULL COMMENT '开单人所属店员id',
  `franchisee_statement_staff_id` int(11) unsigned NOT NULL COMMENT '结单人',
  `parent_code` varchar(45) NOT NULL COMMENT '网银流水号',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code_UNIQUE` (`code`) USING BTREE,
  KEY `member_id` (`member_id`) USING BTREE,
  KEY `franchisee_id` (`franchisee_id`) USING BTREE,
  KEY `franchisee_idx` (`franchisee_table_id`) USING BTREE,
  KEY `franchisee_staff_id` (`franchisee_staff_id`) USING BTREE,
  CONSTRAINT `fk_franchisee_goods_order_franchisee` FOREIGN KEY (`franchisee_id`) REFERENCES `gw_franchisee_bak` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_franchisee_goods_order_franchisee_staff` FOREIGN KEY (`franchisee_staff_id`) REFERENCES `gw_franchisee_staff` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_franchisee_goods_order_franchisee_table` FOREIGN KEY (`franchisee_table_id`) REFERENCES `gw_franchisee_table` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_franchisee_goods_order_member` FOREIGN KEY (`member_id`) REFERENCES `gw_member` (`id`) ON DELETE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_franchisee_goods_order_detail
-- ----------------------------
DROP TABLE IF EXISTS `gw_franchisee_goods_order_detail`;
CREATE TABLE `gw_franchisee_goods_order_detail` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(128) NOT NULL COMMENT '商品名称',
  `seller_price` decimal(18,2) NOT NULL COMMENT '售价',
  `discount` tinyint(3) unsigned NOT NULL COMMENT '折扣',
  `member_price` decimal(18,2) NOT NULL COMMENT '会员价',
  `thumbnail` varchar(128) NOT NULL COMMENT '商品主图片',
  `content` text NOT NULL COMMENT '商品简介',
  `price` decimal(18,2) NOT NULL COMMENT '分两种情况：1、通过盖网渠道支付,此字段为支付的金额2、直接给服务员现金，此时该字段是0,如果是团购商品，该值是负数',
  `status` tinyint(1) unsigned NOT NULL COMMENT '状态(0未支付、1支付成功、2申请退款、3退款成功、4退款失败、5维权中)',
  `franchisee_goods_order_id` int(11) unsigned NOT NULL COMMENT '订单id',
  `type` tinyint(1) unsigned NOT NULL COMMENT '明细类型（1、商品  2团购）',
  `target_id` int(11) unsigned NOT NULL COMMENT '关联id（是线上商品id或者团购码的id）',
  `quantity` int(11) unsigned NOT NULL COMMENT '数量',
  PRIMARY KEY (`id`),
  KEY `franchisee_goods_ord_id` (`franchisee_goods_order_id`) USING BTREE,
  CONSTRAINT `fk_franchisee_goods_order_detail_franchisee_goods_order` FOREIGN KEY (`franchisee_goods_order_id`) REFERENCES `gw_franchisee_goods_order` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_franchisee_goods_order_to_call_info
-- ----------------------------
DROP TABLE IF EXISTS `gw_franchisee_goods_order_to_call_info`;
CREATE TABLE `gw_franchisee_goods_order_to_call_info` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `create_time` int(11) unsigned NOT NULL COMMENT '创建时间',
  `status` tinyint(1) unsigned NOT NULL COMMENT '状态（0呼叫中、1已处理）',
  `franchisee_goods_order_id` int(11) unsigned NOT NULL COMMENT '呼叫的线下商品订单id',
  `franchisee_id` int(11) unsigned NOT NULL COMMENT '加盟商id',
  `content` varchar(128) NOT NULL COMMENT '呼叫的内容',
  `member_id` int(11) unsigned NOT NULL COMMENT '会员id',
  `amount` decimal(18,2) unsigned NOT NULL COMMENT '消费金额',
  `table_name` varchar(128) NOT NULL COMMENT '台号名称',
  `member_mobile` varchar(128) NOT NULL COMMENT '会员手机号',
  `member_name` varchar(128) NOT NULL COMMENT '会员名称',
  `member_level` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `franchisee_goods_order_id` (`franchisee_goods_order_id`) USING BTREE,
  KEY `franchisee1_id` (`franchisee_id`) USING BTREE,
  KEY `franchisee_goods_order_to_call_info_gw_member_id` (`member_id`) USING BTREE,
  CONSTRAINT `fk_franchisee_goods_order_to_call_info_franchisee` FOREIGN KEY (`franchisee_id`) REFERENCES `gw_franchisee_bak` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_franchisee_goods_order_to_call_info_franchisee_goods_order` FOREIGN KEY (`franchisee_goods_order_id`) REFERENCES `gw_franchisee_goods_order` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_franchisee_goods_order_to_call_info_gw_member` FOREIGN KEY (`member_id`) REFERENCES `gw_member` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_franchisee_goods_picture
-- ----------------------------
DROP TABLE IF EXISTS `gw_franchisee_goods_picture`;
CREATE TABLE `gw_franchisee_goods_picture` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `franchisee_goods_id` int(11) unsigned NOT NULL COMMENT '所属线下商品',
  `path` varchar(128) NOT NULL COMMENT '路径',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '255' COMMENT '排序',
  PRIMARY KEY (`id`),
  KEY `franchisee_goods_id` (`franchisee_goods_id`) USING BTREE,
  CONSTRAINT `fk_franchisee_goods_picture_franchisee_goods` FOREIGN KEY (`franchisee_goods_id`) REFERENCES `gw_franchisee_goods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_franchisee_groupbuy
-- ----------------------------
DROP TABLE IF EXISTS `gw_franchisee_groupbuy`;
CREATE TABLE `gw_franchisee_groupbuy` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(128) NOT NULL COMMENT '名称',
  `franchisee_groupbuy_category_id` int(11) unsigned NOT NULL COMMENT '所属分类',
  `thumbnail` varchar(128) NOT NULL COMMENT '代表图',
  `sales_volume` int(11) unsigned NOT NULL COMMENT '销售数',
  `status` tinyint(1) unsigned NOT NULL COMMENT '状态（0草稿、1上线、2结束）',
  `original_price` decimal(18,2) unsigned NOT NULL COMMENT '原价',
  `seller_price` decimal(18,2) unsigned NOT NULL COMMENT '售价',
  `summary` text NOT NULL COMMENT '简介',
  `notice` text NOT NULL COMMENT '团购须知',
  `content` text NOT NULL COMMENT '详情',
  `anytime_back` tinyint(1) unsigned NOT NULL COMMENT '随时退（0否、1是）',
  `overdue_back` tinyint(1) unsigned NOT NULL COMMENT '过期退（0否、1是）',
  `no_book` tinyint(1) unsigned NOT NULL COMMENT '免预约（0否、1是）',
  `dead_time` int(11) unsigned NOT NULL COMMENT '过期时间',
  `create_time` int(11) unsigned NOT NULL COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL COMMENT '更新时间',
  `total_score` decimal(11,2) unsigned NOT NULL COMMENT '总评分',
  `comments` int(11) unsigned NOT NULL COMMENT '评论数',
  `franchisee_brand_id` int(10) unsigned NOT NULL COMMENT '所属线下团购品牌',
  `stock` int(11) unsigned NOT NULL COMMENT '库存',
  `award` decimal(18,2) unsigned NOT NULL COMMENT '店主的奖励（适用于商家自己添加的团购商品,由商家自己录入）',
  `franchisee_id` int(11) unsigned NOT NULL COMMENT '所属加盟商（如果是盖网自己添加的团购商品，该字段为0）',
  PRIMARY KEY (`id`),
  KEY `franchisee_id` (`franchisee_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_franchisee_groupbuy_care
-- ----------------------------
DROP TABLE IF EXISTS `gw_franchisee_groupbuy_care`;
CREATE TABLE `gw_franchisee_groupbuy_care` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `franchisee_groupbuy_id` int(11) unsigned NOT NULL COMMENT '线下团购id',
  `member_id` int(11) unsigned NOT NULL COMMENT '会员',
  `create_time` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `franchisee_groupbuy_id` (`franchisee_groupbuy_id`) USING BTREE,
  KEY `member_id` (`member_id`) USING BTREE,
  CONSTRAINT `fk_franchisee_groupbuy_care_member` FOREIGN KEY (`member_id`) REFERENCES `gw_member` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_franchisee_groupbuy_order_care_franchisee_groupbuy` FOREIGN KEY (`franchisee_groupbuy_id`) REFERENCES `gw_franchisee_groupbuy` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_franchisee_groupbuy_category
-- ----------------------------
DROP TABLE IF EXISTS `gw_franchisee_groupbuy_category`;
CREATE TABLE `gw_franchisee_groupbuy_category` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `parent_id` int(11) unsigned NOT NULL COMMENT '父级',
  `name` varchar(128) NOT NULL COMMENT '名称',
  `tree` text NOT NULL COMMENT '节点',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '255' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_franchisee_groupbuy_comment
-- ----------------------------
DROP TABLE IF EXISTS `gw_franchisee_groupbuy_comment`;
CREATE TABLE `gw_franchisee_groupbuy_comment` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `member_id` int(11) unsigned NOT NULL COMMENT '所属会员',
  `franchisee_groupbuy_order_id` int(11) unsigned NOT NULL COMMENT '所属线下团购订单',
  `franchisee_groupbuy_id` int(11) unsigned NOT NULL COMMENT '所属团购',
  `content` text NOT NULL COMMENT '内容',
  `score` decimal(2,1) unsigned NOT NULL COMMENT '综合评分',
  `service_score` decimal(2,1) unsigned NOT NULL COMMENT '商家服务评分',
  `quality_score` decimal(2,1) unsigned NOT NULL COMMENT '商品质量评分',
  `create_time` int(11) unsigned NOT NULL COMMENT '评论时间',
  `franchisee_id` int(11) unsigned NOT NULL COMMENT '加盟商id',
  `franchisee_groupbuy_order_password_id` int(11) unsigned NOT NULL COMMENT '团购码id',
  PRIMARY KEY (`id`),
  KEY `member_id` (`member_id`) USING BTREE,
  KEY `franchisee_groupbuy_order_id` (`franchisee_groupbuy_order_id`) USING BTREE,
  KEY `franchisee_groupbuy_id` (`franchisee_groupbuy_id`) USING BTREE,
  KEY `franchisee_id` (`franchisee_id`) USING BTREE,
  KEY `franchisee_groupbuy_or_idx` (`franchisee_groupbuy_order_password_id`) USING BTREE,
  CONSTRAINT `fk_franchisee_groupbuy_comment_franchisee` FOREIGN KEY (`franchisee_id`) REFERENCES `gw_franchisee_bak` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_franchisee_groupbuy_comment_franchisee_groupbuy` FOREIGN KEY (`franchisee_groupbuy_id`) REFERENCES `gw_franchisee_groupbuy` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_franchisee_groupbuy_comment_franchisee_groupbuy_order` FOREIGN KEY (`franchisee_groupbuy_order_id`) REFERENCES `gw_franchisee_groupbuy_order` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_franchisee_groupbuy_comment_franchisee_groupbuy_password` FOREIGN KEY (`franchisee_groupbuy_order_password_id`) REFERENCES `gw_franchisee_groupbuy_order_password` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_franchisee_groupbuy_comment_member` FOREIGN KEY (`member_id`) REFERENCES `gw_member` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_franchisee_groupbuy_order
-- ----------------------------
DROP TABLE IF EXISTS `gw_franchisee_groupbuy_order`;
CREATE TABLE `gw_franchisee_groupbuy_order` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `code` varchar(45) NOT NULL COMMENT '团购订单编号',
  `franchisee_groupbuy_id` int(11) unsigned NOT NULL COMMENT '所属线下团购',
  `franchisee_groupbuy_name` varchar(128) NOT NULL COMMENT '名称',
  `thumbnail` varchar(128) NOT NULL COMMENT '代表图片',
  `original_price` decimal(18,2) NOT NULL COMMENT '原价',
  `seller_price` decimal(18,2) NOT NULL COMMENT '售价',
  `quantity` int(11) unsigned NOT NULL COMMENT '数量',
  `total_price` decimal(18,2) NOT NULL COMMENT '总价',
  `anytime_back` tinyint(1) unsigned NOT NULL COMMENT '随时退',
  `overdue_back` tinyint(1) unsigned NOT NULL COMMENT '过期退',
  `no_book` tinyint(1) unsigned NOT NULL COMMENT '免预约',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态（0未支付、1已支付）',
  `create_time` int(11) unsigned NOT NULL COMMENT '下单时间',
  `pay_type` tinyint(1) unsigned NOT NULL COMMENT '支付方式（1积分、2网银、3支付宝）',
  `pay_time` int(11) unsigned NOT NULL COMMENT '支付时间',
  `dead_time` int(11) unsigned NOT NULL COMMENT '过期时间',
  `is_comment` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否评论（0否、1是）',
  `franchisee_id` int(11) unsigned NOT NULL COMMENT '所属线下商家（下单处）',
  `machine_id` int(11) unsigned NOT NULL COMMENT '所属盖机（下单处）',
  `member_id` int(11) unsigned NOT NULL COMMENT '购买者的会员id',
  `distribution_ratio` text NOT NULL COMMENT '订单生成的时候保存分配比率',
  `parent_code` varchar(45) NOT NULL COMMENT '网银流水号',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code_UNIQUE` (`code`) USING BTREE,
  KEY `franchisee_groupbuy_id` (`franchisee_groupbuy_id`) USING BTREE,
  KEY `franchisee_id` (`franchisee_id`) USING BTREE,
  KEY `member_id` (`member_id`) USING BTREE,
  CONSTRAINT `fk_franchisee_groupbuy_order_franchisee` FOREIGN KEY (`franchisee_id`) REFERENCES `gw_franchisee_bak` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_franchisee_groupbuy_order_franchisee_groupbuy` FOREIGN KEY (`franchisee_groupbuy_id`) REFERENCES `gw_franchisee_groupbuy` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_franchisee_groupbuy_order_member` FOREIGN KEY (`member_id`) REFERENCES `gw_member` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_franchisee_groupbuy_order_password
-- ----------------------------
DROP TABLE IF EXISTS `gw_franchisee_groupbuy_order_password`;
CREATE TABLE `gw_franchisee_groupbuy_order_password` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `franchisee_groupbuy_order_id` int(11) unsigned NOT NULL COMMENT '所属线下团购订单',
  `password` varchar(64) NOT NULL COMMENT '团购码',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态（0未使用、1已使用、2退款申请中、3退款成功、4退款失败）',
  `use_time` int(11) unsigned NOT NULL COMMENT '使用时间',
  `refund_time` int(11) unsigned NOT NULL COMMENT '退款时间 ',
  `franchisee_id` int(11) unsigned NOT NULL COMMENT '所属加盟商（使用处）',
  `award` decimal(18,2) unsigned NOT NULL COMMENT '会员的奖励',
  `is_comment` tinyint(1) unsigned NOT NULL COMMENT '是否评价（0未评价、1已评价）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `password` (`password`) USING BTREE,
  KEY `franchisee_groupbuy_order_id` (`franchisee_groupbuy_order_id`) USING BTREE,
  CONSTRAINT `fk_franchisee_groupbuy_order_password_franchisee_groupbuy_order` FOREIGN KEY (`franchisee_groupbuy_order_id`) REFERENCES `gw_franchisee_groupbuy_order` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_franchisee_groupbuy_picture
-- ----------------------------
DROP TABLE IF EXISTS `gw_franchisee_groupbuy_picture`;
CREATE TABLE `gw_franchisee_groupbuy_picture` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `path` varchar(128) NOT NULL COMMENT '路径',
  `franchisee_groupbuy_id` int(11) unsigned NOT NULL COMMENT '所属线下团购',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '255',
  PRIMARY KEY (`id`),
  KEY `franchisee_groupbuy_id` (`franchisee_groupbuy_id`) USING BTREE,
  CONSTRAINT `fk_franchisee_groupbuy_picture_franchisee_groupbuy` FOREIGN KEY (`franchisee_groupbuy_id`) REFERENCES `gw_franchisee_groupbuy` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_franchisee_groupbuy_to_franchisee
-- ----------------------------
DROP TABLE IF EXISTS `gw_franchisee_groupbuy_to_franchisee`;
CREATE TABLE `gw_franchisee_groupbuy_to_franchisee` (
  `franchisee_groupbuy_id` int(11) unsigned NOT NULL COMMENT '所属线下团购',
  `franchisee_id` int(11) unsigned NOT NULL COMMENT '所属线下商家',
  `type` tinyint(1) unsigned NOT NULL COMMENT '团购所属类型（0盖网发布的团购、1本店发布的团购、2合作商家发布的团购）',
  KEY `franchisee_group_id` (`franchisee_groupbuy_id`) USING BTREE,
  KEY `franchisee1_id` (`franchisee_id`) USING BTREE,
  CONSTRAINT `fk_franchisee_groupbuy_to_franchisee_franchisee` FOREIGN KEY (`franchisee_id`) REFERENCES `gw_franchisee_bak` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_franchisee_groupbuy_to_franchisee_franchisee_groupbuy` FOREIGN KEY (`franchisee_groupbuy_id`) REFERENCES `gw_franchisee_groupbuy` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_franchisee_lottery_record
-- ----------------------------
DROP TABLE IF EXISTS `gw_franchisee_lottery_record`;
CREATE TABLE `gw_franchisee_lottery_record` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `award` decimal(18,2) unsigned NOT NULL COMMENT '奖励，可能是签到积分、红包积分、消费积分',
  `type` tinyint(1) unsigned NOT NULL COMMENT '奖励类型（1红包积分、2签到积分、3消费积分）',
  `create_time` int(11) unsigned NOT NULL COMMENT '创建时间',
  `remark` varchar(255) NOT NULL COMMENT '备注',
  `member_id` int(11) unsigned NOT NULL COMMENT '会员id',
  PRIMARY KEY (`id`),
  KEY `member_id` (`member_id`) USING BTREE,
  CONSTRAINT `fk_franchisee_lottery_record_member` FOREIGN KEY (`member_id`) REFERENCES `gw_member` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_franchisee_member
-- ----------------------------
DROP TABLE IF EXISTS `gw_franchisee_member`;
CREATE TABLE `gw_franchisee_member` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `times` int(11) unsigned NOT NULL COMMENT '次数',
  `last_time` int(11) unsigned NOT NULL COMMENT '最后的消费时间',
  `remark` text NOT NULL COMMENT '备注',
  `amount` decimal(18,2) unsigned NOT NULL COMMENT '总消费金额（到店消费的金额累加）',
  `member_id` int(11) unsigned NOT NULL COMMENT '会员id',
  `franchisee_id` int(11) unsigned NOT NULL COMMENT '加盟商id',
  PRIMARY KEY (`id`),
  KEY `member_id` (`member_id`) USING BTREE,
  KEY `franchisee_id` (`franchisee_id`) USING BTREE,
  CONSTRAINT `fk_franchisee_member_franchisee` FOREIGN KEY (`franchisee_id`) REFERENCES `gw_franchisee_bak` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_franchisee_member_member` FOREIGN KEY (`member_id`) REFERENCES `gw_member` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_franchisee_member_browse_log
-- ----------------------------
DROP TABLE IF EXISTS `gw_franchisee_member_browse_log`;
CREATE TABLE `gw_franchisee_member_browse_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `target_id` int(11) unsigned NOT NULL COMMENT '来源id',
  `target_name` varchar(128) NOT NULL COMMENT '来源名称',
  `thumbnail` varchar(128) NOT NULL COMMENT '商家图片或者商品图片的地址',
  `type` tinyint(1) unsigned NOT NULL COMMENT '来源类型（1商家店铺、2团购、3商城商品 ）',
  `original_price` decimal(18,2) unsigned NOT NULL COMMENT '原价',
  `seller_price` decimal(18,2) unsigned NOT NULL COMMENT '售价',
  `address` varchar(255) NOT NULL COMMENT '地址',
  `create_time` int(11) unsigned NOT NULL COMMENT '创建时间',
  `member_id` int(11) unsigned NOT NULL COMMENT '会员id',
  PRIMARY KEY (`id`),
  KEY `member_id` (`member_id`) USING BTREE,
  CONSTRAINT `fk_franchisee_browse_log_member` FOREIGN KEY (`member_id`) REFERENCES `gw_member` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_franchisee_picture
-- ----------------------------
DROP TABLE IF EXISTS `gw_franchisee_picture`;
CREATE TABLE `gw_franchisee_picture` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `franchisee_id` int(11) unsigned NOT NULL COMMENT '所属加盟商',
  `path` varchar(128) NOT NULL COMMENT '路径',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`),
  KEY `franchisee_id` (`franchisee_id`) USING BTREE,
  CONSTRAINT `fk_franchisee_picture_franchisee` FOREIGN KEY (`franchisee_id`) REFERENCES `gw_franchisee_bak` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23437 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_franchisee_staff
-- ----------------------------
DROP TABLE IF EXISTS `gw_franchisee_staff`;
CREATE TABLE `gw_franchisee_staff` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(128) NOT NULL COMMENT '用户名',
  `password` varchar(128) NOT NULL COMMENT '密码',
  `salt` varchar(128) NOT NULL COMMENT '密钥',
  `franchisee_id` int(11) unsigned NOT NULL COMMENT '所属加盟商',
  `mobile` varchar(64) NOT NULL COMMENT '手机号码',
  `remark` text NOT NULL COMMENT '备注',
  `nickname` varchar(128) NOT NULL COMMENT '昵称',
  `current_login_time` int(11) unsigned DEFAULT NULL COMMENT '当前登录时间',
  `last_login_time` int(11) unsigned NOT NULL COMMENT '上次登录时间',
  `create_time` int(11) unsigned NOT NULL COMMENT '创建时间',
  `position` varchar(128) NOT NULL COMMENT '职位',
  `face_path` varchar(256) NOT NULL COMMENT '头像路径',
  `start_orders` int(11) unsigned NOT NULL COMMENT '开单数',
  `end_orders` int(11) unsigned NOT NULL COMMENT '结单数',
  `recharge_amount` decimal(18,2) unsigned NOT NULL COMMENT '充值金额',
  PRIMARY KEY (`id`),
  KEY `franchisee_id` (`franchisee_id`) USING BTREE,
  CONSTRAINT `fk_franchisee_customer_franchisee` FOREIGN KEY (`franchisee_id`) REFERENCES `gw_franchisee_bak` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_franchisee_table
-- ----------------------------
DROP TABLE IF EXISTS `gw_franchisee_table`;
CREATE TABLE `gw_franchisee_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(128) NOT NULL COMMENT '名称',
  `peoples` tinyint(3) unsigned NOT NULL COMMENT '人数',
  `create_time` int(11) unsigned NOT NULL COMMENT '创建时间',
  `status` tinyint(1) unsigned NOT NULL COMMENT '台号的状态（0未占用、1已占用），开台的时候更新为已占用，结账后更新为未占用',
  `franchisee_id` int(11) unsigned NOT NULL COMMENT '所属线下商家',
  PRIMARY KEY (`id`),
  KEY `franchisee_id` (`franchisee_id`) USING BTREE,
  CONSTRAINT `fk_franchisee_table_franchisee` FOREIGN KEY (`franchisee_id`) REFERENCES `gw_franchisee_bak` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_franchisee_to_category
-- ----------------------------
DROP TABLE IF EXISTS `gw_franchisee_to_category`;
CREATE TABLE `gw_franchisee_to_category` (
  `franchisee_category_id` int(11) unsigned NOT NULL COMMENT '加盟商分类',
  `franchisee_id` int(11) unsigned NOT NULL COMMENT '加盟商',
  KEY `franchisee_category_id` (`franchisee_category_id`) USING BTREE,
  KEY `franchisee_id` (`franchisee_id`) USING BTREE,
  CONSTRAINT `fk_franchisee_to_category_franchisee` FOREIGN KEY (`franchisee_id`) REFERENCES `gw_franchisee_bak` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_franchisee_to_category_franchisee_category` FOREIGN KEY (`franchisee_category_id`) REFERENCES `gw_franchisee_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_freight_area
-- ----------------------------
DROP TABLE IF EXISTS `gw_freight_area`;
CREATE TABLE `gw_freight_area` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `freight_type_id` int(11) unsigned NOT NULL COMMENT '所属运费类型',
  `location_id` int(11) unsigned NOT NULL COMMENT '地区',
  `default` decimal(9,2) NOT NULL COMMENT '首量',
  `default_freight` decimal(9,2) NOT NULL COMMENT '首费',
  `added` decimal(9,2) NOT NULL COMMENT '续量',
  `added_freight` decimal(9,2) NOT NULL COMMENT '续费',
  PRIMARY KEY (`id`),
  KEY `freight_type_id` (`freight_type_id`) USING BTREE,
  CONSTRAINT `fk_freight_area_freight_type` FOREIGN KEY (`freight_type_id`) REFERENCES `gw_freight_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=507743 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_freight_edit
-- ----------------------------
DROP TABLE IF EXISTS `gw_freight_edit`;
CREATE TABLE `gw_freight_edit` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `order_id` int(11) unsigned NOT NULL COMMENT '所属订单',
  `code` varchar(128) NOT NULL COMMENT '订单编号',
  `old_freight` decimal(10,2) NOT NULL COMMENT '旧运费',
  `new_freight` decimal(10,2) NOT NULL COMMENT '新运费',
  `create_time` int(11) unsigned NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`) USING BTREE,
  CONSTRAINT `fk_freight_edit_order` FOREIGN KEY (`order_id`) REFERENCES `gw_order` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1397 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_freight_template
-- ----------------------------
DROP TABLE IF EXISTS `gw_freight_template`;
CREATE TABLE `gw_freight_template` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(128) NOT NULL COMMENT '名称',
  `store_id` int(11) unsigned NOT NULL COMMENT '所属店铺',
  `store_address_id` int(11) unsigned NOT NULL COMMENT '所属发货地址',
  `valuation_type` tinyint(1) unsigned NOT NULL COMMENT '计算类型（1按件数，2按重量，3按体积）',
  `create_time` int(11) unsigned NOT NULL COMMENT '创建时间',
  `default` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '默认（0否，1是）',
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`) USING BTREE,
  CONSTRAINT `fk_freight_template_store` FOREIGN KEY (`store_id`) REFERENCES `gw_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1558 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_freight_type
-- ----------------------------
DROP TABLE IF EXISTS `gw_freight_type`;
CREATE TABLE `gw_freight_type` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `freight_template_id` int(11) unsigned NOT NULL COMMENT '运费模板',
  `mode` int(11) NOT NULL COMMENT '运送方式（1快递，2EMS，3平邮）',
  `default` decimal(9,2) NOT NULL COMMENT '首量',
  `default_freight` decimal(9,2) NOT NULL COMMENT '首费',
  `added` decimal(9,2) NOT NULL COMMENT '续量',
  `added_freight` decimal(9,2) NOT NULL COMMENT '续费',
  PRIMARY KEY (`id`),
  KEY `freight_template_id` (`freight_template_id`) USING BTREE,
  CONSTRAINT `fk_freight_type_freight_template` FOREIGN KEY (`freight_template_id`) REFERENCES `gw_freight_template` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1859 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_game_config
-- ----------------------------
DROP TABLE IF EXISTS `gw_game_config`;
CREATE TABLE `gw_game_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT 'APP类型',
  `config_name` varchar(60) NOT NULL,
  `value` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8 COMMENT='游戏配置管理信息表';

-- ----------------------------
-- Table structure for gw_game_notice
-- ----------------------------
DROP TABLE IF EXISTS `gw_game_notice`;
CREATE TABLE `gw_game_notice` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL COMMENT '公告标题',
  `content` text NOT NULL COMMENT '公告内容',
  `game_store_id` int(11) unsigned NOT NULL COMMENT '游戏店铺id',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否启用',
  `create_time` int(11) unsigned NOT NULL COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='登陆公告';

-- ----------------------------
-- Table structure for gw_game_order
-- ----------------------------
DROP TABLE IF EXISTS `gw_game_order`;
CREATE TABLE `gw_game_order` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL COMMENT '会员id',
  `real_name` varchar(128) NOT NULL COMMENT '姓名',
  `mobile` varchar(128) NOT NULL COMMENT '手机号',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否发货',
  `member_address` text COMMENT '收货地址',
  `items_info` text COMMENT '获取商品信息',
  `delivery_time` int(11) NOT NULL COMMENT '发货时间',
  `create_time` int(11) NOT NULL COMMENT '下单时间',
  `update_time` int(11) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='订单表';

-- ----------------------------
-- Table structure for gw_game_order_detail
-- ----------------------------
DROP TABLE IF EXISTS `gw_game_order_detail`;
CREATE TABLE `gw_game_order_detail` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL COMMENT '店铺ID',
  `member_id` int(11) NOT NULL COMMENT '会员id',
  `real_name` varchar(128) NOT NULL COMMENT '姓名',
  `mobile` varchar(128) NOT NULL COMMENT '手机号',
  `member_address` text COMMENT '收货地址',
  `order_id` int(11) unsigned NOT NULL COMMENT '总订单id',
  `fruit_name` varchar(128) NOT NULL COMMENT '水果名称',
  `num` int(11) NOT NULL COMMENT '水果数量',
  `award_time` int(11) NOT NULL COMMENT '领奖时间',
  `is_price` tinyint(1) NOT NULL DEFAULT '0' COMMENT '惊喜大奖0否,1是',
  `comment` text COMMENT '评论',
  `comment_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '评论状态0未评论，1已评论',
  `comment_time` int(11) DEFAULT NULL COMMENT '评论时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='订单详细表，每个产品单独记录';

-- ----------------------------
-- Table structure for gw_game_store
-- ----------------------------
DROP TABLE IF EXISTS `gw_game_store`;
CREATE TABLE `gw_game_store` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `gai_number` varchar(128) NOT NULL COMMENT '商家盖网号',
  `store_name` varchar(128) NOT NULL COMMENT '店铺名称',
  `store_phone` varchar(25) NOT NULL COMMENT '店铺电话',
  `store_address` varchar(255) NOT NULL COMMENT '店铺电话',
  `store_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '店铺状态',
  `franchise_stores` tinyint(1) NOT NULL DEFAULT '0' COMMENT '特殊商品店铺(0否，1是)',
  `limit_time_hour` int(11) NOT NULL DEFAULT '0' COMMENT '已抢该店铺水果的冻结小时数',
  `limit_time_minute` int(11) NOT NULL DEFAULT '1' COMMENT '已抢该店铺水果的冻结分钟数',
  `send_num` int(11) NOT NULL DEFAULT '0' COMMENT '起送条件',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `update_time` int(11) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='游戏店铺信息';

-- ----------------------------
-- Table structure for gw_game_store_delivery
-- ----------------------------
DROP TABLE IF EXISTS `gw_game_store_delivery`;
CREATE TABLE `gw_game_store_delivery` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL COMMENT '订单id',
  `delivery_store_id` int(11) NOT NULL COMMENT '发货店铺id',
  `delivery_items` text COMMENT '发货商品详细信息',
  `receive_member_id` int(11) NOT NULL COMMENT '收货人id',
  `delivery_time` int(11) NOT NULL COMMENT '发货时间',
  `total_order_id` int(11) unsigned NOT NULL COMMENT '总订单id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='游戏店铺发货记录';

-- ----------------------------
-- Table structure for gw_game_store_items
-- ----------------------------
DROP TABLE IF EXISTS `gw_game_store_items`;
CREATE TABLE `gw_game_store_items` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `flag` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '商品标识(0普通商品,1特殊商品)',
  `store_id` int(11) NOT NULL COMMENT '店铺id',
  `item_name` varchar(128) NOT NULL COMMENT '商品名称',
  `item_number` int(11) NOT NULL COMMENT '每日提供数量',
  `item_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '商品状态 1 上架 2 下架',
  `item_description` text COMMENT '商品描述',
  `store_description` text COMMENT '商家描述',
  `start_date` date NOT NULL COMMENT '活动开始日期',
  `end_date` date NOT NULL COMMENT '活动结束日期',
  `start_time` time NOT NULL COMMENT '每日开抢时间',
  `end_time` time NOT NULL COMMENT '每日结束时间',
  `limit_per_time` int(11) NOT NULL DEFAULT '1' COMMENT '用户单次获得数量',
  `bees_number` int(11) NOT NULL DEFAULT '1' COMMENT '蜜蜂数量',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `update_time` int(11) NOT NULL COMMENT '修改时间',
  `probability` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '获取概率',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8 COMMENT='游戏店铺商品信息';

-- ----------------------------
-- Table structure for gw_game_store_member
-- ----------------------------
DROP TABLE IF EXISTS `gw_game_store_member`;
CREATE TABLE `gw_game_store_member` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL COMMENT '店铺ID',
  `member_id` int(11) NOT NULL COMMENT '会员id',
  `real_name` varchar(128) NOT NULL COMMENT '姓名',
  `mobile` varchar(128) NOT NULL COMMENT '手机号',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否发货',
  `member_address` text COMMENT '收货地址',
  `items_info` text COMMENT '获取商品信息',
  `order_id` int(11) unsigned NOT NULL COMMENT '订单id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=186 DEFAULT CHARSET=utf8 COMMENT='游戏店铺用户列表';

-- ----------------------------
-- Table structure for gw_gft_menu_config
-- ----------------------------
DROP TABLE IF EXISTS `gw_gft_menu_config`;
CREATE TABLE `gw_gft_menu_config` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL COMMENT '标题',
  `icon` varchar(255) NOT NULL COMMENT '菜单icon',
  `flag` varchar(32) NOT NULL COMMENT '标志，APP端使用',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否开启，0:关闭,1:开启',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序,值越大越靠前',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='盖付通APP，主菜单配置表';

-- ----------------------------
-- Table structure for gw_gft_nopwd_pay_limit_setting
-- ----------------------------
DROP TABLE IF EXISTS `gw_gft_nopwd_pay_limit_setting`;
CREATE TABLE `gw_gft_nopwd_pay_limit_setting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pay_limit` decimal(11,2) unsigned NOT NULL COMMENT '免密支付额度',
  `author_id` int(11) unsigned NOT NULL COMMENT '操作人id',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='盖付通免密支付额度设置表';

-- ----------------------------
-- Table structure for gw_ght_data
-- ----------------------------
DROP TABLE IF EXISTS `gw_ght_data`;
CREATE TABLE `gw_ght_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '表主键ID',
  `post_data` text COMMENT '高汇通异步返回数据',
  `time` char(11) DEFAULT NULL COMMENT '数据返回时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='高汇通支付返回数据记录表';

-- ----------------------------
-- Table structure for gw_goods
-- ----------------------------
DROP TABLE IF EXISTS `gw_goods`;
CREATE TABLE `gw_goods` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `life` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否删除（0否，1是）',
  `name` varchar(128) NOT NULL COMMENT '名称',
  `code` varchar(64) NOT NULL COMMENT '编号',
  `store_id` int(11) unsigned NOT NULL COMMENT '所属商家',
  `category_id` int(11) unsigned NOT NULL COMMENT '商城分类',
  `scategory_id` int(11) unsigned NOT NULL COMMENT '本店分类',
  `sn` varchar(64) NOT NULL COMMENT '库号',
  `content` text NOT NULL COMMENT '内容',
  `thumbnail` varchar(128) NOT NULL COMMENT '缩略图',
  `views` int(11) unsigned NOT NULL COMMENT '浏览数',
  `is_publish` tinyint(1) unsigned NOT NULL COMMENT '是否发布',
  `create_time` int(11) unsigned NOT NULL COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL COMMENT '更新时间',
  `size` decimal(8,2) unsigned NOT NULL COMMENT '体积',
  `weight` decimal(8,2) unsigned NOT NULL COMMENT '重量',
  `is_score_exchange` tinyint(1) unsigned NOT NULL COMMENT '是否参加积分兑换',
  `market_price` decimal(11,2) unsigned NOT NULL COMMENT '初始零售价',
  `gai_price` decimal(11,2) unsigned NOT NULL COMMENT '供货价',
  `price` decimal(11,2) unsigned NOT NULL COMMENT '零售价',
  `discount` decimal(11,2) unsigned NOT NULL COMMENT '折扣积分',
  `stock` int(11) unsigned NOT NULL COMMENT '库存',
  `status` tinyint(1) unsigned NOT NULL COMMENT '状态（0审核中，1通过，2不通过）',
  `show` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '首页推荐（0否，1是）',
  `return_score` int(11) unsigned NOT NULL COMMENT '返还积分',
  `fail_cause` varchar(128) NOT NULL COMMENT '下架原因',
  `sales_volume` int(11) unsigned NOT NULL COMMENT '销量',
  `freight_template_id` int(11) unsigned NOT NULL COMMENT '运输模板',
  `freight_payment_type` tinyint(1) unsigned NOT NULL COMMENT '运输方式（0包邮，1运输方式，2运费模板）',
  `gai_income` int(11) unsigned NOT NULL COMMENT '盖网收入',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `keywords` varchar(128) NOT NULL COMMENT '关键词',
  `description` varchar(256) NOT NULL COMMENT '说明',
  `sign_integral` int(11) unsigned NOT NULL COMMENT '签到积分',
  `type_id` int(11) unsigned NOT NULL COMMENT '所属类型',
  `attribute` text NOT NULL COMMENT '属性',
  `goods_spec_id` int(11) unsigned NOT NULL COMMENT '默认的商品规格关联',
  `spec_picture` text NOT NULL COMMENT '商品规格图片',
  `spec_name` text NOT NULL COMMENT '规格名称',
  `goods_spec` text NOT NULL COMMENT '规格及规格值',
  `comments` int(11) unsigned NOT NULL COMMENT '评论数',
  `reviewer` varchar(128) NOT NULL COMMENT '审核人',
  `audit_time` int(11) unsigned NOT NULL COMMENT '审核时间',
  `publisher` varchar(128) NOT NULL COMMENT '发布人',
  `fee` decimal(5,2) unsigned NOT NULL COMMENT '手续费',
  `ratio` tinyint(3) unsigned NOT NULL COMMENT '比率',
  `total_score` decimal(11,2) unsigned NOT NULL COMMENT '总评分',
  `brand_id` smallint(5) unsigned NOT NULL COMMENT '所属品牌',
  `gai_sell_price` decimal(11,2) unsigned NOT NULL COMMENT '盖网售价',
  `activity_tag_id` int(11) unsigned NOT NULL,
  `join_activity` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '参加活动（0否、1是）',
  `activity_ratio` float(6,3) unsigned NOT NULL COMMENT '活动支持比率',
  `seckill_seting_id` int(11) NOT NULL COMMENT '秒杀活动seting表的ID',
  `jf_pay_ratio` tinyint(3) NOT NULL DEFAULT '0' COMMENT '积分支付比例(0-100，默认0，不限制,大于100只能用现金支付)',
  `labels` varchar(255) NOT NULL COMMENT '商品的标签,用于SEO优化',
  `change_field` varchar(255) DEFAULT NULL COMMENT '商家修改产品信息',
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`) USING BTREE,
  KEY `scategory_id` (`scategory_id`) USING BTREE,
  KEY `category_id` (`category_id`) USING BTREE,
  KEY `brand_id` (`brand_id`) USING BTREE,
  KEY `sales_volume` (`sales_volume`) USING BTREE,
  KEY `freight_template_id` (`freight_template_id`) USING BTREE,
  KEY `sort` (`sort`) USING BTREE,
  KEY `common_use` (`status`,`life`,`is_publish`) USING BTREE,
  KEY `name` (`name`) USING BTREE,
  KEY `views` (`views`) USING BTREE,
  KEY `activity_tag_id` (`activity_tag_id`) USING BTREE,
  CONSTRAINT `fk_goods_category` FOREIGN KEY (`category_id`) REFERENCES `gw_category` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_goods_store` FOREIGN KEY (`store_id`) REFERENCES `gw_store` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=172027 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_goods_audit
-- ----------------------------
DROP TABLE IF EXISTS `gw_goods_audit`;
CREATE TABLE `gw_goods_audit` (
  `user_id` int(10) unsigned NOT NULL COMMENT '审核人id',
  `goods_id` int(10) unsigned NOT NULL COMMENT '商品id',
  `price` decimal(11,2) NOT NULL COMMENT '价格',
  `content` varchar(200) NOT NULL COMMENT '审核结果',
  `status` tinyint(3) unsigned NOT NULL COMMENT '审核状态',
  `add_time` int(10) unsigned NOT NULL COMMENT '提交时间',
  `created` int(10) unsigned NOT NULL COMMENT '审核时间',
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `goods_id` (`goods_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品审核日志表';

-- ----------------------------
-- Table structure for gw_goods_collect
-- ----------------------------
DROP TABLE IF EXISTS `gw_goods_collect`;
CREATE TABLE `gw_goods_collect` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `good_id` int(11) unsigned NOT NULL COMMENT '商品id',
  `member_id` int(11) unsigned NOT NULL COMMENT '会员id',
  `create_time` int(11) NOT NULL COMMENT '收藏时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=777 DEFAULT CHARSET=utf8 COMMENT='商品收藏';

-- ----------------------------
-- Table structure for gw_goods_picture
-- ----------------------------
DROP TABLE IF EXISTS `gw_goods_picture`;
CREATE TABLE `gw_goods_picture` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `path` varchar(128) NOT NULL COMMENT '路径',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `goods_id` int(11) unsigned NOT NULL COMMENT '所属商品',
  PRIMARY KEY (`id`),
  KEY `goods_id` (`goods_id`) USING BTREE,
  CONSTRAINT `fk_goods_picture_goods` FOREIGN KEY (`goods_id`) REFERENCES `gw_goods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=579939 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_goods_picture_tmp
-- ----------------------------
DROP TABLE IF EXISTS `gw_goods_picture_tmp`;
CREATE TABLE `gw_goods_picture_tmp` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `path` varchar(128) NOT NULL COMMENT '路径',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `goods_id` int(11) unsigned NOT NULL COMMENT '所属商品',
  PRIMARY KEY (`id`),
  KEY `goods_id` (`goods_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COMMENT='商品列表图片临时表，做导入淘宝数据用';

-- ----------------------------
-- Table structure for gw_goods_price
-- ----------------------------
DROP TABLE IF EXISTS `gw_goods_price`;
CREATE TABLE `gw_goods_price` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` int(10) unsigned DEFAULT NULL COMMENT '商品id',
  `price` decimal(11,2) DEFAULT NULL COMMENT '价格',
  `create_time` int(11) DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`id`),
  KEY `goods_id` (`goods_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16919 DEFAULT CHARSET=utf8 COMMENT='商品历史价格表';

-- ----------------------------
-- Table structure for gw_goods_spec
-- ----------------------------
DROP TABLE IF EXISTS `gw_goods_spec`;
CREATE TABLE `gw_goods_spec` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `goods_id` int(11) unsigned NOT NULL COMMENT '所属商品',
  `spec_name` varchar(128) NOT NULL COMMENT '规格组合名',
  `price` decimal(11,2) NOT NULL COMMENT '价钱',
  `stock` int(11) unsigned NOT NULL COMMENT '库存',
  `sale_num` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '销量',
  `code` varchar(128) NOT NULL COMMENT '编号',
  `spec_value` text NOT NULL COMMENT '规格组合值',
  PRIMARY KEY (`id`),
  KEY `goods_id` (`goods_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=926894 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_goods_spec_index
-- ----------------------------
DROP TABLE IF EXISTS `gw_goods_spec_index`;
CREATE TABLE `gw_goods_spec_index` (
  `goods_id` int(11) unsigned NOT NULL COMMENT '所属商品',
  `category_id` int(11) unsigned NOT NULL COMMENT '所属分类',
  `type_id` int(11) unsigned NOT NULL COMMENT '所属类型',
  `spec_id` int(11) unsigned NOT NULL COMMENT '所属规格',
  `spec_value_id` int(11) unsigned NOT NULL COMMENT '所属规格',
  `spec_value_name` text NOT NULL COMMENT '规格值',
  KEY `goods_id` (`goods_id`) USING BTREE,
  KEY `category_id` (`category_id`) USING BTREE,
  KEY `type_id` (`type_id`) USING BTREE,
  KEY `spec_id` (`spec_id`) USING BTREE,
  KEY `spec_value_id` (`spec_value_id`) USING BTREE,
  CONSTRAINT `fk_goods_spec_index_category` FOREIGN KEY (`category_id`) REFERENCES `gw_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_goods_spec_index_goods` FOREIGN KEY (`goods_id`) REFERENCES `gw_goods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_goods_spec_index_spec` FOREIGN KEY (`spec_id`) REFERENCES `gw_spec` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_goods_spec_index_spec_value` FOREIGN KEY (`spec_value_id`) REFERENCES `gw_spec_value` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_goods_spec_index_type` FOREIGN KEY (`type_id`) REFERENCES `gw_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_goods_spec_index_tmp
-- ----------------------------
DROP TABLE IF EXISTS `gw_goods_spec_index_tmp`;
CREATE TABLE `gw_goods_spec_index_tmp` (
  `goods_id` int(11) unsigned NOT NULL COMMENT '所属商品',
  `category_id` int(11) unsigned NOT NULL COMMENT '所属分类',
  `type_id` int(11) unsigned NOT NULL COMMENT '所属类型',
  `spec_id` int(11) unsigned NOT NULL COMMENT '所属规格',
  `spec_value_id` int(11) unsigned NOT NULL COMMENT '所属规格',
  `spec_value_name` text NOT NULL COMMENT '规格值',
  KEY `goods_id` (`goods_id`) USING BTREE,
  KEY `category_id` (`category_id`) USING BTREE,
  KEY `type_id` (`type_id`) USING BTREE,
  KEY `spec_id` (`spec_id`) USING BTREE,
  KEY `spec_value_id` (`spec_value_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品规格值临时表，导入数据用';

-- ----------------------------
-- Table structure for gw_goods_spec_tmp
-- ----------------------------
DROP TABLE IF EXISTS `gw_goods_spec_tmp`;
CREATE TABLE `gw_goods_spec_tmp` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `goods_id` int(11) unsigned NOT NULL COMMENT '所属商品',
  `spec_name` varchar(128) NOT NULL COMMENT '规格组合名',
  `price` decimal(11,2) NOT NULL COMMENT '价钱',
  `stock` int(11) unsigned NOT NULL COMMENT '库存',
  `sale_num` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '销量',
  `code` varchar(128) NOT NULL COMMENT '编号',
  `spec_value` text NOT NULL COMMENT '规格组合值',
  PRIMARY KEY (`id`),
  KEY `goods_id` (`goods_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='商品规格临时表，导入数据用';

-- ----------------------------
-- Table structure for gw_goods_tmp
-- ----------------------------
DROP TABLE IF EXISTS `gw_goods_tmp`;
CREATE TABLE `gw_goods_tmp` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `life` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否删除（0否，1是）',
  `name` varchar(128) NOT NULL COMMENT '名称',
  `code` varchar(64) NOT NULL COMMENT '编号',
  `store_id` int(11) unsigned NOT NULL COMMENT '所属商家',
  `category_id` int(11) unsigned NOT NULL COMMENT '商城分类',
  `scategory_id` int(11) unsigned NOT NULL COMMENT '本店分类',
  `sn` varchar(64) NOT NULL COMMENT '库号',
  `content` text NOT NULL COMMENT '内容',
  `thumbnail` varchar(128) NOT NULL COMMENT '缩略图',
  `views` int(11) unsigned NOT NULL COMMENT '浏览数',
  `is_publish` tinyint(1) unsigned NOT NULL COMMENT '是否发布',
  `create_time` int(11) unsigned NOT NULL COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL COMMENT '更新时间',
  `size` decimal(8,2) unsigned NOT NULL COMMENT '体积',
  `weight` decimal(8,2) unsigned NOT NULL COMMENT '重量',
  `is_score_exchange` tinyint(1) unsigned NOT NULL COMMENT '是否参加积分兑换',
  `market_price` decimal(11,2) unsigned NOT NULL COMMENT '初始零售价',
  `gai_price` decimal(11,2) unsigned NOT NULL COMMENT '供货价',
  `price` decimal(11,2) unsigned NOT NULL COMMENT '零售价',
  `discount` decimal(11,2) unsigned NOT NULL COMMENT '折扣积分',
  `stock` int(11) unsigned NOT NULL COMMENT '库存',
  `status` tinyint(1) unsigned NOT NULL COMMENT '状态（0审核中，1通过，2不通过）',
  `show` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '首页推荐（0否，1是）',
  `return_score` int(11) unsigned NOT NULL COMMENT '返还积分',
  `fail_cause` varchar(128) NOT NULL COMMENT '下架原因',
  `sales_volume` int(11) unsigned NOT NULL COMMENT '销量',
  `freight_template_id` int(11) unsigned NOT NULL COMMENT '运输模板',
  `freight_payment_type` tinyint(1) unsigned NOT NULL COMMENT '运输方式（0包邮，1运输方式，2运费模板）',
  `gai_income` int(11) unsigned NOT NULL COMMENT '盖网收入',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `keywords` varchar(128) NOT NULL COMMENT '关键词',
  `description` varchar(256) NOT NULL COMMENT '说明',
  `sign_integral` int(11) unsigned NOT NULL COMMENT '签到积分',
  `type_id` int(11) unsigned NOT NULL COMMENT '所属类型',
  `attribute` text NOT NULL COMMENT '属性',
  `goods_spec_id` int(11) unsigned NOT NULL COMMENT '默认的商品规格关联',
  `spec_picture` text NOT NULL COMMENT '商品规格图片',
  `spec_name` text NOT NULL COMMENT '规格名称',
  `goods_spec` text NOT NULL COMMENT '规格及规格值',
  `comments` int(11) unsigned NOT NULL COMMENT '评论数',
  `reviewer` varchar(128) NOT NULL COMMENT '审核人',
  `audit_time` int(11) unsigned NOT NULL COMMENT '审核时间',
  `publisher` varchar(128) NOT NULL COMMENT '发布人',
  `fee` decimal(5,2) unsigned NOT NULL COMMENT '手续费',
  `ratio` tinyint(3) unsigned NOT NULL COMMENT '比率',
  `total_score` decimal(11,2) unsigned NOT NULL COMMENT '总评分',
  `brand_id` smallint(5) unsigned NOT NULL COMMENT '所属品牌',
  `gai_sell_price` decimal(11,2) unsigned NOT NULL COMMENT '盖网售价',
  `activity_tag_id` int(11) unsigned NOT NULL,
  `join_activity` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '参加活动（0否、1是）',
  `activity_ratio` float(6,3) unsigned NOT NULL COMMENT '活动支持比率',
  `seckill_seting_id` int(11) NOT NULL COMMENT '关联参加活动的规则ID',
  `jf_pay_ratio` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '积分支付比例(0-100，默认0，不限制)',
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`) USING BTREE,
  KEY `scategory_id` (`scategory_id`) USING BTREE,
  KEY `category_id` (`category_id`) USING BTREE,
  KEY `brand_id` (`brand_id`) USING BTREE,
  KEY `life` (`life`) USING BTREE,
  KEY `is_publish` (`is_publish`) USING BTREE,
  KEY `status` (`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='商品临时表，做导入淘宝数据用';

-- ----------------------------
-- Table structure for gw_guestbook
-- ----------------------------
DROP TABLE IF EXISTS `gw_guestbook`;
CREATE TABLE `gw_guestbook` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `pid` int(11) unsigned NOT NULL COMMENT 'unknow',
  `owner` int(11) unsigned NOT NULL COMMENT '拥有类型（0加盟商，1商品）',
  `owner_id` int(11) unsigned NOT NULL COMMENT '拥有ID',
  `email` varchar(128) NOT NULL COMMENT '邮箱',
  `content` text NOT NULL COMMENT '咨询内容',
  `member_id` int(11) unsigned NOT NULL COMMENT '咨询者ID',
  `gai_number` varchar(32) NOT NULL COMMENT '咨询者盖网编号',
  `ip` int(11) unsigned NOT NULL COMMENT '咨询者IP',
  `create_time` int(11) unsigned NOT NULL COMMENT '咨询时间',
  `reply_content` text NOT NULL COMMENT '回复内容',
  `reply_id` int(11) unsigned NOT NULL COMMENT '回复者ID',
  `reply_username` varchar(128) NOT NULL COMMENT '回复者名称',
  `reply_ip` int(11) unsigned NOT NULL COMMENT '回复者IP',
  `reply_time` int(11) unsigned NOT NULL COMMENT '回复时间',
  `status` tinyint(1) unsigned NOT NULL COMMENT '状态（0未读，1已读，2未审核，3审核通过，4审核不通过）',
  `description` text NOT NULL COMMENT '说明',
  PRIMARY KEY (`id`),
  KEY `member_id` (`member_id`) USING BTREE,
  CONSTRAINT `fk_guestbook_member` FOREIGN KEY (`member_id`) REFERENCES `gw_member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1972 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_heyue
-- ----------------------------
DROP TABLE IF EXISTS `gw_heyue`;
CREATE TABLE `gw_heyue` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `number` varchar(30) DEFAULT NULL COMMENT '号码',
  `price` decimal(12,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '价格',
  `hasfee` decimal(12,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '包含话费',
  `is_lock` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否被占用',
  `type` varchar(30) NOT NULL COMMENT '套餐类型',
  `member_id` int(11) unsigned NOT NULL COMMENT '所属会员',
  `order_id` int(11) unsigned NOT NULL COMMENT '订单ID',
  `name` varchar(20) NOT NULL COMMENT '机主姓名',
  `cardNumber` varchar(32) NOT NULL COMMENT '身份证号码',
  `pic` varchar(100) NOT NULL COMMENT '身份证图片',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '选号码时间',
  `up_status` tinyint(1) unsigned NOT NULL COMMENT '推送状态（0失败，1成功 , 2不存在订单 , 3网络异常）',
  `pay_status` tinyint(1) unsigned NOT NULL COMMENT '支付状态（1未支付，2已支付）',
  `return_order` varchar(100) NOT NULL COMMENT '返回的订单号',
  `number_type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '号码类型0:3G   1:4G',
  PRIMARY KEY (`id`),
  UNIQUE KEY `number` (`number`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_hos_sell_order
-- ----------------------------
DROP TABLE IF EXISTS `gw_hos_sell_order`;
CREATE TABLE `gw_hos_sell_order` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(5) NOT NULL COMMENT '名称',
  `logo` varchar(255) NOT NULL COMMENT '图标',
  `type` tinyint(2) unsigned NOT NULL,
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '状态 0 停用 1启用',
  `link` varchar(128) DEFAULT NULL COMMENT '链接',
  `create_time` int(11) unsigned NOT NULL COMMENT '创建时间',
  `update_time` int(11) unsigned DEFAULT NULL COMMENT '编辑时间',
  `create_user` int(11) unsigned NOT NULL COMMENT '创建者',
  `update_user` int(11) unsigned DEFAULT NULL COMMENT '修改者',
  `sequence` int(11) NOT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='app首页图片排序';

-- ----------------------------
-- Table structure for gw_hotel
-- ----------------------------
DROP TABLE IF EXISTS `gw_hotel`;
CREATE TABLE `gw_hotel` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `keywords` varchar(128) NOT NULL COMMENT '关键词',
  `description` varchar(256) NOT NULL COMMENT '描述',
  `name` varchar(128) NOT NULL COMMENT '名称',
  `level_id` tinyint(3) unsigned NOT NULL COMMENT '等级',
  `brand_id` tinyint(3) unsigned NOT NULL COMMENT '品牌',
  `countries_id` int(11) NOT NULL,
  `province_id` int(11) unsigned NOT NULL COMMENT '省份',
  `city_id` int(11) unsigned NOT NULL COMMENT '城市',
  `district_id` int(11) unsigned NOT NULL COMMENT '区/县',
  `street` varchar(128) NOT NULL COMMENT '详细地址',
  `content` text NOT NULL COMMENT '说明',
  `address_id` int(11) unsigned NOT NULL COMMENT '热门地址',
  `grade_id` tinyint(3) unsigned NOT NULL COMMENT '允许会员级别可见',
  `lng` varchar(128) NOT NULL COMMENT '经度',
  `lat` varchar(128) NOT NULL COMMENT '纬度',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `thumbnail` varchar(128) NOT NULL COMMENT '缩略图',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态（0不发布，1发布）',
  `create_time` int(11) unsigned NOT NULL COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL COMMENT '更新时间',
  `checkout_time` tinyint(3) unsigned NOT NULL COMMENT '最晚退房时间',
  `parking_lot` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '停车场（0无，1有）',
  `meeting_room` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '会议室（0无，1有）',
  `pickup_service` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '接机服务（0无，1有）',
  `comments` int(11) unsigned NOT NULL COMMENT '评论数',
  `min_price` decimal(10,2) NOT NULL COMMENT '最小金额',
  `max_price` decimal(10,2) NOT NULL COMMENT '最大金额',
  `phone` varchar(128) NOT NULL COMMENT '联系电话',
  `total_score` decimal(11,2) unsigned NOT NULL COMMENT '总评分',
  `enter_count` int(11) unsigned NOT NULL COMMENT '入驻数',
  PRIMARY KEY (`id`),
  KEY `level_id` (`level_id`) USING BTREE,
  KEY `brand_id` (`brand_id`) USING BTREE,
  KEY `address_id` (`address_id`) USING BTREE,
  CONSTRAINT `fk_hotel_hotel_level` FOREIGN KEY (`level_id`) REFERENCES `gw_hotel_level` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=982 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_hotel_address
-- ----------------------------
DROP TABLE IF EXISTS `gw_hotel_address`;
CREATE TABLE `gw_hotel_address` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(128) NOT NULL COMMENT '名称',
  `content` text NOT NULL COMMENT '说明',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `countries_id` int(11) NOT NULL COMMENT '国家id',
  `province_id` int(11) unsigned NOT NULL COMMENT '省份',
  `city_id` int(11) unsigned NOT NULL COMMENT '城市',
  `lng` varchar(128) NOT NULL COMMENT '经度',
  `lat` varchar(128) NOT NULL COMMENT '纬度',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_hotel_brand
-- ----------------------------
DROP TABLE IF EXISTS `gw_hotel_brand`;
CREATE TABLE `gw_hotel_brand` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL COMMENT '品牌名称',
  `description` varchar(256) NOT NULL COMMENT '品牌说明',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `logo` varchar(128) NOT NULL COMMENT 'LOGO',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_hotel_level
-- ----------------------------
DROP TABLE IF EXISTS `gw_hotel_level`;
CREATE TABLE `gw_hotel_level` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL COMMENT '等级名称',
  `description` varchar(256) NOT NULL COMMENT '等级说明',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '255' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_hotel_order
-- ----------------------------
DROP TABLE IF EXISTS `gw_hotel_order`;
CREATE TABLE `gw_hotel_order` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `amount_returned` decimal(11,2) NOT NULL COMMENT '返还金额',
  `code` varchar(32) NOT NULL COMMENT '编号',
  `member_id` int(11) unsigned NOT NULL COMMENT '所属会员',
  `hotel_id` int(11) unsigned NOT NULL COMMENT '所属酒店',
  `hotel_name` varchar(128) NOT NULL COMMENT '酒店名称',
  `room_id` int(11) unsigned NOT NULL COMMENT '所属房间',
  `room_name` varchar(128) NOT NULL COMMENT '客户名称',
  `breakfast` varchar(128) NOT NULL COMMENT '早餐',
  `bed` varchar(128) NOT NULL COMMENT '床型',
  `settled_time` int(11) unsigned NOT NULL COMMENT '入驻日期',
  `leave_time` int(11) unsigned NOT NULL COMMENT '离开日期',
  `earliest_time` varchar(64) NOT NULL COMMENT '最早到达',
  `latest_time` varchar(64) NOT NULL COMMENT '最迟到达',
  `rooms` tinyint(3) unsigned NOT NULL COMMENT '房间数',
  `peoples` tinyint(3) unsigned NOT NULL COMMENT '人数',
  `people_infos` text NOT NULL COMMENT '人员信息',
  `contact` varchar(128) NOT NULL COMMENT '联系人',
  `mobile` varchar(16) NOT NULL COMMENT '手机号码',
  `unit_price` decimal(11,2) NOT NULL COMMENT '单价',
  `unit_gai_price` decimal(11,2) NOT NULL COMMENT '盖网价',
  `payed_price` decimal(11,2) NOT NULL COMMENT '已支付',
  `unpay_price` decimal(11,2) NOT NULL COMMENT '未支付',
  `total_price` decimal(11,2) NOT NULL COMMENT '总价',
  `pay_status` tinyint(1) unsigned NOT NULL COMMENT '支付状态（1未支付，2已支付）',
  `status` tinyint(1) unsigned NOT NULL COMMENT '状态（0新订单，1订单确认，2订单完成，3订单关闭）',
  `score` decimal(2,1) NOT NULL DEFAULT '0.0' COMMENT '评分',
  `comment` text NOT NULL COMMENT '评论内容',
  `create_time` int(11) unsigned NOT NULL COMMENT '下单时间',
  `pay_time` int(11) unsigned NOT NULL COMMENT '支付时间',
  `confirm_time` int(11) unsigned NOT NULL COMMENT '确认时间',
  `comment_time` int(11) unsigned NOT NULL COMMENT '评论时间',
  `is_lottery` tinyint(1) unsigned NOT NULL COMMENT '是否抽奖（0否，1是）',
  `lottery_price` decimal(11,2) NOT NULL COMMENT '抽奖金额',
  `lottery_radio` decimal(11,2) NOT NULL COMMENT '抽奖系数',
  `price_radio` decimal(11,2) NOT NULL COMMENT '供货价系数',
  `gai_income` tinyint(3) unsigned NOT NULL COMMENT '盖网收入',
  `refund_radio` decimal(11,2) NOT NULL COMMENT '手续费率',
  `complete_time` int(11) unsigned NOT NULL COMMENT '完成时间',
  `live_time` int(11) unsigned NOT NULL COMMENT '最终入驻时间',
  `is_recon` tinyint(1) unsigned NOT NULL COMMENT '是否对账',
  `refund` decimal(11,2) NOT NULL COMMENT '手续费',
  `confirm_user` varchar(128) NOT NULL COMMENT '确认人',
  `recon_user` varchar(128) NOT NULL COMMENT '对账人',
  `recon_time` int(11) unsigned NOT NULL COMMENT '对账时间',
  `remark` text NOT NULL COMMENT '特殊要求',
  `distribution_ratio` text NOT NULL COMMENT '分配比率',
  `extend` text NOT NULL COMMENT '扩展信息',
  `parent_code` varchar(128) NOT NULL COMMENT '网银支付订单号',
  `cancle_time` int(11) unsigned NOT NULL COMMENT '取消时间',
  `is_check` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否核对（0否、1是）',
  `check_time` int(11) unsigned NOT NULL COMMENT '核对时间',
  `check_user` varchar(128) NOT NULL COMMENT '核对人',
  `check_remark` text NOT NULL COMMENT '核对备注',
  `source` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '来源（1网站、2ANDROID客户端、3IOS客户端）',
  `pay_type` tinyint(1) unsigned NOT NULL COMMENT '支付方式（1积分、2抵换券、3环迅、4银联、5翼支付、6汇卡）',
  `hotel_provider_id` int(11) unsigned NOT NULL COMMENT '所属酒店供应商',
  `is_sign` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否签收（0否、1是）',
  `sign_remark` text COMMENT '签收备注',
  `sign_user` varchar(128) DEFAULT '' COMMENT '签收人',
  `sign_time` int(11) unsigned DEFAULT NULL COMMENT '签收时间',
  `comment_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '酒店订单评论 1 好评 2中评 3差评(目前只用于优选APP)',
  `is_anonymity` tinyint(1) NOT NULL DEFAULT '0' COMMENT '酒店订单评论匿名标示 0 匿名 1 不匿名(目前只用于优选APP)',
  PRIMARY KEY (`id`),
  KEY `member_id` (`member_id`) USING BTREE,
  KEY `hotel_id` (`hotel_id`) USING BTREE,
  KEY `room_id` (`room_id`) USING BTREE,
  KEY `code` (`code`) USING BTREE,
  KEY `pay_status` (`pay_status`) USING BTREE,
  KEY `status` (`status`) USING BTREE,
  KEY `is_lottery` (`is_lottery`) USING BTREE,
  KEY `is_recon` (`is_recon`) USING BTREE,
  KEY `is_check` (`is_check`) USING BTREE,
  KEY `source` (`source`) USING BTREE,
  KEY `pay_type` (`pay_type`) USING BTREE,
  KEY `hotel_provider_id` (`hotel_provider_id`) USING BTREE,
  CONSTRAINT `fk_hotel_order_hotel` FOREIGN KEY (`hotel_id`) REFERENCES `gw_hotel` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_hotel_order_hotel_room` FOREIGN KEY (`room_id`) REFERENCES `gw_hotel_room` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_hotel_order_member` FOREIGN KEY (`member_id`) REFERENCES `gw_member` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5430 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_hotel_order_follow
-- ----------------------------
DROP TABLE IF EXISTS `gw_hotel_order_follow`;
CREATE TABLE `gw_hotel_order_follow` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) unsigned NOT NULL COMMENT '酒店订单Id',
  `status` tinyint(3) unsigned NOT NULL COMMENT '订单状态',
  `content` text NOT NULL COMMENT '跟进内容',
  `creater` varchar(128) NOT NULL COMMENT '跟进人',
  `create_time` int(11) unsigned zerofill NOT NULL COMMENT '跟进时间',
  PRIMARY KEY (`id`),
  KEY `orderId` (`order_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COMMENT='酒店订单跟进记录';

-- ----------------------------
-- Table structure for gw_hotel_picture
-- ----------------------------
DROP TABLE IF EXISTS `gw_hotel_picture`;
CREATE TABLE `gw_hotel_picture` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `target_id` int(11) unsigned NOT NULL COMMENT '所属',
  `path` varchar(128) NOT NULL COMMENT '路径',
  `type` tinyint(1) unsigned NOT NULL COMMENT '类型',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`),
  KEY `target_id` (`target_id`) USING BTREE,
  KEY `target_id_2` (`target_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20323 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_hotel_provider
-- ----------------------------
DROP TABLE IF EXISTS `gw_hotel_provider`;
CREATE TABLE `gw_hotel_provider` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(128) NOT NULL COMMENT '名称',
  `sort` tinyint(255) unsigned NOT NULL COMMENT '排序',
  `member_id` int(11) unsigned NOT NULL COMMENT '所属会员',
  PRIMARY KEY (`id`),
  KEY `member_id` (`member_id`) USING BTREE,
  CONSTRAINT `fk_hotel_provider_member` FOREIGN KEY (`member_id`) REFERENCES `gw_member` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_hotel_room
-- ----------------------------
DROP TABLE IF EXISTS `gw_hotel_room`;
CREATE TABLE `gw_hotel_room` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(128) NOT NULL COMMENT '名称',
  `hotel_id` int(11) unsigned NOT NULL COMMENT '所属酒店',
  `num` tinyint(3) unsigned NOT NULL COMMENT '数量',
  `content` text NOT NULL COMMENT '内容',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `thumbnail` varchar(128) NOT NULL COMMENT '缩略图',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态（0不发布，1发布）',
  `bed` tinyint(1) NOT NULL COMMENT '床型（1）',
  `breadfast` tinyint(1) NOT NULL COMMENT '早餐',
  `unit_price` decimal(11,2) unsigned NOT NULL COMMENT '单价',
  `network` tinyint(1) unsigned NOT NULL COMMENT '网络',
  `estimate_price` decimal(11,2) NOT NULL COMMENT '预估供货价',
  `estimate_back_credits` decimal(11,2) unsigned NOT NULL COMMENT '预估返还积分',
  `gai_income` tinyint(3) unsigned NOT NULL COMMENT '盖网收入',
  `create_time` int(11) unsigned NOT NULL COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL COMMENT '更新时间',
  `event_name` varchar(128) NOT NULL COMMENT '活动名称',
  `activities_price` decimal(11,2) unsigned NOT NULL COMMENT '活动时期价格',
  `activities_start` int(11) unsigned NOT NULL COMMENT '活动结束时间',
  `activities_end` int(11) unsigned NOT NULL COMMENT '活动结束时间',
  `enter_count` int(11) unsigned NOT NULL COMMENT '入驻次数',
  PRIMARY KEY (`id`),
  KEY `hotel_id` (`hotel_id`) USING BTREE,
  CONSTRAINT `fk_hotel_room_hotel` FOREIGN KEY (`hotel_id`) REFERENCES `gw_hotel` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2753 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_import_member
-- ----------------------------
DROP TABLE IF EXISTS `gw_import_member`;
CREATE TABLE `gw_import_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL COMMENT '用户id',
  `cash` decimal(12,2) NOT NULL COMMENT '金额',
  `gai_number` varchar(32) NOT NULL COMMENT '盖网编号',
  `update_time` int(11) NOT NULL COMMENT '创建或者更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_import_member_log
-- ----------------------------
DROP TABLE IF EXISTS `gw_import_member_log`;
CREATE TABLE `gw_import_member_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '操作人id',
  `type` tinyint(1) NOT NULL COMMENT '操作类型 1.开户，2.充值，3.开户并充值',
  `file` varchar(128) NOT NULL COMMENT '上传的文件',
  `status` tinyint(1) NOT NULL COMMENT '状态，0 成功，1 失败',
  `data` tinytext NOT NULL COMMENT 'json数据',
  `create_time` int(11) NOT NULL COMMENT '操作时间',
  `mark` varchar(128) NOT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_import_recharge_record
-- ----------------------------
DROP TABLE IF EXISTS `gw_import_recharge_record`;
CREATE TABLE `gw_import_recharge_record` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `gai_number` varchar(128) NOT NULL COMMENT 'GW号',
  `mobile` varchar(32) NOT NULL COMMENT '手机号',
  `code` varchar(256) NOT NULL COMMENT '加密串',
  `money` decimal(18,2) unsigned NOT NULL COMMENT '金额',
  `money_before` decimal(18,2) unsigned NOT NULL COMMENT '充值前金额',
  `money_after` decimal(18,2) unsigned NOT NULL COMMENT '充值后金额',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '2' COMMENT '充值结果（2为失败，1为成功）',
  `detail` text NOT NULL COMMENT '相关数据',
  `create_time` int(11) unsigned NOT NULL COMMENT '创建时间',
  `member_id` int(11) unsigned NOT NULL COMMENT '所属会员',
  `batch_number` int(11) unsigned NOT NULL COMMENT '批号',
  `record_status` tinyint(1) unsigned NOT NULL COMMENT '状态（1 已充值 2 未充值）',
  `card_number` varchar(128) NOT NULL COMMENT '充值卡号',
  `send_sms` tinyint(3) unsigned NOT NULL COMMENT '是否发送短信（0 不发送 1 发送）',
  `free_sms` varchar(128) NOT NULL COMMENT '自定义后续短信',
  PRIMARY KEY (`id`),
  UNIQUE KEY `card_number` (`card_number`) USING BTREE,
  KEY `member_id` (`member_id`) USING BTREE,
  KEY `record_status` (`record_status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21459 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_interest
-- ----------------------------
DROP TABLE IF EXISTS `gw_interest`;
CREATE TABLE `gw_interest` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(128) NOT NULL COMMENT '爱好名称',
  `category_id` smallint(5) unsigned NOT NULL COMMENT '所属分类',
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`) USING BTREE,
  CONSTRAINT `fk_interest_interest_category` FOREIGN KEY (`category_id`) REFERENCES `gw_interest_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_interest_category
-- ----------------------------
DROP TABLE IF EXISTS `gw_interest_category`;
CREATE TABLE `gw_interest_category` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(128) NOT NULL COMMENT '名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_keyword
-- ----------------------------
DROP TABLE IF EXISTS `gw_keyword`;
CREATE TABLE `gw_keyword` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(128) NOT NULL COMMENT '名称',
  `searches` int(11) unsigned NOT NULL COMMENT '搜索次数',
  `products` int(11) unsigned NOT NULL COMMENT '商品数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2860 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_link
-- ----------------------------
DROP TABLE IF EXISTS `gw_link`;
CREATE TABLE `gw_link` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(128) NOT NULL COMMENT '网站名称',
  `url` varchar(128) NOT NULL COMMENT '网站URL',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '255' COMMENT '排序',
  `position` tinyint(3) unsigned NOT NULL COMMENT '显示位置（0默认1首页）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_lodger_info
-- ----------------------------
DROP TABLE IF EXISTS `gw_lodger_info`;
CREATE TABLE `gw_lodger_info` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(128) NOT NULL COMMENT '姓名',
  `more` text NOT NULL COMMENT '更多信息',
  `member_id` int(11) unsigned NOT NULL COMMENT '所属会员',
  `token` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `member_id` (`member_id`) USING BTREE,
  CONSTRAINT `fk_lodger_info_member` FOREIGN KEY (`member_id`) REFERENCES `gw_member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4814 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_login_history
-- ----------------------------
DROP TABLE IF EXISTS `gw_login_history`;
CREATE TABLE `gw_login_history` (
  `create_time` int(11) unsigned NOT NULL COMMENT '时间',
  `ip` int(11) unsigned NOT NULL COMMENT 'IP',
  `member_id` int(11) unsigned NOT NULL,
  KEY `member_id` (`member_id`) USING BTREE,
  CONSTRAINT `fk_login_history_member` FOREIGN KEY (`member_id`) REFERENCES `gw_member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_mailbox
-- ----------------------------
DROP TABLE IF EXISTS `gw_mailbox`;
CREATE TABLE `gw_mailbox` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态（0未读、1已读）',
  `message_id` int(11) unsigned NOT NULL COMMENT '所属站内信',
  `member_id` int(11) unsigned NOT NULL COMMENT '所属会员',
  PRIMARY KEY (`id`),
  KEY `message_id` (`message_id`) USING BTREE,
  KEY `member_id` (`member_id`) USING BTREE,
  CONSTRAINT `gw_mailbox_member` FOREIGN KEY (`member_id`) REFERENCES `gw_member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `gw_mailbox_message` FOREIGN KEY (`message_id`) REFERENCES `gw_message` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_member
-- ----------------------------
DROP TABLE IF EXISTS `gw_member`;
CREATE TABLE `gw_member` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `logins` int(11) unsigned NOT NULL COMMENT '登录次数',
  `signins` int(11) unsigned NOT NULL COMMENT '签到次数',
  `grade_points` int(11) unsigned NOT NULL COMMENT '用户级别分（增长规则后续再定）',
  `gai_number` varchar(32) NOT NULL COMMENT '盖网编号',
  `referrals_id` int(11) unsigned NOT NULL COMMENT '推荐人',
  `username` varchar(128) NOT NULL COMMENT '用户名',
  `password` varchar(128) NOT NULL COMMENT '密码',
  `salt` varchar(128) NOT NULL COMMENT '唯一密钥',
  `sex` tinyint(1) unsigned NOT NULL COMMENT '性别',
  `real_name` varchar(128) NOT NULL COMMENT '真实姓名',
  `type_id` tinyint(3) unsigned NOT NULL COMMENT '类型',
  `grade_id` tinyint(3) unsigned NOT NULL COMMENT '级别',
  `password2` varchar(128) NOT NULL COMMENT '二级密码',
  `password3` varchar(128) NOT NULL COMMENT '三级密码',
  `birthday` int(11) unsigned NOT NULL COMMENT '生日',
  `email` varchar(128) NOT NULL COMMENT '邮箱',
  `mobile` varchar(128) NOT NULL COMMENT '手机号码',
  `country_id` int(11) unsigned NOT NULL COMMENT '国家',
  `province_id` int(11) unsigned NOT NULL COMMENT '省份',
  `city_id` int(11) unsigned NOT NULL COMMENT '城市',
  `district_id` int(11) unsigned NOT NULL COMMENT '区/县',
  `street` varchar(128) NOT NULL COMMENT '详细地址',
  `register_time` int(11) unsigned NOT NULL COMMENT '注册时间',
  `register_type` tinyint(1) unsigned NOT NULL COMMENT '注册类型（0默认，1盖网机，2盖网，3手机短信，4手机APP）',
  `head_portrait` varchar(128) NOT NULL COMMENT '头像',
  `status` tinyint(1) unsigned NOT NULL COMMENT '状态（0待激活，1正常，2删除，3除名）',
  `is_internal` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '内部会员（0否，1是）',
  `is_master_account` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否主账号（0否，1是）',
  `identity_type` tinyint(1) unsigned NOT NULL COMMENT '证件类型',
  `identity_number` varchar(128) NOT NULL COMMENT '证件号码',
  `last_login_time` int(11) unsigned NOT NULL COMMENT '上次登录时间',
  `current_login_time` int(11) unsigned NOT NULL COMMENT '当前登录时间',
  `nickname` varchar(128) NOT NULL COMMENT '昵称',
  `member_type` tinyint(3) unsigned NOT NULL COMMENT 'member_type',
  `card_num` varchar(128) NOT NULL COMMENT 'card_num',
  `area_code` int(11) unsigned NOT NULL COMMENT 'area_code',
  `role` tinyint(4) NOT NULL DEFAULT '0' COMMENT '角色:0正常GW,1预设GW号',
  `enterprise_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '所属企业',
  `referrals_time` int(11) unsigned NOT NULL COMMENT '更新推荐人时间',
  `flag` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '激活状态（0未激活、1已激活）',
  `activation_time` int(11) unsigned NOT NULL COMMENT '激活时间',
  `active_email` tinyint(4) NOT NULL DEFAULT '0' COMMENT '邮箱认证(1激活，0未激活)',
  `pay_limit_daily` decimal(10,2) unsigned DEFAULT '20000.00' COMMENT '每日积分支付限额',
  `nopwd_pay_limit_id` int(11) NOT NULL DEFAULT '0' COMMENT '盖付通免密码支付额度id',
  `nopwd_status` tinyint(1) NOT NULL COMMENT '盖付通小额免密状态',
  PRIMARY KEY (`id`),
  KEY `referrals_id` (`referrals_id`) USING BTREE,
  KEY `status` (`status`) USING BTREE,
  KEY `role` (`role`) USING BTREE,
  KEY `enterprise_id` (`enterprise_id`) USING BTREE,
  KEY `mobile` (`mobile`) USING BTREE,
  KEY `gai_number` (`gai_number`) USING BTREE,
  KEY `register_type` (`register_type`) USING BTREE,
  KEY `type_id` (`type_id`) USING BTREE,
  KEY `email` (`email`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1667022 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_member_account
-- ----------------------------
DROP TABLE IF EXISTS `gw_member_account`;
CREATE TABLE `gw_member_account` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `money` decimal(10,2) unsigned NOT NULL COMMENT '金额',
  `valid_end` int(11) unsigned NOT NULL COMMENT '失效时间',
  `member_id` int(11) unsigned NOT NULL COMMENT '所属会员',
  PRIMARY KEY (`id`),
  KEY `member_id` (`member_id`) USING BTREE,
  KEY `valid_end` (`valid_end`) USING BTREE,
  CONSTRAINT `fk_member_account_member` FOREIGN KEY (`member_id`) REFERENCES `gw_member` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=165207 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_member_account_log
-- ----------------------------
DROP TABLE IF EXISTS `gw_member_account_log`;
CREATE TABLE `gw_member_account_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `money` decimal(10,2) unsigned NOT NULL COMMENT '使用金额',
  `create_time` int(11) unsigned NOT NULL COMMENT '使用时间',
  `member_id` int(11) unsigned NOT NULL COMMENT '所属会员',
  PRIMARY KEY (`id`),
  KEY `member_id` (`member_id`) USING BTREE,
  CONSTRAINT `fk_member_account_log_member` FOREIGN KEY (`member_id`) REFERENCES `gw_member` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6469 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_member_auth
-- ----------------------------
DROP TABLE IF EXISTS `gw_member_auth`;
CREATE TABLE `gw_member_auth` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `req_id` varchar(32) NOT NULL COMMENT '验证流水号',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '验证是否通过',
  `bank_code` varchar(64) NOT NULL COMMENT '银行代码',
  `account_no` char(19) NOT NULL COMMENT '开户账号',
  `account_name` varchar(64) NOT NULL DEFAULT '' COMMENT '开户姓名',
  `mobile` varchar(32) NOT NULL COMMENT '银行预留手机号',
  `card_id` varchar(32) NOT NULL COMMENT '身份证号',
  `create_time` int(11) unsigned NOT NULL COMMENT '验证时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='账户验证';

-- ----------------------------
-- Table structure for gw_member_conversation
-- ----------------------------
DROP TABLE IF EXISTS `gw_member_conversation`;
CREATE TABLE `gw_member_conversation` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `gai_number` varchar(32) NOT NULL COMMENT '盖网号',
  `phone` varchar(11) NOT NULL COMMENT '手机号码',
  `uid` varchar(10) NOT NULL DEFAULT '' COMMENT '通话系统会员编号',
  `sign` varchar(34) NOT NULL COMMENT '安全码',
  `createtime` varchar(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='盖网帐号与通话系统帐号对应表';

-- ----------------------------
-- Table structure for gw_member_daily_consumption_record
-- ----------------------------
DROP TABLE IF EXISTS `gw_member_daily_consumption_record`;
CREATE TABLE `gw_member_daily_consumption_record` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(11) unsigned NOT NULL COMMENT '会员id',
  `date` date NOT NULL COMMENT '日期',
  `amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '累计消费金额',
  `times` int(11) unsigned DEFAULT '1' COMMENT '次数',
  PRIMARY KEY (`id`),
  UNIQUE KEY `member_id` (`member_id`,`date`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='会员每日消费记录';

-- ----------------------------
-- Table structure for gw_member_exten
-- ----------------------------
DROP TABLE IF EXISTS `gw_member_exten`;
CREATE TABLE `gw_member_exten` (
  `member_id` int(11) unsigned NOT NULL COMMENT '会员主键',
  `promotion_id` int(11) unsigned NOT NULL COMMENT '在哪个推广下注册的',
  PRIMARY KEY (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for gw_member_good_number
-- ----------------------------
DROP TABLE IF EXISTS `gw_member_good_number`;
CREATE TABLE `gw_member_good_number` (
  `number` varchar(12) NOT NULL COMMENT 'GW号,不包含GW字符',
  `status` tinyint(1) unsigned DEFAULT '0' COMMENT '状态,0未注册,1已注册,2预留',
  `type` varchar(8) NOT NULL COMMENT 'AAAA,ABAB...',
  PRIMARY KEY (`number`),
  KEY `status` (`status`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='GW靓号';

-- ----------------------------
-- Table structure for gw_member_good_number_bind_log
-- ----------------------------
DROP TABLE IF EXISTS `gw_member_good_number_bind_log`;
CREATE TABLE `gw_member_good_number_bind_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `good_number` varchar(14) DEFAULT NULL,
  `old_number` varchar(14) DEFAULT NULL,
  `menber_id` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='靓号绑定记录';

-- ----------------------------
-- Table structure for gw_member_grade
-- ----------------------------
DROP TABLE IF EXISTS `gw_member_grade`;
CREATE TABLE `gw_member_grade` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(128) NOT NULL COMMENT '名称',
  `description` varchar(256) NOT NULL COMMENT '说明',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_member_login_log
-- ----------------------------
DROP TABLE IF EXISTS `gw_member_login_log`;
CREATE TABLE `gw_member_login_log` (
  `member_id` int(11) unsigned NOT NULL COMMENT '会员主键',
  `login_time` int(11) unsigned NOT NULL COMMENT '登陆时间',
  `ip` varchar(20) NOT NULL COMMENT 'ip'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for gw_member_mobile_imsi
-- ----------------------------
DROP TABLE IF EXISTS `gw_member_mobile_imsi`;
CREATE TABLE `gw_member_mobile_imsi` (
  `mobile` varchar(20) NOT NULL COMMENT '手机号',
  `member_id` int(11) unsigned NOT NULL COMMENT '会员id',
  `imsi` varchar(128) NOT NULL COMMENT 'sim卡imsi码',
  `update_time` int(11) unsigned DEFAULT '0' COMMENT '更新时间',
  `last_imsi` varchar(128) DEFAULT NULL COMMENT '上一个imsi码',
  `is_push` tinyint(2) unsigned DEFAULT '0' COMMENT '判断是否推送信息',
  `is_open` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否开启指纹支付  0 默认未开启   1表示开启',
  PRIMARY KEY (`mobile`,`member_id`),
  KEY `member_id` (`member_id`) USING BTREE,
  KEY `imsi` (`imsi`) USING BTREE,
  KEY `is_push` (`is_push`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for gw_member_point
-- ----------------------------
DROP TABLE IF EXISTS `gw_member_point`;
CREATE TABLE `gw_member_point` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL COMMENT '会员id',
  `grade_id` tinyint(2) NOT NULL COMMENT '会员等级',
  `day_limit_point` decimal(18,2) unsigned NOT NULL COMMENT '日可用额度',
  `day_point` decimal(18,2) unsigned NOT NULL COMMENT '日额度',
  `month_point` decimal(18,2) unsigned NOT NULL COMMENT '月额度',
  `month_limit_point` decimal(18,2) unsigned NOT NULL COMMENT '月可用额度',
  `special_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否需要人工修改（0不需要,1需要）',
  `create_time` int(11) unsigned NOT NULL COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL COMMENT '更新时间',
  `admin` int(11) NOT NULL COMMENT '创建人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='会员积分消费额度表';

-- ----------------------------
-- Table structure for gw_member_point_grade
-- ----------------------------
DROP TABLE IF EXISTS `gw_member_point_grade`;
CREATE TABLE `gw_member_point_grade` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `grade_name` varchar(64) NOT NULL COMMENT '会员等级',
  `grade_point` decimal(18,2) NOT NULL COMMENT '等级积分数',
  `day_usable_point` decimal(18,2) NOT NULL COMMENT '日可用额度',
  `month_usable_point` decimal(18,2) NOT NULL COMMENT '月可用额度',
  `create_time` int(11) unsigned NOT NULL COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL COMMENT '更新时间',
  `admin` int(11) NOT NULL COMMENT '创建人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='会员积分消费额度等级表';

-- ----------------------------
-- Table structure for gw_member_profile
-- ----------------------------
DROP TABLE IF EXISTS `gw_member_profile`;
CREATE TABLE `gw_member_profile` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `member_id` int(11) unsigned NOT NULL COMMENT '所属会员',
  `interest_id` int(11) unsigned NOT NULL COMMENT '所属爱好',
  `update_time` int(11) unsigned NOT NULL COMMENT '更新时间',
  `show` tinyint(1) unsigned NOT NULL COMMENT '可见（0全部可见，1自己可见）',
  `interest_category_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `member_id` (`member_id`) USING BTREE,
  KEY `interest_id` (`interest_id`) USING BTREE,
  KEY `interest_category_id` (`interest_category_id`) USING BTREE,
  CONSTRAINT `fk_member_profile_interest` FOREIGN KEY (`interest_id`) REFERENCES `gw_interest` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_member_profile_interest_category` FOREIGN KEY (`interest_category_id`) REFERENCES `gw_interest_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_member_profile_member` FOREIGN KEY (`member_id`) REFERENCES `gw_member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20603 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_member_register_number_limit
-- ----------------------------
DROP TABLE IF EXISTS `gw_member_register_number_limit`;
CREATE TABLE `gw_member_register_number_limit` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `number_start` varchar(12) NOT NULL,
  `number_end` varchar(12) NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态:0未开放,1已开放',
  `create_admin_id` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  `update_admin_id` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='gw注册号段管理';

-- ----------------------------
-- Table structure for gw_member_role
-- ----------------------------
DROP TABLE IF EXISTS `gw_member_role`;
CREATE TABLE `gw_member_role` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(128) NOT NULL COMMENT '名称',
  `code` varchar(56) NOT NULL COMMENT '编码',
  `thumbnail` varchar(128) NOT NULL COMMENT '缩略图',
  `deadline` smallint(5) unsigned NOT NULL COMMENT '期限（天）',
  `description` varchar(256) NOT NULL COMMENT '说明',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_member_sign_account
-- ----------------------------
DROP TABLE IF EXISTS `gw_member_sign_account`;
CREATE TABLE `gw_member_sign_account` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `member_id` int(11) unsigned NOT NULL COMMENT '所属会员',
  `account_name` varchar(128) NOT NULL COMMENT '账户名',
  `street` varchar(128) NOT NULL COMMENT '详细地址',
  `bank_name` varchar(128) NOT NULL COMMENT '开户银行',
  `account` varchar(128) NOT NULL COMMENT '账号',
  `identity_card` varchar(128) NOT NULL COMMENT '身份证号码',
  `identity_image` varchar(128) NOT NULL COMMENT '身份证正面照片',
  `identity_image2` varchar(128) NOT NULL COMMENT '身份证反面照片',
  `is_approved` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否通过审核',
  `source` tinyint(1) unsigned NOT NULL COMMENT '来源（0、SKU   1、盖象）',
  PRIMARY KEY (`id`),
  KEY `member_id` (`member_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='个人商家网签信息表';

-- ----------------------------
-- Table structure for gw_member_timeline
-- ----------------------------
DROP TABLE IF EXISTS `gw_member_timeline`;
CREATE TABLE `gw_member_timeline` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `franchisee_name` varchar(128) NOT NULL COMMENT '加盟商名称',
  `type` tinyint(1) unsigned NOT NULL COMMENT '业务类型(1消费  2签到 3评价)',
  `member_id` int(11) unsigned NOT NULL COMMENT '会员id',
  `franchisee_id` int(11) unsigned NOT NULL COMMENT '加盟商id',
  `source_type` int(11) unsigned NOT NULL COMMENT '来源类型（1盖网通 2手机APP）',
  `create_time` int(11) unsigned NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `member_id` (`member_id`) USING BTREE,
  KEY `franchisee_id` (`franchisee_id`) USING BTREE,
  CONSTRAINT `fk_member_timeline_franchisee` FOREIGN KEY (`franchisee_id`) REFERENCES `gw_franchisee_bak` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_member_timeline_member` FOREIGN KEY (`member_id`) REFERENCES `gw_member` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_member_to_role
-- ----------------------------
DROP TABLE IF EXISTS `gw_member_to_role`;
CREATE TABLE `gw_member_to_role` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `member_id` int(11) unsigned NOT NULL COMMENT '所属会员',
  `member_role_id` int(11) unsigned NOT NULL COMMENT '所属角色',
  `service_start_time` int(11) unsigned NOT NULL COMMENT '服务开始时间',
  `service_end_time` int(11) unsigned NOT NULL COMMENT '服务结束时间',
  PRIMARY KEY (`id`),
  KEY `member_id` (`member_id`,`member_role_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_member_token
-- ----------------------------
DROP TABLE IF EXISTS `gw_member_token`;
CREATE TABLE `gw_member_token` (
  `token` varchar(128) NOT NULL COMMENT '标识',
  `target_id` int(11) unsigned NOT NULL COMMENT '登录人所属的id',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '登录人的类型（1会员、2加盟商、3店员）',
  `start_time` int(11) unsigned NOT NULL COMMENT '开始时间',
  `end_time` int(11) unsigned NOT NULL COMMENT '结束时间',
  `info` varchar(128) NOT NULL COMMENT '序列化储存登录信息',
  `app_type` tinyint(2) unsigned DEFAULT '0' COMMENT '应用类型,1盖付通,3盖象app',
  PRIMARY KEY (`token`),
  UNIQUE KEY `target_id_type` (`target_id`,`app_type`) USING BTREE,
  KEY `app_type` (`app_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_member_type
-- ----------------------------
DROP TABLE IF EXISTS `gw_member_type`;
CREATE TABLE `gw_member_type` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(128) NOT NULL COMMENT '名称',
  `exchange` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '兑换现金',
  `ratio` decimal(5,2) unsigned NOT NULL COMMENT '兑换比率',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `discount` decimal(10,2) NOT NULL COMMENT '折扣',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_message
-- ----------------------------
DROP TABLE IF EXISTS `gw_message`;
CREATE TABLE `gw_message` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(128) NOT NULL COMMENT '标题',
  `content` text NOT NULL COMMENT '内容',
  `create_time` int(11) unsigned NOT NULL COMMENT '创建时间',
  `sender` varchar(64) NOT NULL COMMENT '发送者名',
  `sender_id` int(11) unsigned NOT NULL COMMENT '发送者ID',
  `receipt_time` int(11) unsigned NOT NULL COMMENT '接收时间',
  PRIMARY KEY (`id`),
  KEY `receipt_time` (`receipt_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_middle_agent
-- ----------------------------
DROP TABLE IF EXISTS `gw_middle_agent`;
CREATE TABLE `gw_middle_agent` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号id',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级id',
  `member_id` int(10) unsigned NOT NULL COMMENT '会员id',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺id',
  `level` tinyint(3) unsigned NOT NULL DEFAULT '3' COMMENT '级别（0,1,2,3）',
  `create_time` int(10) unsigned NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`) USING BTREE,
  KEY `store_id` (`store_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=859 DEFAULT CHARSET=utf8 COMMENT='居间合作商关系表';

-- ----------------------------
-- Table structure for gw_nationality
-- ----------------------------
DROP TABLE IF EXISTS `gw_nationality`;
CREATE TABLE `gw_nationality` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(128) NOT NULL COMMENT '名称',
  `sort` tinyint(3) unsigned NOT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_oauth2server_client_endpoints
-- ----------------------------
DROP TABLE IF EXISTS `gw_oauth2server_client_endpoints`;
CREATE TABLE `gw_oauth2server_client_endpoints` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `redirect_uri` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for gw_oauth2server_clients
-- ----------------------------
DROP TABLE IF EXISTS `gw_oauth2server_clients`;
CREATE TABLE `gw_oauth2server_clients` (
  `id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `secret` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auto_approve` int(11) DEFAULT '0' COMMENT '是否需要用户确认授权',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='0auth2授权客户端';

-- ----------------------------
-- Table structure for gw_oauth2server_scopes
-- ----------------------------
DROP TABLE IF EXISTS `gw_oauth2server_scopes`;
CREATE TABLE `gw_oauth2server_scopes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `scope` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='oauth2权限';

-- ----------------------------
-- Table structure for gw_oauth2server_session_scopes
-- ----------------------------
DROP TABLE IF EXISTS `gw_oauth2server_session_scopes`;
CREATE TABLE `gw_oauth2server_session_scopes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` int(11) NOT NULL,
  `scope_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for gw_oauth2server_sessions
-- ----------------------------
DROP TABLE IF EXISTS `gw_oauth2server_sessions`;
CREATE TABLE `gw_oauth2server_sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `redirect_uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `owner_type` varchar(6) COLLATE utf8_unicode_ci DEFAULT 'user',
  `owner_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `auth_code` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `access_token` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `refresh_token` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `access_token_expires` int(11) DEFAULT NULL,
  `stage` varchar(9) COLLATE utf8_unicode_ci DEFAULT 'requested',
  `first_requested` int(11) DEFAULT NULL,
  `last_updated` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for gw_offline_distribution
-- ----------------------------
DROP TABLE IF EXISTS `gw_offline_distribution`;
CREATE TABLE `gw_offline_distribution` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `machine_id` int(11) unsigned NOT NULL COMMENT '盖机id',
  `distribution` text,
  `record_type` tinyint(2) unsigned NOT NULL COMMENT '属于线下什么机器',
  PRIMARY KEY (`id`),
  KEY `machine_id` (`machine_id`),
  KEY `record_type` (`record_type`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for gw_offline_role
-- ----------------------------
DROP TABLE IF EXISTS `gw_offline_role`;
CREATE TABLE `gw_offline_role` (
  `role_id` tinyint(4) unsigned NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `role_name` varchar(200) DEFAULT NULL,
  `rate` decimal(5,2) unsigned DEFAULT NULL COMMENT '比率',
  `admin_id` int(11) unsigned DEFAULT NULL COMMENT '管理员',
  `update_time` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for gw_offline_role_copy
-- ----------------------------
DROP TABLE IF EXISTS `gw_offline_role_copy`;
CREATE TABLE `gw_offline_role_copy` (
  `role_id` tinyint(4) unsigned NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `role_name` varchar(200) DEFAULT NULL,
  `rate` decimal(5,2) unsigned DEFAULT NULL COMMENT '比率',
  `admin_id` int(11) unsigned DEFAULT NULL COMMENT '管理员',
  `update_time` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_offline_role_relation
-- ----------------------------
DROP TABLE IF EXISTS `gw_offline_role_relation`;
CREATE TABLE `gw_offline_role_relation` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '会员id',
  `role_id` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '角色id',
  `machine_id` int(11) DEFAULT '0',
  `region_id` mediumint(8) unsigned DEFAULT '0' COMMENT '省市区',
  `admin_id` int(11) unsigned DEFAULT '0' COMMENT '管理员',
  `update_time` int(11) unsigned DEFAULT '0',
  `record_type` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '属于线下什么机器',
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`),
  KEY `province_id` (`region_id`),
  KEY `member_id` (`member_id`),
  KEY `machine_id` (`machine_id`),
  KEY `record_type` (`record_type`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for gw_offline_sign_audit_logging
-- ----------------------------
DROP TABLE IF EXISTS `gw_offline_sign_audit_logging`;
CREATE TABLE `gw_offline_sign_audit_logging` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `extend_id` int(11) unsigned NOT NULL COMMENT '关联的资质表id',
  `status` tinyint(1) unsigned NOT NULL COMMENT '审核状态（1通过，2不通过）',
  `behavior` int(4) unsigned NOT NULL COMMENT '当前记录所属的操作 1开头的为代理商后台操作 2开头为红色后台相关操作，具体意义看model',
  `auditor` varchar(128) NOT NULL COMMENT '操作人',
  `audit_role` tinyint(2) unsigned NOT NULL COMMENT '审核人的角色，1：大区销售 2：销售总监 3：大区审核 4：审核组长 5：运营总监 6：运作部大区审核 7：运作部经理',
  `event` varchar(255) NOT NULL COMMENT '事件',
  `remark` varchar(255) NOT NULL COMMENT '备注',
  `error_field` text NOT NULL COMMENT '错误字段',
  `create_time` int(10) unsigned NOT NULL COMMENT '审核时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4087 DEFAULT CHARSET=utf8 COMMENT='盖网通商家电子化流程-企业信息表';

-- ----------------------------
-- Table structure for gw_offline_sign_contract
-- ----------------------------
DROP TABLE IF EXISTS `gw_offline_sign_contract`;
CREATE TABLE `gw_offline_sign_contract` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增字段',
  `number` varchar(20) NOT NULL COMMENT '合同编号（系统自动生成）',
  `a_name` varchar(128) NOT NULL COMMENT '甲方名称',
  `b_name` varchar(128) NOT NULL COMMENT '乙方名称',
  `province_id` int(11) unsigned NOT NULL COMMENT '营业执照注册地址 所在省',
  `city_id` int(11) unsigned NOT NULL COMMENT '营业执照注册地址 所在市',
  `district_id` int(11) unsigned NOT NULL COMMENT '营业执照注册地址 所在区',
  `address` varchar(255) NOT NULL COMMENT '营业执照注册地址 所在详细地址',
  `p_province_id` int(11) unsigned NOT NULL COMMENT '推广地区所在省份',
  `p_city_id` int(11) NOT NULL COMMENT '推广地区所在城市',
  `p_district_id` int(11) NOT NULL COMMENT '推广地区所在区域',
  `contract_term` tinyint(3) unsigned NOT NULL COMMENT '合作的月数',
  `begin_time` int(11) unsigned NOT NULL COMMENT '合同期限起始日期',
  `end_time` int(11) unsigned NOT NULL COMMENT '合同期限结束日期',
  `sign_type` tinyint(1) unsigned NOT NULL COMMENT '签约类型（1.首次签约 2.续约 3.改签合同）',
  `sign_time` int(10) unsigned NOT NULL COMMENT '签约日期',
  `machine_developer` varchar(128) DEFAULT NULL COMMENT '销售开发人',
  `contract_linkman` varchar(128) DEFAULT NULL COMMENT '合同跟进人',
  `enterprise_proposer` varchar(32) NOT NULL COMMENT '企业GW号开通人',
  `mobile` varchar(32) NOT NULL COMMENT '企业GW号开通手机',
  `operation_type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '合作方式（1方式一 2方式二 3方式三）',
  `ad_begin_time_hour` tinyint(2) unsigned NOT NULL COMMENT '广告时间段 开始时',
  `ad_begin_time_minute` tinyint(2) unsigned NOT NULL COMMENT '广告时间段 开始分',
  `ad_end_time_hour` tinyint(2) unsigned NOT NULL COMMENT '广告时间段 结束时',
  `ad_end_time_minute` tinyint(2) unsigned NOT NULL COMMENT '广告时间段 结束分',
  `bank_name` varchar(128) NOT NULL COMMENT '开户银行',
  `account_name` varchar(128) NOT NULL COMMENT '账户名称',
  `account` varchar(255) NOT NULL COMMENT '账号',
  `franchisee_developer` int(11) unsigned NOT NULL COMMENT '加盟商开发方',
  `machine_belong_to` int(11) unsigned NOT NULL COMMENT '机器归属方',
  `create_time` int(10) unsigned NOT NULL COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL COMMENT '更新时间',
  `error_field` text NOT NULL COMMENT '错误字段',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COMMENT='盖网通商家电子化流程合同表';

-- ----------------------------
-- Table structure for gw_offline_sign_enterprise
-- ----------------------------
DROP TABLE IF EXISTS `gw_offline_sign_enterprise`;
CREATE TABLE `gw_offline_sign_enterprise` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL COMMENT '企业名称',
  `is_chain` tinyint(1) unsigned NOT NULL COMMENT '是否连锁(0、否  1、是)',
  `chain_type` tinyint(1) unsigned NOT NULL COMMENT '企业连锁形态（1、直营 2、加盟 3、混合型）',
  `chain_number` int(11) unsigned NOT NULL COMMENT '连锁数量',
  `linkman_name` varchar(128) NOT NULL COMMENT '企业联系人姓名',
  `linkman_position` varchar(128) NOT NULL COMMENT '企业联系人职位',
  `linkman_webchat` varchar(128) NOT NULL COMMENT '企业联系人微信',
  `linkman_qq` varchar(128) NOT NULL COMMENT '企业联系人qq',
  `enterprise_type` tinyint(1) unsigned NOT NULL COMMENT '企业类型(1个体工商户 2企业法人 3全民所有制 4农民专业工作社 5事业单位)',
  `enterprise_license_number` varchar(128) NOT NULL COMMENT '营业执照注册号s',
  `registration_time` int(10) unsigned NOT NULL COMMENT '注册时间',
  `license_begin_time` int(10) unsigned NOT NULL COMMENT '营业期限开始时间',
  `license_is_long_time` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '营业期限是否长期0:非长期 1:长期',
  `license_end_time` int(10) unsigned NOT NULL COMMENT '营业期限结束时间',
  `legal_man` varchar(128) NOT NULL COMMENT '法人代表',
  `legal_man_identity` varchar(32) NOT NULL COMMENT '法人代表身份证号',
  `tax_id` varchar(128) NOT NULL COMMENT '税务登记证号',
  `license_image` int(11) unsigned DEFAULT NULL COMMENT '营业执照电子版',
  `tax_image` int(11) unsigned DEFAULT NULL COMMENT '税务登记证电子版',
  `identity_image` int(11) unsigned DEFAULT NULL COMMENT '法人身份证电子版',
  `account_pay_type` tinyint(1) unsigned NOT NULL COMMENT '结算账户类型(1对公 2对私)',
  `payee_identity_number` varchar(128) NOT NULL COMMENT '收款人身份证号码',
  `bank_province_id` int(11) unsigned NOT NULL COMMENT '开户行所在省份',
  `bank_city_id` int(11) unsigned NOT NULL,
  `bank_district_id` int(11) unsigned NOT NULL COMMENT '开户行所在区域',
  `bank_permit_image` int(11) unsigned DEFAULT NULL COMMENT '开户许可证电子版',
  `bank_account_image` int(11) unsigned DEFAULT NULL COMMENT '银行卡复印件电子版',
  `entrust_receiv_image` int(11) unsigned DEFAULT NULL COMMENT '委托收款授权书电子版',
  `payee_identity_image` int(11) unsigned DEFAULT NULL COMMENT '收款人身份证电子版',
  `create_time` int(10) unsigned NOT NULL,
  `update_time` int(10) unsigned NOT NULL COMMENT '更新时间',
  `error_field` text NOT NULL COMMENT '错误字段',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59143 DEFAULT CHARSET=utf8 COMMENT='盖网通商家电子化流程-企业信息表';

-- ----------------------------
-- Table structure for gw_offline_sign_file
-- ----------------------------
DROP TABLE IF EXISTS `gw_offline_sign_file`;
CREATE TABLE `gw_offline_sign_file` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `old_file_name` varchar(100) NOT NULL COMMENT '文件原名称',
  `new_file_name` varchar(100) NOT NULL COMMENT '文件新名称',
  `suffix` varchar(20) NOT NULL COMMENT '文件后缀',
  `path` varchar(200) NOT NULL COMMENT '文件的相对路径',
  `classify` int(4) NOT NULL COMMENT '文件所属分类',
  `is_manage` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否为后台管理员 0：会员，1：后台用户',
  `user_id` mediumint(8) unsigned NOT NULL COMMENT '上传该文件的用户id',
  `create_time` int(10) unsigned NOT NULL COMMENT '文件上传的时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=914 DEFAULT CHARSET=utf8 COMMENT='保存电签上传文件';

-- ----------------------------
-- Table structure for gw_offline_sign_machine_belong
-- ----------------------------
DROP TABLE IF EXISTS `gw_offline_sign_machine_belong`;
CREATE TABLE `gw_offline_sign_machine_belong` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `belong_to` varchar(128) NOT NULL COMMENT '机器归属方',
  `number` int(11) unsigned NOT NULL COMMENT '机器数量',
  `create_time` int(10) unsigned NOT NULL COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='盖网通商家电子化流程-机器归属方信息表';

-- ----------------------------
-- Table structure for gw_offline_sign_store
-- ----------------------------
DROP TABLE IF EXISTS `gw_offline_sign_store`;
CREATE TABLE `gw_offline_sign_store` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `extend_id` int(11) unsigned NOT NULL COMMENT '资质表id',
  `franchisee_id` int(11) unsigned NOT NULL COMMENT '加盟商id（当审核通过后生成，用于加盟商表对应）',
  `machine_id` int(11) unsigned NOT NULL COMMENT '盖机id（当审核通过后生成，用于gt_machine表对应）',
  `franchisee_name` varchar(128) NOT NULL COMMENT '加盟商名称',
  `install_area_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '加盟商区域市大区id',
  `install_province_id` int(11) unsigned NOT NULL COMMENT '加盟商区域省',
  `install_city_id` int(11) unsigned NOT NULL COMMENT '加盟商区域市',
  `install_district_id` int(11) unsigned NOT NULL COMMENT '加盟商区域区',
  `install_street` varchar(255) NOT NULL COMMENT '加盟商区域所在街道',
  `machine_administrator` varchar(32) NOT NULL COMMENT '盖网通管理人姓名',
  `machine_administrator_mobile` varchar(32) NOT NULL COMMENT '盖网通管理人移动电话',
  `store_phone` varchar(32) NOT NULL COMMENT '店面固定电话',
  `store_mobile` varchar(32) NOT NULL COMMENT '店面移动电话',
  `machine_number` int(11) unsigned NOT NULL COMMENT '盖网通数量',
  `machine_size` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '尺寸（1、42存   2、32存）',
  `store_location` varchar(128) NOT NULL COMMENT '所在商圈',
  `store_linkman` varchar(128) NOT NULL COMMENT '商家联系人',
  `store_linkman_position` varchar(128) NOT NULL COMMENT '商家联系人职位',
  `store_linkman_webchat` varchar(128) NOT NULL COMMENT '商家联系人微信',
  `store_linkman_qq` varchar(128) NOT NULL COMMENT '商家联系人qq',
  `store_linkman_email` varchar(128) NOT NULL COMMENT '商家联系人邮箱',
  `franchisee_category_id` int(11) unsigned NOT NULL COMMENT '所属加盟商分类id',
  `open_begin_time` int(10) unsigned NOT NULL COMMENT '营业开始时间',
  `open_end_time` int(10) unsigned NOT NULL COMMENT '营业结束时间',
  `exists_membership` tinyint(1) unsigned NOT NULL COMMENT '是否存在会员制（0否 1是）',
  `member_discount_type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '会员折扣方式（1会员优惠折扣 2充值优惠折扣）',
  `store_disconunt` tinyint(3) unsigned NOT NULL COMMENT '会员折扣',
  `store_banner_image` int(11) unsigned DEFAULT NULL COMMENT '带招牌的店铺门面照片',
  `store_inner_image` int(11) unsigned DEFAULT NULL COMMENT '店铺内部照片',
  `discount` tinyint(3) unsigned NOT NULL COMMENT '折扣差',
  `gai_discount` tinyint(3) unsigned NOT NULL COMMENT '盖网公司结算折扣',
  `member_discount` tinyint(3) unsigned NOT NULL COMMENT '盖网会员结算折扣',
  `clearing_remark` varchar(255) NOT NULL COMMENT '会员结算备注',
  `machine_install_type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '铺设类型（1消费机 2展示机 3测试机）',
  `machine_install_style` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '铺设样式（1立式 2挂式）',
  `franchisee_operate_name` varchar(32) NOT NULL COMMENT '联盟商户运维方名称',
  `franchisee_operate_id` int(32) unsigned NOT NULL COMMENT '联盟商户运维方GW号（对应member表id）',
  `enterprise_member_name_agent` varchar(32) NOT NULL COMMENT '企业会员名称(代理商)',
  `recommender_member_id_agent` int(11) unsigned NOT NULL COMMENT '推荐者GW号id（代理商）',
  `recommender_mobile` varchar(32) NOT NULL COMMENT '推荐者手机号（代理商）',
  `recommender_linkman` varchar(128) NOT NULL COMMENT '联系人（代理商）',
  `recommender_mobile_member` varchar(32) NOT NULL COMMENT '推荐者手机号码（会员）',
  `recommender_member_id_member` varchar(128) NOT NULL COMMENT '推荐者GW号id（会员）',
  `recommender_apply_image` int(11) unsigned DEFAULT NULL COMMENT '盖机推荐者绑定申请',
  `error_field` text NOT NULL COMMENT '错误字段',
  `create_time` int(10) unsigned NOT NULL COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=182 DEFAULT CHARSET=utf8 COMMENT='盖网通商家电子化流程-盖机与店铺表';

-- ----------------------------
-- Table structure for gw_offline_sign_store_extend
-- ----------------------------
DROP TABLE IF EXISTS `gw_offline_sign_store_extend`;
CREATE TABLE `gw_offline_sign_store_extend` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `offline_sign_contract_id` int(11) unsigned NOT NULL COMMENT '盖网通商家电子化流程-合同信息表id',
  `offline_sign_enterprise_id` int(11) unsigned NOT NULL COMMENT '盖网通商家电子化流程-企业信息表id',
  `enterprise_id` int(11) NOT NULL DEFAULT '-1' COMMENT '所属企业id（当最终审核通过后会关联到某个企业id）',
  `role_1_audit_status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '大区销售审核状态,1:待审核,2:流程审核中,3:已退回',
  `role_2_audit_status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '销售总监审核状态,1:待审核,2:流程审核中,3:已退回',
  `role_3_audit_status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '大区审核审核状态,1:待审核,2:流程审核中,3:已退回',
  `role_4_audit_status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '审核组长审核状态,1:待审核,2:流程审核中,3:已退回',
  `role_5_audit_status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '运营总监审核状态,1:待审核,2:流程审核中,3:已退回',
  `role_6_audit_status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '运营部大区审核审核状态,1:待审核,2:流程审核中,3:已退回',
  `role_7_audit_status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '运营部经理审核状态,1:待审核,2:流程审核中,3:已退回',
  `franchisee_developer` int(11) unsigned NOT NULL COMMENT '加盟商开发方',
  `machine_belong_to` int(11) unsigned NOT NULL COMMENT '机器归属方',
  `extend_area_id` int(11) unsigned NOT NULL COMMENT '该条资质所属大区（代理商后台提交的为改代理商所在大区，红色后台导入的为表格的第二个字段）',
  `agent_id` int(11) unsigned NOT NULL COMMENT '创建该店铺的代理商的id',
  `apply_type` tinyint(1) unsigned NOT NULL COMMENT '申请类型（1 新商户 2 原有会员增加加盟商）',
  `is_import` tinyint(1) unsigned NOT NULL COMMENT '是否内部人员导入,1:不是，2：是',
  `old_member_franchisee_id` int(11) unsigned NOT NULL COMMENT '原有会员新增加盟商时企业会员id',
  `status` tinyint(1) unsigned NOT NULL COMMENT '状态（0未提交 1待审核 2未通过 3未提交资质 4已通过）',
  `audit_status` tinyint(1) unsigned NOT NULL COMMENT '审核流程的状态（0未提交 1、提交资质电子档 2、打印、盖章并上传资质合同 3、审核资质合同 4、资质审核成功）',
  `upload_contract` int(11) unsigned DEFAULT NULL COMMENT '联盟商户合同',
  `upload_contract_img` varchar(255) DEFAULT NULL COMMENT '盖网通铺设场所及优惠约定',
  `repeat_audit` tinyint(1) unsigned NOT NULL COMMENT '是否重复审核',
  `repeat_application` tinyint(1) unsigned NOT NULL COMMENT '是否重复申请',
  `error_field` text NOT NULL COMMENT '错误字段',
  `create_time` int(10) unsigned NOT NULL COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8 COMMENT='盖网通商家电子化流程-审核扩展表';

-- ----------------------------
-- Table structure for gw_order
-- ----------------------------
DROP TABLE IF EXISTS `gw_order`;
CREATE TABLE `gw_order` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `code` varchar(64) NOT NULL COMMENT '订单编号（商城内部使用）',
  `member_id` int(11) unsigned NOT NULL COMMENT '所属会员',
  `consignee` varchar(128) NOT NULL COMMENT '收货人',
  `address` varchar(128) NOT NULL COMMENT '收货地址',
  `mobile` varchar(16) NOT NULL COMMENT '手机号码',
  `zip_code` varchar(16) NOT NULL COMMENT '邮编',
  `pay_type` tinyint(1) unsigned NOT NULL COMMENT '支付方式（1积分、2抵换券、3环迅、4银联、5翼支付、6汇卡）',
  `mode` tinyint(1) unsigned NOT NULL COMMENT '运送方式（1快递，2EMS，3平邮）',
  `status` tinyint(1) unsigned NOT NULL COMMENT '状态（1新订单，2交易完成，3交易关闭）',
  `delivery_status` tinyint(1) unsigned NOT NULL COMMENT '配送状态（1未发货，2等待发货，3已出货，4签收）',
  `express` varchar(128) NOT NULL COMMENT '发货物流',
  `shipping_code` varchar(128) NOT NULL COMMENT '运单号',
  `pay_status` tinyint(1) unsigned NOT NULL COMMENT '支付状态（1未支付，2已支付）',
  `order_type` tinyint(1) unsigned NOT NULL COMMENT '订单类型（1暂不清楚，2积分兑换）',
  `freight` decimal(10,2) NOT NULL COMMENT '运费',
  `pay_price` decimal(10,2) NOT NULL COMMENT '支付金额',
  `jf_price` decimal(10,2) NOT NULL COMMENT '积分支付金额',
  `real_price` decimal(10,2) NOT NULL COMMENT '实际金额',
  `return` decimal(10,2) NOT NULL COMMENT '返还积分',
  `freight_payment_type` tinyint(1) unsigned NOT NULL COMMENT '运输方式（1包邮，2运费到会，3运费模板）',
  `create_time` int(11) unsigned NOT NULL COMMENT '下单时间',
  `store_id` int(11) unsigned NOT NULL COMMENT '所属店铺',
  `pay_time` int(11) unsigned NOT NULL COMMENT '支付时间',
  `delivery_time` int(11) unsigned NOT NULL COMMENT '发货时间',
  `sign_time` int(11) unsigned NOT NULL COMMENT '签收时间',
  `refund_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '退款状态（0无，1申请中，2失败，3成功）',
  `refund_reason` varchar(128) NOT NULL DEFAULT '' COMMENT '退款原因',
  `return_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '退货状态（0无，1协商中，2失败，3同意，4，成功）',
  `return_reason` varchar(128) NOT NULL DEFAULT '' COMMENT '退货原因',
  `is_read` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否查看（0否，1是）',
  `is_send_sms` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '短信发送（0未发，1已发）',
  `is_comment` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '评论状态（0未评论，1已评论）',
  `is_auto_sign` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '自动签收（0否，1是）',
  `auto_sign_date` tinyint(3) unsigned NOT NULL COMMENT '自动签收天数',
  `delay_sign_count` tinyint(3) unsigned NOT NULL COMMENT '延迟签收次数',
  `remark` varchar(128) NOT NULL DEFAULT '' COMMENT '客户留言',
  `deduct_freight` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '扣除运费',
  `shipping_address_id` int(11) unsigned NOT NULL COMMENT '发货地址',
  `shipping_remark` varchar(128) NOT NULL DEFAULT '' COMMENT '发货备注',
  `rights_info` text NOT NULL COMMENT '维权信息',
  `parent_code` varchar(128) NOT NULL COMMENT '父订单编号',
  `distribution_ratio` text NOT NULL COMMENT '分配比率',
  `flag` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '标记（0无，1为45591商品）',
  `extend` text NOT NULL COMMENT '扩展信息',
  `source_type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '订单类型（1、【普通商品及专题商品】2、【大额商品（积分加现金）】3、【合约机商品】）',
  `service_type` tinyint(1) unsigned NOT NULL COMMENT '签约类型（0旧的签约，1服务费签约）',
  `stockup_time` int(11) unsigned NOT NULL COMMENT '备货时间',
  `return_time` int(11) unsigned NOT NULL COMMENT '退货成功时间',
  `refund_time` int(11) unsigned NOT NULL COMMENT '退款成功时间',
  `comment_time` int(11) unsigned NOT NULL COMMENT '评论时间',
  `apply_return_time` int(11) unsigned NOT NULL COMMENT '申请退货时间',
  `apply_refund_time` int(11) unsigned NOT NULL COMMENT '申请退款时间',
  `close_time` int(11) unsigned NOT NULL COMMENT '关闭订单',
  `right_time` int(11) unsigned NOT NULL COMMENT '维权时间',
  `is_right` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '维权（0否、1是）',
  `source` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '来源（1网站、2ANDROID客户端、3IOS客户端）',
  `other_price` decimal(10,2) unsigned NOT NULL COMMENT '其它支付金额',
  `original_price` decimal(10,2) unsigned NOT NULL COMMENT '原始金额',
  `extend_remark` text NOT NULL COMMENT '后台关闭备注',
  `is_remind` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否提醒过卖家发货 0:未提醒  1:已提醒',
  `life` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '删除订单标记：（0.默认; 1.删除，到回收站； 2. 彻底删除）',
  `app_life` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'app端用户删除订单标记：（0.未删除; 1.删除）',
  `is_distribution` tinyint(3) NOT NULL DEFAULT '0' COMMENT '是否已分配（0未分配，1已分配）',
  PRIMARY KEY (`id`),
  KEY `member_id` (`member_id`) USING BTREE,
  KEY `store_id` (`store_id`) USING BTREE,
  KEY `code` (`code`) USING BTREE,
  KEY `pay_type` (`pay_type`) USING BTREE,
  KEY `status` (`status`) USING BTREE,
  KEY `delivery_status` (`delivery_status`) USING BTREE,
  KEY `pay_status` (`pay_status`) USING BTREE,
  KEY `is_comment` (`is_comment`) USING BTREE,
  KEY `is_right` (`is_right`) USING BTREE,
  KEY `return_status` (`return_status`) USING BTREE,
  KEY `refund_status` (`refund_status`) USING BTREE,
  CONSTRAINT `fk_order_member` FOREIGN KEY (`member_id`) REFERENCES `gw_member` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_order_store` FOREIGN KEY (`store_id`) REFERENCES `gw_store` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=134951 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_order_exchange
-- ----------------------------
DROP TABLE IF EXISTS `gw_order_exchange`;
CREATE TABLE `gw_order_exchange` (
  `exchange_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键自增',
  `member_id` int(11) NOT NULL COMMENT '买家的会员id',
  `order_id` int(11) NOT NULL COMMENT '订单表的主键id',
  `exchange_code` varchar(64) NOT NULL COMMENT '退换货单编号',
  `exchange_type` tinyint(4) NOT NULL COMMENT '退换货类型,1为退货2为退款不退货',
  `exchange_apply_time` int(10) NOT NULL COMMENT '退换货申请时间',
  `exchange_examine_time` int(10) NOT NULL COMMENT '退换货审核时间',
  `exchange_done_time` int(11) NOT NULL COMMENT '退换货流程处理完成时间',
  `exchange_examine_reason` varchar(255) NOT NULL COMMENT '退换货审核不通过理由',
  `exchange_status` tinyint(8) NOT NULL DEFAULT '0' COMMENT '流程处理状态,0为卖家审核中1为审核通过2为审核不通过3为等待买家退货4为等待卖家退款5为取消6为完成',
  `exchange_reason` tinyint(5) NOT NULL DEFAULT '0' COMMENT '退换货原因',
  `exchange_money` decimal(10,2) NOT NULL COMMENT '退换货金额',
  `exchange_description` varchar(255) NOT NULL COMMENT '退换货描述',
  `exchange_images` tinytext NOT NULL COMMENT '退换货图片凭证,用|分隔',
  `logistics_company` varchar(50) NOT NULL COMMENT '退货物流公司',
  `logistics_code` varchar(50) NOT NULL COMMENT '退货物流运单号',
  `logistics_description` tinytext NOT NULL COMMENT '退货物流说明',
  PRIMARY KEY (`exchange_id`),
  KEY `order_id` (`order_id`),
  KEY `exchange_apply_time` (`exchange_apply_time`),
  KEY `logistics_code` (`logistics_code`),
  KEY `member_id` (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=277 DEFAULT CHARSET=utf8 COMMENT='退换货记录表';

-- ----------------------------
-- Table structure for gw_order_express
-- ----------------------------
DROP TABLE IF EXISTS `gw_order_express`;
CREATE TABLE `gw_order_express` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `times` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '推送次数',
  `send_time` int(10) unsigned NOT NULL COMMENT '推送时间',
  `created` int(10) unsigned NOT NULL COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL COMMENT '更新时间',
  `state` tinyint(3) unsigned NOT NULL COMMENT '快递单当前签收状态;包括0在途中、1已揽收、2疑难、3已签收、4退签、5同城派送中、6退回、7转单等7个状态，其中4-7需要另外开通才有效',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态（1.快递单还在监控过程中;2.已签收;3.监控中止,异常运单）',
  `order_code` varchar(50) NOT NULL COMMENT '订单编号',
  `shipping_code` varchar(100) NOT NULL COMMENT '快递单号',
  `message` varchar(200) NOT NULL COMMENT '监控状态相关消息，如:3天查询无记录，60天无变化',
  `data` text NOT NULL COMMENT '回调消息结果',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COMMENT='快递100推送结果';

-- ----------------------------
-- Table structure for gw_order_goods
-- ----------------------------
DROP TABLE IF EXISTS `gw_order_goods`;
CREATE TABLE `gw_order_goods` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `goods_id` int(11) unsigned NOT NULL COMMENT '所属商品',
  `order_id` int(11) unsigned NOT NULL COMMENT '所属订单',
  `quantity` int(11) unsigned NOT NULL COMMENT '数量',
  `unit_score` decimal(11,2) NOT NULL COMMENT '单品积分（单品消费积分）',
  `total_score` decimal(11,2) NOT NULL COMMENT '总积分',
  `gai_price` decimal(11,2) NOT NULL COMMENT '供货价',
  `unit_price` decimal(11,2) NOT NULL COMMENT '单价（促销价）',
  `total_price` decimal(11,2) NOT NULL COMMENT '总价',
  `gai_income` int(11) unsigned NOT NULL COMMENT '盖网收入',
  `spec_value` text NOT NULL COMMENT '所属规格',
  `target_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '所属对象',
  `mode` tinyint(1) unsigned NOT NULL COMMENT '运送方式（1快递，2EMS，3平邮）',
  `freight` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '邮费',
  `freight_payment_type` tinyint(1) unsigned NOT NULL COMMENT '运输方式（0包邮，1运费到付，2运费模板）',
  `goods_name` varchar(128) NOT NULL COMMENT '商品名称',
  `goods_picture` varchar(128) NOT NULL COMMENT '商品图片',
  `activity_ratio` tinyint(3) unsigned NOT NULL COMMENT '活动红包支付比率',
  `spec_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '规格值',
  `ratio` tinyint(3) unsigned NOT NULL COMMENT '服务费比率',
  `original_price` decimal(11,2) unsigned NOT NULL COMMENT '原始金额',
  `integral_ratio` float(6,3) unsigned NOT NULL DEFAULT '100.000' COMMENT '积分支付比例，默认100',
  `special_topic_category` int(11) unsigned NOT NULL COMMENT '商品所属专题分类的id',
  `rules_setting_id` int(11) NOT NULL DEFAULT '0' COMMENT '秒杀活动规则id',
  PRIMARY KEY (`id`),
  KEY `goods_id` (`goods_id`) USING BTREE,
  KEY `order_id` (`order_id`) USING BTREE,
  CONSTRAINT `fk_order_goods_goods` FOREIGN KEY (`goods_id`) REFERENCES `gw_goods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_order_goods_order` FOREIGN KEY (`order_id`) REFERENCES `gw_order` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=155759 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_order_import
-- ----------------------------
DROP TABLE IF EXISTS `gw_order_import`;
CREATE TABLE `gw_order_import` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `is_import` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否处理',
  `import_time` int(11) unsigned NOT NULL COMMENT '导入时间',
  `gai_number` varchar(32) NOT NULL,
  `register_time` int(11) unsigned NOT NULL,
  `goods_id` int(11) unsigned NOT NULL,
  `pay_price` decimal(18,2) NOT NULL,
  `create_time` int(11) unsigned NOT NULL COMMENT '下单时间',
  `pay_time` int(11) unsigned NOT NULL,
  `delivery_time` int(11) NOT NULL,
  `sign_time` int(11) NOT NULL,
  `shipping_address` varchar(255) NOT NULL,
  `shipping_code` varchar(128) NOT NULL,
  `express` varchar(128) NOT NULL,
  `consignee` varchar(128) NOT NULL,
  `address` varchar(255) NOT NULL,
  `mobile` varchar(128) NOT NULL,
  `order_code` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3681 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for gw_order_member
-- ----------------------------
DROP TABLE IF EXISTS `gw_order_member`;
CREATE TABLE `gw_order_member` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `member_id` int(11) unsigned NOT NULL COMMENT '用户ID',
  `code` varchar(64) NOT NULL COMMENT '订单号',
  `real_name` varchar(64) NOT NULL COMMENT '真实姓名',
  `sex` tinyint(2) unsigned NOT NULL COMMENT '性别',
  `identity_type` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '证件类型',
  `identity_number` varchar(128) NOT NULL COMMENT '证件号码',
  `identity_front_img` varchar(128) NOT NULL COMMENT '证件图片正面',
  `identity_back_img` varchar(128) NOT NULL COMMENT '证件图片反面',
  `mobile` varchar(64) NOT NULL COMMENT '联系电话',
  `street` varchar(255) NOT NULL COMMENT '联系地址',
  `create_time` int(11) unsigned NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='订单录入用户详情表';

-- ----------------------------
-- Table structure for gw_order_refund
-- ----------------------------
DROP TABLE IF EXISTS `gw_order_refund`;
CREATE TABLE `gw_order_refund` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(10) unsigned NOT NULL COMMENT '会员id',
  `code` varchar(64) NOT NULL COMMENT '订单编号',
  `money` decimal(13,2) unsigned NOT NULL COMMENT '退款金额',
  `user_id` int(10) unsigned NOT NULL COMMENT '操作人id',
  `create_time` int(10) unsigned NOT NULL COMMENT '操作时间',
  `account_type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '账户类型（1.新账 2.隐账）',
  `remark` varchar(500) NOT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='退款到银行卡记录';

-- ----------------------------
-- Table structure for gw_pay_agreement
-- ----------------------------
DROP TABLE IF EXISTS `gw_pay_agreement`;
CREATE TABLE `gw_pay_agreement` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `gw` varchar(32) NOT NULL COMMENT '盖网编号',
  `pay_type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '支付类型（1联动优势）',
  `card_type` varchar(16) NOT NULL COMMENT '卡片类型(CREDITCARD(信用卡)DEBITCARD(借记卡))',
  `bank` varchar(10) NOT NULL COMMENT '银行类型（大写字母）',
  `bank_num` char(19) NOT NULL COMMENT '银行卡',
  `mobile` varchar(32) NOT NULL COMMENT '银行预留手机号',
  `pay_agreement_id` varchar(64) NOT NULL COMMENT '支付协议号',
  `busi_agreement_id` varchar(64) NOT NULL COMMENT '用户业务协议号',
  `create_time` int(11) unsigned NOT NULL COMMENT '绑定时间',
  `certificateNo` char(32) NOT NULL COMMENT '身份证号码',
  `accountName` varchar(64) NOT NULL DEFAULT '' COMMENT '身份证姓名',
  `cvn2` char(3) NOT NULL COMMENT '信用卡后3位数字',
  `valid` varchar(4) NOT NULL COMMENT '信用卡有效期',
  `bindid` char(32) NOT NULL COMMENT '交易绑卡ID',
  `reqMsgId` varchar(32) NOT NULL COMMENT '商城流水号',
  `certificateType` varchar(10) NOT NULL COMMENT '身份验证类型',
  `status` tinyint(4) DEFAULT '0' COMMENT '标识绑卡状态(1、绑定，0、未绑定)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `agreement_id` (`pay_agreement_id`,`busi_agreement_id`) USING BTREE,
  KEY `bindid` (`bindid`) USING BTREE,
  KEY `bank_num` (`bank_num`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5865 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='一键支付协议绑定';

-- ----------------------------
-- Table structure for gw_pay_result
-- ----------------------------
DROP TABLE IF EXISTS `gw_pay_result`;
CREATE TABLE `gw_pay_result` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `code` varchar(64) NOT NULL COMMENT '支付单号',
  `pay_result` text NOT NULL COMMENT '结果',
  `pay_type` tinyint(1) unsigned NOT NULL COMMENT '支付方式（3环迅、4银联、5翼支付）',
  `update_time` int(11) unsigned NOT NULL COMMENT '更新时间',
  `create_time` int(11) unsigned NOT NULL COMMENT '创建时间',
  `times` int(11) unsigned NOT NULL COMMENT '推送次数',
  `order_type` tinyint(1) unsigned NOT NULL COMMENT '订单类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7068 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_payment
-- ----------------------------
DROP TABLE IF EXISTS `gw_payment`;
CREATE TABLE `gw_payment` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cash_id` int(11) NOT NULL COMMENT '体现id',
  `batch_id` int(11) NOT NULL COMMENT '批次id',
  `req_id` varchar(32) NOT NULL COMMENT '代收付流水号',
  `amount` decimal(10,2) NOT NULL COMMENT '提现金额',
  `member_id` int(11) NOT NULL COMMENT '用户ID',
  `third_type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT ' 代付渠道，1是高汇通',
  `lock_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '锁定状态（1活动,2锁定,）',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '结果状态（0待转,1成功,2失败）',
  `create_time` int(11) unsigned NOT NULL COMMENT '录入时间',
  `audit_time` int(11) unsigned NOT NULL COMMENT '审核时间',
  `payment_time` int(11) NOT NULL COMMENT '代付执行时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=243 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='代付信息表';

-- ----------------------------
-- Table structure for gw_payment_batch
-- ----------------------------
DROP TABLE IF EXISTS `gw_payment_batch`;
CREATE TABLE `gw_payment_batch` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `batch_number` varchar(64) NOT NULL COMMENT '批次号',
  `remark` text NOT NULL COMMENT '备注',
  `author_ip` int(11) unsigned NOT NULL COMMENT '创建者IP',
  `author_id` int(11) unsigned NOT NULL COMMENT '创建者ID',
  `auditor_ip` int(11) unsigned NOT NULL COMMENT '审核者IP',
  `auditor_id` int(11) unsigned NOT NULL COMMENT '审核者ID',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态（0待审核，1审核通过，2审核不通过，3转账完成，4转账失败）',
  `create_time` int(11) unsigned NOT NULL COMMENT '创建时间',
  `audit_time` int(11) unsigned NOT NULL COMMENT '审核时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='代付批次表';

-- ----------------------------
-- Table structure for gw_payment_log
-- ----------------------------
DROP TABLE IF EXISTS `gw_payment_log`;
CREATE TABLE `gw_payment_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `value` text,
  `create_time` int(11) unsigned NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='代付日志表';

-- ----------------------------
-- Table structure for gw_permission
-- ----------------------------
DROP TABLE IF EXISTS `gw_permission`;
CREATE TABLE `gw_permission` (
  `item` varchar(128) NOT NULL COMMENT '操作项',
  `name` varchar(128) NOT NULL COMMENT '名称',
  `description` varchar(128) NOT NULL COMMENT '说明',
  `sort` tinyint(3) NOT NULL COMMENT '排序',
  KEY `item` (`item`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_pos_audit
-- ----------------------------
DROP TABLE IF EXISTS `gw_pos_audit`;
CREATE TABLE `gw_pos_audit` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `month` varchar(6) NOT NULL,
  `terminal_number` varchar(10) NOT NULL COMMENT '终端号',
  `terminal_transaction_serial_number` int(8) DEFAULT NULL,
  `transaction_time` int(11) unsigned DEFAULT NULL COMMENT '交易时间戳',
  `transaction_datetime` datetime DEFAULT NULL COMMENT '交易时间',
  `amount` decimal(13,4) DEFAULT NULL COMMENT '交易金额',
  `pos_info_id` int(11) unsigned DEFAULT NULL COMMENT 'pos交易记录id',
  `callback_data` text COMMENT '回调对账数据',
  `create_time` int(11) unsigned DEFAULT NULL COMMENT '记录创建时间',
  `status` tinyint(2) unsigned DEFAULT '0' COMMENT '0无需处理,1未处理,2需要跟进,3已处理',
  `type` tinyint(1) unsigned DEFAULT NULL COMMENT '0正常,1平台异常,2系统异常,3数据异常',
  `admin_id` int(11) unsigned DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `update_time` int(11) unsigned DEFAULT NULL COMMENT '更新时间',
  `log` text COMMENT '添加参数日志',
  PRIMARY KEY (`id`),
  KEY `month` (`month`,`terminal_number`,`terminal_transaction_serial_number`),
  KEY `status` (`status`),
  KEY `type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=26474 DEFAULT CHARSET=utf8 COMMENT='pos交易对账';

-- ----------------------------
-- Table structure for gw_pos_information
-- ----------------------------
DROP TABLE IF EXISTS `gw_pos_information`;
CREATE TABLE `gw_pos_information` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `is_supply` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否是后补消费',
  `machine_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '盖网通id',
  `machine_serial_num` varchar(32) DEFAULT NULL,
  `member_id` int(11) unsigned NOT NULL COMMENT '会员id',
  `phone` varchar(32) NOT NULL COMMENT '手机号',
  `card_num` varchar(255) NOT NULL COMMENT '卡号 不为0',
  `amount` double(18,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '充值金额',
  `serial_num` int(8) NOT NULL COMMENT 'pos机流水号',
  `transaction_time` int(11) NOT NULL COMMENT '交易时间',
  `business_num` varchar(16) NOT NULL COMMENT '商铺号',
  `device_num` varchar(10) NOT NULL COMMENT '终端号',
  `shopname` varchar(64) NOT NULL COMMENT '商户名称',
  `operator` varchar(5) NOT NULL COMMENT '操作员',
  `doc_num` varchar(10) NOT NULL COMMENT '凭证号',
  `batch_num` varchar(10) NOT NULL COMMENT '批次号',
  `card_valid_date` int(11) NOT NULL COMMENT '卡片有限期',
  `transaction_type` varchar(17) NOT NULL COMMENT '交易类型',
  `send_card_bank` varchar(12) NOT NULL COMMENT '发卡行',
  `receive_bank` varchar(12) NOT NULL COMMENT '收单行',
  `clear_account_date` int(11) NOT NULL COMMENT '清算日期',
  `card_type` varchar(255) DEFAULT NULL COMMENT '刷卡类型(0x00 磁条卡,0x01 IC卡联机,0x02 插IC卡执行电子现金,0x03 QPBOC,0x04 NFC)',
  `system_number` varchar(255) DEFAULT NULL COMMENT '系统参考号',
  PRIMARY KEY (`id`),
  UNIQUE KEY `only` (`machine_id`,`serial_num`,`doc_num`,`batch_num`) USING BTREE,
  KEY `amount` (`amount`),
  KEY `time` (`transaction_time`),
  KEY `card_num` (`card_num`),
  KEY `member_id` (`member_id`),
  KEY `machine_serial_num` (`machine_serial_num`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2398 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for gw_prepaid_card
-- ----------------------------
DROP TABLE IF EXISTS `gw_prepaid_card`;
CREATE TABLE `gw_prepaid_card` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `number` varchar(128) NOT NULL COMMENT '卡号',
  `password` varchar(128) NOT NULL COMMENT '密码',
  `value` decimal(12,2) NOT NULL COMMENT '积分',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态（0未使用，1已使用）',
  `create_time` int(11) unsigned NOT NULL COMMENT '创建时间',
  `member_id` int(11) unsigned NOT NULL COMMENT '使用者',
  `use_time` int(11) unsigned NOT NULL COMMENT '使用时间',
  `user_ip` int(11) unsigned NOT NULL COMMENT '使用者IP',
  `author_ip` int(11) unsigned NOT NULL COMMENT '创建者IP',
  `author_id` int(11) unsigned NOT NULL COMMENT '创建者',
  `type` tinyint(1) unsigned NOT NULL COMMENT '类型（1充值卡，2返还卡）',
  `author_name` varchar(128) NOT NULL COMMENT '创建者名称',
  `money` decimal(11,2) NOT NULL COMMENT '金额',
  `owner_id` int(11) unsigned NOT NULL COMMENT '拥有者',
  `sale_time` int(11) unsigned NOT NULL COMMENT '出售时间',
  `sale_remark` text NOT NULL COMMENT '备注',
  `is_recon` tinyint(1) unsigned NOT NULL COMMENT '是否对账（0否，1是）',
  `recon_user` varchar(128) NOT NULL COMMENT '对账人',
  `recon_time` int(11) unsigned NOT NULL COMMENT '对账时间',
  `flag` tinyint(1) unsigned NOT NULL COMMENT '默认0，1为红包派送',
  `version` varchar(128) NOT NULL COMMENT '制卡版本',
  `by_gai_number` varchar(64) NOT NULL COMMENT '充值人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `number` (`number`) USING BTREE,
  KEY `status` (`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=29428 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_prepaid_card_batch_record
-- ----------------------------
DROP TABLE IF EXISTS `gw_prepaid_card_batch_record`;
CREATE TABLE `gw_prepaid_card_batch_record` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mobile` varchar(32) NOT NULL COMMENT '手机号码',
  `money` decimal(18,2) unsigned NOT NULL COMMENT '积分',
  `batch_number` int(11) unsigned NOT NULL COMMENT '批号',
  `apply_time` int(11) unsigned NOT NULL COMMENT '申请时间',
  `card_number` varchar(128) NOT NULL COMMENT '充值卡号',
  `author_ip` int(11) unsigned NOT NULL COMMENT '创建者IP',
  `author_id` int(11) unsigned NOT NULL COMMENT '创建者',
  `author_name` varchar(128) NOT NULL COMMENT '创建者名称',
  `create_time` int(11) unsigned NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1433 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for gw_prepaid_card_transfer
-- ----------------------------
DROP TABLE IF EXISTS `gw_prepaid_card_transfer`;
CREATE TABLE `gw_prepaid_card_transfer` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `card_id` varchar(128) NOT NULL COMMENT '充值卡号id',
  `card_number` varchar(128) NOT NULL COMMENT '卡号',
  `value` decimal(12,2) NOT NULL COMMENT '积分',
  `money` decimal(11,2) NOT NULL COMMENT '金额',
  `transfer_member_id` int(11) unsigned NOT NULL COMMENT '转账人的id',
  `receiver_member_id` int(11) unsigned NOT NULL COMMENT '接收人的id',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态（0申请中，1审核通过，2审核不通过）',
  `remark` text NOT NULL COMMENT '备注',
  `author_ip` int(11) unsigned NOT NULL COMMENT '创建者IP',
  `author_id` int(11) unsigned NOT NULL COMMENT '创建者',
  `author_name` varchar(128) NOT NULL COMMENT '创建者名称',
  `auditor_ip` int(11) unsigned NOT NULL COMMENT '审核者IP',
  `auditor_id` int(11) unsigned NOT NULL COMMENT '审核者',
  `auditor_name` varchar(128) NOT NULL COMMENT '审核者名称',
  `create_time` int(11) unsigned NOT NULL COMMENT '创建时间',
  `audit_time` int(11) unsigned NOT NULL COMMENT '审核时间',
  PRIMARY KEY (`id`),
  KEY `transfer_member_id` (`transfer_member_id`) USING BTREE,
  KEY `receiver_member_id` (`receiver_member_id`) USING BTREE,
  KEY `card_id` (`card_id`) USING BTREE,
  KEY `card_number` (`card_number`) USING BTREE,
  KEY `status` (`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_promotion_channels
-- ----------------------------
DROP TABLE IF EXISTS `gw_promotion_channels`;
CREATE TABLE `gw_promotion_channels` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(128) DEFAULT NULL COMMENT '名称',
  `number` char(8) DEFAULT NULL COMMENT '推广编号',
  `new_members` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '新会员数',
  `visits` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '访问数',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `url` varchar(255) NOT NULL COMMENT '推广网址',
  `register_type` tinyint(2) unsigned NOT NULL COMMENT '注册类型',
  `start_time` int(11) unsigned NOT NULL COMMENT '推广开始时间',
  `end_time` int(11) unsigned NOT NULL COMMENT '推广结束时间',
  `create_time` int(11) unsigned NOT NULL COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `number` (`number`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for gw_recharge
-- ----------------------------
DROP TABLE IF EXISTS `gw_recharge`;
CREATE TABLE `gw_recharge` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `member_id` int(11) unsigned NOT NULL COMMENT '所属会员',
  `code` varchar(32) NOT NULL COMMENT '编号',
  `score` decimal(20,2) NOT NULL COMMENT '积分',
  `money` decimal(20,2) NOT NULL COMMENT '金额',
  `ratio` decimal(10,2) NOT NULL COMMENT '比率',
  `create_time` int(11) unsigned NOT NULL COMMENT '创建时间',
  `pay_time` int(11) unsigned NOT NULL COMMENT '支付时间',
  `status` tinyint(1) unsigned NOT NULL COMMENT '状态（0未充值，1充值成功，2充值失败）',
  `remark` text NOT NULL COMMENT '备注',
  `ip` int(11) unsigned NOT NULL COMMENT 'IP',
  `pay_type` tinyint(3) unsigned NOT NULL COMMENT '支付类型',
  `pay_mode` tinyint(3) unsigned NOT NULL,
  `description` text NOT NULL COMMENT '说明',
  `flag` tinyint(3) unsigned DEFAULT '0' COMMENT '标记（0无，1为45591商品）',
  `by_gai_number` varchar(64) NOT NULL COMMENT '充值人',
  PRIMARY KEY (`id`),
  KEY `member_id` (`member_id`) USING BTREE,
  CONSTRAINT `fk_recharge_member` FOREIGN KEY (`member_id`) REFERENCES `gw_member` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7240 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_recommend_log
-- ----------------------------
DROP TABLE IF EXISTS `gw_recommend_log`;
CREATE TABLE `gw_recommend_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `member_id` int(11) unsigned NOT NULL COMMENT '所属会员',
  `parent_id` int(11) unsigned NOT NULL COMMENT '绑定父级',
  `create_time` int(11) unsigned NOT NULL COMMENT '绑定时间',
  PRIMARY KEY (`id`),
  KEY `member_id` (`member_id`) USING BTREE,
  CONSTRAINT `fk_recommend_log_member` FOREIGN KEY (`member_id`) REFERENCES `gw_member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=119804 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_redis_activity
-- ----------------------------
DROP TABLE IF EXISTS `gw_redis_activity`;
CREATE TABLE `gw_redis_activity` (
  `member_id` int(11) unsigned NOT NULL COMMENT '所属会员',
  `activity_id` int(11) unsigned NOT NULL COMMENT '所属活动',
  `money` decimal(10,2) unsigned NOT NULL COMMENT '金额',
  `uid` varchar(128) NOT NULL COMMENT '唯一标识',
  `source` tinyint(1) unsigned NOT NULL,
  KEY `member_id` (`member_id`) USING BTREE,
  KEY `activity_id` (`activity_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_region
-- ----------------------------
DROP TABLE IF EXISTS `gw_region`;
CREATE TABLE `gw_region` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `parent_id` smallint(5) unsigned NOT NULL COMMENT '上级',
  `name` varchar(120) NOT NULL COMMENT '名称',
  `depth` tinyint(4) unsigned NOT NULL,
  `member_id` int(11) unsigned NOT NULL COMMENT '所属会员',
  `tree` varchar(128) NOT NULL COMMENT '树',
  `lng` varchar(128) NOT NULL COMMENT '经度',
  `lat` varchar(128) NOT NULL COMMENT '纬度',
  `area_code` varchar(32) NOT NULL COMMENT '地区编码',
  `zip_code` varchar(16) NOT NULL COMMENT '邮编',
  `phone_code` varchar(32) NOT NULL COMMENT '电话代码',
  `mobile_code` varchar(32) NOT NULL COMMENT '移动电话代码',
  `description` varchar(256) NOT NULL COMMENT '说明',
  `short_name` varchar(128) NOT NULL COMMENT '简写',
  `sort` tinyint(3) unsigned NOT NULL COMMENT '排序',
  `area` tinyint(3) NOT NULL DEFAULT '0' COMMENT '所属地区：1、北盖网通 2、南盖网通',
  `alias` varchar(255) DEFAULT NULL COMMENT '别名',
  `pinyin` varchar(45) NOT NULL COMMENT '拼音名称',
  `manage_id` smallint(5) unsigned NOT NULL COMMENT '所属大区的id',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`) USING BTREE,
  KEY `member_id` (`member_id`) USING BTREE,
  KEY `pinyin` (`pinyin`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3647 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_region_manage
-- ----------------------------
DROP TABLE IF EXISTS `gw_region_manage`;
CREATE TABLE `gw_region_manage` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(120) NOT NULL COMMENT '大区名称',
  `member_id` int(11) unsigned NOT NULL COMMENT '所属会员',
  PRIMARY KEY (`id`),
  KEY `member_id` (`member_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='盖网通大区表';

-- ----------------------------
-- Table structure for gw_region_manage_relation
-- ----------------------------
DROP TABLE IF EXISTS `gw_region_manage_relation`;
CREATE TABLE `gw_region_manage_relation` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `region_manage_id` varchar(120) NOT NULL COMMENT '大区id',
  `user_id` int(11) unsigned NOT NULL COMMENT '红色后台的账号id',
  PRIMARY KEY (`id`),
  KEY `region_manage_id` (`region_manage_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='盖网通大区关联表';

-- ----------------------------
-- Table structure for gw_repairs
-- ----------------------------
DROP TABLE IF EXISTS `gw_repairs`;
CREATE TABLE `gw_repairs` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `merchant` varchar(128) NOT NULL COMMENT '商家名',
  `address` varchar(128) NOT NULL COMMENT '商家地址',
  `mobile` varchar(45) NOT NULL COMMENT '联系电话',
  `content` text NOT NULL COMMENT '故障内容',
  `status` tinyint(1) unsigned NOT NULL COMMENT '状态（0新故障、1跟进中、2已处理）',
  `create_time` int(11) unsigned NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_rights
-- ----------------------------
DROP TABLE IF EXISTS `gw_rights`;
CREATE TABLE `gw_rights` (
  `itemname` varchar(64) NOT NULL,
  `type` int(11) unsigned NOT NULL,
  `weight` int(11) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_rsa_manage
-- ----------------------------
DROP TABLE IF EXISTS `gw_rsa_manage`;
CREATE TABLE `gw_rsa_manage` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `merchant_num` varchar(32) NOT NULL COMMENT '商户号',
  `public_key` text COMMENT '公钥',
  `private_key` text COMMENT '私钥',
  `status` tinyint(2) unsigned NOT NULL COMMENT '状态',
  `create_time` int(11) unsigned NOT NULL COMMENT '创建时间',
  `update` int(11) unsigned NOT NULL COMMENT '更新时间',
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `merchant_num` (`merchant_num`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for gw_scategory
-- ----------------------------
DROP TABLE IF EXISTS `gw_scategory`;
CREATE TABLE `gw_scategory` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `parent_id` int(11) unsigned NOT NULL COMMENT '上级分类',
  `name` varchar(128) NOT NULL COMMENT '名称',
  `store_id` int(11) unsigned NOT NULL COMMENT '所属店铺',
  `description` varchar(256) NOT NULL COMMENT '说明',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态（0禁用，1启用）',
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`) USING BTREE,
  CONSTRAINT `fk_scategory_store` FOREIGN KEY (`store_id`) REFERENCES `gw_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18094 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_seckill_auction
-- ----------------------------
DROP TABLE IF EXISTS `gw_seckill_auction`;
CREATE TABLE `gw_seckill_auction` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `goods_id` int(11) DEFAULT NULL COMMENT '产品ID',
  `start_price` decimal(18,2) DEFAULT NULL COMMENT '起拍价',
  `price_markup` decimal(18,2) DEFAULT NULL COMMENT '加价幅度',
  `status` tinyint(2) DEFAULT '1' COMMENT '状态 1开启 0关闭',
  `category_id` tinyint(5) DEFAULT '4' COMMENT '活动类别ID,默认为4拍卖',
  `rules_setting_id` int(11) DEFAULT NULL COMMENT '活动规则表ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user` varchar(50) DEFAULT NULL COMMENT '创建者',
  `store_id` int(11) NOT NULL COMMENT '商品所属店铺id',
  PRIMARY KEY (`id`),
  KEY `goods_id` (`goods_id`),
  KEY `start_price` (`start_price`),
  KEY `category_id` (`category_id`),
  KEY `rules_setting_id` (`rules_setting_id`)
) ENGINE=InnoDB AUTO_INCREMENT=658 DEFAULT CHARSET=utf8 COMMENT='秒杀活动,拍卖功能产品表';

-- ----------------------------
-- Table structure for gw_seckill_auction_agent_price
-- ----------------------------
DROP TABLE IF EXISTS `gw_seckill_auction_agent_price`;
CREATE TABLE `gw_seckill_auction_agent_price` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键自增',
  `rules_setting_id` int(11) DEFAULT NULL COMMENT '活动规则表id',
  `rules_end_time` int(11) DEFAULT NULL COMMENT '活动结束时间',
  `goods_id` int(11) DEFAULT NULL COMMENT '商品id',
  `goods_name` varchar(100) DEFAULT NULL COMMENT '商品名称',
  `member_id` int(11) DEFAULT NULL COMMENT '会员id',
  `member_gw` varchar(50) DEFAULT NULL COMMENT '会员的GW号',
  `agent_price` decimal(18,2) DEFAULT NULL COMMENT '代理价',
  `send_mobile` varchar(50) DEFAULT NULL COMMENT '接收短信手机号(如果没设置则留空)',
  `moblie_template` int(11) DEFAULT '0' COMMENT '发送短信模板',
  `mobile_is_send` tinyint(1) DEFAULT '0' COMMENT '是否已发送手机短信 0未发送 1已发送',
  `send_message` tinyint(1) DEFAULT '0' COMMENT '设置发送站内短信 0不发送 1发送',
  `message_is_send` tinyint(1) DEFAULT '0' COMMENT '是否已发送站内短信 0未发送 1已发送',
  `dateline` int(10) DEFAULT NULL COMMENT '创建时间',
  `all_over` tinyint(1) DEFAULT '0' COMMENT '所有操作完成(包括代理出价,发送手机和站内短信)',
  `is_above` tinyint(5) DEFAULT '0' COMMENT '代理价是否被超越 0未超越 1被超越 2余额不足 3流拍',
  PRIMARY KEY (`id`),
  KEY `rules_goods_member` (`rules_setting_id`,`goods_id`,`member_id`),
  KEY `dateline` (`dateline`),
  KEY `all_over` (`all_over`),
  KEY `agent_price` (`agent_price`,`dateline`),
  KEY `rules_setting_id` (`rules_setting_id`)
) ENGINE=InnoDB AUTO_INCREMENT=161 DEFAULT CHARSET=utf8 COMMENT='拍卖活动代理出价表';

-- ----------------------------
-- Table structure for gw_seckill_auction_flow
-- ----------------------------
DROP TABLE IF EXISTS `gw_seckill_auction_flow`;
CREATE TABLE `gw_seckill_auction_flow` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键自增',
  `code` varchar(32) NOT NULL COMMENT '编号',
  `member_id` int(11) NOT NULL COMMENT '会员ID',
  `gai_number` varchar(50) DEFAULT NULL COMMENT '会员GW号',
  `money` decimal(18,2) NOT NULL COMMENT '金额',
  `create_time` int(10) NOT NULL COMMENT '创建时间',
  `remark` varchar(100) NOT NULL COMMENT '备注',
  `operate_type` int(11) NOT NULL COMMENT '交易类型(47,48,49三种)',
  PRIMARY KEY (`id`),
  KEY `code` (`code`),
  KEY `member_id` (`member_id`),
  KEY `create_time` (`create_time`)
) ENGINE=InnoDB AUTO_INCREMENT=710 DEFAULT CHARSET=utf8 COMMENT='拍卖功能积分冻结和解冻流水记录表';

-- ----------------------------
-- Table structure for gw_seckill_auction_price
-- ----------------------------
DROP TABLE IF EXISTS `gw_seckill_auction_price`;
CREATE TABLE `gw_seckill_auction_price` (
  `rules_setting_id` int(11) NOT NULL COMMENT '活动规则表ID',
  `goods_id` int(11) NOT NULL COMMENT '商品ID',
  `price` decimal(18,2) NOT NULL COMMENT '当前拍卖价',
  `dateline` int(10) NOT NULL DEFAULT '0' COMMENT '出价时间',
  `member_id` int(11) DEFAULT '0' COMMENT '会员id',
  `create_order` tinyint(1) DEFAULT '0' COMMENT '是否已生成订单 0未生成 1已生成',
  `order_code` varchar(64) DEFAULT NULL COMMENT '订单编号',
  `goods_status` tinyint(2) NOT NULL COMMENT '商品原来的status状态',
  `reserve_price` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '保留价',
  `auction_end_time` int(10) DEFAULT NULL COMMENT '拍卖商品的结束时间',
  PRIMARY KEY (`rules_setting_id`,`goods_id`),
  KEY `price` (`price`),
  KEY `dateline` (`dateline`),
  KEY `member_id` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品拍卖价格表,只记录最高价';

-- ----------------------------
-- Table structure for gw_seckill_auction_record
-- ----------------------------
DROP TABLE IF EXISTS `gw_seckill_auction_record`;
CREATE TABLE `gw_seckill_auction_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `rules_setting_id` int(11) DEFAULT NULL COMMENT '活动规则表id',
  `goods_id` int(11) DEFAULT NULL COMMENT '产品id',
  `member_id` int(11) DEFAULT NULL COMMENT '会员id',
  `member_gw` varchar(30) DEFAULT NULL COMMENT '会员GW号',
  `status` tinyint(1) DEFAULT '1' COMMENT '拍卖状态 1领先 2出局',
  `auction_time` int(10) DEFAULT NULL COMMENT '拍卖时间',
  `is_return` tinyint(1) DEFAULT '0' COMMENT '积分是否返还 0未返还 1已返还',
  `balance_history` decimal(18,2) DEFAULT NULL COMMENT '历史表中的金额(由于流水要分开写)',
  `balance` decimal(18,2) DEFAULT NULL COMMENT '新表中的金额(由于流水要分开写)',
  `flow_id` int(11) NOT NULL COMMENT '对应流水表(gw_seckill_auction_flow)主键',
  `flow_code` varchar(32) NOT NULL COMMENT '对应流水表(gw_seckill_auction_flow)编号',
  PRIMARY KEY (`id`),
  KEY `goods_id` (`goods_id`),
  KEY `member_id` (`member_id`),
  KEY `auction_time` (`auction_time`),
  KEY `rules_setting_id` (`rules_setting_id`),
  KEY `member_gw` (`member_gw`),
  KEY `flow_id` (`flow_id`),
  KEY `flow_code` (`flow_code`)
) ENGINE=InnoDB AUTO_INCREMENT=757 DEFAULT CHARSET=utf8 COMMENT='拍卖商品出价记录表';

-- ----------------------------
-- Table structure for gw_seckill_auction_remind
-- ----------------------------
DROP TABLE IF EXISTS `gw_seckill_auction_remind`;
CREATE TABLE `gw_seckill_auction_remind` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键自增',
  `rules_setting_id` int(11) DEFAULT NULL COMMENT '活动规则表id',
  `rules_end_time` int(10) DEFAULT NULL COMMENT '活动结束时间',
  `goods_id` int(11) DEFAULT NULL COMMENT '商品id',
  `goods_name` varchar(100) DEFAULT NULL COMMENT '商品名称',
  `member_id` int(11) DEFAULT NULL COMMENT '会员id',
  `member_gw` varchar(50) DEFAULT NULL COMMENT '会员GW号',
  `send_mobile` varchar(50) DEFAULT NULL COMMENT '接收短信手机号(如果没设置则留空)',
  `mobile_is_send` tinyint(1) DEFAULT '0' COMMENT '手机短信是否已发送 0未发送 1已发送',
  `mobile_template` int(11) DEFAULT '0' COMMENT '手机短信模板',
  `send_message` int(1) DEFAULT '0' COMMENT '设置发送站内短信 0不发送 1发送',
  `message_is_send` tinyint(1) DEFAULT '0' COMMENT '站内短信是否已发送 0未发送 1已发送',
  `dateline` datetime DEFAULT NULL COMMENT '创建时间',
  `all_is_send` tinyint(1) DEFAULT '0' COMMENT '手机短信和站内短信都已发送 0只发了其中一种或都未发 1设置的都发了',
  PRIMARY KEY (`id`),
  KEY `rules_goods_member` (`rules_setting_id`,`goods_id`,`member_id`),
  KEY `send_mobile` (`send_mobile`),
  KEY `dateline` (`dateline`),
  KEY `rules_end_time` (`rules_end_time`),
  KEY `all_is_send` (`all_is_send`)
) ENGINE=InnoDB AUTO_INCREMENT=285 DEFAULT CHARSET=utf8 COMMENT='拍卖活动结束之前发送信息提醒表';

-- ----------------------------
-- Table structure for gw_seckill_category
-- ----------------------------
DROP TABLE IF EXISTS `gw_seckill_category`;
CREATE TABLE `gw_seckill_category` (
  `id` smallint(5) NOT NULL COMMENT '主键自增',
  `name` varchar(30) NOT NULL COMMENT '活动类型名称',
  `creat_time` datetime NOT NULL COMMENT '创建时间',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态,0不可用1可用',
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='活动的类型表';

-- ----------------------------
-- Table structure for gw_seckill_grab
-- ----------------------------
DROP TABLE IF EXISTS `gw_seckill_grab`;
CREATE TABLE `gw_seckill_grab` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键自增',
  `sort` smallint(5) NOT NULL COMMENT '轮播排序(程序自动处理)',
  `product_id` int(11) NOT NULL COMMENT '商品ID',
  `product_name` varchar(128) NOT NULL COMMENT '商品名称',
  `seller_name` varchar(128) NOT NULL COMMENT '卖家名称',
  `product_stock` int(11) NOT NULL COMMENT '商品的库存',
  `product_price` decimal(11,2) NOT NULL COMMENT '商品的零售价',
  `market_price` decimal(11,2) NOT NULL COMMENT '市场价',
  `thumbnail` varchar(255) NOT NULL COMMENT '商品缩略图',
  `rules_id` int(11) NOT NULL COMMENT '所属活动规则ID',
  `rules_name` char(10) NOT NULL COMMENT '所属活动规则的名称',
  PRIMARY KEY (`id`),
  KEY `sort` (`sort`),
  KEY `product_id` (`product_id`),
  KEY `rules_id` (`rules_id`)
) ENGINE=InnoDB AUTO_INCREMENT=157 DEFAULT CHARSET=utf8 COMMENT='今日必抢商品表';

-- ----------------------------
-- Table structure for gw_seckill_order_cache
-- ----------------------------
DROP TABLE IF EXISTS `gw_seckill_order_cache`;
CREATE TABLE `gw_seckill_order_cache` (
  `user_id` int(11) unsigned NOT NULL,
  `goods_id` int(11) unsigned NOT NULL,
  `quantity` tinyint(4) NOT NULL,
  `setting_id` int(11) NOT NULL,
  `create_time` int(11) unsigned DEFAULT NULL,
  `goods_spec_id` int(11) NOT NULL COMMENT '商品规格id',
  `order_code` varchar(50) NOT NULL COMMENT '订单编号',
  `is_process` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '缓存跟踪状态(0入队,1待确认,2已下单,3已支付)',
  PRIMARY KEY (`user_id`,`goods_id`),
  KEY `setting_id` (`setting_id`),
  KEY `order_code` (`order_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='活动成功下单缓存';

-- ----------------------------
-- Table structure for gw_seckill_playing
-- ----------------------------
DROP TABLE IF EXISTS `gw_seckill_playing`;
CREATE TABLE `gw_seckill_playing` (
  `total_number` smallint(5) NOT NULL COMMENT '轮播图总数',
  `now_number` smallint(5) NOT NULL COMMENT '当前轮播图的编号',
  `dateline` datetime NOT NULL COMMENT '轮播的时间日期'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='轮播图顺序记录表';

-- ----------------------------
-- Table structure for gw_seckill_product_audit
-- ----------------------------
DROP TABLE IF EXISTS `gw_seckill_product_audit`;
CREATE TABLE `gw_seckill_product_audit` (
  `user_id` int(10) unsigned NOT NULL COMMENT '审核人id',
  `goods_id` int(10) unsigned NOT NULL COMMENT '商品id',
  `relation_id` int(10) NOT NULL DEFAULT '0' COMMENT '商品的参加的活动ID',
  `price` decimal(11,2) NOT NULL COMMENT '价格',
  `content` varchar(200) NOT NULL COMMENT '审核结果',
  `status` tinyint(3) unsigned NOT NULL COMMENT '审核状态',
  `add_time` int(10) unsigned NOT NULL COMMENT '提交时间',
  `created` int(10) unsigned NOT NULL COMMENT '审核时间',
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `goods_id` (`goods_id`) USING BTREE,
  KEY `relation_id` (`relation_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='活动商品审核日志表';

-- ----------------------------
-- Table structure for gw_seckill_product_relation
-- ----------------------------
DROP TABLE IF EXISTS `gw_seckill_product_relation`;
CREATE TABLE `gw_seckill_product_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键自增',
  `category_id` smallint(5) NOT NULL COMMENT '活动的类型',
  `rules_seting_id` int(11) NOT NULL COMMENT '活动规则表的id',
  `product_category` mediumint(8) NOT NULL COMMENT ' 商品的一级分类',
  `product_id` int(11) NOT NULL COMMENT '产品的id',
  `product_name` varchar(128) NOT NULL COMMENT '产品的名称',
  `seller_id` int(11) NOT NULL COMMENT '商家的id',
  `seller_name` varchar(128) NOT NULL COMMENT '商家的名称',
  `status` tinyint(5) NOT NULL DEFAULT '0' COMMENT '该商品是否通过审核 0审核中 1通过 2不通过',
  `examine_time` datetime NOT NULL COMMENT '审核时间',
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  KEY `rules_id` (`rules_seting_id`),
  KEY `product_id` (`product_id`),
  KEY `product_name` (`product_name`),
  KEY `seller_id` (`seller_id`),
  KEY `seller_name` (`seller_name`),
  KEY `examine_time` (`examine_time`),
  KEY `product_category` (`product_category`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8 COMMENT='活动与商品的关系表';

-- ----------------------------
-- Table structure for gw_seckill_rules_main
-- ----------------------------
DROP TABLE IF EXISTS `gw_seckill_rules_main`;
CREATE TABLE `gw_seckill_rules_main` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键自增',
  `category_id` tinyint(5) NOT NULL COMMENT '活动类型id',
  `name` varchar(50) NOT NULL COMMENT '活动名称',
  `date_start` date NOT NULL COMMENT '活动开始日期',
  `date_end` date NOT NULL COMMENT '活动结束日期',
  `creat_user` varchar(50) NOT NULL COMMENT '活动创建人',
  `banner1` varchar(255) NOT NULL COMMENT '页面顶部banner图片',
  `banner2` varchar(255) NOT NULL COMMENT '页面第二个banner图片',
  `banner3` varchar(255) NOT NULL COMMENT '页面第三个banner图片',
  `banner4` varchar(255) NOT NULL COMMENT '页面第四个banner图片',
  `singup_start_time` datetime NOT NULL COMMENT '报名开始时间',
  `singup_end_time` datetime NOT NULL COMMENT '报名截止时间',
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  KEY `start_end` (`date_start`,`date_end`) USING BTREE,
  KEY `date_start` (`date_start`) USING BTREE,
  KEY `date_end` (`date_end`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=500 DEFAULT CHARSET=utf8 COMMENT='活动规则主表';

-- ----------------------------
-- Table structure for gw_seckill_rules_seting
-- ----------------------------
DROP TABLE IF EXISTS `gw_seckill_rules_seting`;
CREATE TABLE `gw_seckill_rules_seting` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键自增',
  `rules_id` int(11) NOT NULL COMMENT '活动主表的id',
  `status` tinyint(5) NOT NULL COMMENT '活动的状态1未开启2未开始3正在进行4已结束',
  `picture` varchar(150) NOT NULL COMMENT '活动封面图片',
  `remark` char(6) NOT NULL COMMENT '活动备注',
  `product_category_id` varchar(255) NOT NULL COMMENT '参与活动的商品类别',
  `discount_rate` decimal(5,2) DEFAULT '0.00' COMMENT '折扣方式(百分比,红包比例)',
  `discount_price` decimal(10,2) DEFAULT '0.00' COMMENT '折扣方式(限定价格)',
  `sort` mediumint(8) DEFAULT '0' COMMENT '活动的排序',
  `limit_num` mediumint(8) NOT NULL COMMENT '参与活动的商品限制数',
  `seller` smallint(2) NOT NULL COMMENT '允许商家报名商品数(0不受限)',
  `buy_limit` smallint(5) NOT NULL COMMENT 'ID限购数,0为不限购',
  `creat_time` datetime NOT NULL COMMENT '活动创建时间',
  `edit_time` datetime NOT NULL COMMENT '活动修改时间',
  `description` text NOT NULL COMMENT '活动的说明',
  `start_time` time NOT NULL COMMENT '活动的开始时间',
  `end_time` time NOT NULL COMMENT '活动的结束时间',
  `link` tinytext NOT NULL COMMENT '指定链接',
  `allow_singup` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否允许报名 0不允许 1允许',
  `is_force` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否强制结束 0否1是',
  PRIMARY KEY (`id`),
  KEY `sort` (`sort`),
  KEY `limit_num` (`limit_num`),
  KEY `buy_limit` (`buy_limit`),
  KEY `status` (`status`),
  KEY `rules_id` (`rules_id`),
  KEY `creat_time` (`creat_time`),
  KEY `start_time` (`start_time`,`end_time`),
  KEY `product_category_id` (`rules_id`,`product_category_id`,`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=519 DEFAULT CHARSET=utf8 COMMENT='活动的规则设置表';

-- ----------------------------
-- Table structure for gw_seller_log
-- ----------------------------
DROP TABLE IF EXISTS `gw_seller_log`;
CREATE TABLE `gw_seller_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `category_id` tinyint(3) unsigned NOT NULL COMMENT '所属分类',
  `title` varchar(128) NOT NULL COMMENT '标题',
  `type_id` tinyint(3) unsigned NOT NULL COMMENT '所属类型',
  `create_time` int(11) unsigned NOT NULL COMMENT '创建时间',
  `source` varchar(128) NOT NULL COMMENT '操作对象',
  `source_id` int(11) unsigned NOT NULL COMMENT '操作对象ID',
  `member_id` int(11) unsigned NOT NULL COMMENT '所属管理',
  `member_name` varchar(128) NOT NULL COMMENT '管理员名称',
  `ip` int(11) unsigned NOT NULL COMMENT 'IP',
  `is_admin` tinyint(1) unsigned NOT NULL COMMENT '是否管理员（0否，1是）',
  PRIMARY KEY (`id`),
  KEY `member_id` (`member_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=762102 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_signin
-- ----------------------------
DROP TABLE IF EXISTS `gw_signin`;
CREATE TABLE `gw_signin` (
  `create_date` int(11) unsigned NOT NULL COMMENT '签到日期',
  `create_time` int(11) unsigned NOT NULL COMMENT '签到时间',
  `ip` int(11) unsigned NOT NULL COMMENT '会员IP',
  `comment` varchar(256) NOT NULL COMMENT '签到内容',
  `machine_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '所属终端机（默认为0，会员在终端机签到才记录）',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '类型（1商城签到，2终端机签到）',
  `member_id` int(11) unsigned NOT NULL COMMENT '所属会员',
  PRIMARY KEY (`create_date`,`machine_id`,`member_id`),
  KEY `member_id` (`member_id`) USING BTREE,
  CONSTRAINT `fk_signin_member` FOREIGN KEY (`member_id`) REFERENCES `gw_member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_sms_log
-- ----------------------------
DROP TABLE IF EXISTS `gw_sms_log`;
CREATE TABLE `gw_sms_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `mobile` varchar(64) NOT NULL COMMENT '手机号码',
  `content` text NOT NULL COMMENT '内容',
  `create_time` int(11) unsigned NOT NULL COMMENT '创建时间',
  `status` tinyint(1) NOT NULL COMMENT '状态（1发送成功、2发送不成功）',
  `count` tinyint(3) unsigned NOT NULL COMMENT '发送次数',
  `target_id` int(11) unsigned NOT NULL COMMENT '对象',
  `type` tinyint(3) unsigned NOT NULL COMMENT '类型（1线上订单、2线下订单、3卡充值、4酒店订单、5验证码）',
  `source` int(11) NOT NULL DEFAULT '0' COMMENT '来源',
  `send_time` int(11) unsigned NOT NULL COMMENT '发送时间',
  `interface` tinyint(3) unsigned NOT NULL COMMENT '短信接口（1短信通、2易信、3香港易通讯）',
  `is_read` tinyint(2) NOT NULL COMMENT '是否已读，0没读，1已读',
  PRIMARY KEY (`id`),
  KEY `mobile` (`mobile`),
  KEY `target_id_type` (`target_id`,`type`)
) ENGINE=InnoDB AUTO_INCREMENT=2213231 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_spec
-- ----------------------------
DROP TABLE IF EXISTS `gw_spec`;
CREATE TABLE `gw_spec` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(128) NOT NULL COMMENT '名称',
  `type` tinyint(1) unsigned NOT NULL COMMENT '类型（1文字，2图片）',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `value` text NOT NULL COMMENT '规格值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_spec_value
-- ----------------------------
DROP TABLE IF EXISTS `gw_spec_value`;
CREATE TABLE `gw_spec_value` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(128) NOT NULL COMMENT '名称',
  `thumbnail` varchar(128) NOT NULL COMMENT '图片',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `spec_id` int(11) unsigned NOT NULL COMMENT '所属规格',
  PRIMARY KEY (`id`),
  KEY `spec_id` (`spec_id`) USING BTREE,
  CONSTRAINT `fk_spec_value_spec` FOREIGN KEY (`spec_id`) REFERENCES `gw_spec` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_special_topic
-- ----------------------------
DROP TABLE IF EXISTS `gw_special_topic`;
CREATE TABLE `gw_special_topic` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(128) NOT NULL COMMENT '名称',
  `views` int(11) unsigned NOT NULL COMMENT '浏览量',
  `summary` varchar(255) NOT NULL COMMENT '摘要',
  `create_time` int(11) unsigned NOT NULL COMMENT '创建时间',
  `thumbnail` varchar(128) NOT NULL COMMENT '代表图',
  `start_time` int(11) unsigned NOT NULL COMMENT '开始时间',
  `end_time` int(11) unsigned NOT NULL COMMENT '结束时间',
  `discount` tinyint(3) unsigned NOT NULL COMMENT '折扣',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `keywords` varchar(255) NOT NULL COMMENT '关键词',
  `description` varchar(255) NOT NULL COMMENT '说明',
  `author_id` int(11) unsigned NOT NULL COMMENT '作者',
  `author_name` varchar(56) NOT NULL COMMENT '作者名称',
  `ip` int(11) unsigned NOT NULL COMMENT 'IP',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_special_topic_category
-- ----------------------------
DROP TABLE IF EXISTS `gw_special_topic_category`;
CREATE TABLE `gw_special_topic_category` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(12) NOT NULL COMMENT '名称',
  `special_topic_id` int(11) unsigned NOT NULL COMMENT '所属专题',
  `thumbnail` varchar(128) NOT NULL COMMENT '缩略图',
  `integral_ratio` float(6,3) unsigned NOT NULL DEFAULT '100.000' COMMENT '积分支付比例，默认100',
  PRIMARY KEY (`id`),
  KEY `special_topic_id` (`special_topic_id`) USING BTREE,
  CONSTRAINT `fk_special_topic_category_special_topic` FOREIGN KEY (`special_topic_id`) REFERENCES `gw_special_topic` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_special_topic_goods
-- ----------------------------
DROP TABLE IF EXISTS `gw_special_topic_goods`;
CREATE TABLE `gw_special_topic_goods` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `special_topic_category_id` int(11) unsigned NOT NULL COMMENT '所属专题分类',
  `goods_id` int(11) unsigned NOT NULL COMMENT '所属商品',
  `special_price` decimal(10,2) unsigned NOT NULL COMMENT '活动价格',
  `special_topic_id` int(11) unsigned NOT NULL COMMENT '所属专题',
  PRIMARY KEY (`id`),
  KEY `special_topic_category_id` (`special_topic_category_id`) USING BTREE,
  KEY `goods_id` (`goods_id`) USING BTREE,
  CONSTRAINT `fk_special_topic_goods_goods` FOREIGN KEY (`goods_id`) REFERENCES `gw_goods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_special_topic_goods_special_topic_category` FOREIGN KEY (`special_topic_category_id`) REFERENCES `gw_special_topic_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_stock_log
-- ----------------------------
DROP TABLE IF EXISTS `gw_stock_log`;
CREATE TABLE `gw_stock_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `order_id` int(11) unsigned NOT NULL COMMENT '所属订单',
  `code` varchar(64) NOT NULL COMMENT '订单编号',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态  是否成功',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `details` text,
  PRIMARY KEY (`id`),
  KEY `create_time` (`create_time`) USING BTREE,
  KEY `order_id` (`order_id`) USING BTREE,
  CONSTRAINT `fk_stock_log_order` FOREIGN KEY (`order_id`) REFERENCES `gw_order` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2472 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_store
-- ----------------------------
DROP TABLE IF EXISTS `gw_store`;
CREATE TABLE `gw_store` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(128) NOT NULL COMMENT '名称',
  `province_id` int(11) unsigned NOT NULL COMMENT '省份',
  `city_id` int(11) unsigned NOT NULL COMMENT '城市',
  `district_id` int(11) unsigned NOT NULL COMMENT '区/县',
  `street` varchar(128) NOT NULL COMMENT '详细地址',
  `mobile` varchar(16) NOT NULL COMMENT '手机号码',
  `status` tinyint(1) unsigned NOT NULL COMMENT '状态（1申请中，2试用中，3申请通过，4申请被拒绝，5关闭）',
  `create_time` int(11) unsigned NOT NULL COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL COMMENT '更新时间',
  `sort` tinyint(3) unsigned NOT NULL COMMENT '排序',
  `keywords` varchar(128) NOT NULL COMMENT '关键词',
  `description` varchar(256) NOT NULL COMMENT '说明',
  `order_reminder` tinyint(3) unsigned NOT NULL COMMENT '新订单提醒时间',
  `views` int(11) unsigned NOT NULL COMMENT '浏览量',
  `description_match` decimal(11,2) unsigned NOT NULL COMMENT '描述相符评分',
  `serivice_attitude` decimal(11,2) unsigned NOT NULL COMMENT '服务态度评分',
  `speed_of_delivery` decimal(11,2) unsigned NOT NULL COMMENT '发货速度评分',
  `about_us` varchar(128) NOT NULL COMMENT '关于我们',
  `referrals_id` int(11) unsigned NOT NULL COMMENT '推荐人',
  `is_middleman` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否是居间商',
  `thumbnail` varchar(128) NOT NULL COMMENT '缩略图',
  `buy_knows` varchar(128) NOT NULL COMMENT 'BUY_KNOWS',
  `after_service` varchar(128) NOT NULL COMMENT '售后服务',
  `activites_collect` varchar(128) NOT NULL COMMENT 'ACTIVITES_COLLECT',
  `member_id` int(11) unsigned NOT NULL COMMENT '所属会员',
  `content` text NOT NULL COMMENT '家商说明',
  `comments` int(11) unsigned NOT NULL COMMENT '评论数',
  `sales` int(11) unsigned NOT NULL COMMENT '总销量',
  `logo` varchar(128) NOT NULL COMMENT 'LOGO图',
  `category_id` int(11) unsigned NOT NULL COMMENT '经营类目',
  `mode` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '模式（1免费、2收费）',
  `email` varchar(128) NOT NULL COMMENT '商铺邮箱地址',
  `slogan` varchar(128) NOT NULL COMMENT '商铺的宣传底图',
  `bg_color` char(7) NOT NULL DEFAULT '#FFFFFF' COMMENT '商铺的宣传底图的背景色',
  `qualifications` varchar(100) NOT NULL COMMENT '商铺的资质',
  `upload_total` int(11) DEFAULT '0' COMMENT '记录商店当天上传产品条数',
  `upload_time` int(11) DEFAULT '0' COMMENT '记录店铺上传时间',
  PRIMARY KEY (`id`),
  KEY `member_id` (`member_id`) USING BTREE,
  CONSTRAINT `fk_store_member` FOREIGN KEY (`member_id`) REFERENCES `gw_member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3195 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_store_account
-- ----------------------------
DROP TABLE IF EXISTS `gw_store_account`;
CREATE TABLE `gw_store_account` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `money` decimal(10,2) unsigned NOT NULL COMMENT '总授信金额',
  `surplus_money` decimal(10,2) unsigned NOT NULL COMMENT '剩余授信金额',
  `ratio` tinyint(3) unsigned NOT NULL COMMENT '盖网支持比例',
  `store_id` int(11) unsigned NOT NULL,
  `status` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`) USING BTREE,
  CONSTRAINT `fk_store_account_store` FOREIGN KEY (`store_id`) REFERENCES `gw_store` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_store_account_log
-- ----------------------------
DROP TABLE IF EXISTS `gw_store_account_log`;
CREATE TABLE `gw_store_account_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `money` decimal(10,2) unsigned NOT NULL COMMENT '金额',
  `real_name` varchar(128) NOT NULL COMMENT '操作人',
  `username` varchar(128) NOT NULL COMMENT '操作人姓名',
  `create_time` int(11) unsigned NOT NULL COMMENT '创建时间',
  `store_id` int(11) unsigned NOT NULL COMMENT '所属店铺',
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`) USING BTREE,
  CONSTRAINT `fk_store_account_log_store` FOREIGN KEY (`store_id`) REFERENCES `gw_store` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_store_address
-- ----------------------------
DROP TABLE IF EXISTS `gw_store_address`;
CREATE TABLE `gw_store_address` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `store_id` int(11) unsigned NOT NULL COMMENT '所属商家',
  `link_man` varchar(128) NOT NULL COMMENT '联系人',
  `province_id` int(11) unsigned NOT NULL COMMENT '省份',
  `city_id` int(11) unsigned NOT NULL COMMENT '城市',
  `district_id` int(11) unsigned NOT NULL COMMENT '区/县',
  `street` varchar(128) NOT NULL COMMENT '详细地址',
  `zip_code` varchar(16) NOT NULL COMMENT '邮编',
  `mobile` varchar(16) NOT NULL COMMENT '手机号码',
  `remark` text NOT NULL COMMENT '备注',
  `store_name` varchar(128) NOT NULL COMMENT '公司名称',
  `default` tinyint(1) unsigned NOT NULL COMMENT '默认（0否，1是）',
  `create_time` int(11) unsigned NOT NULL COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`) USING BTREE,
  CONSTRAINT `fk_store_address_store` FOREIGN KEY (`store_id`) REFERENCES `gw_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=948 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_store_article
-- ----------------------------
DROP TABLE IF EXISTS `gw_store_article`;
CREATE TABLE `gw_store_article` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `store_id` int(11) unsigned NOT NULL COMMENT '所属商家',
  `title` varchar(128) NOT NULL COMMENT '标题',
  `content` text NOT NULL COMMENT '内容',
  `keywords` varchar(128) NOT NULL COMMENT '关键词',
  `description` varchar(258) NOT NULL COMMENT '描述',
  `create_time` int(11) unsigned NOT NULL COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL COMMENT '更新时间',
  `is_publish` tinyint(1) unsigned NOT NULL COMMENT '是否发布（0否，1是）',
  `status` tinyint(1) unsigned NOT NULL COMMENT '状态（0未审核，1审核通过，2审核不通过）',
  `sort` tinyint(3) unsigned NOT NULL COMMENT '排序',
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`) USING BTREE,
  CONSTRAINT `fk_store_article_store` FOREIGN KEY (`store_id`) REFERENCES `gw_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=246 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_store_check
-- ----------------------------
DROP TABLE IF EXISTS `gw_store_check`;
CREATE TABLE `gw_store_check` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(128) NOT NULL COMMENT '用户名',
  `content` text NOT NULL COMMENT '操作内容',
  `create_time` int(11) unsigned NOT NULL COMMENT '创建时间',
  `store_id` int(11) unsigned NOT NULL COMMENT '所属店铺',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_store_collect
-- ----------------------------
DROP TABLE IF EXISTS `gw_store_collect`;
CREATE TABLE `gw_store_collect` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL COMMENT '店铺ID',
  `member_id` int(11) NOT NULL COMMENT '用户ID',
  `creat_time` int(11) NOT NULL COMMENT '收藏时间',
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`) USING BTREE,
  KEY `member_id` (`member_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=172 DEFAULT CHARSET=utf8 COMMENT='店铺收藏表';

-- ----------------------------
-- Table structure for gw_store_comment
-- ----------------------------
DROP TABLE IF EXISTS `gw_store_comment`;
CREATE TABLE `gw_store_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL COMMENT '店铺ID',
  `order_id` int(11) DEFAULT NULL COMMENT '订单ID',
  `description_match` tinyint(4) DEFAULT NULL COMMENT '描述相符',
  `serivice_attitude` tinyint(4) DEFAULT NULL COMMENT '服务态度',
  `speed_of_delivery` tinyint(4) DEFAULT NULL COMMENT '发货速度',
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2483 DEFAULT CHARSET=utf8 COMMENT='店铺评分';

-- ----------------------------
-- Table structure for gw_store_recommend_log
-- ----------------------------
DROP TABLE IF EXISTS `gw_store_recommend_log`;
CREATE TABLE `gw_store_recommend_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `store_id` int(11) unsigned NOT NULL COMMENT '所属店铺',
  `parent_id` int(11) unsigned NOT NULL COMMENT '绑定会员',
  `create_time` int(11) unsigned NOT NULL COMMENT '绑定时间',
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`) USING BTREE,
  CONSTRAINT `fk_store_recommend_log_store` FOREIGN KEY (`store_id`) REFERENCES `gw_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=418 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_strike_balance
-- ----------------------------
DROP TABLE IF EXISTS `gw_strike_balance`;
CREATE TABLE `gw_strike_balance` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `target_id` int(11) unsigned NOT NULL COMMENT '对象',
  `type` tinyint(1) unsigned NOT NULL COMMENT '类型（1红包订单）',
  `create_time` int(11) unsigned NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_system_log
-- ----------------------------
DROP TABLE IF EXISTS `gw_system_log`;
CREATE TABLE `gw_system_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(128) NOT NULL COMMENT '用户名',
  `info` text NOT NULL COMMENT '信息',
  `ip` int(11) unsigned NOT NULL COMMENT 'IP',
  `create_time` int(11) unsigned NOT NULL COMMENT '记录时间',
  `user_id` int(11) unsigned NOT NULL COMMENT '所属用户',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=309371 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_third_login
-- ----------------------------
DROP TABLE IF EXISTS `gw_third_login`;
CREATE TABLE `gw_third_login` (
  `member_id` int(11) unsigned NOT NULL COMMENT '盖网会员id',
  `third_id` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '第三方登录Id',
  `type` tinyint(3) DEFAULT NULL COMMENT '第三方登录平台(0.对面,1.weibo,2.qq,3.微信)',
  `create_time` int(10) unsigned DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`member_id`),
  KEY `member_id` (`member_id`) USING BTREE,
  KEY `third_id` (`third_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='第三方登录表';

-- ----------------------------
-- Table structure for gw_third_payment
-- ----------------------------
DROP TABLE IF EXISTS `gw_third_payment`;
CREATE TABLE `gw_third_payment` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `gw` varchar(32) NOT NULL COMMENT '盖网编号',
  `req_id` varchar(32) NOT NULL COMMENT '代收付流水号',
  `third_type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '第三方类型，1是高汇通',
  `bank_code` varchar(64) NOT NULL COMMENT '银行类别',
  `account_no` char(19) NOT NULL COMMENT '开户账号',
  `account_name` varchar(64) NOT NULL DEFAULT '' COMMENT '开户姓名',
  `amout` char(19) NOT NULL COMMENT '开户账号',
  `mobile` varchar(32) NOT NULL COMMENT '银行预留手机号',
  `payment_type` tinyint(3) NOT NULL DEFAULT '0' COMMENT '1是代付，2是代收',
  `create_time` int(11) unsigned NOT NULL COMMENT '代付时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='第三方代收付';

-- ----------------------------
-- Table structure for gw_transfer_order
-- ----------------------------
DROP TABLE IF EXISTS `gw_transfer_order`;
CREATE TABLE `gw_transfer_order` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `order_num` varchar(32) NOT NULL COMMENT '账单number',
  `machine_sn` varchar(64) DEFAULT NULL COMMENT '机器传过来的，防止重复提交（可为空）',
  `machine_id` int(11) unsigned DEFAULT NULL COMMENT '所在机器转账 （在商城转账可为空）',
  `source_type` tinyint(2) unsigned NOT NULL COMMENT '在哪里转账',
  `account` float(11,2) unsigned NOT NULL COMMENT '金额',
  `pay_id` int(11) unsigned NOT NULL COMMENT '付款人 会员id',
  `receive_id` int(11) unsigned NOT NULL COMMENT '收款人 会员id',
  `create_time` int(11) NOT NULL COMMENT '时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_num` (`order_num`),
  UNIQUE KEY `machine_sn` (`machine_sn`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for gw_translate
-- ----------------------------
DROP TABLE IF EXISTS `gw_translate`;
CREATE TABLE `gw_translate` (
  `category` varchar(50) NOT NULL COMMENT 'model名称',
  `cn` varchar(255) NOT NULL COMMENT '简体中文',
  `en` text COMMENT '英文',
  `num` int(11) DEFAULT '0' COMMENT '翻译次数,只记录个位',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_time` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `controller` varchar(50) DEFAULT NULL COMMENT '控制器名称',
  `action` varchar(50) DEFAULT NULL COMMENT 'action名称',
  `is_backend` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '后台模块',
  PRIMARY KEY (`category`,`cn`,`is_backend`),
  KEY `controller` (`controller`,`action`) USING BTREE,
  KEY `is_backend` (`is_backend`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for gw_type
-- ----------------------------
DROP TABLE IF EXISTS `gw_type`;
CREATE TABLE `gw_type` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(128) NOT NULL COMMENT '名称',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_type_brand
-- ----------------------------
DROP TABLE IF EXISTS `gw_type_brand`;
CREATE TABLE `gw_type_brand` (
  `type_id` int(11) unsigned NOT NULL COMMENT '类型',
  `brand_id` smallint(5) unsigned NOT NULL COMMENT '品牌',
  KEY `type_id` (`type_id`) USING BTREE,
  KEY `brand_id` (`brand_id`) USING BTREE,
  CONSTRAINT `fk_type_brand_brand` FOREIGN KEY (`brand_id`) REFERENCES `gw_brand` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_type_brand_type` FOREIGN KEY (`type_id`) REFERENCES `gw_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_type_spec
-- ----------------------------
DROP TABLE IF EXISTS `gw_type_spec`;
CREATE TABLE `gw_type_spec` (
  `type_id` int(11) unsigned NOT NULL COMMENT '类型',
  `spec_id` int(11) unsigned NOT NULL COMMENT '规格',
  KEY `type_id` (`type_id`) USING BTREE,
  KEY `spec_id` (`spec_id`) USING BTREE,
  CONSTRAINT `fk_type_spec_spec` FOREIGN KEY (`spec_id`) REFERENCES `gw_spec` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_type_spec_type` FOREIGN KEY (`type_id`) REFERENCES `gw_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_user
-- ----------------------------
DROP TABLE IF EXISTS `gw_user`;
CREATE TABLE `gw_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `username` varchar(128) NOT NULL COMMENT '用户名',
  `password` varchar(128) NOT NULL COMMENT '密码',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  `real_name` varchar(56) NOT NULL COMMENT '真实姓名',
  `mobile` varchar(16) NOT NULL COMMENT '手机号码',
  `email` varchar(128) NOT NULL COMMENT '邮箱',
  `sex` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '性别',
  `logins` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '登录次数',
  `create_time` int(11) unsigned NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=301 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_vending_machine_goods
-- ----------------------------
DROP TABLE IF EXISTS `gw_vending_machine_goods`;
CREATE TABLE `gw_vending_machine_goods` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL DEFAULT '' COMMENT '商品名称',
  `machine_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '售货机id',
  `goods_id` int(11) unsigned NOT NULL DEFAULT '0',
  `spec_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '商品型号',
  `price` decimal(18,2) unsigned NOT NULL COMMENT '售价',
  `thumb` varchar(256) NOT NULL DEFAULT '' COMMENT '封面图片',
  `unit` varchar(256) NOT NULL DEFAULT '' COMMENT 'd单位',
  `sold` int(11) NOT NULL DEFAULT '0' COMMENT '已售',
  `stock` int(11) NOT NULL DEFAULT '0' COMMENT '库存',
  `frezn_stock` int(11) NOT NULL DEFAULT '0' COMMENT '冻结库存',
  `size` varchar(256) NOT NULL DEFAULT '' COMMENT '体积、大小',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  `create_time` int(12) NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for gw_vending_machine_stock_balance
-- ----------------------------
DROP TABLE IF EXISTS `gw_vending_machine_stock_balance`;
CREATE TABLE `gw_vending_machine_stock_balance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL DEFAULT '0' COMMENT '售货机商品表的id 不是商城商品表的id',
  `machine_id` int(11) NOT NULL,
  `num` float NOT NULL DEFAULT '0' COMMENT '数量',
  `node` tinyint(2) NOT NULL DEFAULT '0' COMMENT '节点',
  `node_type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '节点类型',
  `actor_id` int(11) NOT NULL DEFAULT '0' COMMENT '消费者id',
  `balance` int(11) NOT NULL DEFAULT '0' COMMENT '最新库存',
  `cur_balance` int(11) NOT NULL DEFAULT '0' COMMENT '当前操作量',
  `create_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=249 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for gw_vote
-- ----------------------------
DROP TABLE IF EXISTS `gw_vote`;
CREATE TABLE `gw_vote` (
  `member_id` int(10) unsigned NOT NULL COMMENT '投票人id',
  `candidate_id` int(10) unsigned NOT NULL COMMENT '参选人id',
  `type` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '活动类型',
  `created` int(10) unsigned NOT NULL COMMENT '投票时间',
  KEY `member_id` (`member_id`) USING BTREE,
  KEY `candidate_id` (`candidate_id`) USING BTREE,
  KEY `type` (`type`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='投票表';

-- ----------------------------
-- Table structure for gw_web_config
-- ----------------------------
DROP TABLE IF EXISTS `gw_web_config`;
CREATE TABLE `gw_web_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `value` mediumtext CHARACTER SET ucs2,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8 COMMENT='网站配置管理信息表';

-- ----------------------------
-- Table structure for gw_weixin_trade_no
-- ----------------------------
DROP TABLE IF EXISTS `gw_weixin_trade_no`;
CREATE TABLE `gw_weixin_trade_no` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` varchar(64) NOT NULL COMMENT '订单号',
  `out_trade_no` varchar(64) NOT NULL COMMENT '微信支付时，提交的商户订单号,记录以备查询订单使用',
  `trade_no` varchar(64) NOT NULL DEFAULT '0' COMMENT '微信交易号',
  `order_type` tinyint(1) unsigned NOT NULL COMMENT '订单类型，1:盖网通,2:sku,3:便民服务,4:挂单,5:挂单批发',
  `times` smallint(5) unsigned NOT NULL COMMENT '请求微信支付次数',
  `create_time` int(10) unsigned NOT NULL COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COMMENT='盖付通-微信支付，商户订单号表';

-- ----------------------------
-- Table structure for res_log
-- ----------------------------
DROP TABLE IF EXISTS `res_log`;
CREATE TABLE `res_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `value` text NOT NULL COMMENT '提交的值',
  `error` text COMMENT '可能的报错',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42663 DEFAULT CHARSET=utf8;

-- ----------------------------
-- View structure for dimGoods
-- ----------------------------
DROP VIEW IF EXISTS `dimGoods`;
