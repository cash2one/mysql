/*
Navicat MySQL Data Transfer

Source Server         : 206
Source Server Version : 50524
Source Host           : 172.18.7.206:3306
Source Database       : gaiwang_history

Target Server Type    : MYSQL
Target Server Version : 50524
File Encoding         : 65001

Date: 2016-10-31 10:53:19
*/

SET FOREIGN_KEY_CHECKS=0;

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
  `send_time` int(11) unsigned NOT NULL COMMENT '发送时间',
  `interface` tinyint(3) unsigned NOT NULL COMMENT '短信接口（1短信通、2易信、3香港易通讯）',
  `is_read` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for gw_sms_log_2015_1
-- ----------------------------
DROP TABLE IF EXISTS `gw_sms_log_2015_1`;
CREATE TABLE `gw_sms_log_2015_1` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `mobile` varchar(64) NOT NULL COMMENT '手机号码',
  `content` text NOT NULL COMMENT '内容',
  `create_time` int(11) unsigned NOT NULL COMMENT '创建时间',
  `status` tinyint(1) NOT NULL COMMENT '状态（1发送成功、2发送不成功）',
  `count` tinyint(3) unsigned NOT NULL COMMENT '发送次数',
  `target_id` int(11) unsigned NOT NULL COMMENT '对象',
  `type` tinyint(3) unsigned NOT NULL COMMENT '类型（1线上订单、2线下订单、3卡充值、4酒店订单、5验证码）',
  `send_time` int(11) unsigned NOT NULL COMMENT '发送时间',
  `interface` tinyint(3) unsigned NOT NULL COMMENT '短信接口（1短信通、2易信、3香港易通讯）',
  `is_read` tinyint(2) NOT NULL COMMENT '是否已读，0没读，1已读',
  PRIMARY KEY (`id`),
  KEY `mobile` (`mobile`)
) ENGINE=InnoDB AUTO_INCREMENT=579475 DEFAULT CHARSET=utf8 COMMENT='短信日志';

-- ----------------------------
-- Table structure for gw_sms_log_back
-- ----------------------------
DROP TABLE IF EXISTS `gw_sms_log_back`;
CREATE TABLE `gw_sms_log_back` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `mobile` varchar(64) NOT NULL COMMENT '手机号码',
  `content` text NOT NULL COMMENT '内容',
  `create_time` int(11) unsigned NOT NULL COMMENT '创建时间',
  `status` tinyint(1) NOT NULL COMMENT '状态（1发送成功、2发送不成功）',
  `count` tinyint(3) unsigned NOT NULL COMMENT '发送次数',
  `target_id` int(11) unsigned NOT NULL COMMENT '对象',
  `type` tinyint(3) unsigned NOT NULL COMMENT '类型（1线上订单、2线下订单、3卡充值、4酒店订单、5验证码）',
  `send_time` int(11) unsigned NOT NULL COMMENT '发送时间',
  `interface` tinyint(3) unsigned NOT NULL COMMENT '短信接口（1短信通、2易信、3香港易通讯）',
  `is_read` tinyint(2) NOT NULL COMMENT '是否已读，0没读，1已读',
  PRIMARY KEY (`id`),
  KEY `mobile` (`mobile`)
) ENGINE=InnoDB AUTO_INCREMENT=1751091 DEFAULT CHARSET=utf8 COMMENT='短信日志';

-- ----------------------------
-- Table structure for gw_sms_log_old
-- ----------------------------
DROP TABLE IF EXISTS `gw_sms_log_old`;
CREATE TABLE `gw_sms_log_old` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `mobile` varchar(64) NOT NULL COMMENT '手机号码',
  `content` text NOT NULL COMMENT '内容',
  `create_time` int(11) unsigned NOT NULL COMMENT '创建时间',
  `status` tinyint(1) NOT NULL COMMENT '状态（1发送成功、2发送不成功）',
  `count` tinyint(3) unsigned NOT NULL COMMENT '发送次数',
  `target_id` int(11) unsigned NOT NULL COMMENT '对象',
  `type` tinyint(3) unsigned NOT NULL COMMENT '类型（1线上订单、2线下订单、3卡充值、4酒店订单、5验证码）',
  `send_time` int(11) unsigned NOT NULL COMMENT '发送时间',
  `interface` tinyint(3) unsigned NOT NULL COMMENT '短信接口（1短信通、2易信、3香港易通讯）',
  `is_read` tinyint(2) NOT NULL COMMENT '是否已读，0没读，1已读',
  PRIMARY KEY (`id`),
  KEY `mobile` (`mobile`)
) ENGINE=InnoDB AUTO_INCREMENT=7653 DEFAULT CHARSET=utf8 COMMENT='短信日志';
