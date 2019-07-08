/*
Navicat MySQL Data Transfer

Source Server         : hk
Source Server Version : 50018
Source Host           : localhost:3306
Source Database       : tourism

Target Server Type    : MYSQL
Target Server Version : 50018
File Encoding         : 65001

Date: 2019-07-08 14:34:35
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `car`
-- ----------------------------
DROP TABLE IF EXISTS `car`;
CREATE TABLE `car` (
  `carId` int(11) NOT NULL auto_increment,
  `customerId` int(11) NOT NULL,
  `lineId` varchar(36) NOT NULL,
  `carTime` datetime NOT NULL,
  PRIMARY KEY  (`carId`),
  KEY `fk_c_l` (`lineId`),
  KEY `fk_c_cu` (`customerId`),
  CONSTRAINT `fk_c_cu` FOREIGN KEY (`customerId`) REFERENCES `customer` (`customerId`),
  CONSTRAINT `fk_c_l` FOREIGN KEY (`lineId`) REFERENCES `line` (`lineId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of car
-- ----------------------------

-- ----------------------------
-- Table structure for `comment`
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `commentId` int(11) NOT NULL auto_increment,
  `commContext` varchar(36) NOT NULL,
  `commTime` datetime NOT NULL,
  `customerId` int(11) NOT NULL,
  `lineId` varchar(36) NOT NULL,
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
  `custSex` char(4) NOT NULL,
  `custIdentityId` varchar(18) NOT NULL,
  `custTel` varchar(11) NOT NULL,
  `custType` int(11) default NULL,
  PRIMARY KEY  (`customerId`),
  UNIQUE KEY `custAccount` (`custAccount`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES ('1', '100100', 'admin', 'admin', '男', '123456789', '11111111111', '1');
INSERT INTO `customer` VALUES ('2', '100110', 'hlp', 'hlp', '女', '987654321', '22222222222', '2');
INSERT INTO `customer` VALUES ('3', '100001', 'jack', '123', '男', '123455432a', '33333333333', '2');
INSERT INTO `customer` VALUES ('4', '100103', 'rose', '123', 'gril', '360218200010262222', '55567890', '2');
INSERT INTO `customer` VALUES ('5', '123456', '楠楠', '123456', '男', '123456789987654321', '12345678900', '2');

-- ----------------------------
-- Table structure for `line`
-- ----------------------------
DROP TABLE IF EXISTS `line`;
CREATE TABLE `line` (
  `lineId` varchar(36) NOT NULL,
  `lineTypeId` varchar(36) NOT NULL,
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
  CONSTRAINT `fk_l_t` FOREIGN KEY (`lineTypeId`) REFERENCES `linetype` (`lineTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of line
-- ----------------------------
INSERT INTO `line` VALUES ('1', '111', '历史长城', '2', '飞机', '万里长城，名胜古迹，延绵不断', '不上长城，非好汉，体验攀登', '', '400.00', null, null, null, null, '2019-07-02 11:01:54');
INSERT INTO `line` VALUES ('10', '222', '巴黎', '14', '飞机', '巴黎（Paris），是法兰西共和国的首都和最大城市，也是法国的政治、经济、文化和商业中心，世界五个国际大都市之一（其余四个分别为纽约、伦敦、东京、香港），并被GaWC评为Alpha+级世界一线城市。', '在时尚潮流中，比以前更加强调奇异的羽毛或皮草，高级时装（haute couture）开始在巴黎出现，时装开始进入每年一轮的循环。', null, '5000.00', null, null, null, null, '2019-01-02 17:32:27');
INSERT INTO `line` VALUES ('12', '333', '巴厘岛', '10', '飞机', null, null, null, '5000.00', null, null, null, null, '2019-05-14 17:52:49');
INSERT INTO `line` VALUES ('13', '333', '泸沽湖', '7', '火车', null, null, null, '1600.00', '1', '1400.00', null, null, '2019-07-12 10:10:54');
INSERT INTO `line` VALUES ('14', '333', '洱海', '2', '汽车', null, null, null, '500.00', null, null, null, null, '2019-05-22 10:11:46');
INSERT INTO `line` VALUES ('15', '333', '海南', '10', '高铁', null, null, null, '2600.00', null, null, null, null, '2017-06-11 10:45:19');
INSERT INTO `line` VALUES ('2', '111', '丽江', '7', '飞机', null, null, null, '2000.00', null, null, null, null, '2019-06-10 11:02:49');
INSERT INTO `line` VALUES ('20', '111', '香港', '3天', '汽车', '', '', '', '300.00', null, null, null, null, '2019-07-05 04:59:20');
INSERT INTO `line` VALUES ('23', '222', '巴西', '5天', '飞机', '', '', '', '4000.00', null, null, null, null, '2019-07-05 05:42:14');
INSERT INTO `line` VALUES ('3', '111', '九寨沟', '7', '飞机', '', '感受大自然带来的美好', '', '1200.00', '1', '1000.00', null, null, '2019-05-15 11:03:05');
INSERT INTO `line` VALUES ('30', '333', '普吉岛', '10天', '飞机', '', '', '', '4000.00', null, null, null, null, '2019-07-08 09:08:25');
INSERT INTO `line` VALUES ('6', '222', '冰岛', '14', '飞机', null, null, null, '5000.00', null, null, null, null, '2018-07-19 17:28:29');
INSERT INTO `line` VALUES ('7', '222', '泰国', '10', '飞机', null, null, null, '3800.00', null, null, null, null, '2017-06-15 17:29:19');

-- ----------------------------
-- Table structure for `linetype`
-- ----------------------------
DROP TABLE IF EXISTS `linetype`;
CREATE TABLE `linetype` (
  `lineTypeId` varchar(36) NOT NULL,
  `lineTypeName` varchar(10) NOT NULL,
  `lineTypeTime` datetime NOT NULL,
  `lineTypeIcon` varchar(20) NOT NULL,
  PRIMARY KEY  (`lineTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of linetype
-- ----------------------------
INSERT INTO `linetype` VALUES ('111', '境内游', '2019-07-04 10:54:19', '/ht/im/timg2.jpg');
INSERT INTO `linetype` VALUES ('222', '境外游', '2019-07-04 10:55:16', '/ht/im/untitled.jpg');
INSERT INTO `linetype` VALUES ('333', '海岛游', '2019-07-04 10:57:42', '/ht/im/untitled2.jpg');
INSERT INTO `linetype` VALUES ('444', '自驾游', '2019-07-04 10:58:07', '/ht/im/timg11.jpg');
INSERT INTO `linetype` VALUES ('555', '全家游', '2019-07-05 05:31:48', '/ht/im/h2.jpg');
INSERT INTO `linetype` VALUES ('666', '团建', '2019-07-05 05:35:01', 'ht/im/b3.jpg');

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
  KEY `fk_o_c` (`customerId`),
  KEY `fk_o_l` (`lineId`),
  KEY `orderId` (`orderId`),
  CONSTRAINT `fk_o_c` FOREIGN KEY (`customerId`) REFERENCES `customer` (`customerId`),
  CONSTRAINT `fk_o_l` FOREIGN KEY (`lineId`) REFERENCES `line` (`lineId`)
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
  `orderId` varchar(36) NOT NULL,
  `touristId` varchar(36) NOT NULL,
  PRIMARY KEY  (`orderTourId`),
  KEY `fk_ot_o` (`orderId`),
  KEY `fk_ot_t` (`touristId`),
  CONSTRAINT `fk_ot_o` FOREIGN KEY (`orderId`) REFERENCES `orderdetail` (`orderId`),
  CONSTRAINT `fk_ot_t` FOREIGN KEY (`touristId`) REFERENCES `tourist` (`touristId`)
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
  `lineId` varchar(36) NOT NULL,
  PRIMARY KEY  (`pictureId`),
  KEY `fk_p_l` (`lineId`),
  CONSTRAINT `fk_p_l` FOREIGN KEY (`lineId`) REFERENCES `line` (`lineId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of picture
-- ----------------------------
INSERT INTO `picture` VALUES ('7', '湖', '/ht/images/l9.jpg', '20');
INSERT INTO `picture` VALUES ('8', '游乐园', '/ht/images/h2.jpg', '20');
INSERT INTO `picture` VALUES ('9', '花', '/ht/images/b5.jpg', '20');
INSERT INTO `picture` VALUES ('10', '街道', '/ht/images/l1.png', '20');
INSERT INTO `picture` VALUES ('13', '风景', '/ht/images/b1.jpg', '23');
INSERT INTO `picture` VALUES ('14', '风景', '/ht/images/b0.jpg', '23');
INSERT INTO `picture` VALUES ('15', '风景', '/ht/images/b3.jpg', '23');
INSERT INTO `picture` VALUES ('16', '花', '/ht/images/b5.jpg', '23');
INSERT INTO `picture` VALUES ('17', 'aaa', '/ht/images/j4.jpg', '30');
INSERT INTO `picture` VALUES ('18', 'aaa', '/ht/images/b7.jpg', '30');
INSERT INTO `picture` VALUES ('19', 'g', '/ht/images/b7.jpg', '30');
INSERT INTO `picture` VALUES ('20', 'k', '/ht/images/b6.jpg', '30');
INSERT INTO `picture` VALUES ('21', '222', '/ht/images/l0.jpg', '10');
INSERT INTO `picture` VALUES ('22', '333', '/ht/images/l1.jpg', '10');
INSERT INTO `picture` VALUES ('23', '444', '/ht/images/l2.jpg', '10');
INSERT INTO `picture` VALUES ('24', '555', '/ht/images/l3.jsp', '10');

-- ----------------------------
-- Table structure for `tourist`
-- ----------------------------
DROP TABLE IF EXISTS `tourist`;
CREATE TABLE `tourist` (
  `touristId` varchar(36) NOT NULL,
  `tourIDCard` varchar(36) NOT NULL,
  `tourTel` varchar(15) NOT NULL,
  `tourRealName` decimal(10,2) NOT NULL,
  PRIMARY KEY  (`touristId`),
  KEY `touristId` (`touristId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tourist
-- ----------------------------
