/*
 Navicat Premium Data Transfer

 Source Server         : 本地数据库
 Source Server Type    : MySQL
 Source Server Version : 80025
 Source Host           : localhost:3306
 Source Schema         : communitysadministrativesystem

 Target Server Type    : MySQL
 Target Server Version : 80025
 File Encoding         : 65001

 Date: 19/02/2025 17:35:42
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for adminuser
-- ----------------------------
DROP TABLE IF EXISTS `adminuser`;
CREATE TABLE `adminuser` (
  `aid` int NOT NULL AUTO_INCREMENT,
  `aaccount` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `apassword` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `aname` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `asex` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `aage` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `aphone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `addr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`aid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of adminuser
-- ----------------------------
BEGIN;
INSERT INTO `adminuser` (`aid`, `aaccount`, `apassword`, `aname`, `asex`, `aage`, `aphone`, `addr`) VALUES (1, 'admin', '111111', '管理员1', '男', '21', '13669586409', 'sad');
INSERT INTO `adminuser` (`aid`, `aaccount`, `apassword`, `aname`, `asex`, `aage`, `aphone`, `addr`) VALUES (2, 'admin1', '123123', 'admin1', '男', '12', '1231248712', '123');
INSERT INTO `adminuser` (`aid`, `aaccount`, `apassword`, `aname`, `asex`, `aage`, `aphone`, `addr`) VALUES (3, 'admin3', '123123123', 'admin3', '女', '22', '1231248712', 'asd');
INSERT INTO `adminuser` (`aid`, `aaccount`, `apassword`, `aname`, `asex`, `aage`, `aphone`, `addr`) VALUES (4, 'admin4', '123', 'admin4', '男', '21', '1231248712', 'asdf');
INSERT INTO `adminuser` (`aid`, `aaccount`, `apassword`, `aname`, `asex`, `aage`, `aphone`, `addr`) VALUES (5, 'admin5', '123', 'admin5', '男', '19', '1231248712', 'fas');
INSERT INTO `adminuser` (`aid`, `aaccount`, `apassword`, `aname`, `asex`, `aage`, `aphone`, `addr`) VALUES (6, 'admin6', '123', 'admin6', '女', '23', '1231248712', 'saf');
INSERT INTO `adminuser` (`aid`, `aaccount`, `apassword`, `aname`, `asex`, `aage`, `aphone`, `addr`) VALUES (7, 'admin7', '123', 'admin7', '男', '45', '1231248712', 'saf');
INSERT INTO `adminuser` (`aid`, `aaccount`, `apassword`, `aname`, `asex`, `aage`, `aphone`, `addr`) VALUES (8, 'admin8', '11111111', 'admin8', '女', '34', '1231248712', 'zxc');
INSERT INTO `adminuser` (`aid`, `aaccount`, `apassword`, `aname`, `asex`, `aage`, `aphone`, `addr`) VALUES (14, '123123', '123123', '123123', '男', '123', '123123', '123123');
COMMIT;

-- ----------------------------
-- Table structure for announcement
-- ----------------------------
DROP TABLE IF EXISTS `announcement`;
CREATE TABLE `announcement` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of announcement
-- ----------------------------
BEGIN;
INSERT INTO `announcement` (`id`, `content`) VALUES (1, '暂无公告');
COMMIT;

-- ----------------------------
-- Table structure for charge
-- ----------------------------
DROP TABLE IF EXISTS `charge`;
CREATE TABLE `charge` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT '户主姓名',
  `metre` double DEFAULT NULL COMMENT '房间平米',
  `phone` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '联系电话',
  `username` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT '业主姓名',
  `status` varchar(20) COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态',
  `sdate` datetime NOT NULL COMMENT '账单生成时间',
  `rdate` datetime DEFAULT NULL COMMENT '支付时间',
  `tcost` double NOT NULL COMMENT '应收金额',
  `scost` double DEFAULT '0' COMMENT '实收金额',
  `smemo` text COLLATE utf8mb4_general_ci COMMENT '详情说明',
  `custom_id` int NOT NULL COMMENT '业主ID',
  `bill_month` varchar(7) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '账单月份(yyyy-MM)',
  PRIMARY KEY (`id`),
  KEY `fk_charge_custom` (`custom_id`),
  CONSTRAINT `fk_charge_custom` FOREIGN KEY (`custom_id`) REFERENCES `custom` (`oid`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of charge
-- ----------------------------
BEGIN;
INSERT INTO `charge` (`id`, `name`, `metre`, `phone`, `username`, `status`, `sdate`, `rdate`, `tcost`, `scost`, `smemo`, `custom_id`, `bill_month`) VALUES (24, '张三', NULL, NULL, '张三', 'paid', '2025-02-14 16:10:37', '2025-02-14 16:10:55', 50000, 50000, '123', 1, '2025-02');
INSERT INTO `charge` (`id`, `name`, `metre`, `phone`, `username`, `status`, `sdate`, `rdate`, `tcost`, `scost`, `smemo`, `custom_id`, `bill_month`) VALUES (25, '张三', NULL, NULL, '张三', 'paid', '2025-02-14 17:50:06', '2025-02-14 17:50:25', 123, 123, '213', 1, '2025-02');
INSERT INTO `charge` (`id`, `name`, `metre`, `phone`, `username`, `status`, `sdate`, `rdate`, `tcost`, `scost`, `smemo`, `custom_id`, `bill_month`) VALUES (26, '张三', NULL, NULL, '张三', 'paid', '2025-02-14 17:55:38', '2025-02-14 20:37:18', 123, 123, '123', 1, '2025-02');
INSERT INTO `charge` (`id`, `name`, `metre`, `phone`, `username`, `status`, `sdate`, `rdate`, `tcost`, `scost`, `smemo`, `custom_id`, `bill_month`) VALUES (27, '张三', NULL, NULL, '张三', 'paid', '2025-02-14 20:36:59', '2025-02-14 20:37:12', 123, 123, '123', 1, '2025-02');
INSERT INTO `charge` (`id`, `name`, `metre`, `phone`, `username`, `status`, `sdate`, `rdate`, `tcost`, `scost`, `smemo`, `custom_id`, `bill_month`) VALUES (28, '张三', NULL, NULL, '张三', 'paid', '2025-02-14 20:43:55', '2025-02-14 20:44:15', 123, 123, '123', 1, '2025-02');
INSERT INTO `charge` (`id`, `name`, `metre`, `phone`, `username`, `status`, `sdate`, `rdate`, `tcost`, `scost`, `smemo`, `custom_id`, `bill_month`) VALUES (29, '张三', NULL, NULL, '张三', 'unpaid', '2025-02-15 17:08:42', NULL, 123, NULL, '123', 1, '2025-02');
INSERT INTO `charge` (`id`, `name`, `metre`, `phone`, `username`, `status`, `sdate`, `rdate`, `tcost`, `scost`, `smemo`, `custom_id`, `bill_month`) VALUES (30, '张三', NULL, NULL, '张三', 'paid', '2025-02-15 17:13:07', '2025-02-16 13:39:11', 123, 123, '123', 1, '2025-02');
INSERT INTO `charge` (`id`, `name`, `metre`, `phone`, `username`, `status`, `sdate`, `rdate`, `tcost`, `scost`, `smemo`, `custom_id`, `bill_month`) VALUES (31, '111111', NULL, NULL, '111111', 'unpaid', '2025-02-16 21:47:55', NULL, 123, NULL, '123', 5, '2025-02');
COMMIT;

-- ----------------------------
-- Table structure for custom
-- ----------------------------
DROP TABLE IF EXISTS `custom`;
CREATE TABLE `custom` (
  `oid` int NOT NULL AUTO_INCREMENT,
  `oaccount` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `opassword` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `oname` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `osex` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `oage` int NOT NULL,
  `ohousenum` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `house_area` double DEFAULT NULL COMMENT '房屋面积(平方米)',
  `oparkingspacesnum` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ocarnum` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `oannualrent` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `opaymenttime` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `opendingrepairs` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ophone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '联系电话',
  PRIMARY KEY (`oid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of custom
-- ----------------------------
BEGIN;
INSERT INTO `custom` (`oid`, `oaccount`, `opassword`, `oname`, `osex`, `oage`, `ohousenum`, `house_area`, `oparkingspacesnum`, `ocarnum`, `oannualrent`, `opaymenttime`, `opendingrepairs`, `ophone`) VALUES (1, 'zhangsan', '1234567', '张三', '男', 27, 'A-602', 120, '无', '无', '12000', '2022-02-01 00:00:00', '无', '13800138001');
INSERT INTO `custom` (`oid`, `oaccount`, `opassword`, `oname`, `osex`, `oage`, `ohousenum`, `house_area`, `oparkingspacesnum`, `ocarnum`, `oannualrent`, `opaymenttime`, `opendingrepairs`, `ophone`) VALUES (2, 'lisi', '111111', '李四', '男', 21, '312', 90, '123', '123', '132', '2021-01-01 00:00:00', '无', '13800138002');
INSERT INTO `custom` (`oid`, `oaccount`, `opassword`, `oname`, `osex`, `oage`, `ohousenum`, `house_area`, `oparkingspacesnum`, `ocarnum`, `oannualrent`, `opaymenttime`, `opendingrepairs`, `ophone`) VALUES (3, 'wangwu', '123456', '王五', '男', 23, '123', 85, '123', '123', '123', '2021-01-11 00:00:00', '无', '13800138003');
INSERT INTO `custom` (`oid`, `oaccount`, `opassword`, `oname`, `osex`, `oage`, `ohousenum`, `house_area`, `oparkingspacesnum`, `ocarnum`, `oannualrent`, `opaymenttime`, `opendingrepairs`, `ophone`) VALUES (5, '111111', '111111', '111111', '1111', 111, '111', 111, '111', '111', '111', '111', '111', '111111');
INSERT INTO `custom` (`oid`, `oaccount`, `opassword`, `oname`, `osex`, `oage`, `ohousenum`, `house_area`, `oparkingspacesnum`, `ocarnum`, `oannualrent`, `opaymenttime`, `opendingrepairs`, `ophone`) VALUES (6, '123123', '111111', '123123', '1', 123, '123', 12, '12', '12', '12', '12', 'null', '123123');
COMMIT;

-- ----------------------------
-- Table structure for feedback
-- ----------------------------
DROP TABLE IF EXISTS `feedback`;
CREATE TABLE `feedback` (
  `id` int NOT NULL AUTO_INCREMENT,
  `person` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `itime` datetime NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `conductor` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `memo` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of feedback
-- ----------------------------
BEGIN;
INSERT INTO `feedback` (`id`, `person`, `type`, `itime`, `status`, `conductor`, `content`, `memo`, `user_id`) VALUES (1, '张三', '维修请求', '2023-10-01 10:00:00', '处理中', '李四', '我家的窗户坏了', '请尽快处理', 1);
INSERT INTO `feedback` (`id`, `person`, `type`, `itime`, `status`, `conductor`, `content`, `memo`, `user_id`) VALUES (2, '李四', '投诉', '2023-10-02 14:30:00', '已解决', '王五', '小区绿化需要修剪', '修剪得很满意', 1);
INSERT INTO `feedback` (`id`, `person`, `type`, `itime`, `status`, `conductor`, `content`, `memo`, `user_id`) VALUES (4, 'Hello', '服务', '2025-01-06 00:00:00', '正在处理', '管理员1', '服务太差', '无', 1);
INSERT INTO `feedback` (`id`, `person`, `type`, `itime`, `status`, `conductor`, `content`, `memo`, `user_id`) VALUES (5, '张三', '保安不开门', '2025-02-16 00:00:00', '已处理', '管理员1', '123312', '好的', 1);
INSERT INTO `feedback` (`id`, `person`, `type`, `itime`, `status`, `conductor`, `content`, `memo`, `user_id`) VALUES (6, '张三', '123', '2025-02-16 00:00:00', '未处理', '管理员1', '123', '好的', 1);
INSERT INTO `feedback` (`id`, `person`, `type`, `itime`, `status`, `conductor`, `content`, `memo`, `user_id`) VALUES (7, '张三', '保安不开门', '2025-02-16 00:00:00', '未处理', '管理员1', '123123', '好的', 1);
INSERT INTO `feedback` (`id`, `person`, `type`, `itime`, `status`, `conductor`, `content`, `memo`, `user_id`) VALUES (8, '张三', '123123123', '2025-02-16 00:00:00', '未处理', NULL, '123123231', NULL, NULL);
INSERT INTO `feedback` (`id`, `person`, `type`, `itime`, `status`, `conductor`, `content`, `memo`, `user_id`) VALUES (9, '张三', '123123123', '2025-02-16 00:00:00', '已处理', '管理员1', '132123123123', '', 1);
INSERT INTO `feedback` (`id`, `person`, `type`, `itime`, `status`, `conductor`, `content`, `memo`, `user_id`) VALUES (11, '张三', '保安不开门', '2025-02-18 00:00:00', '未处理', NULL, '123312', NULL, 1);
COMMIT;

-- ----------------------------
-- Table structure for house
-- ----------------------------
DROP TABLE IF EXISTS `house`;
CREATE TABLE `house` (
  `id` int NOT NULL AUTO_INCREMENT,
  `num` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `dep` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `area` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sell` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `unit` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `floor` int NOT NULL,
  `direction` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `memo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `customId` int DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `customid` (`customId`) USING BTREE,
  CONSTRAINT `house_ibfk_1` FOREIGN KEY (`customId`) REFERENCES `custom` (`oid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of house
-- ----------------------------
BEGIN;
INSERT INTO `house` (`id`, `num`, `dep`, `type`, `area`, `sell`, `unit`, `floor`, `direction`, `memo`, `customId`, `status`) VALUES (8, '102', '1', '独栋', 'A区', '已售', 'A', 1, '东', '备注', 2, NULL);
INSERT INTO `house` (`id`, `num`, `dep`, `type`, `area`, `sell`, `unit`, `floor`, `direction`, `memo`, `customId`, `status`) VALUES (12, '1223', '123', '独栋', '123', '已售', '123', 12, '南', '111', 1, NULL);
COMMIT;

-- ----------------------------
-- Table structure for image
-- ----------------------------
DROP TABLE IF EXISTS `image`;
CREATE TABLE `image` (
  `id` int NOT NULL AUTO_INCREMENT,
  `new_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `old_name` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  `custom_id` int NOT NULL,
  `image_type` varchar(50) DEFAULT NULL,
  `file_size` bigint DEFAULT NULL,
  `status` varchar(20) DEFAULT 'pending',
  `upload_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `review_comment` varchar(255) DEFAULT NULL,
  `approved_time` datetime DEFAULT NULL COMMENT '审核通过时间',
  PRIMARY KEY (`id`),
  KEY `custom_id` (`custom_id`),
  CONSTRAINT `image_ibfk_1` FOREIGN KEY (`custom_id`) REFERENCES `custom` (`oid`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of image
-- ----------------------------
BEGIN;
INSERT INTO `image` (`id`, `new_name`, `old_name`, `path`, `custom_id`, `image_type`, `file_size`, `status`, `upload_time`, `review_comment`, `approved_time`) VALUES (28, 'deac478f-6c80-4eb8-bc65-d6670396abe7_b2g.jpg', 'b2g.jpg', '/uploads/deac478f-6c80-4eb8-bc65-d6670396abe7_b2g.jpg', 1, 'history', NULL, 'approved', '2025-02-13 22:06:00', '审核通过', '2025-02-13 22:51:57');
INSERT INTO `image` (`id`, `new_name`, `old_name`, `path`, `custom_id`, `image_type`, `file_size`, `status`, `upload_time`, `review_comment`, `approved_time`) VALUES (30, 'c18e031d-c4a5-440f-a0dd-5e7fec8fe27a_star-off.png', 'star-off.png', '/uploads/c18e031d-c4a5-440f-a0dd-5e7fec8fe27a_star-off.png', 1, 'history', NULL, 'approved', '2025-02-13 22:11:02', '审核通过', '2025-02-13 22:51:55');
INSERT INTO `image` (`id`, `new_name`, `old_name`, `path`, `custom_id`, `image_type`, `file_size`, `status`, `upload_time`, `review_comment`, `approved_time`) VALUES (31, '18744680-cc58-409a-a609-a3595105f99c_logo.png', 'logo.png', '/uploads/18744680-cc58-409a-a609-a3595105f99c_logo.png', 1, 'history', NULL, 'approved', '2025-02-13 22:28:45', '审核通过', '2025-02-13 22:51:53');
INSERT INTO `image` (`id`, `new_name`, `old_name`, `path`, `custom_id`, `image_type`, `file_size`, `status`, `upload_time`, `review_comment`, `approved_time`) VALUES (32, '8708829d-7165-4455-8643-5744a9bdf2de_star-half.png', 'star-half.png', '/uploads/8708829d-7165-4455-8643-5744a9bdf2de_star-half.png', 1, 'history', NULL, 'approved', '2025-02-13 22:32:21', '审核通过', '2025-02-13 22:51:48');
INSERT INTO `image` (`id`, `new_name`, `old_name`, `path`, `custom_id`, `image_type`, `file_size`, `status`, `upload_time`, `review_comment`, `approved_time`) VALUES (33, 'd145d89c-b605-4629-9360-d284a16874c1_bg3.jpg', 'bg3.jpg', '/uploads/d145d89c-b605-4629-9360-d284a16874c1_bg3.jpg', 1, NULL, NULL, 'rejected', '2025-02-13 22:52:17', '审核拒绝', '2025-02-13 23:31:42');
INSERT INTO `image` (`id`, `new_name`, `old_name`, `path`, `custom_id`, `image_type`, `file_size`, `status`, `upload_time`, `review_comment`, `approved_time`) VALUES (34, 'ab004ee1-cbe0-4224-8147-581999069d38_bg3.jpg', 'bg3.jpg', '/uploads/ab004ee1-cbe0-4224-8147-581999069d38_bg3.jpg', 1, NULL, NULL, 'rejected', '2025-02-13 23:22:08', '审核拒绝', '2025-02-13 23:31:40');
INSERT INTO `image` (`id`, `new_name`, `old_name`, `path`, `custom_id`, `image_type`, `file_size`, `status`, `upload_time`, `review_comment`, `approved_time`) VALUES (35, '6c1f8c6d-e23f-4413-8708-b86a0697fc7b_logo20.png', 'logo20.png', '/uploads/6c1f8c6d-e23f-4413-8708-b86a0697fc7b_logo20.png', 1, NULL, NULL, 'rejected', '2025-02-13 23:31:27', '审核拒绝', '2025-02-13 23:31:37');
INSERT INTO `image` (`id`, `new_name`, `old_name`, `path`, `custom_id`, `image_type`, `file_size`, `status`, `upload_time`, `review_comment`, `approved_time`) VALUES (36, '288491cd-0c5a-4e9e-b424-b11e6b0b351f_logo.png', 'logo.png', '/uploads/288491cd-0c5a-4e9e-b424-b11e6b0b351f_logo.png', 1, 'history', NULL, 'approved', '2025-02-13 23:37:05', '审核通过', '2025-02-13 23:37:25');
INSERT INTO `image` (`id`, `new_name`, `old_name`, `path`, `custom_id`, `image_type`, `file_size`, `status`, `upload_time`, `review_comment`, `approved_time`) VALUES (37, '143215c3-74a2-4739-9241-f0556d803569_star-half.png', 'star-half.png', '/uploads/143215c3-74a2-4739-9241-f0556d803569_star-half.png', 1, 'history', NULL, 'approved', '2025-02-13 23:42:18', '审核通过', '2025-02-13 23:42:31');
INSERT INTO `image` (`id`, `new_name`, `old_name`, `path`, `custom_id`, `image_type`, `file_size`, `status`, `upload_time`, `review_comment`, `approved_time`) VALUES (38, '23aa31ab-332e-4369-9646-56d72f323c65_thumb.png', 'thumb.png', '/uploads/23aa31ab-332e-4369-9646-56d72f323c65_thumb.png', 1, 'history', NULL, 'approved', '2025-02-13 23:53:05', '审核通过', '2025-02-13 23:53:12');
INSERT INTO `image` (`id`, `new_name`, `old_name`, `path`, `custom_id`, `image_type`, `file_size`, `status`, `upload_time`, `review_comment`, `approved_time`) VALUES (39, 'd936de1f-a48b-452b-80ee-2ce6a01a0f55_logo.png', 'logo.png', '/uploads/d936de1f-a48b-452b-80ee-2ce6a01a0f55_logo.png', 1, 'history', NULL, 'approved', '2025-02-14 00:38:00', '审核通过', '2025-02-14 00:38:12');
INSERT INTO `image` (`id`, `new_name`, `old_name`, `path`, `custom_id`, `image_type`, `file_size`, `status`, `upload_time`, `review_comment`, `approved_time`) VALUES (40, 'aef70b85-b7ff-4d40-8298-fda0a272f9c5_favicon1.ico', 'favicon1.ico', '/uploads/aef70b85-b7ff-4d40-8298-fda0a272f9c5_favicon1.ico', 2, 'current', NULL, 'approved', '2025-02-14 13:56:38', '审核通过', '2025-02-14 13:56:46');
INSERT INTO `image` (`id`, `new_name`, `old_name`, `path`, `custom_id`, `image_type`, `file_size`, `status`, `upload_time`, `review_comment`, `approved_time`) VALUES (41, '8e97ea4a-f88d-4e06-b32b-8981b39b2147_thumb.png', 'thumb.png', '/uploads/8e97ea4a-f88d-4e06-b32b-8981b39b2147_thumb.png', 1, 'current', NULL, 'approved', '2025-02-16 13:38:37', '审核通过', '2025-02-16 21:37:00');
COMMIT;

-- ----------------------------
-- Table structure for log
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `executor` varchar(255) DEFAULT NULL,
  `executed` varchar(255) DEFAULT NULL,
  `tasks` text,
  `cost` decimal(10,2) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of log
-- ----------------------------
BEGIN;
INSERT INTO `log` (`id`, `executor`, `executed`, `tasks`, `cost`, `time`, `status`, `type`) VALUES (1, 'admin', 'admin', '登录', NULL, NULL, NULL, 'admin');
INSERT INTO `log` (`id`, `executor`, `executed`, `tasks`, `cost`, `time`, `status`, `type`) VALUES (2, 'admin', 'admin', '登录', NULL, '2025-02-15 16:10:52', 'success', 'admin');
INSERT INTO `log` (`id`, `executor`, `executed`, `tasks`, `cost`, `time`, `status`, `type`) VALUES (3, 'admin', 'admin', '登录', NULL, NULL, 'success', 'admin');
INSERT INTO `log` (`id`, `executor`, `executed`, `tasks`, `cost`, `time`, `status`, `type`) VALUES (4, 'admin', 'admin', '登录', NULL, '2025-02-15 16:30:17', 'success', 'admin');
INSERT INTO `log` (`id`, `executor`, `executed`, `tasks`, `cost`, `time`, `status`, `type`) VALUES (5, 'zhangsan', 'zhangsan', '登录', NULL, '2025-02-15 16:30:26', 'success', 'user');
INSERT INTO `log` (`id`, `executor`, `executed`, `tasks`, `cost`, `time`, `status`, `type`) VALUES (6, 'admin', 'admin', '登录', NULL, '2025-02-15 16:32:14', 'success', 'admin');
INSERT INTO `log` (`id`, `executor`, `executed`, `tasks`, `cost`, `time`, `status`, `type`) VALUES (7, 'admin', 'admin', '登录', NULL, '2025-02-15 16:32:40', 'success', 'admin');
INSERT INTO `log` (`id`, `executor`, `executed`, `tasks`, `cost`, `time`, `status`, `type`) VALUES (8, 'admin', 'admin', '登录', NULL, '2025-02-15 16:33:28', 'success', 'admin');
INSERT INTO `log` (`id`, `executor`, `executed`, `tasks`, `cost`, `time`, `status`, `type`) VALUES (9, 'admin', 'admin', '登录', NULL, '2025-02-15 16:34:45', 'success', 'admin');
INSERT INTO `log` (`id`, `executor`, `executed`, `tasks`, `cost`, `time`, `status`, `type`) VALUES (10, 'admin', 'admin', '登出', NULL, '2025-02-15 16:34:46', 'success', 'admin');
INSERT INTO `log` (`id`, `executor`, `executed`, `tasks`, `cost`, `time`, `status`, `type`) VALUES (11, 'admin', 'admin', '登录', NULL, '2025-02-15 16:36:32', 'success', 'admin');
INSERT INTO `log` (`id`, `executor`, `executed`, `tasks`, `cost`, `time`, `status`, `type`) VALUES (12, 'admin', 'admin', '查看所有管理员', NULL, '2025-02-15 16:36:39', 'success', 'admin');
INSERT INTO `log` (`id`, `executor`, `executed`, `tasks`, `cost`, `time`, `status`, `type`) VALUES (13, 'admin', 'admin', '登出', NULL, '2025-02-15 16:37:02', 'success', 'admin');
INSERT INTO `log` (`id`, `executor`, `executed`, `tasks`, `cost`, `time`, `status`, `type`) VALUES (14, 'admin', 'admin', '登录', NULL, '2025-02-15 16:39:15', 'success', 'admin');
INSERT INTO `log` (`id`, `executor`, `executed`, `tasks`, `cost`, `time`, `status`, `type`) VALUES (15, 'admin', 'admin', '查看所有管理员', NULL, '2025-02-15 16:39:16', 'success', 'admin');
INSERT INTO `log` (`id`, `executor`, `executed`, `tasks`, `cost`, `time`, `status`, `type`) VALUES (16, 'admin', '被修改管理员1', '修改管理员信息', NULL, '2025-02-15 16:39:17', 'success', 'admin');
INSERT INTO `log` (`id`, `executor`, `executed`, `tasks`, `cost`, `time`, `status`, `type`) VALUES (17, 'admin', 'admin', '查看所有管理员', NULL, '2025-02-15 16:41:44', NULL, 'admin');
INSERT INTO `log` (`id`, `executor`, `executed`, `tasks`, `cost`, `time`, `status`, `type`) VALUES (18, 'admin', '被修改管理员账号：null', '修改管理员信息', NULL, '2025-02-15 16:41:51', 'success', 'admin');
INSERT INTO `log` (`id`, `executor`, `executed`, `tasks`, `cost`, `time`, `status`, `type`) VALUES (19, 'admin', 'admin', '查看所有管理员', NULL, '2025-02-15 16:41:51', 'success', 'admin');
INSERT INTO `log` (`id`, `executor`, `executed`, `tasks`, `cost`, `time`, `status`, `type`) VALUES (20, 'admin', '被修改管理员账号：null', '修改管理员信息', NULL, '2025-02-15 16:43:19', 'success', 'admin');
INSERT INTO `log` (`id`, `executor`, `executed`, `tasks`, `cost`, `time`, `status`, `type`) VALUES (21, 'admin', 'admin', '查看所有管理员', NULL, '2025-02-15 16:43:19', 'success', 'admin');
INSERT INTO `log` (`id`, `executor`, `executed`, `tasks`, `cost`, `time`, `status`, `type`) VALUES (22, 'admin', '被修改管理员账号：15', '修改管理员信息', NULL, '2025-02-15 16:46:24', NULL, 'admin');
INSERT INTO `log` (`id`, `executor`, `executed`, `tasks`, `cost`, `time`, `status`, `type`) VALUES (23, 'admin', 'admin', '查看所有管理员', NULL, '2025-02-15 16:46:30', NULL, 'admin');
COMMIT;

-- ----------------------------
-- Table structure for maintain
-- ----------------------------
DROP TABLE IF EXISTS `maintain`;
CREATE TABLE `maintain` (
  `mid` bigint NOT NULL AUTO_INCREMENT,
  `maintainer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sdate` datetime NOT NULL,
  `thing` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `homesnumber` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `rdate` datetime DEFAULT NULL,
  `tcost` decimal(10,2) NOT NULL,
  `scost` decimal(10,2) DEFAULT NULL,
  `smemo` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `custom_id` int DEFAULT NULL,
  PRIMARY KEY (`mid`) USING BTREE,
  KEY `idx_custom_id` (`custom_id`) USING BTREE,
  CONSTRAINT `fk_custom_id` FOREIGN KEY (`custom_id`) REFERENCES `custom` (`oid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of maintain
-- ----------------------------
BEGIN;
INSERT INTO `maintain` (`mid`, `maintainer`, `sdate`, `thing`, `status`, `homesnumber`, `rdate`, `tcost`, `scost`, `smemo`, `custom_id`) VALUES (1, '张三', '2023-10-01 00:00:00', '空调故障', '已完成', '101', '2025-02-16 20:24:36', 150.00, 200.00, '空调无法制冷', 1);
INSERT INTO `maintain` (`mid`, `maintainer`, `sdate`, `thing`, `status`, `homesnumber`, `rdate`, `tcost`, `scost`, `smemo`, `custom_id`) VALUES (2, '李四', '2023-10-05 00:00:00', '水龙头漏水', '已完成', '202', '2025-02-16 00:00:00', 50.00, 250.00, '水龙头漏水严重', 2);
INSERT INTO `maintain` (`mid`, `maintainer`, `sdate`, `thing`, `status`, `homesnumber`, `rdate`, `tcost`, `scost`, `smemo`, `custom_id`) VALUES (3, '王五', '2023-10-10 00:00:00', '地板损坏', '已完成', '303', '2025-01-05 00:00:00', 200.00, 250.00, '地板有裂缝', 3);
INSERT INTO `maintain` (`mid`, `maintainer`, `sdate`, `thing`, `status`, `homesnumber`, `rdate`, `tcost`, `scost`, `smemo`, `custom_id`) VALUES (21, '张三', '2025-02-14 00:00:00', '12312321312', '已完成', '132', '2025-02-16 16:29:12', 13233.00, 200.00, '1231321', 1);
COMMIT;

-- ----------------------------
-- Table structure for notice_table
-- ----------------------------
DROP TABLE IF EXISTS `notice_table`;
CREATE TABLE `notice_table` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `pub_date` date DEFAULT NULL,
  `publisher` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of notice_table
-- ----------------------------
BEGIN;
INSERT INTO `notice_table` (`id`, `title`, `pub_date`, `publisher`, `content`) VALUES (1, '公司年会通知', '2024-12-05', '行政部1', '各位同事，公司将于 2024 年 12 月 31 日举办年会，地点在公司三楼会议室，届时将有精彩节目和丰厚奖品，欢迎大家踊跃参加。111');
INSERT INTO `notice_table` (`id`, `title`, `pub_date`, `publisher`, `content`) VALUES (2, '系统维护公告', '2024-12-15', '技术部', '为了提升系统性能，将于 2024 年 12 月 20 日 0:00 - 6:00 进行系统维护，期间部分服务将暂停使用，给您带来不便，敬请谅解。');
INSERT INTO `notice_table` (`id`, `title`, `pub_date`, `publisher`, `content`) VALUES (6, '111111222', '2025-02-12', '2211111', '111111222');
COMMIT;

-- ----------------------------
-- Table structure for operation_logs
-- ----------------------------
DROP TABLE IF EXISTS `operation_logs`;
CREATE TABLE `operation_logs` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `operator_id` int NOT NULL,
  `operator_type` varchar(10) NOT NULL COMMENT 'admin或user',
  `operator_name` varchar(50) NOT NULL,
  `operation_type` varchar(50) NOT NULL COMMENT '操作类型',
  `operation_detail` text COMMENT '详细描述',
  `operation_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(20) DEFAULT 'success' COMMENT '操作状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=397 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of operation_logs
-- ----------------------------
BEGIN;
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (1, 1, 'admin', '管理员1', '登录', '管理员 管理员1 登录系统', '2025-02-15 16:56:49', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (2, 1, 'admin', '管理员1', '查看收费记录', '管理员 管理员1 查看所有收费记录', '2025-02-15 17:06:14', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (3, 1, 'admin', '管理员1', '查看收费记录', '管理员 管理员1 查看所有收费记录', '2025-02-15 17:06:16', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (4, 1, 'admin', '管理员1', '查看收费记录', '管理员 管理员1 查看所有收费记录', '2025-02-15 17:07:02', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (5, 1, 'admin', '管理员1', '查看收费记录', '管理员 管理员1 查看所有收费记录', '2025-02-15 17:10:20', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (6, 1, 'admin', '管理员1', '查看收费记录', '管理员 管理员1 查看所有收费记录', '2025-02-15 17:10:23', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (7, 1, 'admin', '管理员1', '查看收费记录', '管理员 管理员1 查看所有收费记录', '2025-02-15 17:12:39', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (8, 1, 'admin', '管理员1', '删除收费', '管理员 管理员1 删除业主 张三 的收费项目: 张三, 金额: 1233.00', '2025-02-15 17:12:42', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (9, 1, 'admin', '管理员1', '查看收费记录', '管理员 管理员1 查看所有收费记录', '2025-02-15 17:12:42', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (10, 1, 'admin', '管理员1', '添加收费', '管理员 管理员1 为业主 张三 添加收费项目: 张三, 金额: 123.00', '2025-02-15 17:13:07', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (11, 1, 'admin', '管理员1', '查看收费记录', '管理员 管理员1 查看所有收费记录', '2025-02-15 17:13:07', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (12, 1, 'admin', '管理员1', '登录', '管理员 管理员1 登录系统', '2025-02-15 19:39:55', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (13, 1, 'admin', '管理员1', '查看管理员列表', '管理员 管理员1 查看所有管理员信息', '2025-02-15 19:39:57', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (14, 1, 'admin', '管理员1', '查看公告', '管理员 管理员1 查看所有公告', '2025-02-15 19:39:58', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (15, 1, 'admin', '管理员1', '查看反馈', '管理员 管理员1 查看所有反馈信息', '2025-02-15 19:39:58', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (16, 1, 'admin', '管理员1', '查看房屋', '管理员 管理员1 查看所有房屋信息', '2025-02-15 19:39:59', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (17, 1, 'admin', '管理员1', '查看收费记录', '管理员 管理员1 查看所有收费记录', '2025-02-15 19:40:00', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (18, 1, 'admin', '管理员1', '查看收费记录', '管理员 管理员1 查看所有收费记录', '2025-02-15 19:40:03', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (19, 1, 'admin', '管理员1', '查看房屋', '管理员 管理员1 查看所有房屋信息', '2025-02-15 19:40:04', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (20, 1, 'admin', '管理员1', '登录', '管理员 管理员1 登录系统', '2025-02-16 13:34:48', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (21, 1, 'admin', '管理员1', '查看房屋', '管理员 管理员1 查看所有房屋信息', '2025-02-16 13:35:12', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (22, 1, 'admin', '管理员1', '删除房屋', '管理员 管理员1 删除房屋ID: 7', '2025-02-16 13:35:18', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (23, 1, 'admin', '管理员1', '查看房屋', '管理员 管理员1 查看所有房屋信息', '2025-02-16 13:35:18', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (24, 1, 'admin', '管理员1', '查看业主列表', '管理员 管理员1 查看所有业主信息', '2025-02-16 13:35:48', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (25, 1, 'admin', '管理员1', '添加业主', '管理员 管理员1 访问添加业主页面', '2025-02-16 13:35:52', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (26, 1, 'admin', '管理员1', '添加业主', '管理员 管理员1 添加新业主: 11', '2025-02-16 13:36:12', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (27, 1, 'admin', '管理员1', '查看业主列表', '管理员 管理员1 查看所有业主信息', '2025-02-16 13:36:12', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (28, 1, 'admin', '管理员1', '编辑业主', '管理员 管理员1 访问编辑业主页面ID: 4', '2025-02-16 13:36:29', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (29, 1, 'admin', '管理员1', '查看业主列表', '管理员 管理员1 查看所有业主信息', '2025-02-16 13:36:53', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (30, 1, 'admin', '管理员1', '删除业主', '管理员 管理员1 删除业主ID: 4', '2025-02-16 13:36:56', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (31, 1, 'admin', '管理员1', '查看业主列表', '管理员 管理员1 查看所有业主信息', '2025-02-16 13:36:56', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (32, 1, 'admin', '管理员1', '登出', '管理员 管理员1 退出系统', '2025-02-16 13:37:07', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (33, 1, 'user', '张三', '登录', '业主 张三 登录系统', '2025-02-16 13:37:11', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (34, 1, 'user', '张三', '访问主页', '业主 张三 访问主页', '2025-02-16 13:37:11', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (35, 1, 'user', '张三', '查看公告', '业主 张三 查看所有公告', '2025-02-16 13:37:12', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (36, 1, 'user', '张三', '查看维修记录', '业主 张三 查看所有维修记录', '2025-02-16 13:37:13', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (37, 1, 'user', '张三', '添加维修记录', '业主 张三 添加维修记录', '2025-02-16 13:37:21', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (38, 1, 'user', '张三', '查看维修记录', '业主 张三 查看所有维修记录', '2025-02-16 13:37:21', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (39, 1, 'user', '张三', '删除维修记录', '业主 张三 删除维修记录ID: 25', '2025-02-16 13:37:50', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (40, 1, 'user', '张三', '查看维修记录', '业主 张三 查看所有维修记录', '2025-02-16 13:37:50', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (41, 1, 'user', '张三', '删除维修记录', '业主 张三 删除维修记录ID: 24', '2025-02-16 13:38:00', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (42, 1, 'user', '张三', '查看维修记录', '业主 张三 查看所有维修记录', '2025-02-16 13:38:00', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (43, 1, 'user', '张三', '查看业主信息', '业主 张三 查看业主ID: 1', '2025-02-16 13:38:08', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (44, 1, 'user', '张三', '查看房屋信息', '业主 张三 查看所有房屋信息', '2025-02-16 13:38:13', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (45, 1, 'user', '张三', '上传图片', '业主 张三 上传图片: /uploads/8e97ea4a-f88d-4e06-b32b-8981b39b2147_thumb.png', '2025-02-16 13:38:37', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (46, 1, 'user', '张三', '查看房屋信息', '业主 张三 查看所有房屋信息', '2025-02-16 13:38:39', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (47, 1, 'user', '张三', '查看收费记录', '业主 张三 查看所有收费记录', '2025-02-16 13:39:08', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (48, 1, 'user', '张三', '支付账单', '业主 张三 支付账单: 张三, 金额: 123.00', '2025-02-16 13:39:11', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (49, 1, 'user', '张三', '查看收费记录', '业主 张三 查看所有收费记录', '2025-02-16 13:39:12', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (50, 1, 'user', '张三', '查看钱包信息', '业主 张三 查看钱包信息', '2025-02-16 13:39:29', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (51, 1, 'user', '张三', '查看支付记录', '业主 张三 查看支付记录', '2025-02-16 13:39:36', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (52, 1, 'user', '张三', '访问主页', '业主 张三 访问主页', '2025-02-16 13:39:38', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (53, 1, 'user', '张三', '登出', '业主 张三 退出系统', '2025-02-16 13:39:45', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (54, 1, 'admin', '管理员1', '登录', '管理员 管理员1 登录系统', '2025-02-16 15:46:47', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (55, 1, 'admin', '管理员1', '查看收费记录', '管理员 管理员1 查看所有收费记录', '2025-02-16 15:46:48', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (56, 1, 'admin', '管理员1', '查看业主列表', '管理员 管理员1 查看所有业主信息', '2025-02-16 15:46:49', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (57, 1, 'admin', '管理员1', '查看房屋', '管理员 管理员1 查看所有房屋信息', '2025-02-16 15:46:51', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (58, 1, 'admin', '管理员1', '查看收费记录', '管理员 管理员1 查看所有收费记录', '2025-02-16 15:46:51', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (59, 1, 'admin', '管理员1', '查看公告', '管理员 管理员1 查看所有公告', '2025-02-16 16:11:54', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (60, 1, 'admin', '管理员1', '修改公告', '管理员 管理员1 修改公告: 公司年会通知', '2025-02-16 16:11:59', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (61, 1, 'admin', '管理员1', '查看公告', '管理员 管理员1 查看所有公告', '2025-02-16 16:11:59', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (62, 1, 'user', '张三', '编辑维修', '业主 张三 编辑维修申请: 12312321312', '2025-02-16 16:29:04', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (63, 1, 'user', '张三', '完成维修', '业主 张三 完成维修申请: 12312321312', '2025-02-16 16:29:12', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (64, 1, 'admin', '管理员1', '查看公告', '管理员 管理员1 查看所有公告', '2025-02-16 16:29:29', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (65, 1, 'admin', '管理员1', '修改公告', '管理员 管理员1 修改公告: 111111222', '2025-02-16 16:29:35', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (66, 1, 'admin', '管理员1', '查看公告', '管理员 管理员1 查看所有公告', '2025-02-16 16:29:35', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (67, 1, 'admin', '管理员1', '查看反馈', '管理员 管理员1 查看所有反馈信息', '2025-02-16 16:29:55', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (68, 1, 'admin', '管理员1', '查看反馈', '管理员 管理员1 查看所有反馈信息', '2025-02-16 16:30:43', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (69, 1, 'admin', '管理员1', '登出', '管理员 管理员1 退出系统', '2025-02-16 16:40:19', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (70, 1, 'user', '张三', '登录', '业主 张三 登录系统', '2025-02-16 16:40:24', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (71, 1, 'user', '张三', '访问主页', '业主 张三 访问主页', '2025-02-16 16:40:24', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (72, 1, 'user', '张三', '查看公告', '业主 张三 查看所有公告', '2025-02-16 16:40:29', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (73, 1, 'user', '张三', '查看维修记录', '业主 张三 查看所有维修记录', '2025-02-16 16:40:30', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (74, 1, 'user', '张三', '查看业主信息', '业主 张三 查看业主ID: 1', '2025-02-16 16:40:30', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (75, 1, 'user', '张三', '查看房屋信息', '业主 张三 查看所有房屋信息', '2025-02-16 16:40:31', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (76, 1, 'user', '张三', '查看业主信息', '业主 张三 查看业主ID: 1', '2025-02-16 16:40:32', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (77, 1, 'user', '张三', '查看房屋信息', '业主 张三 查看所有房屋信息', '2025-02-16 16:40:33', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (78, 1, 'user', '张三', '查看收费记录', '业主 张三 查看所有收费记录', '2025-02-16 16:40:33', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (79, 1, 'user', '张三', '查看钱包信息', '业主 张三 查看钱包信息', '2025-02-16 16:40:34', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (80, 1, 'user', '张三', '查看钱包信息', '业主 张三 查看钱包信息', '2025-02-16 16:50:21', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (81, 1, 'user', '张三', '查看钱包信息', '业主 张三 查看钱包信息', '2025-02-16 16:50:22', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (82, 1, 'user', '张三', '查看钱包信息', '业主 张三 查看钱包信息', '2025-02-16 16:50:23', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (83, 1, 'user', '张三', '查看钱包信息', '业主 张三 查看钱包信息', '2025-02-16 16:50:23', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (84, 1, 'user', '张三', '查看钱包信息', '业主 张三 查看钱包信息', '2025-02-16 16:50:23', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (85, 1, 'user', '张三', '查看公告', '业主 张三 查看所有公告', '2025-02-16 16:50:24', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (86, 1, 'user', '张三', '访问主页', '业主 张三 访问主页', '2025-02-16 16:50:24', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (87, 1, 'user', '张三', '查看反馈信息', '业主 张三 查看支付记录', '2025-02-16 16:50:25', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (88, 1, 'user', '张三', '查看反馈信息', '业主 张三 查看支付记录', '2025-02-16 17:00:53', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (89, 1, 'user', '张三', '添加反馈信息', '业主 张三添加反馈', '2025-02-16 17:01:21', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (90, 1, 'user', '张三', '查看反馈信息', '业主 张三 查看支付记录', '2025-02-16 17:01:21', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (91, 1, 'user', '张三', '查看反馈信息', '业主 张三 查看支付记录', '2025-02-16 17:02:01', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (92, 1, 'user', '张三', '查看反馈信息', '业主 张三 查看支付记录', '2025-02-16 17:02:02', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (93, 1, 'user', '张三', '查看反馈信息', '业主 张三 查看支付记录', '2025-02-16 17:02:02', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (94, 1, 'user', '张三', '登出', '业主 张三 退出系统', '2025-02-16 17:02:04', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (95, 1, 'admin', '管理员1', '登录', '管理员 管理员1 登录系统', '2025-02-16 17:02:07', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (96, 1, 'admin', '管理员1', '查看反馈', '管理员 管理员1 查看所有反馈', '2025-02-16 17:03:14', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (97, 1, 'admin', '管理员1', '处理反馈', '管理员 管理员1 处理业主 张三 的反馈: 123312, 状态: 已处理', '2025-02-16 17:03:23', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (98, 1, 'admin', '管理员1', '查看反馈', '管理员 管理员1 查看所有反馈', '2025-02-16 17:03:23', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (99, 1, 'admin', '管理员1', '登出', '管理员 管理员1 退出系统', '2025-02-16 17:03:26', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (100, 1, 'user', '张三', '登录', '业主 张三 登录系统', '2025-02-16 17:03:34', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (101, 1, 'user', '张三', '访问主页', '业主 张三 访问主页', '2025-02-16 17:03:34', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (102, 1, 'user', '张三', '查看反馈信息', '业主 张三 查看支付记录', '2025-02-16 17:03:35', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (103, 1, 'user', '张三', '添加反馈信息', '业主 张三添加反馈', '2025-02-16 17:03:51', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (104, 1, 'user', '张三', '查看反馈信息', '业主 张三 查看支付记录', '2025-02-16 17:03:51', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (105, 1, 'user', '张三', '查看反馈信息', '业主 张三 查看支付记录', '2025-02-16 17:03:54', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (106, 1, 'user', '张三', '查看公告', '业主 张三 查看所有公告', '2025-02-16 17:03:55', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (107, 1, 'user', '张三', '访问主页', '业主 张三 访问主页', '2025-02-16 17:03:55', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (108, 1, 'user', '张三', '查看反馈信息', '业主 张三 查看支付记录', '2025-02-16 17:03:56', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (109, 1, 'user', '张三', '查看反馈信息', '业主 张三 查看支付记录', '2025-02-16 17:09:56', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (110, 1, 'user', '张三', '添加反馈信息', '业主 张三添加反馈', '2025-02-16 17:10:03', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (111, 1, 'user', '张三', '查看反馈信息', '业主 张三 查看支付记录', '2025-02-16 17:10:03', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (112, 1, 'user', '张三', '查看反馈信息', '业主 张三 查看支付记录', '2025-02-16 17:10:09', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (113, 1, 'user', '张三', '查看反馈信息', '业主 张三 查看支付记录', '2025-02-16 17:10:10', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (114, 1, 'user', '张三', '添加反馈信息', '业主 张三添加反馈', '2025-02-16 17:10:37', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (115, 1, 'user', '张三', '查看反馈信息', '业主 张三 查看支付记录', '2025-02-16 17:10:37', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (116, 1, 'user', '张三', '添加反馈信息', '业主 张三添加反馈', '2025-02-16 17:11:09', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (117, 1, 'user', '张三', '查看反馈信息', '业主 张三 查看支付记录', '2025-02-16 17:11:09', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (118, 1, 'user', '张三', '添加反馈信息', '业主 张三添加反馈', '2025-02-16 17:12:41', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (119, 1, 'user', '张三', '查看反馈信息', '业主 张三 查看支付记录', '2025-02-16 17:12:41', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (120, 1, 'user', '张三', '查看维修记录', '业主 张三 查看所有维修记录', '2025-02-16 17:13:04', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (121, 1, 'user', '张三', '查看房屋信息', '业主 张三 查看所有房屋信息', '2025-02-16 17:13:08', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (122, 1, 'user', '张三', '查看收费记录', '业主 张三 查看所有收费记录', '2025-02-16 17:13:10', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (123, 1, 'user', '张三', '查看钱包信息', '业主 张三 查看钱包信息', '2025-02-16 17:13:11', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (124, 1, 'user', '张三', '查看支付记录', '业主 张三 查看支付记录', '2025-02-16 17:13:13', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (125, 1, 'user', '张三', '访问主页', '业主 张三 访问主页', '2025-02-16 17:13:16', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (126, 1, 'user', '张三', '登出', '业主 张三 退出系统', '2025-02-16 17:13:18', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (127, 1, 'admin', '管理员1', '登录', '管理员 管理员1 登录系统', '2025-02-16 17:13:21', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (128, 1, 'admin', '管理员1', '查看管理员列表', '管理员 管理员1 查看所有管理员信息', '2025-02-16 17:13:22', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (129, 1, 'admin', '管理员1', '编辑管理员', '管理员 管理员1 修改管理员ID: 1 的信息', '2025-02-16 17:13:23', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (130, 1, 'user', '张三', '编辑维修', '业主 张三 编辑维修申请: 空调故障', '2025-02-16 17:13:46', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (131, 1, 'admin', '管理员1', '查看公告', '管理员 管理员1 查看所有公告', '2025-02-16 17:13:55', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (132, 1, 'admin', '管理员1', '查看日志', '管理员 管理员1 查看所有日志', '2025-02-16 17:32:53', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (133, 1, 'admin', '管理员1', '查看房屋', '管理员 管理员1 查看所有房屋信息', '2025-02-16 17:36:12', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (134, 1, 'admin', '管理员1', '查看日志', '管理员 管理员1 查看所有日志', '2025-02-16 17:47:02', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (135, 1, 'admin', '管理员1', '登录', '管理员 管理员1 登录系统', '2025-02-16 17:57:33', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (136, 1, 'admin', '管理员1', '登录', '管理员 管理员1 登录系统', '2025-02-16 18:39:35', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (137, 1, 'admin', '管理员1', '登录', '管理员 管理员1 登录系统', '2025-02-16 18:50:52', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (138, 1, 'admin', '管理员1', '登录', '管理员 管理员1 登录系统', '2025-02-16 19:00:00', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (139, 1, 'admin', '管理员1', '查看管理员列表', '管理员 管理员1 查看所有管理员信息', '2025-02-16 19:00:01', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (140, 1, 'admin', '管理员1', '登录', '管理员 管理员1 登录系统', '2025-02-16 19:06:19', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (141, 1, 'admin', '管理员1', '查看业主列表', '管理员 管理员1 查看所有业主信息', '2025-02-16 19:14:05', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (142, 1, 'admin', '管理员1', '编辑业主', '管理员 管理员1 访问编辑业主页面ID: 1', '2025-02-16 19:14:06', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (143, 1, 'admin', '管理员1', '查看公告', '管理员 管理员1 查看所有公告', '2025-02-16 19:14:10', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (144, 1, 'admin', '管理员1', '查看管理员列表', '管理员 管理员1 查看所有管理员信息', '2025-02-16 19:14:13', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (145, 1, 'admin', '管理员1', '查看房屋', '管理员 管理员1 查看所有房屋信息', '2025-02-16 19:14:13', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (146, 1, 'admin', '管理员1', '查看反馈', '管理员 管理员1 查看所有反馈', '2025-02-16 19:14:15', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (147, 1, 'admin', '管理员1', '查看业主列表', '管理员 管理员1 查看所有业主信息', '2025-02-16 19:14:15', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (148, 1, 'admin', '管理员1', '编辑业主', '管理员 管理员1 访问编辑业主页面ID: 1', '2025-02-16 19:14:17', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (149, 1, 'admin', '管理员1', '查看业主列表', '管理员 管理员1 查看所有业主信息', '2025-02-16 19:14:24', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (150, 1, 'admin', '管理员1', '登录', '管理员 管理员1 登录系统', '2025-02-16 20:23:14', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (151, 1, 'admin', '管理员1', '查看管理员列表', '管理员 管理员1 查看所有管理员信息', '2025-02-16 20:23:56', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (152, 1, 'admin', '管理员1', '编辑管理员', '管理员 管理员1 修改管理员ID: 1 的信息', '2025-02-16 20:23:58', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (153, 1, 'admin', '管理员1', '编辑管理员', '管理员 管理员1 修改管理员ID: 1 的信息', '2025-02-16 20:24:05', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (154, 1, 'admin', '管理员1', '查看管理员列表', '管理员 管理员1 查看所有管理员信息', '2025-02-16 20:24:05', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (155, 1, 'admin', '管理员1', '登出', '管理员 管理员1 退出系统', '2025-02-16 20:24:10', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (156, 1, 'admin', '管理员1', '登录', '管理员 管理员1 登录系统', '2025-02-16 20:24:17', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (157, 2, 'user', '李四', '编辑维修', '业主 李四 编辑维修申请: 水龙头漏水', '2025-02-16 20:24:27', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (158, 1, 'user', '张三', '完成维修', '业主 张三 完成维修申请: 空调故障', '2025-02-16 20:24:36', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (159, 1, 'admin', '管理员1', '查看公告', '管理员 管理员1 查看所有公告', '2025-02-16 20:34:58', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (160, 1, 'admin', '管理员1', '查看反馈', '管理员 管理员1 查看所有反馈', '2025-02-16 20:35:02', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (161, 1, 'admin', '管理员1', '处理反馈', '管理员 管理员1 处理业主 张三 的反馈: 123, 状态: 未处理', '2025-02-16 20:35:13', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (162, 1, 'admin', '管理员1', '查看反馈', '管理员 管理员1 查看所有反馈', '2025-02-16 20:35:13', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (163, 1, 'admin', '管理员1', '处理反馈', '管理员 管理员1 处理业主 张三 的反馈: 123123, 状态: 未处理', '2025-02-16 20:35:17', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (164, 1, 'admin', '管理员1', '查看反馈', '管理员 管理员1 查看所有反馈', '2025-02-16 20:35:17', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (165, 1, 'admin', '管理员1', '删除反馈', '管理员 管理员1 删除业主 张三 的反馈: 123123', '2025-02-16 20:44:13', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (166, 1, 'admin', '管理员1', '查看反馈', '管理员 管理员1 查看所有反馈', '2025-02-16 20:44:13', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (167, 1, 'admin', '管理员1', '处理反馈', '管理员 管理员1 处理业主 张三 的反馈: 132123123123, 状态: 已处理', '2025-02-16 20:44:18', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (168, 1, 'admin', '管理员1', '查看反馈', '管理员 管理员1 查看所有反馈', '2025-02-16 20:44:18', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (169, 1, 'admin', '管理员1', '查看业主列表', '管理员 管理员1 查看所有业主信息', '2025-02-16 20:44:26', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (170, 1, 'admin', '管理员1', '编辑业主', '管理员 管理员1 访问编辑业主页面ID: 1', '2025-02-16 20:44:28', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (171, 1, 'admin', '管理员1', '查看业主列表', '管理员 管理员1 查看所有业主信息', '2025-02-16 21:00:50', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (172, 1, 'admin', '管理员1', '查看业主列表', '管理员 管理员1 查看所有业主信息', '2025-02-16 21:00:52', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (173, 1, 'admin', '管理员1', '查看业主列表', '管理员 管理员1 查看所有业主信息', '2025-02-16 21:00:53', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (174, 1, 'admin', '管理员1', '查看业主列表', '管理员 管理员1 查看所有业主信息', '2025-02-16 21:00:54', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (175, 1, 'admin', '管理员1', '查看业主列表', '管理员 管理员1 查看所有业主信息', '2025-02-16 21:01:46', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (176, 1, 'admin', '管理员1', '查看业主列表', '管理员 管理员1 查看所有业主信息', '2025-02-16 21:03:14', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (177, 1, 'admin', '管理员1', '查看业主列表', '管理员 管理员1 查看所有业主信息', '2025-02-16 21:03:15', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (178, 1, 'admin', '管理员1', '编辑业主', '管理员 管理员1 访问编辑业主页面ID: 2', '2025-02-16 21:03:18', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (179, 1, 'admin', '管理员1', '编辑业主', '管理员 管理员1 访问编辑业主页面ID: 2', '2025-02-16 21:05:02', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (180, 1, 'admin', '管理员1', '查看业主列表', '管理员 管理员1 查看所有业主信息', '2025-02-16 21:14:49', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (181, 1, 'admin', '管理员1', '查看房屋', '管理员 管理员1 查看所有房屋信息', '2025-02-16 21:14:50', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (182, 1, 'admin', '管理员1', '查看业主列表', '管理员 管理员1 查看所有业主信息', '2025-02-16 21:14:51', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (183, 1, 'admin', '管理员1', '查看收费记录', '管理员 管理员1 查看所有收费记录', '2025-02-16 21:14:51', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (184, 1, 'admin', '管理员1', '查看收费记录', '管理员 管理员1 查看所有收费记录', '2025-02-16 21:14:59', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (185, 1, 'admin', '管理员1', '查看房屋', '管理员 管理员1 查看所有房屋信息', '2025-02-16 21:15:00', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (186, 1, 'admin', '管理员1', '查看业主列表', '管理员 管理员1 查看所有业主信息', '2025-02-16 21:15:00', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (187, 1, 'admin', '管理员1', '编辑业主', '管理员 管理员1 访问编辑业主页面ID: 2', '2025-02-16 21:15:01', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (188, 1, 'admin', '管理员1', '查看业主列表', '管理员 管理员1 查看所有业主信息', '2025-02-16 21:17:39', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (189, 1, 'admin', '管理员1', '查看房屋', '管理员 管理员1 查看所有房屋信息', '2025-02-16 21:17:40', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (190, 1, 'admin', '管理员1', '查看业主列表', '管理员 管理员1 查看所有业主信息', '2025-02-16 21:17:41', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (191, 1, 'admin', '管理员1', '编辑业主', '管理员 管理员1 访问编辑业主页面ID: 1', '2025-02-16 21:17:42', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (192, 1, 'admin', '管理员1', '登录', '管理员 管理员1 登录系统', '2025-02-16 21:27:41', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (193, 1, 'admin', '管理员1', '查看业主列表', '管理员 管理员1 查看所有业主信息', '2025-02-16 21:27:43', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (194, 1, 'admin', '管理员1', '编辑业主', '管理员 管理员1 访问编辑业主页面ID: 2', '2025-02-16 21:27:44', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (195, 1, 'admin', '管理员1', '编辑业主', '管理员 管理员1 编辑业主ID: 2', '2025-02-16 21:27:52', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (196, 1, 'admin', '管理员1', '查看业主列表', '管理员 管理员1 查看所有业主信息', '2025-02-16 21:27:52', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (197, 1, 'admin', '管理员1', '添加业主', '管理员 管理员1 访问添加业主页面', '2025-02-16 21:27:57', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (198, 1, 'admin', '管理员1', '添加业主', '管理员 管理员1 访问添加业主页面', '2025-02-16 21:29:56', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (199, 1, 'admin', '管理员1', '添加业主', '管理员 管理员1 访问添加业主页面', '2025-02-16 21:29:59', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (200, 1, 'admin', '管理员1', '添加业主', '管理员 管理员1 访问添加业主页面', '2025-02-16 21:31:10', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (201, 1, 'admin', '管理员1', '添加业主', '管理员 管理员1 访问添加业主页面', '2025-02-16 21:31:14', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (202, 1, 'admin', '管理员1', '添加业主', '管理员 管理员1 添加新业主: 123', '2025-02-16 21:31:36', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (203, 1, 'admin', '管理员1', '查看业主列表', '管理员 管理员1 查看所有业主信息', '2025-02-16 21:31:36', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (204, 1, 'admin', '管理员1', '添加业主', '管理员 管理员1 访问添加业主页面', '2025-02-16 21:34:28', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (205, 1, 'admin', '管理员1', '添加业主', '管理员 管理员1 访问添加业主页面', '2025-02-16 21:35:09', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (206, 1, 'admin', '管理员1', '添加业主', '管理员 管理员1 添加新业主: 111111', '2025-02-16 21:35:31', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (207, 1, 'admin', '管理员1', '查看业主列表', '管理员 管理员1 查看所有业主信息', '2025-02-16 21:35:31', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (208, 1, 'admin', '管理员1', '查看业主列表', '管理员 管理员1 查看所有业主信息', '2025-02-16 21:36:39', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (209, 1, 'admin', '管理员1', '删除业主', '管理员 管理员1 删除业主ID: 4', '2025-02-16 21:36:43', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (210, 1, 'admin', '管理员1', '查看业主列表', '管理员 管理员1 查看所有业主信息', '2025-02-16 21:36:43', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (211, 1, 'admin', '管理员1', '查看房屋', '管理员 管理员1 查看所有房屋信息', '2025-02-16 21:36:46', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (212, 1, 'admin', '管理员1', '查看业主列表', '管理员 管理员1 查看所有业主信息', '2025-02-16 21:36:51', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (213, 1, 'admin', '管理员1', '查看房屋', '管理员 管理员1 查看所有房屋信息', '2025-02-16 21:36:52', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (214, 1, 'user', '张三', '审核图片', '业主 张三 审核图片: thumb.png, 状态: approved', '2025-02-16 21:37:00', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (215, 1, 'admin', '管理员1', '查看房屋', '管理员 管理员1 查看所有房屋信息', '2025-02-16 21:37:02', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (216, 1, 'user', '张三', '查看图片历史', '业主 张三 查看图片历史', '2025-02-16 21:37:04', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (217, 2, 'user', '李四', '查看图片历史', '业主 李四 查看图片历史', '2025-02-16 21:37:08', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (218, 1, 'admin', '管理员1', '查看收费记录', '管理员 管理员1 查看所有收费记录', '2025-02-16 21:37:14', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (219, 1, 'admin', '管理员1', '查看收费记录', '管理员 管理员1 查看所有收费记录', '2025-02-16 21:38:25', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (220, 1, 'admin', '管理员1', '查看收费记录', '管理员 管理员1 查看所有收费记录', '2025-02-16 21:38:26', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (221, 1, 'admin', '管理员1', '查看收费记录', '管理员 管理员1 查看所有收费记录', '2025-02-16 21:38:26', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (222, 1, 'admin', '管理员1', '查看收费记录', '管理员 管理员1 查看所有收费记录', '2025-02-16 21:45:53', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (223, 1, 'admin', '管理员1', '查看收费记录', '管理员 管理员1 查看所有收费记录', '2025-02-16 21:46:01', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (224, 1, 'admin', '管理员1', '查看管理员列表', '管理员 管理员1 查看所有管理员信息', '2025-02-16 21:46:05', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (225, 1, 'admin', '管理员1', '查看公告', '管理员 管理员1 查看所有公告', '2025-02-16 21:46:06', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (226, 1, 'admin', '管理员1', '查看业主列表', '管理员 管理员1 查看所有业主信息', '2025-02-16 21:46:07', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (227, 1, 'admin', '管理员1', '查看收费记录', '管理员 管理员1 查看所有收费记录', '2025-02-16 21:46:08', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (228, 1, 'admin', '管理员1', '查看业主列表', '管理员 管理员1 查看所有业主信息', '2025-02-16 21:46:20', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (229, 1, 'admin', '管理员1', '查看房屋', '管理员 管理员1 查看所有房屋信息', '2025-02-16 21:46:21', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (230, 1, 'admin', '管理员1', '查看收费记录', '管理员 管理员1 查看所有收费记录', '2025-02-16 21:46:22', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (231, 1, 'admin', '管理员1', '查看收费记录', '管理员 管理员1 查看所有收费记录', '2025-02-16 21:47:38', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (232, 1, 'admin', '管理员1', '搜索业主', '管理员 管理员1 搜索业主', '2025-02-16 21:47:48', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (233, 1, 'admin', '管理员1', '查看业主详情', '管理员 管理员1 查看业主ID: 5 的详情', '2025-02-16 21:47:49', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (234, 1, 'admin', '管理员1', '添加收费', '管理员 管理员1 为业主 111111 添加收费项目: 111111, 金额: 123.00', '2025-02-16 21:47:55', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (235, 1, 'admin', '管理员1', '查看收费记录', '管理员 管理员1 查看所有收费记录', '2025-02-16 21:47:55', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (236, 1, 'admin', '管理员1', '查看业主列表', '管理员 管理员1 查看所有业主信息', '2025-02-16 21:48:05', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (237, 1, 'admin', '管理员1', '查看反馈', '管理员 管理员1 查看所有反馈', '2025-02-16 21:48:06', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (238, 1, 'admin', '管理员1', '查看业主列表', '管理员 管理员1 查看所有业主信息', '2025-02-16 21:48:07', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (239, 1, 'admin', '管理员1', '查看房屋', '管理员 管理员1 查看所有房屋信息', '2025-02-16 21:48:10', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (240, 1, 'admin', '管理员1', '查看业主列表', '管理员 管理员1 查看所有业主信息', '2025-02-16 21:48:12', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (241, 1, 'admin', '管理员1', '查看收费记录', '管理员 管理员1 查看所有收费记录', '2025-02-16 21:48:15', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (242, 1, 'user', '张三', '登录', '业主 张三 登录系统', '2025-02-18 11:35:23', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (243, 1, 'user', '张三', '访问主页', '业主 张三 访问主页', '2025-02-18 11:35:23', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (244, 1, 'user', '张三', '登出', '业主 张三 退出系统', '2025-02-18 11:37:44', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (245, 1, 'user', '张三', '登录', '业主 张三 登录系统', '2025-02-18 11:37:49', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (246, 1, 'user', '张三', '访问主页', '业主 张三 访问主页', '2025-02-18 11:37:49', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (247, 1, 'user', '张三', '登录', '业主 张三 登录系统', '2025-02-18 11:38:31', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (248, 1, 'user', '张三', '访问主页', '业主 张三 访问主页', '2025-02-18 11:38:31', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (249, 1, 'user', '张三', '访问主页', '业主 张三 访问主页', '2025-02-18 11:41:20', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (250, 1, 'user', '张三', '登录', '业主 张三 登录系统', '2025-02-18 11:43:58', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (251, 1, 'user', '张三', '访问主页', '业主 张三 访问主页', '2025-02-18 11:43:58', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (252, 1, 'user', '张三', '登录', '业主 张三 登录系统', '2025-02-18 11:47:29', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (253, 1, 'user', '张三', '访问主页', '业主 张三 访问主页', '2025-02-18 11:47:29', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (254, 1, 'user', '张三', '登录', '业主 张三 登录系统', '2025-02-18 11:48:29', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (255, 1, 'user', '张三', '访问主页', '业主 张三 访问主页', '2025-02-18 11:48:29', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (256, 1, 'user', '张三', '登出', '业主 张三 退出系统', '2025-02-18 11:49:19', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (257, 1, 'user', '张三', '登录', '业主 张三 登录系统', '2025-02-18 11:49:23', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (258, 1, 'user', '张三', '访问主页', '业主 张三 访问主页', '2025-02-18 11:49:23', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (259, 1, 'user', '张三', '登录', '业主 张三 登录系统', '2025-02-18 12:00:13', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (260, 1, 'user', '张三', '登录', '业主 张三 登录系统', '2025-02-18 12:00:42', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (261, 1, 'user', '张三', '访问主页', '业主 张三 访问主页', '2025-02-18 12:00:42', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (262, 1, 'user', '张三', '查看公告', '业主 张三 查看所有公告', '2025-02-18 12:01:06', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (263, 1, 'user', '张三', '查看公告详情', '业主 张三 查看公告ID: 1', '2025-02-18 12:01:08', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (264, 1, 'user', '张三', '登出', '业主 张三 退出系统', '2025-02-18 12:02:42', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (265, 1, 'user', '张三', '登录', '业主 张三 登录系统', '2025-02-18 12:02:45', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (266, 1, 'user', '张三', '访问主页', '业主 张三 访问主页', '2025-02-18 12:02:46', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (267, 1, 'user', '张三', '访问主页', '业主 张三 访问主页', '2025-02-18 12:03:12', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (268, 1, 'user', '张三', '访问主页', '业主 张三 访问主页', '2025-02-18 12:03:13', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (269, 1, 'user', '张三', '登出', '业主 张三 退出系统', '2025-02-18 12:03:16', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (270, 1, 'user', '张三', '登录', '业主 张三 登录系统', '2025-02-18 12:03:20', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (271, 1, 'user', '张三', '访问主页', '业主 张三 访问主页', '2025-02-18 12:03:20', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (272, 1, 'user', '张三', '访问主页', '业主 张三 访问主页', '2025-02-18 12:03:39', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (273, 1, 'user', '张三', '访问主页', '业主 张三 访问主页', '2025-02-18 12:04:22', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (274, 1, 'user', '张三', '查看公告', '业主 张三 查看所有公告', '2025-02-18 12:04:30', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (275, 1, 'user', '张三', '查看公告', '业主 张三 查看所有公告', '2025-02-18 12:05:20', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (276, 1, 'user', '张三', '查看公告详情', '业主 张三 查看公告ID: 1', '2025-02-18 12:05:21', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (277, 1, 'user', '张三', '查看公告详情', '业主 张三 查看公告ID: 1', '2025-02-18 12:05:50', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (278, 1, 'user', '张三', '查看公告', '业主 张三 查看所有公告', '2025-02-18 12:06:01', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (279, 1, 'user', '张三', '查看公告详情', '业主 张三 查看公告ID: 1', '2025-02-18 12:06:02', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (280, 1, 'user', '张三', '查看公告', '业主 张三 查看所有公告', '2025-02-18 12:06:03', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (281, 1, 'user', '张三', '查看公告详情', '业主 张三 查看公告ID: 2', '2025-02-18 12:06:04', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (282, 1, 'user', '张三', '查看公告', '业主 张三 查看所有公告', '2025-02-18 12:06:08', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (283, 1, 'user', '张三', '查看维修记录', '业主 张三 查看所有维修记录', '2025-02-18 12:06:09', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (284, 1, 'user', '张三', '查看业主信息', '业主 张三 查看业主ID: 1', '2025-02-18 12:06:10', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (285, 1, 'user', '张三', '查看房屋信息', '业主 张三 查看所有房屋信息', '2025-02-18 12:06:10', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (286, 1, 'user', '张三', '查看收费记录', '业主 张三 查看所有收费记录', '2025-02-18 12:06:11', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (287, 1, 'user', '张三', '访问主页', '业主 张三 访问主页', '2025-02-18 12:06:14', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (288, 1, 'user', '张三', '查看收费记录', '业主 张三 查看所有收费记录', '2025-02-18 12:06:14', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (289, 1, 'user', '张三', '查看收费记录', '业主 张三 查看所有收费记录', '2025-02-18 12:06:18', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (290, 1, 'user', '张三', '查看收费记录', '业主 张三 查看所有收费记录', '2025-02-18 12:07:22', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (291, 1, 'user', '张三', '查看钱包信息', '业主 张三 查看钱包信息', '2025-02-18 12:07:27', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (292, 1, 'user', '张三', '查看支付记录', '业主 张三 查看支付记录', '2025-02-18 12:07:29', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (293, 1, 'user', '张三', '访问主页', '业主 张三 访问主页', '2025-02-18 12:07:35', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (294, 1, 'user', '张三', '查看反馈信息', '业主 张三 查看支付记录', '2025-02-18 12:07:36', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (295, 1, 'user', '张三', '添加反馈信息', '业主 张三添加反馈', '2025-02-18 12:07:45', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (296, 1, 'user', '张三', '查看反馈信息', '业主 张三 查看支付记录', '2025-02-18 12:07:45', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (297, 1, 'user', '张三', '访问主页', '业主 张三 访问主页', '2025-02-18 12:13:24', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (298, 1, 'user', '张三', '查看公告', '业主 张三 查看所有公告', '2025-02-18 12:13:25', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (299, 1, 'user', '张三', '查看维修记录', '业主 张三 查看所有维修记录', '2025-02-18 12:13:26', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (300, 1, 'user', '张三', '查看业主信息', '业主 张三 查看业主ID: 1', '2025-02-18 12:13:27', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (301, 1, 'user', '张三', '查看房屋信息', '业主 张三 查看所有房屋信息', '2025-02-18 12:13:27', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (302, 1, 'user', '张三', '查看收费记录', '业主 张三 查看所有收费记录', '2025-02-18 12:13:28', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (303, 1, 'user', '张三', '查看钱包信息', '业主 张三 查看钱包信息', '2025-02-18 12:13:29', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (304, 1, 'user', '张三', '访问主页', '业主 张三 访问主页', '2025-02-18 12:13:29', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (305, 1, 'user', '张三', '查看反馈信息', '业主 张三 查看支付记录', '2025-02-18 12:13:30', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (306, 1, 'user', '张三', '查看维修记录', '业主 张三 查看所有维修记录', '2025-02-18 12:13:32', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (307, 1, 'user', '张三', '查看收费记录', '业主 张三 查看所有收费记录', '2025-02-18 12:13:33', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (308, 1, 'user', '张三', '查看业主信息', '业主 张三 查看业主ID: 1', '2025-02-18 12:13:33', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (309, 1, 'user', '张三', '查看收费记录', '业主 张三 查看所有收费记录', '2025-02-18 12:13:35', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (310, 1, 'user', '张三', '查看房屋信息', '业主 张三 查看所有房屋信息', '2025-02-18 12:13:36', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (311, 1, 'user', '张三', '查看钱包信息', '业主 张三 查看钱包信息', '2025-02-18 12:13:36', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (312, 1, 'user', '张三', '查看维修记录', '业主 张三 查看所有维修记录', '2025-02-18 12:13:37', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (313, 1, 'user', '张三', '访问主页', '业主 张三 访问主页', '2025-02-18 12:13:38', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (314, 1, 'user', '张三', '查看钱包信息', '业主 张三 查看钱包信息', '2025-02-18 12:13:38', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (315, 1, 'user', '张三', '查看收费记录', '业主 张三 查看所有收费记录', '2025-02-18 12:13:39', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (316, 1, 'user', '张三', '查看维修记录', '业主 张三 查看所有维修记录', '2025-02-18 12:13:40', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (317, 1, 'user', '张三', '查看公告', '业主 张三 查看所有公告', '2025-02-18 12:13:40', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (318, 1, 'user', '张三', '访问主页', '业主 张三 访问主页', '2025-02-18 12:13:41', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (319, 1, 'user', '张三', '查看公告', '业主 张三 查看所有公告', '2025-02-18 12:19:46', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (320, 1, 'user', '张三', '查看维修记录', '业主 张三 查看所有维修记录', '2025-02-18 12:19:47', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (321, 1, 'user', '张三', '访问主页', '业主 张三 访问主页', '2025-02-18 12:19:47', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (322, 1, 'user', '张三', '登出', '业主 张三 退出系统', '2025-02-18 12:19:49', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (323, 1, 'admin', '管理员1', '登录', '管理员 管理员1 登录系统', '2025-02-18 12:19:59', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (324, 1, 'admin', '管理员1', '查看管理员列表', '管理员 管理员1 查看所有管理员信息', '2025-02-18 12:20:01', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (325, 1, 'admin', '管理员1', '删除管理员', '管理员 管理员1 删除管理员ID: 15', '2025-02-18 12:20:04', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (326, 1, 'admin', '管理员1', '查看管理员列表', '管理员 管理员1 查看所有管理员信息', '2025-02-18 12:20:05', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (327, 1, 'admin', '管理员1', '查看公告', '管理员 管理员1 查看所有公告', '2025-02-18 12:20:07', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (328, 1, 'admin', '管理员1', '查看反馈', '管理员 管理员1 查看所有反馈', '2025-02-18 12:20:15', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (329, 1, 'admin', '管理员1', '查看业主列表', '管理员 管理员1 查看所有业主信息', '2025-02-18 12:20:16', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (330, 1, 'admin', '管理员1', '查看房屋', '管理员 管理员1 查看所有房屋信息', '2025-02-18 12:20:17', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (331, 1, 'admin', '管理员1', '查看收费记录', '管理员 管理员1 查看所有收费记录', '2025-02-18 12:20:23', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (332, 1, 'user', '张三', '登录', '业主 张三 登录系统', '2025-02-18 13:10:14', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (333, 1, 'user', '张三', '访问主页', '业主 张三 访问主页', '2025-02-18 13:10:14', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (334, 1, 'user', '张三', '登录', '业主 张三 登录系统', '2025-02-18 13:55:57', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (335, 1, 'user', '张三', '访问主页', '业主 张三 访问主页', '2025-02-18 13:55:57', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (336, 1, 'user', '张三', '访问主页', '业主 张三 访问主页', '2025-02-18 14:05:19', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (337, 1, 'user', '张三', '查看房屋信息', '业主 张三 查看所有房屋信息', '2025-02-18 14:14:13', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (338, 1, 'user', '张三', '查看图片历史', '业主 张三 查看图片历史', '2025-02-18 14:14:18', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (339, 1, 'user', '张三', '查看房屋信息', '业主 张三 查看所有房屋信息', '2025-02-18 14:28:22', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (340, 1, 'user', '张三', '登出', '业主 张三 退出系统', '2025-02-18 14:28:25', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (341, 1, 'admin', '管理员1', '登录', '管理员 管理员1 登录系统', '2025-02-18 14:28:32', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (342, 1, 'admin', '管理员1', '查看房屋', '管理员 管理员1 查看所有房屋信息', '2025-02-18 14:28:34', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (343, 1, 'admin', '管理员1', '查看收费记录', '管理员 管理员1 查看所有收费记录', '2025-02-18 14:28:43', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (344, 1, 'admin', '管理员1', '查看业主列表', '管理员 管理员1 查看所有业主信息', '2025-02-18 14:28:44', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (345, 1, 'admin', '管理员1', '查看房屋', '管理员 管理员1 查看所有房屋信息', '2025-02-18 14:28:49', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (346, 1, 'admin', '管理员1', '查看业主列表', '管理员 管理员1 查看所有业主信息', '2025-02-18 14:28:53', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (347, 1, 'admin', '管理员1', '登录', '管理员 管理员1 登录系统', '2025-02-18 14:47:02', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (348, 1, 'admin', '管理员1', '查看收费记录', '管理员 管理员1 查看所有收费记录', '2025-02-18 14:47:07', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (349, 1, 'admin', '管理员1', '查看管理员列表', '管理员 管理员1 查看所有管理员信息', '2025-02-18 15:04:23', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (350, 1, 'admin', '管理员1', '查看公告', '管理员 管理员1 查看所有公告', '2025-02-18 15:04:25', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (351, 1, 'admin', '管理员1', '查看反馈', '管理员 管理员1 查看所有反馈', '2025-02-18 15:04:25', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (352, 1, 'admin', '管理员1', '查看公告', '管理员 管理员1 查看所有公告', '2025-02-18 15:04:26', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (353, 1, 'admin', '管理员1', '查看公告', '管理员 管理员1 查看所有公告', '2025-02-18 15:04:30', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (354, 1, 'admin', '管理员1', '查看收费记录', '管理员 管理员1 查看所有收费记录', '2025-02-18 15:04:31', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (355, 1, 'admin', '管理员1', '查看管理员列表', '管理员 管理员1 查看所有管理员信息', '2025-02-18 15:04:33', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (356, 1, 'admin', '管理员1', '查看业主列表', '管理员 管理员1 查看所有业主信息', '2025-02-18 15:04:36', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (357, 1, 'admin', '管理员1', '添加业主', '管理员 管理员1 访问添加业主页面', '2025-02-18 15:04:36', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (358, 1, 'admin', '管理员1', '添加业主', '管理员 管理员1 添加新业主: 231', '2025-02-18 15:05:02', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (359, 1, 'admin', '管理员1', '查看业主列表', '管理员 管理员1 查看所有业主信息', '2025-02-18 15:05:02', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (360, 1, 'admin', '管理员1', '查看业主列表', '管理员 管理员1 查看所有业主信息', '2025-02-18 15:15:48', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (361, 1, 'admin', '管理员1', '添加业主', '管理员 管理员1 访问添加业主页面', '2025-02-18 15:15:49', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (362, 1, 'admin', '管理员1', '查看业主列表', '管理员 管理员1 查看所有业主信息', '2025-02-18 15:30:16', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (363, 1, 'admin', '管理员1', '添加业主', '管理员 管理员1 访问添加业主页面', '2025-02-18 15:30:17', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (364, 1, 'admin', '管理员1', '删除业主', '管理员 管理员1 删除业主ID: 6', '2025-02-18 15:30:22', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (365, 1, 'admin', '管理员1', '查看业主列表', '管理员 管理员1 查看所有业主信息', '2025-02-18 15:30:22', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (366, 1, 'admin', '管理员1', '删除业主', '管理员 管理员1 删除业主ID: 7', '2025-02-18 15:30:24', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (367, 1, 'admin', '管理员1', '查看业主列表', '管理员 管理员1 查看所有业主信息', '2025-02-18 15:30:24', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (368, 1, 'admin', '管理员1', '添加业主', '管理员 管理员1 访问添加业主页面', '2025-02-18 15:30:27', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (369, 1, 'admin', '管理员1', '添加业主', '管理员 管理员1 访问添加业主页面', '2025-02-18 15:32:07', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (370, 1, 'admin', '管理员1', '添加业主', '管理员 管理员1 添加新业主: 123123', '2025-02-18 15:32:24', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (371, 1, 'admin', '管理员1', '查看业主列表', '管理员 管理员1 查看所有业主信息', '2025-02-18 15:32:24', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (372, 1, 'admin', '管理员1', '查看业主列表', '管理员 管理员1 查看所有业主信息', '2025-02-18 15:32:32', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (373, 1, 'admin', '管理员1', '删除业主', '管理员 管理员1 删除业主ID: 7', '2025-02-18 15:32:36', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (374, 1, 'admin', '管理员1', '查看业主列表', '管理员 管理员1 查看所有业主信息', '2025-02-18 15:32:36', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (375, 1, 'admin', '管理员1', '查看房屋', '管理员 管理员1 查看所有房屋信息', '2025-02-18 15:32:41', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (376, 1, 'admin', '管理员1', '查看管理员列表', '管理员 管理员1 查看所有管理员信息', '2025-02-18 15:32:44', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (377, 1, 'admin', '管理员1', '查看业主列表', '管理员 管理员1 查看所有业主信息', '2025-02-18 15:32:45', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (378, 1, 'user', '张三', '登录', '业主 张三 登录系统', '2025-02-19 11:47:43', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (379, 1, 'user', '张三', '访问主页', '业主 张三 访问主页', '2025-02-19 11:47:43', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (380, 1, 'user', '张三', '访问主页', '业主 张三 访问主页', '2025-02-19 11:48:08', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (381, 1, 'user', '张三', '访问主页', '业主 张三 访问主页', '2025-02-19 11:48:10', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (382, 1, 'user', '张三', '登录', '业主 张三 登录系统', '2025-02-19 17:22:58', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (383, 1, 'user', '张三', '访问主页', '业主 张三 访问主页', '2025-02-19 17:22:58', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (384, 1, 'user', '张三', '查看公告', '业主 张三 查看所有公告', '2025-02-19 17:23:00', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (385, 1, 'user', '张三', '查看公告详情', '业主 张三 查看公告ID: 1', '2025-02-19 17:23:02', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (386, 1, 'user', '张三', '查看公告', '业主 张三 查看所有公告', '2025-02-19 17:23:03', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (387, 1, 'user', '张三', '登录', '业主 张三 登录系统', '2025-02-19 17:32:47', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (388, 1, 'user', '张三', '访问主页', '业主 张三 访问主页', '2025-02-19 17:32:47', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (389, 1, 'user', '张三', '查看公告', '业主 张三 查看所有公告', '2025-02-19 17:32:50', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (390, 1, 'user', '张三', '查看维修记录', '业主 张三 查看所有维修记录', '2025-02-19 17:32:52', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (391, 1, 'user', '张三', '访问主页', '业主 张三 访问主页', '2025-02-19 17:32:53', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (392, 1, 'user', '张三', '查看维修记录', '业主 张三 查看所有维修记录', '2025-02-19 17:32:55', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (393, 1, 'user', '张三', '访问主页', '业主 张三 访问主页', '2025-02-19 17:32:57', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (394, 1, 'user', '张三', '查看业主信息', '业主 张三 查看业主ID: 1', '2025-02-19 17:32:58', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (395, 1, 'user', '张三', '访问主页', '业主 张三 访问主页', '2025-02-19 17:32:59', 'success');
INSERT INTO `operation_logs` (`id`, `operator_id`, `operator_type`, `operator_name`, `operation_type`, `operation_detail`, `operation_time`, `status`) VALUES (396, 1, 'user', '张三', '查看房屋信息', '业主 张三 查看所有房屋信息', '2025-02-19 17:33:00', 'success');
COMMIT;

-- ----------------------------
-- Table structure for orepair
-- ----------------------------
DROP TABLE IF EXISTS `orepair`;
CREATE TABLE `orepair` (
  `rid` int NOT NULL AUTO_INCREMENT,
  `raccount` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `rrepair` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `rrepairaddress` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `state` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`rid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of orepair
-- ----------------------------
BEGIN;
INSERT INTO `orepair` (`rid`, `raccount`, `rrepair`, `rrepairaddress`, `state`) VALUES (1, 'lisi', '厕所堵了', 'B-302', '未处理');
INSERT INTO `orepair` (`rid`, `raccount`, `rrepair`, `rrepairaddress`, `state`) VALUES (2, 'zhangsan', '床底闹老王', 'A-301', '已处理');
COMMIT;

-- ----------------------------
-- Table structure for payment_record
-- ----------------------------
DROP TABLE IF EXISTS `payment_record`;
CREATE TABLE `payment_record` (
  `paymentId` int NOT NULL AUTO_INCREMENT,
  `wallet_id` int NOT NULL,
  `amount` double NOT NULL,
  `payment_date` datetime NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`paymentId`),
  KEY `wallet_id` (`wallet_id`),
  CONSTRAINT `payment_record_ibfk_1` FOREIGN KEY (`wallet_id`) REFERENCES `wallet` (`wallet_id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of payment_record
-- ----------------------------
BEGIN;
INSERT INTO `payment_record` (`paymentId`, `wallet_id`, `amount`, `payment_date`, `description`) VALUES (1, 1, 200, '2023-10-01 10:00:00', 'Monthly payment');
INSERT INTO `payment_record` (`paymentId`, `wallet_id`, `amount`, `payment_date`, `description`) VALUES (2, 1, 150, '2023-10-15 11:30:00', 'Additional payment');
INSERT INTO `payment_record` (`paymentId`, `wallet_id`, `amount`, `payment_date`, `description`) VALUES (3, 2, 300, '2023-10-01 12:45:00', 'Monthly payment');
INSERT INTO `payment_record` (`paymentId`, `wallet_id`, `amount`, `payment_date`, `description`) VALUES (4, 1, 12, '2025-01-19 19:23:54', '充值');
INSERT INTO `payment_record` (`paymentId`, `wallet_id`, `amount`, `payment_date`, `description`) VALUES (5, 1, -23, '2025-01-19 19:24:12', '退款');
INSERT INTO `payment_record` (`paymentId`, `wallet_id`, `amount`, `payment_date`, `description`) VALUES (6, 1, 12, '2025-01-19 19:29:18', '充值');
INSERT INTO `payment_record` (`paymentId`, `wallet_id`, `amount`, `payment_date`, `description`) VALUES (7, 1, -50, '2025-01-20 17:39:15', '退款');
INSERT INTO `payment_record` (`paymentId`, `wallet_id`, `amount`, `payment_date`, `description`) VALUES (8, 2, 30, '2025-01-20 17:39:27', '充值');
INSERT INTO `payment_record` (`paymentId`, `wallet_id`, `amount`, `payment_date`, `description`) VALUES (9, 1, -222, '2025-02-07 11:57:30', '物业费支付');
INSERT INTO `payment_record` (`paymentId`, `wallet_id`, `amount`, `payment_date`, `description`) VALUES (10, 1, 2000, '2025-02-07 12:06:39', '充值');
INSERT INTO `payment_record` (`paymentId`, `wallet_id`, `amount`, `payment_date`, `description`) VALUES (11, 1, -1213, '2025-02-10 20:06:51', '物业费支付');
INSERT INTO `payment_record` (`paymentId`, `wallet_id`, `amount`, `payment_date`, `description`) VALUES (12, 1, 50000, '2025-02-10 20:10:37', '充值');
INSERT INTO `payment_record` (`paymentId`, `wallet_id`, `amount`, `payment_date`, `description`) VALUES (13, 1, 12, '2025-02-13 19:08:34', '充值');
INSERT INTO `payment_record` (`paymentId`, `wallet_id`, `amount`, `payment_date`, `description`) VALUES (14, 1, -123, '2025-02-13 19:08:39', '退款');
INSERT INTO `payment_record` (`paymentId`, `wallet_id`, `amount`, `payment_date`, `description`) VALUES (15, 1, 75, '2025-02-14 14:25:23', '物业费支付');
INSERT INTO `payment_record` (`paymentId`, `wallet_id`, `amount`, `payment_date`, `description`) VALUES (16, 1, 75, '2025-02-14 14:28:50', '物业费支付');
INSERT INTO `payment_record` (`paymentId`, `wallet_id`, `amount`, `payment_date`, `description`) VALUES (17, 1, 2222, '2025-02-14 14:37:33', '物业费支付');
INSERT INTO `payment_record` (`paymentId`, `wallet_id`, `amount`, `payment_date`, `description`) VALUES (18, 1, 20000, '2025-02-14 14:41:16', '物业费支付');
INSERT INTO `payment_record` (`paymentId`, `wallet_id`, `amount`, `payment_date`, `description`) VALUES (19, 1, 12333, '2025-02-14 14:55:49', '物业费支付');
INSERT INTO `payment_record` (`paymentId`, `wallet_id`, `amount`, `payment_date`, `description`) VALUES (20, 1, 12333, '2025-02-14 15:04:22', '物业费支付');
INSERT INTO `payment_record` (`paymentId`, `wallet_id`, `amount`, `payment_date`, `description`) VALUES (21, 1, -12323, '2025-02-14 16:09:21', '物业费支付');
INSERT INTO `payment_record` (`paymentId`, `wallet_id`, `amount`, `payment_date`, `description`) VALUES (22, 1, -50000, '2025-02-14 16:10:55', '物业费支付');
INSERT INTO `payment_record` (`paymentId`, `wallet_id`, `amount`, `payment_date`, `description`) VALUES (23, 1, -1233, '2025-02-14 16:11:07', '物业费支付');
INSERT INTO `payment_record` (`paymentId`, `wallet_id`, `amount`, `payment_date`, `description`) VALUES (24, 1, -123, '2025-02-14 17:37:37', '物业费支付');
INSERT INTO `payment_record` (`paymentId`, `wallet_id`, `amount`, `payment_date`, `description`) VALUES (25, 1, -123, '2025-02-14 17:37:37', '维修费用支付 - 123123');
INSERT INTO `payment_record` (`paymentId`, `wallet_id`, `amount`, `payment_date`, `description`) VALUES (26, 1, -5000, '2025-02-14 17:41:30', '物业费支付');
INSERT INTO `payment_record` (`paymentId`, `wallet_id`, `amount`, `payment_date`, `description`) VALUES (27, 1, -5000, '2025-02-14 17:41:30', '维修费用支付 - asc');
INSERT INTO `payment_record` (`paymentId`, `wallet_id`, `amount`, `payment_date`, `description`) VALUES (28, 1, -13233, '2025-02-14 17:45:05', '维修费用支付 - 12312321312');
INSERT INTO `payment_record` (`paymentId`, `wallet_id`, `amount`, `payment_date`, `description`) VALUES (29, 1, -10000, '2025-02-14 17:48:37', '维修费用支付 - 123asd');
INSERT INTO `payment_record` (`paymentId`, `wallet_id`, `amount`, `payment_date`, `description`) VALUES (30, 1, -200, '2025-02-14 17:49:04', '维修费用支付 - 123141556');
INSERT INTO `payment_record` (`paymentId`, `wallet_id`, `amount`, `payment_date`, `description`) VALUES (31, 1, -123, '2025-02-14 17:50:25', '物业费支付');
INSERT INTO `payment_record` (`paymentId`, `wallet_id`, `amount`, `payment_date`, `description`) VALUES (32, 1, -123, '2025-02-14 20:37:12', '物业费支付');
INSERT INTO `payment_record` (`paymentId`, `wallet_id`, `amount`, `payment_date`, `description`) VALUES (33, 1, -123, '2025-02-14 20:37:18', '物业费支付');
INSERT INTO `payment_record` (`paymentId`, `wallet_id`, `amount`, `payment_date`, `description`) VALUES (34, 1, -123, '2025-02-14 20:44:15', '物业费支付');
INSERT INTO `payment_record` (`paymentId`, `wallet_id`, `amount`, `payment_date`, `description`) VALUES (35, 1, -200, '2025-02-14 20:44:30', '维修费用支付 - 123');
INSERT INTO `payment_record` (`paymentId`, `wallet_id`, `amount`, `payment_date`, `description`) VALUES (36, 1, -123, '2025-02-16 13:39:11', '物业费支付');
INSERT INTO `payment_record` (`paymentId`, `wallet_id`, `amount`, `payment_date`, `description`) VALUES (37, 1, -200, '2025-02-16 16:29:12', '维修费用支付 - 12312321312');
INSERT INTO `payment_record` (`paymentId`, `wallet_id`, `amount`, `payment_date`, `description`) VALUES (38, 1, -200, '2025-02-16 20:24:36', '维修费用支付 - 空调故障');
COMMIT;

-- ----------------------------
-- Table structure for wallet
-- ----------------------------
DROP TABLE IF EXISTS `wallet`;
CREATE TABLE `wallet` (
  `wallet_id` int NOT NULL AUTO_INCREMENT,
  `balance` decimal(10,2) NOT NULL DEFAULT '0.00',
  `custom_oid` int NOT NULL,
  PRIMARY KEY (`wallet_id`) USING BTREE,
  KEY `custom_oid` (`custom_oid`),
  CONSTRAINT `wallet_ibfk_1` FOREIGN KEY (`custom_oid`) REFERENCES `custom` (`oid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of wallet
-- ----------------------------
BEGIN;
INSERT INTO `wallet` (`wallet_id`, `balance`, `custom_oid`) VALUES (1, 4404.00, 1);
INSERT INTO `wallet` (`wallet_id`, `balance`, `custom_oid`) VALUES (2, 219.00, 2);
INSERT INTO `wallet` (`wallet_id`, `balance`, `custom_oid`) VALUES (3, 300.00, 3);
INSERT INTO `wallet` (`wallet_id`, `balance`, `custom_oid`) VALUES (10, 0.00, 6);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
