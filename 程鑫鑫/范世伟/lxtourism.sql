/*
Navicat MySQL Data Transfer

Source Server         : fsw
Source Server Version : 50018
Source Host           : localhost:3306
Source Database       : lxtourism

Target Server Type    : MYSQL
Target Server Version : 50018
File Encoding         : 65001

Date: 2019-07-08 15:14:26
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `car`
-- ----------------------------
DROP TABLE IF EXISTS `car`;
CREATE TABLE `car` (
  `carID` int(11) NOT NULL auto_increment,
  `customerID` int(11) NOT NULL,
  `lineID` varchar(36) NOT NULL,
  `time` datetime default NULL,
  PRIMARY KEY  (`carID`),
  KEY `fk_2` (`customerID`),
  KEY `fk_3` (`lineID`),
  CONSTRAINT `FKhbpwxw3p9or49q5aa678er23c` FOREIGN KEY (`lineID`) REFERENCES `line` (`lineID`),
  CONSTRAINT `fk_2` FOREIGN KEY (`customerID`) REFERENCES `customer` (`customerID`),
  CONSTRAINT `fk_3` FOREIGN KEY (`lineID`) REFERENCES `line` (`lineID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of car
-- ----------------------------

-- ----------------------------
-- Table structure for `comment`
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `commentID` int(5) NOT NULL auto_increment,
  `customerID` int(11) NOT NULL,
  `lineID` varchar(12) NOT NULL,
  `time` datetime NOT NULL,
  `content` text NOT NULL,
  PRIMARY KEY  (`commentID`),
  KEY `customerID` (`customerID`),
  KEY `lineID` (`lineID`),
  KEY `FK59ouw9j6h78gr8m7k42m3vl20` (`lineID`),
  CONSTRAINT `customerID` FOREIGN KEY (`customerID`) REFERENCES `customer` (`customerID`),
  CONSTRAINT `FK59ouw9j6h78gr8m7k42m3vl20` FOREIGN KEY (`lineID`) REFERENCES `line` (`lineID`),
  CONSTRAINT `lineID` FOREIGN KEY (`lineID`) REFERENCES `line` (`lineID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------

-- ----------------------------
-- Table structure for `customer`
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `customerID` int(11) NOT NULL auto_increment,
  `account` varchar(12) NOT NULL,
  `name` varchar(6) NOT NULL,
  `password` varchar(12) NOT NULL,
  `gender` char(2) NOT NULL,
  `identityID` varchar(18) NOT NULL,
  `tel` varchar(11) NOT NULL,
  `type` int(11) default '0',
  PRIMARY KEY  (`customerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES ('1', '123456', '范世伟', '123', '男', '360281199809064010', '18307982946', '1');
INSERT INTO `customer` VALUES ('2', '123457', 'jack', '123', '男', '360281163696963636', '18307982946', '0');
INSERT INTO `customer` VALUES ('3', '1234568', 'rose', '123', '男', '321123199612231234', '18307982946', '0');
INSERT INTO `customer` VALUES ('4', '1234569', 'fsw', '123', '男', '345215188909090963', '18307982946', '2');
INSERT INTO `customer` VALUES ('5', '1234568', 'rose', '123', '女', '321123199612231234', '18307982946', '0');
INSERT INTO `customer` VALUES ('6', '', '', '', '男', '', '', '0');
INSERT INTO `customer` VALUES ('7', '12', '', '', '男', '', '', '0');
INSERT INTO `customer` VALUES ('8', '12', '', '', '男', '', '', '0');

-- ----------------------------
-- Table structure for `line`
-- ----------------------------
DROP TABLE IF EXISTS `line`;
CREATE TABLE `line` (
  `lineID` varchar(12) NOT NULL,
  `lineTypeID` varchar(12) NOT NULL,
  `lineName` varchar(15) NOT NULL,
  `days` varchar(12) NOT NULL,
  `vehicle` char(2) NOT NULL COMMENT '出游交通工具',
  `introduction` varchar(400) default NULL,
  `reason` varchar(100) default NULL,
  `arrange` varchar(100) default NULL,
  `price` decimal(10,1) NOT NULL,
  `teamBuy` int(11) default '0',
  `teamBuyPrice` decimal(10,1) default NULL,
  `beginTime` datetime default NULL,
  `endTime` datetime default NULL,
  `onTime` datetime NOT NULL,
  PRIMARY KEY  (`lineID`),
  KEY `fk_1` (`lineTypeID`),
  CONSTRAINT `FKd7h38nar3c77x5uw44ddn6nyf` FOREIGN KEY (`lineTypeID`) REFERENCES `linetype` (`lineTypeID`),
  CONSTRAINT `fk_1` FOREIGN KEY (`lineTypeID`) REFERENCES `linetype` (`lineTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of line
-- ----------------------------
INSERT INTO `line` VALUES ('AJ', 'JW', '梦回埃及', '10天', '飞机', '字塔/狮身人面像/卢克索神庙/红海度假', '开罗+红海全程五星度假丨部分升级卢克索+亚历山大丨埃及8-11天 ', '金字塔、开罗 、亚历山大、红海（赫尔加达）、尼罗河、狮身人面像等各经典景点；', '5990.0', '1', '5000.0', '2019-06-25 00:00:00', '2019-06-29 00:00:00', '2019-07-04 04:13:01');
INSERT INTO `line` VALUES ('BJ', 'HD', '北京', '5天', '飞机', '一路风景如画', '北京市我国首都', '豪华酒店', '14999.0', '0', '10000.0', '2019-06-25 00:00:00', '2019-06-29 00:00:00', '2019-07-04 10:38:51');
INSERT INTO `line` VALUES ('BJ-QD', 'HD', '北京-青岛', '5天', '动车', '海上第一名山-崂山+逢莱八仙过海+威海定远舰，舒适商务酒店 ', '全程带有营运空调旅游车为您服务精选商务酒店，方便快捷、干净，卫生，安全', '素有“海上第一名山”之称的5A级景区崂山', '1860.0', '0', '1600.0', '2019-06-25 00:00:00', '2019-06-29 00:00:00', '2019-07-04 04:08:30');
INSERT INTO `line` VALUES ('BJ-SH', 'JN', '北京上海', '5天', '高铁', '邂逅双水乡：乌镇 南浔\r\n全方位感受烟雨江南', '北京作为为我国首都，几个朝代的京都', '奢享华东♥住乌镇周庄+全程高端酒店♥古战船游太湖，品龙井♥上海杭州双飞5天', '4399.0', '1', '4000.0', '2019-06-25 00:00:00', '2019-06-29 00:00:00', '2019-07-03 05:05:37');
INSERT INTO `line` VALUES ('JN', 'HD', '风景游', '3天', '飞机', '到处美景，到处美女', '美丽的风景', '一路沿海一路美景', '6999.0', '1', '5000.0', '2019-06-25 00:00:00', '2019-06-29 00:00:00', '2019-07-04 03:55:29');

-- ----------------------------
-- Table structure for `linetype`
-- ----------------------------
DROP TABLE IF EXISTS `linetype`;
CREATE TABLE `linetype` (
  `lineTypeID` varchar(36) NOT NULL,
  `typeName` varchar(10) NOT NULL,
  `time` datetime NOT NULL,
  `icon` varchar(255) default NULL,
  PRIMARY KEY  (`lineTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of linetype
-- ----------------------------
INSERT INTO `linetype` VALUES ('HD', '海岛游', '2019-07-03 04:56:52', 'ht/imgs/scroll3.jpg');
INSERT INTO `linetype` VALUES ('hellp', '2121', '2019-07-08 09:00:41', 'ht/imgs/cp1.jpg');
INSERT INTO `linetype` VALUES ('JN', '境内游', '2019-07-03 04:54:55', 'ht/imgs/bjxz.jpg');
INSERT INTO `linetype` VALUES ('JW', '境外游', '2019-07-08 08:59:27', 'ht/imgs/cp3.jpg');

-- ----------------------------
-- Table structure for `orderdetail`
-- ----------------------------
DROP TABLE IF EXISTS `orderdetail`;
CREATE TABLE `orderdetail` (
  `odID` varchar(36) NOT NULL,
  `customerID` int(11) NOT NULL,
  `lineName` varchar(15) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `orderDate` datetime NOT NULL,
  `travelDate` datetime NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `lineID` varchar(36) NOT NULL,
  `state` int(11) NOT NULL,
  PRIMARY KEY  (`odID`),
  KEY `fk_5` (`customerID`),
  KEY `fk_6` (`lineID`),
  KEY `FK9ekcai9ip4xa8jad14ogyxh5a` (`lineID`),
  CONSTRAINT `FK9ekcai9ip4xa8jad14ogyxh5a` FOREIGN KEY (`lineID`) REFERENCES `line` (`lineID`),
  CONSTRAINT `fk_5` FOREIGN KEY (`customerID`) REFERENCES `customer` (`customerID`),
  CONSTRAINT `fk_6` FOREIGN KEY (`lineID`) REFERENCES `line` (`lineID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderdetail
-- ----------------------------

-- ----------------------------
-- Table structure for `ot_detail`
-- ----------------------------
DROP TABLE IF EXISTS `ot_detail`;
CREATE TABLE `ot_detail` (
  `otID` int(11) NOT NULL auto_increment,
  `odID` varchar(36) NOT NULL,
  `touristID` varchar(36) NOT NULL,
  PRIMARY KEY  (`otID`),
  KEY `fk_7` (`odID`),
  KEY `fk_8` (`touristID`),
  CONSTRAINT `fk_7` FOREIGN KEY (`odID`) REFERENCES `orderdetail` (`odID`),
  CONSTRAINT `fk_8` FOREIGN KEY (`touristID`) REFERENCES `tourist` (`touristID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ot_detail
-- ----------------------------

-- ----------------------------
-- Table structure for `picture`
-- ----------------------------
DROP TABLE IF EXISTS `picture`;
CREATE TABLE `picture` (
  `pictureID` int(11) NOT NULL auto_increment,
  `introductioin` varchar(20) NOT NULL,
  `picname` varchar(255) NOT NULL,
  `lineID` varchar(36) NOT NULL,
  PRIMARY KEY  (`pictureID`),
  KEY `fk_4` (`lineID`),
  CONSTRAINT `FKajxrh3n0rdhg235h7vf6r64l` FOREIGN KEY (`lineID`) REFERENCES `line` (`lineID`),
  CONSTRAINT `fk_4` FOREIGN KEY (`lineID`) REFERENCES `line` (`lineID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of picture
-- ----------------------------
INSERT INTO `picture` VALUES ('1', '全方位感受烟雨江南——漫步西湖', 'ht/im/d94a4a45ddd16c.jpg_r_390x260x90_f9708f5b.jpg', 'BJ-SH');
INSERT INTO `picture` VALUES ('2', '邂逅双水乡：乌镇 南浔', 'ht/im/264a320e9e8c3c02.jpg_r_390x260x90_4e3ba596.jpg', 'BJ-SH');
INSERT INTO `picture` VALUES ('3', '宿水乡，全程高档酒店，可升级更高级别', 'ht/im/c0e4061f-2e75-4476-92ab-6f975d285e9d.jpg_r_390x260x90_4db4ce39.jpg', 'BJ-SH');
INSERT INTO `picture` VALUES ('4', '江南鱼米之乡', 'ht/im/f11aac21e58e80.jpg_r_390x260x90_21a2533c.jpg', 'BJ-SH');
INSERT INTO `picture` VALUES ('5', '狮子', 'ht/im/gg.png', 'BJ');
INSERT INTO `picture` VALUES ('6', '人名大会堂', 'ht/im/rmdht.png', 'BJ');
INSERT INTO `picture` VALUES ('7', '鸟巢', 'ht/im/nc.jpeg', 'BJ');
INSERT INTO `picture` VALUES ('8', '故宫', 'ht/im/tt.jpg', 'BJ');
INSERT INTO `picture` VALUES ('9', '海底世界', 'ht/im/scroll1.jpg', 'JN');
INSERT INTO `picture` VALUES ('10', '唐老鸭', 'ht/im/cp5.jpg', 'JN');
INSERT INTO `picture` VALUES ('11', '沿海', 'ht/im/scroll4.jpg', 'JN');
INSERT INTO `picture` VALUES ('12', '欢乐谷', 'ht/im/cp4.jpg', 'JN');
INSERT INTO `picture` VALUES ('13', '舒适商务酒店', 'ht/im/北京青岛4jpg.jpg', 'BJ-QD');
INSERT INTO `picture` VALUES ('14', '海上第一名山', 'ht/im/北京青岛1.jpg', 'BJ-QD');
INSERT INTO `picture` VALUES ('15', '威海定远舰', 'ht/im/北京青岛3.jpg', 'BJ-QD');
INSERT INTO `picture` VALUES ('16', '逢莱八仙过海', 'ht/im/北京青岛2.jpg', 'BJ-QD');
INSERT INTO `picture` VALUES ('17', '埃及金字塔', 'ht/im/埃及1.jpg', 'AJ');
INSERT INTO `picture` VALUES ('18', '埃及开罗', 'ht/im/埃及4.jpg', 'AJ');
INSERT INTO `picture` VALUES ('19', '埃及法老', 'ht/im/埃及2.jpg', 'AJ');
INSERT INTO `picture` VALUES ('20', '埃及美女', 'ht/im/埃及3.jpg', 'AJ');

-- ----------------------------
-- Table structure for `tourist`
-- ----------------------------
DROP TABLE IF EXISTS `tourist`;
CREATE TABLE `tourist` (
  `touristID` varchar(36) NOT NULL,
  `IDCard` varchar(36) NOT NULL,
  `tel` varchar(15) NOT NULL,
  `realName` varchar(10) NOT NULL,
  PRIMARY KEY  (`touristID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tourist
-- ----------------------------
