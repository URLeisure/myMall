/*
 Navicat Premium Data Transfer

 Source Server         : review
 Source Server Type    : MySQL
 Source Server Version : 80028
 Source Host           : localhost:3306
 Source Schema         : mymall

 Target Server Type    : MySQL
 Target Server Version : 80028
 File Encoding         : 65001

 Date: 21/09/2023 21:49:23
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cms_prefrence_area
-- ----------------------------
DROP TABLE IF EXISTS `cms_prefrence_area`;
CREATE TABLE `cms_prefrence_area`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sub_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pic` varbinary(500) NULL DEFAULT NULL COMMENT '展示图片',
  `sort` int(0) NULL DEFAULT NULL,
  `show_status` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '优选专区' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_prefrence_area
-- ----------------------------
INSERT INTO `cms_prefrence_area` VALUES (1, '让音质更出众', '音质不打折 完美现场感', NULL, NULL, 1);
INSERT INTO `cms_prefrence_area` VALUES (2, '让音质更出众22', '让音质更出众22', NULL, NULL, NULL);
INSERT INTO `cms_prefrence_area` VALUES (3, '让音质更出众33', NULL, NULL, NULL, NULL);
INSERT INTO `cms_prefrence_area` VALUES (4, '让音质更出众44', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for cms_prefrence_area_product_relation
-- ----------------------------
DROP TABLE IF EXISTS `cms_prefrence_area_product_relation`;
CREATE TABLE `cms_prefrence_area_product_relation`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `prefrence_area_id` bigint(0) NULL DEFAULT NULL,
  `product_id` bigint(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '优选专区和产品关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_prefrence_area_product_relation
-- ----------------------------
INSERT INTO `cms_prefrence_area_product_relation` VALUES (1, 1, 12);
INSERT INTO `cms_prefrence_area_product_relation` VALUES (2, 1, 13);
INSERT INTO `cms_prefrence_area_product_relation` VALUES (3, 1, 14);
INSERT INTO `cms_prefrence_area_product_relation` VALUES (4, 1, 18);
INSERT INTO `cms_prefrence_area_product_relation` VALUES (5, 1, 7);
INSERT INTO `cms_prefrence_area_product_relation` VALUES (6, 2, 7);
INSERT INTO `cms_prefrence_area_product_relation` VALUES (7, 1, 22);
INSERT INTO `cms_prefrence_area_product_relation` VALUES (24, 1, 23);
INSERT INTO `cms_prefrence_area_product_relation` VALUES (25, 1, 37);
INSERT INTO `cms_prefrence_area_product_relation` VALUES (27, 1, 52);
INSERT INTO `cms_prefrence_area_product_relation` VALUES (28, 3, 52);
INSERT INTO `cms_prefrence_area_product_relation` VALUES (32, 2, 59);
INSERT INTO `cms_prefrence_area_product_relation` VALUES (33, 3, 59);
INSERT INTO `cms_prefrence_area_product_relation` VALUES (35, 1, 46);
INSERT INTO `cms_prefrence_area_product_relation` VALUES (36, 2, 62);
INSERT INTO `cms_prefrence_area_product_relation` VALUES (37, 3, 62);

-- ----------------------------
-- Table structure for cms_subject
-- ----------------------------
DROP TABLE IF EXISTS `cms_subject`;
CREATE TABLE `cms_subject`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `category_id` bigint(0) NULL DEFAULT NULL,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pic` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '专题主图',
  `product_count` int(0) NULL DEFAULT NULL COMMENT '关联产品数量',
  `recommend_status` int(0) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `collect_count` int(0) NULL DEFAULT NULL,
  `read_count` int(0) NULL DEFAULT NULL,
  `comment_count` int(0) NULL DEFAULT NULL,
  `album_pics` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '画册图片用逗号分割',
  `description` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `show_status` int(0) NULL DEFAULT NULL COMMENT '显示状态：0->不显示；1->显示',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `forward_count` int(0) NULL DEFAULT NULL COMMENT '转发数',
  `category_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '专题分类名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '专题表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_subject
-- ----------------------------
INSERT INTO `cms_subject` VALUES (1, 1, '轮廓分明，双摄手机映现细腻美照', 'https://img10.360buyimg.com/mobilecms/s1500x600_jfs/t26434/217/1381240043/254214/290f9d5b/5bc6c11cN54567a27.jpg!q70.jpg', NULL, 1, '2018-11-11 13:26:55', 100, 1000, 100, NULL, '手机对于拍照党来说，已经不仅仅是通讯工具那么简单了。因为有时TA还充当着“单反”的角色，来不断地带给那些喜欢拍照的人惊喜。所以，在这里准备一波高颜值的双摄手机来给大家。让TA们灵敏捕捉影像的能力，为你展现出轮廓更加分明、且画质更加细腻的美照。', 1, NULL, NULL, '精选专题');
INSERT INTO `cms_subject` VALUES (2, 1, '交通拥挤有妙招，电动车小巧穿行无障碍', 'https://img11.360buyimg.com/mobilecms/s1500x600_jfs/t14224/229/529700229/74868/a1cc7364/5a314f85N5bfd22c7.jpg!q70.jpg', NULL, 1, '2018-11-12 13:27:00', 100, 1000, 100, NULL, '随着人们消费水平的提高，公路上的小车是越来越多了，导致每到上下班高峰期的时候，大路的车辆堵了一环又一环，而且你根本不知道它到底会塞多久，所以我们需要变通一下，不妨骑上电动车来个绿色出行，它够小巧玲珑，即使交通再怎么拥挤，也总有它可以通过的地方。', 1, NULL, NULL, '精选专题');
INSERT INTO `cms_subject` VALUES (3, 1, '无酒不成席，甘香白酒开怀助兴', 'https://img12.360buyimg.com/mobilecms/s1500x600_jfs/t1/881/4/12265/114011/5bd1446fEc71114bf/68925bfb4a2adc44.jpg!q70.jpg', NULL, 1, '2018-11-13 13:27:05', 100, 1000, 100, NULL, '白酒是由各种优质的高粱，小麦，大米等谷物为原料，经过传统工艺的长时间酿造，酒液在这样的环境中慢慢发酵，最终变成清香浓郁的白酒，被摆上人们的餐桌，供人畅饮，是一种受到大众喜爱的绝佳饮品。', 1, NULL, NULL, '精选专题');
INSERT INTO `cms_subject` VALUES (4, 2, '真规划不盲扫，全域清洁净无尘', 'https://img10.360buyimg.com/mobilecms/s1500x600_jfs/t15205/35/2539924281/429185/72fa7857/5aab2c4bN6a32a6c5.png', NULL, 1, '2018-11-01 13:27:09', 100, 1000, 100, NULL, '科技时代，聪明女人会选择用智慧来减负，和繁琐的家务挥手再见，才能腾出更多休闲时间。规划式扫地机器人设计个性化，它能够跟据房间布置呈现清扫路线，实现规划式覆盖性清洁，少遗漏不盲扫，从而大幅度降低损耗，侦测技术遇到家具及时避让，杜绝猛烈撞击，任它灵巧穿梭于低矮空间，坐享居家净无尘。', 1, NULL, NULL, '家电专题');
INSERT INTO `cms_subject` VALUES (5, 2, '抑菌更纯净，直饮净水保家人健康', 'https://img11.360buyimg.com/mobilecms/s1500x600_jfs/t11428/340/1504074828/20474/1e8cab1e/5a0305d3Nb1e7a762.jpg!q70.jpg', NULL, 1, '2018-11-06 13:27:18', 100, 1000, 100, NULL, '在城里居住，首先要担心的是饮水问题。桶装水太贵不够经济，还不一定是干净的。自己去干净的水源地取水也不切实际。此时只有选择在家里安装一台净水器才实在。装上一台直饮式的净水器，方便安全，关键是水质过滤得比较纯净，很大限度地处理了大部分的废弃物，留下健康的矿物质水。好生活，从一口干净的纯净水开始。', 1, NULL, NULL, '家电专题');
INSERT INTO `cms_subject` VALUES (6, 2, '储鲜冷冻灵活变，多门无霜更贴心', 'https://img12.360buyimg.com/mobilecms/s1500x600_jfs/t13015/356/2397552584/605232/46c88e6e/5a5321bcN6a8866f0.png', NULL, 1, '2018-11-07 13:27:21', 100, 1000, 100, NULL, '春节临近，每个家庭都要储备不少食材，但各种食材的保鲜方式与温度不尽相同，而多门风冷冰箱能轻松满足您。它们容积大占地小，拥有多个可以独立调节温度的温区，满足对不同类食材的存放需求，同时省去除霜烦恼，还可以通过温度调节满足您对大冷藏及大冷冻的需求变化，从而带来更好的保鲜冷冻体验，为新年宴请保驾护航。', 1, NULL, NULL, '家电专题');
INSERT INTO `cms_subject` VALUES (7, 2, '想喝健康水，就用304不锈钢热水壶', 'https://img13.360buyimg.com/mobilecms/s1500x600_jfs/t12541/90/443985343/33603/65d6e884/5a0bb77aNff08550a.jpg!q70.jpg', NULL, 1, '2019-01-29 11:21:55', 100, 1000, 100, NULL, '大冬天的喝一口热水，不仅能够暧身还可以给身体补充足够的水份，但是对于热水壶的购买却是需要慎之又慎，材质不好的热水壶在烧水的过程当中极容易产生对身体不利的有害物，极大影响人们的身体健康。304不锈钢热水壶选用食品级不不锈钢，确保水质安全，烧水健康好水，为您的饮水健康保驾护航。', 1, NULL, NULL, '家电专题');
INSERT INTO `cms_subject` VALUES (8, 2, '你尽情赖床！早餐“煲”在它身上', 'https://img14.360buyimg.com/mobilecms/s1500x600_jfs/t15949/363/1450937723/89513/7d8c1219/5a531d28N2aaec2a6.jpg!q70.jpg', NULL, 1, '2019-01-29 13:07:13', 100, 1000, 100, NULL, '赖床不想起，饿了的时候想吃饭又要现做等待简直饥肠辘辘让人心烦，所以一款带有预约功能的电饭煲简直不要太贴心，你睡懒觉的时候它已经给你做好了香滑软糯的粥，起床就能享美味是不是很贴心呐。', 1, NULL, NULL, '家电专题');
INSERT INTO `cms_subject` VALUES (9, 2, '小白变大厨，微波炉为实力加持', 'https://img10.360buyimg.com/mobilecms/s1500x600_jfs/t1/8774/21/11460/38908/5c2cbfcfEdab1ef03/d5800f0f7cf05b38.jpg!q70.jpg', NULL, 1, '2019-01-29 13:08:18', 100, 1000, 100, NULL, '对于厨艺小白而言，没有什么能比掌握好火候更来得困难的了！毕竟烹饪出食物的味道好坏，很大程度上还是对火候的掌控，想要轻松掌握火候，当然少不了一款微波炉的撑场，内设多功能，满足不同的烹饪需求，简单方便易操作，让厨艺小白秒变大师！', 1, NULL, NULL, '家电专题');
INSERT INTO `cms_subject` VALUES (10, 2, '十秒鲜榨，冬日把爱浓缩成杯果汁', 'https://img11.360buyimg.com/mobilecms/s1500x600_jfs/t13708/126/308291722/542847/26ee6edd/5a07dc72N3252a9e0.png', NULL, 1, '2019-01-29 13:10:02', 100, 1000, 100, NULL, '寒瑟冬日女友不喜欢吃水果，用便携迷你果汁机，撩妹又养胃。一按一转，碾压切割，简单快速制作，压榨出纯原味果汁。一键启动，十秒出汁，保留食物营养，轻轻松松粉碎食物，营养在手，说走就走。', 1, NULL, NULL, '家电专题');
INSERT INTO `cms_subject` VALUES (11, 3, '饭点未到肚已空？美味饼干先充饥', 'https://img10.360buyimg.com/mobilecms/s1500x600_jfs/t13240/79/443357432/38567/94792c4c/5a0ba054N89388654.jpg!q70.jpg', NULL, 1, '2019-01-29 13:10:45', 100, 1000, 100, NULL, '一上午都把精力集中在工作中，刚闲下来就发现自己已是饥肠辘辘了，可饭点却还没到，怎么办呢？不妨让这些美味饼干先帮你充充饥吧！酥香松脆有营养，每一口都让人回味无穷，既能满足你挑剔的味蕾又能起到果腹效果，快快为自己备上吧！', 1, NULL, NULL, '美食专题');
INSERT INTO `cms_subject` VALUES (12, 3, '赖床无罪，香酥面包营养又便捷', 'https://img11.360buyimg.com/mobilecms/s1500x600_jfs/t9775/33/1197239610/38547/34899011/59ddbd01N0bd693bb.jpg!q70.jpg', NULL, 1, '2019-01-29 13:11:41', 100, 1000, 100, NULL, '赖床是很多年轻人的通病，特别是秋冬季节，都会恋恋不舍温暖的被窝。对于苦逼的上班族来说，就算再多睡几分钟，还是要起床的，甚至来不及吃早餐。面包营养丰富，能快速饱腹，且携带方便，再搭配一盒牛奶，一顿简单而不失营养的早餐能提供一天的能量，让赖床族多睡几分钟也无妨。', 1, NULL, NULL, '美食专题');
INSERT INTO `cms_subject` VALUES (13, 3, '夹心饼干，予多重滋味交织舌尖', 'https://img12.360buyimg.com/mobilecms/s1500x600_jfs/t18877/139/652452758/27262/36e6ed6e/5a9d5b6dN327150e8.jpg!q70.jpg', NULL, 1, '2019-01-29 13:12:38', 100, 1000, 100, NULL, '饼干味道香脆可口，深受不少人的青睐。饼干的种类多样，而夹心饼干就是其中一种，相比普通饼干而言，夹心饼干有着更丰富的口感，当肚子空空如也的时候，来一些美味的夹心饼干，既能解馋，又能扛饿。下面就为大家推荐一组好吃的夹心饼干，作为办公室小零食非常不错。', 1, NULL, NULL, '美食专题');
INSERT INTO `cms_subject` VALUES (14, 4, '户外Party，便携音箱烘气氛', 'https://img10.360buyimg.com/mobilecms/s1500x600_jfs/t17125/265/644948348/42066/6f2dc610/5a9c9da1N9a95ee2c.jpg!q70.jpg', NULL, 1, '2019-01-29 13:13:53', 100, 1000, 100, NULL, '初春的季节，除了户外的各种踏青旅行，在户外开异常Party也是很惬意。户外派对，气氛的烘托肯定不能离开音箱的衬托，选择一款户外的便携音箱，无线蓝牙连接，免去有线的束缚，携带使用更方便。', 1, NULL, NULL, '数码专题');
INSERT INTO `cms_subject` VALUES (15, 5, '今冬潮包look，凹出绚丽女王范', 'https://img10.360buyimg.com/mobilecms/s1500x600_jfs/t8365/191/1901440450/575969/c71560c9/59c3144dNe6d8dd2f.png', NULL, 1, '2019-01-29 13:15:12', 100, 1000, 100, NULL, '潮流时尚的美包，搭配潮服，会让你魅力一直在线。因为潮包一直是女性出游扮美的秘籍，它不仅能够帮你收纳日常小物件，还能让你解放双手，这里推荐的时尚美包，随意搭配一件服饰，都可以让你潮范十足，凹出绚丽女王范。', 1, NULL, NULL, '服饰专题');

-- ----------------------------
-- Table structure for cms_subject_product_relation
-- ----------------------------
DROP TABLE IF EXISTS `cms_subject_product_relation`;
CREATE TABLE `cms_subject_product_relation`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `subject_id` bigint(0) NULL DEFAULT NULL,
  `product_id` bigint(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 60 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '专题商品关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_subject_product_relation
-- ----------------------------
INSERT INTO `cms_subject_product_relation` VALUES (3, 1, 28);
INSERT INTO `cms_subject_product_relation` VALUES (4, 1, 29);
INSERT INTO `cms_subject_product_relation` VALUES (5, 2, 30);
INSERT INTO `cms_subject_product_relation` VALUES (6, 2, 31);
INSERT INTO `cms_subject_product_relation` VALUES (7, 2, 35);
INSERT INTO `cms_subject_product_relation` VALUES (30, 2, 32);
INSERT INTO `cms_subject_product_relation` VALUES (31, 3, 33);
INSERT INTO `cms_subject_product_relation` VALUES (38, 3, 34);
INSERT INTO `cms_subject_product_relation` VALUES (39, 1, 37);
INSERT INTO `cms_subject_product_relation` VALUES (40, 3, 52);
INSERT INTO `cms_subject_product_relation` VALUES (41, 6, 52);
INSERT INTO `cms_subject_product_relation` VALUES (48, 2, 59);
INSERT INTO `cms_subject_product_relation` VALUES (49, 6, 59);
INSERT INTO `cms_subject_product_relation` VALUES (50, 1, 46);
INSERT INTO `cms_subject_product_relation` VALUES (51, 2, 46);
INSERT INTO `cms_subject_product_relation` VALUES (52, 3, 46);
INSERT INTO `cms_subject_product_relation` VALUES (53, 2, 36);
INSERT INTO `cms_subject_product_relation` VALUES (59, 1, 26);
INSERT INTO `cms_subject_product_relation` VALUES (60, 1, 27);

-- ----------------------------
-- Table structure for oms_company_address
-- ----------------------------
DROP TABLE IF EXISTS `oms_company_address`;
CREATE TABLE `oms_company_address`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `address_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址名称',
  `send_status` int(0) NULL DEFAULT NULL COMMENT '默认发货地址：0->否；1->是',
  `receive_status` int(0) NULL DEFAULT NULL COMMENT '是否默认收货地址：0->否；1->是',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收发货人姓名',
  `phone` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人电话',
  `province` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省/直辖市',
  `city` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '市',
  `region` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区',
  `detail_address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '公司收发货地址表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_company_address
-- ----------------------------
INSERT INTO `oms_company_address` VALUES (1, '深圳发货点', 1, 1, '大梨', '18000000000', '广东省', '深圳市', '南山区', '科兴科学园');
INSERT INTO `oms_company_address` VALUES (2, '北京发货点', 0, 0, '大梨', '18000000000', '北京市', NULL, '南山区', '科兴科学园');
INSERT INTO `oms_company_address` VALUES (3, '南京发货点', 0, 0, '大梨', '18000000000', '江苏省', '南京市', '南山区', '科兴科学园');

-- ----------------------------
-- Table structure for oms_order
-- ----------------------------
DROP TABLE IF EXISTS `oms_order`;
CREATE TABLE `oms_order`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `member_id` bigint(0) NOT NULL,
  `coupon_id` bigint(0) NULL DEFAULT NULL,
  `order_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单编号',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '提交时间',
  `member_username` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户帐号',
  `total_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '订单总金额',
  `pay_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '应付金额（实际支付金额）',
  `freight_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '运费金额',
  `promotion_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '促销优化金额（促销价、满减、阶梯价）',
  `integration_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '积分抵扣金额',
  `coupon_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '优惠券抵扣金额',
  `discount_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '管理员后台调整订单使用的折扣金额',
  `pay_type` int(0) NULL DEFAULT NULL COMMENT '支付方式：0->未支付；1->支付宝；2->微信',
  `source_type` int(0) NULL DEFAULT NULL COMMENT '订单来源：0->PC订单；1->app订单',
  `status` int(0) NULL DEFAULT NULL COMMENT '订单状态：0->待付款；1->待发货；2->已发货；3->已完成；4->已关闭；5->无效订单',
  `order_type` int(0) NULL DEFAULT NULL COMMENT '订单类型：0->正常订单；1->秒杀订单',
  `delivery_company` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流公司(配送方式)',
  `delivery_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流单号',
  `auto_confirm_day` int(0) NULL DEFAULT NULL COMMENT '自动确认时间（天）',
  `integration` int(0) NULL DEFAULT NULL COMMENT '可以获得的积分',
  `growth` int(0) NULL DEFAULT NULL COMMENT '可以活动的成长值',
  `promotion_info` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动信息',
  `bill_type` int(0) NULL DEFAULT NULL COMMENT '发票类型：0->不开发票；1->电子发票；2->纸质发票',
  `bill_header` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发票抬头',
  `bill_content` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发票内容',
  `bill_receiver_phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收票人电话',
  `bill_receiver_email` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收票人邮箱',
  `receiver_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人姓名',
  `receiver_phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人电话',
  `receiver_post_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人邮编',
  `receiver_province` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省份/直辖市',
  `receiver_city` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '城市',
  `receiver_region` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区',
  `receiver_detail_address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  `note` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单备注',
  `confirm_status` int(0) NULL DEFAULT NULL COMMENT '确认收货状态：0->未确认；1->已确认',
  `delete_status` int(0) NOT NULL DEFAULT 0 COMMENT '删除状态：0->未删除；1->已删除',
  `use_integration` int(0) NULL DEFAULT NULL COMMENT '下单时使用的积分',
  `payment_time` datetime(0) NULL DEFAULT NULL COMMENT '支付时间',
  `delivery_time` datetime(0) NULL DEFAULT NULL COMMENT '发货时间',
  `receive_time` datetime(0) NULL DEFAULT NULL COMMENT '确认收货时间',
  `comment_time` datetime(0) NULL DEFAULT NULL COMMENT '评价时间',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_order
-- ----------------------------
INSERT INTO `oms_order` VALUES (12, 1, 2, '201809150101000001', '2018-09-15 12:24:27', 'test', 18732.00, 16377.75, 80.00, 2344.25, 0.00, 10.00, 10.00, 0, 1, 4, 0, '', '', 15, 13284, 13284, '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', NULL, NULL, NULL, NULL, NULL, '大梨3', '18033441849', '518000', '江苏省', '常州市', '天宁区', '东晓街道', '7897897', 0, 0, NULL, NULL, NULL, NULL, NULL, '2020-01-20 07:56:23');
INSERT INTO `oms_order` VALUES (13, 1, 2, '201809150102000002', '2018-09-15 14:24:29', 'test', 18732.00, 16377.75, 0.00, 2344.25, 0.00, 10.00, 0.00, 1, 1, 0, 0, '圆通快递', '234234', 15, 13284, 13284, '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 0, 1000, '2018-10-11 14:04:19', '2020-01-20 14:47:36', NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (14, 1, 2, '201809130101000001', '2018-09-13 16:57:40', 'test', 18732.00, 16377.75, 0.00, 2344.25, 0.00, 10.00, 0.00, 2, 1, 0, 0, '顺丰快递', '201707196398345', 15, 13284, 13284, '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', '90-0-', 0, 0, NULL, '2018-10-13 13:44:04', '2018-10-16 13:43:41', NULL, NULL, '2020-01-19 08:38:33');
INSERT INTO `oms_order` VALUES (15, 1, 2, '201809130102000002', '2018-09-13 17:03:00', 'test', 18732.00, 16377.75, 0.00, 2344.25, 0.00, 10.00, 0.00, 1, 1, 3, 0, '顺丰快递', '201707196398346', 15, 13284, 13284, '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 1, 0, NULL, '2018-10-13 13:44:54', '2018-10-16 13:45:01', '2018-10-18 14:05:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (16, 1, 2, '201809140101000001', '2018-09-14 16:16:16', 'test', 18732.00, 16377.75, 0.00, 2344.25, 0.00, 10.00, 0.00, 2, 1, 4, 0, NULL, NULL, 15, 13284, 13284, '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (17, 1, 2, '201809150101000003', '2018-09-15 12:24:27', 'test', 18732.00, 16377.75, 0.00, 2344.25, 0.00, 10.00, 0.00, 0, 1, 4, 0, '顺丰快递', '201707196398345', 15, NULL, NULL, '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 0, NULL, NULL, '2018-10-12 14:01:28', NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (18, 1, 2, '201809150102000004', '2018-09-15 14:24:29', 'test', 18732.00, 16377.75, 0.00, 2344.25, 0.00, 10.00, 0.00, 1, 1, 2, 0, '韵达快递', '23423423', 15, NULL, NULL, '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 0, 1000, NULL, '2020-01-20 14:49:11', NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (19, 1, 2, '201809130101000003', '2018-09-13 16:57:40', 'test', 18732.00, 16377.75, 0.00, 2344.25, 0.00, 10.00, 0.00, 2, 1, 2, 0, NULL, NULL, 15, NULL, NULL, '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (20, 1, 2, '201809130102000004', '2018-09-13 17:03:00', 'test', 18732.00, 16377.75, 0.00, 2344.25, 0.00, 10.00, 0.00, 1, 1, 3, 0, NULL, NULL, 15, NULL, NULL, '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (21, 1, 2, '201809140101000002', '2018-09-14 16:16:16', 'test', 18732.00, 16377.75, 0.00, 2344.25, 0.00, 10.00, 0.00, 2, 1, 0, 0, NULL, NULL, 15, 18682, 18682, '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (22, 1, 2, '201809150101000005', '2018-09-15 12:24:27', 'test', 18732.00, 16377.75, 0.00, 2344.25, 0.00, 10.00, 0.00, 0, 1, 4, 0, '顺丰快递', '201707196398345', 15, 0, 0, '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', '234234', 0, 0, NULL, NULL, '2018-10-12 14:01:28', NULL, NULL, '2020-01-20 14:49:35');
INSERT INTO `oms_order` VALUES (23, 1, 2, '201809150102000006', '2018-09-15 14:24:29', 'test', 18732.00, 16377.75, 0.00, 2344.25, 0.00, 10.00, 0.00, 1, 1, 2, 0, '韵达快递', '2位4535', 15, 0, 0, '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 0, 1000, NULL, '2020-01-20 14:50:10', NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (24, 1, 2, '201809130101000005', '2018-09-13 16:57:40', 'test', 18732.00, 16377.75, 0.00, 2344.25, 0.00, 10.00, 0.00, 2, 1, 2, 0, NULL, NULL, 15, 18682, 18682, '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (25, 1, 2, '201809130102000006', '2018-09-13 17:03:00', 'test', 18732.00, 16377.75, 10.00, 2344.25, 0.00, 10.00, 5.00, 1, 1, 4, 0, NULL, NULL, 15, 18682, 18682, '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', NULL, NULL, NULL, NULL, NULL, '大梨22', '18033441849', '518000', '北京市', '北京城区', '东城区', '东城街道', 'xxx', 0, 0, NULL, NULL, NULL, NULL, NULL, '2018-10-30 15:08:31');
INSERT INTO `oms_order` VALUES (26, 1, 2, '201809140101000003', '2018-09-14 16:16:16', 'test', 18732.00, 16377.75, 0.00, 2344.25, 0.00, 10.00, 0.00, 0, 1, 4, 0, NULL, NULL, 15, 18682, 18682, '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for oms_order_item
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_item`;
CREATE TABLE `oms_order_item`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(0) NULL DEFAULT NULL COMMENT '订单id',
  `order_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单编号',
  `product_id` bigint(0) NULL DEFAULT NULL,
  `product_pic` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_brand` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '销售价格',
  `product_quantity` int(0) NULL DEFAULT NULL COMMENT '购买数量',
  `product_sku_id` bigint(0) NULL DEFAULT NULL COMMENT '商品sku编号',
  `product_sku_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品sku条码',
  `product_category_id` bigint(0) NULL DEFAULT NULL COMMENT '商品分类id',
  `sp1` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品的销售属性',
  `sp2` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sp3` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `promotion_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品促销名称',
  `promotion_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品促销分解金额',
  `coupon_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '优惠券优惠分解金额',
  `integration_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '积分优惠分解金额',
  `real_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '该商品经过优惠后的分解金额',
  `gift_integration` int(0) NULL DEFAULT 0,
  `gift_growth` int(0) NULL DEFAULT 0,
  `product_attr` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品销售属性:[{\"key\":\"颜色\",\"value\":\"颜色\"},{\"key\":\"容量\",\"value\":\"4G\"}]',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 45 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单中所包含的商品' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_order_item
-- ----------------------------
INSERT INTO `oms_order_item` VALUES (21, 12, '201809150101000001', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20', '华为', '6946605', 3788.00, 1, 90, '201806070026001', 19, NULL, NULL, NULL, '单品促销', 200.00, 2.02, 0.00, 3585.98, 3788, 3788, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` VALUES (22, 12, '201809150101000001', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8', '小米', '7437788', 2699.00, 3, 98, '201808270027001', 19, NULL, NULL, NULL, '打折优惠：满3件，打7.50折', 674.75, 1.44, 0.00, 2022.81, 2699, 2699, '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES (23, 12, '201809150101000001', 28, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '7437789', 649.00, 1, 102, '201808270028001', 19, NULL, NULL, NULL, '满减优惠：满1000.00元，减120.00元', 57.60, 0.35, 0.00, 591.05, 649, 649, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` VALUES (24, 12, '201809150101000001', 28, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '7437789', 699.00, 1, 103, '201808270028001', 19, NULL, NULL, NULL, '满减优惠：满1000.00元，减120.00元', 62.40, 0.37, 0.00, 636.23, 649, 649, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES (25, 12, '201809150101000001', 29, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5acc5248N6a5f81cd.jpg', 'Apple iPhone 8 Plus', '苹果', '7437799', 5499.00, 1, 106, '201808270029001', 19, NULL, NULL, NULL, '无优惠', 0.00, 2.94, 0.00, 5496.06, 5499, 5499, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES (26, 13, '201809150102000002', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20', '华为', '6946605', 3788.00, 1, 90, '201806070026001', 19, NULL, NULL, NULL, '单品促销', 200.00, 2.02, 0.00, 3585.98, 3788, 3788, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` VALUES (27, 13, '201809150102000002', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8', '小米', '7437788', 2699.00, 3, 98, '201808270027001', 19, NULL, NULL, NULL, '打折优惠：满3件，打7.50折', 674.75, 1.44, 0.00, 2022.81, 2699, 2699, '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES (28, 13, '201809150102000002', 28, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '7437789', 649.00, 1, 102, '201808270028001', 19, NULL, NULL, NULL, '满减优惠：满1000.00元，减120.00元', 57.60, 0.35, 0.00, 591.05, 649, 649, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` VALUES (29, 13, '201809150102000002', 28, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '7437789', 699.00, 1, 103, '201808270028001', 19, NULL, NULL, NULL, '满减优惠：满1000.00元，减120.00元', 62.40, 0.37, 0.00, 636.23, 649, 649, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES (30, 13, '201809150102000002', 29, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5acc5248N6a5f81cd.jpg', 'Apple iPhone 8 Plus', '苹果', '7437799', 5499.00, 1, 106, '201808270029001', 19, NULL, NULL, NULL, '无优惠', 0.00, 2.94, 0.00, 5496.06, 5499, 5499, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES (31, 14, '201809130101000001', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20', '华为', '6946605', 3788.00, 1, 90, '201806070026001', 19, NULL, NULL, NULL, '单品促销', 200.00, 2.02, 0.00, 3585.98, 3788, 3788, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` VALUES (32, 14, '201809130101000001', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8', '小米', '7437788', 2699.00, 3, 98, '201808270027001', 19, NULL, NULL, NULL, '打折优惠：满3件，打7.50折', 674.75, 1.44, 0.00, 2022.81, 2699, 2699, '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES (33, 14, '201809130101000001', 28, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '7437789', 649.00, 1, 102, '201808270028001', 19, NULL, NULL, NULL, '满减优惠：满1000.00元，减120.00元', 57.60, 0.35, 0.00, 591.05, 649, 649, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` VALUES (34, 14, '201809130101000001', 28, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '7437789', 699.00, 1, 103, '201808270028001', 19, NULL, NULL, NULL, '满减优惠：满1000.00元，减120.00元', 62.40, 0.37, 0.00, 636.23, 649, 649, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES (35, 14, '201809130101000001', 29, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5acc5248N6a5f81cd.jpg', 'Apple iPhone 8 Plus', '苹果', '7437799', 5499.00, 1, 106, '201808270029001', 19, NULL, NULL, NULL, '无优惠', 0.00, 2.94, 0.00, 5496.06, 5499, 5499, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES (36, 15, '201809130101000001', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20', '华为', '6946605', 3788.00, 1, 90, '201806070026001', 19, NULL, NULL, NULL, '单品促销', 200.00, 2.02, 0.00, 3585.98, 3788, 3788, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` VALUES (37, 15, '201809130101000001', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8', '小米', '7437788', 2699.00, 3, 98, '201808270027001', 19, NULL, NULL, NULL, '打折优惠：满3件，打7.50折', 674.75, 1.44, 0.00, 2022.81, 2699, 2699, '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES (38, 15, '201809130101000001', 28, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '7437789', 649.00, 1, 102, '201808270028001', 19, NULL, NULL, NULL, '满减优惠：满1000.00元，减120.00元', 57.60, 0.35, 0.00, 591.05, 649, 649, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` VALUES (39, 15, '201809130101000001', 28, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '7437789', 699.00, 1, 103, '201808270028001', 19, NULL, NULL, NULL, '满减优惠：满1000.00元，减120.00元', 62.40, 0.37, 0.00, 636.23, 649, 649, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES (40, 15, '201809130101000001', 29, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5acc5248N6a5f81cd.jpg', 'Apple iPhone 8 Plus', '苹果', '7437799', 5499.00, 1, 106, '201808270029001', 19, NULL, NULL, NULL, '无优惠', 0.00, 2.94, 0.00, 5496.06, 5499, 5499, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES (41, 16, '201809140101000001', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20', '华为', '6946605', 3788.00, 1, 90, '201806070026001', 19, NULL, NULL, NULL, '单品促销', 200.00, 2.02, 0.00, 3585.98, 3788, 3788, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` VALUES (42, 16, '201809140101000001', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8', '小米', '7437788', 2699.00, 3, 98, '201808270027001', 19, NULL, NULL, NULL, '打折优惠：满3件，打7.50折', 674.75, 1.44, 0.00, 2022.81, 2699, 2699, '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES (43, 16, '201809140101000001', 28, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '7437789', 649.00, 1, 102, '201808270028001', 19, NULL, NULL, NULL, '满减优惠：满1000.00元，减120.00元', 57.60, 0.35, 0.00, 591.05, 649, 649, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` VALUES (44, 16, '201809140101000001', 28, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '7437789', 699.00, 1, 103, '201808270028001', 19, NULL, NULL, NULL, '满减优惠：满1000.00元，减120.00元', 62.40, 0.37, 0.00, 636.23, 649, 649, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES (45, 16, '201809140101000001', 29, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5acc5248N6a5f81cd.jpg', 'Apple iPhone 8 Plus', '苹果', '7437799', 5499.00, 1, 106, '201808270029001', 19, NULL, NULL, NULL, '无优惠', 0.00, 2.94, 0.00, 5496.06, 5499, 5499, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');

-- ----------------------------
-- Table structure for oms_order_operate_history
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_operate_history`;
CREATE TABLE `oms_order_operate_history`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(0) NULL DEFAULT NULL COMMENT '订单id',
  `operate_man` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作人：用户；系统；后台管理员',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  `order_status` int(0) NULL DEFAULT NULL COMMENT '订单状态：0->待付款；1->待发货；2->已发货；3->已完成；4->已关闭；5->无效订单',
  `note` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单操作历史记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_order_operate_history
-- ----------------------------
INSERT INTO `oms_order_operate_history` VALUES (5, 12, '后台管理员', '2018-10-12 14:01:29', 2, '完成发货');
INSERT INTO `oms_order_operate_history` VALUES (6, 13, '后台管理员', '2018-10-12 14:01:29', 2, '完成发货');
INSERT INTO `oms_order_operate_history` VALUES (7, 12, '后台管理员', '2018-10-12 14:13:10', 4, '订单关闭:买家退货');
INSERT INTO `oms_order_operate_history` VALUES (8, 13, '后台管理员', '2018-10-12 14:13:10', 4, '订单关闭:买家退货');
INSERT INTO `oms_order_operate_history` VALUES (9, 22, '后台管理员', '2018-10-15 16:31:48', 4, '订单关闭:xxx');
INSERT INTO `oms_order_operate_history` VALUES (10, 22, '后台管理员', '2018-10-15 16:35:08', 4, '订单关闭:xxx');
INSERT INTO `oms_order_operate_history` VALUES (11, 22, '后台管理员', '2018-10-15 16:35:59', 4, '订单关闭:xxx');
INSERT INTO `oms_order_operate_history` VALUES (12, 17, '后台管理员', '2018-10-15 16:43:40', 4, '订单关闭:xxx');
INSERT INTO `oms_order_operate_history` VALUES (13, 25, '后台管理员', '2018-10-15 16:52:14', 4, '订单关闭:xxx');
INSERT INTO `oms_order_operate_history` VALUES (14, 26, '后台管理员', '2018-10-15 16:52:14', 4, '订单关闭:xxx');
INSERT INTO `oms_order_operate_history` VALUES (15, 23, '后台管理员', '2018-10-16 14:41:28', 2, '完成发货');
INSERT INTO `oms_order_operate_history` VALUES (16, 13, '后台管理员', '2018-10-16 14:42:17', 2, '完成发货');
INSERT INTO `oms_order_operate_history` VALUES (17, 18, '后台管理员', '2018-10-16 14:42:17', 2, '完成发货');
INSERT INTO `oms_order_operate_history` VALUES (18, 26, '后台管理员', '2018-10-30 14:37:44', 4, '订单关闭:关闭订单');
INSERT INTO `oms_order_operate_history` VALUES (19, 25, '后台管理员', '2018-10-30 15:07:01', 0, '修改收货人信息');
INSERT INTO `oms_order_operate_history` VALUES (20, 25, '后台管理员', '2018-10-30 15:08:13', 0, '修改费用信息');
INSERT INTO `oms_order_operate_history` VALUES (21, 25, '后台管理员', '2018-10-30 15:08:31', 0, '修改备注信息：xxx');
INSERT INTO `oms_order_operate_history` VALUES (22, 25, '后台管理员', '2018-10-30 15:08:39', 4, '订单关闭:2222');
INSERT INTO `oms_order_operate_history` VALUES (23, 12, '后台管理员', '2020-01-19 07:59:29', 4, '修改备注信息：7766767');
INSERT INTO `oms_order_operate_history` VALUES (24, 12, '后台管理员', '2020-01-19 08:00:16', 4, '修改备注信息：我是个好孩子');
INSERT INTO `oms_order_operate_history` VALUES (25, 12, '后台管理员', '2020-01-19 08:00:20', 4, '修改备注信息：我是个好孩子');
INSERT INTO `oms_order_operate_history` VALUES (26, 12, '后台管理员', '2020-01-19 08:21:37', 4, '修改备注信息：-0=-=-=-=');
INSERT INTO `oms_order_operate_history` VALUES (27, 12, '后台管理员', '2020-01-19 08:35:56', 4, '修改备注信息：7897897');
INSERT INTO `oms_order_operate_history` VALUES (28, 14, '后台管理员', '2020-01-19 08:38:33', 2, '修改备注信息：90-0-');
INSERT INTO `oms_order_operate_history` VALUES (29, 12, '后台管理员', '2020-01-19 18:00:57', 0, '修改收货人信息');
INSERT INTO `oms_order_operate_history` VALUES (30, 12, '后台管理员', '2020-01-20 07:56:23', 0, '修改费用信息');
INSERT INTO `oms_order_operate_history` VALUES (31, 12, '后台管理员', '2020-01-20 08:14:47', 4, '订单关闭:456456');
INSERT INTO `oms_order_operate_history` VALUES (33, 12, '后台管理员', '2020-01-20 08:21:05', 4, '订单关闭:我要关闭');
INSERT INTO `oms_order_operate_history` VALUES (35, 13, '后台管理员', '2020-01-20 14:47:52', 2, '完成发货');
INSERT INTO `oms_order_operate_history` VALUES (36, 18, '后台管理员', '2020-01-20 14:49:11', 2, '完成发货');
INSERT INTO `oms_order_operate_history` VALUES (37, 22, '后台管理员', '2020-01-20 14:49:32', 4, '修改备注信息：234234');
INSERT INTO `oms_order_operate_history` VALUES (38, 22, '后台管理员', '2020-01-20 14:49:35', 4, '修改备注信息：234234');
INSERT INTO `oms_order_operate_history` VALUES (39, 23, '后台管理员', '2020-01-20 14:50:10', 2, '完成发货');

-- ----------------------------
-- Table structure for oms_order_return_apply
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_return_apply`;
CREATE TABLE `oms_order_return_apply`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(0) NULL DEFAULT NULL COMMENT '订单id',
  `company_address_id` bigint(0) NULL DEFAULT NULL COMMENT '收货地址表id',
  `product_id` bigint(0) NULL DEFAULT NULL COMMENT '退货商品id',
  `order_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单编号',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '申请时间',
  `member_username` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '会员用户名',
  `return_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '退款金额',
  `return_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '退货人姓名',
  `return_phone` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '退货人电话',
  `status` int(0) NULL DEFAULT NULL COMMENT '申请状态：0->待处理；1->退货中；2->已完成；3->已拒绝',
  `handle_time` datetime(0) NULL DEFAULT NULL COMMENT '处理时间',
  `product_pic` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品图片',
  `product_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `product_brand` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品品牌',
  `product_attr` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品销售属性：颜色：红色；尺码：xl;',
  `product_count` int(0) NULL DEFAULT NULL COMMENT '退货数量',
  `product_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品单价',
  `product_real_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品实际支付单价',
  `reason` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '原因',
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `proof_pics` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '凭证图片，以逗号隔开',
  `handle_note` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '处理备注',
  `handle_man` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '处理人员',
  `receive_man` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人',
  `receive_time` datetime(0) NULL DEFAULT NULL COMMENT '收货时间',
  `receive_note` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单退货申请' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_order_return_apply
-- ----------------------------
INSERT INTO `oms_order_return_apply` VALUES (3, 12, 2, 26, '201809150101000001', '2018-10-17 14:34:57', 'test', 19999.00, '大梨', '18000000000', 0, '2020-01-19 08:08:41', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20', '华为', '颜色：金色;内存：16G', 1, 3788.00, 3585.98, '质量问题', '老是卡', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg,http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', NULL, 'admin', 'admin', '2020-01-19 08:09:42', '我已经收货了');
INSERT INTO `oms_order_return_apply` VALUES (4, 12, 2, 27, '201809150101000001', '2018-10-17 14:40:21', 'test', 3585.98, '大梨', '18000000000', 1, '2018-10-18 13:54:10', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8', '小米', '颜色：黑色;内存：32G', 1, 2699.00, 2022.81, '质量问题', '不够高端', '', '已经处理了', 'admin', NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` VALUES (5, 12, 3, 28, '201809150101000001', '2018-10-17 14:44:18', 'test', 3585.98, '大梨', '18000000000', 2, '2018-10-18 13:55:28', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '颜色：金色;内存：16G', 1, 649.00, 591.05, '质量问题', '颜色太土', '', '已经处理了', 'admin', 'admin', '2018-10-18 13:55:58', '已经处理了');
INSERT INTO `oms_order_return_apply` VALUES (9, 14, 2, 26, '201809130101000001', '2018-10-17 14:34:57', 'test', 3500.00, '大梨', '18000000000', 2, '2018-10-24 15:44:56', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20', '华为', '颜色：金色;内存：16G', 1, 3788.00, 3585.98, '质量问题', '老是卡', '', '呵呵', 'admin', 'admin', '2018-10-24 15:46:35', '收货了');
INSERT INTO `oms_order_return_apply` VALUES (10, 14, NULL, 27, '201809130101000001', '2018-10-17 14:40:21', 'test', NULL, '大梨', '18000000000', 3, '2018-10-24 15:46:57', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8', '小米', '颜色：黑色;内存：32G', 1, 2699.00, 2022.81, '质量问题', '不够高端', '', '就是不退', 'admin', NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` VALUES (11, 14, 2, 28, '201809130101000001', '2018-10-17 14:44:18', 'test', 591.05, '大梨', '18000000000', 1, '2018-10-24 17:09:04', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '颜色：金色;内存：16G', 1, 649.00, 591.05, '质量问题', '颜色太土', '', '可以退款', 'admin', NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` VALUES (12, 15, 3, 26, '201809130102000002', '2018-10-17 14:34:57', 'test', 3500.00, '大梨', '18000000000', 2, '2018-10-24 17:22:54', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20', '华为', '颜色：金色;内存：16G', 1, 3788.00, 3585.98, '质量问题', '老是卡', '', '退货了', 'admin', 'admin', '2018-10-24 17:23:06', '收货了');
INSERT INTO `oms_order_return_apply` VALUES (13, 15, NULL, 27, '201809130102000002', '2018-10-17 14:40:21', 'test', NULL, '大梨', '18000000000', 3, '2018-10-24 17:23:30', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8', '小米', '颜色：黑色;内存：32G', 1, 2699.00, 2022.81, '质量问题', '不够高端', '', '无法退货', 'admin', NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` VALUES (15, 16, NULL, 26, '201809140101000001', '2018-10-17 14:34:57', 'test', NULL, '大梨', '18000000000', 0, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20', '华为', '颜色：金色;内存：16G', 1, 3788.00, 3585.98, '质量问题', '老是卡', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` VALUES (16, 16, NULL, 27, '201809140101000001', '2018-10-17 14:40:21', 'test', NULL, '大梨', '18000000000', 0, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8', '小米', '颜色：黑色;内存：32G', 1, 2699.00, 2022.81, '质量问题', '不够高端', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` VALUES (17, 16, NULL, 28, '201809140101000001', '2018-10-17 14:44:18', 'test', NULL, '大梨', '18000000000', 0, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '颜色：金色;内存：16G', 1, 649.00, 591.05, '质量问题', '颜色太土', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` VALUES (18, 17, NULL, 26, '201809150101000003', '2018-10-17 14:34:57', 'test', NULL, '大梨', '18000000000', 0, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20', '华为', '颜色：金色;内存：16G', 1, 3788.00, 3585.98, '质量问题', '老是卡', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` VALUES (19, 17, NULL, 27, '201809150101000003', '2018-10-17 14:40:21', 'test', NULL, '大梨', '18000000000', 0, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8', '小米', '颜色：黑色;内存：32G', 1, 2699.00, 2022.81, '质量问题', '不够高端', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` VALUES (20, 17, NULL, 28, '201809150101000003', '2018-10-17 14:44:18', 'test', NULL, '大梨', '18000000000', 0, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '颜色：金色;内存：16G', 1, 649.00, 591.05, '质量问题', '颜色太土', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` VALUES (21, 18, NULL, 26, '201809150102000004', '2018-10-17 14:34:57', 'test', NULL, '大梨', '18000000000', 0, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20', '华为', '颜色：金色;内存：16G', 1, 3788.00, 3585.98, '质量问题', '老是卡', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` VALUES (22, 18, NULL, 27, '201809150102000004', '2018-10-17 14:40:21', 'test', NULL, '大梨', '18000000000', 0, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8', '小米', '颜色：黑色;内存：32G', 1, 2699.00, 2022.81, '质量问题', '不够高端', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` VALUES (23, 18, NULL, 28, '201809150102000004', '2018-10-17 14:44:18', 'test', NULL, '大梨', '18000000000', 0, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '颜色：金色;内存：16G', 1, 649.00, 591.05, '质量问题', '颜色太土', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` VALUES (24, 19, NULL, 26, '201809130101000003', '2018-10-17 14:34:57', 'test', NULL, '大梨', '18000000000', 0, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20', '华为', '颜色：金色;内存：16G', 1, 3788.00, 3585.98, '质量问题', '老是卡', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` VALUES (25, 19, NULL, 27, '201809130101000003', '2018-10-17 14:40:21', 'test', NULL, '大梨', '18000000000', 0, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8', '小米', '颜色：黑色;内存：32G', 1, 2699.00, 2022.81, '质量问题', '不够高端', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` VALUES (26, 19, NULL, 28, '201809130101000003', '2018-10-17 14:44:18', 'test', NULL, '大梨', '18000000000', 0, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '颜色：金色;内存：16G', 1, 649.00, 591.05, '质量问题', '颜色太土', '', NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for oms_order_return_reason
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_return_reason`;
CREATE TABLE `oms_order_return_reason`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '退货类型',
  `sort` int(0) NULL DEFAULT NULL,
  `status` int(0) NULL DEFAULT NULL COMMENT '状态：0->不启用；1->启用',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '退货原因表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_order_return_reason
-- ----------------------------
INSERT INTO `oms_order_return_reason` VALUES (1, '质量问题', 1, 1, '2018-10-17 10:00:45');
INSERT INTO `oms_order_return_reason` VALUES (2, '尺码太大', 1, 0, '2018-10-17 10:01:03');
INSERT INTO `oms_order_return_reason` VALUES (3, '颜色不喜欢', 1, 1, '2018-10-17 10:01:13');
INSERT INTO `oms_order_return_reason` VALUES (4, '7天无理由退货', 1, 1, '2018-10-17 10:01:47');
INSERT INTO `oms_order_return_reason` VALUES (5, '价格问题', 1, 0, '2018-10-17 10:01:57');
INSERT INTO `oms_order_return_reason` VALUES (12, '发票问题', 0, 1, '2018-10-19 16:28:36');
INSERT INTO `oms_order_return_reason` VALUES (13, '其他问题', 0, 1, '2018-10-19 16:28:51');
INSERT INTO `oms_order_return_reason` VALUES (14, '物流问题', 0, 1, '2018-10-19 16:29:01');
INSERT INTO `oms_order_return_reason` VALUES (15, '售后问题', 0, 1, '2018-10-19 16:29:11');
INSERT INTO `oms_order_return_reason` VALUES (16, '45646', 0, 1, '2020-02-04 17:41:31');
INSERT INTO `oms_order_return_reason` VALUES (18, '565656', 0, 1, '2020-02-04 17:42:59');
INSERT INTO `oms_order_return_reason` VALUES (19, '456456546', 0, 1, '2020-02-04 17:44:38');
INSERT INTO `oms_order_return_reason` VALUES (20, '898989', 0, 1, '2020-02-04 17:46:32');

-- ----------------------------
-- Table structure for oms_order_setting
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_setting`;
CREATE TABLE `oms_order_setting`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `flash_order_overtime` int(0) NULL DEFAULT NULL COMMENT '秒杀订单超时关闭时间(分)',
  `normal_order_overtime` int(0) NULL DEFAULT NULL COMMENT '正常订单超时时间(分)',
  `confirm_overtime` int(0) NULL DEFAULT NULL COMMENT '发货后自动确认收货时间（天）',
  `finish_overtime` int(0) NULL DEFAULT NULL COMMENT '自动完成交易时间，不能申请售后（天）',
  `comment_overtime` int(0) NULL DEFAULT NULL COMMENT '订单完成后自动好评时间（天）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单设置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_order_setting
-- ----------------------------
INSERT INTO `oms_order_setting` VALUES (1, 60, 120, 15, 8, 8);

-- ----------------------------
-- Table structure for pms_brand
-- ----------------------------
DROP TABLE IF EXISTS `pms_brand`;
CREATE TABLE `pms_brand`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `first_letter` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '首字母',
  `sort` int(0) NULL DEFAULT NULL,
  `factory_status` int(0) NULL DEFAULT NULL COMMENT '是否为品牌制造商：0->不是；1->是',
  `show_status` int(0) NULL DEFAULT NULL,
  `product_count` int(0) NULL DEFAULT NULL COMMENT '产品数量',
  `product_comment_count` int(0) NULL DEFAULT NULL COMMENT '产品评论数量',
  `logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '品牌logo',
  `big_pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '专区大图',
  `brand_story` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '品牌故事',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 62 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '品牌表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pms_brand
-- ----------------------------
INSERT INTO `pms_brand` VALUES (1, '万和', 'W', 0, 1, 1, 100, 100, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/timg(5).jpg', '', 'Victoria\'s Secret的故事');
INSERT INTO `pms_brand` VALUES (2, '三星', 'S', 100, 1, 1, 100, 100, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/timg (1).jpg', NULL, '三星的故事');
INSERT INTO `pms_brand` VALUES (3, '华为', 'H', 100, 1, 1, 100, 100, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/17f2dd9756d9d333bee8e60ce8c03e4c_222_222.jpg', NULL, 'Victoria\'s Secret的故事');
INSERT INTO `pms_brand` VALUES (4, '格力', 'G', 30, 1, 1, 100, 100, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/dc794e7e74121272bbe3ce9bc41ec8c3_222_222.jpg', NULL, 'Victoria\'s Secret的故事');
INSERT INTO `pms_brand` VALUES (5, '方太', 'F', 20, 1, 1, 100, 100, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/timg (4).jpg', NULL, 'Victoria\'s Secret的故事');
INSERT INTO `pms_brand` VALUES (6, '小米', 'M', 500, 0, 0, 100, 100, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/1e34aef2a409119018a4c6258e39ecfb_222_222.png', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180518/5afd7778Nf7800b75.jpg', '小米手机的故事');
INSERT INTO `pms_brand` VALUES (21, 'OPPO', 'O', 0, 1, 1, 88, 500, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/timg(6).jpg', '', 'string');
INSERT INTO `pms_brand` VALUES (49, '七匹狼', 'S', 200, 1, 1, 77, 400, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/18d8bc3eb13533fab466d702a0d3fd1f40345bcd.jpg', NULL, 'BOOB的故事');
INSERT INTO `pms_brand` VALUES (50, '海澜之家', 'H', 200, 1, 1, 66, 300, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/99d3279f1029d32b929343b09d3c72de_222_222.jpg', '', '海澜之家的故事');
INSERT INTO `pms_brand` VALUES (51, '苹果', 'A', 200, 1, 1, 55, 200, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/timg.jpg', NULL, '苹果的故事');
INSERT INTO `pms_brand` VALUES (58, 'NIKE', 'N', 0, 1, 1, 33, 100, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/timg (51).jpg', '', 'NIKE的故事');

-- ----------------------------
-- Table structure for pms_member_price
-- ----------------------------
DROP TABLE IF EXISTS `pms_member_price`;
CREATE TABLE `pms_member_price`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(0) NULL DEFAULT NULL,
  `member_level_id` bigint(0) NULL DEFAULT NULL,
  `member_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '会员价格',
  `member_level_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 314 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品会员价格表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pms_member_price
-- ----------------------------
INSERT INTO `pms_member_price` VALUES (26, 7, 1, 500.00, NULL);
INSERT INTO `pms_member_price` VALUES (27, 8, 1, 500.00, NULL);
INSERT INTO `pms_member_price` VALUES (28, 9, 1, 500.00, NULL);
INSERT INTO `pms_member_price` VALUES (29, 10, 1, 500.00, NULL);
INSERT INTO `pms_member_price` VALUES (30, 11, 1, 500.00, NULL);
INSERT INTO `pms_member_price` VALUES (31, 12, 1, 500.00, NULL);
INSERT INTO `pms_member_price` VALUES (32, 13, 1, 500.00, NULL);
INSERT INTO `pms_member_price` VALUES (33, 14, 1, 500.00, NULL);
INSERT INTO `pms_member_price` VALUES (37, 18, 1, 500.00, NULL);
INSERT INTO `pms_member_price` VALUES (44, 7, 2, 480.00, NULL);
INSERT INTO `pms_member_price` VALUES (45, 7, 3, 450.00, NULL);
INSERT INTO `pms_member_price` VALUES (52, 22, 1, NULL, NULL);
INSERT INTO `pms_member_price` VALUES (53, 22, 2, NULL, NULL);
INSERT INTO `pms_member_price` VALUES (54, 22, 3, NULL, NULL);
INSERT INTO `pms_member_price` VALUES (58, 24, 1, NULL, NULL);
INSERT INTO `pms_member_price` VALUES (59, 24, 2, NULL, NULL);
INSERT INTO `pms_member_price` VALUES (60, 24, 3, NULL, NULL);
INSERT INTO `pms_member_price` VALUES (112, 23, 1, 88.00, '黄金会员');
INSERT INTO `pms_member_price` VALUES (113, 23, 2, 88.00, '白金会员');
INSERT INTO `pms_member_price` VALUES (114, 23, 3, 66.00, '钻石会员');
INSERT INTO `pms_member_price` VALUES (142, 31, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (143, 31, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (144, 31, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (148, 32, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (149, 32, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (150, 32, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (154, 33, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (155, 33, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (156, 33, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (172, 35, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (173, 35, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (174, 35, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (175, 34, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (176, 34, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (177, 34, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (178, 30, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (179, 30, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (180, 30, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (195, 28, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (196, 28, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (197, 28, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (198, 29, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (199, 29, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (200, 29, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (201, 37, 1, 17.00, '黄金会员');
INSERT INTO `pms_member_price` VALUES (202, 37, 2, 18.00, '白金会员');
INSERT INTO `pms_member_price` VALUES (203, 37, 3, 19.00, '钻石会员');
INSERT INTO `pms_member_price` VALUES (204, 38, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (205, 38, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (206, 38, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (207, 39, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (208, 39, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (209, 39, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (210, 40, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (211, 40, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (212, 40, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (213, 41, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (214, 41, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (215, 41, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (216, 42, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (217, 42, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (218, 42, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (219, 43, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (220, 43, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (221, 43, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (222, 44, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (223, 44, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (224, 44, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (225, 45, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (226, 45, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (227, 45, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (231, 47, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (232, 47, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (233, 47, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (234, 52, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (235, 52, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (236, 52, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (237, 53, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (238, 53, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (239, 53, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (240, 54, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (241, 54, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (242, 54, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (243, 55, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (244, 55, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (245, 55, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (246, 56, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (247, 56, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (248, 56, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (249, 57, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (250, 57, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (251, 57, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (252, 58, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (253, 58, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (254, 58, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (264, 59, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (265, 59, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (266, 59, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (267, 60, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (268, 60, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (269, 60, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (273, 46, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (274, 46, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (275, 46, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (276, 61, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (277, 61, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (278, 61, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (279, 62, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (280, 62, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (281, 62, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (282, 36, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (283, 36, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (284, 36, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (300, 26, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (301, 26, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (302, 26, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (303, 27, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (304, 27, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (305, 27, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (312, 63, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (313, 63, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (314, 63, 3, NULL, '钻石会员');

-- ----------------------------
-- Table structure for pms_product
-- ----------------------------
DROP TABLE IF EXISTS `pms_product`;
CREATE TABLE `pms_product`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `brand_id` bigint(0) NULL DEFAULT NULL,
  `product_category_id` bigint(0) NULL DEFAULT NULL,
  `feight_template_id` bigint(0) NULL DEFAULT NULL,
  `product_attribute_category_id` bigint(0) NULL DEFAULT NULL,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '显示的主图片',
  `product_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '货号',
  `delete_status` int(0) NULL DEFAULT NULL COMMENT '删除状态：0->未删除；1->已删除',
  `publish_status` int(0) NULL DEFAULT NULL COMMENT '上架状态：0->下架；1->上架',
  `new_status` int(0) NULL DEFAULT NULL COMMENT '新品状态:0->不是新品；1->新品',
  `recommand_status` int(0) NULL DEFAULT NULL COMMENT '推荐状态；0->不推荐；1->推荐',
  `verify_status` int(0) NULL DEFAULT NULL COMMENT '审核状态：0->未审核；1->审核通过',
  `sort` int(0) NULL DEFAULT NULL COMMENT '排序',
  `sale` int(0) NULL DEFAULT NULL COMMENT '销量',
  `price` decimal(10, 2) NULL DEFAULT NULL,
  `promotion_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '促销价格',
  `gift_growth` int(0) NULL DEFAULT 0 COMMENT '赠送的成长值',
  `gift_point` int(0) NULL DEFAULT 0 COMMENT '赠送的积分',
  `use_point_limit` int(0) NULL DEFAULT NULL COMMENT '限制使用的积分数',
  `sub_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '副标题',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '商品描述',
  `original_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '市场价',
  `stock` int(0) NULL DEFAULT NULL COMMENT '库存',
  `low_stock` int(0) NULL DEFAULT NULL COMMENT '库存预警值',
  `unit` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '单位',
  `weight` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品重量，默认为克',
  `preview_status` int(0) NULL DEFAULT NULL COMMENT '是否为预告商品：0->不是；1->是',
  `service_ids` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '以逗号分割的产品服务：1->无忧退货；2->快速退款；3->免费包邮',
  `keywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `album_pics` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '画册图片，连产品图片限制为5张，以逗号分割',
  `detail_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `detail_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `detail_html` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '产品详情网页内容',
  `detail_mobile_html` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '移动端网页详情',
  `promotion_start_time` datetime(0) NULL DEFAULT NULL COMMENT '促销开始时间',
  `promotion_end_time` datetime(0) NULL DEFAULT NULL COMMENT '促销结束时间',
  `promotion_per_limit` int(0) NULL DEFAULT NULL COMMENT '活动限购数量',
  `promotion_type` int(0) NULL DEFAULT NULL COMMENT '促销类型：0->没有促销使用原价;1->使用促销价；2->使用会员价；3->使用阶梯价格；4->使用满减价格；5->限时购',
  `brand_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '品牌名称',
  `product_category_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品分类名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 63 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pms_product
-- ----------------------------
INSERT INTO `pms_product` VALUES (1, 49, 7, 0, 0, '银色星芒刺绣网纱底裤', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86577', 1, 1, 1, 1, 1, 100, 0, 100.00, NULL, 0, 100, NULL, '111', '111', 120.00, 100, 20, '件', 1000.00, 0, NULL, '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', NULL, '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', NULL, NULL, NULL, 0, '七匹狼', '外套');
INSERT INTO `pms_product` VALUES (2, 49, 7, 0, 0, '银色星芒刺绣网纱底裤2', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86578', 1, 1, 1, 1, 1, 1, 0, 100.00, NULL, 0, 100, NULL, '111', '111', 120.00, 100, 20, '件', 1000.00, 0, NULL, '银色星芒刺绣网纱底裤2', '银色星芒刺绣网纱底裤', NULL, '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', '<p>银色星芒刺绣网纱底裤</p>', '<p>银色星芒刺绣网纱底裤</p>', NULL, NULL, NULL, 0, '七匹狼', '外套');
INSERT INTO `pms_product` VALUES (3, 1, 7, 0, 0, '银色星芒刺绣网纱底裤3', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86579', 1, 1, 1, 1, 1, 1, 0, 100.00, NULL, 0, 100, NULL, '111', '111', 120.00, 100, 20, '件', 1000.00, 0, NULL, '银色星芒刺绣网纱底裤3', '银色星芒刺绣网纱底裤', NULL, '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', NULL, NULL, NULL, 0, '万和', '外套');
INSERT INTO `pms_product` VALUES (4, 1, 7, 0, 0, '银色星芒刺绣网纱底裤4', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86580', 1, 1, 1, 1, 1, 1, 0, 100.00, NULL, 0, 100, NULL, '111', '111', 120.00, 100, 20, '件', 1000.00, 0, NULL, '银色星芒刺绣网纱底裤4', '银色星芒刺绣网纱底裤', NULL, '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', NULL, NULL, NULL, 0, '万和', '外套');
INSERT INTO `pms_product` VALUES (5, 1, 7, 0, 0, '银色星芒刺绣网纱底裤5', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86581', 1, 0, 1, 1, 1, 1, 0, 100.00, NULL, 0, 100, NULL, '111', '111', 120.00, 100, 20, '件', 1000.00, 0, NULL, '银色星芒刺绣网纱底裤5', '银色星芒刺绣网纱底裤', NULL, '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', NULL, NULL, NULL, 0, '万和', '外套');
INSERT INTO `pms_product` VALUES (6, 1, 7, 0, 0, '银色星芒刺绣网纱底裤6', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86582', 1, 1, 1, 1, 1, 1, 0, 100.00, NULL, 0, 100, NULL, '111', '111', 120.00, 100, 20, '件', 1000.00, 0, NULL, '银色星芒刺绣网纱底裤6', '银色星芒刺绣网纱底裤', NULL, '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', NULL, NULL, NULL, 0, '万和', '外套');
INSERT INTO `pms_product` VALUES (7, 1, 7, 0, 1, '女式超柔软拉毛运动开衫', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86577', 1, 0, 0, 0, 0, 0, 0, 249.00, 0.00, 0, 100, 0, '匠心剪裁，垂感质地', '匠心剪裁，垂感质地', 299.00, 100, 0, '件', 0.00, 0, 'string', '女式超柔软拉毛运动开衫', 'string', 'string', 'string', 'string', 'string', 'string', '2018-04-26 10:41:03', '2018-04-26 10:41:03', 0, 0, '万和', '外套');
INSERT INTO `pms_product` VALUES (8, 1, 7, 0, 1, '女式超柔软拉毛运动开衫1', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86577', 1, 0, 0, 0, 0, 0, 0, 249.00, 0.00, 0, 100, 0, '匠心剪裁，垂感质地', '匠心剪裁，垂感质地', 299.00, 100, 0, '件', 0.00, 0, 'string', '女式超柔软拉毛运动开衫', 'string', 'string', 'string', 'string', 'string', 'string', '2018-04-26 10:41:03', '2018-04-26 10:41:03', 0, 0, '万和', '外套');
INSERT INTO `pms_product` VALUES (9, 1, 7, 0, 1, '女式超柔软拉毛运动开衫1', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86577', 1, 0, 0, 0, 0, 0, 0, 249.00, 0.00, 0, 100, 0, '匠心剪裁，垂感质地', '匠心剪裁，垂感质地', 299.00, 100, 0, '件', 0.00, 0, 'string', '女式超柔软拉毛运动开衫', 'string', 'string', 'string', 'string', 'string', 'string', '2018-04-26 10:41:03', '2018-04-26 10:41:03', 0, 0, '万和', '外套');
INSERT INTO `pms_product` VALUES (10, 1, 7, 0, 1, '女式超柔软拉毛运动开衫1', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86577', 1, 0, 0, 0, 0, 0, 0, 249.00, 0.00, 0, 100, 0, '匠心剪裁，垂感质地', '匠心剪裁，垂感质地', 299.00, 100, 0, '件', 0.00, 0, 'string', '女式超柔软拉毛运动开衫', 'string', 'string', 'string', 'string', 'string', 'string', '2018-04-26 10:41:03', '2018-04-26 10:41:03', 0, 0, '万和', '外套');
INSERT INTO `pms_product` VALUES (11, 1, 7, 0, 1, '女式超柔软拉毛运动开衫1', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86577', 1, 1, 0, 1, 0, 0, 0, 249.00, 0.00, 0, 100, 0, '匠心剪裁，垂感质地', '匠心剪裁，垂感质地', 299.00, 100, 0, '件', 0.00, 0, 'string', '女式超柔软拉毛运动开衫', 'string', 'string', 'string', 'string', 'string', 'string', '2018-04-26 10:41:03', '2018-04-26 10:41:03', 0, 0, '万和', '外套');
INSERT INTO `pms_product` VALUES (12, 1, 7, 0, 1, '女式超柔软拉毛运动开衫2', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86577', 1, 1, 0, 1, 0, 0, 0, 249.00, 0.00, 0, 100, 0, '匠心剪裁，垂感质地', '匠心剪裁，垂感质地', 299.00, 100, 0, '件', 0.00, 0, 'string', '女式超柔软拉毛运动开衫', 'string', 'string', 'string', 'string', 'string', 'string', '2018-04-26 10:41:03', '2018-04-26 10:41:03', 0, 0, '万和', '外套');
INSERT INTO `pms_product` VALUES (13, 1, 7, 0, 1, '女式超柔软拉毛运动开衫3', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86577', 1, 1, 0, 1, 0, 0, 0, 249.00, 0.00, 0, 100, 0, '匠心剪裁，垂感质地', '匠心剪裁，垂感质地', 299.00, 100, 0, '件', 0.00, 0, 'string', '女式超柔软拉毛运动开衫', 'string', 'string', 'string', 'string', 'string', 'string', '2018-04-26 10:41:03', '2018-04-26 10:41:03', 0, 0, '万和', '外套');
INSERT INTO `pms_product` VALUES (14, 1, 7, 0, 1, '女式超柔软拉毛运动开衫3', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86577', 1, 0, 0, 1, 0, 0, 0, 249.00, 0.00, 0, 100, 0, '匠心剪裁，垂感质地', '匠心剪裁，垂感质地', 299.00, 100, 0, '件', 0.00, 0, 'string', '女式超柔软拉毛运动开衫', 'string', 'string', 'string', 'string', 'string', 'string', '2018-04-26 10:41:03', '2018-04-26 10:41:03', 0, 0, '万和', '外套');
INSERT INTO `pms_product` VALUES (18, 1, 7, 0, 1, '女式超柔软拉毛运动开衫3', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86577', 1, 0, 0, 1, 0, 0, 0, 249.00, 0.00, 0, 100, 0, '匠心剪裁，垂感质地', '匠心剪裁，垂感质地', 299.00, 100, 0, '件', 0.00, 0, 'string', '女式超柔软拉毛运动开衫', 'string', 'string', 'string', 'string', 'string', 'string', '2018-04-26 10:41:03', '2018-04-26 10:41:03', 0, 0, '万和', '外套');
INSERT INTO `pms_product` VALUES (22, 6, 7, 0, 1, 'test', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/1522738681.jpg', '', 1, 1, 0, 0, 0, 0, 0, 0.00, NULL, 0, 0, 0, 'test', '', 0.00, 100, 0, '', 0.00, 1, '1,2', '', '', '', '', '', '', '', NULL, NULL, 0, 0, '小米', '外套');
INSERT INTO `pms_product` VALUES (23, 6, 19, 0, 1, '毛衫测试', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/1522738681.jpg', 'NO.1098', 1, 1, 1, 1, 0, 0, 0, 99.00, NULL, 99, 99, 1000, '毛衫测试11', 'xxx', 109.00, 100, 0, '件', 1000.00, 1, '1,2,3', '毛衫测试', '毛衫测试', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/1522738681.jpg,http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/1522738681.jpg', '毛衫测试', '毛衫测试', '<p><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/155x54.bmp\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/APP登录bg1080.jpg\" width=\"500\" height=\"500\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/APP登录界面.jpg\" width=\"500\" height=\"500\" /></p>', '', NULL, NULL, 0, 2, '小米', '手机通讯');
INSERT INTO `pms_product` VALUES (24, 6, 7, 0, NULL, 'xxx', '', '', 1, 0, 0, 0, 0, 0, 0, 0.00, NULL, 0, 0, 0, 'xxx', '', 0.00, 100, 0, '', 0.00, 0, '', '', '', '', '', '', '', '', NULL, NULL, 0, 0, '小米', '外套');
INSERT INTO `pms_product` VALUES (26, 3, 19, 0, 3, '华为 HUAWEI P20 ', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '6946605', 0, 1, 1, 1, 0, 100, 0, 3788.00, NULL, 3788, 3788, 0, 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '', 4288.00, 1000, 0, '件', 0.00, 1, '2,3,1', '', '', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ab46a3cN616bdc41.jpg,http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf5fN2522b9dc.jpg', '', '', '<p><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ad44f1cNf51f3bb0.jpg\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ad44fa8Nfcf71c10.jpg\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ad44fa9N40e78ee0.jpg\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ad457f4N1c94bdda.jpg\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ad457f5Nd30de41d.jpg\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5b10fb0eN0eb053fb.jpg\" /></p>', '', NULL, NULL, 0, 1, '华为', '手机通讯');
INSERT INTO `pms_product` VALUES (27, 6, 19, 0, 3, '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '7437788', 0, 0, 1, 1, 0, 0, 0, 2699.00, NULL, 2699, 2699, 0, '骁龙845处理器，红外人脸解锁，AI变焦双摄，AI语音助手小米6X低至1299，点击抢购', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', 2699.00, 100, 0, '', 0.00, 0, '', '', '', '', '', '', '<p><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b2254e8N414e6d3a.jpg\" width=\"500\" /></p>', '', NULL, NULL, 0, 3, '小米', '手机通讯');
INSERT INTO `pms_product` VALUES (28, 6, 19, 0, 3, '小米 红米5A 全网通版 3GB+32GB 香槟金 移动联通电信4G手机 双卡双待', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '7437789', 0, 1, 1, 1, 0, 0, 0, 649.00, NULL, 649, 649, 0, '8天超长待机，137g轻巧机身，高通骁龙处理器小米6X低至1299，点击抢购', '', 649.00, 100, 0, '', 0.00, 0, '', '', '', '', '', '', '', '', NULL, NULL, 0, 4, '小米', '手机通讯');
INSERT INTO `pms_product` VALUES (29, 51, 19, 0, 3, 'Apple iPhone 8 Plus 64GB 红色特别版 移动联通电信4G手机', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5acc5248N6a5f81cd.jpg', '7437799', 0, 0, 0, 0, 0, 0, 0, 5499.00, NULL, 5499, 5499, 0, '【限时限量抢购】Apple产品年中狂欢节，好物尽享，美在智慧！速来 >> 勾选[保障服务][原厂保2年]，获得AppleCare+全方位服务计划，原厂延保售后无忧。', '', 5499.00, 100, 0, '', 0.00, 0, '', '', '', '', '', '', '', '', NULL, NULL, 0, 0, '苹果', '手机通讯');
INSERT INTO `pms_product` VALUES (30, 50, 8, 0, 1, 'HLA海澜之家简约动物印花短袖T恤', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5ad83a4fN6ff67ecd.jpg!cc_350x449.jpg', 'HNTBJ2E042A', 0, 0, 1, 0, 0, 0, 0, 98.00, NULL, 0, 0, 0, '2018夏季新品微弹舒适新款短T男生 6月6日-6月20日，满300减30，参与互动赢百元礼券，立即分享赢大奖', '', 98.00, 100, 0, '', 0.00, 0, '', '', '', '', '', '', '', '', NULL, NULL, 0, 0, '海澜之家', 'T恤');
INSERT INTO `pms_product` VALUES (31, 50, 8, 0, 1, 'HLA海澜之家蓝灰花纹圆领针织布短袖T恤', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5ac98b64N70acd82f.jpg!cc_350x449.jpg', 'HNTBJ2E080A', 0, 1, 0, 0, 0, 0, 0, 98.00, NULL, 0, 0, 0, '2018夏季新品短袖T恤男HNTBJ2E080A 蓝灰花纹80 175/92A/L80A 蓝灰花纹80 175/92A/L', '', 98.00, 100, 0, '', 0.00, 0, '', '', '', '', '', '', '', '', NULL, NULL, 0, 0, '海澜之家', 'T恤');
INSERT INTO `pms_product` VALUES (32, 50, 8, 0, NULL, 'HLA海澜之家短袖T恤男基础款', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a51eb88Na4797877.jpg', 'HNTBJ2E153A', 0, 1, 0, 0, 0, 0, 0, 68.00, NULL, 0, 0, 0, 'HLA海澜之家短袖T恤男基础款简约圆领HNTBJ2E153A藏青(F3)175/92A(50)', '', 68.00, 100, 0, '', 0.00, 0, '', '', '', '', '', '', '', '', NULL, NULL, 0, 0, '海澜之家', 'T恤');
INSERT INTO `pms_product` VALUES (33, 6, 35, 0, NULL, '小米（MI）小米电视4A ', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b02804dN66004d73.jpg', '4609652', 0, 1, 0, 0, 0, 0, 0, 2499.00, NULL, 0, 0, 0, '小米（MI）小米电视4A 55英寸 L55M5-AZ/L55M5-AD 2GB+8GB HDR 4K超高清 人工智能网络液晶平板电视', '', 2499.00, 100, 0, '', 0.00, 0, '', '', '', '', '', '', '', '', NULL, NULL, 0, 0, '小米', '手机数码');
INSERT INTO `pms_product` VALUES (34, 6, 35, 0, NULL, '小米（MI）小米电视4A 65英寸', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b028530N51eee7d4.jpg', '4609660', 0, 1, 0, 0, 0, 0, 0, 3999.00, NULL, 0, 0, 0, ' L65M5-AZ/L65M5-AD 2GB+8GB HDR 4K超高清 人工智能网络液晶平板电视', '', 3999.00, 100, 0, '', 0.00, 0, '', '', '', '', '', '', '', '', NULL, NULL, 0, 0, '小米', '手机数码');
INSERT INTO `pms_product` VALUES (35, 58, 29, 0, NULL, '耐克NIKE 男子 休闲鞋 ROSHE RUN 运动鞋 511881-010黑色41码', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b235bb9Nf606460b.jpg', '6799342', 0, 1, 0, 0, 0, 0, 0, 369.00, NULL, 0, 0, 0, '耐克NIKE 男子 休闲鞋 ROSHE RUN 运动鞋 511881-010黑色41码', '', 369.00, 100, 0, '', 0.00, 0, '', '', '', '', '', '', '', '', NULL, NULL, 0, 0, 'NIKE', '男鞋');
INSERT INTO `pms_product` VALUES (36, 58, 29, 0, NULL, '耐克NIKE 男子 气垫 休闲鞋 AIR MAX 90 ESSENTIAL 运动鞋 AJ1285-101白色41码', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b19403eN9f0b3cb8.jpg', '6799345', 0, 1, 1, 1, 0, 0, 0, 499.00, NULL, 0, 0, 0, '耐克NIKE 男子 气垫 休闲鞋 AIR MAX 90 ESSENTIAL 运动鞋 AJ1285-101白色41码', '', 499.00, 100, 0, '', 0.00, 0, '', '', '', 'http://localhost:8080/static/upload/images/pics/c8085b4f-00c8-4146-aab6-c54706b8ccff.jpg', '', '', '', '', NULL, NULL, 0, 0, 'NIKE', '男鞋');
INSERT INTO `pms_product` VALUES (37, 50, 9, 0, 2, '4444', 'http://localhost:8080/static/upload/images/pics/3.jpg', '2', 1, 1, 1, 1, 0, 8, 0, 3.00, 16.00, 10, 9, 11, '555', '1', 4.00, 5, 0, '6', 7.00, 1, '2,1,3', '14', '15', 'http://localhost:8080/static/upload/images/pics/9.jpg,http://localhost:8080/static/upload/images/pics/14.jpg,http://localhost:8080/static/upload/images/pics/8.jpg', '12', '13', '', '', '2020-01-16 16:00:00', '2020-01-24 16:00:00', 0, 4, '海澜之家', '休闲裤');
INSERT INTO `pms_product` VALUES (38, 3, 30, 0, 2, '32332', 'http://localhost:8080/static/upload/images/pics/3.jpg', '', 1, 0, 0, 0, 0, 0, 0, 0.00, NULL, 0, 0, 0, '233223', '232323', 0.00, 0, 0, '', 0.00, 0, '', '', '', 'http://localhost:8080/static/upload/images/pics/9.jpg,http://localhost:8080/static/upload/images/pics/14.jpg,http://localhost:8080/static/upload/images/pics/8.jpg', '', '', '', '', NULL, NULL, 0, 0, '华为', '手机配件');
INSERT INTO `pms_product` VALUES (39, 3, 7, 0, NULL, '54545', 'http://localhost:8080/static/upload/images/pics/3.jpg', '', 1, 0, 0, 0, 0, 0, 0, 0.00, NULL, 0, 0, 0, '4545', '', 0.00, 0, 0, '', 0.00, 0, '', '', '', 'http://localhost:8080/static/upload/images/pics/9.jpg,http://localhost:8080/static/upload/images/pics/14.jpg,http://localhost:8080/static/upload/images/pics/8.jpg', '', '', '', '', NULL, NULL, 0, 0, '华为', '外套');
INSERT INTO `pms_product` VALUES (40, 4, 7, 0, NULL, '565656', 'http://localhost:8080/static/upload/images/pics/3.jpg', '', 1, 0, 0, 0, 0, 0, 0, 0.00, NULL, 0, 0, 0, '565656', '', 0.00, 0, 0, '', 0.00, 0, '', '', '', 'http://localhost:8080/static/upload/images/pics/9.jpg,http://localhost:8080/static/upload/images/pics/14.jpg,http://localhost:8080/static/upload/images/pics/8.jpg', '', '', '', '', NULL, NULL, 0, 0, '格力', '外套');
INSERT INTO `pms_product` VALUES (41, 2, 8, 0, NULL, '233223', '', '', 1, 0, 0, 0, 0, 0, 0, 0.00, NULL, 0, 0, 0, '232332', '', 0.00, 0, 0, '', 0.00, 0, '', '', '', 'http://localhost:8080/static/upload/images/pics/9.jpg,http://localhost:8080/static/upload/images/pics/14.jpg,http://localhost:8080/static/upload/images/pics/8.jpg', '', '', '', '', NULL, NULL, 0, 0, '三星', 'T恤');
INSERT INTO `pms_product` VALUES (42, 2, 7, 0, NULL, '787', 'http://localhost:8080/static/upload/images/pics/3.jpg', '', 1, 0, 0, 0, 0, 0, 0, 0.00, NULL, 0, 0, 0, '787878', '', 0.00, 0, 0, '', 0.00, 0, '', '', '', 'http://localhost:8080/static/upload/images/pics/9.jpg,http://localhost:8080/static/upload/images/pics/14.jpg,http://localhost:8080/static/upload/images/pics/8.jpg', '', '', '', '', NULL, NULL, 0, 0, '三星', '外套');
INSERT INTO `pms_product` VALUES (43, 49, 30, 0, NULL, '909090', 'http://localhost:8080/static/upload/images/pics/3.jpg', '', 1, 0, 0, 0, 0, 0, 0, 0.00, NULL, 0, 0, 0, '9090', '', 0.00, 0, 0, '', 0.00, 0, '', '', '', 'http://localhost:8080/static/upload/images/pics/9.jpg,http://localhost:8080/static/upload/images/pics/14.jpg,http://localhost:8080/static/upload/images/pics/8.jpg', '', '', '', '', NULL, NULL, 0, 0, '七匹狼1', '手机配件');
INSERT INTO `pms_product` VALUES (44, 2, 30, 0, NULL, '234324', 'http://localhost:8080/static/upload/images/pics/3.jpg', '', 1, 0, 0, 0, 0, 0, 0, 0.00, NULL, 0, 0, 0, '234234', '', 0.00, 0, 0, '', 0.00, 0, '', '', '', 'http://localhost:8080/static/upload/images/pics/9.jpg,http://localhost:8080/static/upload/images/pics/14.jpg,http://localhost:8080/static/upload/images/pics/8.jpg', '', '', '', '', NULL, NULL, 0, 0, '三星', '手机配件');
INSERT INTO `pms_product` VALUES (45, 2, 7, 0, NULL, '2342', 'http://localhost:8080/static/upload/images/pics/4.jpeg', '', 1, 0, 0, 0, 0, 0, 0, 0.00, NULL, 0, 0, 0, '23432', '', 0.00, 0, 0, '', 0.00, 0, '', '', '', 'http://localhost:8080/static/upload/images/pics/9.jpg,http://localhost:8080/static/upload/images/pics/14.jpg,http://localhost:8080/static/upload/images/pics/8.jpg', '', '', '', '', NULL, NULL, 0, 0, '三星', '外套');
INSERT INTO `pms_product` VALUES (46, 4, 30, 0, 1, '23432', 'http://localhost:8080/static/upload/images/pics/3.jpg', '', 1, 0, 0, 0, 0, 0, 0, 0.00, NULL, 0, 0, 0, '4234234', '', 0.00, 0, 0, '', 0.00, 0, '', '', '', 'http://localhost:8080/static/upload/images/pics/8.jpg,http://localhost:8080/static/upload/images/pics/9.jpg', '', '', '', '', NULL, NULL, 0, 0, '格力', '手机配件');
INSERT INTO `pms_product` VALUES (47, 3, 7, 0, NULL, '6666666666', 'http://localhost:8080/static/upload/images/pics/13.jpg', '', 1, 0, 0, 0, 0, 0, 0, 0.00, NULL, 0, 0, 0, '666666', '', 0.00, 0, 0, '', 0.00, 0, '', '', '', 'http://localhost:8080/static/upload/images/pics/9.jpg,http://localhost:8080/static/upload/images/pics/14.jpg,http://localhost:8080/static/upload/images/pics/8.jpg', '', '', '', '', NULL, NULL, 0, 0, '华为', '外套');
INSERT INTO `pms_product` VALUES (48, 4, 47, 0, NULL, '234234234', 'http://localhost:8080/static/upload/images/pics/3.jpg', '', 1, 0, 0, 1, 0, 0, 0, 0.00, NULL, 0, 0, 0, '234234', '', 0.00, 0, 0, '', 0.00, 0, '', '', '', 'http://localhost:8080/static/upload/images/pics/9.jpg,http://localhost:8080/static/upload/images/pics/8.jpg', '', '', '', '', NULL, NULL, 0, 0, '格力', '客厅家具');
INSERT INTO `pms_product` VALUES (49, 2, 31, 0, NULL, '454545', 'http://localhost:8080/static/upload/images/pics/4.jpeg', '', 1, 0, 0, 0, 0, 0, 0, 0.00, NULL, 0, 0, 0, '454545', '456546546', 0.00, 0, 0, '', 0.00, 0, '', '', '', 'http://localhost:8080/static/upload/images/pics/6.jpg', '', '', '', '', NULL, NULL, 0, 0, '三星', '摄影摄像');
INSERT INTO `pms_product` VALUES (50, 2, 31, 0, NULL, '454545', 'http://localhost:8080/static/upload/images/pics/4.jpeg', '', 1, 0, 0, 0, 0, 0, 0, 0.00, NULL, 0, 0, 0, '454545', '456546546', 0.00, 0, 0, '', 0.00, 0, '', '', '', 'http://localhost:8080/static/upload/images/pics/6.jpg', '', '', '', '', NULL, NULL, 0, 0, '三星', '摄影摄像');
INSERT INTO `pms_product` VALUES (51, 4, 30, 0, NULL, '23432', 'http://localhost:8080/static/upload/images/pics/', '', 1, 0, 0, 0, 0, 0, 0, 0.00, NULL, 0, 0, 0, '42343242', '', 0.00, 0, 0, '', 0.00, 0, '', '', '', 'http://localhost:8080/static/upload/images/pics/', '', '', '', '', NULL, NULL, 0, 0, '格力', '手机配件');
INSERT INTO `pms_product` VALUES (52, 4, 31, 0, NULL, '454545', 'http://localhost:8080/static/upload/images/pics/4.jpeg', '', 1, 0, 0, 0, 0, 0, 0, 0.00, NULL, 0, 0, 0, '454545', '', 0.00, 0, 0, '', 0.00, 0, '', '', '', 'http://localhost:8080/static/upload/images/pics/3.jpg', '', '', '', '', NULL, NULL, 0, 0, '格力', '摄影摄像');
INSERT INTO `pms_product` VALUES (53, 51, 38, 0, NULL, '123213', 'http://localhost:8080/static/upload/images/pics/blob:http://localhost:8090/71b56459-4557-4e97-a0ef-f13757c9a3ef', '', 1, 0, 0, 0, 0, 0, 0, 0.00, NULL, 0, 0, 0, '12321', '', 0.00, 0, 0, '', 0.00, 0, '', '', '', 'http://localhost:8080/static/upload/images/pics/blob:http://localhost:8090/3391bc29-9734-4dcd-b5a1-5e4b361382ec,http://localhost:8080/static/upload/images/pics/blob:http://localhost:8090/e5dc102c-c53c-4ac4-9d08-1e7ab1a175db,http://localhost:8080/static/upload/images/pics/blob:http://localhost:8090/dadf2a7e-4dd3-4a8b-b74f-ebae6b526357,http://localhost:8080/static/upload/images/pics/blob:http://localhost:8090/476ed568-3882-4590-9f7b-ac7dc9f383c0', '', '', '', '', NULL, NULL, 0, 0, '苹果1', '冰箱');
INSERT INTO `pms_product` VALUES (54, 2, 30, 0, NULL, '34', 'http://localhost:8080/static/upload/images/pics/blob:http://localhost:8090/2aa1ae26-dd56-4987-b805-bf667c14cbee', '', 1, 0, 0, 0, 0, 0, 0, 0.00, NULL, 0, 0, 0, '34', '', 0.00, 0, 0, '', 0.00, 0, '', '', '', 'http://localhost:8080/static/upload/images/pics/blob:http://localhost:8090/d97116c6-7fe6-4667-925a-31ad6153f6b9', '', '', '', '', NULL, NULL, 0, 0, '三星', '手机配件');
INSERT INTO `pms_product` VALUES (55, 3, 8, 0, NULL, '2342', 'http://localhost:8080/static/upload/images/pics/', '', 1, 0, 0, 0, 0, 0, 0, 0.00, NULL, 0, 0, 0, '234', '', 0.00, 0, 0, '', 0.00, 0, '', '', '', 'http://localhost:8080/static/upload/images/pics/', '', '', '', '', NULL, NULL, 0, 0, '华为', 'T恤');
INSERT INTO `pms_product` VALUES (56, 3, 7, 0, NULL, '234523', 'http://localhost:8080/static/upload/images/pics/blob:http://localhost:8090/cda367e6-0d17-4c3b-984d-cd1ba61004de', '', 1, 0, 0, 0, 0, 0, 0, 0.00, NULL, 0, 0, 0, '23432', '', 0.00, 0, 0, '', 0.00, 0, '', '', '', 'http://localhost:8080/static/upload/images/pics/blob:http://localhost:8090/d463740e-1ae9-4d7d-b902-c9f4436f0bfb', '', '', '', '', NULL, NULL, 0, 0, '华为', '外套');
INSERT INTO `pms_product` VALUES (57, 3, 8, 0, NULL, '23423', 'http://localhost:8080/static/upload/images/pics/http://localhost:8080/static/upload/images/pics/8.jpg', '', 1, 0, 0, 0, 0, 0, 0, 0.00, NULL, 0, 0, 0, '2342', '', 0.00, 0, 0, '', 0.00, 0, '', '', '', 'http://localhost:8080/static/upload/images/pics/http://localhost:8080/static/upload/images/pics/9.jpg', '', '', '', '', NULL, NULL, 0, 0, '华为', 'T恤');
INSERT INTO `pms_product` VALUES (58, 2, 30, 0, NULL, '23423', 'http://localhost:8080/static/upload/images/pics/http://localhost:8080/static/upload/images/pics/9.jpg', '', 1, 0, 0, 0, 0, 0, 0, 0.00, NULL, 0, 0, 0, '23423', '', 0.00, 0, 0, '', 0.00, 0, '', '', '', 'http://localhost:8080/static/upload/images/pics/http://localhost:8080/static/upload/images/pics/8.jpg,http://localhost:8080/static/upload/images/pics/http://localhost:8080/static/upload/images/pics/2.jpg', '', '', '', '', NULL, NULL, 0, 0, '三星', '手机配件');
INSERT INTO `pms_product` VALUES (59, 4, 7, 0, 2, '2位432', 'http://localhost:8080/static/upload/images/pics/8.jpg', '', 1, 0, 0, 0, 0, 0, 0, 0.00, NULL, 0, 0, 0, '234234', '', 0.00, 0, 0, '', 0.00, 0, '', '', '', 'http://localhost:8080/static/upload/images/pics/2.jpg,http://localhost:8080/static/upload/images/pics/9.jpg,http://localhost:8080/static/upload/images/pics/4.jpeg,http://localhost:8080/static/upload/images/pics/10.jpg', '', '', '', '', NULL, NULL, 0, 0, '格力', '外套');
INSERT INTO `pms_product` VALUES (60, 2, 7, 0, NULL, '23423', 'http://localhost:8080/static/upload/images/pics/3.jpg', '', 1, 0, 0, 0, 0, 0, 0, 0.00, NULL, 0, 0, 0, '23423', '', 0.00, 0, 0, '', 0.00, 0, '', '', '', 'http://localhost:8080/static/upload/images/pics/14.jpg', '', '', '', '', NULL, NULL, 0, 0, '三星', '外套');
INSERT INTO `pms_product` VALUES (61, 3, 7, 0, NULL, '12312', 'http://localhost:8080/static/upload/images/pics/8.jpg', '123', 1, 0, 0, 0, 0, 0, 0, 0.00, NULL, 0, 0, 0, '123', '123', 0.00, 0, 0, '', 0.00, 0, '', '', '', 'http://localhost:8080/static/upload/images/pics/15.jpg,http://localhost:8080/static/upload/images/pics/9.jpg', '', '', '', '', NULL, NULL, 0, 0, '华为', '外套');
INSERT INTO `pms_product` VALUES (62, 2, 7, 0, NULL, '23423', 'http://localhost:8080/static/upload/images/pics/a713a2fe-a6a6-432f-8c03-29177452821e.jpg', '', 1, 0, 0, 0, 0, 0, 0, 0.00, NULL, 0, 0, 0, '4234', '', 0.00, 0, 0, '', 0.00, 0, '', '', '', 'http://localhost:8080/static/upload/images/pics/79361c6a-8098-4e9c-b702-c5addd6e8fed.jpg', '', '', '', '', NULL, NULL, 0, 0, '三星', '外套');
INSERT INTO `pms_product` VALUES (63, 49, 30, 0, 2, '234234', 'http://localhost:8080/static/upload/images//ae344b07-a4fe-478b-b35e-f2e9b0f85f6b.jpg', '23423', 1, 0, 0, 0, 0, 0, 0, 0.00, NULL, 0, 0, 0, '23423', '', 0.00, 0, 0, '', 0.00, 0, '', '', '', '', '', '', '', '', NULL, NULL, 0, 0, '七匹狼', '手机配件');

-- ----------------------------
-- Table structure for pms_product_attribute
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_attribute`;
CREATE TABLE `pms_product_attribute`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `product_attribute_category_id` bigint(0) NULL DEFAULT NULL,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `select_type` int(0) NULL DEFAULT NULL COMMENT '属性选择类型：0->唯一；1->单选；2->多选',
  `input_type` int(0) NULL DEFAULT NULL COMMENT '属性录入方式：0->手工录入；1->从列表中选取',
  `input_list` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '可选值列表，以逗号隔开',
  `sort` int(0) NULL DEFAULT NULL COMMENT '排序字段：最高的可以单独上传图片',
  `filter_type` int(0) NULL DEFAULT NULL COMMENT '分类筛选样式：1->普通；1->颜色',
  `search_type` int(0) NULL DEFAULT NULL COMMENT '检索类型；0->不需要进行检索；1->关键字检索；2->范围检索',
  `related_status` int(0) NULL DEFAULT NULL COMMENT '相同属性产品是否关联；0->不关联；1->关联',
  `hand_add_status` int(0) NULL DEFAULT NULL COMMENT '是否支持手动新增；0->不支持；1->支持',
  `type` int(0) NULL DEFAULT NULL COMMENT '属性的类型；0->规格；1->参数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 55 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品属性参数表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pms_product_attribute
-- ----------------------------
INSERT INTO `pms_product_attribute` VALUES (1, 1, '尺寸', 2, 1, 'M,X,XL,2XL,3XL,4XL', 0, 0, 0, 0, 0, 0);
INSERT INTO `pms_product_attribute` VALUES (7, 1, '颜色', 2, 1, '黑色,红色,白色,粉色', 100, 0, 0, 0, 1, 0);
INSERT INTO `pms_product_attribute` VALUES (13, 0, '上市年份', 1, 1, '2013年,2014年,2015年,2016年,2017年', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (14, 0, '上市年份1', 1, 1, '2013年,2014年,2015年,2016年,2017年', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (15, 0, '上市年份2', 1, 1, '2013年,2014年,2015年,2016年,2017年', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (16, 0, '上市年份3', 1, 1, '2013年,2014年,2015年,2016年,2017年', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (17, 0, '上市年份4', 1, 1, '2013年,2014年,2015年,2016年,2017年', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (18, 0, '上市年份5', 1, 1, '2013年,2014年,2015年,2016年,2017年', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (19, 0, '适用对象', 1, 1, '青年女性,中年女性', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (20, 0, '适用对象1', 2, 1, '青年女性,中年女性', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (21, 0, '适用对象3', 2, 1, '青年女性,中年女性', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (24, 1, '商品编号', 1, 0, '', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (25, 1, '适用季节', 1, 1, '春季,夏季,秋季,冬季', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (32, 2, '适用人群', 0, 1, '老年,青年,中年', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (33, 2, '风格', 0, 1, '嘻哈风格,基础大众,商务正装', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (35, 2, '颜色', 0, 0, '', 100, 0, 0, 0, 1, 0);
INSERT INTO `pms_product_attribute` VALUES (37, 1, '适用人群', 1, 1, '儿童,青年,中年,老年', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (38, 1, '上市时间', 1, 1, '2017年秋,2017年冬,2018年春,2018年夏', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (39, 1, '袖长', 1, 1, '短袖,长袖,中袖', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (40, 2, '尺码', 0, 1, '29,30,31,32,33,34', 0, 0, 0, 0, 0, 0);
INSERT INTO `pms_product_attribute` VALUES (41, 2, '适用场景', 0, 1, '居家,运动,正装', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (42, 2, '上市时间', 0, 1, '2018年春,2018年夏', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (43, 3, '颜色', 0, 0, '', 100, 0, 0, 0, 1, 0);
INSERT INTO `pms_product_attribute` VALUES (44, 3, '容量', 0, 1, '16G,32G,64G,128G', 0, 0, 0, 0, 0, 0);
INSERT INTO `pms_product_attribute` VALUES (45, 3, '屏幕尺寸', 0, 0, '', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (46, 3, '网络', 0, 1, '3G,4G', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (47, 3, '系统', 0, 1, 'Android,IOS', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (48, 3, '电池容量', 0, 0, '', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (55, 4, '6666', 0, 0, '', 0, 0, 0, 0, 0, 0);

-- ----------------------------
-- Table structure for pms_product_attribute_category
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_attribute_category`;
CREATE TABLE `pms_product_attribute_category`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `attribute_count` int(0) NULL DEFAULT 0 COMMENT '属性数量',
  `param_count` int(0) NULL DEFAULT 0 COMMENT '参数数量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '产品属性分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pms_product_attribute_category
-- ----------------------------
INSERT INTO `pms_product_attribute_category` VALUES (1, '服装-T恤', 1, 5);
INSERT INTO `pms_product_attribute_category` VALUES (2, '服装-裤装', 2, 4);
INSERT INTO `pms_product_attribute_category` VALUES (3, '手机数码-手机通讯', 2, 4);
INSERT INTO `pms_product_attribute_category` VALUES (4, '配件', 1, 0);
INSERT INTO `pms_product_attribute_category` VALUES (5, '居家', 0, 0);
INSERT INTO `pms_product_attribute_category` VALUES (6, '洗护', 0, 0);
INSERT INTO `pms_product_attribute_category` VALUES (10, '测试分类', 0, 0);
INSERT INTO `pms_product_attribute_category` VALUES (12, '343434', 0, 0);
INSERT INTO `pms_product_attribute_category` VALUES (19, '4444', 0, 0);
INSERT INTO `pms_product_attribute_category` VALUES (20, '9999', 0, 0);

-- ----------------------------
-- Table structure for pms_product_attribute_value
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_attribute_value`;
CREATE TABLE `pms_product_attribute_value`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(0) NULL DEFAULT NULL,
  `product_attribute_id` bigint(0) NULL DEFAULT NULL,
  `value` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手动添加规格或参数的值，参数单值，规格有多个时以逗号隔开',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 310 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '存储产品参数信息的表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pms_product_attribute_value
-- ----------------------------
INSERT INTO `pms_product_attribute_value` VALUES (1, 9, 1, 'X');
INSERT INTO `pms_product_attribute_value` VALUES (2, 10, 1, 'X');
INSERT INTO `pms_product_attribute_value` VALUES (3, 11, 1, 'X');
INSERT INTO `pms_product_attribute_value` VALUES (4, 12, 1, 'X');
INSERT INTO `pms_product_attribute_value` VALUES (5, 13, 1, 'X');
INSERT INTO `pms_product_attribute_value` VALUES (6, 14, 1, 'X');
INSERT INTO `pms_product_attribute_value` VALUES (7, 18, 1, 'X');
INSERT INTO `pms_product_attribute_value` VALUES (8, 7, 1, 'X');
INSERT INTO `pms_product_attribute_value` VALUES (9, 7, 1, 'XL');
INSERT INTO `pms_product_attribute_value` VALUES (10, 7, 1, 'XXL');
INSERT INTO `pms_product_attribute_value` VALUES (11, 22, 7, 'x,xx');
INSERT INTO `pms_product_attribute_value` VALUES (12, 22, 24, 'no110');
INSERT INTO `pms_product_attribute_value` VALUES (13, 22, 25, '春季');
INSERT INTO `pms_product_attribute_value` VALUES (14, 22, 37, '青年');
INSERT INTO `pms_product_attribute_value` VALUES (15, 22, 38, '2018年春');
INSERT INTO `pms_product_attribute_value` VALUES (16, 22, 39, '长袖');
INSERT INTO `pms_product_attribute_value` VALUES (124, 23, 7, '米白色,浅黄色');
INSERT INTO `pms_product_attribute_value` VALUES (125, 23, 24, 'no1098');
INSERT INTO `pms_product_attribute_value` VALUES (126, 23, 25, '春季');
INSERT INTO `pms_product_attribute_value` VALUES (127, 23, 37, '青年');
INSERT INTO `pms_product_attribute_value` VALUES (128, 23, 38, '2018年春');
INSERT INTO `pms_product_attribute_value` VALUES (129, 23, 39, '长袖');
INSERT INTO `pms_product_attribute_value` VALUES (130, 1, 13, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (131, 1, 14, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (132, 1, 15, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (133, 1, 16, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (134, 1, 17, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (135, 1, 18, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (136, 1, 19, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (137, 1, 20, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (138, 1, 21, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (139, 2, 13, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (140, 2, 14, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (141, 2, 15, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (142, 2, 16, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (143, 2, 17, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (144, 2, 18, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (145, 2, 19, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (146, 2, 20, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (147, 2, 21, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (183, 31, 24, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (184, 31, 25, '夏季');
INSERT INTO `pms_product_attribute_value` VALUES (185, 31, 37, '青年');
INSERT INTO `pms_product_attribute_value` VALUES (186, 31, 38, '2018年夏');
INSERT INTO `pms_product_attribute_value` VALUES (187, 31, 39, '短袖');
INSERT INTO `pms_product_attribute_value` VALUES (198, 30, 24, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (199, 30, 25, '夏季');
INSERT INTO `pms_product_attribute_value` VALUES (200, 30, 37, '青年');
INSERT INTO `pms_product_attribute_value` VALUES (201, 30, 38, '2018年夏');
INSERT INTO `pms_product_attribute_value` VALUES (202, 30, 39, '短袖');
INSERT INTO `pms_product_attribute_value` VALUES (218, 28, 43, '金色,银色');
INSERT INTO `pms_product_attribute_value` VALUES (219, 28, 45, '5.0');
INSERT INTO `pms_product_attribute_value` VALUES (220, 28, 46, '4G');
INSERT INTO `pms_product_attribute_value` VALUES (221, 28, 47, 'Android');
INSERT INTO `pms_product_attribute_value` VALUES (222, 28, 48, '2800ml');
INSERT INTO `pms_product_attribute_value` VALUES (223, 29, 43, '金色,银色');
INSERT INTO `pms_product_attribute_value` VALUES (224, 29, 45, '4.7');
INSERT INTO `pms_product_attribute_value` VALUES (225, 29, 46, '4G');
INSERT INTO `pms_product_attribute_value` VALUES (226, 29, 47, 'IOS');
INSERT INTO `pms_product_attribute_value` VALUES (227, 29, 48, '1960ml');
INSERT INTO `pms_product_attribute_value` VALUES (228, 37, 32, '老年');
INSERT INTO `pms_product_attribute_value` VALUES (229, 37, 33, '嘻哈风格');
INSERT INTO `pms_product_attribute_value` VALUES (230, 37, 41, '运动');
INSERT INTO `pms_product_attribute_value` VALUES (231, 37, 42, '2018年夏');
INSERT INTO `pms_product_attribute_value` VALUES (232, 38, 32, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (233, 38, 33, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (234, 38, 41, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (235, 38, 42, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (247, 59, 35, '12321');
INSERT INTO `pms_product_attribute_value` VALUES (248, 59, 32, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (249, 59, 33, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (250, 59, 41, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (251, 59, 42, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (258, 46, 7, '33');
INSERT INTO `pms_product_attribute_value` VALUES (259, 46, 24, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (260, 46, 25, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (261, 46, 37, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (262, 46, 38, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (263, 46, 39, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (289, 26, 43, '金色,银色');
INSERT INTO `pms_product_attribute_value` VALUES (290, 26, 45, '5.0');
INSERT INTO `pms_product_attribute_value` VALUES (291, 26, 46, '4G');
INSERT INTO `pms_product_attribute_value` VALUES (292, 26, 47, 'Android');
INSERT INTO `pms_product_attribute_value` VALUES (293, 26, 48, '3000');
INSERT INTO `pms_product_attribute_value` VALUES (294, 27, 43, '黑色,蓝色');
INSERT INTO `pms_product_attribute_value` VALUES (295, 27, 45, '5.8');
INSERT INTO `pms_product_attribute_value` VALUES (296, 27, 46, '4G');
INSERT INTO `pms_product_attribute_value` VALUES (297, 27, 47, 'Android');
INSERT INTO `pms_product_attribute_value` VALUES (298, 27, 48, '3000ml');
INSERT INTO `pms_product_attribute_value` VALUES (307, 63, 32, '青年');
INSERT INTO `pms_product_attribute_value` VALUES (308, 63, 33, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (309, 63, 41, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (310, 63, 42, NULL);

-- ----------------------------
-- Table structure for pms_product_category
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_category`;
CREATE TABLE `pms_product_category`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(0) NULL DEFAULT NULL COMMENT '上机分类的编号：0表示一级分类',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `level` int(0) NULL DEFAULT NULL COMMENT '分类级别：0->1级；1->2级',
  `product_count` int(0) NULL DEFAULT NULL,
  `product_unit` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nav_status` int(0) NULL DEFAULT NULL COMMENT '是否显示在导航栏：0->不显示；1->显示',
  `show_status` int(0) NULL DEFAULT NULL COMMENT '显示状态：0->不显示；1->显示',
  `sort` int(0) NULL DEFAULT NULL,
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标',
  `keywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 78 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '产品分类' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pms_product_category
-- ----------------------------
INSERT INTO `pms_product_category` VALUES (1, 0, '服装3', 0, 100, '件', 0, 0, 1, '9.jpg', '服装1', '服装分类');
INSERT INTO `pms_product_category` VALUES (2, 0, '手机数码', 0, 100, '件', 0, 1, 1, NULL, '手机数码', '手机数码');
INSERT INTO `pms_product_category` VALUES (3, 0, '家用电器', 0, 100, '件', 1, 1, 1, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/subject_cate_jiadian.png', '家用电器', '家用电器');
INSERT INTO `pms_product_category` VALUES (4, 0, '家具家装', 0, 100, '件', 1, 1, 1, NULL, '家具家装', '家具家装');
INSERT INTO `pms_product_category` VALUES (5, 0, '汽车用品', 0, 100, '件', 1, 1, 1, NULL, '汽车用品', '汽车用品');
INSERT INTO `pms_product_category` VALUES (7, 1, '外套', 1, 100, '件', 1, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/product_cate_waitao.png', '外套', '外套');
INSERT INTO `pms_product_category` VALUES (8, 1, 'T恤', 1, 100, '件', 1, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/product_cate_tshirt.png', 'T恤', 'T恤');
INSERT INTO `pms_product_category` VALUES (9, 1, '休闲裤', 1, 100, '件', 1, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/product_cate_xiuxianku.png', '休闲裤', '休闲裤');
INSERT INTO `pms_product_category` VALUES (10, 1, '牛仔裤', 1, 100, '件', 1, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/product_cate_niuzaiku.png', '牛仔裤', '牛仔裤');
INSERT INTO `pms_product_category` VALUES (11, 1, '衬衫', 1, 100, '件', 1, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/product_cate_chenshan.png', '衬衫', '衬衫分类');
INSERT INTO `pms_product_category` VALUES (13, 12, '家电子分类1', 1, 1, 'string', 0, 1, 0, 'string', 'string', 'string');
INSERT INTO `pms_product_category` VALUES (14, 12, '家电子分类2', 1, 1, 'string', 0, 1, 0, 'string', 'string', 'string');
INSERT INTO `pms_product_category` VALUES (19, 2, '手机通讯', 1, 0, '件', 1, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/product_cate_shouji.png', '手机通讯', '手机通讯');
INSERT INTO `pms_product_category` VALUES (29, 1, '男鞋', 1, 0, '', 0, 0, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/product_cate_xie.png', '', '');
INSERT INTO `pms_product_category` VALUES (30, 2, '手机配件', 1, 0, '', 1, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/product_cate_peijian.png', '手机配件', '手机配件');
INSERT INTO `pms_product_category` VALUES (31, 2, '摄影摄像', 1, 0, '', 1, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/product_cate_sheying.png', '', '');
INSERT INTO `pms_product_category` VALUES (32, 2, '影音娱乐', 1, 0, '', 1, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/product_cate_yule.png', '', '');
INSERT INTO `pms_product_category` VALUES (33, 2, '数码配件', 1, 0, '', 1, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/product_cate_yule.png', '', '');
INSERT INTO `pms_product_category` VALUES (34, 2, '智能设备', 1, 0, '', 1, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/product_cate_zhineng.png', '', '');
INSERT INTO `pms_product_category` VALUES (35, 3, '电视', 1, 0, '', 1, 1, 0, '', '', '');
INSERT INTO `pms_product_category` VALUES (36, 3, '空调', 1, 0, '', 1, 1, 0, '', '', '');
INSERT INTO `pms_product_category` VALUES (37, 3, '洗衣机', 1, 0, '', 1, 1, 0, '', '', '');
INSERT INTO `pms_product_category` VALUES (38, 3, '冰箱', 1, 0, '', 1, 1, 0, '', '', '');
INSERT INTO `pms_product_category` VALUES (39, 3, '厨卫大电', 1, 0, '', 1, 1, 0, '', '', '');
INSERT INTO `pms_product_category` VALUES (40, 3, '厨房小电', 1, 0, '', 0, 0, 0, '', '', '');
INSERT INTO `pms_product_category` VALUES (41, 3, '生活电器', 1, 0, '', 0, 0, 0, '', '', '');
INSERT INTO `pms_product_category` VALUES (42, 3, '个护健康', 1, 0, '', 0, 0, 0, '', '', '');
INSERT INTO `pms_product_category` VALUES (43, 4, '厨房卫浴', 1, 0, '', 1, 1, 0, '', '', '');
INSERT INTO `pms_product_category` VALUES (44, 4, '灯饰照明', 1, 0, '', 1, 1, 0, '', '', '');
INSERT INTO `pms_product_category` VALUES (45, 4, '五金工具', 1, 0, '', 1, 1, 0, '', '', '');
INSERT INTO `pms_product_category` VALUES (46, 4, '卧室家具', 1, 0, '', 1, 1, 0, '', '', '');
INSERT INTO `pms_product_category` VALUES (47, 4, '客厅家具', 1, 0, '', 1, 1, 0, '', '', '');
INSERT INTO `pms_product_category` VALUES (48, 5, '全新整车', 1, 0, '', 1, 1, 0, '', '', '');
INSERT INTO `pms_product_category` VALUES (49, 5, '车载电器', 1, 0, '', 1, 1, 0, '', '', '');
INSERT INTO `pms_product_category` VALUES (50, 5, '维修保养', 1, 0, '', 1, 1, 0, '', '', '');
INSERT INTO `pms_product_category` VALUES (51, 5, '汽车装饰', 1, 0, '', 1, 1, 0, '', '', '');
INSERT INTO `pms_product_category` VALUES (75, 1, '454545', 1, 0, '456546456', 0, 0, 0, '4.jpeg', '', '');
INSERT INTO `pms_product_category` VALUES (76, 2, '9999999', 1, 0, '899', 0, 0, 0, '8.jpg', '', '');

-- ----------------------------
-- Table structure for pms_product_category_attribute_relation
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_category_attribute_relation`;
CREATE TABLE `pms_product_category_attribute_relation`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `product_category_id` bigint(0) NULL DEFAULT NULL,
  `product_attribute_id` bigint(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '产品的分类和属性的关系表，用于设置分类筛选条件（只支持一级分类）' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pms_product_category_attribute_relation
-- ----------------------------
INSERT INTO `pms_product_category_attribute_relation` VALUES (1, 1, 24);
INSERT INTO `pms_product_category_attribute_relation` VALUES (5, 26, 24);
INSERT INTO `pms_product_category_attribute_relation` VALUES (7, 28, 24);
INSERT INTO `pms_product_category_attribute_relation` VALUES (9, 25, 24);
INSERT INTO `pms_product_category_attribute_relation` VALUES (10, 25, 25);
INSERT INTO `pms_product_category_attribute_relation` VALUES (17, 63, 7);
INSERT INTO `pms_product_category_attribute_relation` VALUES (18, 63, 24);
INSERT INTO `pms_product_category_attribute_relation` VALUES (19, 64, 33);
INSERT INTO `pms_product_category_attribute_relation` VALUES (20, 65, 1);
INSERT INTO `pms_product_category_attribute_relation` VALUES (21, 66, 45);
INSERT INTO `pms_product_category_attribute_relation` VALUES (22, 69, 55);
INSERT INTO `pms_product_category_attribute_relation` VALUES (25, 71, 33);
INSERT INTO `pms_product_category_attribute_relation` VALUES (29, 75, 45);
INSERT INTO `pms_product_category_attribute_relation` VALUES (30, 76, 46);
INSERT INTO `pms_product_category_attribute_relation` VALUES (31, 78, 55);
INSERT INTO `pms_product_category_attribute_relation` VALUES (32, 78, 43);

-- ----------------------------
-- Table structure for pms_product_full_reduction
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_full_reduction`;
CREATE TABLE `pms_product_full_reduction`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(0) NULL DEFAULT NULL,
  `full_price` decimal(10, 2) NULL DEFAULT NULL,
  `reduce_price` decimal(10, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '产品满减表(只针对同商品)' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pms_product_full_reduction
-- ----------------------------
INSERT INTO `pms_product_full_reduction` VALUES (1, 7, 100.00, 20.00);
INSERT INTO `pms_product_full_reduction` VALUES (2, 8, 100.00, 20.00);
INSERT INTO `pms_product_full_reduction` VALUES (3, 9, 100.00, 20.00);
INSERT INTO `pms_product_full_reduction` VALUES (4, 10, 100.00, 20.00);
INSERT INTO `pms_product_full_reduction` VALUES (5, 11, 100.00, 20.00);
INSERT INTO `pms_product_full_reduction` VALUES (6, 12, 100.00, 20.00);
INSERT INTO `pms_product_full_reduction` VALUES (7, 13, 100.00, 20.00);
INSERT INTO `pms_product_full_reduction` VALUES (8, 14, 100.00, 20.00);
INSERT INTO `pms_product_full_reduction` VALUES (9, 18, 100.00, 20.00);
INSERT INTO `pms_product_full_reduction` VALUES (10, 7, 200.00, 50.00);
INSERT INTO `pms_product_full_reduction` VALUES (11, 7, 300.00, 100.00);
INSERT INTO `pms_product_full_reduction` VALUES (14, 22, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (16, 24, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (34, 23, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (44, 31, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (46, 32, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (48, 33, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (54, 35, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (55, 34, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (56, 30, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (60, 28, 500.00, 50.00);
INSERT INTO `pms_product_full_reduction` VALUES (61, 28, 1000.00, 120.00);
INSERT INTO `pms_product_full_reduction` VALUES (62, 29, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (63, 37, 22.00, 23.00);
INSERT INTO `pms_product_full_reduction` VALUES (64, 37, 26.00, 27.00);
INSERT INTO `pms_product_full_reduction` VALUES (65, 38, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (66, 39, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (67, 40, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (68, 41, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (69, 42, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (70, 43, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (71, 44, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (72, 45, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (74, 47, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (75, 52, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (76, 53, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (77, 54, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (78, 55, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (79, 56, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (80, 57, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (81, 58, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (85, 59, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (86, 60, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (88, 46, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (89, 61, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (90, 62, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (91, 36, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (97, 26, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (98, 27, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (101, 63, 0.00, 0.00);

-- ----------------------------
-- Table structure for pms_product_ladder
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_ladder`;
CREATE TABLE `pms_product_ladder`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(0) NULL DEFAULT NULL,
  `count` int(0) NULL DEFAULT NULL COMMENT '满足的商品数量',
  `discount` decimal(10, 2) NULL DEFAULT NULL COMMENT '折扣',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '折后价格',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 107 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '产品阶梯价格表(只针对同商品)' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pms_product_ladder
-- ----------------------------
INSERT INTO `pms_product_ladder` VALUES (1, 7, 3, 0.70, 0.00);
INSERT INTO `pms_product_ladder` VALUES (2, 8, 3, 0.70, 0.00);
INSERT INTO `pms_product_ladder` VALUES (3, 9, 3, 0.70, 0.00);
INSERT INTO `pms_product_ladder` VALUES (4, 10, 3, 0.70, 0.00);
INSERT INTO `pms_product_ladder` VALUES (5, 11, 3, 0.70, 0.00);
INSERT INTO `pms_product_ladder` VALUES (6, 12, 3, 0.70, 0.00);
INSERT INTO `pms_product_ladder` VALUES (7, 13, 3, 0.70, 0.00);
INSERT INTO `pms_product_ladder` VALUES (8, 14, 3, 0.70, 0.00);
INSERT INTO `pms_product_ladder` VALUES (12, 18, 3, 0.70, 0.00);
INSERT INTO `pms_product_ladder` VALUES (14, 7, 4, 0.60, 0.00);
INSERT INTO `pms_product_ladder` VALUES (15, 7, 5, 0.50, 0.00);
INSERT INTO `pms_product_ladder` VALUES (18, 22, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (20, 24, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (38, 23, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (48, 31, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (50, 32, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (52, 33, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (58, 35, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (59, 34, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (60, 30, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (66, 28, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (67, 29, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (68, 37, 20, 21.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (69, 37, 24, 25.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (70, 38, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (71, 39, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (72, 40, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (73, 41, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (74, 42, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (75, 43, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (76, 44, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (77, 45, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (79, 47, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (80, 52, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (81, 53, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (82, 54, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (83, 55, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (84, 56, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (85, 57, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (86, 58, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (90, 59, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (91, 60, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (93, 46, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (94, 61, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (95, 62, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (96, 36, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (102, 26, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (103, 27, 2, 0.80, 0.00);
INSERT INTO `pms_product_ladder` VALUES (104, 27, 3, 0.75, 0.00);
INSERT INTO `pms_product_ladder` VALUES (107, 63, 0, 0.00, 0.00);

-- ----------------------------
-- Table structure for pms_sku_stock
-- ----------------------------
DROP TABLE IF EXISTS `pms_sku_stock`;
CREATE TABLE `pms_sku_stock`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(0) NULL DEFAULT NULL,
  `sku_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'sku编码',
  `price` decimal(10, 2) NULL DEFAULT NULL,
  `stock` int(0) NULL DEFAULT 0 COMMENT '库存',
  `low_stock` int(0) NULL DEFAULT NULL COMMENT '预警库存',
  `sp1` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '销售属性1',
  `sp2` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sp3` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '展示图片',
  `sale` int(0) NULL DEFAULT NULL COMMENT '销量',
  `promotion_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '单品促销价格',
  `lock_stock` int(0) NULL DEFAULT 0 COMMENT '锁定库存',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 137 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'sku的库存' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pms_sku_stock
-- ----------------------------
INSERT INTO `pms_sku_stock` VALUES (1, 7, 'string', 100.00, 0, 5, 'string', 'string', 'string', 'string', 0, NULL, 0);
INSERT INTO `pms_sku_stock` VALUES (2, 8, 'string', 100.00, 0, 5, 'string', 'string', 'string', 'string', 0, NULL, 0);
INSERT INTO `pms_sku_stock` VALUES (3, 9, 'string', 100.00, 0, 5, 'string', 'string', 'string', 'string', 0, NULL, 0);
INSERT INTO `pms_sku_stock` VALUES (4, 10, 'string', 100.00, 0, 5, 'string', 'string', 'string', 'string', 0, NULL, 0);
INSERT INTO `pms_sku_stock` VALUES (5, 11, 'string', 100.00, 0, 5, 'string', 'string', 'string', 'string', 0, NULL, 0);
INSERT INTO `pms_sku_stock` VALUES (6, 12, 'string', 100.00, 0, 5, 'string', 'string', 'string', 'string', 0, NULL, 1);
INSERT INTO `pms_sku_stock` VALUES (7, 13, 'string', 100.00, 0, 5, 'string', 'string', 'string', 'string', 0, NULL, 1);
INSERT INTO `pms_sku_stock` VALUES (8, 14, 'string', 100.00, 0, 5, 'string', 'string', 'string', 'string', 0, NULL, 1);
INSERT INTO `pms_sku_stock` VALUES (9, 18, 'string', 100.00, 0, 5, 'string', 'string', 'string', 'string', 0, NULL, 0);
INSERT INTO `pms_sku_stock` VALUES (10, 7, 'string', 0.00, 0, 0, 'string', 'string', 'sp3', 'string', 0, NULL, 0);
INSERT INTO `pms_sku_stock` VALUES (11, 7, 'string', 0.00, 0, 0, 'string', 'string', 'sp33', 'string', 0, NULL, 0);
INSERT INTO `pms_sku_stock` VALUES (12, 22, '111', 99.00, 0, NULL, 'x', 'M', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/1522738681.jpg', NULL, NULL, 0);
INSERT INTO `pms_sku_stock` VALUES (13, 22, '112', 99.00, 0, NULL, 'xx', 'M', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/2018032614134591_20180326141345650 (4).png', NULL, NULL, 0);
INSERT INTO `pms_sku_stock` VALUES (78, 23, '201806070023001', 99.00, 0, NULL, '米白色', 'M', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/1522738681.jpg', NULL, NULL, 0);
INSERT INTO `pms_sku_stock` VALUES (79, 23, '201806070023002', 99.00, 0, NULL, '米白色', 'X', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/1522738681.jpg', NULL, NULL, 0);
INSERT INTO `pms_sku_stock` VALUES (80, 23, '201806070023003', 99.00, 0, NULL, '浅黄色', 'M', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/2017091716493787_20170917164937650 (1).png', NULL, NULL, 0);
INSERT INTO `pms_sku_stock` VALUES (81, 23, '201806070023004', 99.00, 0, NULL, '浅黄色', 'X', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/2017091716493787_20170917164937650 (1).png', NULL, NULL, 0);
INSERT INTO `pms_sku_stock` VALUES (102, 28, '201808270028001', 649.00, 999, NULL, '金色', '16G', NULL, NULL, NULL, NULL, 0);
INSERT INTO `pms_sku_stock` VALUES (103, 28, '201808270028002', 699.00, 99, NULL, '金色', '32G', NULL, NULL, NULL, NULL, 0);
INSERT INTO `pms_sku_stock` VALUES (104, 28, '201808270028003', 649.00, 100, NULL, '银色', '16G', NULL, NULL, NULL, NULL, 0);
INSERT INTO `pms_sku_stock` VALUES (105, 28, '201808270028004', 699.00, 100, NULL, '银色', '32G', NULL, NULL, NULL, NULL, 0);
INSERT INTO `pms_sku_stock` VALUES (106, 29, '201808270029001', 5499.00, 99, NULL, '金色', '32G', NULL, NULL, NULL, NULL, 0);
INSERT INTO `pms_sku_stock` VALUES (107, 29, '201808270029002', 6299.00, 100, NULL, '金色', '64G', NULL, NULL, NULL, NULL, 0);
INSERT INTO `pms_sku_stock` VALUES (108, 29, '201808270029003', 5499.00, 100, NULL, '银色', '32G', NULL, NULL, NULL, NULL, 0);
INSERT INTO `pms_sku_stock` VALUES (109, 29, '201808270029004', 6299.00, 100, NULL, '银色', '64G', NULL, NULL, NULL, NULL, 0);
INSERT INTO `pms_sku_stock` VALUES (130, 26, '201806070026001', 3788.00, 999, 78, '金色', '16G', NULL, NULL, NULL, NULL, 0);
INSERT INTO `pms_sku_stock` VALUES (131, 26, '201806070026002', 3999.00, 500, NULL, '金色', '32G', NULL, NULL, NULL, NULL, 0);
INSERT INTO `pms_sku_stock` VALUES (132, 26, '201806070026003', 3788.00, 500, NULL, '银色', '16G', NULL, NULL, NULL, NULL, 0);
INSERT INTO `pms_sku_stock` VALUES (133, 26, '201806070026004', 3999.00, 500, NULL, '银色', '32G', NULL, NULL, NULL, NULL, 0);
INSERT INTO `pms_sku_stock` VALUES (134, 27, '201808270027001', 2699.00, 90, NULL, '黑色', '32G', NULL, NULL, NULL, NULL, 0);
INSERT INTO `pms_sku_stock` VALUES (135, 27, '201808270027002', 2999.00, 100, NULL, '黑色', '64G', NULL, NULL, NULL, NULL, 0);
INSERT INTO `pms_sku_stock` VALUES (136, 27, '201808270027003', 2699.00, 100, NULL, '蓝色', '32G', NULL, NULL, NULL, NULL, 0);
INSERT INTO `pms_sku_stock` VALUES (137, 27, '201808270027004', 2999.00, 100, NULL, '蓝色', '64G', NULL, NULL, NULL, NULL, 0);

-- ----------------------------
-- Table structure for ums_admin
-- ----------------------------
DROP TABLE IF EXISTS `ums_admin`;
CREATE TABLE `ums_admin`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `username` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `icon` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `nick_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `note` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注信息',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `login_time` datetime(0) NULL DEFAULT NULL COMMENT '最后登录时间',
  `status` int(0) NULL DEFAULT 1 COMMENT '帐号启用状态：0->禁用；1->启用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '后台用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_admin
-- ----------------------------
INSERT INTO `ums_admin` VALUES (1, 'test', '119', 'https://tupian.qqw21.com/article/UploadPic/2020-12/2020122122203578674.jpg', NULL, '测试账号', NULL, '2018-09-29 13:55:30', '2018-09-29 13:55:39', 1);
INSERT INTO `ums_admin` VALUES (3, 'admin', '119', 'https://tupian.qqw21.com/article/UploadPic/2020-12/2020122122203578674.jpg', 'admin@163.com', '系统管理员', '系统管理员', '2018-10-08 13:32:47', '2019-03-20 15:38:50', 1);
INSERT INTO `ums_admin` VALUES (5, 'URLeisure', 'say123321', 'https://tupian.qqw21.com/article/UploadPic/2020-12/2020122122203578674.jpg', NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for ums_log
-- ----------------------------
DROP TABLE IF EXISTS `ums_log`;
CREATE TABLE `ums_log`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `create_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cost_time` int(0) NULL DEFAULT NULL,
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `request_param` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `request_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `request_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `userid` int(0) NOT NULL,
  `log_type` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20405 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户操作日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_log
-- ----------------------------
INSERT INTO `ums_log` VALUES (20237, '2023-08-04', '2023-08-04', 91, '192.168.238.1', '用户登出', '{}', 'POST', '/admin/logout', 3, 3);
INSERT INTO `ums_log` VALUES (20238, '2023-08-04', '2023-08-04', 58, '192.168.238.1', '前端获取当前登录用户信息', '{}', 'GET', '/admin/info', 3, 3);
INSERT INTO `ums_log` VALUES (20239, '2023-08-04', '2023-08-04', 9, '192.168.238.1', '用户登出', '{}', 'POST', '/admin/logout', 3, 3);
INSERT INTO `ums_log` VALUES (20240, '2023-08-04', '2023-08-04', 69, '192.168.238.1', '前端获取当前登录用户信息', '{}', 'GET', '/admin/info', 3, 3);
INSERT INTO `ums_log` VALUES (20241, '2023-08-04', '2023-08-04', 9, '192.168.238.1', '用户登出', '{}', 'POST', '/admin/logout', 3, 3);
INSERT INTO `ums_log` VALUES (20242, '2023-08-04', '2023-08-04', 17, '192.168.238.1', '前端获取当前登录用户信息', '{}', 'GET', '/admin/info', 3, 3);
INSERT INTO `ums_log` VALUES (20243, '2023-08-04', '2023-08-04', 10, '192.168.238.1', '用户登出', '{}', 'POST', '/admin/logout', 3, 3);
INSERT INTO `ums_log` VALUES (20244, '2023-08-04', '2023-08-04', 30, '192.168.238.1', '前端获取当前登录用户信息', '{}', 'GET', '/admin/info', 5, 3);
INSERT INTO `ums_log` VALUES (20245, '2023-08-04', '2023-08-04', 18, '192.168.238.1', '前端获取当前登录用户信息', '{}', 'GET', '/admin/info', 5, 3);
INSERT INTO `ums_log` VALUES (20246, '2023-08-04', '2023-08-04', 10, '192.168.238.1', '用户登出', '{}', 'POST', '/admin/logout', 5, 3);
INSERT INTO `ums_log` VALUES (20247, '2023-08-04', '2023-08-04', 390, '192.168.238.1', '前端获取当前登录用户信息', '{}', 'GET', '/admin/info', 5, 3);
INSERT INTO `ums_log` VALUES (20248, '2023-08-04', '2023-08-04', 22, '192.168.238.1', '前端获取当前登录用户信息', '{}', 'GET', '/admin/info', 5, 3);
INSERT INTO `ums_log` VALUES (20249, '2023-08-04', '2023-08-04', 68, '192.168.238.1', '前端获取当前登录用户信息', '{}', 'GET', '/admin/info', 5, 3);
INSERT INTO `ums_log` VALUES (20250, '2023-08-04', '2023-08-04', 16, '192.168.238.1', '用户登出', '{}', 'POST', '/admin/logout', 5, 3);
INSERT INTO `ums_log` VALUES (20251, '2023-08-04', '2023-08-04', 13, '192.168.238.1', '前端获取当前登录用户信息', '{}', 'GET', '/admin/info', 5, 3);
INSERT INTO `ums_log` VALUES (20252, '2023-08-07', '2023-08-07', 66, '192.168.238.1', '前端获取当前登录用户信息', '{}', 'GET', '/admin/info', 5, 3);
INSERT INTO `ums_log` VALUES (20253, '2023-08-07', '2023-08-07', 63, '192.168.238.1', '查询商品', '{\'pageNum\':[\'1\']&&\'pageSize\':[\'5\']}', 'GET', '/product/list', 5, 50);
INSERT INTO `ums_log` VALUES (20254, '2023-08-07', '2023-08-07', 27, '192.168.238.1', '查询商品', '{\'pageNum\':[\'1\']&&\'pageSize\':[\'5\']}', 'GET', '/product/list', 5, 50);
INSERT INTO `ums_log` VALUES (20255, '2023-08-07', '2023-08-07', 20, '192.168.238.1', '查询商品', '{\'pageNum\':[\'1\']&&\'pageSize\':[\'5\']}', 'GET', '/product/list', 5, 50);
INSERT INTO `ums_log` VALUES (20256, '2023-08-07', '2023-08-07', 72, '192.168.238.1', '前端获取当前登录用户信息', '{}', 'GET', '/admin/info', 5, 3);
INSERT INTO `ums_log` VALUES (20257, '2023-08-07', '2023-08-07', 35, '192.168.238.1', '查询商品', '{\'pageNum\':[\'1\']&&\'pageSize\':[\'5\']}', 'GET', '/product/list', 5, 50);
INSERT INTO `ums_log` VALUES (20258, '2023-08-07', '2023-08-07', 123, '192.168.238.1', '用户登出', '{}', 'POST', '/admin/logout', 5, 3);
INSERT INTO `ums_log` VALUES (20259, '2023-08-07', '2023-08-07', 11, '192.168.238.1', '前端获取当前登录用户信息', '{}', 'GET', '/admin/info', 5, 3);
INSERT INTO `ums_log` VALUES (20260, '2023-08-07', '2023-08-07', 36930, '192.168.238.1', '查询商品', '{\'pageNum\':[\'1\']&&\'pageSize\':[\'5\']}', 'GET', '/product/list', 5, 50);
INSERT INTO `ums_log` VALUES (20261, '2023-08-07', '2023-08-07', 55, '192.168.238.1', '前端获取当前登录用户信息', '{}', 'GET', '/admin/info', 5, 3);
INSERT INTO `ums_log` VALUES (20262, '2023-08-07', '2023-08-07', 30, '192.168.238.1', '查询商品', '{\'pageNum\':[\'1\']&&\'pageSize\':[\'5\']}', 'GET', '/product/list', 5, 50);
INSERT INTO `ums_log` VALUES (20263, '2023-08-07', '2023-08-07', 20, '192.168.238.1', '查询商品', '{\'keyword\':[\'小\']&&\'pageNum\':[\'1\']&&\'pageSize\':[\'5\']}', 'GET', '/product/list', 5, 50);
INSERT INTO `ums_log` VALUES (20264, '2023-08-07', '2023-08-07', 26, '192.168.238.1', '查询商品', '{\'keyword\':[\'小\']&&\'pageNum\':[\'1\']&&\'pageSize\':[\'5\']}', 'GET', '/product/list', 5, 50);
INSERT INTO `ums_log` VALUES (20265, '2023-08-07', '2023-08-07', 21, '192.168.238.1', '查询商品', '{\'pageNum\':[\'1\']&&\'pageSize\':[\'5\']}', 'GET', '/product/list', 5, 50);
INSERT INTO `ums_log` VALUES (20266, '2023-08-07', '2023-08-07', 63, '192.168.238.1', '前端获取当前登录用户信息', '{}', 'GET', '/admin/info', 5, 3);
INSERT INTO `ums_log` VALUES (20267, '2023-08-07', '2023-08-07', 74, '192.168.238.1', '查询商品', '{\'pageNum\':[\'1\']&&\'pageSize\':[\'5\']}', 'GET', '/product/list', 5, 50);
INSERT INTO `ums_log` VALUES (20268, '2023-08-07', '2023-08-07', 29, '192.168.238.1', '查询商品', '{\'keyword\':[\'小米\']&&\'pageNum\':[\'1\']&&\'pageSize\':[\'5\']}', 'GET', '/product/list', 5, 50);
INSERT INTO `ums_log` VALUES (20269, '2023-08-07', '2023-08-07', 97, '192.168.238.1', '前端获取当前登录用户信息', '{}', 'GET', '/admin/info', 5, 3);
INSERT INTO `ums_log` VALUES (20270, '2023-08-07', '2023-08-07', 25, '192.168.238.1', '查询商品', '{\'pageNum\':[\'1\']&&\'pageSize\':[\'5\']}', 'GET', '/product/list', 5, 50);
INSERT INTO `ums_log` VALUES (20271, '2023-08-07', '2023-08-07', 9, '192.168.238.1', '用户登出', '{}', 'POST', '/admin/logout', 5, 3);
INSERT INTO `ums_log` VALUES (20272, '2023-08-07', '2023-08-07', 14, '192.168.238.1', '前端获取当前登录用户信息', '{}', 'GET', '/admin/info', 5, 3);
INSERT INTO `ums_log` VALUES (20273, '2023-08-07', '2023-08-07', 31, '192.168.238.1', '查询商品', '{\'pageNum\':[\'1\']&&\'pageSize\':[\'5\']}', 'GET', '/product/list', 5, 50);
INSERT INTO `ums_log` VALUES (20274, '2023-08-07', '2023-08-07', 24, '192.168.238.1', '查询商品', '{\'pageNum\':[\'1\']&&\'pageSize\':[\'5\']}', 'GET', '/product/list', 5, 50);
INSERT INTO `ums_log` VALUES (20275, '2023-08-07', '2023-08-07', 21, '192.168.238.1', '查询商品', '{\'keyword\':[\'小\']&&\'pageNum\':[\'1\']&&\'pageSize\':[\'5\']}', 'GET', '/product/list', 5, 50);
INSERT INTO `ums_log` VALUES (20276, '2023-08-07', '2023-08-07', 23, '192.168.238.1', '查询商品', '{\'keyword\':[\'小\']&&\'pageNum\':[\'1\']&&\'pageSize\':[\'5\']}', 'GET', '/product/list', 5, 50);
INSERT INTO `ums_log` VALUES (20277, '2023-08-07', '2023-08-07', 67, '192.168.238.1', '用户登出', '{}', 'POST', '/admin/logout', 5, 3);
INSERT INTO `ums_log` VALUES (20278, '2023-08-07', '2023-08-07', 13, '192.168.238.1', '前端获取当前登录用户信息', '{}', 'GET', '/admin/info', 5, 3);
INSERT INTO `ums_log` VALUES (20279, '2023-08-07', '2023-08-07', 67512, '192.168.238.1', '查询商品', '{\'pageNum\':[\'1\']&&\'pageSize\':[\'5\']}', 'GET', '/product/list', 5, 50);
INSERT INTO `ums_log` VALUES (20280, '2023-08-07', '2023-08-07', 34238, '192.168.238.1', '查询商品', '{\'keyword\':[\'小\']&&\'pageNum\':[\'1\']&&\'pageSize\':[\'5\']}', 'GET', '/product/list', 5, 50);
INSERT INTO `ums_log` VALUES (20281, '2023-08-07', '2023-08-07', 20677, '192.168.238.1', '查询商品', '{\'keyword\':[\'小\']&&\'pageNum\':[\'1\']&&\'pageSize\':[\'5\']}', 'GET', '/product/list', 5, 50);
INSERT INTO `ums_log` VALUES (20282, '2023-08-07', '2023-08-07', 45330, '192.168.238.1', '查询商品', '{\'keyword\':[\'小\']&&\'pageNum\':[\'1\']&&\'pageSize\':[\'5\']}', 'GET', '/product/list', 5, 50);
INSERT INTO `ums_log` VALUES (20283, '2023-08-07', '2023-08-07', 63, '192.168.238.1', '前端获取当前登录用户信息', '{}', 'GET', '/admin/info', 5, 3);
INSERT INTO `ums_log` VALUES (20284, '2023-08-07', '2023-08-07', 184284, '192.168.238.1', '查询商品', '{\'pageNum\':[\'1\']&&\'pageSize\':[\'5\']}', 'GET', '/product/list', 5, 50);
INSERT INTO `ums_log` VALUES (20285, '2023-08-07', '2023-08-07', 99, '192.168.238.1', '前端获取当前登录用户信息', '{}', 'GET', '/admin/info', 5, 3);
INSERT INTO `ums_log` VALUES (20286, '2023-08-07', '2023-08-07', 31, '192.168.238.1', '查询商品', '{\'pageNum\':[\'1\']&&\'pageSize\':[\'5\']}', 'GET', '/product/list', 5, 50);
INSERT INTO `ums_log` VALUES (20287, '2023-08-07', '2023-08-07', 23, '192.168.238.1', '查询商品', '{\'pageNum\':[\'1\']&&\'pageSize\':[\'5\']&&\'publishStatus\':[\'1\']}', 'GET', '/product/list', 5, 50);
INSERT INTO `ums_log` VALUES (20288, '2023-08-07', '2023-08-07', 21, '192.168.238.1', '查询商品', '{\'pageNum\':[\'1\']&&\'pageSize\':[\'5\']&&\'publishStatus\':[\'0\']}', 'GET', '/product/list', 5, 50);
INSERT INTO `ums_log` VALUES (20289, '2023-08-07', '2023-08-07', 14, '192.168.238.1', '查询商品', '{\'pageNum\':[\'1\']&&\'pageSize\':[\'5\']&&\'publishStatus\':[\'0\']&&\'verifyStatus\':[\'1\']}', 'GET', '/product/list', 5, 50);
INSERT INTO `ums_log` VALUES (20290, '2023-08-07', '2023-08-07', 23, '192.168.238.1', '查询商品', '{\'pageNum\':[\'1\']&&\'pageSize\':[\'5\']}', 'GET', '/product/list', 5, 50);
INSERT INTO `ums_log` VALUES (20291, '2023-08-07', '2023-08-07', 59, '192.168.238.1', '前端获取当前登录用户信息', '{}', 'GET', '/admin/info', 5, 3);
INSERT INTO `ums_log` VALUES (20292, '2023-08-07', '2023-08-07', 81, '192.168.238.1', '前端获取当前登录用户信息', '{}', 'GET', '/admin/info', 5, 3);
INSERT INTO `ums_log` VALUES (20293, '2023-08-07', '2023-08-07', 90, '192.168.238.1', '查询商品', '{\'pageNum\':[\'1\']&&\'pageSize\':[\'5\']}', 'GET', '/product/list', 5, 50);
INSERT INTO `ums_log` VALUES (20294, '2023-08-07', '2023-08-07', 34, '192.168.238.1', '查询商品', '{\'keyword\':[\'小\']&&\'pageNum\':[\'1\']&&\'pageSize\':[\'5\']}', 'GET', '/product/list', 5, 50);
INSERT INTO `ums_log` VALUES (20295, '2023-08-07', '2023-08-07', 25, '192.168.238.1', '查询商品', '{\'keyword\':[\'小\']&&\'pageNum\':[\'1\']&&\'pageSize\':[\'5\']}', 'GET', '/product/list', 5, 50);
INSERT INTO `ums_log` VALUES (20296, '2023-08-07', '2023-08-07', 90, '192.168.238.1', '前端获取当前登录用户信息', '{}', 'GET', '/admin/info', 5, 3);
INSERT INTO `ums_log` VALUES (20297, '2023-08-07', '2023-08-07', 36, '192.168.238.1', '查询商品', '{\'pageNum\':[\'1\']&&\'pageSize\':[\'5\']}', 'GET', '/product/list', 5, 50);
INSERT INTO `ums_log` VALUES (20298, '2023-08-07', '2023-08-07', 68, '192.168.238.1', '前端获取当前登录用户信息', '{}', 'GET', '/admin/info', 5, 3);
INSERT INTO `ums_log` VALUES (20299, '2023-08-07', '2023-08-07', 73, '192.168.238.1', '查询商品', '{\'pageNum\':[\'1\']&&\'pageSize\':[\'5\']}', 'GET', '/product/list', 5, 50);
INSERT INTO `ums_log` VALUES (20300, '2023-08-07', '2023-08-07', 34, '192.168.238.1', '查询商品', '{\'keyword\':[\'小\']&&\'pageNum\':[\'1\']&&\'pageSize\':[\'5\']}', 'GET', '/product/list', 5, 50);
INSERT INTO `ums_log` VALUES (20301, '2023-08-07', '2023-08-07', 58, '192.168.238.1', '前端获取当前登录用户信息', '{}', 'GET', '/admin/info', 5, 3);
INSERT INTO `ums_log` VALUES (20302, '2023-08-07', '2023-08-07', 39, '192.168.238.1', '查询商品', '{\'pageNum\':[\'1\']&&\'pageSize\':[\'5\']}', 'GET', '/product/list', 5, 50);
INSERT INTO `ums_log` VALUES (20303, '2023-08-07', '2023-08-07', 40, '192.168.238.1', '查询商品', '{\'keyword\':[\'小\']&&\'pageNum\':[\'1\']&&\'pageSize\':[\'5\']}', 'GET', '/product/list', 5, 50);
INSERT INTO `ums_log` VALUES (20304, '2023-08-07', '2023-08-07', 104, '192.168.238.1', '查询商品', '{\'keyword\':[\'小\']&&\'pageNum\':[\'1\']&&\'pageSize\':[\'5\']}', 'GET', '/product/list', 5, 50);
INSERT INTO `ums_log` VALUES (20305, '2023-08-07', '2023-08-07', 58, '192.168.238.1', '前端获取当前登录用户信息', '{}', 'GET', '/admin/info', 5, 3);
INSERT INTO `ums_log` VALUES (20306, '2023-08-07', '2023-08-07', 76, '192.168.238.1', '查询商品', '{\'pageNum\':[\'1\']&&\'pageSize\':[\'5\']}', 'GET', '/product/list', 5, 50);
INSERT INTO `ums_log` VALUES (20307, '2023-08-07', '2023-08-07', 98, '192.168.238.1', '前端获取当前登录用户信息', '{}', 'GET', '/admin/info', 5, 3);
INSERT INTO `ums_log` VALUES (20308, '2023-08-07', '2023-08-07', 92, '192.168.238.1', '查询商品', '{\'pageNum\':[\'1\']&&\'pageSize\':[\'5\']}', 'GET', '/product/list', 5, 50);
INSERT INTO `ums_log` VALUES (20309, '2023-08-07', '2023-08-07', 99, '192.168.238.1', '查询商品', '{\'pageNum\':[\'1\']&&\'pageSize\':[\'5\']}', 'GET', '/product/list', 5, 50);
INSERT INTO `ums_log` VALUES (20310, '2023-08-07', '2023-08-07', 68, '192.168.238.1', '前端获取当前登录用户信息', '{}', 'GET', '/admin/info', 5, 3);
INSERT INTO `ums_log` VALUES (20311, '2023-08-07', '2023-08-07', 44, '192.168.238.1', '查询商品', '{\'pageNum\':[\'1\']&&\'pageSize\':[\'5\']}', 'GET', '/product/list', 5, 50);
INSERT INTO `ums_log` VALUES (20312, '2023-08-07', '2023-08-07', 74, '192.168.238.1', '前端获取当前登录用户信息', '{}', 'GET', '/admin/info', 5, 3);
INSERT INTO `ums_log` VALUES (20313, '2023-08-07', '2023-08-07', 48, '192.168.238.1', '查询商品', '{\'pageNum\':[\'1\']&&\'pageSize\':[\'5\']}', 'GET', '/product/list', 5, 50);
INSERT INTO `ums_log` VALUES (20314, '2023-08-07', '2023-08-07', 26, '192.168.238.1', '查询商品', '{\'pageNum\':[\'1\']&&\'pageSize\':[\'5\']}', 'GET', '/product/list', 5, 50);
INSERT INTO `ums_log` VALUES (20315, '2023-08-07', '2023-08-07', 59, '192.168.238.1', '前端获取当前登录用户信息', '{}', 'GET', '/admin/info', 5, 3);
INSERT INTO `ums_log` VALUES (20316, '2023-08-07', '2023-08-07', 84, '192.168.238.1', '查询商品', '{\'pageNum\':[\'1\']&&\'pageSize\':[\'5\']}', 'GET', '/product/list', 5, 50);
INSERT INTO `ums_log` VALUES (20317, '2023-08-07', '2023-08-07', 56, '192.168.238.1', '前端获取当前登录用户信息', '{}', 'GET', '/admin/info', 5, 3);
INSERT INTO `ums_log` VALUES (20318, '2023-08-07', '2023-08-07', 88, '192.168.238.1', '查询商品', '{\'pageNum\':[\'1\']&&\'pageSize\':[\'5\']}', 'GET', '/product/list', 5, 50);
INSERT INTO `ums_log` VALUES (20319, '2023-08-07', '2023-08-07', 70, '192.168.238.1', '前端获取当前登录用户信息', '{}', 'GET', '/admin/info', 5, 3);
INSERT INTO `ums_log` VALUES (20320, '2023-08-07', '2023-08-07', 57, '192.168.238.1', '查询商品', '{\'pageNum\':[\'1\']&&\'pageSize\':[\'5\']}', 'GET', '/product/list', 5, 50);
INSERT INTO `ums_log` VALUES (20321, '2023-08-07', '2023-08-07', 22, '192.168.238.1', '查询商品', '{\'pageNum\':[\'1\']&&\'pageSize\':[\'5\']}', 'GET', '/product/list', 5, 50);
INSERT INTO `ums_log` VALUES (20322, '2023-08-07', '2023-08-07', 101, '192.168.238.1', '前端获取当前登录用户信息', '{}', 'GET', '/admin/info', 5, 3);
INSERT INTO `ums_log` VALUES (20323, '2023-08-07', '2023-08-07', 70, '192.168.238.1', '查询商品', '{\'pageNum\':[\'1\']&&\'pageSize\':[\'5\']}', 'GET', '/product/list', 5, 50);
INSERT INTO `ums_log` VALUES (20324, '2023-08-07', '2023-08-07', 68, '192.168.238.1', '前端获取当前登录用户信息', '{}', 'GET', '/admin/info', 5, 3);
INSERT INTO `ums_log` VALUES (20325, '2023-08-07', '2023-08-07', 54, '192.168.238.1', '查询商品', '{\'pageNum\':[\'1\']&&\'pageSize\':[\'5\']}', 'GET', '/product/list', 5, 50);
INSERT INTO `ums_log` VALUES (20326, '2023-08-07', '2023-08-07', 63, '192.168.238.1', '前端获取当前登录用户信息', '{}', 'GET', '/admin/info', 5, 3);
INSERT INTO `ums_log` VALUES (20327, '2023-08-07', '2023-08-07', 73, '192.168.238.1', '查询商品', '{\'pageNum\':[\'1\']&&\'pageSize\':[\'5\']}', 'GET', '/product/list', 5, 50);
INSERT INTO `ums_log` VALUES (20328, '2023-08-07', '2023-08-07', 63, '192.168.238.1', '前端获取当前登录用户信息', '{}', 'GET', '/admin/info', 5, 3);
INSERT INTO `ums_log` VALUES (20329, '2023-08-07', '2023-08-07', 51, '192.168.238.1', '前端获取当前登录用户信息', '{}', 'GET', '/admin/info', 3, 3);
INSERT INTO `ums_log` VALUES (20330, '2023-08-07', '2023-08-07', 83, '192.168.238.1', '查询商品', '{\'pageNum\':[\'1\']&&\'pageSize\':[\'5\']}', 'GET', '/product/list', 3, 50);
INSERT INTO `ums_log` VALUES (20331, '2023-08-07', '2023-08-07', 66, '192.168.238.1', '前端获取当前登录用户信息', '{}', 'GET', '/admin/info', 3, 3);
INSERT INTO `ums_log` VALUES (20332, '2023-08-07', '2023-08-07', 98, '192.168.238.1', '查询商品', '{\'pageNum\':[\'1\']&&\'pageSize\':[\'5\']}', 'GET', '/product/list', 3, 50);
INSERT INTO `ums_log` VALUES (20333, '2023-08-07', '2023-08-07', 40, '192.168.238.1', '品牌列表', '{\'pageNum\':[\'1\']&&\'pageSize\':[\'100\']}', 'GET', '/brand/list', 3, 4);
INSERT INTO `ums_log` VALUES (20334, '2023-08-07', '2023-08-07', 40, '192.168.238.1', '查询商品', '{\'pageNum\':[\'1\']&&\'pageSize\':[\'5\']}', 'GET', '/product/list', 3, 50);
INSERT INTO `ums_log` VALUES (20335, '2023-08-07', '2023-08-07', 47, '192.168.238.1', '品牌列表', '{\'pageNum\':[\'1\']&&\'pageSize\':[\'100\']}', 'GET', '/brand/list', 3, 4);
INSERT INTO `ums_log` VALUES (20336, '2023-08-07', '2023-08-07', 18, '192.168.238.1', '品牌列表', '{\'pageNum\':[\'1\']&&\'pageSize\':[\'100\']}', 'GET', '/brand/list', 3, 4);
INSERT INTO `ums_log` VALUES (20337, '2023-08-07', '2023-08-07', 18, '192.168.238.1', '品牌列表', '{\'pageNum\':[\'1\']&&\'pageSize\':[\'10\']}', 'GET', '/brand/list', 3, 4);
INSERT INTO `ums_log` VALUES (20338, '2023-08-07', '2023-08-07', 23, '192.168.238.1', '品牌列表', '{\'pageNum\':[\'1\']&&\'pageSize\':[\'100\']}', 'GET', '/brand/list', 3, 4);
INSERT INTO `ums_log` VALUES (20339, '2023-08-07', '2023-08-07', 38, '192.168.238.1', '品牌列表', '{\'pageNum\':[\'1\']&&\'pageSize\':[\'100\']}', 'GET', '/brand/list', 3, 4);
INSERT INTO `ums_log` VALUES (20340, '2023-08-07', '2023-08-07', 20, '192.168.238.1', '查询商品', '{\'pageNum\':[\'1\']&&\'pageSize\':[\'5\']}', 'GET', '/product/list', 3, 50);
INSERT INTO `ums_log` VALUES (20341, '2023-08-07', '2023-08-07', 23, '192.168.238.1', '查询商品', '{\'pageNum\':[\'1\']&&\'pageSize\':[\'5\']&&\'brandId\':[\'2\']}', 'GET', '/product/list', 3, 50);
INSERT INTO `ums_log` VALUES (20342, '2023-08-07', '2023-08-07', 24, '192.168.238.1', '查询商品', '{\'pageNum\':[\'1\']&&\'pageSize\':[\'5\']&&\'brandId\':[\'6\']}', 'GET', '/product/list', 3, 50);
INSERT INTO `ums_log` VALUES (20343, '2023-08-07', '2023-08-07', 18, '192.168.238.1', '查询商品', '{\'pageNum\':[\'1\']&&\'pageSize\':[\'5\']&&\'brandId\':[\'3\']}', 'GET', '/product/list', 3, 50);
INSERT INTO `ums_log` VALUES (20344, '2023-08-07', '2023-08-07', 13, '192.168.238.1', '查询商品', '{\'pageNum\':[\'1\']&&\'pageSize\':[\'5\']&&\'brandId\':[\'1\']}', 'GET', '/product/list', 3, 50);
INSERT INTO `ums_log` VALUES (20345, '2023-08-07', '2023-08-07', 14, '192.168.238.1', '查询商品', '{\'pageNum\':[\'1\']&&\'pageSize\':[\'5\']&&\'brandId\':[\'4\']}', 'GET', '/product/list', 3, 50);
INSERT INTO `ums_log` VALUES (20346, '2023-08-07', '2023-08-07', 19, '192.168.238.1', '查询商品', '{\'pageNum\':[\'1\']&&\'pageSize\':[\'5\']&&\'brandId\':[\'51\']}', 'GET', '/product/list', 3, 50);
INSERT INTO `ums_log` VALUES (20347, '2023-08-07', '2023-08-07', 97, '192.168.238.1', '前端获取当前登录用户信息', '{}', 'GET', '/admin/info', 5, 3);
INSERT INTO `ums_log` VALUES (20348, '2023-08-07', '2023-08-07', 81, '192.168.238.1', '查询商品', '{\'pageNum\':[\'1\']&&\'pageSize\':[\'5\']}', 'GET', '/product/list', 5, 50);
INSERT INTO `ums_log` VALUES (20349, '2023-08-07', '2023-08-07', 33, '192.168.238.1', '品牌列表', '{\'pageNum\':[\'1\']&&\'pageSize\':[\'100\']}', 'GET', '/brand/list', 5, 4);
INSERT INTO `ums_log` VALUES (20350, '2023-08-07', '2023-08-07', 72, '192.168.238.1', '前端获取当前登录用户信息', '{}', 'GET', '/admin/info', 5, 3);
INSERT INTO `ums_log` VALUES (20351, '2023-08-07', '2023-08-07', 83, '192.168.238.1', '品牌列表', '{\'pageNum\':[\'1\']&&\'pageSize\':[\'100\']}', 'GET', '/brand/list', 5, 4);
INSERT INTO `ums_log` VALUES (20352, '2023-08-07', '2023-08-07', 36, '192.168.238.1', '查询商品', '{\'pageNum\':[\'1\']&&\'pageSize\':[\'5\']}', 'GET', '/product/list', 5, 50);
INSERT INTO `ums_log` VALUES (20353, '2023-08-07', '2023-08-07', 145, '192.168.238.1', '前端获取当前登录用户信息', '{}', 'GET', '/admin/info', 5, 3);
INSERT INTO `ums_log` VALUES (20354, '2023-08-07', '2023-08-07', 92, '192.168.238.1', '查询商品', '{\'pageNum\':[\'1\']&&\'pageSize\':[\'5\']}', 'GET', '/product/list', 5, 50);
INSERT INTO `ums_log` VALUES (20355, '2023-08-07', '2023-08-07', 34, '192.168.238.1', '分页查询商品分类', '{}', 'GET', '/productCategory/list/withChildren', 5, 42);
INSERT INTO `ums_log` VALUES (20356, '2023-08-07', '2023-08-07', 29, '192.168.238.1', '品牌列表', '{\'pageNum\':[\'1\']&&\'pageSize\':[\'100\']}', 'GET', '/brand/list', 5, 4);
INSERT INTO `ums_log` VALUES (20357, '2023-08-07', '2023-08-07', 14, '192.168.238.1', '前端获取当前登录用户信息', '{}', 'GET', '/admin/info', 5, 3);
INSERT INTO `ums_log` VALUES (20358, '2023-08-07', '2023-08-07', 65, '192.168.238.1', '查询商品', '{\'pageNum\':[\'1\']&&\'pageSize\':[\'5\']}', 'GET', '/product/list', 5, 50);
INSERT INTO `ums_log` VALUES (20359, '2023-08-07', '2023-08-07', 103, '192.168.238.1', '分页查询商品分类', '{}', 'GET', '/productCategory/list/withChildren', 5, 42);
INSERT INTO `ums_log` VALUES (20360, '2023-08-07', '2023-08-07', 146, '192.168.238.1', '品牌列表', '{\'pageNum\':[\'1\']&&\'pageSize\':[\'100\']}', 'GET', '/brand/list', 5, 4);
INSERT INTO `ums_log` VALUES (20361, '2023-08-07', '2023-08-07', 23, '192.168.238.1', '查询商品', '{\'pageNum\':[\'1\']&&\'pageSize\':[\'5\']&&\'productCategoryId\':[\'34\']&&\'brandId\':[\'6\']}', 'GET', '/product/list', 5, 50);
INSERT INTO `ums_log` VALUES (20362, '2023-08-07', '2023-08-07', 138, '192.168.238.1', '查询商品', '{\'pageNum\':[\'1\']&&\'pageSize\':[\'5\']&&\'productCategoryId\':[\'31\']&&\'brandId\':[\'6\']}', 'GET', '/product/list', 5, 50);
INSERT INTO `ums_log` VALUES (20363, '2023-08-07', '2023-08-07', 33, '192.168.238.1', '查询商品', '{\'pageNum\':[\'1\']&&\'pageSize\':[\'5\']&&\'productCategoryId\':[\'19\']&&\'brandId\':[\'6\']}', 'GET', '/product/list', 5, 50);
INSERT INTO `ums_log` VALUES (20364, '2023-08-07', '2023-08-07', 11, '192.168.238.1', '前端获取当前登录用户信息', '{}', 'GET', '/admin/info', 5, 3);
INSERT INTO `ums_log` VALUES (20365, '2023-08-07', '2023-08-07', 45, '192.168.238.1', '品牌列表', '{\'pageNum\':[\'1\']&&\'pageSize\':[\'100\']}', 'GET', '/brand/list', 5, 4);
INSERT INTO `ums_log` VALUES (20366, '2023-08-07', '2023-08-07', 44, '192.168.238.1', '分页查询商品分类', '{}', 'GET', '/productCategory/list/withChildren', 5, 42);
INSERT INTO `ums_log` VALUES (20367, '2023-08-07', '2023-08-07', 53, '192.168.238.1', '查询商品', '{\'pageNum\':[\'1\']&&\'pageSize\':[\'5\']}', 'GET', '/product/list', 5, 50);
INSERT INTO `ums_log` VALUES (20368, '2023-08-07', '2023-08-07', 69, '192.168.238.1', '分页查询商品分类', '{}', 'GET', '/productCategory/list/withChildren', 5, 42);
INSERT INTO `ums_log` VALUES (20369, '2023-08-07', '2023-08-07', 165, '192.168.238.1', '品牌列表', '{\'pageNum\':[\'1\']&&\'pageSize\':[\'100\']}', 'GET', '/brand/list', 5, 4);
INSERT INTO `ums_log` VALUES (20370, '2023-08-07', '2023-08-07', 31, '192.168.238.1', '查询商品', '{\'pageNum\':[\'1\']&&\'pageSize\':[\'5\']}', 'GET', '/product/list', 5, 50);
INSERT INTO `ums_log` VALUES (20371, '2023-08-07', '2023-08-07', 80, '192.168.238.1', '前端获取当前登录用户信息', '{}', 'GET', '/admin/info', 5, 3);
INSERT INTO `ums_log` VALUES (20372, '2023-08-07', '2023-08-07', 160, '192.168.238.1', '分页查询商品分类', '{}', 'GET', '/productCategory/list/withChildren', 5, 42);
INSERT INTO `ums_log` VALUES (20373, '2023-08-07', '2023-08-07', 466, '192.168.238.1', '品牌列表', '{\'pageNum\':[\'1\']&&\'pageSize\':[\'100\']}', 'GET', '/brand/list', 5, 4);
INSERT INTO `ums_log` VALUES (20374, '2023-08-07', '2023-08-07', 458, '192.168.238.1', '查询商品', '{\'pageNum\':[\'1\']&&\'pageSize\':[\'5\']}', 'GET', '/product/list', 5, 50);
INSERT INTO `ums_log` VALUES (20375, '2023-08-07', '2023-08-07', 33, '192.168.238.1', '查询商品', '{\'pageNum\':[\'2\']&&\'pageSize\':[\'5\']}', 'GET', '/product/list', 5, 50);
INSERT INTO `ums_log` VALUES (20376, '2023-08-07', '2023-08-07', 28, '192.168.238.1', '查询商品', '{\'pageNum\':[\'3\']&&\'pageSize\':[\'5\']}', 'GET', '/product/list', 5, 50);
INSERT INTO `ums_log` VALUES (20377, '2023-08-07', '2023-08-07', 70, '192.168.238.1', '查询商品', '{\'pageNum\':[\'1\']&&\'pageSize\':[\'5\']}', 'GET', '/product/list', 5, 50);
INSERT INTO `ums_log` VALUES (20378, '2023-08-07', '2023-08-07', 18, '192.168.238.1', '查询商品', '{\'pageNum\':[\'2\']&&\'pageSize\':[\'5\']}', 'GET', '/product/list', 5, 50);
INSERT INTO `ums_log` VALUES (20379, '2023-08-07', '2023-08-07', 33, '192.168.238.1', '品牌列表', '{\'pageNum\':[\'1\']&&\'pageSize\':[\'10\']}', 'GET', '/brand/list', 5, 4);
INSERT INTO `ums_log` VALUES (20380, '2023-08-07', '2023-08-07', 25, '192.168.238.1', '品牌列表', '{\'pageNum\':[\'2\']&&\'pageSize\':[\'10\']}', 'GET', '/brand/list', 5, 4);
INSERT INTO `ums_log` VALUES (20381, '2023-08-07', '2023-08-07', 14, '192.168.238.1', '品牌列表', '{\'pageNum\':[\'1\']&&\'pageSize\':[\'10\']}', 'GET', '/brand/list', 5, 4);
INSERT INTO `ums_log` VALUES (20382, '2023-08-07', '2023-08-07', 19, '192.168.238.1', '品牌列表', '{\'pageNum\':[\'2\']&&\'pageSize\':[\'10\']}', 'GET', '/brand/list', 5, 4);
INSERT INTO `ums_log` VALUES (20383, '2023-08-07', '2023-08-07', 15, '192.168.238.1', '品牌列表', '{\'pageNum\':[\'1\']&&\'pageSize\':[\'10\']}', 'GET', '/brand/list', 5, 4);
INSERT INTO `ums_log` VALUES (20384, '2023-08-07', '2023-08-07', 14, '192.168.238.1', '品牌列表', '{\'pageNum\':[\'2\']&&\'pageSize\':[\'10\']}', 'GET', '/brand/list', 5, 4);
INSERT INTO `ums_log` VALUES (20385, '2023-08-07', '2023-08-07', 12, '192.168.238.1', '品牌列表', '{\'pageNum\':[\'1\']&&\'pageSize\':[\'10\']}', 'GET', '/brand/list', 5, 4);
INSERT INTO `ums_log` VALUES (20386, '2023-08-07', '2023-08-07', 37, '192.168.238.1', '分页查询商品分类', '{}', 'GET', '/productCategory/list/withChildren', 5, 42);
INSERT INTO `ums_log` VALUES (20387, '2023-08-07', '2023-08-07', 19, '192.168.238.1', '品牌列表', '{\'pageNum\':[\'1\']&&\'pageSize\':[\'100\']}', 'GET', '/brand/list', 5, 4);
INSERT INTO `ums_log` VALUES (20388, '2023-08-07', '2023-08-07', 123, '192.168.238.1', '分页查询商品分类', '{}', 'GET', '/productCategory/list/withChildren', 5, 42);
INSERT INTO `ums_log` VALUES (20389, '2023-08-07', '2023-08-07', 141, '192.168.238.1', '查询商品', '{\'pageNum\':[\'1\']&&\'pageSize\':[\'5\']}', 'GET', '/product/list', 5, 50);
INSERT INTO `ums_log` VALUES (20390, '2023-08-07', '2023-08-07', 43, '192.168.238.1', '品牌列表', '{\'pageNum\':[\'1\']&&\'pageSize\':[\'100\']}', 'GET', '/brand/list', 5, 4);
INSERT INTO `ums_log` VALUES (20391, '2023-08-07', '2023-08-07', 27, '192.168.238.1', '查询商品', '{\'pageNum\':[\'1\']&&\'pageSize\':[\'5\']&&\'brandId\':[\'5\']}', 'GET', '/product/list', 5, 50);
INSERT INTO `ums_log` VALUES (20392, '2023-08-07', '2023-08-07', 30, '192.168.238.1', '查询商品', '{\'pageNum\':[\'1\']&&\'pageSize\':[\'5\']&&\'brandId\':[\'3\']}', 'GET', '/product/list', 5, 50);
INSERT INTO `ums_log` VALUES (20393, '2023-08-07', '2023-08-07', 79, '192.168.238.1', '前端获取当前登录用户信息', '{}', 'GET', '/admin/info', 5, 3);
INSERT INTO `ums_log` VALUES (20394, '2023-08-07', '2023-08-07', 124, '192.168.238.1', '分页查询商品分类', '{}', 'GET', '/productCategory/list/withChildren', 5, 42);
INSERT INTO `ums_log` VALUES (20395, '2023-08-07', '2023-08-07', 359, '192.168.238.1', '品牌列表', '{\'pageNum\':[\'1\']&&\'pageSize\':[\'100\']}', 'GET', '/brand/list', 5, 4);
INSERT INTO `ums_log` VALUES (20396, '2023-08-07', '2023-08-07', 370, '192.168.238.1', '查询商品', '{\'pageNum\':[\'1\']&&\'pageSize\':[\'5\']}', 'GET', '/product/list', 5, 50);
INSERT INTO `ums_log` VALUES (20397, '2023-08-07', '2023-08-07', 12, '192.168.238.1', '前端获取当前登录用户信息', '{}', 'GET', '/admin/info', 5, 3);
INSERT INTO `ums_log` VALUES (20398, '2023-08-07', '2023-08-07', 30, '192.168.238.1', '品牌列表', '{\'pageNum\':[\'1\']&&\'pageSize\':[\'100\']}', 'GET', '/brand/list', 5, 4);
INSERT INTO `ums_log` VALUES (20399, '2023-08-07', '2023-08-07', 34, '192.168.238.1', '查询商品', '{\'pageNum\':[\'1\']&&\'pageSize\':[\'5\']}', 'GET', '/product/list', 5, 50);
INSERT INTO `ums_log` VALUES (20400, '2023-08-07', '2023-08-07', 32, '192.168.238.1', '分页查询商品分类', '{}', 'GET', '/productCategory/list/withChildren', 5, 42);
INSERT INTO `ums_log` VALUES (20401, '2023-08-07', '2023-08-07', 17, '192.168.238.1', '查询商品', '{\'pageNum\':[\'2\']&&\'pageSize\':[\'5\']}', 'GET', '/product/list', 5, 50);
INSERT INTO `ums_log` VALUES (20402, '2023-08-07', '2023-08-07', 15, '192.168.238.1', '品牌列表', '{\'pageNum\':[\'1\']&&\'pageSize\':[\'10\']}', 'GET', '/brand/list', 5, 4);
INSERT INTO `ums_log` VALUES (20403, '2023-08-07', '2023-08-07', 17, '192.168.238.1', '品牌列表', '{\'pageNum\':[\'2\']&&\'pageSize\':[\'10\']}', 'GET', '/brand/list', 5, 4);
INSERT INTO `ums_log` VALUES (20404, '2023-08-07', '2023-08-07', 11, '192.168.238.1', '前端获取当前登录用户信息', '{}', 'GET', '/admin/info', 5, 3);
INSERT INTO `ums_log` VALUES (20405, '2023-08-07', '2023-08-07', 15, '192.168.238.1', '品牌列表', '{\'pageNum\':[\'1\']&&\'pageSize\':[\'10\']}', 'GET', '/brand/list', 5, 4);
INSERT INTO `ums_log` VALUES (20406, '2023-09-21', '2023-09-21', 54, '192.168.238.1', '前端获取当前登录用户信息', '{}', 'GET', '/admin/info', 3, 3);
INSERT INTO `ums_log` VALUES (20407, '2023-09-21', '2023-09-21', 94, '192.168.238.1', '分页查询商品分类', '{}', 'GET', '/productCategory/list/withChildren', 3, 42);
INSERT INTO `ums_log` VALUES (20408, '2023-09-21', '2023-09-21', 396, '192.168.238.1', '查询商品', '{\'pageNum\':[\'1\']&&\'pageSize\':[\'5\']}', 'GET', '/product/list', 3, 50);
INSERT INTO `ums_log` VALUES (20409, '2023-09-21', '2023-09-21', 399, '192.168.238.1', '品牌列表', '{\'pageNum\':[\'1\']&&\'pageSize\':[\'100\']}', 'GET', '/brand/list', 3, 4);
INSERT INTO `ums_log` VALUES (20410, '2023-09-21', '2023-09-21', 69, '192.168.238.1', '品牌列表', '{\'pageNum\':[\'1\']&&\'pageSize\':[\'100\']}', 'GET', '/brand/list', 3, 4);
INSERT INTO `ums_log` VALUES (20411, '2023-09-21', '2023-09-21', 72, '192.168.238.1', '分页查询商品分类', '{}', 'GET', '/productCategory/list/withChildren', 3, 42);
INSERT INTO `ums_log` VALUES (20412, '2023-09-21', '2023-09-21', 14, '192.168.238.1', '品牌列表', '{\'pageNum\':[\'1\']&&\'pageSize\':[\'100\']}', 'GET', '/brand/list', 3, 4);
INSERT INTO `ums_log` VALUES (20413, '2023-09-21', '2023-09-21', 22, '192.168.238.1', '查询商品', '{\'pageNum\':[\'1\']&&\'pageSize\':[\'5\']}', 'GET', '/product/list', 3, 50);
INSERT INTO `ums_log` VALUES (20414, '2023-09-21', '2023-09-21', 13, '192.168.238.1', '分页查询商品分类', '{}', 'GET', '/productCategory/list/withChildren', 3, 42);

-- ----------------------------
-- Table structure for ums_log_type
-- ----------------------------
DROP TABLE IF EXISTS `ums_log_type`;
CREATE TABLE `ums_log_type`  (
  `log_type` bigint(0) NOT NULL,
  `type_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `flag` int(0) NULL DEFAULT NULL COMMENT '是否UV使用',
  PRIMARY KEY (`log_type`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_log_type
-- ----------------------------
INSERT INTO `ums_log_type` VALUES (0, '用户删除', 'USER_DELETE', 0);
INSERT INTO `ums_log_type` VALUES (1, '当前登录用户信息', 'USER_INFO', 0);
INSERT INTO `ums_log_type` VALUES (2, '哈哈 补充吧', 'USER_BAK', 1);
INSERT INTO `ums_log_type` VALUES (3, '登出', 'USER_LOGIN_OUT', 1);
INSERT INTO `ums_log_type` VALUES (4, '品牌列表', 'BRAND_LIST', 1);
INSERT INTO `ums_log_type` VALUES (5, '修改品牌', 'BRAND_UPDATE', 1);
INSERT INTO `ums_log_type` VALUES (6, '删除品牌', 'BRAND_DELETE', 1);
INSERT INTO `ums_log_type` VALUES (7, '增加品牌', 'BRAND_ADD', 1);
INSERT INTO `ums_log_type` VALUES (8, '优选专区列表', 'AREA_LIST', 0);
INSERT INTO `ums_log_type` VALUES (9, '获取商品专题', 'SUBJECT_LIST', 0);
INSERT INTO `ums_log_type` VALUES (10, '货物公司地址', 'COMPANY_ADDRESS', 0);
INSERT INTO `ums_log_type` VALUES (11, '订单明细', 'ORDER_DETAIL', 1);
INSERT INTO `ums_log_type` VALUES (12, '修改订单备注', 'ORDER_NOTE_UPDATE', 0);
INSERT INTO `ums_log_type` VALUES (13, '删除订单', 'ORDER_DELETE', 1);
INSERT INTO `ums_log_type` VALUES (14, '修改订单收货人', 'ORDER_RECEIVER_UPDATE', 0);
INSERT INTO `ums_log_type` VALUES (15, '修改订单费用信息', 'ORDER_MONEY_UPDATE', 0);
INSERT INTO `ums_log_type` VALUES (16, '关闭订单', 'ORDER_CLOE_UPDATE', 1);
INSERT INTO `ums_log_type` VALUES (17, '查询订单', 'ORDER_LIST', 1);
INSERT INTO `ums_log_type` VALUES (18, '订单发货', 'ORDER_DELIVERY', 0);
INSERT INTO `ums_log_type` VALUES (19, '取消超时订单', 'ORDER_CANCEL', 1);
INSERT INTO `ums_log_type` VALUES (20, '分页查询退货申请', 'ORDER_RETURN_APPLY', 0);
INSERT INTO `ums_log_type` VALUES (21, '删除退货申请', 'ORDER_DELETE_RETURN', 1);
INSERT INTO `ums_log_type` VALUES (22, '获取退货详情', 'ORDER_RETURN_DETAIL', 0);
INSERT INTO `ums_log_type` VALUES (23, '修改申请状态', 'ORDER_UPDATE_RETURN_STATUS', 1);
INSERT INTO `ums_log_type` VALUES (24, '添加退货原因', 'ORDER_ADD_RETURN_REASON', 1);
INSERT INTO `ums_log_type` VALUES (25, '查询退货原因', 'ORDER_RETURN_REASON_LIST', 0);
INSERT INTO `ums_log_type` VALUES (26, '删除退货原因', 'ORDER_DELETE_RETURN_REASON', 1);
INSERT INTO `ums_log_type` VALUES (27, '修改退货原因', 'ORDER_UPDATE_RETURN_REASON', 1);
INSERT INTO `ums_log_type` VALUES (28, '获取退货原因', 'ORDER_RETURN_REASON', 0);
INSERT INTO `ums_log_type` VALUES (29, '修改退货原因启用状态', 'ORDER_UPDATE_RETURN_REASON_STATUS', 1);
INSERT INTO `ums_log_type` VALUES (30, '获取指定订单设置', 'ORDER_DETAIL_SETTING', 1);
INSERT INTO `ums_log_type` VALUES (31, '修改指定订单设置', 'ORDER_UPDATE_DETAIL_SETTING', 1);
INSERT INTO `ums_log_type` VALUES (32, '获取商品属性', 'PRODUCT_ATTRIBUTE', 0);
INSERT INTO `ums_log_type` VALUES (33, '添加商品属性', 'PRODUCT_ADD_ATTRIBUTE', 1);
INSERT INTO `ums_log_type` VALUES (34, '删除商品属性', 'PRODUCT_DELETE_ATTRIBUTE', 1);
INSERT INTO `ums_log_type` VALUES (35, '修改商品属性', 'PRODUCT_UPDATE_ATTRIBUTE', 1);
INSERT INTO `ums_log_type` VALUES (36, '单个商品属性分类', 'PRODUCT_GET_ATTRIBUTE_CATEGORY', 0);
INSERT INTO `ums_log_type` VALUES (37, '所有商品属性分类及属性', 'PRODUCT_ATTRIBUTE_CATEGORY', 1);
INSERT INTO `ums_log_type` VALUES (38, '分类查询属性列表或参数', 'PRODUCT_ATTRIBUTE_LIST', 0);
INSERT INTO `ums_log_type` VALUES (39, '添加商品属性信息', 'PRODUCT_ATTRIBUTE_ADD', 1);
INSERT INTO `ums_log_type` VALUES (40, '单个属性信息', 'PRODUCT_ATTRIBUTE_DETAILS', 0);
INSERT INTO `ums_log_type` VALUES (41, '根据商品分类获取属性及属性分类', 'PRODUCT_CATEGORY_ID', 1);
INSERT INTO `ums_log_type` VALUES (42, '分页查询商品分类', 'PRODUCT_CATEGORY_LIST', 0);
INSERT INTO `ums_log_type` VALUES (43, '添加产品分类', 'PRODUCT_CATEGORY_ADD', 1);
INSERT INTO `ums_log_type` VALUES (44, '删除产品分类', 'PRODUCT_CATEGORY_DELETE', 1);
INSERT INTO `ums_log_type` VALUES (45, '修改产品分类', 'PRODUCT_CATEGORY_UPDATE', 1);
INSERT INTO `ums_log_type` VALUES (46, '修改导航栏显示状态', 'PRODUCT_NAV_STATUS', 0);
INSERT INTO `ums_log_type` VALUES (47, '修改显示状态', 'PRODUCT_SHOW_STATUS', 0);
INSERT INTO `ums_log_type` VALUES (48, '查询所有一级分类及子分类', 'PRODUCT_WITH_CHILDREN', 0);
INSERT INTO `ums_log_type` VALUES (49, '创建商品', 'PRODUCT_ADD', 1);
INSERT INTO `ums_log_type` VALUES (50, '商品列表', 'PRODUCT_LIST', 1);
INSERT INTO `ums_log_type` VALUES (51, '产品修改删除状态', 'PRODUCT_DELETE_STATUS', 1);
INSERT INTO `ums_log_type` VALUES (52, '产品上下架状态', 'PRODUCT_PUBLISH_STATUS', 0);
INSERT INTO `ums_log_type` VALUES (53, '推荐商品状态', 'PRODUCT_RECOMMEND_STATUS', 0);
INSERT INTO `ums_log_type` VALUES (54, '设为新品状态', 'PRODUCT_NEW_STATUS', 0);
INSERT INTO `ums_log_type` VALUES (55, '获取商品编辑信息', 'PRODUCT_ID', 1);
INSERT INTO `ums_log_type` VALUES (56, '更新商品', 'PRODUCT_UPDATE', 1);
INSERT INTO `ums_log_type` VALUES (57, '模糊搜索sku库存', 'PRODUCT_GET_SKU_STOCK', 1);
INSERT INTO `ums_log_type` VALUES (58, '更新库存信息', 'PRODUCT_UPDATE_SKU_STOCK', 1);
INSERT INTO `ums_log_type` VALUES (59, '查询所有会员等级', 'UMS_MEMBER_LEVEL_LIST', 0);
INSERT INTO `ums_log_type` VALUES (60, 'UserView数据统计管理', 'UMS_USER_VIEW_LIST', 1);
INSERT INTO `ums_log_type` VALUES (61, 'UserView统计类型管理', 'UMS_USER_VIEW_TYPE_LIST', 0);
INSERT INTO `ums_log_type` VALUES (62, '修改品牌制造商状态', 'BRAND_UPDATE_FACTORY_STATUS', 0);

-- ----------------------------
-- Table structure for ums_member_level
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_level`;
CREATE TABLE `ums_member_level`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `growth_point` int(0) NULL DEFAULT NULL,
  `default_status` int(0) NULL DEFAULT NULL COMMENT '是否为默认等级：0->不是；1->是',
  `free_freight_point` decimal(10, 2) NULL DEFAULT NULL COMMENT '免运费标准',
  `comment_growth_point` int(0) NULL DEFAULT NULL COMMENT '每次评价获取的成长值',
  `priviledge_free_freight` int(0) NULL DEFAULT NULL COMMENT '是否有免邮特权',
  `priviledge_sign_in` int(0) NULL DEFAULT NULL COMMENT '是否有签到特权',
  `priviledge_comment` int(0) NULL DEFAULT NULL COMMENT '是否有评论获奖励特权',
  `priviledge_promotion` int(0) NULL DEFAULT NULL COMMENT '是否有专享活动特权',
  `priviledge_member_price` int(0) NULL DEFAULT NULL COMMENT '是否有会员价格特权',
  `priviledge_birthday` int(0) NULL DEFAULT NULL COMMENT '是否有生日特权',
  `note` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员等级表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_member_level
-- ----------------------------
INSERT INTO `ums_member_level` VALUES (1, '黄金会员', 1000, 0, 199.00, 5, 1, 1, 1, 1, 1, 1, NULL);
INSERT INTO `ums_member_level` VALUES (2, '白金会员', 5000, 0, 99.00, 10, 1, 1, 1, 1, 1, 1, NULL);
INSERT INTO `ums_member_level` VALUES (3, '钻石会员', 15000, 0, 69.00, 15, 1, 1, 1, 1, 1, 1, NULL);
INSERT INTO `ums_member_level` VALUES (4, '普通会员', 1, 1, 199.00, 20, 1, 1, 1, 1, 0, 0, NULL);

SET FOREIGN_KEY_CHECKS = 1;
