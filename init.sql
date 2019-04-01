/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50725
Source Host           : localhost:3306
Source Database       : bookstore

Target Server Type    : MYSQL
Target Server Version : 50725
File Encoding         : 65001

Date: 2019-04-01 22:47:37
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for books
-- ----------------------------
DROP TABLE IF EXISTS `books`;
CREATE TABLE `books` (
  `bid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(20) NOT NULL COMMENT '书名',
  `price` double DEFAULT NULL COMMENT '价格',
  `category` varchar(20) DEFAULT NULL COMMENT '类别',
  `count` int(11) DEFAULT NULL COMMENT '数量',
  `imgurl` varchar(100) DEFAULT NULL COMMENT '图片链接',
  `info` varchar(500) DEFAULT NULL COMMENT '简介',
  PRIMARY KEY (`bid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of books
-- ----------------------------
INSERT INTO `books` VALUES ('1', '计算机基础', '11.11', '计算机', '100', 'www.baidu.com', '这是一本书');

-- ----------------------------
-- Table structure for orderitem
-- ----------------------------
DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE `orderitem` (
  `order_id` int(11) NOT NULL COMMENT '订单ID',
  `book_id` int(11) NOT NULL COMMENT '书籍ID',
  `buynum` int(11) DEFAULT NULL COMMENT '购买数量',
  PRIMARY KEY (`order_id`,`book_id`),
  KEY `book_id` (`book_id`),
  CONSTRAINT `orderitem_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`oid`),
  CONSTRAINT `orderitem_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `books` (`bid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderitem
-- ----------------------------

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `oid` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单ID',
  `money` double DEFAULT NULL COMMENT '金额',
  `name` varchar(20) DEFAULT NULL COMMENT '姓名',
  `address` varchar(50) DEFAULT NULL COMMENT '地址',
  `phonen` varchar(50) DEFAULT NULL COMMENT '手机',
  `paystate` int(2) DEFAULT NULL COMMENT '支付状态',
  `create_time` mediumtext COMMENT '订单创建时间',
  `user_id` int(11) DEFAULT NULL COMMENT '关联用户ID',
  PRIMARY KEY (`oid`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`oid`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(20) NOT NULL COMMENT '用户名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `sex` varchar(2) NOT NULL COMMENT '性别',
  `email` varchar(20) NOT NULL COMMENT '邮箱',
  `state` int(2) NOT NULL COMMENT '0-未激活 1-激活',
  `role` int(2) NOT NULL DEFAULT '0' COMMENT '0-普通用户 1-管理员',
  `regTime` mediumtext COMMENT '创建时间',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'xiong', 'e10adc3949ba59abbe56e057f20f883e', '男', '123@qq.com', '1', '1', '2019-04-01 22:41:01');
