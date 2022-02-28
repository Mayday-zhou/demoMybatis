/*
MySQL Data Transfer
Source Host: localhost
Source Database: test
Target Host: localhost
Target Database: test
Date: 2022/2/26 11:07:44
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for course
-- ----------------------------
CREATE TABLE `course` (
  `courseid` int(2) NOT NULL,
  `coursename` varchar(20) NOT NULL,
  PRIMARY KEY (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for score
-- ----------------------------
CREATE TABLE `score` (
  `scoreid` int(10) NOT NULL,
  `stuno` char(4) NOT NULL,
  `courseid` int(2) NOT NULL,
  `score` decimal(5,1) NOT NULL,
  PRIMARY KEY (`scoreid`),
  KEY `stuno` (`stuno`),
  KEY `courseid` (`courseid`),
  CONSTRAINT `score_ibfk_1` FOREIGN KEY (`stuno`) REFERENCES `student` (`stuno`),
  CONSTRAINT `score_ibfk_2` FOREIGN KEY (`courseid`) REFERENCES `course` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for student
-- ----------------------------
CREATE TABLE `student` (
  `stuno` char(4) NOT NULL,
  `name` varchar(10) NOT NULL,
  `sex` char(1) NOT NULL,
  `sgrade` char(1) NOT NULL,
  `address` varchar(50) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`stuno`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t1
-- ----------------------------
CREATE TABLE `t1` (
  `a` int(11) NOT NULL,
  `b` char(10) DEFAULT NULL,
  `c` varchar(100) DEFAULT NULL,
  `d` datetime DEFAULT NULL,
  PRIMARY KEY (`a`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `course` VALUES ('1', '英语');
INSERT INTO `course` VALUES ('2', 'java');
INSERT INTO `course` VALUES ('3', 'html');
INSERT INTO `score` VALUES ('1', '1', '1', '83.0');
INSERT INTO `score` VALUES ('2', '2', '2', '80.0');
INSERT INTO `score` VALUES ('3', '3', '3', '56.0');
INSERT INTO `score` VALUES ('4', '4', '1', '23.0');
INSERT INTO `score` VALUES ('5', '4', '2', '76.0');
INSERT INTO `score` VALUES ('6', '4', '3', '80.0');
INSERT INTO `score` VALUES ('7', '5', '1', '70.0');
INSERT INTO `score` VALUES ('8', '5', '2', '65.0');
INSERT INTO `score` VALUES ('9', '5', '3', '60.0');
INSERT INTO `score` VALUES ('10', '6', '1', '100.0');
INSERT INTO `score` VALUES ('11', '6', '2', '90.0');
INSERT INTO `score` VALUES ('12', '7', '3', '99.0');
INSERT INTO `score` VALUES ('13', '7', '1', '92.0');
INSERT INTO `score` VALUES ('14', '9', '2', '93.0');
INSERT INTO `score` VALUES ('15', '9', '3', '68.0');
INSERT INTO `score` VALUES ('16', '11', '1', '69.0');
INSERT INTO `score` VALUES ('17', '11', '2', '79.0');
INSERT INTO `score` VALUES ('18', '11', '3', '81.0');
INSERT INTO `score` VALUES ('19', '12', '1', '64.0');
INSERT INTO `score` VALUES ('20', '12', '2', '20.0');
INSERT INTO `score` VALUES ('21', '12', '3', '0.0');
INSERT INTO `score` VALUES ('22', '13', '1', '0.0');
INSERT INTO `score` VALUES ('23', '13', '2', '63.0');
INSERT INTO `score` VALUES ('24', '13', '3', '81.0');
INSERT INTO `score` VALUES ('25', '14', '1', '74.0');
INSERT INTO `score` VALUES ('26', '14', '3', '62.0');
INSERT INTO `student` VALUES ('1', '汤世佳', '女', '1', '湖北省黄石团城山公共厕所', '123@qq.com');
INSERT INTO `student` VALUES ('10', '姚宝柱', '女', '3', 'xxxxxxxxxxx', '7896@qq.com');
INSERT INTO `student` VALUES ('11', '姜烨炜', '女', '2', 'xxxxxxxxxxx', 'AAA');
INSERT INTO `student` VALUES ('12', '邱峰', '女', '3', 'xxxxxxxxxxx', null);
INSERT INTO `student` VALUES ('13', '张迈', '女', '2', 'xxxxxxxxxxx', null);
INSERT INTO `student` VALUES ('14', '卢子根', '女', '3', 'xxxxxxxxxxx', null);
INSERT INTO `student` VALUES ('15', '龙雪刚', '女', '4', 'xxxxxxxxxxx', null);
INSERT INTO `student` VALUES ('16', '张三丰', '男', '1', '比比xxxx', 'email');
INSERT INTO `student` VALUES ('17', '黄蓉', '男', '2', '华山', '还没有');
INSERT INTO `student` VALUES ('2', '张李洋', '女', '3', '湖北省黄石团城山义诚天桥下', null);
INSERT INTO `student` VALUES ('3', '甘江来', '妖', '2', '广西省不知道市', '789@qq.com');
INSERT INTO `student` VALUES ('4', '侯杰', '男', '2', '广西省不知道市', null);
INSERT INTO `student` VALUES ('5', '甘思泉', '男', '3', 'xxxxxxxxxxx', '7891@qq.com');
INSERT INTO `student` VALUES ('6', '康元昊', '男', '4', 'xxxxxxxxxxx', '7892@qq.com');
INSERT INTO `student` VALUES ('7', '胡振园', '女', '2', 'xxxxxxxxxxx', '7893@qq.com');
INSERT INTO `student` VALUES ('8', '孙爽', '男', '2', 'xxxxxxxxxxx', '7894@qq.com');
INSERT INTO `student` VALUES ('9', '唐奕', '男', '3', 'xxxxxxxxxxx', '7895@qq.com');
