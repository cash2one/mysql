/*
Navicat MySQL Data Transfer

Source Server         : 206
Source Server Version : 50524
Source Host           : 172.18.7.206:3306
Source Database       : gaiwangpart

Target Server Type    : MYSQL
Target Server Version : 50524
File Encoding         : 65001

Date: 2016-10-31 10:53:25
*/

SET FOREIGN_KEY_CHECKS=0;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`gaiwangpart` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `gaiwangpart`;

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for gw_yifenzi_advertising
-- ----------------------------
DROP TABLE IF EXISTS `gw_yifenzi_advertising`;
CREATE TABLE `gw_yifenzi_advertising` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `advertising_name` varchar(100) NOT NULL DEFAULT '' COMMENT '广告位名称',
  `img` varchar(200) NOT NULL DEFAULT '' COMMENT '广告图',
  `tourl` varchar(120) NOT NULL DEFAULT '' COMMENT '广告链接',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否上架(默认为上架)',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `types` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '广告类型',
  `img_w` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '图片宽',
  `img_h` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '广告高',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for gw_yifenzi_brand
-- ----------------------------
DROP TABLE IF EXISTS `gw_yifenzi_brand`;
CREATE TABLE `gw_yifenzi_brand` (
  `brand_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID号',
  `brand_name` varchar(60) NOT NULL DEFAULT '' COMMENT ' 品牌名称',
  `brand_logo` varchar(80) NOT NULL DEFAULT '' COMMENT '上传的该品牌公司logo图片',
  `brand_desc` text NOT NULL COMMENT '品牌描述',
  `site_url` varchar(255) NOT NULL DEFAULT '' COMMENT '品牌的网址',
  `sort_order` tinyint(3) unsigned NOT NULL DEFAULT '50' COMMENT '品牌在前台页面的显示顺序，数字越大越靠后',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '该品牌是否显示，0，否；1，显示',
  PRIMARY KEY (`brand_id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for gw_yifenzi_cart
-- ----------------------------
DROP TABLE IF EXISTS `gw_yifenzi_cart`;
CREATE TABLE `gw_yifenzi_cart` (
  `cart_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '购物车ID',
  `member_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `session_id` char(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'SessionID',
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '商品ID',
  `goods_sn` varchar(60) NOT NULL DEFAULT '' COMMENT '商品括号',
  `goods_name` varchar(120) NOT NULL DEFAULT '' COMMENT '商品名称',
  `single_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商品一人次单价',
  `num` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '购买量',
  `cart_type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '商品购买类型默认1时为正常购买',
  `goods_image` varchar(255) NOT NULL DEFAULT '' COMMENT '商品图片地址',
  `add_time` int(10) unsigned DEFAULT '0' COMMENT '添加时间',
  `current_nper` int(8) unsigned NOT NULL DEFAULT '1' COMMENT '加入购物车中的商品期数',
  PRIMARY KEY (`cart_id`),
  KEY `member_order` (`goods_id`,`member_id`),
  KEY `member_cart` (`goods_id`,`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=296 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_yifenzi_code
-- ----------------------------
DROP TABLE IF EXISTS `gw_yifenzi_code`;
CREATE TABLE `gw_yifenzi_code` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` int(10) unsigned DEFAULT '0',
  `temp_code` text,
  `codes` longtext,
  `s_cid` smallint(3) unsigned DEFAULT '0' COMMENT '分几次循环的当前层',
  `code_len` int(10) unsigned DEFAULT '0' COMMENT '当前层的总长度',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for gw_yifenzi_column
-- ----------------------------
DROP TABLE IF EXISTS `gw_yifenzi_column`;
CREATE TABLE `gw_yifenzi_column` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `column_name` varchar(30) NOT NULL COMMENT '栏目名称',
  `column_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '栏目类型',
  `column_att` tinyint(1) NOT NULL DEFAULT '0' COMMENT '栏目属性',
  `tourl` varchar(100) NOT NULL DEFAULT '' COMMENT '访问地址',
  `parent_id` smallint(6) NOT NULL DEFAULT '0' COMMENT '栏目的父亲ID',
  `sort_order` smallint(6) NOT NULL DEFAULT '0' COMMENT '排序',
  `is_show` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否显示此栏目',
  `column_desc` varchar(200) NOT NULL DEFAULT '' COMMENT '栏目简介',
  `addtime` int(10) NOT NULL DEFAULT '0',
  `altertime` int(10) NOT NULL DEFAULT '0',
  `is_zone` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否为前面专区显示',
  `zone_thumb` varchar(100) NOT NULL DEFAULT '' COMMENT '专区图片',
  `column_logo` varchar(100) NOT NULL DEFAULT '' COMMENT '栏目logo',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_yifenzi_comment
-- ----------------------------
DROP TABLE IF EXISTS `gw_yifenzi_comment`;
CREATE TABLE `gw_yifenzi_comment` (
  `comment_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varchar(60) NOT NULL DEFAULT '' COMMENT '用户名',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `content` text NOT NULL COMMENT '内容',
  `goods_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品ID',
  `comment_img` text NOT NULL COMMENT '晒单图片',
  `ip_address` varchar(30) NOT NULL DEFAULT '' COMMENT 'IP 地址',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for gw_yifenzi_goods_image
-- ----------------------------
DROP TABLE IF EXISTS `gw_yifenzi_goods_image`;
CREATE TABLE `gw_yifenzi_goods_image` (
  `image_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '图片ID',
  `goods_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品ID',
  `goods_thumb` varchar(255) NOT NULL DEFAULT '' COMMENT '缩略图',
  `show_image1` varchar(255) NOT NULL DEFAULT '' COMMENT '展示图片1',
  `show_image2` varchar(255) NOT NULL DEFAULT '' COMMENT '展示图片2',
  `show_image3` varchar(255) NOT NULL DEFAULT '' COMMENT '展示图片3',
  `show_image4` varchar(255) NOT NULL DEFAULT '' COMMENT '展示图片4',
  `show_image5` varchar(255) NOT NULL DEFAULT '' COMMENT '展示图片5',
  `sort_order` smallint(4) unsigned NOT NULL DEFAULT '100' COMMENT '排序',
  PRIMARY KEY (`image_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_yifenzi_goods_statistics
-- ----------------------------
DROP TABLE IF EXISTS `gw_yifenzi_goods_statistics`;
CREATE TABLE `gw_yifenzi_goods_statistics` (
  `goods_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品ID',
  `views` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品浏览次数',
  `carts` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品添加到购物车次数',
  `orders` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品下单次数',
  `sales` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品出售多少次',
  `comments` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论次数',
  PRIMARY KEY (`goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_yifenzi_member
-- ----------------------------
DROP TABLE IF EXISTS `gw_yifenzi_member`;
CREATE TABLE `gw_yifenzi_member` (
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='一份子会员表';

-- ----------------------------
-- Table structure for gw_yifenzi_member_ip
-- ----------------------------
DROP TABLE IF EXISTS `gw_yifenzi_member_ip`;
CREATE TABLE `gw_yifenzi_member_ip` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `ip_address` varchar(255) DEFAULT NULL COMMENT 'ip地址',
  `addtime` varchar(14) NOT NULL DEFAULT '' COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for gw_yifenzi_order
-- ----------------------------
DROP TABLE IF EXISTS `gw_yifenzi_order`;
CREATE TABLE `gw_yifenzi_order` (
  `order_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '订单ID',
  `order_sn` varchar(20) NOT NULL DEFAULT '' COMMENT '定单括号',
  `member_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `user_name` varchar(30) NOT NULL DEFAULT '' COMMENT '用户名称',
  `order_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '订单状态（0->未支付，1-》支付成功，2-》支付失败，3-》订单作废）',
  `order_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '订单金额或者是已付款金额',
  `payment_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '支付ID',
  `payment_name` varchar(100) NOT NULL DEFAULT '' COMMENT '支付名称',
  `payment_code` varchar(100) NOT NULL DEFAULT '' COMMENT '支付代码',
  `out_trade_sn` varchar(100) NOT NULL DEFAULT '' COMMENT '支付时外部括号',
  `pay_time` int(10) NOT NULL COMMENT '支付时间',
  `shipping_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发货时间',
  `invoice_no` varchar(255) NOT NULL DEFAULT '' COMMENT '快递号',
  `invoice_company` varchar(255) NOT NULL COMMENT '物流公司',
  `finished_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '完成时间',
  `evaluation_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否已经评价',
  `evaluation_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评价时间',
  `addtime` varchar(14) NOT NULL DEFAULT '' COMMENT '添加时间',
  `is_address` smallint(8) unsigned NOT NULL DEFAULT '0' COMMENT '用户选择收货地址',
  `payment_type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '订单支付类型1代表积分支付；2为微信',
  `is_delivery` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否收货 0是未，1已收货',
  `is_invoice` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否发货 0是未，1已发货',
  `order_channel` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '订单所属渠道',
  PRIMARY KEY (`order_id`),
  KEY `member_order` (`member_id`,`order_status`)
) ENGINE=InnoDB AUTO_INCREMENT=873 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for gw_yifenzi_order_goods
-- ----------------------------
DROP TABLE IF EXISTS `gw_yifenzi_order_goods`;
CREATE TABLE `gw_yifenzi_order_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '订单ID',
  `goods_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品ID',
  `goods_name` varchar(120) NOT NULL DEFAULT '' COMMENT '商品名称',
  `winning_code` text NOT NULL COMMENT '中奖码',
  `goods_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商品单价',
  `goods_image` varchar(60) NOT NULL COMMENT '商品图片',
  `goods_number` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '购买量',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `single_price` decimal(5,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '商品单次价格',
  `current_nper` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '商品当前期数',
  PRIMARY KEY (`id`),
  KEY `order_member_goods` (`order_id`,`goods_id`,`current_nper`),
  KEY `member_goods` (`goods_id`,`current_nper`)
) ENGINE=InnoDB AUTO_INCREMENT=1272 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for gw_yifenzi_order_goods_nper
-- ----------------------------
DROP TABLE IF EXISTS `gw_yifenzi_order_goods_nper`;
CREATE TABLE `gw_yifenzi_order_goods_nper` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '订单ID',
  `goods_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品ID',
  `member_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `goods_name` varchar(120) NOT NULL DEFAULT '' COMMENT '商品名称',
  `winning_code` int(8) unsigned NOT NULL DEFAULT '0' COMMENT '中奖码',
  `current_nper` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '商品当前期数',
  `lotterytime` int(8) unsigned NOT NULL DEFAULT '0' COMMENT '开奖时间的相差',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `sumlotterytime` varchar(15) NOT NULL DEFAULT '' COMMENT '开奖时间总和',
  `order_id_log` text COMMENT '订单ID记录',
  `mobile_is_send` tinyint(1) DEFAULT '0' COMMENT '手机短信是否已发送 0未发送 1已发送',
  `gai_number` varchar(32) NOT NULL COMMENT 'GW号',
  `mobile` varchar(128) NOT NULL COMMENT '手机号码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for gw_yifenzi_order_log
-- ----------------------------
DROP TABLE IF EXISTS `gw_yifenzi_order_log`;
CREATE TABLE `gw_yifenzi_order_log` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '日志ID',
  `order_sn` varchar(32) NOT NULL DEFAULT '0' COMMENT '定单',
  `operator` varchar(60) NOT NULL DEFAULT '' COMMENT '操作人名',
  `order_status` varchar(60) NOT NULL DEFAULT '' COMMENT '订单状态',
  `changed_status` varchar(60) NOT NULL DEFAULT '' COMMENT '修改状态',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `log_time` int(100) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for gw_yifenzi_payment
-- ----------------------------
DROP TABLE IF EXISTS `gw_yifenzi_payment`;
CREATE TABLE `gw_yifenzi_payment` (
  `payment_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '支付方式ID',
  `payment_code` varchar(20) NOT NULL DEFAULT '' COMMENT '支付代码',
  `payment_name` varchar(100) NOT NULL DEFAULT '' COMMENT '支付名称',
  `payment_desc` varchar(255) NOT NULL DEFAULT '' COMMENT '支付配置',
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否启用这支付',
  `sort_order` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `config` text NOT NULL,
  `is_online` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否为在线支付',
  PRIMARY KEY (`payment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for gw_yifenzi_queue_order
-- ----------------------------
DROP TABLE IF EXISTS `gw_yifenzi_queue_order`;
CREATE TABLE `gw_yifenzi_queue_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `goods_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品ID',
  `num` int(8) unsigned NOT NULL DEFAULT '0' COMMENT '购物数量',
  `single_price` decimal(5,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '商品单次价格',
  `shop_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '商品单价',
  `current_nper` smallint(6) unsigned NOT NULL DEFAULT '1' COMMENT '商品当前期数(当前期永远都是进行中的状态)',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `current_nper_ing` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '商品进行中的期数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=351 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for gw_yifenzi_weixin_member
-- ----------------------------
DROP TABLE IF EXISTS `gw_yifenzi_weixin_member`;
CREATE TABLE `gw_yifenzi_weixin_member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT ' 主键',
  `member_id` int(10) unsigned NOT NULL COMMENT '用户id',
  `openid` varchar(255) NOT NULL COMMENT '微信登陆用户的openid',
  `login_time` int(10) unsigned NOT NULL COMMENT '登陆时间',
  `last_login_time` int(10) unsigned NOT NULL COMMENT '微信端最后登陆时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='微信用户登陆记录表';

-- ----------------------------
-- Table structure for gw_yifenzi_yfzgoods
-- ----------------------------
DROP TABLE IF EXISTS `gw_yifenzi_yfzgoods`;
CREATE TABLE `gw_yifenzi_yfzgoods` (
  `goods_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品ID',
  `column_id` smallint(6) NOT NULL DEFAULT '0' COMMENT '栏目ID',
  `goods_sn` varchar(60) NOT NULL DEFAULT '' COMMENT '商品括号',
  `goods_name` varchar(120) NOT NULL DEFAULT '' COMMENT '商品名称',
  `after_name` varchar(120) NOT NULL DEFAULT '' COMMENT '商品复标题',
  `after_name_style` varchar(60) NOT NULL DEFAULT '' COMMENT '复标题样式',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '商品关键字',
  `shop_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '商品单价',
  `single_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '商品单次价格',
  `max_nper` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '商品最大期数',
  `current_nper` smallint(6) unsigned NOT NULL DEFAULT '1' COMMENT '商品当前期数(当前期永远都是进行中的状态)',
  `brand_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '商品所属品牌',
  `goods_number` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品库存',
  `goods_desc` text NOT NULL COMMENT '商品描述',
  `is_on_sale` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否开放众筹',
  `integral` int(10) unsigned DEFAULT '0' COMMENT '商品需要多少积分(游戏币)',
  `is_closed` tinyint(1) DEFAULT '0' COMMENT '是否关闭此商品0代表正常,1代表关闭',
  `close_reason` varchar(200) DEFAULT '' COMMENT '关闭此商品的原因',
  `is_hot` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '人气',
  `recommended` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否推荐',
  `sort_order` smallint(4) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `last_update` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后更新时间',
  `announced_time` int(11) unsigned NOT NULL DEFAULT '600' COMMENT '达标人数揭晓时间默认为600秒',
  `limit_number` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '限购数量',
  `sales_time` int(10) unsigned DEFAULT NULL COMMENT '上架时间',
  PRIMARY KEY (`goods_id`),
  KEY `column_id` (`column_id`) USING BTREE,
  KEY `site` (`is_closed`,`recommended`,`is_on_sale`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
