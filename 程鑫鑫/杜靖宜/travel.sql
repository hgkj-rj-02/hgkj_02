/*
Navicat MySQL Data Transfer

Source Server         : lalala
Source Server Version : 80011
Source Host           : localhost:3306
Source Database       : travel

Target Server Type    : MYSQL
Target Server Version : 80011
File Encoding         : 65001

Date: 2019-07-08 15:24:16
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `car`
-- ----------------------------
DROP TABLE IF EXISTS `car`;
CREATE TABLE `car` (
  `carID` int(11) NOT NULL AUTO_INCREMENT,
  `customerID` int(11) NOT NULL,
  `lineID` varchar(36) NOT NULL,
  `carTime` datetime NOT NULL,
  PRIMARY KEY (`carID`),
  KEY `customerID` (`customerID`),
  KEY `lineID` (`lineID`),
  CONSTRAINT `car_ibfk_1` FOREIGN KEY (`customerID`) REFERENCES `customer` (`custid`),
  CONSTRAINT `car_ibfk_2` FOREIGN KEY (`lineID`) REFERENCES `line` (`lineid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of car
-- ----------------------------

-- ----------------------------
-- Table structure for `comment`
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `commentID` varchar(36) NOT NULL,
  `commContext` varchar(36) NOT NULL,
  `commTime` decimal(10,2) NOT NULL,
  `custID` int(11) NOT NULL,
  `lineID` varchar(12) NOT NULL,
  PRIMARY KEY (`commentID`),
  KEY `custID` (`custID`),
  KEY `lineID` (`lineID`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`custID`) REFERENCES `customer` (`custid`),
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`lineID`) REFERENCES `line` (`lineid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------

-- ----------------------------
-- Table structure for `customer`
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `custID` int(11) NOT NULL AUTO_INCREMENT,
  `custAccount` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `custName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `custPassWord` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `custSex` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `custIdentityID` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `custTel` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `custType` int(11) DEFAULT NULL,
  PRIMARY KEY (`custID`),
  UNIQUE KEY `account` (`custAccount`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES ('1', '573182896', '嘟宝宝', '123456', '男', '123', '123', '0');
INSERT INTO `customer` VALUES ('2', '123456', 'jack', '123456', '男', '123456', '123456', '1');
INSERT INTO `customer` VALUES ('3', 'maxAdmin', '123', 'maxAdmin', '女', '123', '123', '2');
INSERT INTO `customer` VALUES ('5', '猪宝宝', '1234', '123456', '女', '1243242', '12344', null);

-- ----------------------------
-- Table structure for `line`
-- ----------------------------
DROP TABLE IF EXISTS `line`;
CREATE TABLE `line` (
  `lineID` varchar(12) NOT NULL,
  `lineTypeID` varchar(12) NOT NULL,
  `lineName` varchar(15) NOT NULL,
  `lineDays` varchar(12) NOT NULL,
  `lineVehicle` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `lineIntroduction` varchar(400) DEFAULT NULL,
  `lineReason` varchar(100) DEFAULT NULL,
  `lineArrange` varchar(100) DEFAULT NULL,
  `linePrice` decimal(10,2) NOT NULL,
  `lineTeamBuy` int(11) DEFAULT NULL,
  `lineTeamBuyPrice` decimal(10,2) DEFAULT NULL,
  `lineBeginTime` datetime DEFAULT NULL,
  `lineEndTime` datetime DEFAULT NULL,
  `lineOnTime` datetime NOT NULL,
  PRIMARY KEY (`lineID`),
  KEY `FKd7h38nar3c77x5uw44ddn6nyf` (`lineTypeID`),
  CONSTRAINT `FKd7h38nar3c77x5uw44ddn6nyf` FOREIGN KEY (`lineTypeID`) REFERENCES `linetype` (`linetypeid`),
  CONSTRAINT `line_ibfk_1` FOREIGN KEY (`lineTypeID`) REFERENCES `linetype` (`linetypeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of line
-- ----------------------------
INSERT INTO `line` VALUES ('12001001', '1001', '凤凰古城', '3', '跑车', '大理石克拉克的', '大萨达', '打啊打', '1200.00', '1', null, null, null, '2019-07-03 09:30:17');
INSERT INTO `line` VALUES ('12001002', '1002', '马尔代夫', '5', '飞机', '达大厦多', '萨达撒多', '大萨达撒多', '1200.00', '1', null, null, null, '2019-07-03 09:39:25');
INSERT INTO `line` VALUES ('12051001', '1001', '九寨沟', '2', '巴士', '达大厦', '大大大', '发斯蒂芬斯蒂芬', '1205.00', '1', null, null, null, '2019-07-03 09:37:14');
INSERT INTO `line` VALUES ('12531001', '1003', '西双版纳', '1', '轮船', '大萨达所', '大大', '官方价格', '1253.00', '1', null, null, null, '2019-07-03 09:36:14');
INSERT INTO `line` VALUES ('13001001', '1001', '昆明', '4', '跑车', '大大', '大法师的', '  大萨达', '1300.00', '1', null, null, null, '2019-07-03 09:34:00');
INSERT INTO `line` VALUES ('2133211002', '1002', '夏威夷', '5', '飞机', '大大大所', 'sad大V', '打打分', '213321.00', '1', null, null, null, '2019-07-03 09:40:33');
INSERT INTO `line` VALUES ('23401004', '1004', '张家界', '7', '跑车', '企鹅无微信多少', '递四方速递发v', '水电费第三方', '2340.00', '1', null, null, null, '2019-07-03 09:53:11');
INSERT INTO `line` VALUES ('234321001', '1004', '黄山', '5', '跑车', '奥德赛大所', '阿斯达', '大厦', '23432.00', '1', null, null, null, '2019-07-03 09:55:32');
INSERT INTO `line` VALUES ('23441001', '1001', '武当山', '7', '跑车', '萨达打撒', '地方是的范德萨', '', '2344.00', '1', null, null, null, '2019-07-03 09:53:58');
INSERT INTO `line` VALUES ('23601001', '1001', '丽江', '2', '飞机', '打啊打所', '大萨达', '大萨达所', '2360.00', '1', null, null, null, '2019-07-03 09:34:59');
INSERT INTO `line` VALUES ('29001001', '1001', '云南大理', '4', '跑车', '大大', '大大', '阿斯顿撒多', '2900.00', '1', null, null, null, '2019-07-03 09:32:16');
INSERT INTO `line` VALUES ('3425351001', '1002', '美国', '6', '跑车', '摄氏度大师傅', '范德萨发生', '不管不管饭', '342535.00', '1', null, null, null, '2019-07-03 09:41:56');
INSERT INTO `line` VALUES ('3456751003', '1003', '巴厘岛', '4', '跑车', '湿哒哒撒所多', '的恢复规划', '第三方士大夫', '345675.00', '1', null, null, null, '2019-07-03 09:46:46');
INSERT INTO `line` VALUES ('45651001', '1004', '凤凰', '5', '跑车', '安达市多撒多', '大萨达撒', '的方法都是', '4565.00', '1', null, null, null, '2019-07-03 09:51:04');
INSERT INTO `line` VALUES ('50001001', '1002', '瑞士', '4', '跑车', '大法师的', '阿斯顿发送到', '第三方付', '5000.00', '1', null, null, null, '2019-07-03 09:42:54');
INSERT INTO `line` VALUES ('55461001', '1001', '曼谷', '2', '跑车', '撒大声地', '阿斯顿发的', '方法的都是', '5546.00', '1', null, null, null, '2019-07-03 09:47:23');
INSERT INTO `line` VALUES ('5786781003', '1003', '北海道', '7', '跑车', '阿斯达大所', '大萨达', '爱上大师傅', '578678.00', '1', null, null, null, '2019-07-03 09:44:38');
INSERT INTO `line` VALUES ('73211002', '1002', '奥地利', '4', '跑车', '阿诗丹顿所', '大萨达所', '大萨达所', '7321.00', '1', null, null, null, '2019-07-03 09:38:35');

-- ----------------------------
-- Table structure for `linetype`
-- ----------------------------
DROP TABLE IF EXISTS `linetype`;
CREATE TABLE `linetype` (
  `lineTypeID` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `lineTypeName` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `lineTypeTime` datetime NOT NULL,
  `lineTypeIcon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`lineTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of linetype
-- ----------------------------
INSERT INTO `linetype` VALUES ('1001', '境内游', '2019-07-03 03:01:25', '/ht/images/7.jpg');
INSERT INTO `linetype` VALUES ('1002', '境外游', '2019-07-03 03:01:55', '/ht/images/14.jpg');
INSERT INTO `linetype` VALUES ('1003', '海岛游', '2019-07-03 03:07:10', '/ht/images/hailan.jpg');
INSERT INTO `linetype` VALUES ('1004', '自驾游', '2019-07-03 03:19:15', '/ht/images/t11.jpg');

-- ----------------------------
-- Table structure for `orderdetail`
-- ----------------------------
DROP TABLE IF EXISTS `orderdetail`;
CREATE TABLE `orderdetail` (
  `orderID` varchar(255) NOT NULL,
  `customerID` int(11) NOT NULL,
  `lineName` varchar(255) NOT NULL,
  `linePrice` decimal(10,2) NOT NULL,
  `orderDate` datetime NOT NULL,
  `travelDate` datetime NOT NULL,
  `orderTotal` decimal(10,2) NOT NULL,
  `lineID` varchar(30) NOT NULL,
  `orderState` int(11) NOT NULL,
  PRIMARY KEY (`orderID`),
  KEY `customerID` (`customerID`),
  KEY `lineID` (`lineID`),
  CONSTRAINT `orderdetail_ibfk_1` FOREIGN KEY (`customerID`) REFERENCES `customer` (`custid`),
  CONSTRAINT `orderdetail_ibfk_2` FOREIGN KEY (`lineID`) REFERENCES `line` (`lineid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderdetail
-- ----------------------------

-- ----------------------------
-- Table structure for `ot_detail`
-- ----------------------------
DROP TABLE IF EXISTS `ot_detail`;
CREATE TABLE `ot_detail` (
  `otID` int(11) NOT NULL AUTO_INCREMENT,
  `odID` varchar(36) NOT NULL,
  `touristID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`otID`),
  KEY `odID` (`odID`),
  KEY `touristID` (`touristID`),
  CONSTRAINT `ot_detail_ibfk_1` FOREIGN KEY (`odID`) REFERENCES `orderdetail` (`orderid`),
  CONSTRAINT `ot_detail_ibfk_2` FOREIGN KEY (`touristID`) REFERENCES `tourist` (`touristid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ot_detail
-- ----------------------------

-- ----------------------------
-- Table structure for `picture`
-- ----------------------------
DROP TABLE IF EXISTS `picture`;
CREATE TABLE `picture` (
  `pictureID` int(11) NOT NULL AUTO_INCREMENT,
  `pictIntroduction` varchar(255) NOT NULL,
  `pictName` varchar(255) NOT NULL,
  `lineID` varchar(255) NOT NULL,
  PRIMARY KEY (`pictureID`),
  KEY `FK6tx793jgoqj7tqjvd58pgscfa` (`lineID`),
  CONSTRAINT `FKajxrh3n0rdhg235h7vf6r64l` FOREIGN KEY (`lineID`) REFERENCES `line` (`lineid`),
  CONSTRAINT `picture_ibfk_1` FOREIGN KEY (`lineID`) REFERENCES `line` (`lineid`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of picture
-- ----------------------------
INSERT INTO `picture` VALUES ('18', '/ht/images/10.jpg', '啊实打实多', '12001001');
INSERT INTO `picture` VALUES ('19', '/ht/images/6.jpg', '打啊打', '12001001');
INSERT INTO `picture` VALUES ('20', '/ht/images/t8.jpg', '大V方法大V', '12001001');
INSERT INTO `picture` VALUES ('21', '/ht/images/t8.jpg', '打啊打所', '29001001');
INSERT INTO `picture` VALUES ('22', '/ht/images/12.jpg', '在发大V', '29001001');
INSERT INTO `picture` VALUES ('23', '/ht/images/timg.jpg', '奥德赛撒多', '29001001');
INSERT INTO `picture` VALUES ('24', '/ht/images/t8.jpg', '大大', '13001001');
INSERT INTO `picture` VALUES ('25', '/ht/images/12.jpg', '大大', '13001001');
INSERT INTO `picture` VALUES ('26', '/ht/images/9.jpg', '大大', '13001001');
INSERT INTO `picture` VALUES ('27', '/ht/images/13.jpg', '大大', '23601001');
INSERT INTO `picture` VALUES ('28', '/ht/images/15.jpg', 'DSADA', '23601001');
INSERT INTO `picture` VALUES ('29', '/ht/images/12.jpg', '达大厦', '23601001');
INSERT INTO `picture` VALUES ('30', '/ht/images/15.jpg', '大大', '12531001');
INSERT INTO `picture` VALUES ('31', '/ht/images/13.jpg', '收到法国代购', '12531001');
INSERT INTO `picture` VALUES ('32', '/ht/images/6.jpg', '方大化工规范化', '12531001');
INSERT INTO `picture` VALUES ('33', '/ht/images/14.jpg', '大大', '12051001');
INSERT INTO `picture` VALUES ('34', '/ht/images/haidao.jpg', '规划和规范', '12051001');
INSERT INTO `picture` VALUES ('35', '/ht/images/13.jpg', '发的规范化', '12051001');
INSERT INTO `picture` VALUES ('36', '/ht/images/13.jpg', '大大', '73211002');
INSERT INTO `picture` VALUES ('37', '/ht/images/15.jpg', '大萨达', '73211002');
INSERT INTO `picture` VALUES ('38', '/ht/images/guzhen.jpg', '湿哒哒撒', '73211002');
INSERT INTO `picture` VALUES ('39', '/ht/images/6.jpg', '大大大', '12001002');
INSERT INTO `picture` VALUES ('40', '/ht/images/9.jpg', '范德萨发放', '12001002');
INSERT INTO `picture` VALUES ('41', '/ht/images/7.jpg', '大大', '12001002');
INSERT INTO `picture` VALUES ('42', '/ht/images/13.jpg', '大萨达', '2133211002');
INSERT INTO `picture` VALUES ('43', '/ht/images/12.jpg', '大萨达所', '2133211002');
INSERT INTO `picture` VALUES ('44', '/ht/images/14.jpg', '啊实打实多啊', '2133211002');
INSERT INTO `picture` VALUES ('45', '/ht/images/15.jpg', '第三方的', '3425351001');
INSERT INTO `picture` VALUES ('46', '/ht/images/hailan.jpg', '第三方代发', '3425351001');
INSERT INTO `picture` VALUES ('47', '/ht/images/guzhen.jpg', '大萨达所', '3425351001');
INSERT INTO `picture` VALUES ('48', '/ht/images/satan.jpg', '大萨达撒多', '50001001');
INSERT INTO `picture` VALUES ('49', '/ht/images/t11.jpg', '水电费第三方', '50001001');
INSERT INTO `picture` VALUES ('50', '/ht/images/t8.jpg', '大大大', '50001001');
INSERT INTO `picture` VALUES ('51', '/ht/images/7.jpg', '湿哒哒撒', '5786781003');
INSERT INTO `picture` VALUES ('52', '/ht/images/guzhen.jpg', '阿斯达DVD是', '5786781003');
INSERT INTO `picture` VALUES ('53', '/ht/images/satan.jpg', '是的发顺丰的', '5786781003');
INSERT INTO `picture` VALUES ('54', '/ht/images/haidao.jpg', '顺丰到付多少', '3456751003');
INSERT INTO `picture` VALUES ('55', '/ht/images/15.jpg', ' 似懂非懂是', '3456751003');
INSERT INTO `picture` VALUES ('56', '/ht/images/10.jpg', '胜多负少', '3456751003');
INSERT INTO `picture` VALUES ('57', '/ht/images/13.jpg', '大风刮过', '55461001');
INSERT INTO `picture` VALUES ('58', '/ht/images/7.jpg', '范德萨发的', '55461001');
INSERT INTO `picture` VALUES ('59', '/ht/images/10.jpg', '梵蒂冈的', '55461001');
INSERT INTO `picture` VALUES ('60', '/ht/images/14.jpg', '撒大声地', '45651001');
INSERT INTO `picture` VALUES ('61', '/ht/images/7.jpg', '大萨达撒多', '45651001');
INSERT INTO `picture` VALUES ('62', '/ht/images/15.jpg', '敖德萨所多', '45651001');
INSERT INTO `picture` VALUES ('63', '/ht/images/15.jpg', '放松放松', '23401004');
INSERT INTO `picture` VALUES ('64', '/ht/images/12.jpg', '师傅的说法', '23401004');
INSERT INTO `picture` VALUES ('65', '/ht/images/14.jpg', '范德萨发生', '23401004');
INSERT INTO `picture` VALUES ('66', '/ht/images/6.jpg', '放松放松是的发送到', '23441001');
INSERT INTO `picture` VALUES ('67', '/ht/images/t11.jpg', '丰东股份吧', '23441001');
INSERT INTO `picture` VALUES ('68', '/ht/images/timg.jpg', '对方水电费', '23441001');
INSERT INTO `picture` VALUES ('69', '/ht/images/12.jpg', '大大', '234321001');
INSERT INTO `picture` VALUES ('70', '/ht/images/15.jpg', '打车费', '234321001');
INSERT INTO `picture` VALUES ('71', '/ht/images/haidao.jpg', '似懂非懂是', '234321001');

-- ----------------------------
-- Table structure for `tourist`
-- ----------------------------
DROP TABLE IF EXISTS `tourist`;
CREATE TABLE `tourist` (
  `touristID` varchar(36) NOT NULL,
  `tourIDCard` varchar(36) NOT NULL,
  `tourTel` varchar(15) NOT NULL,
  `tourRealName` decimal(10,2) NOT NULL,
  PRIMARY KEY (`touristID`),
  KEY `touristID` (`touristID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tourist
-- ----------------------------
