/*
 Navicat Premium Data Transfer

 Source Server         : 18php
 Source Server Type    : MySQL
 Source Server Version : 100214
 Source Host           : www.18php.com:3306
 Source Schema         : choujiang

 Target Server Type    : MySQL
 Target Server Version : 100214
 File Encoding         : 65001

 Date: 07/01/2020 14:12:08
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for c_awards
-- ----------------------------
DROP TABLE IF EXISTS `c_awards`;
CREATE TABLE `c_awards`  (
  `aid` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT,
  `aw_name` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '奖项名称',
  `aw_num` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '一次抽出的奖项数量',
  `aw_time` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '抽几次',
  `aw_info` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '奖品名称',
  `hp_name` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '赞助人',
  `aw_count` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '已经抽过的次数',
  PRIMARY KEY (`aid`) USING BTREE,
  UNIQUE INDEX `aw_name`(`aw_name`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of c_awards
-- ----------------------------
INSERT INTO `c_awards` VALUES (1, '一等奖', 2, 1, '宝马小轿车', '程斌', 1);
INSERT INTO `c_awards` VALUES (2, '二等奖', 20, 4, '2w元', '小彭', 1);

-- ----------------------------
-- Table structure for c_user
-- ----------------------------
DROP TABLE IF EXISTS `c_user`;
CREATE TABLE `c_user`  (
  `uid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '员工姓名',
  `user_id` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工号',
  `department` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门',
  `company` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司',
  `awards_id` tinyint(2) UNSIGNED NULL DEFAULT 0 COMMENT '中奖id',
  `awards_id2` tinyint(2) UNSIGNED NULL DEFAULT 0 COMMENT '中奖id2',
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 102 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of c_user
-- ----------------------------
INSERT INTO `c_user` VALUES (1, '国辉', 'GYL0001', '总经理', NULL, 0, 0);
INSERT INTO `c_user` VALUES (2, '杜建玲', 'GYL0002', '副总经理', NULL, 0, 0);
INSERT INTO `c_user` VALUES (3, '支小东', 'GYL0003', '副总经理', NULL, 0, 0);
INSERT INTO `c_user` VALUES (4, '李小咪', 'GYL0004', '财务经理', NULL, 0, 0);
INSERT INTO `c_user` VALUES (5, '周化军', 'GYL0005', '财务主管', NULL, 0, 0);
INSERT INTO `c_user` VALUES (6, '朱舜叶', 'GYL0006', '会计专员', NULL, 0, 0);
INSERT INTO `c_user` VALUES (7, '刘晓琪', 'GYL0007', '会计专员', NULL, 0, 0);
INSERT INTO `c_user` VALUES (8, '肖夏', 'GYL0008', '会计专员', NULL, 0, 0);
INSERT INTO `c_user` VALUES (9, '许健宇', 'GYL0009', '会计专员', NULL, 0, 0);
INSERT INTO `c_user` VALUES (10, '罗曼娜', 'GYL0010', '出纳', NULL, 0, 0);
INSERT INTO `c_user` VALUES (11, '叶祖明', 'GYL0011', '人力行政总监', NULL, 0, 0);
INSERT INTO `c_user` VALUES (12, '王志敏', 'GYL0012', '人力专员', NULL, 0, 0);
INSERT INTO `c_user` VALUES (13, '陈梅', 'GYL0013', '行政专员', NULL, 0, 0);
INSERT INTO `c_user` VALUES (14, '朱莲婷', 'GYL0014', '人事专员', NULL, 0, 0);
INSERT INTO `c_user` VALUES (15, '曾累林', 'GYL0015', '厨师', NULL, 2, 0);
INSERT INTO `c_user` VALUES (16, '孟晚桂', 'GYL0016', '清洁阿姨', NULL, 0, 0);
INSERT INTO `c_user` VALUES (17, '何龙', 'GYL0017', 'PHP开发工程师', NULL, 0, 0);
INSERT INTO `c_user` VALUES (18, '曾尧红', 'GYL0018', '前端开发工程师', NULL, 0, 0);
INSERT INTO `c_user` VALUES (19, '胡文欢', 'GYL0019', 'PHP开发工程师', NULL, 0, 0);
INSERT INTO `c_user` VALUES (20, '邱苏平', 'GYL0020', '运维', NULL, 0, 0);
INSERT INTO `c_user` VALUES (21, '武世忠', 'GYL0021', '销售总监', NULL, 2, 0);
INSERT INTO `c_user` VALUES (22, '马衡波', 'GYL0022', '销售经理', NULL, 0, 0);
INSERT INTO `c_user` VALUES (23, '舒伟标', 'GYL0023', '客服经理', NULL, 0, 0);
INSERT INTO `c_user` VALUES (24, '夏月玲', 'GYL0024', '销售经理', NULL, 0, 0);
INSERT INTO `c_user` VALUES (25, '杜建红', 'GYL0025', '销售代表', NULL, 0, 0);
INSERT INTO `c_user` VALUES (26, '万香香', 'GYL0026', '销售代表', NULL, 0, 0);
INSERT INTO `c_user` VALUES (27, '朱九胜', 'GYL0027', '销售代表', NULL, 0, 0);
INSERT INTO `c_user` VALUES (28, '陈鑫平', 'GYL0028', '销售助理', NULL, 0, 0);
INSERT INTO `c_user` VALUES (29, '卜德川', 'GYL0029', '销售代表', NULL, 0, 0);
INSERT INTO `c_user` VALUES (30, '庄思琪', 'GYL0030', '销售代表', NULL, 0, 0);
INSERT INTO `c_user` VALUES (31, '邹秀峰', 'GYL0031', '销售代表', NULL, 0, 0);
INSERT INTO `c_user` VALUES (32, '曾海平', 'GYL0032', '销售代表', NULL, 2, 0);
INSERT INTO `c_user` VALUES (33, '黄世峰', 'GYL0033', '销售代表', NULL, 0, 0);
INSERT INTO `c_user` VALUES (34, '张力', 'GYL0034', '销售代表', NULL, 0, 0);
INSERT INTO `c_user` VALUES (35, '邓问鼎', 'GYL0035', '海外经理', NULL, 0, 0);
INSERT INTO `c_user` VALUES (36, '李金闹', 'GYL0036', '海外开发经理', NULL, 0, 0);
INSERT INTO `c_user` VALUES (37, '胡程坤', 'GYL0037', '供应链专员', NULL, 1, 0);
INSERT INTO `c_user` VALUES (38, '邓利芸', 'GYL0038', '供应链专员', NULL, 2, 0);
INSERT INTO `c_user` VALUES (39, '肖文文', 'GYL0039', '海外客服', NULL, 2, 0);
INSERT INTO `c_user` VALUES (40, '黄深', 'GYL0040', '仓务组长', NULL, 0, 0);
INSERT INTO `c_user` VALUES (41, '张楠卿', 'GYL0041', '仓务', NULL, 0, 0);
INSERT INTO `c_user` VALUES (42, '田茂贵', 'GYL0042', '仓务', NULL, 1, 0);
INSERT INTO `c_user` VALUES (43, '田闯', 'GYL0043', '仓务', NULL, 2, 0);
INSERT INTO `c_user` VALUES (44, '范元亮', 'GYL0044', '仓务', NULL, 0, 0);
INSERT INTO `c_user` VALUES (45, '杨辉', 'GYL0045', '仓务', NULL, 0, 0);
INSERT INTO `c_user` VALUES (46, '张青山', 'GYL0046', '仓务', NULL, 0, 0);
INSERT INTO `c_user` VALUES (47, '宣骏', 'GYL0047', '空运部经理', NULL, 2, 0);
INSERT INTO `c_user` VALUES (48, '陈婷', 'GYL0048', '文件操作', NULL, 0, 0);
INSERT INTO `c_user` VALUES (49, '黄浩升', 'GYL0049', '空运操作', NULL, 0, 0);
INSERT INTO `c_user` VALUES (50, '杨亢棋', 'GYL0050', '空运操作', NULL, 0, 0);
INSERT INTO `c_user` VALUES (51, '叶景宗', 'GYL0051', '空运操作', NULL, 0, 0);
INSERT INTO `c_user` VALUES (52, '刘厚雄', 'GYL0052', '海运部经理', NULL, 0, 0);
INSERT INTO `c_user` VALUES (53, '刘益群', 'GYL0053', '海运操作', NULL, 2, 0);
INSERT INTO `c_user` VALUES (54, '刘芬娟', 'GYL0054', '海运操作', NULL, 0, 0);
INSERT INTO `c_user` VALUES (55, '张杰', 'GYL0055', '客服部经理', NULL, 0, 0);
INSERT INTO `c_user` VALUES (56, '支露红', 'GYL0056', '客服专员', NULL, 0, 0);
INSERT INTO `c_user` VALUES (57, '王仁', 'GYL0057', '客服专员', NULL, 2, 0);
INSERT INTO `c_user` VALUES (58, '庄淑佳', 'GYL0058', '客服专员', NULL, 2, 0);
INSERT INTO `c_user` VALUES (59, '陈娜', 'GYL0059', '客服专员', NULL, 0, 0);
INSERT INTO `c_user` VALUES (60, '龙婷', 'GYL0060', '客服专员', NULL, 0, 0);
INSERT INTO `c_user` VALUES (61, '周欢', 'GYL0061', '客服专员', NULL, 0, 0);
INSERT INTO `c_user` VALUES (62, '肖映', 'GYL0062', '客服专员', NULL, 2, 0);
INSERT INTO `c_user` VALUES (63, '李雪鹏', 'GYL0063', '仓储运营总监', NULL, 0, 0);
INSERT INTO `c_user` VALUES (64, '史丹萍', 'GYL0064', '小包主管', NULL, 0, 0);
INSERT INTO `c_user` VALUES (65, '周小芳', 'GYL0065', '小包主管', NULL, 0, 0);
INSERT INTO `c_user` VALUES (66, '梁财明', 'GYL0066', '小包组长', NULL, 0, 0);
INSERT INTO `c_user` VALUES (67, '张丰滟', 'GYL0067', '客服专员', NULL, 0, 0);
INSERT INTO `c_user` VALUES (68, '胡爱珍', 'GYL0068', '小包操作', NULL, 0, 0);
INSERT INTO `c_user` VALUES (69, '蔡石生', 'GYL0069', '小包操作', NULL, 2, 0);
INSERT INTO `c_user` VALUES (70, '刘文', 'GYL0070', '小包操作', NULL, 0, 0);
INSERT INTO `c_user` VALUES (71, '刘伟', 'GYL0071', '小包操作', NULL, 0, 0);
INSERT INTO `c_user` VALUES (72, '刘梨文', 'GYL0072', '小包操作', NULL, 0, 0);
INSERT INTO `c_user` VALUES (73, '谢芳', 'GYL0073', '小包操作', NULL, 0, 0);
INSERT INTO `c_user` VALUES (74, '吴旭君', 'GYL0074', '小包操作', NULL, 2, 0);
INSERT INTO `c_user` VALUES (75, '李宏', 'GYL0075', '小包操作', NULL, 0, 0);
INSERT INTO `c_user` VALUES (76, '廖香文', 'GYL0076', '小包操作', NULL, 0, 0);
INSERT INTO `c_user` VALUES (77, '黄英林', 'GYL0077', '小包操作', NULL, 0, 0);
INSERT INTO `c_user` VALUES (78, '国锋', 'GYL0078', '小包操作', NULL, 0, 0);
INSERT INTO `c_user` VALUES (79, '范志成', 'GYL0079', '快递操作（现场）', NULL, 2, 0);
INSERT INTO `c_user` VALUES (80, '余席福', 'GYL0080', '文件操作（电脑）', NULL, 2, 0);
INSERT INTO `c_user` VALUES (81, '吴钊锋', 'GYL0081', '大包主管', NULL, 2, 0);
INSERT INTO `c_user` VALUES (82, '张珠伟', 'GYL0082', '大包操作', NULL, 2, 0);
INSERT INTO `c_user` VALUES (83, '黄成', 'GYL0083', '大包操作', NULL, 0, 0);
INSERT INTO `c_user` VALUES (84, '张照良', 'GYL0084', '司机', NULL, 0, 0);
INSERT INTO `c_user` VALUES (85, '周中火', 'GYL0085', '司机', NULL, 0, 0);
INSERT INTO `c_user` VALUES (86, '郑雷', 'GYL0086', '司机', NULL, 0, 0);
INSERT INTO `c_user` VALUES (87, '胡银', 'GYL0087', '司机', NULL, 0, 0);
INSERT INTO `c_user` VALUES (88, '王毅', 'GYL0088', '司机', NULL, 0, 0);
INSERT INTO `c_user` VALUES (89, '郭龙龙', 'GYL0089', '司机', NULL, 0, 0);
INSERT INTO `c_user` VALUES (90, '曾发明', 'GYL0090', '跟车操作', NULL, 0, 0);
INSERT INTO `c_user` VALUES (91, '蓝海', 'GYL0091', '司机', NULL, 0, 0);
INSERT INTO `c_user` VALUES (92, '何晖', 'GYL0092', '总经理', NULL, 2, 0);
INSERT INTO `c_user` VALUES (93, '李小华', 'GYL0093', '总经理', NULL, 0, 0);
INSERT INTO `c_user` VALUES (94, '陈宗云', 'GYL0094', '操作经理', NULL, 0, 0);
INSERT INTO `c_user` VALUES (95, '尹明杰', 'GYL0095', '操作', NULL, 2, 0);
INSERT INTO `c_user` VALUES (96, '陈英', 'GYL0096', '司机', NULL, 0, 0);
INSERT INTO `c_user` VALUES (97, '王水银', 'GYL0097', '司机', NULL, 0, 0);
INSERT INTO `c_user` VALUES (98, '陈雪佳', 'GYL0098', '行政', NULL, 0, 0);
INSERT INTO `c_user` VALUES (99, '潘导兴', 'GYL0099', '仓管', NULL, 2, 0);
INSERT INTO `c_user` VALUES (100, '王金玉', 'GYL0100', '仓务', NULL, 0, 0);
INSERT INTO `c_user` VALUES (101, '潘兰利', 'GYL0101', '仓务', NULL, 0, 0);

SET FOREIGN_KEY_CHECKS = 1;
