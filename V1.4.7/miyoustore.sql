/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50736
 Source Host           : localhost:3306
 Source Schema         : miyoustore

 Target Server Type    : MySQL
 Target Server Version : 50736
 File Encoding         : 65001

 Date: 15/03/2022 18:38:36
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address`  (
  `aid` int(11) NOT NULL AUTO_INCREMENT COMMENT '地址id',
  `uid` int(11) NOT NULL COMMENT '关联用户表id',
  `addres` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '地址',
  `shoujianName` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '收件人',
  `sjrPhone` varchar(11) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '收件人电话',
  PRIMARY KEY (`aid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES (3, 2, '广东省', '李四', '18111111111');
INSERT INTO `address` VALUES (4, 1, '广东省广州市黄浦区光宝园区', '李四', '17777777777');
INSERT INTO `address` VALUES (12, 2, '广东省', 'aa', '12222222222');
INSERT INTO `address` VALUES (16, 1, '广东省', 'afadf', '18888888888');
INSERT INTO `address` VALUES (22, 1, '广东省广州市黄浦区光宝园区', '王五', '17777777777');
INSERT INTO `address` VALUES (23, 3, '广东省罗定市', '张三', '13333333333');
INSERT INTO `address` VALUES (24, 1, '广东省广州市黄浦区光宝园区', '李四', '17777777777');

