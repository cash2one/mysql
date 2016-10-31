/*
Navicat MySQL Data Transfer

Source Server         : 206
Source Server Version : 50524
Source Host           : 172.18.7.206:3306
Source Database       : accountyfz

Target Server Type    : MYSQL
Target Server Version : 50524
File Encoding         : 65001

Date: 2016-10-31 10:54:40
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for gw_api_log
-- ----------------------------
DROP TABLE IF EXISTS `gw_api_log`;
CREATE TABLE `gw_api_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) unsigned NOT NULL COMMENT '订单id',
  `order_code` varchar(64) NOT NULL COMMENT '订单号',
  `operate_type` char(4) NOT NULL COMMENT '订单操作类型',
  `transaction_type` char(4) NOT NULL COMMENT '事务类型',
  `account_id` int(11) unsigned NOT NULL COMMENT '会员id',
  `sku_number` varchar(32) NOT NULL,
  `gai_number` varchar(32) DEFAULT NULL COMMENT 'GW号',
  `money` decimal(18,2) unsigned NOT NULL COMMENT '订单的金额（包含运费）',
  `freight` decimal(18,2) unsigned NOT NULL COMMENT '运费',
  `remark` text NOT NULL COMMENT '备注',
  `is_callback` tinyint(1) unsigned NOT NULL COMMENT '是否需要回调，0否、1是',
  `callback` varchar(255) NOT NULL COMMENT '回调地址',
  `callback_response` tinyint(1) unsigned NOT NULL COMMENT '0未响应 、1响应',
  `callback_count` tinyint(3) unsigned NOT NULL COMMENT '回调次数',
  `data` text NOT NULL COMMENT '访问的参数记录',
  `status` tinyint(1) unsigned NOT NULL COMMENT '状态（0.金额已经变动 1流水已经写入）',
  `create_time` int(11) unsigned NOT NULL COMMENT '创建时间',
  `node` varchar(32) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code_operate_transaction_type` (`order_code`,`operate_type`,`transaction_type`) USING BTREE,
  KEY `code` (`order_code`) USING BTREE,
  KEY `is_callback` (`is_callback`,`callback_response`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1567 DEFAULT CHARSET=utf8 COMMENT='接口访问日志';

-- ----------------------------
-- Table structure for gw_app_trading_log
-- ----------------------------
DROP TABLE IF EXISTS `gw_app_trading_log`;
CREATE TABLE `gw_app_trading_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '操作类型。1为绑定银行卡、2绑卡支付、3获取验证码、4解绑操作、5绑卡信息列表查询',
  `gai_number` varchar(32) NOT NULL COMMENT '盖网号',
  `result` text NOT NULL COMMENT '返回结果',
  `pay_type` int(3) NOT NULL COMMENT '支付平台类别。1为高汇通',
  `code` varchar(64) NOT NULL COMMENT '流水号',
  `respcode` varchar(6) NOT NULL COMMENT '第三方答应码',
  `send_req_msg_id` varchar(18) NOT NULL COMMENT '第三方平台返回的流水号',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `gai_number` (`gai_number`) USING BTREE,
  KEY `pay_type` (`pay_type`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='API端第三方支付、绑卡接口记录表';

-- ----------------------------
-- Table structure for gw_sku_account_balance
-- ----------------------------
DROP TABLE IF EXISTS `gw_sku_account_balance`;
CREATE TABLE `gw_sku_account_balance` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `account_id` int(11) unsigned NOT NULL COMMENT '所属账号',
  `sku_number` varchar(32) NOT NULL COMMENT 'GW号',
  `today_amount` decimal(18,2) NOT NULL COMMENT '今天余额',
  `yesterday_amount` decimal(18,2) NOT NULL COMMENT '昨天余额',
  `type` tinyint(3) unsigned NOT NULL COMMENT '类型（1商家、2代理、3消费、4待返还、5冻结、6、盖网公共、9总账户、8普通会员提现账户）',
  `last_update_time` int(11) unsigned NOT NULL COMMENT '最后更新时间',
  `remark` text COMMENT '备注',
  `create_time` int(11) unsigned NOT NULL COMMENT '创建时间',
  `amount_salt` char(32) NOT NULL COMMENT '金额密钥',
  `amount_hash` char(40) NOT NULL COMMENT '金额校验码',
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_id_type` (`account_id`,`type`,`sku_number`) USING BTREE,
  KEY `type` (`type`) USING BTREE,
  KEY `account_id` (`account_id`) USING BTREE,
  KEY `sku_number` (`sku_number`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=207 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for gw_sku_account_flow
-- ----------------------------
DROP TABLE IF EXISTS `gw_sku_account_flow`;
CREATE TABLE `gw_sku_account_flow` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `account_id` int(11) unsigned NOT NULL COMMENT '所属账号',
  `sku_number` varchar(32) NOT NULL COMMENT 'sku号',
  `date` date NOT NULL COMMENT '日期',
  `create_time` int(11) unsigned NOT NULL COMMENT '创建时间',
  `type` tinyint(3) unsigned NOT NULL COMMENT '类型（1商家、2代理、3消费、4待返还、5冻结、6、盖网公共、9总账户）',
  `debit_amount` decimal(18,2) NOT NULL COMMENT '借方发生额',
  `credit_amount` decimal(18,2) NOT NULL COMMENT '贷方发生额',
  `operate_type` tinyint(3) unsigned NOT NULL COMMENT '交易类型（后续定）',
  `trade_spec` varchar(45) DEFAULT NULL COMMENT '地点',
  `trade_terminal_id` int(11) NOT NULL COMMENT '所属终端',
  `trade_terminal_type` tinyint(1) NOT NULL COMMENT '所属终端类型(0、默认 1、门店 2、售货机 3、生鲜机 4、sku商城 5sku微商城)',
  `ratio` decimal(5,2) unsigned NOT NULL,
  `order_id` int(11) unsigned NOT NULL COMMENT '订单ID',
  `order_code` varchar(64) NOT NULL COMMENT '订单编号',
  `remark` text COMMENT '备注',
  `province_id` int(11) unsigned NOT NULL COMMENT '省份',
  `city_id` int(11) unsigned NOT NULL COMMENT '城市',
  `district_id` int(11) unsigned NOT NULL COMMENT '区/县',
  `week` tinyint(3) unsigned NOT NULL COMMENT '第几周',
  `week_day` tinyint(1) unsigned NOT NULL COMMENT '星期几',
  `hour` tinyint(3) unsigned NOT NULL COMMENT '小时',
  `moved` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否搬送（0否、1是）',
  `node` varchar(32) NOT NULL COMMENT '业务节点',
  `transaction_type` tinyint(3) unsigned NOT NULL COMMENT '事务类型',
  `current_balance` decimal(18,2) unsigned NOT NULL COMMENT '当前余额',
  `flag` tinyint(1) unsigned NOT NULL COMMENT '标识(是否显示0显示 1不显示)',
  `by_sku_number` varchar(32) NOT NULL COMMENT '被推荐人sku',
  `export_batch` varchar(24) DEFAULT '0' COMMENT '导出批次',
  `recharge_type` int(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sku_number` (`sku_number`) USING BTREE,
  KEY `account_id` (`account_id`) USING BTREE,
  KEY `date` (`date`) USING BTREE,
  KEY `week` (`week`) USING BTREE,
  KEY `week_day` (`week_day`) USING BTREE,
  KEY `province_id` (`province_id`) USING BTREE,
  KEY `city_id` (`city_id`) USING BTREE,
  KEY `create_time` (`create_time`) USING BTREE,
  KEY `node` (`node`) USING BTREE,
  KEY `export_batch` (`export_batch`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for gw_sku_account_flow_201512
-- ----------------------------
DROP TABLE IF EXISTS `gw_sku_account_flow_201512`;
CREATE TABLE `gw_sku_account_flow_201512` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `account_id` int(11) unsigned NOT NULL COMMENT '所属账号',
  `sku_number` varchar(32) NOT NULL COMMENT 'sku号',
  `date` date NOT NULL COMMENT '日期',
  `create_time` int(11) unsigned NOT NULL COMMENT '创建时间',
  `type` tinyint(3) unsigned NOT NULL COMMENT '类型（1商家、2代理、3消费、4待返还、5冻结、6、盖网公共、9总账户）',
  `debit_amount` decimal(18,2) NOT NULL COMMENT '借方发生额',
  `credit_amount` decimal(18,2) NOT NULL COMMENT '贷方发生额',
  `operate_type` tinyint(3) unsigned NOT NULL COMMENT '交易类型（后续定）',
  `trade_spec` varchar(45) DEFAULT NULL COMMENT '地点',
  `trade_terminal_id` int(11) NOT NULL COMMENT '所属终端',
  `trade_terminal_type` tinyint(1) NOT NULL COMMENT '所属终端类型(0、默认 1、门店 2、售货机 3、生鲜机 4、sku商城 5sku微商城)',
  `ratio` decimal(5,2) unsigned NOT NULL,
  `order_id` int(11) unsigned NOT NULL COMMENT '订单ID',
  `order_code` varchar(64) NOT NULL COMMENT '订单编号',
  `remark` text COMMENT '备注',
  `province_id` int(11) unsigned NOT NULL COMMENT '省份',
  `city_id` int(11) unsigned NOT NULL COMMENT '城市',
  `district_id` int(11) unsigned NOT NULL COMMENT '区/县',
  `week` tinyint(3) unsigned NOT NULL COMMENT '第几周',
  `week_day` tinyint(1) unsigned NOT NULL COMMENT '星期几',
  `hour` tinyint(3) unsigned NOT NULL COMMENT '小时',
  `moved` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否搬送（0否、1是）',
  `node` varchar(32) NOT NULL COMMENT '业务节点',
  `transaction_type` tinyint(3) unsigned NOT NULL COMMENT '事务类型',
  `current_balance` decimal(18,2) unsigned NOT NULL COMMENT '当前余额',
  `flag` tinyint(1) unsigned NOT NULL COMMENT '标识(是否显示0显示 1不显示)',
  `by_sku_number` varchar(32) NOT NULL COMMENT '被推荐人sku',
  `export_batch` varchar(24) DEFAULT '0' COMMENT '导出批次',
  PRIMARY KEY (`id`),
  KEY `sku_number` (`sku_number`) USING BTREE,
  KEY `account_id` (`account_id`) USING BTREE,
  KEY `date` (`date`) USING BTREE,
  KEY `week` (`week`) USING BTREE,
  KEY `week_day` (`week_day`) USING BTREE,
  KEY `province_id` (`province_id`) USING BTREE,
  KEY `city_id` (`city_id`) USING BTREE,
  KEY `create_time` (`create_time`) USING BTREE,
  KEY `node` (`node`) USING BTREE,
  KEY `export_batch` (`export_batch`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for gw_sku_account_flow_201601
-- ----------------------------
DROP TABLE IF EXISTS `gw_sku_account_flow_201601`;
CREATE TABLE `gw_sku_account_flow_201601` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `account_id` int(11) unsigned NOT NULL COMMENT '所属账号',
  `sku_number` varchar(32) NOT NULL COMMENT 'sku号',
  `date` date NOT NULL COMMENT '日期',
  `create_time` int(11) unsigned NOT NULL COMMENT '创建时间',
  `type` tinyint(3) unsigned NOT NULL COMMENT '类型（1商家、2代理、3消费、4待返还、5冻结、6、盖网公共、9总账户）',
  `debit_amount` decimal(18,2) NOT NULL COMMENT '借方发生额',
  `credit_amount` decimal(18,2) NOT NULL COMMENT '贷方发生额',
  `operate_type` tinyint(3) unsigned NOT NULL COMMENT '交易类型（后续定）',
  `trade_spec` varchar(45) DEFAULT NULL COMMENT '地点',
  `trade_terminal_id` int(11) NOT NULL COMMENT '所属终端',
  `trade_terminal_type` tinyint(1) NOT NULL COMMENT '所属终端类型(0、默认 1、门店 2、售货机 3、生鲜机 4、sku商城 5sku微商城)',
  `ratio` decimal(5,2) unsigned NOT NULL,
  `order_id` int(11) unsigned NOT NULL COMMENT '订单ID',
  `order_code` varchar(64) NOT NULL COMMENT '订单编号',
  `remark` text COMMENT '备注',
  `province_id` int(11) unsigned NOT NULL COMMENT '省份',
  `city_id` int(11) unsigned NOT NULL COMMENT '城市',
  `district_id` int(11) unsigned NOT NULL COMMENT '区/县',
  `week` tinyint(3) unsigned NOT NULL COMMENT '第几周',
  `week_day` tinyint(1) unsigned NOT NULL COMMENT '星期几',
  `hour` tinyint(3) unsigned NOT NULL COMMENT '小时',
  `moved` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否搬送（0否、1是）',
  `node` varchar(32) NOT NULL COMMENT '业务节点',
  `transaction_type` tinyint(3) unsigned NOT NULL COMMENT '事务类型',
  `current_balance` decimal(18,2) unsigned NOT NULL COMMENT '当前余额',
  `flag` tinyint(1) unsigned NOT NULL COMMENT '标识(是否显示0显示 1不显示)',
  `by_sku_number` varchar(32) NOT NULL COMMENT '被推荐人sku',
  `export_batch` varchar(24) DEFAULT '0' COMMENT '导出批次',
  `recharge_type` int(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sku_number` (`sku_number`) USING BTREE,
  KEY `account_id` (`account_id`) USING BTREE,
  KEY `date` (`date`) USING BTREE,
  KEY `week` (`week`) USING BTREE,
  KEY `week_day` (`week_day`) USING BTREE,
  KEY `province_id` (`province_id`) USING BTREE,
  KEY `city_id` (`city_id`) USING BTREE,
  KEY `create_time` (`create_time`) USING BTREE,
  KEY `node` (`node`) USING BTREE,
  KEY `export_batch` (`export_batch`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1119 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for gw_sku_account_flow_201602
-- ----------------------------
DROP TABLE IF EXISTS `gw_sku_account_flow_201602`;
CREATE TABLE `gw_sku_account_flow_201602` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `account_id` int(11) unsigned NOT NULL COMMENT '所属账号',
  `sku_number` varchar(32) NOT NULL COMMENT 'sku号',
  `date` date NOT NULL COMMENT '日期',
  `create_time` int(11) unsigned NOT NULL COMMENT '创建时间',
  `type` tinyint(3) unsigned NOT NULL COMMENT '类型（1商家、2代理、3消费、4待返还、5冻结、6、盖网公共、9总账户）',
  `debit_amount` decimal(18,2) NOT NULL COMMENT '借方发生额',
  `credit_amount` decimal(18,2) NOT NULL COMMENT '贷方发生额',
  `operate_type` tinyint(3) unsigned NOT NULL COMMENT '交易类型（后续定）',
  `trade_spec` varchar(45) DEFAULT NULL COMMENT '地点',
  `trade_terminal_id` int(11) NOT NULL COMMENT '所属终端',
  `trade_terminal_type` tinyint(1) NOT NULL COMMENT '所属终端类型(0、默认 1、门店 2、售货机 3、生鲜机 4、sku商城 5sku微商城)',
  `ratio` decimal(5,2) unsigned NOT NULL,
  `order_id` int(11) unsigned NOT NULL COMMENT '订单ID',
  `order_code` varchar(64) NOT NULL COMMENT '订单编号',
  `remark` text COMMENT '备注',
  `province_id` int(11) unsigned NOT NULL COMMENT '省份',
  `city_id` int(11) unsigned NOT NULL COMMENT '城市',
  `district_id` int(11) unsigned NOT NULL COMMENT '区/县',
  `week` tinyint(3) unsigned NOT NULL COMMENT '第几周',
  `week_day` tinyint(1) unsigned NOT NULL COMMENT '星期几',
  `hour` tinyint(3) unsigned NOT NULL COMMENT '小时',
  `moved` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否搬送（0否、1是）',
  `node` varchar(32) NOT NULL COMMENT '业务节点',
  `transaction_type` tinyint(3) unsigned NOT NULL COMMENT '事务类型',
  `current_balance` decimal(18,2) unsigned NOT NULL COMMENT '当前余额',
  `flag` tinyint(1) unsigned NOT NULL COMMENT '标识(是否显示0显示 1不显示)',
  `by_sku_number` varchar(32) NOT NULL COMMENT '被推荐人sku',
  `export_batch` varchar(24) DEFAULT '0' COMMENT '导出批次',
  `recharge_type` int(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sku_number` (`sku_number`) USING BTREE,
  KEY `account_id` (`account_id`) USING BTREE,
  KEY `date` (`date`) USING BTREE,
  KEY `week` (`week`) USING BTREE,
  KEY `week_day` (`week_day`) USING BTREE,
  KEY `province_id` (`province_id`) USING BTREE,
  KEY `city_id` (`city_id`) USING BTREE,
  KEY `create_time` (`create_time`) USING BTREE,
  KEY `node` (`node`) USING BTREE,
  KEY `export_batch` (`export_batch`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1192 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for gw_sku_account_flow_201603
-- ----------------------------
DROP TABLE IF EXISTS `gw_sku_account_flow_201603`;
CREATE TABLE `gw_sku_account_flow_201603` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `account_id` int(11) unsigned NOT NULL COMMENT '所属账号',
  `sku_number` varchar(32) NOT NULL COMMENT 'sku号',
  `date` date NOT NULL COMMENT '日期',
  `create_time` int(11) unsigned NOT NULL COMMENT '创建时间',
  `type` tinyint(3) unsigned NOT NULL COMMENT '类型（1商家、2代理、3消费、4待返还、5冻结、6、盖网公共、9总账户）',
  `debit_amount` decimal(18,2) NOT NULL COMMENT '借方发生额',
  `credit_amount` decimal(18,2) NOT NULL COMMENT '贷方发生额',
  `operate_type` tinyint(3) unsigned NOT NULL COMMENT '交易类型（后续定）',
  `trade_spec` varchar(45) DEFAULT NULL COMMENT '地点',
  `trade_terminal_id` int(11) NOT NULL COMMENT '所属终端',
  `trade_terminal_type` tinyint(1) NOT NULL COMMENT '所属终端类型(0、默认 1、门店 2、售货机 3、生鲜机 4、sku商城 5sku微商城)',
  `ratio` decimal(5,2) unsigned NOT NULL,
  `order_id` int(11) unsigned NOT NULL COMMENT '订单ID',
  `order_code` varchar(64) NOT NULL COMMENT '订单编号',
  `remark` text COMMENT '备注',
  `province_id` int(11) unsigned NOT NULL COMMENT '省份',
  `city_id` int(11) unsigned NOT NULL COMMENT '城市',
  `district_id` int(11) unsigned NOT NULL COMMENT '区/县',
  `week` tinyint(3) unsigned NOT NULL COMMENT '第几周',
  `week_day` tinyint(1) unsigned NOT NULL COMMENT '星期几',
  `hour` tinyint(3) unsigned NOT NULL COMMENT '小时',
  `moved` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否搬送（0否、1是）',
  `node` varchar(32) NOT NULL COMMENT '业务节点',
  `transaction_type` tinyint(3) unsigned NOT NULL COMMENT '事务类型',
  `current_balance` decimal(18,2) unsigned NOT NULL COMMENT '当前余额',
  `flag` tinyint(1) unsigned NOT NULL COMMENT '标识(是否显示0显示 1不显示)',
  `by_sku_number` varchar(32) NOT NULL COMMENT '被推荐人sku',
  `export_batch` varchar(24) DEFAULT '0' COMMENT '导出批次',
  `recharge_type` int(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sku_number` (`sku_number`) USING BTREE,
  KEY `account_id` (`account_id`) USING BTREE,
  KEY `date` (`date`) USING BTREE,
  KEY `week` (`week`) USING BTREE,
  KEY `week_day` (`week_day`) USING BTREE,
  KEY `province_id` (`province_id`) USING BTREE,
  KEY `city_id` (`city_id`) USING BTREE,
  KEY `create_time` (`create_time`) USING BTREE,
  KEY `node` (`node`) USING BTREE,
  KEY `export_batch` (`export_batch`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1276 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for gw_sku_account_flow_201604
-- ----------------------------
DROP TABLE IF EXISTS `gw_sku_account_flow_201604`;
CREATE TABLE `gw_sku_account_flow_201604` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `account_id` int(11) unsigned NOT NULL COMMENT '所属账号',
  `sku_number` varchar(32) NOT NULL COMMENT 'sku号',
  `date` date NOT NULL COMMENT '日期',
  `create_time` int(11) unsigned NOT NULL COMMENT '创建时间',
  `type` tinyint(3) unsigned NOT NULL COMMENT '类型（1商家、2代理、3消费、4待返还、5冻结、6、盖网公共、9总账户）',
  `debit_amount` decimal(18,2) NOT NULL COMMENT '借方发生额',
  `credit_amount` decimal(18,2) NOT NULL COMMENT '贷方发生额',
  `operate_type` tinyint(3) unsigned NOT NULL COMMENT '交易类型（后续定）',
  `trade_spec` varchar(45) DEFAULT NULL COMMENT '地点',
  `trade_terminal_id` int(11) NOT NULL COMMENT '所属终端',
  `trade_terminal_type` tinyint(1) NOT NULL COMMENT '所属终端类型(0、默认 1、门店 2、售货机 3、生鲜机 4、sku商城 5sku微商城)',
  `ratio` decimal(5,2) unsigned NOT NULL,
  `order_id` int(11) unsigned NOT NULL COMMENT '订单ID',
  `order_code` varchar(64) NOT NULL COMMENT '订单编号',
  `remark` text COMMENT '备注',
  `province_id` int(11) unsigned NOT NULL COMMENT '省份',
  `city_id` int(11) unsigned NOT NULL COMMENT '城市',
  `district_id` int(11) unsigned NOT NULL COMMENT '区/县',
  `week` tinyint(3) unsigned NOT NULL COMMENT '第几周',
  `week_day` tinyint(1) unsigned NOT NULL COMMENT '星期几',
  `hour` tinyint(3) unsigned NOT NULL COMMENT '小时',
  `moved` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否搬送（0否、1是）',
  `node` varchar(32) NOT NULL COMMENT '业务节点',
  `transaction_type` tinyint(3) unsigned NOT NULL COMMENT '事务类型',
  `current_balance` decimal(18,2) unsigned NOT NULL COMMENT '当前余额',
  `flag` tinyint(1) unsigned NOT NULL COMMENT '标识(是否显示0显示 1不显示)',
  `by_sku_number` varchar(32) NOT NULL COMMENT '被推荐人sku',
  `export_batch` varchar(24) DEFAULT '0' COMMENT '导出批次',
  `recharge_type` int(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sku_number` (`sku_number`) USING BTREE,
  KEY `account_id` (`account_id`) USING BTREE,
  KEY `date` (`date`) USING BTREE,
  KEY `week` (`week`) USING BTREE,
  KEY `week_day` (`week_day`) USING BTREE,
  KEY `province_id` (`province_id`) USING BTREE,
  KEY `city_id` (`city_id`) USING BTREE,
  KEY `create_time` (`create_time`) USING BTREE,
  KEY `node` (`node`) USING BTREE,
  KEY `export_batch` (`export_batch`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1200 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for gw_sku_account_flow_201605
-- ----------------------------
DROP TABLE IF EXISTS `gw_sku_account_flow_201605`;
CREATE TABLE `gw_sku_account_flow_201605` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `account_id` int(11) unsigned NOT NULL COMMENT '所属账号',
  `sku_number` varchar(32) NOT NULL COMMENT 'sku号',
  `date` date NOT NULL COMMENT '日期',
  `create_time` int(11) unsigned NOT NULL COMMENT '创建时间',
  `type` tinyint(3) unsigned NOT NULL COMMENT '类型（1商家、2代理、3消费、4待返还、5冻结、6、盖网公共、9总账户）',
  `debit_amount` decimal(18,2) NOT NULL COMMENT '借方发生额',
  `credit_amount` decimal(18,2) NOT NULL COMMENT '贷方发生额',
  `operate_type` tinyint(3) unsigned NOT NULL COMMENT '交易类型（后续定）',
  `trade_spec` varchar(45) DEFAULT NULL COMMENT '地点',
  `trade_terminal_id` int(11) NOT NULL COMMENT '所属终端',
  `trade_terminal_type` tinyint(1) NOT NULL COMMENT '所属终端类型(0、默认 1、门店 2、售货机 3、生鲜机 4、sku商城 5sku微商城)',
  `ratio` decimal(5,2) unsigned NOT NULL,
  `order_id` int(11) unsigned NOT NULL COMMENT '订单ID',
  `order_code` varchar(64) NOT NULL COMMENT '订单编号',
  `remark` text COMMENT '备注',
  `province_id` int(11) unsigned NOT NULL COMMENT '省份',
  `city_id` int(11) unsigned NOT NULL COMMENT '城市',
  `district_id` int(11) unsigned NOT NULL COMMENT '区/县',
  `week` tinyint(3) unsigned NOT NULL COMMENT '第几周',
  `week_day` tinyint(1) unsigned NOT NULL COMMENT '星期几',
  `hour` tinyint(3) unsigned NOT NULL COMMENT '小时',
  `moved` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否搬送（0否、1是）',
  `node` varchar(32) NOT NULL COMMENT '业务节点',
  `transaction_type` tinyint(3) unsigned NOT NULL COMMENT '事务类型',
  `current_balance` decimal(18,2) unsigned NOT NULL COMMENT '当前余额',
  `flag` tinyint(1) unsigned NOT NULL COMMENT '标识(是否显示0显示 1不显示)',
  `by_sku_number` varchar(32) NOT NULL COMMENT '被推荐人sku',
  `export_batch` varchar(24) DEFAULT '0' COMMENT '导出批次',
  `recharge_type` int(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sku_number` (`sku_number`) USING BTREE,
  KEY `account_id` (`account_id`) USING BTREE,
  KEY `date` (`date`) USING BTREE,
  KEY `week` (`week`) USING BTREE,
  KEY `week_day` (`week_day`) USING BTREE,
  KEY `province_id` (`province_id`) USING BTREE,
  KEY `city_id` (`city_id`) USING BTREE,
  KEY `create_time` (`create_time`) USING BTREE,
  KEY `node` (`node`) USING BTREE,
  KEY `export_batch` (`export_batch`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=509 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for gw_sku_account_flow_201606
-- ----------------------------
DROP TABLE IF EXISTS `gw_sku_account_flow_201606`;
CREATE TABLE `gw_sku_account_flow_201606` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `account_id` int(11) unsigned NOT NULL COMMENT '所属账号',
  `sku_number` varchar(32) NOT NULL COMMENT 'sku号',
  `date` date NOT NULL COMMENT '日期',
  `create_time` int(11) unsigned NOT NULL COMMENT '创建时间',
  `type` tinyint(3) unsigned NOT NULL COMMENT '类型（1商家、2代理、3消费、4待返还、5冻结、6、盖网公共、9总账户）',
  `debit_amount` decimal(18,2) NOT NULL COMMENT '借方发生额',
  `credit_amount` decimal(18,2) NOT NULL COMMENT '贷方发生额',
  `operate_type` tinyint(3) unsigned NOT NULL COMMENT '交易类型（后续定）',
  `trade_spec` varchar(45) DEFAULT NULL COMMENT '地点',
  `trade_terminal_id` int(11) NOT NULL COMMENT '所属终端',
  `trade_terminal_type` tinyint(1) NOT NULL COMMENT '所属终端类型(0、默认 1、门店 2、售货机 3、生鲜机 4、sku商城 5sku微商城)',
  `ratio` decimal(5,2) unsigned NOT NULL,
  `order_id` int(11) unsigned NOT NULL COMMENT '订单ID',
  `order_code` varchar(64) NOT NULL COMMENT '订单编号',
  `remark` text COMMENT '备注',
  `province_id` int(11) unsigned NOT NULL COMMENT '省份',
  `city_id` int(11) unsigned NOT NULL COMMENT '城市',
  `district_id` int(11) unsigned NOT NULL COMMENT '区/县',
  `week` tinyint(3) unsigned NOT NULL COMMENT '第几周',
  `week_day` tinyint(1) unsigned NOT NULL COMMENT '星期几',
  `hour` tinyint(3) unsigned NOT NULL COMMENT '小时',
  `moved` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否搬送（0否、1是）',
  `node` varchar(32) NOT NULL COMMENT '业务节点',
  `transaction_type` tinyint(3) unsigned NOT NULL COMMENT '事务类型',
  `current_balance` decimal(18,2) unsigned NOT NULL COMMENT '当前余额',
  `flag` tinyint(1) unsigned NOT NULL COMMENT '标识(是否显示0显示 1不显示)',
  `by_sku_number` varchar(32) NOT NULL COMMENT '被推荐人sku',
  `export_batch` varchar(24) DEFAULT '0' COMMENT '导出批次',
  `recharge_type` int(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sku_number` (`sku_number`) USING BTREE,
  KEY `account_id` (`account_id`) USING BTREE,
  KEY `date` (`date`) USING BTREE,
  KEY `week` (`week`) USING BTREE,
  KEY `week_day` (`week_day`) USING BTREE,
  KEY `province_id` (`province_id`) USING BTREE,
  KEY `city_id` (`city_id`) USING BTREE,
  KEY `create_time` (`create_time`) USING BTREE,
  KEY `node` (`node`) USING BTREE,
  KEY `export_batch` (`export_batch`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=225 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for gw_sku_account_flow_201607
-- ----------------------------
DROP TABLE IF EXISTS `gw_sku_account_flow_201607`;
CREATE TABLE `gw_sku_account_flow_201607` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `account_id` int(11) unsigned NOT NULL COMMENT '所属账号',
  `sku_number` varchar(32) NOT NULL COMMENT 'sku号',
  `date` date NOT NULL COMMENT '日期',
  `create_time` int(11) unsigned NOT NULL COMMENT '创建时间',
  `type` tinyint(3) unsigned NOT NULL COMMENT '类型（1商家、2代理、3消费、4待返还、5冻结、6、盖网公共、9总账户）',
  `debit_amount` decimal(18,2) NOT NULL COMMENT '借方发生额',
  `credit_amount` decimal(18,2) NOT NULL COMMENT '贷方发生额',
  `operate_type` tinyint(3) unsigned NOT NULL COMMENT '交易类型（后续定）',
  `trade_spec` varchar(45) DEFAULT NULL COMMENT '地点',
  `trade_terminal_id` int(11) NOT NULL COMMENT '所属终端',
  `trade_terminal_type` tinyint(1) NOT NULL COMMENT '所属终端类型(0、默认 1、门店 2、售货机 3、生鲜机 4、sku商城 5sku微商城)',
  `ratio` decimal(5,2) unsigned NOT NULL,
  `order_id` int(11) unsigned NOT NULL COMMENT '订单ID',
  `order_code` varchar(64) NOT NULL COMMENT '订单编号',
  `remark` text COMMENT '备注',
  `province_id` int(11) unsigned NOT NULL COMMENT '省份',
  `city_id` int(11) unsigned NOT NULL COMMENT '城市',
  `district_id` int(11) unsigned NOT NULL COMMENT '区/县',
  `week` tinyint(3) unsigned NOT NULL COMMENT '第几周',
  `week_day` tinyint(1) unsigned NOT NULL COMMENT '星期几',
  `hour` tinyint(3) unsigned NOT NULL COMMENT '小时',
  `moved` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否搬送（0否、1是）',
  `node` varchar(32) NOT NULL COMMENT '业务节点',
  `transaction_type` tinyint(3) unsigned NOT NULL COMMENT '事务类型',
  `current_balance` decimal(18,2) unsigned NOT NULL COMMENT '当前余额',
  `flag` tinyint(1) unsigned NOT NULL COMMENT '标识(是否显示0显示 1不显示)',
  `by_sku_number` varchar(32) NOT NULL COMMENT '被推荐人sku',
  `export_batch` varchar(24) DEFAULT '0' COMMENT '导出批次',
  `recharge_type` int(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sku_number` (`sku_number`) USING BTREE,
  KEY `account_id` (`account_id`) USING BTREE,
  KEY `date` (`date`) USING BTREE,
  KEY `week` (`week`) USING BTREE,
  KEY `week_day` (`week_day`) USING BTREE,
  KEY `province_id` (`province_id`) USING BTREE,
  KEY `city_id` (`city_id`) USING BTREE,
  KEY `create_time` (`create_time`) USING BTREE,
  KEY `node` (`node`) USING BTREE,
  KEY `export_batch` (`export_batch`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for gw_sku_account_flow_201608
-- ----------------------------
DROP TABLE IF EXISTS `gw_sku_account_flow_201608`;
CREATE TABLE `gw_sku_account_flow_201608` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `account_id` int(11) unsigned NOT NULL COMMENT '所属账号',
  `sku_number` varchar(32) NOT NULL COMMENT 'sku号',
  `date` date NOT NULL COMMENT '日期',
  `create_time` int(11) unsigned NOT NULL COMMENT '创建时间',
  `type` tinyint(3) unsigned NOT NULL COMMENT '类型（1商家、2代理、3消费、4待返还、5冻结、6、盖网公共、9总账户）',
  `debit_amount` decimal(18,2) NOT NULL COMMENT '借方发生额',
  `credit_amount` decimal(18,2) NOT NULL COMMENT '贷方发生额',
  `operate_type` tinyint(3) unsigned NOT NULL COMMENT '交易类型（后续定）',
  `trade_spec` varchar(45) DEFAULT NULL COMMENT '地点',
  `trade_terminal_id` int(11) NOT NULL COMMENT '所属终端',
  `trade_terminal_type` tinyint(1) NOT NULL COMMENT '所属终端类型(0、默认 1、门店 2、售货机 3、生鲜机 4、sku商城 5sku微商城)',
  `ratio` decimal(5,2) unsigned NOT NULL,
  `order_id` int(11) unsigned NOT NULL COMMENT '订单ID',
  `order_code` varchar(64) NOT NULL COMMENT '订单编号',
  `remark` text COMMENT '备注',
  `province_id` int(11) unsigned NOT NULL COMMENT '省份',
  `city_id` int(11) unsigned NOT NULL COMMENT '城市',
  `district_id` int(11) unsigned NOT NULL COMMENT '区/县',
  `week` tinyint(3) unsigned NOT NULL COMMENT '第几周',
  `week_day` tinyint(1) unsigned NOT NULL COMMENT '星期几',
  `hour` tinyint(3) unsigned NOT NULL COMMENT '小时',
  `moved` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否搬送（0否、1是）',
  `node` varchar(32) NOT NULL COMMENT '业务节点',
  `transaction_type` tinyint(3) unsigned NOT NULL COMMENT '事务类型',
  `current_balance` decimal(18,2) unsigned NOT NULL COMMENT '当前余额',
  `flag` tinyint(1) unsigned NOT NULL COMMENT '标识(是否显示0显示 1不显示)',
  `by_sku_number` varchar(32) NOT NULL COMMENT '被推荐人sku',
  `export_batch` varchar(24) DEFAULT '0' COMMENT '导出批次',
  `recharge_type` int(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sku_number` (`sku_number`) USING BTREE,
  KEY `account_id` (`account_id`) USING BTREE,
  KEY `date` (`date`) USING BTREE,
  KEY `week` (`week`) USING BTREE,
  KEY `week_day` (`week_day`) USING BTREE,
  KEY `province_id` (`province_id`) USING BTREE,
  KEY `city_id` (`city_id`) USING BTREE,
  KEY `create_time` (`create_time`) USING BTREE,
  KEY `node` (`node`) USING BTREE,
  KEY `export_batch` (`export_batch`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=291 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for gw_sku_account_flow_201609
-- ----------------------------
DROP TABLE IF EXISTS `gw_sku_account_flow_201609`;
CREATE TABLE `gw_sku_account_flow_201609` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `account_id` int(11) unsigned NOT NULL COMMENT '所属账号',
  `sku_number` varchar(32) NOT NULL COMMENT 'sku号',
  `date` date NOT NULL COMMENT '日期',
  `create_time` int(11) unsigned NOT NULL COMMENT '创建时间',
  `type` tinyint(3) unsigned NOT NULL COMMENT '类型（1商家、2代理、3消费、4待返还、5冻结、6、盖网公共、9总账户）',
  `debit_amount` decimal(18,2) NOT NULL COMMENT '借方发生额',
  `credit_amount` decimal(18,2) NOT NULL COMMENT '贷方发生额',
  `operate_type` tinyint(3) unsigned NOT NULL COMMENT '交易类型（后续定）',
  `trade_spec` varchar(45) DEFAULT NULL COMMENT '地点',
  `trade_terminal_id` int(11) NOT NULL COMMENT '所属终端',
  `trade_terminal_type` tinyint(1) NOT NULL COMMENT '所属终端类型(0、默认 1、门店 2、售货机 3、生鲜机 4、sku商城 5sku微商城)',
  `ratio` decimal(5,2) unsigned NOT NULL,
  `order_id` int(11) unsigned NOT NULL COMMENT '订单ID',
  `order_code` varchar(64) NOT NULL COMMENT '订单编号',
  `remark` text COMMENT '备注',
  `province_id` int(11) unsigned NOT NULL COMMENT '省份',
  `city_id` int(11) unsigned NOT NULL COMMENT '城市',
  `district_id` int(11) unsigned NOT NULL COMMENT '区/县',
  `week` tinyint(3) unsigned NOT NULL COMMENT '第几周',
  `week_day` tinyint(1) unsigned NOT NULL COMMENT '星期几',
  `hour` tinyint(3) unsigned NOT NULL COMMENT '小时',
  `moved` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否搬送（0否、1是）',
  `node` varchar(32) NOT NULL COMMENT '业务节点',
  `transaction_type` tinyint(3) unsigned NOT NULL COMMENT '事务类型',
  `current_balance` decimal(18,2) unsigned NOT NULL COMMENT '当前余额',
  `flag` tinyint(1) unsigned NOT NULL COMMENT '标识(是否显示0显示 1不显示)',
  `by_sku_number` varchar(32) NOT NULL COMMENT '被推荐人sku',
  `export_batch` varchar(24) DEFAULT '0' COMMENT '导出批次',
  `recharge_type` int(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sku_number` (`sku_number`) USING BTREE,
  KEY `account_id` (`account_id`) USING BTREE,
  KEY `date` (`date`) USING BTREE,
  KEY `week` (`week`) USING BTREE,
  KEY `week_day` (`week_day`) USING BTREE,
  KEY `province_id` (`province_id`) USING BTREE,
  KEY `city_id` (`city_id`) USING BTREE,
  KEY `create_time` (`create_time`) USING BTREE,
  KEY `node` (`node`) USING BTREE,
  KEY `export_batch` (`export_batch`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=660 DEFAULT CHARSET=utf8;
