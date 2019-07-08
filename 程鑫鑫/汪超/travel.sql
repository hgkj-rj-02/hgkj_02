/*
Navicat MySQL Data Transfer

Source Server         : MW
Source Server Version : 50018
Source Host           : localhost:3306
Source Database       : travel

Target Server Type    : MYSQL
Target Server Version : 50018
File Encoding         : 65001

Date: 2019-07-08 14:26:50
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `car`
-- ----------------------------
DROP TABLE IF EXISTS `car`;
CREATE TABLE `car` (
  `carId` int(11) NOT NULL,
  `customerId` int(11) NOT NULL,
  `lineId` varchar(36) NOT NULL,
  `carTime` datetime NOT NULL,
  PRIMARY KEY  (`carId`),
  KEY `customerId` (`customerId`),
  KEY `lineId` (`lineId`),
  CONSTRAINT `car_ibfk_1` FOREIGN KEY (`customerId`) REFERENCES `customer` (`custId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `car_ibfk_2` FOREIGN KEY (`lineId`) REFERENCES `line` (`lineId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of car
-- ----------------------------

-- ----------------------------
-- Table structure for `comment`
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `commentId` varchar(36) NOT NULL,
  `commContext` varchar(36) NOT NULL,
  `commTime` datetime NOT NULL,
  `custId` int(11) NOT NULL,
  `lineId` varchar(12) NOT NULL,
  PRIMARY KEY  (`commentId`),
  KEY `custID` (`custId`),
  KEY `lineID` (`lineId`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`custID`) REFERENCES `customer` (`custID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`lineID`) REFERENCES `line` (`lineID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------

-- ----------------------------
-- Table structure for `customer`
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `custId` int(11) NOT NULL auto_increment,
  `custAccount` varchar(12) NOT NULL,
  `custName` varchar(12) NOT NULL,
  `custPassWord` varchar(12) NOT NULL,
  `custSex` varchar(2) NOT NULL,
  `custIdentityId` varchar(18) NOT NULL,
  `custTel` varchar(11) NOT NULL,
  `custType` int(1) default NULL,
  PRIMARY KEY  (`custId`),
  UNIQUE KEY `account` (`custAccount`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES ('1', 'maxAdmin', '高级管理员', 'maxadmin', '男', '42011319990909411X', '13071211749', '0');
INSERT INTO `customer` VALUES ('2', 'admin1', '管理员1号', 'admin1', '女', '420113199909094221', '12071211749', '1');
INSERT INTO `customer` VALUES ('3', 'admin2', '管理员2号', 'admin2', '男', '420112199909094000', '11071211749', '1');
INSERT INTO `customer` VALUES ('4', 'zhangsan', '张三', 'zhangsan', '男', '410113199909094111', '10071211749', '2');
INSERT INTO `customer` VALUES ('5', 'lisi', '李四', 'lisi', '女', '410113199909094000', '14071211749', '2');
INSERT INTO `customer` VALUES ('6', 'wangwu', 'wangwu', 'wangwu', '男', '420113199909094229', '13071211740', '2');
INSERT INTO `customer` VALUES ('7', 'zhaoliu', 'zhaoliu', 'zhaoliu', '男', '420113199909054229', '13071231748', '2');

-- ----------------------------
-- Table structure for `line`
-- ----------------------------
DROP TABLE IF EXISTS `line`;
CREATE TABLE `line` (
  `lineId` varchar(12) NOT NULL,
  `lineTypeId` varchar(12) NOT NULL,
  `lineName` varchar(12) NOT NULL,
  `lineDays` varchar(12) NOT NULL,
  `lineVehicle` varchar(12) NOT NULL COMMENT '出游工具',
  `lineIntroduction` varchar(400) default NULL COMMENT '路线简介',
  `lineReason` varchar(100) default NULL COMMENT '路线安排理由',
  `lineArrange` varchar(100) default NULL COMMENT '线路行程安排',
  `linePrice` varchar(10) NOT NULL,
  `lineTeamBuy` int(1) default NULL COMMENT '是否为团购',
  `lineTeamBuyPrice` decimal(10,2) default NULL,
  `lineBeginTime` datetime default NULL,
  `lineEndTime` datetime default NULL,
  `lineOnTime` datetime NOT NULL COMMENT '路线添加时间',
  PRIMARY KEY  (`lineId`),
  KEY `FKd7h38nar3c77x5uw44ddn6nyf` (`lineTypeId`),
  CONSTRAINT `FKd7h38nar3c77x5uw44ddn6nyf` FOREIGN KEY (`lineTypeId`) REFERENCES `linetype` (`lineTypeId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of line
-- ----------------------------
INSERT INTO `line` VALUES ('110', 'F1', '沈阳', '4', '飞机', '1tian', '1tian', '1tian', '1100.00', null, null, null, null, '2019-06-28 16:43:30');
INSERT INTO `line` VALUES ('112', 'H2', '美国', '3', '飞机', 'aa', 'aaa', 'aaa', '14444.00', null, null, null, null, '2019-07-03 11:20:27');
INSERT INTO `line` VALUES ('G202', 'H2', '仰光', '3', '飞机', '111', '111', '111', '11111.00', '0', '11.00', '2019-06-27 09:50:03', '2019-06-27 09:50:07', '2019-06-27 09:50:10');
INSERT INTO `line` VALUES ('G203', 'H2', '约旦', '5', '飞机', '222', '222', '22', '22222.00', '0', '0.00', '2019-06-27 09:50:40', '2019-06-27 09:50:44', '2019-06-27 09:50:47');
INSERT INTO `line` VALUES ('G204', 'H2', '伊朗', '3', '飞机', '3', '3', '3', '8888.00', '1', '3.00', '2019-06-27 09:51:07', '2019-06-27 09:51:09', '2019-06-27 09:51:12');
INSERT INTO `line` VALUES ('G205', 'F1', '三亚', '4', '飞机', '4', '4', '4', '4444.00', '0', '44.00', '2019-06-27 09:51:33', '2019-06-27 09:51:36', '2019-06-27 09:51:39');
INSERT INTO `line` VALUES ('G206', 'H2', '英国', '5', '飞机', '5', '5', '5', '5555.00', '1', '5.00', '2019-06-27 09:51:57', '2019-06-27 09:52:00', '2019-06-27 09:52:03');
INSERT INTO `line` VALUES ('G207', 'H2', '蒙古', '3', '飞机', '6', '6', '6', '6666.00', '1', '6.00', '2019-06-27 09:52:22', '2019-06-27 09:52:26', '2019-06-27 09:52:30');
INSERT INTO `line` VALUES ('G209', 'F1', '大连', '7', '火车', '8', '8', '8', '1888.00', '1', '8.00', '2019-06-27 09:53:08', '2019-06-27 09:53:11', '2019-06-27 09:53:14');
INSERT INTO `line` VALUES ('G210', 'F1', '澳门', '2', '飞机', '9', '9', '9', '3999.00', '1', '9.00', '2019-06-27 09:53:29', '2019-06-27 09:53:33', '2019-06-27 09:53:35');
INSERT INTO `line` VALUES ('G212', 'F1', '香港', '3', '飞机', '', '', '', '1299.00', null, null, null, null, '2019-06-29 19:40:53');
INSERT INTO `line` VALUES ('gg', 'F1', 'gg', '3', '飞机', '', '', '', '5555.99', null, null, null, null, '2019-07-08 08:32:19');
INSERT INTO `line` VALUES ('ggsdf', 'F1', '海口', '7', '客车', 'f', 'sfg', 'rr', '8888.99', null, null, null, null, '2019-06-30 16:07:28');
INSERT INTO `line` VALUES ('S101', 'S5', '烟台', '2', '客车', null, null, null, '1222.00', null, null, null, null, '2019-07-04 13:39:15');
INSERT INTO `line` VALUES ('S102', 'S5', '天津', '5', '火车', null, null, null, '4444.00', null, null, null, null, '2019-07-04 13:40:03');
INSERT INTO `line` VALUES ('S103', 'S5', '大阪', '3', '飞机', null, null, null, '5555.00', null, null, null, null, '2019-07-04 13:40:48');
INSERT INTO `line` VALUES ('S104', 'S5', '北海', '3', '飞机', null, null, null, '7777.00', null, null, null, null, '2019-07-04 13:41:30');
INSERT INTO `line` VALUES ('S105', 'S5', '日本', '3', '飞机', null, null, null, '6666.66', null, null, null, null, '2019-07-04 13:42:03');
INSERT INTO `line` VALUES ('S106', 'S5', '韩国', '3', '飞机', null, null, null, '3333.00', null, null, null, null, '2019-07-04 13:42:45');
INSERT INTO `line` VALUES ('Z101', 'Z4', '巴西', '3', '客车', null, null, null, '1666.66', null, null, null, null, '2019-07-04 13:43:44');
INSERT INTO `line` VALUES ('Z102', 'Z4', '法国', '3', '客车', null, null, null, '6666.00', null, null, null, null, '2019-07-04 13:44:25');
INSERT INTO `line` VALUES ('Z103', 'Z4', '襄阳', '1', '客车', null, null, null, '1111.00', null, null, null, null, '2019-07-04 13:44:59');
INSERT INTO `line` VALUES ('Z104', 'Z4', '仙桃', '1', '客车', null, null, null, '1099.00', null, null, null, null, '2019-07-04 13:45:30');
INSERT INTO `line` VALUES ('Z105', 'Z4', '孝感', '1', '客车', null, null, null, '888.88', null, null, null, null, '2019-07-04 13:46:01');
INSERT INTO `line` VALUES ('Z106', 'Z4', '十堰', '1', '客车', null, null, null, '999.99', null, null, null, null, '2019-07-04 13:46:52');

-- ----------------------------
-- Table structure for `linetype`
-- ----------------------------
DROP TABLE IF EXISTS `linetype`;
CREATE TABLE `linetype` (
  `lineTypeId` varchar(36) NOT NULL,
  `lineTypeName` varchar(10) NOT NULL,
  `lineTypeTime` datetime NOT NULL,
  `lineTypeIcon` varchar(300) NOT NULL COMMENT '路线类型图标名',
  PRIMARY KEY  (`lineTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of linetype
-- ----------------------------
INSERT INTO `linetype` VALUES ('F1', '境内游', '2019-06-24 10:46:09', 'images/images/zx.jpg');
INSERT INTO `linetype` VALUES ('H2', '境外游', '2019-06-24 10:48:11', 'images/images/tjjd.jpg');
INSERT INTO `linetype` VALUES ('L3', '热门游', '2019-06-24 10:48:42', 'images/images/sdf.jpg');
INSERT INTO `linetype` VALUES ('S5', '海岛游', '2019-06-28 04:28:25', '/images/b.jpg');
INSERT INTO `linetype` VALUES ('Z4', '自驾游', '2019-07-04 11:26:55', 'images/images/zx.jsp');

-- ----------------------------
-- Table structure for `orderdetail`
-- ----------------------------
DROP TABLE IF EXISTS `orderdetail`;
CREATE TABLE `orderdetail` (
  `orderId` varchar(36) NOT NULL,
  `customerId` int(11) NOT NULL,
  `lineName` varchar(15) NOT NULL,
  `linePrice` decimal(10,2) NOT NULL,
  `orderDate` datetime NOT NULL,
  `travelDate` datetime NOT NULL,
  `orderTotal` decimal(10,2) NOT NULL,
  `lineId` varchar(36) NOT NULL,
  `orderState` int(11) NOT NULL,
  PRIMARY KEY  (`orderId`),
  KEY `customerId` (`customerId`),
  KEY `lineId` (`lineId`),
  CONSTRAINT `orderdetail_ibfk_1` FOREIGN KEY (`customerId`) REFERENCES `customer` (`custId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `orderdetail_ibfk_2` FOREIGN KEY (`lineId`) REFERENCES `line` (`lineId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderdetail
-- ----------------------------

-- ----------------------------
-- Table structure for `ot_detai`
-- ----------------------------
DROP TABLE IF EXISTS `ot_detai`;
CREATE TABLE `ot_detai` (
  `otId` int(11) NOT NULL auto_increment,
  `odId` varchar(36) NOT NULL,
  `touristId` varchar(36) NOT NULL,
  PRIMARY KEY  (`otId`),
  KEY `odId` (`odId`),
  KEY `touristId` (`touristId`),
  CONSTRAINT `ot_detai_ibfk_1` FOREIGN KEY (`odId`) REFERENCES `orderdetail` (`orderId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ot_detai_ibfk_2` FOREIGN KEY (`touristId`) REFERENCES `tourist` (`touristId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ot_detai
-- ----------------------------

-- ----------------------------
-- Table structure for `picture`
-- ----------------------------
DROP TABLE IF EXISTS `picture`;
CREATE TABLE `picture` (
  `pictureId` int(11) NOT NULL auto_increment,
  `pictIntroduction` varchar(20) NOT NULL COMMENT '图片介绍',
  `pictName` varchar(20) NOT NULL,
  `lineId` varchar(36) NOT NULL,
  PRIMARY KEY  (`pictureId`),
  KEY `FKfawrfkab2v4n4xum1frvd5w3p` USING BTREE (`lineId`),
  CONSTRAINT `picture_ibfk_1` FOREIGN KEY (`lineId`) REFERENCES `line` (`lineId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of picture
-- ----------------------------
INSERT INTO `picture` VALUES ('1', '/images/c.jpg', 'aa ', '112');
INSERT INTO `picture` VALUES ('2', '/images/a.jpg', 'cc', '112');
INSERT INTO `picture` VALUES ('3', '/images/a.jpg', 'dd', '112');
INSERT INTO `picture` VALUES ('4', '/images/a.jpg', 'bb', '112');
INSERT INTO `picture` VALUES ('5', '/images/banner.jpg', 'aa ', 'gg');
INSERT INTO `picture` VALUES ('6', '/images/as.jpg', 'dd', 'gg');
INSERT INTO `picture` VALUES ('7', '/images/banner2.jpg', 'aa', 'gg');
INSERT INTO `picture` VALUES ('8', '/images/1_t0.jpg', 'bb', 'gg');

-- ----------------------------
-- Table structure for `tourist`
-- ----------------------------
DROP TABLE IF EXISTS `tourist`;
CREATE TABLE `tourist` (
  `touristId` varchar(36) NOT NULL,
  `tourIdCard` varchar(18) NOT NULL,
  `tourTel` varchar(11) NOT NULL,
  `tourRealName` decimal(10,0) NOT NULL,
  PRIMARY KEY  (`touristId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tourist
-- ----------------------------
