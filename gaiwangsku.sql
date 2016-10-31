/*
Navicat MySQL Data Transfer

Source Server         : 206
Source Server Version : 50524
Source Host           : 172.18.7.206:3306
Source Database       : gaiwangsku

Target Server Type    : MYSQL
Target Server Version : 50524
File Encoding         : 65001

Date: 2016-10-31 10:53:32
*/

SET FOREIGN_KEY_CHECKS=0;

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
) ENGINE=InnoDB AUTO_INCREMENT=225571 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for gw_sku_active_goods
-- ----------------------------
DROP TABLE IF EXISTS `gw_sku_active_goods`;
CREATE TABLE `gw_sku_active_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL DEFAULT '0' COMMENT '商品名称',
  `type_name` varchar(128) NOT NULL DEFAULT '' COMMENT '待录入项目',
  `store_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺id',
  `rule_ids` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8 COMMENT='录入活动商品';

-- ----------------------------
-- Table structure for gw_sku_address
-- ----------------------------
DROP TABLE IF EXISTS `gw_sku_address`;
CREATE TABLE `gw_sku_address` (
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
  KEY `member_id` (`member_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=18137 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='收货地址';

-- ----------------------------
-- Table structure for gw_sku_address_copy
-- ----------------------------
DROP TABLE IF EXISTS `gw_sku_address_copy`;
CREATE TABLE `gw_sku_address_copy` (
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
  KEY `member_id` (`member_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=18052 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='收货地址';

-- ----------------------------
-- Table structure for gw_sku_api_log
-- ----------------------------
DROP TABLE IF EXISTS `gw_sku_api_log`;
CREATE TABLE `gw_sku_api_log` (
  `id` int(11) NOT NULL,
  `type` tinyint(3) NOT NULL DEFAULT '1' COMMENT '类型 1为用户中心  2为订单中心 3等等等',
  `path` varchar(256) NOT NULL DEFAULT '' COMMENT '访问地址',
  `data` text NOT NULL COMMENT '发送的数据',
  `result` text NOT NULL COMMENT '返回结果',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for gw_sku_app_advert
-- ----------------------------
DROP TABLE IF EXISTS `gw_sku_app_advert`;
CREATE TABLE `gw_sku_app_advert` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `app_id` tinyint(2) NOT NULL DEFAULT '1' COMMENT 'app的ID 1为盖付通 2为盖掌柜',
  `name` varchar(128) NOT NULL COMMENT '名称',
  `code` varchar(128) NOT NULL COMMENT '编码',
  `content` text NOT NULL COMMENT '内容',
  `type` tinyint(1) unsigned NOT NULL COMMENT '类型（1单个图片，2幻灯片，3文字）',
  `status` tinyint(1) unsigned NOT NULL COMMENT '状态（0禁用，1启用）',
  `width` smallint(5) unsigned NOT NULL COMMENT '图片宽度',
  `height` smallint(5) unsigned NOT NULL COMMENT '图片高度',
  `click` int(11) NOT NULL DEFAULT '0' COMMENT '点击次数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_sku_app_advert_picture
-- ----------------------------
DROP TABLE IF EXISTS `gw_sku_app_advert_picture`;
CREATE TABLE `gw_sku_app_advert_picture` (
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
  `province_id` int(11) NOT NULL DEFAULT '0' COMMENT '省份',
  `city_id` int(11) NOT NULL DEFAULT '0' COMMENT '城市',
  PRIMARY KEY (`id`),
  KEY `advert_id` (`advert_id`) USING BTREE,
  CONSTRAINT `gw_sku_app_advert_picture_ibfk_1` FOREIGN KEY (`advert_id`) REFERENCES `gw_sku_app_advert` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_sku_apply_barcode_goods
-- ----------------------------
DROP TABLE IF EXISTS `gw_sku_apply_barcode_goods`;
CREATE TABLE `gw_sku_apply_barcode_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `barcode` varchar(13) NOT NULL DEFAULT '0' COMMENT '条形码',
  `name` varchar(128) NOT NULL DEFAULT '' COMMENT '商品名称',
  `cate_id` int(8) NOT NULL DEFAULT '0' COMMENT '分类id',
  `cate_name` varchar(128) NOT NULL DEFAULT '' COMMENT '分类',
  `default_price` decimal(8,0) NOT NULL COMMENT '售价',
  `thumb` varchar(128) NOT NULL DEFAULT '' COMMENT '缩略图',
  `model` varchar(25) NOT NULL DEFAULT '' COMMENT '规格',
  `unit` varchar(25) NOT NULL DEFAULT '' COMMENT '单位',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `goods_id` int(11) NOT NULL COMMENT '产品库商品id',
  `status` varchar(32) NOT NULL,
  `describe` varchar(128) NOT NULL,
  `member_id` int(11) NOT NULL,
  `reward_money` decimal(8,2) NOT NULL COMMENT '可获得奖励金额',
  `temp_id` varchar(128) NOT NULL,
  `apply_time` int(11) NOT NULL COMMENT '审核时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=313 DEFAULT CHARSET=utf8 COMMENT='产品库录入审核';

-- ----------------------------
-- Table structure for gw_sku_audting
-- ----------------------------
DROP TABLE IF EXISTS `gw_sku_audting`;
CREATE TABLE `gw_sku_audting` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(11) unsigned NOT NULL,
  `status` tinyint(2) NOT NULL,
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Audtingmember` (`member_id`),
  CONSTRAINT `Audtingmember` FOREIGN KEY (`member_id`) REFERENCES `gaiwang`.`gw_member` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='超市商家审核表';

-- ----------------------------
-- Table structure for gw_sku_auth_assignment
-- ----------------------------
DROP TABLE IF EXISTS `gw_sku_auth_assignment`;
CREATE TABLE `gw_sku_auth_assignment` (
  `itemname` varchar(64) NOT NULL,
  `userid` varchar(64) NOT NULL,
  `bizrule` text,
  `data` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_sku_auth_item
-- ----------------------------
DROP TABLE IF EXISTS `gw_sku_auth_item`;
CREATE TABLE `gw_sku_auth_item` (
  `name` varchar(64) NOT NULL,
  `type` int(11) unsigned NOT NULL,
  `description` text,
  `bizrule` text,
  `data` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_sku_auth_item_child
-- ----------------------------
DROP TABLE IF EXISTS `gw_sku_auth_item_child`;
CREATE TABLE `gw_sku_auth_item_child` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_sku_bank_account
-- ----------------------------
DROP TABLE IF EXISTS `gw_sku_bank_account`;
CREATE TABLE `gw_sku_bank_account` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `member_id` int(11) unsigned NOT NULL COMMENT '所属会员',
  `account_name` varchar(128) NOT NULL COMMENT '账户名',
  `mobile` int(15) NOT NULL DEFAULT '0' COMMENT '手机号码',
  `province_id` int(11) unsigned NOT NULL COMMENT '省份',
  `city_id` int(11) unsigned NOT NULL COMMENT '城市',
  `district_id` int(11) unsigned NOT NULL COMMENT '区/县',
  `street` varchar(128) NOT NULL COMMENT '详细地址',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '卡片类型 1为银行卡 2为信用卡',
  `bank_name` varchar(128) NOT NULL COMMENT '开户银行',
  `account` varchar(128) NOT NULL COMMENT '账号',
  `cardno` varchar(18) NOT NULL DEFAULT '' COMMENT '身份证',
  `licence_image` varchar(128) NOT NULL COMMENT '开户银行许可证电子版',
  `sister_bank_number` varchar(128) NOT NULL COMMENT '支行联行号',
  `sister_bank_name` varchar(128) NOT NULL,
  `expire_year` int(4) NOT NULL DEFAULT '0',
  `expire_month` int(2) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态  0为待审核，1为审核通过，2为审核不通过',
  `auto_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '自动审核状态',
  `is_default` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否默认卡',
  PRIMARY KEY (`id`),
  KEY `member_id` (`member_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9016 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_sku_bank_auth_record
-- ----------------------------
DROP TABLE IF EXISTS `gw_sku_bank_auth_record`;
CREATE TABLE `gw_sku_bank_auth_record` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `bank_code` tinyint(4) NOT NULL DEFAULT '0' COMMENT '银行代码',
  `account` varchar(20) NOT NULL DEFAULT '' COMMENT '银行卡账号',
  `account_name` varchar(20) NOT NULL DEFAULT '' COMMENT '账户名',
  `mobile` varchar(13) NOT NULL DEFAULT '' COMMENT '电话',
  `cardno` varchar(18) NOT NULL DEFAULT '' COMMENT '身份证',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态  ',
  `create_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for gw_sku_barcode_goods
-- ----------------------------
DROP TABLE IF EXISTS `gw_sku_barcode_goods`;
CREATE TABLE `gw_sku_barcode_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `barcode` varchar(16) NOT NULL DEFAULT '' COMMENT '条码',
  `name` varchar(128) NOT NULL DEFAULT '' COMMENT '商品名称',
  `brand` varchar(64) NOT NULL DEFAULT '' COMMENT '品牌',
  `cate_id` int(8) NOT NULL DEFAULT '0' COMMENT '分类id',
  `cate_name` varchar(128) NOT NULL DEFAULT '' COMMENT '分类',
  `default_price` decimal(8,0) NOT NULL DEFAULT '0' COMMENT '默认售价',
  `thumb` varchar(128) NOT NULL DEFAULT '' COMMENT '缩略图',
  `model` varchar(128) NOT NULL DEFAULT '' COMMENT '规格',
  `unit` varchar(25) NOT NULL DEFAULT '' COMMENT '单位',
  `store` int(11) NOT NULL,
  `outlets` int(11) NOT NULL DEFAULT '0' COMMENT '网点id（售货机、超市、等 ）',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `is_custom` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否自定义商品  0为否 1为是',
  `status` varchar(32) NOT NULL,
  `describe` varchar(128) NOT NULL COMMENT '商品描述',
  `apply_num` int(11) NOT NULL COMMENT '申请人数',
  `apply_time` int(11) NOT NULL DEFAULT '0' COMMENT '最新申请时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=222 DEFAULT CHARSET=utf8 COMMENT='商品条码库';

-- ----------------------------
-- Table structure for gw_sku_barcode_goods_log
-- ----------------------------
DROP TABLE IF EXISTS `gw_sku_barcode_goods_log`;
CREATE TABLE `gw_sku_barcode_goods_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '操作人id',
  `file` varchar(128) NOT NULL COMMENT '上传的文件',
  `status` tinyint(1) NOT NULL COMMENT '状态，0 成功，1 失败',
  `data` tinytext NOT NULL COMMENT 'json数据',
  `create_time` int(11) NOT NULL COMMENT '操作时间',
  `mark` varchar(128) NOT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_sku_barcode_goods_picture
-- ----------------------------
DROP TABLE IF EXISTS `gw_sku_barcode_goods_picture`;
CREATE TABLE `gw_sku_barcode_goods_picture` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `goods_id` int(11) unsigned NOT NULL COMMENT '所属条码库商品',
  `path` varchar(128) NOT NULL COMMENT '路径',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '255' COMMENT '排序',
  PRIMARY KEY (`id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=232 DEFAULT CHARSET=utf8 COMMENT='线下商品图片';

-- ----------------------------
-- Table structure for gw_sku_cash_history
-- ----------------------------
DROP TABLE IF EXISTS `gw_sku_cash_history`;
CREATE TABLE `gw_sku_cash_history` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `code` varchar(64) NOT NULL DEFAULT '' COMMENT '订单编号',
  `applyer` varchar(128) NOT NULL COMMENT '申请人',
  `account_name` varchar(128) NOT NULL COMMENT '账户名',
  `bank_name` varchar(128) NOT NULL COMMENT '银行名称',
  `bank_address` varchar(128) NOT NULL COMMENT '银行地址',
  `account` varchar(128) NOT NULL COMMENT '银行帐号',
  `score` decimal(10,2) NOT NULL COMMENT '积分',
  `money` decimal(10,2) NOT NULL COMMENT '金额',
  `apply_time` int(11) unsigned NOT NULL COMMENT '申请时间',
  `ip` int(11) unsigned NOT NULL COMMENT 'IP',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态（0申请中、1已审核、2转账中、3已转账，4转账失败）',
  `reason` text NOT NULL COMMENT '失败原因',
  `type` tinyint(1) unsigned NOT NULL COMMENT '类型（1兑现-代理商，2提现-商户，3提现-普通会员）',
  `member_id` int(11) unsigned NOT NULL COMMENT '所属会员',
  `factorage` decimal(10,2) NOT NULL COMMENT '手续费率',
  `update_time` int(11) unsigned DEFAULT NULL,
  `is_review` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否已经审阅',
  `is_check` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '审核（0未审核、1已审核）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `member_id` (`member_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_sku_category
-- ----------------------------
DROP TABLE IF EXISTS `gw_sku_category`;
CREATE TABLE `gw_sku_category` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `parent_id` int(11) unsigned NOT NULL COMMENT '上级分类',
  `name` varchar(128) NOT NULL COMMENT '名称',
  `short_name` varchar(128) NOT NULL COMMENT '简写（app用）',
  `alias` varchar(128) NOT NULL COMMENT '英文别名',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态（0禁用1显示）',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
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
) ENGINE=InnoDB AUTO_INCREMENT=897 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='商品分类';

-- ----------------------------
-- Table structure for gw_sku_category_staple
-- ----------------------------
DROP TABLE IF EXISTS `gw_sku_category_staple`;
CREATE TABLE `gw_sku_category_staple` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) NOT NULL COMMENT '名称',
  `category_id` int(11) unsigned NOT NULL COMMENT '所属分类',
  `type_id` int(11) unsigned NOT NULL COMMENT '所属类型',
  `store_id` int(11) unsigned NOT NULL COMMENT '所属店铺',
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`),
  CONSTRAINT `gw_sku_category_staple_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `gw_store` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8 COMMENT='店铺常用分类';

-- ----------------------------
-- Table structure for gw_sku_checkcode
-- ----------------------------
DROP TABLE IF EXISTS `gw_sku_checkcode`;
CREATE TABLE `gw_sku_checkcode` (
  `phone` varchar(20) NOT NULL COMMENT '手机号码',
  `checkcode` char(6) DEFAULT NULL COMMENT '短信验证码',
  `create_time` int(10) unsigned NOT NULL,
  PRIMARY KEY (`phone`),
  UNIQUE KEY `phone` (`phone`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='sku接口短信验证码记录表';

-- ----------------------------
-- Table structure for gw_sku_client_token
-- ----------------------------
DROP TABLE IF EXISTS `gw_sku_client_token`;
CREATE TABLE `gw_sku_client_token` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(11) unsigned NOT NULL,
  `gai_number` varchar(32) NOT NULL DEFAULT '',
  `token` varchar(32) NOT NULL DEFAULT '',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `version` varchar(10) NOT NULL,
  `expir_time` int(11) NOT NULL DEFAULT '0' COMMENT '超时时间',
  `lang` varchar(12) NOT NULL DEFAULT '' COMMENT '语言',
  `city_id` int(11) NOT NULL DEFAULT '0' COMMENT '定位的城市id',
  `device_id` varchar(32) NOT NULL DEFAULT '' COMMENT '设备id',
  PRIMARY KEY (`id`),
  KEY `member_id` (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for gw_sku_common_account
-- ----------------------------
DROP TABLE IF EXISTS `gw_sku_common_account`;
CREATE TABLE `gw_sku_common_account` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(128) NOT NULL COMMENT '名称',
  `type` tinyint(3) unsigned NOT NULL COMMENT '类型（1公共总帐户、3盖网收益帐户）',
  `city_id` int(11) unsigned NOT NULL COMMENT '地区（省/市/区）',
  `sku_number` varchar(128) NOT NULL COMMENT 'SW号',
  PRIMARY KEY (`id`),
  KEY `city_id` (`city_id`) USING BTREE,
  KEY `type` (`type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_sku_deposit_order
-- ----------------------------
DROP TABLE IF EXISTS `gw_sku_deposit_order`;
CREATE TABLE `gw_sku_deposit_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(32) NOT NULL COMMENT '订单编号',
  `member_id` int(11) NOT NULL COMMENT '会员id',
  `mobile` varchar(13) NOT NULL COMMENT '电话号码',
  `pay_price` decimal(11,2) NOT NULL COMMENT '押金金额',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `pay_time` int(11) NOT NULL COMMENT '支付时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for gw_sku_distribution
-- ----------------------------
DROP TABLE IF EXISTS `gw_sku_distribution`;
CREATE TABLE `gw_sku_distribution` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `member_id` int(12) NOT NULL COMMENT '用户id',
  `mobile` varchar(32) NOT NULL COMMENT '手机号码',
  `name` varchar(32) NOT NULL COMMENT '配送员姓名',
  `deposit_status` tinyint(1) NOT NULL COMMENT '押金状态',
  `service_count` int(12) NOT NULL COMMENT '服务次数',
  `status` tinyint(1) NOT NULL COMMENT '启用状态',
  `create_time` int(11) NOT NULL COMMENT '注册时间',
  `member_personal_id` int(11) NOT NULL COMMENT '对应个人认证表id',
  `bind_store_id` varchar(100) NOT NULL COMMENT '驻店json',
  `range_store_id` varchar(255) NOT NULL COMMENT '中心店铺范围内的商铺集',
  `select_store_id` int(12) NOT NULL COMMENT '当前驻点',
  `bind_store` varchar(20) NOT NULL COMMENT '驻店',
  `lng` double(15,8) NOT NULL DEFAULT '0.00000000' COMMENT '经度',
  `lat` double(15,8) NOT NULL DEFAULT '0.00000000' COMMENT '纬度',
  `range_status` tinyint(1) NOT NULL COMMENT '范围状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for gw_sku_distribution_order
-- ----------------------------
DROP TABLE IF EXISTS `gw_sku_distribution_order`;
CREATE TABLE `gw_sku_distribution_order` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `order_id` int(12) NOT NULL COMMENT '订单id',
  `status` tinyint(1) NOT NULL COMMENT '订单状态',
  `create_time` int(11) NOT NULL COMMENT '接单时间',
  `order_code` varchar(32) NOT NULL COMMENT '订单编号',
  `distribution_id` int(11) NOT NULL COMMENT '配送员Id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for gw_sku_en_goods_rule
-- ----------------------------
DROP TABLE IF EXISTS `gw_sku_en_goods_rule`;
CREATE TABLE `gw_sku_en_goods_rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL DEFAULT '0' COMMENT '项目',
  `type` varchar(128) NOT NULL DEFAULT '' COMMENT '项目类型',
  `upload_bonus` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '上传奖励',
  `adopt_bonus` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '采纳奖励',
  `is_input` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否录入  0为否 1为是',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=utf8 COMMENT='产品库商品录入规则';

-- ----------------------------
-- Table structure for gw_sku_fresh_machine
-- ----------------------------
DROP TABLE IF EXISTS `gw_sku_fresh_machine`;
CREATE TABLE `gw_sku_fresh_machine` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `code` char(12) NOT NULL DEFAULT '' COMMENT '装机编码，由系统自动生成,12位数字组成',
  `thumb` varchar(128) NOT NULL DEFAULT '' COMMENT '缩略图',
  `mobile` varchar(13) NOT NULL DEFAULT '' COMMENT '管理员手机',
  `partner_id` int(11) NOT NULL DEFAULT '0' COMMENT '拥有者商家id',
  `category_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺分类',
  `activation_code` varchar(50) NOT NULL DEFAULT '' COMMENT '系统生成的激活码',
  `name` varchar(128) NOT NULL DEFAULT '' COMMENT '售货机名称',
  `password` varchar(128) NOT NULL DEFAULT '' COMMENT '管理密码',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态（0、申请 1、启用 2、禁用）',
  `is_activate` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否激活（0未激活、1已激活）',
  `symbol` varchar(20) NOT NULL DEFAULT 'RMB' COMMENT '币种(RMB、HKD)',
  `country_id` mediumint(8) unsigned NOT NULL DEFAULT '1' COMMENT '国家id',
  `province_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '省份id',
  `city_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '城市id',
  `district_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '区县id',
  `address` varchar(225) NOT NULL DEFAULT '' COMMENT '地址',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '管理员id',
  `user_ip` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '管理员ip',
  `member_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '商家id',
  `setup_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '安装时间',
  `remark` varchar(200) NOT NULL DEFAULT '' COMMENT '备注',
  `private_key` text NOT NULL COMMENT '私钥',
  `public_key` text NOT NULL COMMENT '公钥',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `device_id` char(64) NOT NULL DEFAULT '' COMMENT '设备id',
  `lng` double(15,8) NOT NULL DEFAULT '0.00000000' COMMENT '经度',
  `lat` double(15,8) NOT NULL DEFAULT '0.00000000' COMMENT '维度',
  `fee` tinyint(2) NOT NULL DEFAULT '8' COMMENT '服务费',
  `is_recommend` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否推荐',
  `is_over_amount` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否超过每日最大营业额',
  `max_amount_preday` decimal(13,2) NOT NULL DEFAULT '0.00' COMMENT '每日最大营业额',
  `recommend_side` varchar(64) NOT NULL DEFAULT '' COMMENT '推荐位置',
  `solds` int(10) NOT NULL DEFAULT '0',
  `temp_goods` text NOT NULL COMMENT '商品数据',
  `referrals_id` int(11) NOT NULL DEFAULT '0' COMMENT '推荐人',
  `flash_back_status` tinyint(1) NOT NULL COMMENT '闪退状态',
  `version` varchar(12) NOT NULL COMMENT '版本号',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '生鲜机类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='生鲜机表';

-- ----------------------------
-- Table structure for gw_sku_fresh_machine_copy
-- ----------------------------
DROP TABLE IF EXISTS `gw_sku_fresh_machine_copy`;
CREATE TABLE `gw_sku_fresh_machine_copy` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `code` char(12) NOT NULL DEFAULT '' COMMENT '装机编码，由系统自动生成,12位数字组成',
  `thumb` varchar(128) NOT NULL DEFAULT '' COMMENT '缩略图',
  `mobile` varchar(13) NOT NULL DEFAULT '' COMMENT '管理员手机',
  `partner_id` int(11) NOT NULL DEFAULT '0' COMMENT '拥有者商家id',
  `category_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺分类',
  `activation_code` varchar(50) NOT NULL DEFAULT '' COMMENT '系统生成的激活码',
  `name` varchar(128) NOT NULL DEFAULT '' COMMENT '售货机名称',
  `password` varchar(128) NOT NULL DEFAULT '' COMMENT '管理密码',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态（0、申请 1、启用 2、禁用）',
  `is_activate` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否激活（0未激活、1已激活）',
  `symbol` varchar(20) NOT NULL DEFAULT 'RMB' COMMENT '币种(RMB、HKD)',
  `country_id` mediumint(8) unsigned NOT NULL DEFAULT '1' COMMENT '国家id',
  `province_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '省份id',
  `city_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '城市id',
  `district_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '区县id',
  `address` varchar(225) NOT NULL DEFAULT '' COMMENT '地址',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '管理员id',
  `user_ip` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '管理员ip',
  `member_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '商家id',
  `setup_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '安装时间',
  `remark` varchar(200) NOT NULL DEFAULT '' COMMENT '备注',
  `private_key` text NOT NULL COMMENT '私钥',
  `public_key` text NOT NULL COMMENT '公钥',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `device_id` char(64) NOT NULL DEFAULT '' COMMENT '设备id',
  `lng` double(15,8) NOT NULL DEFAULT '0.00000000' COMMENT '经度',
  `lat` double(15,8) NOT NULL DEFAULT '0.00000000' COMMENT '维度',
  `fee` tinyint(2) NOT NULL DEFAULT '8' COMMENT '服务费',
  `is_recommend` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否推荐',
  `is_over_amount` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否超过每日最大营业额',
  `max_amount_preday` decimal(13,2) NOT NULL DEFAULT '0.00' COMMENT '每日最大营业额',
  `recommend_side` varchar(64) NOT NULL DEFAULT '' COMMENT '推荐位置',
  `solds` int(10) NOT NULL DEFAULT '0',
  `temp_goods` text NOT NULL COMMENT '商品数据',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='生鲜机表';

-- ----------------------------
-- Table structure for gw_sku_fresh_machine_goods
-- ----------------------------
DROP TABLE IF EXISTS `gw_sku_fresh_machine_goods`;
CREATE TABLE `gw_sku_fresh_machine_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) unsigned NOT NULL COMMENT '所属商家',
  `machine_id` int(11) unsigned NOT NULL COMMENT '所属超市',
  `line_id` int(11) NOT NULL DEFAULT '0' COMMENT '货道id',
  `line_code` varchar(32) NOT NULL DEFAULT '' COMMENT '货道编码',
  `weight` int(6) NOT NULL DEFAULT '50' COMMENT '单位重量 单位为克',
  `specifications` varchar(100) NOT NULL COMMENT '规格',
  `expr_time` int(11) NOT NULL COMMENT '有效期限',
  `goods_address` varchar(200) NOT NULL COMMENT '产地',
  `price` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '售价',
  `status` tinyint(2) NOT NULL DEFAULT '2' COMMENT '状态',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `superMember` (`goods_id`),
  KEY `machineId` (`machine_id`) USING BTREE,
  CONSTRAINT `gw_sku_fresh_machine_goods_ibfk_1` FOREIGN KEY (`goods_id`) REFERENCES `gw_sku_goods` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8 COMMENT='超市商品表';

-- ----------------------------
-- Table structure for gw_sku_fresh_machine_line
-- ----------------------------
DROP TABLE IF EXISTS `gw_sku_fresh_machine_line`;
CREATE TABLE `gw_sku_fresh_machine_line` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `machine_id` int(11) NOT NULL DEFAULT '0' COMMENT '生鲜机id',
  `rent_partner_id` int(11) NOT NULL DEFAULT '0' COMMENT '租用货道的合作商家id',
  `rent_member_id` int(11) NOT NULL DEFAULT '0' COMMENT '租用者id',
  `name` varchar(128) NOT NULL DEFAULT '',
  `code` varchar(128) NOT NULL DEFAULT '' COMMENT '货道代码',
  `expir_time` int(11) NOT NULL DEFAULT '0' COMMENT '有效期',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否占用 0为未使用 1为已使用',
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `machine_id` (`machine_id`),
  KEY `rent_partner_id` (`rent_partner_id`),
  KEY `rent_member_id` (`rent_member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=171 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for gw_sku_fresh_quest_result
-- ----------------------------
DROP TABLE IF EXISTS `gw_sku_fresh_quest_result`;
CREATE TABLE `gw_sku_fresh_quest_result` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '申请类型',
  `name` varchar(60) NOT NULL DEFAULT '' COMMENT '问卷名称',
  `mobile` varchar(15) NOT NULL DEFAULT '0' COMMENT '手机号',
  `data` text NOT NULL COMMENT '问卷数据  序列化数据',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `mobile` (`mobile`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COMMENT='问卷调查表';

-- ----------------------------
-- Table structure for gw_sku_goods
-- ----------------------------
DROP TABLE IF EXISTS `gw_sku_goods`;
CREATE TABLE `gw_sku_goods` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL DEFAULT '' COMMENT '商品名称',
  `sec_title` varchar(50) NOT NULL DEFAULT '' COMMENT '次标题',
  `source_cate_id` int(11) NOT NULL DEFAULT '0' COMMENT '原始商品分类',
  `cate_id` int(11) NOT NULL DEFAULT '0' COMMENT '所属分类',
  `thumb` varchar(128) NOT NULL DEFAULT '' COMMENT '缩略图',
  `content` text NOT NULL COMMENT '商品详情（选填）',
  `partner_id` int(11) NOT NULL DEFAULT '0',
  `member_id` int(11) unsigned NOT NULL COMMENT '所属商家',
  `supply_price` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '供货价',
  `price` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '价格',
  `barcode` varchar(16) NOT NULL DEFAULT '' COMMENT '条码',
  `specifications` varchar(100) NOT NULL,
  `weight` double(50,0) NOT NULL,
  `expr_time` int(11) NOT NULL,
  `goods_address` varchar(200) NOT NULL,
  `is_barcode` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否标准条码',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `score` decimal(2,1) NOT NULL DEFAULT '0.0' COMMENT '综合评分',
  `is_one` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否一元购商品',
  `is_promo` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否促销商品',
  `is_for` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否专供商品',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `superMember` (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=231 DEFAULT CHARSET=utf8 COMMENT='商家商品表';

-- ----------------------------
-- Table structure for gw_sku_goods_category
-- ----------------------------
DROP TABLE IF EXISTS `gw_sku_goods_category`;
CREATE TABLE `gw_sku_goods_category` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `member_id` int(11) unsigned NOT NULL COMMENT '所属线下商家',
  `parent_id` int(11) unsigned NOT NULL COMMENT '父级',
  `name` varchar(128) NOT NULL COMMENT '名称',
  `tree` text NOT NULL COMMENT '节点',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '255' COMMENT '排序',
  PRIMARY KEY (`id`),
  KEY `m_id` (`member_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8 COMMENT='线下商品分类';

-- ----------------------------
-- Table structure for gw_sku_goods_comment
-- ----------------------------
DROP TABLE IF EXISTS `gw_sku_goods_comment`;
CREATE TABLE `gw_sku_goods_comment` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL COMMENT '评价内容',
  `score` decimal(2,1) unsigned NOT NULL COMMENT '综合评分',
  `service_score` decimal(2,1) unsigned NOT NULL COMMENT '商家服务评分',
  `quality_score` decimal(2,1) unsigned NOT NULL COMMENT '商品质量评分',
  `create_time` int(11) unsigned NOT NULL COMMENT '评论时间',
  `member_id` int(11) unsigned NOT NULL COMMENT '会员id',
  `partner_id` int(11) unsigned NOT NULL COMMENT '加盟商id',
  `goods_id` int(11) unsigned NOT NULL COMMENT '线下商品id',
  `store_goods_id` int(11) NOT NULL DEFAULT '0' COMMENT '门店或售货机绑定的商品id',
  `order_id` int(11) unsigned NOT NULL COMMENT '线下订单id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='线下商品评论表';

-- ----------------------------
-- Table structure for gw_sku_goods_copy
-- ----------------------------
DROP TABLE IF EXISTS `gw_sku_goods_copy`;
CREATE TABLE `gw_sku_goods_copy` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL DEFAULT '' COMMENT '商品名称',
  `sec_title` varchar(50) NOT NULL DEFAULT '' COMMENT '次标题',
  `source_cate_id` int(11) NOT NULL DEFAULT '0' COMMENT '原始商品分类',
  `cate_id` int(11) NOT NULL DEFAULT '0' COMMENT '所属分类',
  `thumb` varchar(128) NOT NULL DEFAULT '' COMMENT '缩略图',
  `content` text NOT NULL COMMENT '商品详情（选填）',
  `partner_id` int(11) NOT NULL DEFAULT '0',
  `member_id` int(11) unsigned NOT NULL COMMENT '所属商家',
  `supply_price` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '供货价',
  `price` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '价格',
  `barcode` varchar(13) NOT NULL DEFAULT '' COMMENT '条形码',
  `is_barcode` int(13) NOT NULL DEFAULT '0' COMMENT '是否条码库商品',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `score` decimal(2,1) NOT NULL DEFAULT '0.0' COMMENT '综合评分',
  `is_one` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否一元购商品',
  `is_promo` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否促销商品',
  `is_for` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否专供商品',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `superMember` (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8 COMMENT='商家商品表';

-- ----------------------------
-- Table structure for gw_sku_goods_picture
-- ----------------------------
DROP TABLE IF EXISTS `gw_sku_goods_picture`;
CREATE TABLE `gw_sku_goods_picture` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `goods_id` int(11) unsigned NOT NULL COMMENT '所属线下商品',
  `path` varchar(128) NOT NULL COMMENT '路径',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '255' COMMENT '排序',
  PRIMARY KEY (`id`),
  KEY `goods_id` (`goods_id`) USING BTREE,
  CONSTRAINT `gw_sku_goods_picture_ibfk_1` FOREIGN KEY (`goods_id`) REFERENCES `gw_sku_goods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=283 DEFAULT CHARSET=utf8 COMMENT='线下商品图片';

-- ----------------------------
-- Table structure for gw_sku_goods_stock
-- ----------------------------
DROP TABLE IF EXISTS `gw_sku_goods_stock`;
CREATE TABLE `gw_sku_goods_stock` (
  `id` int(12) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `project` tinyint(3) NOT NULL DEFAULT '0' COMMENT '所属项目  售货机、商城、线下商品、超市项目',
  `type` tinyint(3) NOT NULL DEFAULT '0' COMMENT '商品类型( 售货机商品、超市商品、线上商品等 )',
  `outlets` int(11) NOT NULL DEFAULT '0' COMMENT '销售网点id （售货机 超市等的id,0时为线上商品）',
  `target` bigint(13) NOT NULL DEFAULT '0' COMMENT '目标商品id或条形码',
  `stock` int(11) NOT NULL DEFAULT '0' COMMENT '现有库存',
  `frozen_stock` int(11) NOT NULL DEFAULT '0' COMMENT '冻结库存',
  `shipment_sum` int(11) NOT NULL DEFAULT '0' COMMENT '出货总数',
  `purchase_sum` int(11) NOT NULL DEFAULT '0' COMMENT '进货总数',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `country` tinyint(3) NOT NULL DEFAULT '0' COMMENT '国家id',
  `save_type` tinyint(2) NOT NULL DEFAULT '1' COMMENT 'Incremental or Absolute 1为绝对 2为增量',
  PRIMARY KEY (`id`),
  KEY `selectNormal` (`project`,`outlets`,`target`)
) ENGINE=InnoDB AUTO_INCREMENT=420 DEFAULT CHARSET=utf8 COMMENT='商品库存表';

-- ----------------------------
-- Table structure for gw_sku_goods_stock_balance
-- ----------------------------
DROP TABLE IF EXISTS `gw_sku_goods_stock_balance`;
CREATE TABLE `gw_sku_goods_stock_balance` (
  `id` int(13) NOT NULL AUTO_INCREMENT,
  `s_id` int(11) NOT NULL DEFAULT '0' COMMENT 'sku关联id',
  `node` int(5) NOT NULL DEFAULT '0' COMMENT '业务节点',
  `node_type` tinyint(3) NOT NULL DEFAULT '0' COMMENT '节点类型',
  `num` int(11) NOT NULL DEFAULT '0' COMMENT '操作数量',
  `balance` int(11) NOT NULL DEFAULT '0' COMMENT '最新库存',
  `cur_balance` int(11) NOT NULL DEFAULT '0' COMMENT '当前操作量',
  `cur_frozen` int(11) NOT NULL DEFAULT '0' COMMENT '当前冻结库存',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `remark` varchar(256) NOT NULL DEFAULT '' COMMENT '备注',
  `data` text COMMENT '相关数据',
  PRIMARY KEY (`id`),
  KEY `sid` (`s_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6271 DEFAULT CHARSET=utf8 COMMENT='商品库存流水表';

-- ----------------------------
-- Table structure for gw_sku_guadan
-- ----------------------------
DROP TABLE IF EXISTS `gw_sku_guadan`;
CREATE TABLE `gw_sku_guadan` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(30) NOT NULL COMMENT '订单编号',
  `member_id` int(11) unsigned NOT NULL COMMENT 'sku的member_id,非盖网',
  `gai_number` varchar(18) NOT NULL DEFAULT '' COMMENT '盖网号',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '积分类型  1为待绑定积分  2为非绑定积分',
  `amount` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '挂单金额',
  `amount_remain` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '剩余余额',
  `discount` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '百分比折扣',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态（1正常 2冻结 3撤销）',
  `create_time` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=356 DEFAULT CHARSET=utf8 COMMENT='挂单记录表';

-- ----------------------------
-- Table structure for gw_sku_guadan_collect
-- ----------------------------
DROP TABLE IF EXISTS `gw_sku_guadan_collect`;
CREATE TABLE `gw_sku_guadan_collect` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(30) NOT NULL COMMENT '编号',
  `amount_bind` decimal(18,2) NOT NULL COMMENT '待绑定积分额度',
  `amount_unbind` decimal(18,2) NOT NULL COMMENT '非绑定积分额度',
  `sale_amount_bind` decimal(18,2) unsigned NOT NULL COMMENT '卖出的待绑定积分额度',
  `sale_amount_unbind` decimal(18,2) unsigned NOT NULL COMMENT '卖出的非绑定积分额度',
  `distribution_ratio` tinyint(4) NOT NULL COMMENT '会员推荐者分配比例',
  `bind_size` decimal(18,2) unsigned NOT NULL COMMENT '新用户绑定粒度',
  `time_start` int(10) unsigned NOT NULL COMMENT '计划起始日',
  `time_end` int(10) unsigned NOT NULL COMMENT '计划截止日',
  `create_time` int(10) unsigned NOT NULL COMMENT '创建时间',
  `status` tinyint(1) unsigned NOT NULL COMMENT '状态（0待启用 1启用 2终止）',
  `new_member_count` int(11) unsigned NOT NULL COMMENT '已获取新会员数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8 COMMENT='积分挂单提取';

-- ----------------------------
-- Table structure for gw_sku_guadan_jifen_goods
-- ----------------------------
DROP TABLE IF EXISTS `gw_sku_guadan_jifen_goods`;
CREATE TABLE `gw_sku_guadan_jifen_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rule_id` int(11) NOT NULL DEFAULT '0' COMMENT '规则id',
  `partner_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '商家合作id',
  `member_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家id',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态  1位上架  2为下架  3为已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='挂单积分商品表';

-- ----------------------------
-- Table structure for gw_sku_guadan_jifen_order
-- ----------------------------
DROP TABLE IF EXISTS `gw_sku_guadan_jifen_order`;
CREATE TABLE `gw_sku_guadan_jifen_order` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(32) NOT NULL DEFAULT '' COMMENT '订单号',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '订单类型  1为官方充值  2为第三方',
  `member_id` int(11) NOT NULL DEFAULT '0' COMMENT '会员id',
  `partner_member_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家会员id',
  `partner_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家合作id',
  `goods_id` int(11) unsigned NOT NULL COMMENT '积分商品id',
  `rule_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '政策id',
  `quantity` int(11) unsigned NOT NULL COMMENT '购买数量',
  `unit_price` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '单价',
  `total_price` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '总价',
  `buy_score` decimal(18,2) unsigned NOT NULL DEFAULT '100.00' COMMENT '购买的积分数（冗余字段，购买的金额x0.9为积分数）',
  `buy_amount` decimal(18,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '购买的金额（SKU里面的金额）',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '订单状态',
  `pay_status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '支付状态',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `pay_time` int(11) NOT NULL DEFAULT '0' COMMENT '支付时间',
  `recharge_member_id` int(11) NOT NULL DEFAULT '0' COMMENT '充值会员id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户购买积分订单表';

-- ----------------------------
-- Table structure for gw_sku_guadan_jifen_order_detail
-- ----------------------------
DROP TABLE IF EXISTS `gw_sku_guadan_jifen_order_detail`;
CREATE TABLE `gw_sku_guadan_jifen_order_detail` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) unsigned NOT NULL COMMENT '用户购买积分订单表-id',
  `to_score` decimal(10,2) NOT NULL COMMENT '到账积分',
  `to_amount` decimal(10,2) NOT NULL COMMENT '到账金额',
  `to_time` int(11) unsigned NOT NULL COMMENT '到账时间',
  `status` tinyint(1) unsigned NOT NULL COMMENT '状态（0未到账 1到账）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户购买积分订单表-详情';

-- ----------------------------
-- Table structure for gw_sku_guadan_partner_config
-- ----------------------------
DROP TABLE IF EXISTS `gw_sku_guadan_partner_config`;
CREATE TABLE `gw_sku_guadan_partner_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `limit_score` decimal(18,2) unsigned NOT NULL COMMENT '全国商家限额的积分',
  `distribution_ratio` tinyint(4) unsigned NOT NULL COMMENT '商家推荐者分配比例',
  `explain` text NOT NULL COMMENT '说明',
  `create_time` int(11) unsigned NOT NULL COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL COMMENT '创建时间',
  `status` tinyint(1) unsigned NOT NULL COMMENT '1启用  2删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商家积分批发政策表';

-- ----------------------------
-- Table structure for gw_sku_guadan_partner_config_detail
-- ----------------------------
DROP TABLE IF EXISTS `gw_sku_guadan_partner_config_detail`;
CREATE TABLE `gw_sku_guadan_partner_config_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `partner_config_id` int(11) unsigned NOT NULL COMMENT '商家积分批发政策表id',
  `min_score` decimal(18,2) unsigned NOT NULL COMMENT '最小积分',
  `max_score` decimal(18,2) unsigned NOT NULL COMMENT '最大积分',
  `ratio` decimal(5,2) unsigned NOT NULL COMMENT '出售的折扣，存2.5代表折扣为2.5%',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商家积分批发政策表-详情';

-- ----------------------------
-- Table structure for gw_sku_guadan_partner_setting
-- ----------------------------
DROP TABLE IF EXISTS `gw_sku_guadan_partner_setting`;
CREATE TABLE `gw_sku_guadan_partner_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `partner_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '商家合作id',
  `member_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家id',
  `selling_discount` tinyint(2) unsigned DEFAULT '100' COMMENT '折扣百分比',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='挂单系统 商家设置表';

-- ----------------------------
-- Table structure for gw_sku_guadan_pifa_order
-- ----------------------------
DROP TABLE IF EXISTS `gw_sku_guadan_pifa_order`;
CREATE TABLE `gw_sku_guadan_pifa_order` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(32) NOT NULL DEFAULT '' COMMENT '订单号',
  `member_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '会员id',
  `amount` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '购买金额（商家实际支付的金额）',
  `buy_score` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '购买的积分数',
  `buy_amount` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '购买的金额（SKU里面的金额）',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '订单状态',
  `pay_status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '支付状态',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `pay_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '支付时间',
  `collect_id` int(11) NOT NULL DEFAULT '0' COMMENT '挂单政策id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for gw_sku_guadan_relation
-- ----------------------------
DROP TABLE IF EXISTS `gw_sku_guadan_relation`;
CREATE TABLE `gw_sku_guadan_relation` (
  `collect_id` int(10) unsigned NOT NULL COMMENT '挂单提取id',
  `guadan_id` int(10) unsigned NOT NULL COMMENT '积分挂单id',
  `amount` decimal(18,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '积分',
  `amount_remain` decimal(18,2) unsigned DEFAULT NULL COMMENT '剩余积分',
  `type` tinyint(3) unsigned NOT NULL COMMENT '积分类型（1.待绑定积分 2.非绑定积分）',
  KEY `collect_id` (`collect_id`) USING BTREE,
  KEY `guadan_id` (`guadan_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='积分挂单-提取 关系表';

-- ----------------------------
-- Table structure for gw_sku_guadan_rule
-- ----------------------------
DROP TABLE IF EXISTS `gw_sku_guadan_rule`;
CREATE TABLE `gw_sku_guadan_rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `collect_id` int(10) unsigned NOT NULL COMMENT '挂单提取id',
  `title` varchar(100) NOT NULL COMMENT '商品名',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '规则类型：1.新用户 2.老用户',
  `amount_give` decimal(10,2) unsigned NOT NULL COMMENT '赠送金额',
  `amount` decimal(10,2) unsigned NOT NULL COMMENT '积分面值',
  `amount_pay` decimal(10,2) unsigned NOT NULL COMMENT '售价',
  `amount_limit` decimal(18,2) unsigned NOT NULL COMMENT '积分包限额',
  `sale_amount` decimal(18,2) unsigned NOT NULL COMMENT '已卖出的金额（当amount_limit不为0时，该字段的金额不能超出amount_limit）',
  `amount_installment` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '本金返回分期',
  `give_installment` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '赠送返回分期',
  `installment_time` int(10) unsigned NOT NULL DEFAULT '30' COMMENT '分期时间（单位：天）',
  `remark` varchar(350) NOT NULL COMMENT '说明',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态（0待启用，1启用 2终止）',
  PRIMARY KEY (`id`),
  KEY `collect_id` (`collect_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8 COMMENT='积分挂单规则、政策';

-- ----------------------------
-- Table structure for gw_sku_jpush_log
-- ----------------------------
DROP TABLE IF EXISTS `gw_sku_jpush_log`;
CREATE TABLE `gw_sku_jpush_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `order_code` varchar(32) NOT NULL DEFAULT '',
  `send_data` text NOT NULL,
  `get_data` text NOT NULL,
  `create_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for gw_sku_member
-- ----------------------------
DROP TABLE IF EXISTS `gw_sku_member`;
CREATE TABLE `gw_sku_member` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `logins` int(11) unsigned DEFAULT '0' COMMENT '登录次数',
  `signins` int(11) unsigned DEFAULT '0' COMMENT '签到次数',
  `sku_number` varchar(32) NOT NULL COMMENT 'SKU编号',
  `referrals_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '推荐人',
  `username` varchar(128) NOT NULL COMMENT '用户名',
  `password` varchar(128) NOT NULL COMMENT '密码',
  `salt` varchar(128) NOT NULL COMMENT '唯一密钥',
  `sex` tinyint(1) unsigned DEFAULT NULL COMMENT '性别',
  `real_name` varchar(128) DEFAULT NULL COMMENT '真实姓名',
  `password2` varchar(128) DEFAULT NULL COMMENT '二级密码',
  `password3` varchar(128) DEFAULT NULL COMMENT '三级密码',
  `birthday` int(11) unsigned DEFAULT NULL COMMENT '生日',
  `email` varchar(128) DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(128) NOT NULL COMMENT '手机号码',
  `country_id` int(11) unsigned DEFAULT NULL COMMENT '国家',
  `province_id` int(11) unsigned DEFAULT NULL COMMENT '省份',
  `city_id` int(11) unsigned DEFAULT NULL COMMENT '城市',
  `district_id` int(11) unsigned DEFAULT NULL COMMENT '区/县',
  `street` varchar(128) DEFAULT NULL COMMENT '详细地址',
  `register_time` int(11) unsigned NOT NULL COMMENT '注册时间',
  `register_type` tinyint(1) unsigned NOT NULL COMMENT '注册类型（0默认，1盖网机，2盖网，3手机短信，4手机APP）',
  `head_portrait` varchar(128) DEFAULT NULL COMMENT '头像',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态（0待激活，1正常，2删除，3除名）',
  `last_login_time` int(11) unsigned DEFAULT NULL COMMENT '上次登录时间',
  `current_login_time` int(11) unsigned DEFAULT NULL COMMENT '当前登录时间',
  `nickname` varchar(128) DEFAULT NULL COMMENT '昵称',
  `referrals_time` int(11) unsigned NOT NULL COMMENT '更新推荐人时间',
  `pay_limit_daily` decimal(10,2) unsigned DEFAULT '20000.00' COMMENT '每日积分支付限额',
  `ratio` decimal(5,2) unsigned NOT NULL DEFAULT '0.90',
  `gai_number` varchar(32) DEFAULT NULL COMMENT '盖网的GW号',
  `gai_member_id` int(11) NOT NULL DEFAULT '0' COMMENT '盖网会员id',
  PRIMARY KEY (`id`),
  KEY `referrals_id` (`referrals_id`) USING BTREE,
  KEY `status` (`status`) USING BTREE,
  KEY `mobile` (`mobile`) USING BTREE,
  KEY `sku_number` (`sku_number`) USING BTREE,
  KEY `register_type` (`register_type`) USING BTREE,
  KEY `gai_number` (`gai_number`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1698261 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='SKU会员表';

-- ----------------------------
-- Table structure for gw_sku_member_bind
-- ----------------------------
DROP TABLE IF EXISTS `gw_sku_member_bind`;
CREATE TABLE `gw_sku_member_bind` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '类型（1自动 2手动）',
  `guandan_collect_id` int(11) unsigned NOT NULL COMMENT '挂单提取的id',
  `create_time` int(11) unsigned NOT NULL COMMENT '绑定时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=150 DEFAULT CHARSET=utf8 COMMENT='会员绑定表';

-- ----------------------------
-- Table structure for gw_sku_member_bind_detail
-- ----------------------------
DROP TABLE IF EXISTS `gw_sku_member_bind_detail`;
CREATE TABLE `gw_sku_member_bind_detail` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `bind_id` int(11) unsigned NOT NULL COMMENT '绑定编号id',
  `gai_fun_member_id` int(11) unsigned NOT NULL COMMENT '盖粉会员id（被绑定人的会员id）',
  `bind_member_id` int(11) unsigned NOT NULL COMMENT '绑定的会员id',
  `create_time` int(11) unsigned NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=261 DEFAULT CHARSET=utf8 COMMENT='会员绑定详情表';

-- ----------------------------
-- Table structure for gw_sku_member_personal_authentication
-- ----------------------------
DROP TABLE IF EXISTS `gw_sku_member_personal_authentication`;
CREATE TABLE `gw_sku_member_personal_authentication` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键自增',
  `member_id` int(11) DEFAULT NULL COMMENT 'gw_sku_member表中的id(非盖象的member_id)',
  `real_name` varchar(50) DEFAULT NULL COMMENT '真实姓名',
  `mobile` varchar(14) NOT NULL DEFAULT '',
  `bank_name` varchar(50) NOT NULL DEFAULT '' COMMENT '银行名',
  `identification` char(18) DEFAULT NULL COMMENT '身份证号',
  `bank_card_number` varchar(30) DEFAULT NULL COMMENT '银行卡号',
  `status` tinyint(5) DEFAULT '0' COMMENT '是否通过审核(0审核中 1通过审核 2不通过审核)',
  `auto_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '自动审核状态',
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `member_id` (`member_id`),
  KEY `real_name` (`real_name`),
  KEY `identification` (`identification`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='会员个人认证表';

-- ----------------------------
-- Table structure for gw_sku_member_sign_account
-- ----------------------------
DROP TABLE IF EXISTS `gw_sku_member_sign_account`;
CREATE TABLE `gw_sku_member_sign_account` (
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
  `source` tinyint(1) unsigned NOT NULL COMMENT '来源（0、SKU）',
  PRIMARY KEY (`id`),
  KEY `member_id` (`member_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='个人商家网签信息表';

-- ----------------------------
-- Table structure for gw_sku_open_client_token
-- ----------------------------
DROP TABLE IF EXISTS `gw_sku_open_client_token`;
CREATE TABLE `gw_sku_open_client_token` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(11) unsigned NOT NULL,
  `gai_number` varchar(32) NOT NULL DEFAULT '',
  `token` varchar(32) NOT NULL DEFAULT '',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `expir_time` int(11) NOT NULL DEFAULT '0' COMMENT '超时时间',
  `lang` varchar(12) NOT NULL DEFAULT '' COMMENT '语言',
  `city_id` int(11) NOT NULL DEFAULT '0' COMMENT '定位的城市id',
  `private_key` text NOT NULL COMMENT '秘钥',
  `public_key` text NOT NULL COMMENT '公钥',
  `source` varchar(50) NOT NULL DEFAULT '' COMMENT '会员来源',
  PRIMARY KEY (`id`),
  KEY `member_id` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for gw_sku_open_partner_token
-- ----------------------------
DROP TABLE IF EXISTS `gw_sku_open_partner_token`;
CREATE TABLE `gw_sku_open_partner_token` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(11) unsigned NOT NULL,
  `gai_number` varchar(32) NOT NULL DEFAULT '',
  `token` varchar(32) NOT NULL DEFAULT '',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `expir_time` int(11) NOT NULL DEFAULT '0' COMMENT '超时时间',
  `lang` varchar(12) NOT NULL DEFAULT '' COMMENT '语言',
  `private_key` text NOT NULL COMMENT 'rsa秘钥',
  `public_key` text NOT NULL COMMENT '公钥',
  PRIMARY KEY (`id`),
  KEY `member_id` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='开放接口商家端token表';

-- ----------------------------
-- Table structure for gw_sku_operator_relation
-- ----------------------------
DROP TABLE IF EXISTS `gw_sku_operator_relation`;
CREATE TABLE `gw_sku_operator_relation` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家会员id',
  `partner_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家id',
  `operator_member_id` int(11) NOT NULL DEFAULT '0' COMMENT '运营方会员id',
  `operator_partner_id` int(11) NOT NULL DEFAULT '0' COMMENT '运营方商家id',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态，1为有效  0为失效',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for gw_sku_order_address
-- ----------------------------
DROP TABLE IF EXISTS `gw_sku_order_address`;
CREATE TABLE `gw_sku_order_address` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `member_id` int(11) unsigned NOT NULL COMMENT '所属会员',
  `real_name` varchar(56) NOT NULL COMMENT '收货人姓名',
  `mobile` varchar(16) NOT NULL COMMENT '手机号码',
  `province_id` int(11) unsigned NOT NULL COMMENT '省份',
  `city_id` int(11) unsigned NOT NULL COMMENT '城市',
  `district_id` int(11) unsigned NOT NULL COMMENT '区/县',
  `street` varchar(128) NOT NULL COMMENT '详细地址',
  `zip_code` varchar(16) NOT NULL COMMENT '邮编',
  PRIMARY KEY (`id`),
  KEY `member_id` (`member_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='收货地址';

-- ----------------------------
-- Table structure for gw_sku_orders
-- ----------------------------
DROP TABLE IF EXISTS `gw_sku_orders`;
CREATE TABLE `gw_sku_orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `father_id` int(11) NOT NULL DEFAULT '0' COMMENT '父订单id',
  `code` varchar(32) NOT NULL DEFAULT '0' COMMENT '订单编号',
  `goods_code` varchar(32) NOT NULL DEFAULT '' COMMENT '提货码',
  `partner_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家id',
  `member_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '会员id',
  `gai_number` varchar(23) NOT NULL DEFAULT '' COMMENT 'GW号',
  `mobile` varchar(13) NOT NULL DEFAULT '' COMMENT '电话号码',
  `store_id` int(11) NOT NULL DEFAULT '0' COMMENT '门店id',
  `machine_id` int(11) NOT NULL DEFAULT '0' COMMENT '售货机id',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '订单类型（超市、售货机、线下）',
  `node` tinyint(4) NOT NULL DEFAULT '0' COMMENT '业务节点',
  `total_price` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '总价',
  `pay_price` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '支付价格',
  `pay_type` tinyint(3) NOT NULL DEFAULT '1' COMMENT '支付方式  1为积分支付 2为银行卡支付',
  `address_id` int(11) NOT NULL DEFAULT '0' COMMENT '送货地址',
  `shipping_type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '送货方式',
  `shipping_fee` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '配送费',
  `shipping_time` varchar(32) NOT NULL DEFAULT '' COMMENT '送货时间',
  `pay_status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '支付状态',
  `refund_status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '退款状态',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '订单状态',
  `machine_status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '售货机备货状态',
  `machine_take_type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '售货机提货方式  0为输入提货码提货，1为支付马上提货',
  `is_auto_cancel` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否自动取消',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `seller_remark` varchar(255) NOT NULL DEFAULT '' COMMENT '商家及后台备注',
  `create_time` int(11) NOT NULL,
  `pay_time` int(11) NOT NULL DEFAULT '0' COMMENT '支付时间',
  `send_time` int(11) NOT NULL DEFAULT '0' COMMENT '发货时间',
  `sign_time` int(11) NOT NULL DEFAULT '0' COMMENT '签收时间',
  `cancel_time` int(11) NOT NULL DEFAULT '0' COMMENT '取消时间',
  `distribute_config` text COMMENT '分配规则',
  `goods_status` tinyint(2) NOT NULL COMMENT '出货状态（时间验证之后）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code_2` (`code`),
  KEY `member_id` (`member_id`),
  KEY `code` (`code`),
  KEY `partnerId` (`partner_id`),
  KEY `status` (`status`),
  KEY `timeAndStatus` (`status`,`create_time`,`is_auto_cancel`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16960 DEFAULT CHARSET=utf8 COMMENT='sku订单表';

-- ----------------------------
-- Table structure for gw_sku_orders_act
-- ----------------------------
DROP TABLE IF EXISTS `gw_sku_orders_act`;
CREATE TABLE `gw_sku_orders_act` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(32) NOT NULL DEFAULT '0' COMMENT '订单编号',
  `member_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '会员id',
  `total_price` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '总价',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '订单状态',
  `remark` text NOT NULL COMMENT '备注',
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code_2` (`code`) USING BTREE,
  KEY `member_id` (`member_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21101 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='sku活动积分赚送表';

-- ----------------------------
-- Table structure for gw_sku_orders_copy
-- ----------------------------
DROP TABLE IF EXISTS `gw_sku_orders_copy`;
CREATE TABLE `gw_sku_orders_copy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `father_id` int(11) NOT NULL DEFAULT '0' COMMENT '父订单id',
  `code` varchar(32) NOT NULL DEFAULT '0' COMMENT '订单编号',
  `goods_code` varchar(32) NOT NULL DEFAULT '' COMMENT '提货码',
  `partner_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家id',
  `member_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '会员id',
  `mobile` varchar(13) NOT NULL DEFAULT '' COMMENT '电话号码',
  `store_id` int(11) NOT NULL DEFAULT '0' COMMENT '门店id',
  `machine_id` int(11) NOT NULL DEFAULT '0' COMMENT '售货机id',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '订单类型（超市、售货机、线下）',
  `node` tinyint(4) NOT NULL DEFAULT '0' COMMENT '业务节点',
  `total_price` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '总价',
  `pay_price` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '支付价格',
  `pay_type` tinyint(3) NOT NULL DEFAULT '1' COMMENT '支付方式  1为积分支付 2为银行卡支付',
  `address_id` int(11) NOT NULL DEFAULT '0' COMMENT '送货地址',
  `shipping_type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '送货方式',
  `shipping_fee` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '配送费',
  `shipping_time` varchar(32) NOT NULL DEFAULT '' COMMENT '送货时间',
  `pay_status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '支付状态',
  `refund_status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '退款状态',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '订单状态',
  `machine_status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '售货机备货状态',
  `machine_take_type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '售货机提货方式  0为输入提货码提货，1为支付马上提货',
  `is_auto_cancel` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否自动取消',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `seller_remark` varchar(255) NOT NULL DEFAULT '' COMMENT '商家及后台备注',
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code_2` (`code`),
  KEY `member_id` (`member_id`),
  KEY `code` (`code`),
  KEY `partnerId` (`partner_id`),
  KEY `status` (`status`),
  KEY `timeAndStatus` (`status`,`create_time`,`is_auto_cancel`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1774 DEFAULT CHARSET=utf8 COMMENT='sku订单表';

-- ----------------------------
-- Table structure for gw_sku_orders_goods
-- ----------------------------
DROP TABLE IF EXISTS `gw_sku_orders_goods`;
CREATE TABLE `gw_sku_orders_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL DEFAULT '0' COMMENT '订单id',
  `name` varchar(128) NOT NULL DEFAULT '' COMMENT '商品名称',
  `sgid` int(11) NOT NULL DEFAULT '0' COMMENT '门店的商品id',
  `sg_outlets` varchar(16) NOT NULL DEFAULT '' COMMENT '销售位置  例如售货机的货道、格子铺编码等',
  `gid` int(11) NOT NULL DEFAULT '0' COMMENT '商品id  对应原始商家商品表',
  `num` tinyint(5) NOT NULL DEFAULT '0' COMMENT '数量',
  `supply_price` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '供货价',
  `price` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '单价',
  `total_price` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '总价',
  `weight` int(6) NOT NULL DEFAULT '0' COMMENT '单位重量 单位为克',
  `line_id` int(11) NOT NULL DEFAULT '0' COMMENT '机器货道id',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '商品状态',
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2508 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for gw_sku_parnet_log
-- ----------------------------
DROP TABLE IF EXISTS `gw_sku_parnet_log`;
CREATE TABLE `gw_sku_parnet_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `category_id` tinyint(3) unsigned NOT NULL COMMENT '所属分类',
  `title` text NOT NULL COMMENT '标题',
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
) ENGINE=InnoDB AUTO_INCREMENT=4760 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='销售日志';

-- ----------------------------
-- Table structure for gw_sku_partner_join_auditing
-- ----------------------------
DROP TABLE IF EXISTS `gw_sku_partner_join_auditing`;
CREATE TABLE `gw_sku_partner_join_auditing` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '申请人姓名',
  `head` varchar(128) NOT NULL DEFAULT '' COMMENT '商家头像',
  `mobile` varchar(14) NOT NULL DEFAULT '' COMMENT '联系电话',
  `gai_number` varchar(22) NOT NULL DEFAULT '' COMMENT '商户GW号',
  `referrals_gai_number` varchar(22) NOT NULL DEFAULT '' COMMENT '推荐人GW号',
  `id_name` varchar(24) NOT NULL DEFAULT '' COMMENT '身份证姓名',
  `id_card` varchar(18) NOT NULL DEFAULT '' COMMENT '身份证号',
  `id_card_to_time` int(11) NOT NULL DEFAULT '0' COMMENT '身份证有效期',
  `id_card_font_img` varchar(128) NOT NULL DEFAULT '' COMMENT '身份证正面照',
  `id_card_back_img` varchar(128) NOT NULL DEFAULT '' COMMENT '身份证反面照',
  `store_name` varchar(128) NOT NULL DEFAULT '' COMMENT '店铺名',
  `store_mobile` varchar(14) NOT NULL DEFAULT '' COMMENT '电话',
  `store_province_id` int(11) NOT NULL DEFAULT '0' COMMENT '省份',
  `store_city_id` int(11) NOT NULL DEFAULT '0' COMMENT '城市',
  `store_district_id` int(11) NOT NULL DEFAULT '0' COMMENT '县区',
  `store_address` varchar(128) NOT NULL DEFAULT '' COMMENT '店铺地址',
  `license_img` varchar(128) NOT NULL DEFAULT '' COMMENT '个体工商户执照/企业法人营业执照',
  `license_to_time` int(11) NOT NULL DEFAULT '0' COMMENT '执照到期限期',
  `bank` varchar(128) NOT NULL DEFAULT '' COMMENT '开户银行',
  `bank_account_name` varchar(128) NOT NULL DEFAULT '' COMMENT '银行卡账户名',
  `bank_account` char(22) NOT NULL DEFAULT '0' COMMENT '银行卡号',
  `bank_province_id` int(11) NOT NULL DEFAULT '0' COMMENT '银行所属省份',
  `bank_city_id` int(11) NOT NULL DEFAULT '0' COMMENT '银行所属城市',
  `bank_district_id` int(11) NOT NULL DEFAULT '0' COMMENT '银行所属区县',
  `bank_branch` varchar(128) NOT NULL DEFAULT '' COMMENT '开户支行',
  `bank_img` varchar(128) NOT NULL DEFAULT '' COMMENT '银行卡/开户许可证图片',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态  0为申请中  1为审核通过  2为审核不通过',
  `remark` varchar(256) NOT NULL DEFAULT '' COMMENT '备注',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '申请时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for gw_sku_partner_token
-- ----------------------------
DROP TABLE IF EXISTS `gw_sku_partner_token`;
CREATE TABLE `gw_sku_partner_token` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(11) unsigned NOT NULL,
  `gai_number` varchar(32) NOT NULL DEFAULT '',
  `token` varchar(32) NOT NULL DEFAULT '',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `expir_time` int(11) NOT NULL DEFAULT '0' COMMENT '超时时间',
  `lang` varchar(12) NOT NULL DEFAULT '' COMMENT '语言',
  `device_id` varchar(32) NOT NULL DEFAULT '' COMMENT '设备id',
  `version` varchar(12) NOT NULL COMMENT '版本号',
  PRIMARY KEY (`id`),
  KEY `member_id` (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for gw_sku_partner_token_copy
-- ----------------------------
DROP TABLE IF EXISTS `gw_sku_partner_token_copy`;
CREATE TABLE `gw_sku_partner_token_copy` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(11) unsigned NOT NULL,
  `gai_number` varchar(32) NOT NULL DEFAULT '',
  `token` varchar(32) NOT NULL DEFAULT '',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `expir_time` int(11) NOT NULL DEFAULT '0' COMMENT '超时时间',
  `lang` varchar(12) NOT NULL DEFAULT '' COMMENT '语言',
  PRIMARY KEY (`id`),
  KEY `member_id` (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2522 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for gw_sku_partners
-- ----------------------------
DROP TABLE IF EXISTS `gw_sku_partners`;
CREATE TABLE `gw_sku_partners` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL DEFAULT '' COMMENT '名称',
  `real_name` varchar(32) NOT NULL DEFAULT '' COMMENT '真实姓名',
  `member_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '所属用户',
  `gai_number` varchar(128) NOT NULL DEFAULT '' COMMENT '盖网编号',
  `mobile` varchar(16) NOT NULL DEFAULT '' COMMENT '电话',
  `head` varchar(128) NOT NULL DEFAULT '' COMMENT '店铺头像',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '合作类型 1为企业  2为个人',
  `province_id` int(11) NOT NULL DEFAULT '0' COMMENT '省份',
  `city_id` int(11) NOT NULL DEFAULT '0' COMMENT '城市',
  `district_id` int(11) NOT NULL DEFAULT '0' COMMENT '区域id',
  `street` varchar(128) NOT NULL DEFAULT '' COMMENT '街道地址',
  `zip_code` varchar(16) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态(申请中 审核中 通过 关闭）',
  `score` decimal(2,1) NOT NULL DEFAULT '0.0' COMMENT '商家服务评分',
  `create_time` int(11) NOT NULL,
  `bank_account` char(32) NOT NULL DEFAULT '' COMMENT '银行卡',
  `bank_account_name` char(32) NOT NULL DEFAULT '' COMMENT '账户名',
  `bank_card_img` varchar(128) NOT NULL DEFAULT '' COMMENT '银行卡图片',
  `bank_name` char(64) NOT NULL DEFAULT '' COMMENT '银行名称',
  `bank_account_branch` varchar(128) NOT NULL DEFAULT '' COMMENT '开户支行',
  `bank_area` varchar(256) NOT NULL DEFAULT '' COMMENT '开户银行所属地',
  `idcard` char(18) NOT NULL DEFAULT '' COMMENT '身份证',
  `idcard_img_font` varchar(128) NOT NULL DEFAULT '' COMMENT '身份证图片',
  `idcard_img_back` varchar(128) NOT NULL,
  `license_img` varchar(128) NOT NULL DEFAULT '' COMMENT '营业执照',
  `license_expired_time` int(11) NOT NULL DEFAULT '0' COMMENT '营业执照过期时间',
  `meat_inspection_certificate_img` varchar(128) NOT NULL DEFAULT '' COMMENT '肉菜检验证明',
  `meat_inspection_expired_time` int(11) NOT NULL DEFAULT '0' COMMENT '肉菜检验证明过期时间',
  `health_permit_certificate_img` varchar(128) NOT NULL DEFAULT '' COMMENT '卫生许可证明',
  `health_permit_expired_time` int(11) NOT NULL DEFAULT '0' COMMENT '卫生许可证明过期时间',
  `food_circulation_permit_certificate_img` varchar(128) NOT NULL DEFAULT '' COMMENT '食品流通许可证明',
  `food_circulation_expired_time` int(11) NOT NULL DEFAULT '0' COMMENT '食品流通许可证明过期时间',
  `stock_source_certificate_img` varchar(128) NOT NULL DEFAULT '' COMMENT '进货来源证明',
  `stock_source_expired_time` int(11) NOT NULL DEFAULT '0' COMMENT '进货来源证明过期时间',
  `apply_remark` varchar(256) NOT NULL DEFAULT '' COMMENT '申请反馈备注',
  `is_enterprise` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '是否网签申请',
  `source` tinyint(2) NOT NULL DEFAULT '0' COMMENT '数据来源',
  `private_key` text NOT NULL COMMENT '私钥',
  `public_key` text NOT NULL COMMENT '公钥',
  PRIMARY KEY (`id`),
  KEY `member_id` (`member_id`),
  KEY `gai_number` (`gai_number`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8 COMMENT='超市列表';

-- ----------------------------
-- Table structure for gw_sku_partners_copy
-- ----------------------------
DROP TABLE IF EXISTS `gw_sku_partners_copy`;
CREATE TABLE `gw_sku_partners_copy` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL DEFAULT '' COMMENT '名称',
  `member_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '所属用户',
  `gai_number` varchar(128) NOT NULL DEFAULT '' COMMENT '盖网编号',
  `mobile` varchar(16) NOT NULL DEFAULT '' COMMENT '电话',
  `head` varchar(128) NOT NULL DEFAULT '' COMMENT '店铺头像',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '合作类型 1为企业  2为个人',
  `province_id` int(11) NOT NULL DEFAULT '0' COMMENT '省份',
  `city_id` int(11) NOT NULL DEFAULT '0' COMMENT '城市',
  `district_id` int(11) NOT NULL DEFAULT '0' COMMENT '区域id',
  `street` varchar(128) NOT NULL DEFAULT '' COMMENT '街道地址',
  `zip_code` varchar(16) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态(申请中 审核中 通过 关闭）',
  `score` decimal(2,1) NOT NULL DEFAULT '0.0' COMMENT '商家服务评分',
  `create_time` int(11) NOT NULL,
  `bank_account` char(32) NOT NULL DEFAULT '' COMMENT '银行卡',
  `bank_account_name` char(32) NOT NULL DEFAULT '' COMMENT '账户名',
  `bank_card_img` varchar(128) NOT NULL DEFAULT '' COMMENT '银行卡图片',
  `bank_name` char(64) NOT NULL DEFAULT '' COMMENT '银行名称',
  `bank_account_branch` varchar(128) NOT NULL DEFAULT '' COMMENT '开户支行',
  `bank_area` varchar(256) NOT NULL DEFAULT '' COMMENT '开户银行所属地',
  `idcard` char(18) NOT NULL DEFAULT '' COMMENT '身份证',
  `idcard_img_font` varchar(128) NOT NULL DEFAULT '' COMMENT '身份证图片',
  `idcard_img_back` varchar(128) NOT NULL,
  `license_img` varchar(128) NOT NULL DEFAULT '' COMMENT '营业执照',
  `license_expired_time` int(11) NOT NULL DEFAULT '0' COMMENT '营业执照过期时间',
  `meat_inspection_certificate_img` varchar(128) NOT NULL DEFAULT '' COMMENT '肉菜检验证明',
  `meat_inspection_expired_time` int(11) NOT NULL DEFAULT '0' COMMENT '肉菜检验证明过期时间',
  `health_permit_certificate_img` varchar(128) NOT NULL DEFAULT '' COMMENT '卫生许可证明',
  `health_permit_expired_time` int(11) NOT NULL DEFAULT '0' COMMENT '卫生许可证明过期时间',
  `food_circulation_permit_certificate_img` varchar(128) NOT NULL DEFAULT '' COMMENT '食品流通许可证明',
  `food_circulation_expired_time` int(11) NOT NULL DEFAULT '0' COMMENT '食品流通许可证明过期时间',
  `stock_source_certificate_img` varchar(128) NOT NULL DEFAULT '' COMMENT '进货来源证明',
  `stock_source_expired_time` int(11) NOT NULL DEFAULT '0' COMMENT '进货来源证明过期时间',
  `apply_remark` varchar(256) NOT NULL DEFAULT '' COMMENT '申请反馈备注',
  `is_enterprise` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '是否网签申请',
  `source` tinyint(2) NOT NULL DEFAULT '0' COMMENT '数据来源',
  `private_key` text NOT NULL COMMENT '私钥',
  `public_key` text NOT NULL COMMENT '公钥',
  PRIMARY KEY (`id`),
  KEY `member_id` (`member_id`),
  KEY `gai_number` (`gai_number`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8 COMMENT='超市列表';

-- ----------------------------
-- Table structure for gw_sku_pos_information
-- ----------------------------
DROP TABLE IF EXISTS `gw_sku_pos_information`;
CREATE TABLE `gw_sku_pos_information` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `member_id` int(11) unsigned NOT NULL COMMENT '会员id',
  `phone` varchar(32) NOT NULL COMMENT '手机号',
  `card_num` int(32) unsigned NOT NULL COMMENT '卡号 不为0',
  `amount` double(18,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '充值金额',
  `serial_num` int(8) NOT NULL COMMENT '流水号',
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
  `order_id` int(11) NOT NULL COMMENT '对应的订单id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `only` (`serial_num`,`doc_num`,`batch_num`,`device_num`,`business_num`,`transaction_time`) USING BTREE,
  KEY `amount` (`amount`),
  KEY `time` (`transaction_time`),
  KEY `serial_num` (`serial_num`),
  KEY `card_num` (`card_num`),
  KEY `member_id` (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=693 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for gw_sku_quest
-- ----------------------------
DROP TABLE IF EXISTS `gw_sku_quest`;
CREATE TABLE `gw_sku_quest` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL DEFAULT '' COMMENT '问卷名称',
  `request` int(11) NOT NULL DEFAULT '0' COMMENT '提交次数',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8 COMMENT='问卷调查表';

-- ----------------------------
-- Table structure for gw_sku_quest_field
-- ----------------------------
DROP TABLE IF EXISTS `gw_sku_quest_field`;
CREATE TABLE `gw_sku_quest_field` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `q_id` int(11) NOT NULL DEFAULT '0' COMMENT '问卷id',
  `name` varchar(125) DEFAULT NULL,
  `values` text NOT NULL COMMENT '字段值',
  `type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '字段类型',
  `sort` tinyint(3) NOT NULL DEFAULT '1' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='问卷调查字段表';

-- ----------------------------
-- Table structure for gw_sku_quest_result
-- ----------------------------
DROP TABLE IF EXISTS `gw_sku_quest_result`;
CREATE TABLE `gw_sku_quest_result` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `q_id` int(11) NOT NULL DEFAULT '0' COMMENT '问卷id',
  `f_id` int(11) NOT NULL DEFAULT '0' COMMENT '字段id',
  `value` text NOT NULL COMMENT '字段值',
  `count` int(8) NOT NULL DEFAULT '0' COMMENT '数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='问卷调查结果表';

-- ----------------------------
-- Table structure for gw_sku_record
-- ----------------------------
DROP TABLE IF EXISTS `gw_sku_record`;
CREATE TABLE `gw_sku_record` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `machine_id` int(12) NOT NULL COMMENT '机器id',
  `name` varchar(32) NOT NULL COMMENT '签到人员姓名',
  `mobile` varchar(32) NOT NULL COMMENT '手机号',
  `create_time` int(11) NOT NULL COMMENT '签到时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for gw_sku_region
-- ----------------------------
DROP TABLE IF EXISTS `gw_sku_region`;
CREATE TABLE `gw_sku_region` (
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
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`) USING BTREE,
  KEY `member_id` (`member_id`) USING BTREE,
  KEY `pinyin` (`pinyin`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3618 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for gw_sku_rights
-- ----------------------------
DROP TABLE IF EXISTS `gw_sku_rights`;
CREATE TABLE `gw_sku_rights` (
  `itemname` varchar(64) NOT NULL,
  `type` int(11) unsigned NOT NULL,
  `weight` int(11) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_sku_staff_income_balance
-- ----------------------------
DROP TABLE IF EXISTS `gw_sku_staff_income_balance`;
CREATE TABLE `gw_sku_staff_income_balance` (
  `id` int(11) NOT NULL,
  `staff_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '员工id',
  `balance` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '当前余额',
  `cur_balance` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '余额变动量',
  `frozen` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '冻结金额',
  PRIMARY KEY (`id`),
  KEY `staff_id` (`staff_id`),
  CONSTRAINT `staffId` FOREIGN KEY (`staff_id`) REFERENCES `gw_sku_super_staffs` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='员工分成收入记录表';

-- ----------------------------
-- Table structure for gw_sku_store_active
-- ----------------------------
DROP TABLE IF EXISTS `gw_sku_store_active`;
CREATE TABLE `gw_sku_store_active` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL DEFAULT '0' COMMENT '店铺名称',
  `address` varchar(128) NOT NULL DEFAULT '' COMMENT '店铺地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=146 DEFAULT CHARSET=utf8 COMMENT='录入活动店铺';

-- ----------------------------
-- Table structure for gw_sku_store_category
-- ----------------------------
DROP TABLE IF EXISTS `gw_sku_store_category`;
CREATE TABLE `gw_sku_store_category` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(128) NOT NULL COMMENT '名称',
  `style` varchar(64) NOT NULL DEFAULT '' COMMENT '样式',
  `sort` int(4) NOT NULL DEFAULT '1' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='兴趣分类';

-- ----------------------------
-- Table structure for gw_sku_stores
-- ----------------------------
DROP TABLE IF EXISTS `gw_sku_stores`;
CREATE TABLE `gw_sku_stores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stype` tinyint(2) NOT NULL DEFAULT '1' COMMENT '类型  售货机、门店等',
  `target_id` int(11) NOT NULL DEFAULT '0' COMMENT '目标店铺id',
  `lat` double(15,8) NOT NULL DEFAULT '0.00000000',
  `lng` double(15,8) NOT NULL DEFAULT '0.00000000',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否启用',
  `is_recommend` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否推荐',
  `solds` int(10) NOT NULL,
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `target` (`stype`,`target_id`),
  KEY `targetId` (`target_id`),
  KEY `solds` (`solds`)
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for gw_sku_super_goods
-- ----------------------------
DROP TABLE IF EXISTS `gw_sku_super_goods`;
CREATE TABLE `gw_sku_super_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) unsigned NOT NULL COMMENT '所属商家',
  `super_id` int(11) unsigned NOT NULL COMMENT '所属超市',
  `status` tinyint(2) NOT NULL DEFAULT '2' COMMENT '状态',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `superMember` (`goods_id`),
  KEY `superId` (`super_id`),
  CONSTRAINT `superGoodsId` FOREIGN KEY (`goods_id`) REFERENCES `gw_sku_goods` (`id`),
  CONSTRAINT `superId` FOREIGN KEY (`super_id`) REFERENCES `gw_sku_supermarkets` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8 COMMENT='超市商品表';

-- ----------------------------
-- Table structure for gw_sku_super_log
-- ----------------------------
DROP TABLE IF EXISTS `gw_sku_super_log`;
CREATE TABLE `gw_sku_super_log` (
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
) ENGINE=InnoDB AUTO_INCREMENT=4363 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='销售日志';

-- ----------------------------
-- Table structure for gw_sku_super_staffs
-- ----------------------------
DROP TABLE IF EXISTS `gw_sku_super_staffs`;
CREATE TABLE `gw_sku_super_staffs` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL DEFAULT '' COMMENT '名称',
  `gai_number` varchar(32) NOT NULL DEFAULT '' COMMENT '盖网编号',
  `gw_member_id` int(11) NOT NULL DEFAULT '0' COMMENT '盖网会员id',
  `nick_name` varchar(128) NOT NULL,
  `head` varchar(256) NOT NULL DEFAULT '' COMMENT '头像',
  `password` varchar(128) NOT NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(128) NOT NULL DEFAULT '' COMMENT 'salt',
  `super_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '所属超市',
  `mobile` varchar(16) NOT NULL DEFAULT '' COMMENT '电话',
  `role` tinyint(3) NOT NULL DEFAULT '0' COMMENT '角色',
  `rights` varchar(256) NOT NULL DEFAULT '' COMMENT '权限列表',
  `working_time` varchar(128) NOT NULL DEFAULT '' COMMENT '员工工作时间',
  `first_income_ratio` decimal(4,2) NOT NULL DEFAULT '0.00' COMMENT '一级收益比例',
  `second_income_ratio` decimal(4,2) NOT NULL DEFAULT '0.00' COMMENT '二级收益比例',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `superid` (`super_id`),
  CONSTRAINT `super_staff` FOREIGN KEY (`super_id`) REFERENCES `gw_sku_supermarkets` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='超市员工表';

-- ----------------------------
-- Table structure for gw_sku_supermarkets
-- ----------------------------
DROP TABLE IF EXISTS `gw_sku_supermarkets`;
CREATE TABLE `gw_sku_supermarkets` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL DEFAULT '' COMMENT '名称',
  `partner_id` int(11) NOT NULL DEFAULT '0',
  `member_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '所属用户',
  `category_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺分类',
  `mobile` varchar(16) NOT NULL DEFAULT '' COMMENT '电话',
  `logo` varchar(128) NOT NULL DEFAULT '' COMMENT '店铺头像',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '超市类型',
  `province_id` int(11) NOT NULL DEFAULT '0' COMMENT '省份',
  `city_id` int(11) NOT NULL DEFAULT '0' COMMENT '城市',
  `district_id` int(11) NOT NULL DEFAULT '0' COMMENT '区域id',
  `street` varchar(128) NOT NULL DEFAULT '' COMMENT '街道地址',
  `zip_code` varchar(16) NOT NULL DEFAULT '',
  `is_delivery` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否送货上门',
  `delivery_time` varchar(25) NOT NULL DEFAULT '' COMMENT '送货时间',
  `delivery_start_amount` float(12,2) NOT NULL DEFAULT '0.00' COMMENT '起送金额',
  `delivery_mini_amount` float(12,2) NOT NULL DEFAULT '0.00' COMMENT '免费送货上门最低金额',
  `delivery_fee` float(12,2) NOT NULL DEFAULT '0.00' COMMENT '送货上门附加服务费',
  `star` float(3,1) NOT NULL DEFAULT '0.0' COMMENT '五星指数',
  `lng` double(15,8) NOT NULL DEFAULT '0.00000000' COMMENT '坐标1',
  `lat` double(15,8) NOT NULL DEFAULT '0.00000000' COMMENT '坐标2',
  `open_time` varchar(25) NOT NULL DEFAULT '' COMMENT '营业时间',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态(申请中 审核中 通过 关闭）',
  `fee` tinyint(2) NOT NULL DEFAULT '8' COMMENT '服务费',
  `is_recommend` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否推荐',
  `recommend_side` varchar(64) NOT NULL DEFAULT '' COMMENT '推荐位置',
  `score` decimal(2,1) NOT NULL DEFAULT '0.0' COMMENT '评分',
  `max_amount_preday` decimal(13,2) NOT NULL DEFAULT '0.00' COMMENT '每人每日最大营业额',
  `solds` int(11) NOT NULL DEFAULT '0' COMMENT '已售商品',
  `create_time` int(11) NOT NULL,
  `temp_goods` text NOT NULL COMMENT '商品数据',
  `referrals_id` int(11) NOT NULL DEFAULT '0' COMMENT '推荐人id',
  `delivery_poin` float(12,2) NOT NULL COMMENT '配送费比率（人人配送）',
  `delivery_man_amount` float(12,2) NOT NULL COMMENT '固定配送费（人人配送）',
  `is_fixed` tinyint(2) NOT NULL COMMENT '是否固定配送费（人人配送）',
  `is_automatic_order` tinyint(2) NOT NULL COMMENT '是否自动接单（人人配送）',
  `is_distribution` tinyint(2) NOT NULL COMMENT '是否分配配送费（人人配送）',
  PRIMARY KEY (`id`),
  KEY `member_id` (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 COMMENT='超市列表';

-- ----------------------------
-- Table structure for gw_sku_supermarkets_copy
-- ----------------------------
DROP TABLE IF EXISTS `gw_sku_supermarkets_copy`;
CREATE TABLE `gw_sku_supermarkets_copy` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL DEFAULT '' COMMENT '名称',
  `partner_id` int(11) NOT NULL DEFAULT '0',
  `member_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '所属用户',
  `category_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺分类',
  `mobile` varchar(16) NOT NULL DEFAULT '' COMMENT '电话',
  `logo` varchar(128) NOT NULL DEFAULT '' COMMENT '店铺头像',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '超市类型',
  `province_id` int(11) NOT NULL DEFAULT '0' COMMENT '省份',
  `city_id` int(11) NOT NULL DEFAULT '0' COMMENT '城市',
  `district_id` int(11) NOT NULL DEFAULT '0' COMMENT '区域id',
  `street` varchar(128) NOT NULL DEFAULT '' COMMENT '街道地址',
  `zip_code` varchar(16) NOT NULL,
  `is_delivery` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否送货上门',
  `delivery_start_amount` float(12,2) NOT NULL DEFAULT '0.00' COMMENT '起送金额',
  `delivery_mini_amount` float(12,2) NOT NULL DEFAULT '0.00' COMMENT '免费送货上门最低金额',
  `delivery_fee` float(12,2) NOT NULL DEFAULT '0.00' COMMENT '送货上门附加服务费',
  `star` float(3,1) NOT NULL DEFAULT '0.0' COMMENT '五星指数',
  `lng` double(15,8) NOT NULL DEFAULT '0.00000000' COMMENT '坐标1',
  `lat` double(15,8) NOT NULL DEFAULT '0.00000000' COMMENT '坐标2',
  `open_time` varchar(25) NOT NULL DEFAULT '' COMMENT '营业时间',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态(申请中 审核中 通过 关闭）',
  `fee` tinyint(2) NOT NULL DEFAULT '8' COMMENT '服务费',
  `is_recommend` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否推荐',
  `recommend_side` varchar(64) NOT NULL DEFAULT '' COMMENT '推荐位置',
  `score` decimal(2,1) NOT NULL DEFAULT '0.0' COMMENT '评分',
  `max_amount_preday` decimal(13,2) NOT NULL DEFAULT '0.00' COMMENT '每人每日最大营业额',
  `solds` int(11) NOT NULL DEFAULT '0' COMMENT '已售商品',
  `create_time` int(11) NOT NULL,
  `temp_goods` text NOT NULL COMMENT '商品数据',
  PRIMARY KEY (`id`),
  KEY `member_id` (`member_id`),
  CONSTRAINT `gw_sku_supermarkets_copy_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `gaiwang`.`gw_member` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COMMENT='超市列表';

-- ----------------------------
-- Table structure for gw_sku_system_log
-- ----------------------------
DROP TABLE IF EXISTS `gw_sku_system_log`;
CREATE TABLE `gw_sku_system_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(128) NOT NULL COMMENT '用户名',
  `type` tinyint(1) unsigned NOT NULL COMMENT '0非挂单，1挂单',
  `info` text NOT NULL COMMENT '信息',
  `ip` int(11) unsigned NOT NULL COMMENT 'IP',
  `create_time` int(11) unsigned NOT NULL COMMENT '记录时间',
  `user_id` int(11) unsigned NOT NULL COMMENT '所属用户',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3285 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='操作日志';

-- ----------------------------
-- Table structure for gw_sku_type
-- ----------------------------
DROP TABLE IF EXISTS `gw_sku_type`;
CREATE TABLE `gw_sku_type` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(128) NOT NULL COMMENT '名称',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='类型';

-- ----------------------------
-- Table structure for gw_sku_un_goods_rule
-- ----------------------------
DROP TABLE IF EXISTS `gw_sku_un_goods_rule`;
CREATE TABLE `gw_sku_un_goods_rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL DEFAULT '0' COMMENT '项目',
  `type` varchar(128) NOT NULL DEFAULT '' COMMENT '项目类型',
  `upload_bonus` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '上传奖励',
  `adopt_bonus` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '采纳奖励',
  `is_input` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否录入  0为否 1为是',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='非产品库商品录入规则';

-- ----------------------------
-- Table structure for gw_sku_user
-- ----------------------------
DROP TABLE IF EXISTS `gw_sku_user`;
CREATE TABLE `gw_sku_user` (
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
) ENGINE=InnoDB AUTO_INCREMENT=272 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='管理员';

-- ----------------------------
-- Table structure for gw_sku_vending_machine
-- ----------------------------
DROP TABLE IF EXISTS `gw_sku_vending_machine`;
CREATE TABLE `gw_sku_vending_machine` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `code` char(12) NOT NULL DEFAULT '' COMMENT '装机编码，由系统自动生成,12位数字组成',
  `thumb` varchar(128) NOT NULL DEFAULT '' COMMENT '缩略图',
  `mobile` varchar(13) NOT NULL DEFAULT '' COMMENT '管理员手机',
  `partner_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家id',
  `category_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺分类',
  `activation_code` varchar(50) NOT NULL DEFAULT '' COMMENT '系统生成的激活码',
  `name` varchar(128) NOT NULL DEFAULT '' COMMENT '售货机名称',
  `password` varchar(128) NOT NULL DEFAULT '' COMMENT '管理密码',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态（0、申请 1、启用 2、禁用）',
  `is_activate` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否激活（0未激活、1已激活）',
  `symbol` varchar(20) NOT NULL DEFAULT 'RMB' COMMENT '币种(RMB、HKD)',
  `country_id` mediumint(8) unsigned NOT NULL DEFAULT '1' COMMENT '国家id',
  `province_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '省份id',
  `city_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '城市id',
  `district_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '区县id',
  `address` varchar(225) NOT NULL DEFAULT '' COMMENT '地址',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '管理员id',
  `user_ip` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '管理员ip',
  `member_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '商家id',
  `setup_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '安装时间',
  `remark` varchar(200) NOT NULL DEFAULT '' COMMENT '备注',
  `private_key` text NOT NULL COMMENT '私钥',
  `public_key` text NOT NULL COMMENT '公钥',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `device_id` char(64) NOT NULL DEFAULT '' COMMENT '设备id',
  `lng` double(15,8) NOT NULL DEFAULT '0.00000000' COMMENT '经度',
  `lat` double(15,8) NOT NULL DEFAULT '0.00000000' COMMENT '维度',
  `fee` tinyint(2) NOT NULL DEFAULT '8' COMMENT '服务费',
  `is_recommend` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否推荐',
  `is_over_amount` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否超过每日最大营业额',
  `max_amount_preday` decimal(13,2) NOT NULL DEFAULT '0.00' COMMENT '每日最大营业额',
  `recommend_side` varchar(64) NOT NULL DEFAULT '' COMMENT '推荐位置',
  `solds` int(10) NOT NULL DEFAULT '0',
  `temp_goods` text NOT NULL COMMENT '商品暂存数据',
  `referrals_id` int(11) NOT NULL DEFAULT '0' COMMENT '推荐人',
  `flash_back_status` tinyint(1) NOT NULL COMMENT '闪退状态',
  `version` varchar(12) NOT NULL COMMENT '版本号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_sku_vending_machine_cell_store
-- ----------------------------
DROP TABLE IF EXISTS `gw_sku_vending_machine_cell_store`;
CREATE TABLE `gw_sku_vending_machine_cell_store` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(6) NOT NULL DEFAULT '' COMMENT '所属商家',
  `machine_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '所属超市',
  `goods_id` int(11) NOT NULL DEFAULT '0' COMMENT '上架的商品id',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态   1为上架  2为下架',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `superMember` (`code`),
  KEY `machineId` (`machine_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=utf8 COMMENT='售货机格仔铺表';

-- ----------------------------
-- Table structure for gw_sku_vending_machine_copy
-- ----------------------------
DROP TABLE IF EXISTS `gw_sku_vending_machine_copy`;
CREATE TABLE `gw_sku_vending_machine_copy` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `code` char(12) NOT NULL DEFAULT '' COMMENT '装机编码，由系统自动生成,12位数字组成',
  `thumb` varchar(128) NOT NULL DEFAULT '' COMMENT '缩略图',
  `mobile` varchar(13) NOT NULL DEFAULT '' COMMENT '管理员手机',
  `partner_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家id',
  `category_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺分类',
  `activation_code` varchar(50) NOT NULL DEFAULT '' COMMENT '系统生成的激活码',
  `name` varchar(128) NOT NULL DEFAULT '' COMMENT '售货机名称',
  `password` varchar(128) NOT NULL DEFAULT '' COMMENT '管理密码',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态（0、申请 1、启用 2、禁用）',
  `is_activate` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否激活（0未激活、1已激活）',
  `symbol` varchar(20) NOT NULL DEFAULT 'RMB' COMMENT '币种(RMB、HKD)',
  `country_id` mediumint(8) unsigned NOT NULL DEFAULT '1' COMMENT '国家id',
  `province_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '省份id',
  `city_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '城市id',
  `district_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '区县id',
  `address` varchar(225) NOT NULL DEFAULT '' COMMENT '地址',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '管理员id',
  `user_ip` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '管理员ip',
  `member_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '商家id',
  `setup_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '安装时间',
  `remark` varchar(200) NOT NULL DEFAULT '' COMMENT '备注',
  `private_key` text NOT NULL COMMENT '私钥',
  `public_key` text NOT NULL COMMENT '公钥',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `device_id` char(64) NOT NULL DEFAULT '' COMMENT '设备id',
  `lng` double(15,8) NOT NULL DEFAULT '0.00000000' COMMENT '经度',
  `lat` double(15,8) NOT NULL DEFAULT '0.00000000' COMMENT '维度',
  `fee` tinyint(2) NOT NULL DEFAULT '8' COMMENT '服务费',
  `is_recommend` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否推荐',
  `is_over_amount` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否超过每日最大营业额',
  `max_amount_preday` decimal(13,2) NOT NULL DEFAULT '0.00' COMMENT '每日最大营业额',
  `recommend_side` varchar(64) NOT NULL DEFAULT '' COMMENT '推荐位置',
  `solds` int(10) NOT NULL DEFAULT '0',
  `temp_goods` text NOT NULL COMMENT '商品暂存数据',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_sku_vending_machine_goods
-- ----------------------------
DROP TABLE IF EXISTS `gw_sku_vending_machine_goods`;
CREATE TABLE `gw_sku_vending_machine_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) unsigned NOT NULL COMMENT '所属商家',
  `machine_id` int(11) unsigned NOT NULL COMMENT '所属超市',
  `line` varchar(32) NOT NULL DEFAULT '' COMMENT '售货机货道',
  `status` tinyint(2) NOT NULL DEFAULT '2' COMMENT '状态',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `superMember` (`goods_id`),
  KEY `machineId` (`machine_id`) USING BTREE,
  CONSTRAINT `gw_sku_vending_machine_goods_ibfk_1` FOREIGN KEY (`goods_id`) REFERENCES `gw_sku_goods` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8 COMMENT='超市商品表';

-- ----------------------------
-- Table structure for gw_sku_web_config
-- ----------------------------
DROP TABLE IF EXISTS `gw_sku_web_config`;
CREATE TABLE `gw_sku_web_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `value` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8 COMMENT='网站配置管理信息表';

-- ----------------------------
-- Table structure for gw_sku_xiaoer
-- ----------------------------
DROP TABLE IF EXISTS `gw_sku_xiaoer`;
CREATE TABLE `gw_sku_xiaoer` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家会员id',
  `partner_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家id',
  `xiaoer_member_id` int(11) NOT NULL DEFAULT '0' COMMENT '密码',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态  0为无效，1为有效',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='店小二表';

-- ----------------------------
-- Table structure for gw_sku_xiaoer_client_token
-- ----------------------------
DROP TABLE IF EXISTS `gw_sku_xiaoer_client_token`;
CREATE TABLE `gw_sku_xiaoer_client_token` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '店小二sku会员id',
  `gai_number` varchar(32) NOT NULL DEFAULT '',
  `partner_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家id',
  `token` varchar(34) NOT NULL DEFAULT '' COMMENT 'token',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `expir_time` int(11) NOT NULL DEFAULT '0' COMMENT '超时时间',
  `lang` varchar(12) NOT NULL DEFAULT '' COMMENT '语言',
  `device_id` varchar(32) NOT NULL DEFAULT '' COMMENT '设备id',
  PRIMARY KEY (`id`),
  KEY `member_id` (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- View structure for sku_fresh_machine
-- ----------------------------
DROP VIEW IF EXISTS `sku_fresh_machine`;