-- ----------------------------
-- Table structure for banner
-- ----------------------------
DROP TABLE IF EXISTS `banner`;
CREATE TABLE `banner`  (
  `bid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'bannerID',
  `classify` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '类型',
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'bannerimg路径',
  PRIMARY KEY (`bid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of banner
-- ----------------------------
INSERT INTO `banner` VALUES (1, '蜜柚', '/static/images/banner/banner01.png');
INSERT INTO `banner` VALUES (2, '蜜柚', '/static/images/banner/banner02.png');
INSERT INTO `banner` VALUES (3, '蜜柚', '/static/images/banner/banner03.png');

-- ----------------------------
-- Table structure for cars
-- ----------------------------
DROP TABLE IF EXISTS `cars`;
CREATE TABLE `cars`  (
  `cid` int(11) NOT NULL AUTO_INCREMENT COMMENT '购物车id',
  `gid` int(11) NOT NULL COMMENT '商品id',
  `sjid` int(11) NOT NULL COMMENT '商家id',
  `price` float(10, 2) NOT NULL COMMENT '商品价格',
  `num` int(11) NOT NULL COMMENT '商品数量',
  `dpname` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '店铺名称',
  `goods_ms` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '商品描述',
  `imgurl` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '商品图片',
  `uid` int(11) NOT NULL COMMENT '用户id',
  PRIMARY KEY (`cid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cars
-- ----------------------------
INSERT INTO `cars` VALUES (4, 1, 1, 19.99, 3, '蜜柚专卖店1', '超甜红肉蜜柚1', '/static/images/shops/shopItem.png', 1);
INSERT INTO `cars` VALUES (9, 9, 3, 29.99, 1, '蜜柚直售店', '超甜蜜柚33', '/static/images/shops/shopsItem03.png', 1);
INSERT INTO `cars` VALUES (10, 1, 1, 19.99, 7, '蜜柚专卖店1', '超甜红肉蜜柚11', '/static/images/shops/shopItem.png', 1);
INSERT INTO `cars` VALUES (11, 35, 1, 12344.00, 1, '蜜柚专卖店1', '12344', 'MiYouStore_data\\shoplist\\3fbc2b85-ac7b-4c6c-b45b-4016bfefaf32.jpg', 1);

-- ----------------------------
-- Table structure for classify
-- ----------------------------
DROP TABLE IF EXISTS `classify`;
CREATE TABLE `classify`  (
  `cid` int(11) NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '分类名称',
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '分类路由',
  PRIMARY KEY (`cid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of classify
-- ----------------------------
INSERT INTO `classify` VALUES (8, '蜜柚', NULL);
INSERT INTO `classify` VALUES (10, '门窗', NULL);
INSERT INTO `classify` VALUES (11, '食品', NULL);
INSERT INTO `classify` VALUES (12, '汽车', NULL);

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods`  (
  `sid` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品ID',
  `sjid` int(11) NOT NULL COMMENT '商家id',
  `describe` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '商品描述',
  `price` float NOT NULL COMMENT '商品单价',
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '图片地址',
  `classify` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '商品分类',
  `isputaway` tinyint(1) NULL DEFAULT NULL COMMENT '是否上架',
  `miaoshu` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '商品描述',
  PRIMARY KEY (`sid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES (1, 1, '超甜红肉蜜柚11', 19.991, '/static/images/shops/shopItem.png', '蜜柚1', 1, '1122');
INSERT INTO `goods` VALUES (2, 1, '超甜蜜柚2', 29.98, '/static/images/shops/shopItem01.png', '蜜柚', 1, NULL);
INSERT INTO `goods` VALUES (3, 1, '超甜蜜柚3', 9.98, '/static/images/shops/shopItem02.png', '蜜柚', 1, NULL);
INSERT INTO `goods` VALUES (4, 2, '超甜蜜柚21', 19.98, '/static/images/shops/shopItem04.png', '蜜柚', 1, NULL);
INSERT INTO `goods` VALUES (5, 2, '超甜蜜柚22', 19.99, '/static/images/shops/shopItem05.png', '蜜柚', 0, NULL);
INSERT INTO `goods` VALUES (6, 2, '超甜蜜柚23', 9.98, '/static/images/shops/shopItem06.png', '蜜柚', 1, NULL);
INSERT INTO `goods` VALUES (7, 3, '超甜蜜柚31', 19.9, '/static/images/shops/shopItem07.png', '蜜柚', 1, NULL);
INSERT INTO `goods` VALUES (8, 3, '超甜蜜柚32', 29.99, '/static/images/shops/shopsItem.png', '蜜柚', 1, NULL);
INSERT INTO `goods` VALUES (9, 3, '超甜蜜柚33', 29.99, '/static/images/shops/shopsItem03.png', '蜜柚', NULL, NULL);
INSERT INTO `goods` VALUES (15, 1, 'wegaswg', 10, 'MiYouStore_data\\shoplist\\223d7664-094c-4345-9149-1ed7ef482f21.png', NULL, 1, NULL);
INSERT INTO `goods` VALUES (16, 1, '落地窗', 1900, 'MiYouStore_data\\shoplist\\8e2c28a2-038f-4951-8a94-a7b11456cbb6.png', '门窗', 1, NULL);
INSERT INTO `goods` VALUES (17, 1, '窗1', 99, 'MiYouStore_data\\shoplist\\b59d26ab-a8c4-4ca7-b795-afb875b27296.png', '门窗', 1, NULL);
INSERT INTO `goods` VALUES (18, 1, '窗2', 99, 'MiYouStore_data\\shoplist\\ed76f5b4-0e09-44a1-b126-49f477ae4f9f.png', '门窗', 1, NULL);
INSERT INTO `goods` VALUES (19, 1, '内饰', 1900, 'MiYouStore_data\\shoplist\\2a5527c0-f70f-40a7-a74a-2acaee2fe79c.png', '家居装饰', 1, NULL);
INSERT INTO `goods` VALUES (20, 1, '内饰2', 1980, 'MiYouStore_data\\shoplist\\235410db-27bd-49a5-9f57-e68569c70ed6.png', '家居装饰', 1, NULL);
INSERT INTO `goods` VALUES (21, 1, '内饰3', 1980, 'MiYouStore_data\\shoplist\\92137934-f1e3-4a74-8626-4b9c21d64b2e.png', '家居装饰', 1, NULL);
INSERT INTO `goods` VALUES (22, 1, '内饰4', 1980, 'MiYouStore_data\\shoplist\\37ebb973-77fd-47a6-8936-50948448a049.png', '家居装饰', 1, NULL);
INSERT INTO `goods` VALUES (23, 1, '内饰5', 1980, 'MiYouStore_data\\shoplist\\84b33205-11ae-4d79-9998-dc4b02662630.png', '家居装饰', 1, NULL);
INSERT INTO `goods` VALUES (24, 1, '内饰6', 1980, 'MiYouStore_data\\shoplist\\1e1c55a8-9ec6-4f7a-886f-7d4b62594d06.png', '家居装饰', 1, NULL);
INSERT INTO `goods` VALUES (25, 1, '车1', 19990, 'MiYouStore_data\\shoplist\\e445ac92-e6a0-40e8-a3ee-94207bde10bc.png', '汽车', 1, NULL);
INSERT INTO `goods` VALUES (26, 1, '车2', 0, 'MiYouStore_data\\shoplist\\0eead5ee-3e3a-4b8c-8f1e-f48d4d3e03ce.png', '汽车', 1, NULL);
INSERT INTO `goods` VALUES (27, 1, '车4', 199999, 'MiYouStore_data\\shoplist\\a516c774-a5b0-4f1e-adad-1665378e727e.png', '汽车', 1, NULL);
INSERT INTO `goods` VALUES (28, 1, '甜甜圈甜甜圈甜甜圈甜甜圈甜甜圈甜甜圈甜甜圈甜甜圈甜甜圈甜甜圈甜甜圈甜甜圈甜甜圈甜甜圈甜甜圈甜甜圈甜甜圈甜甜圈甜甜圈甜甜圈甜甜圈甜甜圈甜甜圈甜甜圈甜甜圈甜甜圈甜甜圈甜甜圈甜甜圈甜甜圈', 5, 'MiYouStore_data\\shoplist\\c9316e30-0717-46a1-9889-b41f7ffef6d3.png', '食品', 1, NULL);
INSERT INTO `goods` VALUES (29, 1, '蛋糕1', 199, 'MiYouStore_data\\shoplist\\b037cc14-cf74-400c-b27f-c9d886ccc6de.png', '汽车', 1, NULL);
INSERT INTO `goods` VALUES (30, 1, '蛋糕2', 299, 'MiYouStore_data\\shoplist\\c4df52cb-a72e-4836-bd0f-aa0dad3e2000.png', '汽车', 1, NULL);
INSERT INTO `goods` VALUES (31, 1, '蛋糕3', 198, 'MiYouStore_data\\shoplist\\df8474a2-1aa6-491d-944a-69c2d79e2176.png', '汽车', 1, NULL);
INSERT INTO `goods` VALUES (32, 1, '曲奇1', 19, 'MiYouStore_data\\shoplist\\68c8c926-04fb-49e0-88a5-782913243f50.png', '汽车', 1, NULL);
INSERT INTO `goods` VALUES (34, 1, '大风车水电费', 111, 'MiYouStore_data\\shoplist\\a81eb789-d021-4cdc-a373-cded73bb0e32.jpg', '蜜柚', 1, '11');
INSERT INTO `goods` VALUES (35, 1, '12344', 12344, 'MiYouStore_data\\shoplist\\3fbc2b85-ac7b-4c6c-b45b-4016bfefaf32.jpg', '蜜柚', 1, '');
INSERT INTO `goods` VALUES (36, 1, '11', 11, 'MiYouStore_data\\shoplist\\15f47541-2e79-4982-a8e5-f41baed97e6e.jpg', '蜜柚', 1, '');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `oid` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `sjid` int(11) NOT NULL COMMENT '商家id',
  `dpname` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '店铺名称',
  `gid` int(11) NOT NULL COMMENT '商品id',
  `goods_ms` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '商品描述',
  `price` float(10, 2) NOT NULL COMMENT '商品单价',
  `num` int(11) NOT NULL COMMENT '商品数量',
  `aid` int(11) NOT NULL COMMENT '地址id',
  `sjr_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '收件人',
  `sjr_phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '收件人电话',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '收件人地址',
  `imgurl` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '商品图片地址',
  `date` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '下单时间',
  `isfahuo` tinyint(10) NOT NULL COMMENT '是否发货',
  `kuaidi` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '快递单号',
  PRIMARY KEY (`oid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (10, 1, 1, '蜜柚专卖店1', 1, '超甜红肉蜜柚1', 19.99, 3, 22, '王五111', '17777777777', '广东省广州市黄浦区光宝园区111111', '/static/images/shops/shopItem.png', '2021年10月23日 22:26:39', 1, '1222222222');
INSERT INTO `orders` VALUES (11, 1, 3, '蜜柚直售店', 9, '超甜蜜柚33', 29.99, 1, 22, '王五', '17777777777', '广东省广州市黄浦区光宝园区', '/static/images/shops/shopsItem03.png', '2021年10月23日 22:26:39', 0, '顺风');
INSERT INTO `orders` VALUES (12, 1, 1, '蜜柚专卖店1', 35, '12344', 12344.00, 1, 16, 'afadf', '18888888888', '广东省', 'MiYouStore_data\\shoplist\\3fbc2b85-ac7b-4c6c-b45b-4016bfefaf32.jpg', '2022年03月15日 18:34:05', 0, NULL);

-- ----------------------------
-- Table structure for shangjia_user
-- ----------------------------
DROP TABLE IF EXISTS `shangjia_user`;
CREATE TABLE `shangjia_user`  (
  `sjid` int(11) NOT NULL AUTO_INCREMENT COMMENT '商家id',
  `sj_user` varchar(6) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '商家账号',
  `sj_password` varchar(6) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '密码',
  `sj_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '店铺名称',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '商家电话',
  PRIMARY KEY (`sjid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of shangjia_user
-- ----------------------------
INSERT INTO `shangjia_user` VALUES (1, 'sj1111', '123456', '蜜柚专卖店1', '1234567890');
INSERT INTO `shangjia_user` VALUES (2, 'sj2222', '123456', '蜜柚旗舰店2', '1234567891');
INSERT INTO `shangjia_user` VALUES (3, 'sj3333', '123456', '蜜柚直售店', '1234567892');
INSERT INTO `shangjia_user` VALUES (4, 'sj4444', '123456', '蜜柚44', '1234567894');
INSERT INTO `shangjia_user` VALUES (13, '222221', '222222', '122222', '18888888888');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `uid` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `username` varchar(31) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '用户名',
  `password` varchar(31) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '用户密码',
  `name` varchar(12) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '用户昵称',
  `sex` int(11) NULL DEFAULT NULL COMMENT '性别（1表示男，0表示女）',
  `age` int(11) NULL DEFAULT NULL COMMENT '年龄',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '用户电话',
  `date` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '注册时间',
  `isStore` tinyint(1) NULL DEFAULT NULL COMMENT '是否为商家',
  PRIMARY KEY (`uid`, `username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '111111', '123456', '张四', 0, 100, '18316308305', '2021年10月08日 21:58:48', 1);
INSERT INTO `user` VALUES (2, 'zhangsan', '123', NULL, NULL, NULL, '13633338889', '2021年10月08日 21:58:48', NULL);
INSERT INTO `user` VALUES (3, '222222', '123456', '张三', 1, 19, '12311111111', '2021年10月08日 21:58:48', NULL);
INSERT INTO `user` VALUES (4, '333333', '123456', '李四', 0, 18, '18888888888', '2021年10月08日 22:07:21', 1);
INSERT INTO `user` VALUES (5, '444444', '123456', '44', 1, 18, '12345678911', '2021年10月10日 17:44:16', NULL);
INSERT INTO `user` VALUES (6, '555555', '123456', '666', 1, 18, '66666666666', '2021年10月10日 18:17:48', NULL);
INSERT INTO `user` VALUES (7, '777777', '123456', '7', 1, 18, '77777777777', '2021年10月10日 18:36:48', NULL);

-- ----------------------------
-- Table structure for userimg
-- ----------------------------
DROP TABLE IF EXISTS `userimg`;
CREATE TABLE `userimg`  (
  `u_img_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'banner图片ID',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '图片名',
  `bid` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`u_img_id`, `uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of userimg
-- ----------------------------
INSERT INTO `userimg` VALUES (8, 1, 'zy-img1.png', '/MiYouStore_data/userImg/483cbb24-805d-4c42-9eca-e325eb2b5849.png');
INSERT INTO `userimg` VALUES (9, 3, '微信图片_20210529211227.png', '/MiYouStore_data/userImg/edb7a9b2-d550-427d-a01f-e5ee1e2b76d7.png');
INSERT INTO `userimg` VALUES (10, 0, 'cp1-img1.png', '/MiYouStore_data/userImg/b0177932-f18b-43bd-a4d0-5f3b627c4328.png');

SET FOREIGN_KEY_CHECKS = 1;
