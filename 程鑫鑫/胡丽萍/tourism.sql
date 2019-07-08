/*
Navicat MySQL Data Transfer

Source Server         : hlp_mysql
Source Server Version : 50018
Source Host           : localhost:3306
Source Database       : tourism

Target Server Type    : MYSQL
Target Server Version : 50018
File Encoding         : 65001

Date: 2019-07-08 11:17:37
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
INSERT INTO `car` VALUES ('13', '8', 'A5', '2019-07-07 06:51:37');
INSERT INTO `car` VALUES ('16', '3', 'A5', '2019-07-07 07:26:36');
INSERT INTO `car` VALUES ('17', '3', 'A6', '2019-07-07 07:26:47');
INSERT INTO `car` VALUES ('18', '3', 'A1', '2019-07-07 07:26:54');
INSERT INTO `car` VALUES ('19', '8', 'A5', '2019-07-08 10:43:53');

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
  `custSex` varchar(40) NOT NULL,
  `custIdentityId` varchar(18) NOT NULL,
  `custTel` varchar(11) NOT NULL,
  `custType` int(11) default '0',
  PRIMARY KEY  (`customerId`),
  UNIQUE KEY `custAccount` (`custAccount`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES ('1', '100100', 'admin', 'admin', '男', '123456789', '11111111111', '1');
INSERT INTO `customer` VALUES ('2', '100110', 'hlp', 'hlp', '女', '987654321', '22222222222', '2');
INSERT INTO `customer` VALUES ('3', '100001', 'jack', '123', '男', '123455432a', '33333333333', '0');
INSERT INTO `customer` VALUES ('6', '100104', 'lisi', '123', '女', '360218200010262244', '12345678912', '0');
INSERT INTO `customer` VALUES ('8', '100003', 'lili', '123', '男', '12132', '6666666', '0');
INSERT INTO `customer` VALUES ('9', '100004', 'rose', '123', '女', '2143144', '454656', '0');

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
  `lineReason` varchar(500) default NULL,
  `lineArrange` varchar(500) default NULL,
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
INSERT INTO `line` VALUES ('A1', 'C5642', '欢乐谷', '5', '动车', '地铁7号线直达；从天安门乘52路到劲松桥东站转乘41路或乘674、680至终点站北京华侨城南站、740、840、29、743、753、683、801在弘燕桥、紫南家园、北工大东等站；自驾到杭州导航至“北京欢乐谷”', '北京市内最大游乐园之一，可以尽享刺激体验', '奥德赛之旅、X战车、姜饼旋转木马、甜心飞饼、飞越牛奶河、家庭过山车、果冻历险记、太阳神车、丛林飞车、奇幻海洋馆等。', '530.00', null, null, null, null, '2019-07-07 04:55:06');
INSERT INTO `line` VALUES ('A10', 'C5642', '纳木措', '5', '动车', '纳木错，从远处的荒凉萧瑟滑下，便是那透着幽', '纳木措是中国第二大的咸水湖，世界上海拔最高的大型湖泊。', '第1天 抵达拉萨，接站，入住酒店\r\n第2天 拉萨—米拉山口—巴松措—林芝\r\n第3天 林芝—鲁朗林海—苯日神山船游—雅鲁藏布大峡谷\r\n第4天 林芝—卡定沟—走进藏家—拉萨\r\n第5天 布达拉宫—大昭寺—八角街—拉萨\r\n第6天 拉萨—岗巴拉山口—羊卓雍措—藏草宜生或智昭产业园—拉萨\r\n第7天 拉萨—藏北大草原—那根拉山口—纳木措—拉萨\r\n第8天 睡到自然醒-自由活动-行程结束', '760.00', '1', '700.00', '2014-09-23 15:23:12', '2015-09-28 15:23:12', '2019-07-07 05:16:05');
INSERT INTO `line` VALUES ('A2', '2479D', '古北水镇', '5', '动车', '广东话复活复活', '是否受到各国', '官方公会多个地方回复', '500.00', '1', '400.00', '2014-09-23 15:23:12', '2015-09-28 15:23:12', '2019-07-08 08:57:31');
INSERT INTO `line` VALUES ('A3', 'B3257', '石景山', '3', '高铁', '狂欢之夏，梦幻摩天轮与灰姑娘城堡、酷炫电光舞、欢乐小丑表演　', '北京最著名的老牌游乐园，有众多娱乐项目可供游玩，乐园以格林童话中的灰姑娘城堡为中心，灰姑娘雕像仁立于城堡前的人工湖中，欧式古堡、少女塑像，与四周雕饰的童话人物皮诺曹、唐老鸭和米老鼠等融为一体，构成了富童话色彩的美妙世界。', '地铁：乘北京地铁1号线，八角游乐园站下车，出A口，西行300米即可到达；\r\n公交：乘坐专46、318、325、327、337、354、373、472、527、597、598、663、914、941、958、959直达，分别到达京原路口西、京原路口东、石景山游乐园西门、八角南路东口、八角北路东口站.', '350.00', null, null, null, null, '2019-07-03 11:18:27');
INSERT INTO `line` VALUES ('A4', 'C5642', '故宫', '10', '动车', '阿达水水实现', '故宫是个历史悠久的宫殿', '第一天啊啊啊', '560.00', null, null, null, null, '2019-07-08 09:00:18');
INSERT INTO `line` VALUES ('A5', 'A5732', '诺唯真游轮', '3', '飞机', '早餐：酒店内；午餐：邮轮上；晚餐：邮轮上', '夏威夷群岛各种奇花异草、南国水果于园内，风景如画，美不胜收。', '今日搭乘国际航班飞往美国度假胜地檀香山，抵达后观光，景点包括：\r\n【珍珠港】（游览时间约1小时）美国海军的基地和造船基地，也是北太平洋岛屿中的安全停泊港口之一。\r\n【夏威夷市内观光】（合计游览时间约1小时）游览【夏威夷州政府大厦】，【伊兰尼王宫】，【国王铜像】。\r\n下午3点送往酒店办理入住手续，之后自由活动。', '900.00', '1', '800.00', '2014-10-01 15:23:12', '2014-10-03 15:23:12', '2019-07-04 04:42:18');
INSERT INTO `line` VALUES ('A6', 'A5732', '北京鸟巢', '10', '高铁', '运通113，407，386，656，836快车\r\n', '鸟巢奥林匹克十周年交响视听灯光秀', '“造梦·鸟巢”交响视听秀时长30分钟，共分为4个篇章：光之翼、光之幻、光之歌、光之梦。分别展示了 “重生”、“古代文明”、“现代之光”、“时空穿梭”、“梦回奥运”、“共筑中国梦”、“未来之光”等情境。', '640.00', '1', '500.00', '2014-10-01 15:23:12', '2014-10-10 15:23:12', '2019-07-07 05:06:04');
INSERT INTO `line` VALUES ('A7', 'B3257', '马尔代夫', '14', '飞机', '的身份南京丹凤街你', '发广告黄冈', '是电视动画公司', '740.00', '1', '640.00', '2014-10-01 15:23:12', '2014-10-14 15:23:12', '2019-07-08 09:02:38');
INSERT INTO `line` VALUES ('A8', '2479D', '黄鹤楼', '7', '动车', '黃鶴樓與江西滕王閣、湖南嶽陽樓齊名，為江南三大名樓之一', '黃鶴樓公園坐落在市中心蛇山，佔地面積35.67萬平方米，面朝長江大橋，隔江相望有晴川飯店。公園以黃鶴樓主體建築為核心，先後建成白雲閣、落梅軒、岳飛廣場、百松園、梅園、杜鵑園等大小景點60多處，形成名勝區、文化區、植物區、岳飛景區四大景區。', '江南名樓、登樓懷古、遠眺長江、園林、建築、公園\r\n景區遊覽圖：', '530.00', null, null, null, null, '2019-07-03 02:58:49');
INSERT INTO `line` VALUES ('A9', 'A5732', '世纪公园', '14', '高铁', '大比武活动不回我电话', '世纪公园是一所美妙风景的公园', '十三点重播回家吧', '780.00', '1', '680.00', '2014-10-01 15:23:12', '2014-10-14 15:23:12', '2019-07-08 09:05:49');

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
INSERT INTO `linetype` VALUES ('2479D', '大理游', '2019-06-26 05:44:08', '/ht/im/1.jpg');
INSERT INTO `linetype` VALUES ('A5732', '国际游', '2019-06-24 06:28:16', 'ht/im/02.png');
INSERT INTO `linetype` VALUES ('B3257', '世界游', '2019-06-26 05:14:55', 'ht/im/hhl4.jpg');
INSERT INTO `linetype` VALUES ('C5642', '国内游', '2019-06-24 00:00:00', 'ht/im/hlg1.png');

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
INSERT INTO `picture` VALUES ('58', '摆钟', '/ht/im/1.jpg', 'A3');
INSERT INTO `picture` VALUES ('59', '铁塔', '/ht/im/03.jpg', 'A3');
INSERT INTO `picture` VALUES ('60', '天安门', '/ht/im/01.jpg', 'A3');
INSERT INTO `picture` VALUES ('61', '故宫', '/ht/im/04.jpg', 'A3');
INSERT INTO `picture` VALUES ('66', '黄鹤楼左侧', '/ht/im/hhl2.jpg', 'A8');
INSERT INTO `picture` VALUES ('67', '黄鹤楼右侧', '/ht/im/hhl3.jpg', 'A8');
INSERT INTO `picture` VALUES ('68', '黄鹤楼背面', '/ht/im/hhl4.jpg', 'A8');
INSERT INTO `picture` VALUES ('69', '黄鹤楼正面', '/ht/im/hhl1.png', 'A8');
INSERT INTO `picture` VALUES ('78', '诺唯真游轮', '/ht/im/yc2.jpg', 'A5');
INSERT INTO `picture` VALUES ('79', '诺唯真游轮', '/ht/im/yc3.jpg', 'A5');
INSERT INTO `picture` VALUES ('80', '诺唯真游轮', '/ht/im/yc1.jpg', 'A5');
INSERT INTO `picture` VALUES ('81', '诺唯真游轮', '/ht/im/yc4.jpg', 'A5');
INSERT INTO `picture` VALUES ('82', '欢乐谷', '/ht/im/hlg2.png', 'A1');
INSERT INTO `picture` VALUES ('83', '欢乐谷', '/ht/im/hlg3.jpg', 'A1');
INSERT INTO `picture` VALUES ('84', '欢乐谷', '/ht/im/hlg4.jpg', 'A1');
INSERT INTO `picture` VALUES ('85', '欢乐谷', '/ht/im/hlg1.png', 'A1');
INSERT INTO `picture` VALUES ('94', '北京鸟巢', '/ht/im/nc3.jpg', 'A6');
INSERT INTO `picture` VALUES ('95', '北京鸟巢', '/ht/im/nc1.jpg', 'A6');
INSERT INTO `picture` VALUES ('96', '北京鸟巢', '/ht/im/nc4.jpg', 'A6');
INSERT INTO `picture` VALUES ('97', '北京鸟巢', '/ht/im/nc2.jpg', 'A6');
INSERT INTO `picture` VALUES ('102', '纳木措', '/ht/im/nmz3.jpg', 'A10');
INSERT INTO `picture` VALUES ('103', '纳木措', '/ht/im/nmz4.jpg', 'A10');
INSERT INTO `picture` VALUES ('104', '纳木措', '/ht/im/nmz1.jpg', 'A10');
INSERT INTO `picture` VALUES ('105', '纳木措', '/ht/im/nmz2.jpg', 'A10');
INSERT INTO `picture` VALUES ('110', '古北水镇', '/ht/im/gbsz3.jpg', 'A2');
INSERT INTO `picture` VALUES ('111', '古北水镇', '/ht/im/gbsz1.png', 'A2');
INSERT INTO `picture` VALUES ('112', '古北水镇', '/ht/im/gbsz4.jpg', 'A2');
INSERT INTO `picture` VALUES ('113', '古北水镇', '/ht/im/gbsz2.png', 'A2');
INSERT INTO `picture` VALUES ('114', '故宫', '/ht/im/gu3.jpg', 'A4');
INSERT INTO `picture` VALUES ('115', '故宫', '/ht/im/gu1.jpg', 'A4');
INSERT INTO `picture` VALUES ('116', '故宫', '/ht/im/gu2.jpg', 'A4');
INSERT INTO `picture` VALUES ('117', '故宫', '/ht/im/02.png', 'A4');
INSERT INTO `picture` VALUES ('118', '马尔代夫', '/ht/im/medf3.jpg', 'A7');
INSERT INTO `picture` VALUES ('119', '马尔代夫', '/ht/im/medf1.png', 'A7');
INSERT INTO `picture` VALUES ('120', '马尔代夫', '/ht/im/medf2.png', 'A7');
INSERT INTO `picture` VALUES ('121', '马尔代夫', '/ht/im/medf4.png', 'A7');
INSERT INTO `picture` VALUES ('122', '世纪公园', '/ht/im/sjgy4.jpg', 'A9');
INSERT INTO `picture` VALUES ('123', '世纪公园', '/ht/im/sjgy3.jpg', 'A9');
INSERT INTO `picture` VALUES ('124', '世纪公园', '/ht/im/sjgy1.png', 'A9');
INSERT INTO `picture` VALUES ('125', '世纪公园', '/ht/im/sjgy2.jpg', 'A9');

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
