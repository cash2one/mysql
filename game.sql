/*
Navicat MySQL Data Transfer

Source Server         : 206
Source Server Version : 50524
Source Host           : 172.18.7.206:3306
Source Database       : game

Target Server Type    : MYSQL
Target Server Version : 50524
File Encoding         : 65001

Date: 2016-10-31 10:53:59
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for gw_game_combo
-- ----------------------------
DROP TABLE IF EXISTS `gw_game_combo`;
CREATE TABLE `gw_game_combo` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(11) unsigned NOT NULL COMMENT '会员id',
  `game_type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '游戏类型',
  `token` varchar(128) NOT NULL COMMENT '用户唯一标示',
  `msg_id` int(11) unsigned NOT NULL COMMENT '游戏协议id',
  `score` int(11) unsigned NOT NULL COMMENT '当局分数',
  `combo` int(11) unsigned NOT NULL COMMENT '当局连击数',
  `request` text NOT NULL COMMENT '请求的数据(存明文，解密后存入)',
  `result` text NOT NULL COMMENT '返回的数据(存明文，加密后返回给前端)',
  `result_code` tinyint(1) unsigned NOT NULL COMMENT '返回的状态码（0请求失败 1请求成功 2当前请求加密数据解密失败 3积分不足）',
  `create_time` int(11) unsigned NOT NULL COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `token_msg_id` (`token`,`msg_id`),
  KEY `member_id` (`member_id`),
  KEY `game_type` (`game_type`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='游戏得分表';

-- ----------------------------
-- Table structure for gw_game_exchange
-- ----------------------------
DROP TABLE IF EXISTS `gw_game_exchange`;
CREATE TABLE `gw_game_exchange` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(64) NOT NULL COMMENT '订单编号(GAEXxxxxxxxxxx)',
  `token` varchar(128) NOT NULL COMMENT '用户唯一标示',
  `member_id` int(11) unsigned NOT NULL COMMENT '会员id',
  `game_type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '游戏类型',
  `msg_id` int(11) unsigned NOT NULL COMMENT '游戏协议id',
  `amount` decimal(18,2) NOT NULL COMMENT '花费金额',
  `expenditure` decimal(18,2) unsigned NOT NULL COMMENT '花费的积分',
  `income_gold` int(11) unsigned NOT NULL COMMENT '兑换的金币数',
  `request` text NOT NULL COMMENT '请求的数据(存明文，解密后存入)',
  `result` text NOT NULL COMMENT '返回的数据(存明文，加密后返回给前端)',
  `result_code` tinyint(1) unsigned NOT NULL COMMENT '返回的状态码（0请求失败 1请求成功 2当前请求加密数据解密失败 3积分不足）',
  `create_time` int(11) unsigned NOT NULL COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `token_msg_id` (`token`,`msg_id`),
  KEY `member_id` (`member_id`),
  KEY `game_type` (`game_type`)
) ENGINE=InnoDB AUTO_INCREMENT=369 DEFAULT CHARSET=utf8 COMMENT='金币兑换表';

-- ----------------------------
-- Table structure for gw_game_exchange_apple
-- ----------------------------
DROP TABLE IF EXISTS `gw_game_exchange_apple`;
CREATE TABLE `gw_game_exchange_apple` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(64) NOT NULL COMMENT '交易标识符(苹果端交易标识符)',
  `token` varchar(128) NOT NULL COMMENT '用户唯一标示',
  `member_id` int(11) unsigned NOT NULL COMMENT '会员id',
  `game_type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '游戏类型',
  `msg_id` int(11) unsigned NOT NULL COMMENT '游戏协议id',
  `amount` decimal(18,2) NOT NULL COMMENT '花费金额',
  `expenditure` decimal(18,2) unsigned NOT NULL COMMENT '花费的积分',
  `income_gold` int(11) unsigned NOT NULL COMMENT '兑换的金币数',
  `request` text NOT NULL COMMENT '请求的数据(存明文，解密后存入)',
  `request_apple` text NOT NULL COMMENT '请求的数据(发送到苹果验证请求，存明文)',
  `result` text NOT NULL COMMENT '返回的数据(存明文，加密后返回给前端)',
  `result_apple` text NOT NULL COMMENT '返回的数据(苹果服务器返回结果，存明文)',
  `status` tinyint(3) unsigned NOT NULL COMMENT '金币充值状态（0 充值失败 1充值成功）',
  `status_apple` tinyint(3) unsigned NOT NULL COMMENT '苹果服务器返回的验证结果（0验证失败 1验证成功 2网络异常）',
  `create_time` int(11) unsigned NOT NULL COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `token_msg_id` (`token`,`msg_id`),
  KEY `member_id` (`member_id`),
  KEY `game_type` (`game_type`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='IOS人民币兑换金币表';

-- ----------------------------
-- Table structure for gw_game_expend
-- ----------------------------
DROP TABLE IF EXISTS `gw_game_expend`;
CREATE TABLE `gw_game_expend` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(11) unsigned NOT NULL COMMENT '会员id',
  `game_type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '游戏类型',
  `token` varchar(128) NOT NULL COMMENT '用户唯一标示',
  `msg_id` int(11) unsigned NOT NULL COMMENT '游戏协议id',
  `expenditure` int(11) unsigned NOT NULL COMMENT '花费的金币数',
  `gold_num` int(11) unsigned NOT NULL COMMENT '现有的金币数',
  `request` text NOT NULL COMMENT '请求的数据(存明文，解密后存入)',
  `result` text NOT NULL COMMENT '返回的数据(存明文，加密后返回给前端)',
  `result_code` tinyint(1) unsigned NOT NULL COMMENT '返回的状态码（0请求失败 1请求成功 2当前请求加密数据解密失败 3积分不足）',
  `create_time` int(11) unsigned NOT NULL COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `token_msg_id` (`token`,`msg_id`),
  KEY `member_id` (`member_id`),
  KEY `game_type` (`game_type`)
) ENGINE=InnoDB AUTO_INCREMENT=432 DEFAULT CHARSET=utf8 COMMENT='金币花费表';

-- ----------------------------
-- Table structure for gw_game_feedback
-- ----------------------------
DROP TABLE IF EXISTS `gw_game_feedback`;
CREATE TABLE `gw_game_feedback` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL COMMENT '反馈人',
  `contact` varchar(128) NOT NULL COMMENT '联系方式',
  `content` text NOT NULL COMMENT '反馈内容',
  `type` int(11) unsigned NOT NULL COMMENT '游戏类型',
  `create_time` int(11) unsigned NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='游戏反馈表';

-- ----------------------------
-- Table structure for gw_game_item_gain
-- ----------------------------
DROP TABLE IF EXISTS `gw_game_item_gain`;
CREATE TABLE `gw_game_item_gain` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(11) unsigned NOT NULL COMMENT '会员id',
  `store_id` int(11) unsigned NOT NULL COMMENT '游戏店铺id',
  `item_id` int(11) unsigned NOT NULL COMMENT '商品id',
  `item_number` int(11) unsigned NOT NULL COMMENT '抢到商品数量',
  `gain_time` int(11) NOT NULL COMMENT '抢到水果时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='游戏商品获得表';

-- ----------------------------
-- Table structure for gw_game_item_stock
-- ----------------------------
DROP TABLE IF EXISTS `gw_game_item_stock`;
CREATE TABLE `gw_game_item_stock` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `store_id` int(11) unsigned NOT NULL COMMENT '游戏店铺id',
  `item_id` int(11) unsigned NOT NULL COMMENT '商品id',
  `stock_number` int(11) unsigned NOT NULL COMMENT '商品库存数量',
  `update_stock_time` int(11) NOT NULL COMMENT '活动更新库存时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=780 DEFAULT CHARSET=utf8 COMMENT='游戏商品库存表';

-- ----------------------------
-- Table structure for gw_game_level
-- ----------------------------
DROP TABLE IF EXISTS `gw_game_level`;
CREATE TABLE `gw_game_level` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(11) unsigned NOT NULL COMMENT '会员id',
  `game_type` tinyint(1) unsigned NOT NULL COMMENT '游戏类型',
  `level` int(11) unsigned NOT NULL COMMENT '当局的关卡',
  `score` int(11) unsigned NOT NULL COMMENT '当局的分数',
  `over_state` tinyint(1) NOT NULL DEFAULT '0' COMMENT '完成状态',
  `task_state1` tinyint(1) NOT NULL DEFAULT '0' COMMENT '任务1完成状态',
  `task_state2` tinyint(1) NOT NULL DEFAULT '0' COMMENT '任务2完成状态',
  `task_state3` tinyint(1) NOT NULL DEFAULT '0' COMMENT '任务3完成状态',
  `star_num` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '星星数量',
  `clear_all` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否清光障碍物',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8 COMMENT='游戏关卡的分数表';

-- ----------------------------
-- Table structure for gw_game_magic
-- ----------------------------
DROP TABLE IF EXISTS `gw_game_magic`;
CREATE TABLE `gw_game_magic` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(11) unsigned NOT NULL COMMENT '会员id',
  `game_type` tinyint(1) unsigned NOT NULL COMMENT '游戏类型',
  `magic_id` int(11) unsigned NOT NULL COMMENT '法宝id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='法宝表';

-- ----------------------------
-- Table structure for gw_game_member
-- ----------------------------
DROP TABLE IF EXISTS `gw_game_member`;
CREATE TABLE `gw_game_member` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(11) unsigned NOT NULL COMMENT '会员id',
  `gai_number` varchar(32) NOT NULL COMMENT '会员GW号，冗余字段',
  `gold_num` int(11) unsigned NOT NULL COMMENT '金币数量',
  `fruit_gold` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '果币数量',
  `login_time` int(11) unsigned NOT NULL COMMENT '登录时间',
  `token` varchar(128) NOT NULL COMMENT '用户唯一标示',
  PRIMARY KEY (`id`),
  UNIQUE KEY `token` (`token`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8 COMMENT='游戏会员表';

-- ----------------------------
-- Table structure for gw_game_member_info
-- ----------------------------
DROP TABLE IF EXISTS `gw_game_member_info`;
CREATE TABLE `gw_game_member_info` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(11) unsigned NOT NULL COMMENT '会员id',
  `game_type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '游戏类型',
  `is_first` tinyint(1) unsigned NOT NULL COMMENT '是否首次玩',
  `power` tinyint(1) unsigned NOT NULL COMMENT '体力值',
  `boom` int(11) unsigned NOT NULL COMMENT '炸弹数',
  `max_score` int(11) unsigned NOT NULL COMMENT '游戏历史最高分数',
  `max_combo` tinyint(3) unsigned NOT NULL COMMENT '游戏历史最大连击数',
  `update_power_time` int(11) unsigned NOT NULL COMMENT '体力更新时间',
  `unlimit_power` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '无限体力0：否,1：是',
  `star_num` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '星星数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8 COMMENT='游戏信息表';

-- ----------------------------
-- Table structure for gw_game_result
-- ----------------------------
DROP TABLE IF EXISTS `gw_game_result`;
CREATE TABLE `gw_game_result` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(64) NOT NULL COMMENT '订单编号(GAMExxxxxxxx)',
  `token` varchar(128) NOT NULL COMMENT '用户唯一标示',
  `member_id` int(11) unsigned NOT NULL COMMENT '会员id',
  `game_type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '游戏类型',
  `msg_id` int(11) unsigned NOT NULL COMMENT '游戏协议id',
  `expenditure` int(11) unsigned NOT NULL COMMENT '花费的金币数',
  `income_gold` int(11) unsigned NOT NULL COMMENT '购买的金币数',
  `request` text NOT NULL COMMENT '请求的数据(存明文，解密后存入)',
  `result` text NOT NULL COMMENT '返回的数据(存明文，加密后返回给前端)',
  `result_code` tinyint(1) unsigned NOT NULL COMMENT '返回的状态码',
  `create_time` int(11) unsigned NOT NULL COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `token_msg_id` (`token`,`msg_id`),
  KEY `member_id` (`member_id`),
  KEY `game_type` (`game_type`)
) ENGINE=InnoDB AUTO_INCREMENT=263 DEFAULT CHARSET=utf8 COMMENT='游戏结果表';

-- ----------------------------
-- Table structure for gw_game_reward
-- ----------------------------
DROP TABLE IF EXISTS `gw_game_reward`;
CREATE TABLE `gw_game_reward` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(11) unsigned NOT NULL COMMENT '会员id',
  `game_type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '游戏类型',
  `gold_num` int(11) unsigned NOT NULL COMMENT '奖励金币数量',
  `reward_time` int(11) unsigned NOT NULL COMMENT '奖励时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='游戏新手奖励表';

-- ----------------------------
-- Table structure for gw_game_skill
-- ----------------------------
DROP TABLE IF EXISTS `gw_game_skill`;
CREATE TABLE `gw_game_skill` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `skill_id` int(11) unsigned NOT NULL COMMENT '技能id',
  `type` tinyint(1) unsigned NOT NULL COMMENT '技能类型1、技能，2、礼包',
  `value_type` int(11) unsigned NOT NULL,
  `value` int(11) unsigned NOT NULL COMMENT '花费金币',
  `content` text,
  `game_type` tinyint(1) NOT NULL COMMENT '游戏类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COMMENT='技能表';

-- ----------------------------
-- Table structure for gw_game_user_skill
-- ----------------------------
DROP TABLE IF EXISTS `gw_game_user_skill`;
CREATE TABLE `gw_game_user_skill` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(11) unsigned NOT NULL COMMENT '会员id',
  `game_type` tinyint(1) unsigned NOT NULL COMMENT '游戏类型',
  `skill_id` int(11) unsigned NOT NULL COMMENT '技能id',
  `skill_num` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '技能数量',
  `skill_level` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '技能等级',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT=' 用户技能表';
