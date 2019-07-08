/*
Navicat MySQL Data Transfer

Source Server         : FT
Source Server Version : 50018
Source Host           : localhost:3306
Source Database       : travel

Target Server Type    : MYSQL
Target Server Version : 50018
File Encoding         : 65001

Date: 2019-07-08 15:11:40
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `car`
-- ----------------------------
DROP TABLE IF EXISTS `car`;
CREATE TABLE `car` (
  `carId` int(11) NOT NULL auto_increment,
  `customerId` int(11) NOT NULL,
  `lineId` int(36) NOT NULL,
  `carTime` datetime NOT NULL,
  PRIMARY KEY  (`carId`),
  KEY `fk_c_l` (`lineId`),
  KEY `fk_c_cu` (`customerId`),
  CONSTRAINT `fk_c_cu` FOREIGN KEY (`customerId`) REFERENCES `customer` (`customerId`),
  CONSTRAINT `ft_c_l` FOREIGN KEY (`lineId`) REFERENCES `line` (`lineId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of car
-- ----------------------------
INSERT INTO `car` VALUES ('10', '5', '11', '2019-07-05 10:14:45');
INSERT INTO `car` VALUES ('12', '7', '22', '2019-07-05 10:17:24');
INSERT INTO `car` VALUES ('13', '7', '17', '2019-07-05 10:17:33');
INSERT INTO `car` VALUES ('14', '5', '21', '2019-07-05 10:26:51');
INSERT INTO `car` VALUES ('15', '5', '22', '2019-07-05 10:27:04');
INSERT INTO `car` VALUES ('16', '5', '20', '2019-07-05 10:27:11');
INSERT INTO `car` VALUES ('17', '5', '19', '2019-07-05 10:27:17');
INSERT INTO `car` VALUES ('19', '7', '19', '2019-07-05 11:01:34');
INSERT INTO `car` VALUES ('20', '7', '18', '2019-07-05 11:21:36');

-- ----------------------------
-- Table structure for `comment`
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `commentId` int(11) NOT NULL auto_increment,
  `commContext` varchar(36) NOT NULL,
  `commTime` datetime NOT NULL,
  `customerId` int(11) NOT NULL,
  `lineId` int(36) NOT NULL,
  PRIMARY KEY  (`commentId`),
  KEY `fk_co_cu` (`customerId`),
  KEY `fk_co_l` (`lineId`),
  CONSTRAINT `fk_co_cu` FOREIGN KEY (`customerId`) REFERENCES `customer` (`customerId`),
  CONSTRAINT `fk_co_l` FOREIGN KEY (`lineId`) REFERENCES `line` (`lineId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------

-- ----------------------------
-- Table structure for `customer`
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `customerId` int(11) NOT NULL auto_increment,
  `custAccount` varchar(12) NOT NULL,
  `custName` varchar(6) NOT NULL,
  `custPassWord` varchar(12) NOT NULL,
  `custSex` varchar(4) NOT NULL,
  `custIdentityId` varchar(18) NOT NULL,
  `custTel` varchar(11) NOT NULL,
  `custType` int(11) NOT NULL default '0',
  PRIMARY KEY  (`customerId`),
  UNIQUE KEY `custAccount` (`custAccount`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES ('1', 'admin', 'admin', 'admin', '男', '123456789', '11111111111', '1');
INSERT INTO `customer` VALUES ('2', 'ht', 'ht', 'ht', '男', '987654321', '22222222222', '2');
INSERT INTO `customer` VALUES ('4', 'rose', 'rose', '123', 'gril', '360218200010262222', '55567890', '0');
INSERT INTO `customer` VALUES ('5', 'caifeng', 'feng', 'caifeng', '女', '111111111111111111', '13978948564', '0');
INSERT INTO `customer` VALUES ('7', 'fengtao', 'tao', 'caifeng', '男', '123456789123456', '13467918946', '0');

-- ----------------------------
-- Table structure for `line`
-- ----------------------------
DROP TABLE IF EXISTS `line`;
CREATE TABLE `line` (
  `lineId` int(36) NOT NULL auto_increment,
  `lineTypeId` int(36) NOT NULL,
  `lineName` varchar(15) NOT NULL,
  `lineDays` varchar(12) NOT NULL,
  `lineVehicle` char(5) NOT NULL,
  `lineIntroduction` varchar(400) default NULL,
  `lineReason` varchar(100) default NULL,
  `lineArrange` varchar(100) default NULL,
  `linePrice` decimal(10,2) NOT NULL,
  `lineTeamBuy` int(11) default NULL,
  `lineTeamBuyPrice` decimal(10,2) default NULL,
  `lineBeginTime` datetime default NULL,
  `lineEndTime` datetime default NULL,
  `lineOnTime` datetime NOT NULL,
  PRIMARY KEY  (`lineId`),
  KEY `fk_l_t` (`lineTypeId`),
  CONSTRAINT `Ln_Lt` FOREIGN KEY (`lineTypeId`) REFERENCES `linetype` (`lineTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of line
-- ----------------------------
INSERT INTO `line` VALUES ('11', '1', '云南大理', '5', '飞机', 'aaa', 'aaa', 'aaa', '1888.00', null, null, null, null, '2019-07-03 10:30:22');
INSERT INTO `line` VALUES ('16', '5', '武汉欢乐谷', '1', '高铁', '欢乐多多', '欢乐多多', '欢乐多多', '399.00', null, null, null, null, '2019-07-03 10:35:29');
INSERT INTO `line` VALUES ('17', '11', '澳门', '2', '飞机', 'e', 'e', 'e', '3888.00', null, null, null, null, '2019-07-03 10:36:14');
INSERT INTO `line` VALUES ('18', '12', '北京', '7', '飞机', '6', '6', '6', '10999.00', null, null, null, null, '2019-07-03 10:37:39');
INSERT INTO `line` VALUES ('19', '1', '凤凰古城', '3', '动车', '凤凰古城', '凤凰古城', '凤凰古城', '1888.00', '1', '1688.00', '2019-07-06 00:00:00', '2019-07-09 00:00:00', '2019-07-05 10:57:07');
INSERT INTO `line` VALUES ('20', '2', '南昌万达', '2', '汽车', '南昌万达', '南昌万达', '南昌万达', '899.00', null, null, null, null, '2019-07-05 10:09:57');
INSERT INTO `line` VALUES ('21', '4', '杭州西湖', '7', '汽车', '杭州西湖', '杭州西湖', '杭州西湖', '899.00', null, null, null, null, '2019-07-05 10:10:42');
INSERT INTO `line` VALUES ('22', '3', '北海道', '5', '飞机', '北海道', '北海道', '北海道', '388.00', null, null, null, null, '2019-07-05 10:11:33');

-- ----------------------------
-- Table structure for `linetype`
-- ----------------------------
DROP TABLE IF EXISTS `linetype`;
CREATE TABLE `linetype` (
  `lineTypeId` int(36) NOT NULL auto_increment,
  `lineTypeName` varchar(10) NOT NULL,
  `lineTypeTime` datetime NOT NULL,
  `lineTypeIcon` varchar(50) NOT NULL,
  PRIMARY KEY  (`lineTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of linetype
-- ----------------------------
INSERT INTO `linetype` VALUES ('1', '境内游', '2019-06-27 11:26:28', 'ht/images/banner2.jpg');
INSERT INTO `linetype` VALUES ('2', '境外游', '2019-06-27 11:27:35', 'ht/images/but2.jpg');
INSERT INTO `linetype` VALUES ('3', '海岛游', '2019-06-27 11:29:46', 'ht/images/dl.jpg');
INSERT INTO `linetype` VALUES ('4', '自驾游', '2019-06-25 00:00:00', '4');
INSERT INTO `linetype` VALUES ('5', '一日游', '2019-06-25 00:00:00', '5');
INSERT INTO `linetype` VALUES ('8', '七天乐', '2019-06-27 10:33:47', 'alter.jpg');
INSERT INTO `linetype` VALUES ('10', '七天乐', '2019-06-27 11:00:01', 'ht/images/jrtg.jpg');
INSERT INTO `linetype` VALUES ('11', '两日游', '2019-07-03 10:34:04', 'ht/images/hdd.jpg');
INSERT INTO `linetype` VALUES ('12', '多日游', '2019-07-03 10:34:21', 'ht/images/banner2.jpg');

-- ----------------------------
-- Table structure for `orderdetail`
-- ----------------------------
DROP TABLE IF EXISTS `orderdetail`;
CREATE TABLE `orderdetail` (
  `orderId` int(36) NOT NULL auto_increment,
  `customerId` int(11) NOT NULL,
  `lineName` varchar(15) NOT NULL,
  `linePrice` decimal(10,2) NOT NULL,
  `orderDate` datetime NOT NULL,
  `travelDate` datetime NOT NULL,
  `orderTotal` decimal(10,2) NOT NULL,
  `lineId` int(36) NOT NULL,
  `orderState` int(11) NOT NULL,
  PRIMARY KEY  (`orderId`),
  KEY `fk_o_c` (`customerId`),
  KEY `fk_o_l` (`lineId`),
  KEY `orderId` (`orderId`),
  CONSTRAINT `fk_or_l` FOREIGN KEY (`lineId`) REFERENCES `line` (`lineId`),
  CONSTRAINT `fk_o_c` FOREIGN KEY (`customerId`) REFERENCES `customer` (`customerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderdetail
-- ----------------------------

-- ----------------------------
-- Table structure for `ot_detail`
-- ----------------------------
DROP TABLE IF EXISTS `ot_detail`;
CREATE TABLE `ot_detail` (
  `orderTourId` int(11) NOT NULL auto_increment,
  `orderId` int(36) NOT NULL,
  `touristId` int(36) NOT NULL,
  PRIMARY KEY  (`orderTourId`),
  KEY `fk_ot_o` (`orderId`),
  KEY `fk_ot_t` (`touristId`),
  CONSTRAINT `ft_ot_or` FOREIGN KEY (`orderId`) REFERENCES `orderdetail` (`orderId`),
  CONSTRAINT `ft_ot_t` FOREIGN KEY (`touristId`) REFERENCES `tourist` (`touristId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ot_detail
-- ----------------------------

-- ----------------------------
-- Table structure for `picture`
-- ----------------------------
DROP TABLE IF EXISTS `picture`;
CREATE TABLE `picture` (
  `pictureId` int(11) NOT NULL auto_increment,
  `pictIntroduction` varchar(20) NOT NULL,
  `pictName` varchar(20) NOT NULL,
  `lineId` int(36) NOT NULL,
  PRIMARY KEY  (`pictureId`),
  KEY `fk_p_l` (`lineId`),
  CONSTRAINT `fk_p_l` FOREIGN KEY (`lineId`) REFERENCES `line` (`lineId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of picture
-- ----------------------------
INSERT INTO `picture` VALUES ('26', 'aaa', 'ht/images/bb1.jpg', '11');
INSERT INTO `picture` VALUES ('27', 'aaa', 'ht/images/bb3.jpg', '11');
INSERT INTO `picture` VALUES ('28', 'aaa', 'ht/images/bb2.jpg', '11');
INSERT INTO `picture` VALUES ('29', 'aaa', 'ht/images/but2.jpg', '11');
INSERT INTO `picture` VALUES ('46', '欢乐多多', 'ht/images/bb1.jpg', '16');
INSERT INTO `picture` VALUES ('47', '欢乐多多', 'ht/images/bb2.jpg', '16');
INSERT INTO `picture` VALUES ('48', '欢乐多多', 'ht/images/but2.jpg', '16');
INSERT INTO `picture` VALUES ('49', '欢乐多多', 'ht/images/bb3.jpg', '16');
INSERT INTO `picture` VALUES ('50', 'e', 'ht/images/bb3.jpg', '17');
INSERT INTO `picture` VALUES ('51', 'e', 'ht/images/bb1.jpg', '17');
INSERT INTO `picture` VALUES ('52', 'e', 'ht/images/bb2.jpg', '17');
INSERT INTO `picture` VALUES ('53', 'e', 'ht/images/but2.jpg', '17');
INSERT INTO `picture` VALUES ('54', '6', 'ht/images/bb2.jpg', '18');
INSERT INTO `picture` VALUES ('55', '6', 'ht/images/bb3.jpg', '18');
INSERT INTO `picture` VALUES ('56', '6', 'ht/images/bb1.jpg', '18');
INSERT INTO `picture` VALUES ('61', '凤凰古城', 'ht/images/but2.jpg', '19');
INSERT INTO `picture` VALUES ('62', '凤凰古城', 'ht/images/bb1.jpg', '19');
INSERT INTO `picture` VALUES ('63', '凤凰古城', 'ht/images/bb2.jpg', '19');
INSERT INTO `picture` VALUES ('64', '凤凰古城', 'ht/images/bb3.jpg', '19');
INSERT INTO `picture` VALUES ('65', '南昌万达', 'ht/images/bb1.jpg', '20');
INSERT INTO `picture` VALUES ('66', '南昌万达', 'ht/images/bb3.jpg', '20');
INSERT INTO `picture` VALUES ('67', '南昌万达', 'ht/images/bb2.jpg', '20');
INSERT INTO `picture` VALUES ('68', '南昌万达', 'ht/images/but2.jpg', '20');
INSERT INTO `picture` VALUES ('69', '杭州西湖', 'ht/images/but2.jpg', '21');
INSERT INTO `picture` VALUES ('70', '杭州西湖', 'ht/images/bb3.jpg', '21');
INSERT INTO `picture` VALUES ('71', '杭州西湖', 'ht/images/bb2.jpg', '21');
INSERT INTO `picture` VALUES ('72', '杭州西湖', 'ht/images/bb1.jpg', '21');
INSERT INTO `picture` VALUES ('73', '北海道', 'ht/images/bb1.jpg', '22');
INSERT INTO `picture` VALUES ('74', '北海道', 'ht/images/bb2.jpg', '22');
INSERT INTO `picture` VALUES ('75', '北海道', 'ht/images/bb3.jpg', '22');
INSERT INTO `picture` VALUES ('76', '北海道', 'ht/images/but2.jpg', '22');

-- ----------------------------
-- Table structure for `tourist`
-- ----------------------------
DROP TABLE IF EXISTS `tourist`;
CREATE TABLE `tourist` (
  `touristId` int(36) NOT NULL auto_increment,
  `tourIDCard` varchar(36) NOT NULL,
  `tourTel` varchar(15) NOT NULL,
  `tourRealName` varchar(10) NOT NULL,
  PRIMARY KEY  (`touristId`),
  KEY `touristId` (`touristId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tourist
-- ----------------------------
