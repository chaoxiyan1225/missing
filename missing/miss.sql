-- MySQL dump 10.13  Distrib 6.0.11-alpha, for Win64 (unknown)
--
-- Host: localhost    Database: happylife
-- ------------------------------------------------------
-- Server version	6.0.11-alpha-community

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tb_activity`
--

DROP TABLE IF EXISTS `tb_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_activity` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL COMMENT '活动状态：1：有效 0：已失效',
  `is_threshold_set` int(11) DEFAULT NULL COMMENT '是否可以设置 阈值： 0 ：否 1：是',
  `icon_picture` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '活动标识符',
  `create_time` timestamp NULL DEFAULT NULL,
  `ext_props` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `modify_time` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_activity`
--

LOCK TABLES `tb_activity` WRITE;
/*!40000 ALTER TABLE `tb_activity` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_admin`
--

DROP TABLE IF EXISTS `tb_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_admin` (
  `admin_id` int(32) NOT NULL AUTO_INCREMENT,
  `admin_name` varchar(50) NOT NULL,
  `admin_passwd` varchar(100) NOT NULL,
  `admin_level` int(11) NOT NULL DEFAULT '1' COMMENT '户用级别',
  `forget_passwd` varchar(155) DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_num` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `register_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `status` int(32) NOT NULL DEFAULT '0' COMMENT '用户状态： 0  正常  1  注销等，上层定义',
  `ext_props` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `modify_time` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_admin`
--

LOCK TABLES `tb_admin` WRITE;
/*!40000 ALTER TABLE `tb_admin` DISABLE KEYS */;
INSERT INTO `tb_admin` VALUES (1,'yanchaoxi','57601F7B56A3F898',1,NULL,NULL,NULL,'2020-10-26 14:27:08',0,NULL,'2017-05-25 15:12:09');
/*!40000 ALTER TABLE `tb_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_mch`
--

DROP TABLE IF EXISTS `tb_mch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_mch` (
  `mch_id` int(32) NOT NULL AUTO_INCREMENT,
  `mch_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT '商家用户名',
  `mch_passwd` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT '商家密码，需要加密存储',
  `shop_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT '商家名',
  `shop_detail` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_num` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `total_visitor` int(32) NOT NULL DEFAULT '0',
  `fk_open_id` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `total_sale_count` int(32) NOT NULL DEFAULT '0' COMMENT '总的销售次数',
  `total_fans` int(32) NOT NULL DEFAULT '0' COMMENT '总的销售次数',
  `total_money` int(32) NOT NULL DEFAULT '0',
  `shop_lnglnt` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '经纬度后续给定位用',
  `shop_address` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT '商家 地址',
  `content_picture` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mch_lelvel` int(11) NOT NULL DEFAULT '1' COMMENT '商家级别： 1 2 3 4 5 ',
  `service_type` int(11) NOT NULL DEFAULT '0' COMMENT '商家服务类型 0 : 直接到账方式 1 ：折扣码方式',
  `average_time` int(11) DEFAULT NULL,
  `points` int(11) NOT NULL DEFAULT '1' COMMENT '家商的积分',
  `register_time` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '商家注册时间',
  `service_status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mch_activity` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户参与的活动列表：_|_ 做分割符，支持多个',
  `mch_status` int(11) NOT NULL DEFAULT '1' COMMENT '家商状态 1 ： 正常',
  `ext_props` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `modify_time` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '�޸�ʱ��',
  PRIMARY KEY (`mch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_mch`
--

LOCK TABLES `tb_mch` WRITE;
/*!40000 ALTER TABLE `tb_mch` DISABLE KEYS */;
INSERT INTO `tb_mch` VALUES (1,'yanchaoxi','57601F7B56A3F898','宛然理发店','宛然理发店，定义理发新世界','13658062546','chaoxiyan2497@163.com',0,'ycx0628st',74,0,13350,NULL,'平昌县新平街东段50号','staticfile\\wechatimages\\mchusers\\shaxuan.jpg',1,0,30,5,'2021-01-02 13:04:12','正常营业中',NULL,1,'{\"start\":\"09:00\",\"end\":\"21:00\"}','2021-01-02 13:01:40'),(2,'sq','454E2D4F969F02D0','沙宣造型室内','成都市锦江区','15828565684','chaoxiyan1225@163.com',0,'st0628',26,0,1300,NULL,'平昌县新平街东段50号','staticfile\\wechatimages\\mchusers\\shenjian.jpg',1,0,30,5,'2021-01-02 13:04:13','正常营业中',NULL,1,NULL,'2020-10-29 21:33:09'),(8,'yanke','2E9CE64BDC1BB0B3','立昂造型','立昂','13658062546','594781478@qq.com',0,'yanke0628',0,0,0,NULL,'四川省成都市双流区华府大道1段','staticfile\\wechatimages\\mchusers\\89ae8ef3-ae13-4dcf-9491-f2a0d14aab66_0.jpg,staticfile\\wechatimages\\mchusers\\89ae8ef3-ae13-4dcf-9491-f2a0d14aab66_1.jpg,staticfile\\wechatimages\\mchusers\\89ae8ef3-ae13-4dcf-9491-f2a0d14aab66_2.jpg',1,0,30,5,'2021-01-02 13:04:16','正常营业中',NULL,1,'{\"mchUUid\":\"89ae8ef3-ae13-4dcf-9491-f2a0d14aab66\",\"fkAdminId\":1}','2020-11-29 09:31:27'),(9,'suntao','2E9CE64BDC1BB0B3','小清新理发店','起点 不一样的感受','15828565684','594781478@qq.com',0,'suntao06666',0,0,0,NULL,'四川省成都市成华区建设路','staticfile\\wechatimages\\mchusers\\cd83e257-90c2-4bc4-972f-967d480e4f43_0.jpg,staticfile\\wechatimages\\mchusers\\cd83e257-90c2-4bc4-972f-967d480e4f43_1.jpg,staticfile\\wechatimages\\mchusers\\cd83e257-90c2-4bc4-972f-967d480e4f43_2.jpg',1,0,30,5,'2021-01-02 13:04:18','正常营业中',NULL,1,'{\"mchUUid\":\"cd83e257-90c2-4bc4-972f-967d480e4f43\",\"fkAdminId\":1}','2020-11-29 09:38:49'),(10,'daqingshan','2E9CE64BDC1BB0B3','大青山XX','大青山dddd','13658062546','594781478@qq.com',0,'ycxdddd',0,0,0,NULL,'四川省简阳市','staticfile\\wechatimages\\mchusers\\fc9c8036-869e-42ec-8f18-6359ae5d25a6_0.jpg,staticfile\\wechatimages\\mchusers\\fc9c8036-869e-42ec-8f18-6359ae5d25a6_1.jpg,staticfile\\wechatimages\\mchusers\\fc9c8036-869e-42ec-8f18-6359ae5d25a6_2.jpg',1,0,30,5,'2021-01-02 13:04:22','正常营业中',NULL,1,'{\"mchUUid\":\"fc9c8036-869e-42ec-8f18-6359ae5d25a6\",\"fkAdminId\":1}','2020-12-11 05:34:11');
/*!40000 ALTER TABLE `tb_mch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_mch_staff`
--

DROP TABLE IF EXISTS `tb_mch_staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_mch_staff` (
  `id` int(32) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '真实用户名',
  `password` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nick_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '昵称',
  `phone_num` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `detail` varchar(1000) COLLATE utf8_unicode_ci NOT NULL COMMENT '发型师简介：特长，工龄等，json方式存储',
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '默认是正常上班',
  `is_delete` int(32) NOT NULL COMMENT '是否删除，比如离职等需要将其删除',
  `fk_mch_id` int(32) NOT NULL COMMENT '所属的商家ID',
  `fk_open_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '员工的微信openId',
  `ext_props` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `modify_time` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '�޸�ʱ��',
  `create_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_mch_staff`
--

LOCK TABLES `tb_mch_staff` WRITE;
/*!40000 ALTER TABLE `tb_mch_staff` DISABLE KEYS */;
INSERT INTO `tb_mch_staff` VALUES (1,'闫珂','25A8F5B1BC5E4433AF8AD0441E2F873D','橙子','15828565684','','正常上班',0,1,'666666',NULL,'2020-10-31 13:47:09','2020-10-31 13:47:09'),(2,'闫赫','9E252BBBB98A23FDE37A93B2CCCDF5FA','赫子','13658062546','我的侄子','正常上班',0,2,'888888',NULL,'2020-10-31 14:00:28','2020-10-31 14:00:28'),(3,'闫翔','25A8F5B1BC5E4433AF8AD0441E2F873D','翔子V2','15828565684','666666666','正常上班',0,2,'777777',NULL,'2020-12-19 12:31:48','2020-10-31 14:04:15'),(4,'小李','9E252BBBB98A23FDE37A93B2CCCDF5FA','小李子','13658062546','尽快尽快看就看','正常上班',1,1,'xiaoli99999999',NULL,'2020-12-19 12:32:40','2020-12-19 10:35:34');
/*!40000 ALTER TABLE `tb_mch_staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_product`
--

DROP TABLE IF EXISTS `tb_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_product` (
  `product_id` int(32) NOT NULL AUTO_INCREMENT COMMENT '商品ID 自动递增',
  `product_name` varchar(155) COLLATE utf8_unicode_ci NOT NULL COMMENT '商品名',
  `product_price` int(32) NOT NULL DEFAULT '0' COMMENT '商品价格',
  `fk_mch_id` int(32) NOT NULL COMMENT '外键关联的商家ID',
  `sale_total_times` int(32) NOT NULL DEFAULT '0' COMMENT '售销次数',
  `sale_total_money` int(32) NOT NULL DEFAULT '0' COMMENT '销售总金额',
  `like_counts` int(32) NOT NULL DEFAULT '0' COMMENT '赞点次数',
  `dislike_counts` int(32) NOT NULL DEFAULT '0' COMMENT '踩的次数',
  `product_status` int(32) NOT NULL DEFAULT '0' COMMENT '0: 下架  1：上架  2：置顶',
  `product_head_picture` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '商品的头像图标 地址',
  `product_type` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '商品的种类： 如 中餐  火锅    串串',
  `product_content_picture` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '商品内容图片： 用 "|" 做分割',
  `product_description` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '商品的内容描述',
  `discount_price` int(11) NOT NULL COMMENT '商品折后价格    discount_price=product_price *  discount_percent /100',
  `discount_percent` int(11) NOT NULL DEFAULT '100' COMMENT '扣折比例，默认值是100 没有折扣',
  `create_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '商品添加时间',
  `ext_props` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `modify_time` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '�޸�ʱ��',
  PRIMARY KEY (`product_id`),
  KEY `fk_mch_id` (`fk_mch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_product`
--

LOCK TABLES `tb_product` WRITE;
/*!40000 ALTER TABLE `tb_product` DISABLE KEYS */;
INSERT INTO `tb_product` VALUES (1,'河鲜单人自助晚餐',80,1,52,3660,18,0,1,'staticfile/wechatimages/food/0d4bb4c2b9cb54568279f2ca3bcc811954141.jpg','food',NULL,'鸳鸯锅底；自取油碟；肉类5*2；蔬菜5*2',72,90,'2020-10-30 02:10:31',NULL,'2016-09-11 09:37:21'),(2,'河鲜6-10人自助',600,1,22,9690,6,0,1,'staticfile/wechatimages/food/0d4bb4c2b9cb54568279f2ca3bcc811954141.jpg','food',NULL,'鸳鸯锅底；自取油碟；肉类5*2；蔬菜5*2',480,80,'2020-10-30 02:10:39',NULL,'2016-09-11 09:37:21'),(3,'2人浪漫锅',100,2,26,1300,10,0,1,'staticfile/wechatimages/food/0d4bb4c2b9cb54568279f2ca3bcc811954141.jpg','food',NULL,'鸳鸯锅底；自取油碟；肉类5*2；蔬菜5*2',50,50,'2020-10-30 02:10:49',NULL,'2016-09-11 09:37:21'),(4,'星巴克四人餐',350,1,0,0,0,0,1,'staticfile/wechatimages/food/0d4bb4c2b9cb54568279f2ca3bcc811954141.jpg','food','1_537268_1.jpg_|_1_537268_2.jpg_|_1_537268_3.jpg_|_1_537268_4.jpg_|_1_537268_5.jpg','四人套餐： 4杯咖啡，5个甜筒',250,0,'2020-11-06 13:33:56',NULL,'2016-09-11 09:37:21');
/*!40000 ALTER TABLE `tb_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_product_activity_record`
--

DROP TABLE IF EXISTS `tb_product_activity_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_product_activity_record` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `fk_activity_id` int(32) NOT NULL DEFAULT '0' COMMENT '外键 到活动的Id',
  `fk_product_id` int(32) NOT NULL DEFAULT '0' COMMENT '哪些商品参加到这个活动',
  `threshold_value` int(32) DEFAULT NULL COMMENT ' ',
  `start_time` timestamp NULL DEFAULT NULL COMMENT '开始日期',
  `end_time` timestamp NULL DEFAULT NULL COMMENT '结束时间',
  `ext_props` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_product_activity_record`
--

LOCK TABLES `tb_product_activity_record` WRITE;
/*!40000 ALTER TABLE `tb_product_activity_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_product_activity_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_queue_record`
--

DROP TABLE IF EXISTS `tb_queue_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_queue_record` (
  `record_id` int(32) NOT NULL AUTO_INCREMENT,
  `fk_mchstaff_id` int(32) DEFAULT NULL,
  `fk_open_id` varchar(100) DEFAULT NULL,
  `fk_mch_id` int(32) DEFAULT NULL,
  `fk_transaction_id` int(32) DEFAULT NULL,
  `order_id` varchar(100) DEFAULT '',
  `is_scan` int(32) DEFAULT NULL,
  `status` int(32) DEFAULT NULL,
  `ext_props` varchar(500) DEFAULT NULL,
  `end_time` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '�޸�ʱ��',
  `start_time` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '�޸�ʱ��',
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_queue_record`
--

LOCK TABLES `tb_queue_record` WRITE;
/*!40000 ALTER TABLE `tb_queue_record` DISABLE KEYS */;
INSERT INTO `tb_queue_record` VALUES (1,-1,'ycx0st',2,-1,'B-1',0,1,NULL,'2020-12-26 08:47:15','2020-11-25 10:06:25'),(2,-1,'ycx0st',2,-1,'A-2',0,0,NULL,'2020-11-28 12:30:03','2020-11-25 10:25:50'),(3,-1,'ycx0st',2,-1,'A-3',0,0,NULL,'2020-11-28 13:04:06','2020-11-27 13:46:57'),(4,-1,'ycx0st',2,-1,'D-4',0,0,NULL,'2020-11-28 13:04:34','2020-11-27 14:52:00'),(5,-1,'ycx0st',2,-1,'B-1',0,1,NULL,'2020-12-11 06:10:59','2020-12-09 01:26:09'),(6,-1,'ycx0st',2,-1,'C-1',0,1,NULL,'2020-12-11 06:11:06','2020-12-11 05:52:25'),(7,-1,'ycx0st',8,-1,'A-1',0,0,NULL,NULL,'2021-01-02 13:09:19'),(8,-1,'ycx0st',8,-1,'A-2',0,0,NULL,NULL,'2021-01-02 13:09:44');
/*!40000 ALTER TABLE `tb_queue_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_redeem_code`
--

DROP TABLE IF EXISTS `tb_redeem_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_redeem_code` (
  `code_id` int(32) unsigned zerofill NOT NULL AUTO_INCREMENT COMMENT '兑换码主键',
  `random_code` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '随机的字符串 30个字符内',
  `fk_product_id` int(32) DEFAULT NULL COMMENT '兑换码对应的商品ID',
  `is_used` bit(1) NOT NULL DEFAULT b'0' COMMENT '否是已经使用过',
  `used_time` timestamp NULL DEFAULT NULL,
  `create_type` int(32) NOT NULL DEFAULT '0' COMMENT '0:  1:  2:',
  `product_num` int(32) NOT NULL DEFAULT '1',
  `fk_open_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT '信微账户的用户 openId',
  `fk_mch_id` int(32) DEFAULT NULL COMMENT '商家号',
  `pay_money` int(32) DEFAULT NULL COMMENT '付费金额',
  `valid_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '有效期',
  `is_sendok` int(32) NOT NULL DEFAULT '0' COMMENT '是否发送成功',
  `code_info` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '描述信息',
  `code_create_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '兑换码生成时间',
  PRIMARY KEY (`code_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_redeem_code`
--

LOCK TABLES `tb_redeem_code` WRITE;
/*!40000 ALTER TABLE `tb_redeem_code` DISABLE KEYS */;
INSERT INTO `tb_redeem_code` VALUES (00000000000000000000000000000001,'deeeewewweweewew1',1,'\0','2016-06-15 14:25:55',0,1,'ycx0628st',1,55,'2020-11-05 13:40:35',0,'渔人鱼火锅三人餐','2016-06-14 15:04:12'),(00000000000000000000000000000002,'aaaaaaaaaaaaaaaaae2',2,'\0','2016-06-14 14:26:08',0,1,'ycx0628st',1,98,'2020-11-05 13:40:36',0,'单人串串','2016-06-14 15:05:07'),(00000000000000000000000000000003,'bbbbbbbbbbbbbbbbbb3',1,'\0','2016-06-14 14:26:13',0,1,'ycx0628st',1,999,'2020-11-05 13:40:39',0,'单人串串','2016-06-14 15:07:22'),(00000000000000000000000000000004,'jkjkjkjkjkjkjkkjjkjkjkkjjkj4',1,'','2016-06-15 14:26:18',0,1,'0',1,2322,'2016-06-15 14:26:22',0,'渔人鱼火锅','2016-06-14 15:07:19');
/*!40000 ALTER TABLE `tb_redeem_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_service_evaluate`
--

DROP TABLE IF EXISTS `tb_service_evaluate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_service_evaluate` (
  `id` int(32) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `nick_name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `fk_mch_id` int(32) DEFAULT NULL,
  `fk_user_id` int(32) DEFAULT NULL,
  `fk_mchstaff_id` int(32) DEFAULT NULL,
  `detail` varchar(1000) DEFAULT NULL,
  `score` int(32) DEFAULT NULL COMMENT '评分',
  `is_used` int(32) DEFAULT NULL,
  `ext_props` varchar(500) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '�޸�ʱ��',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_service_evaluate`
--

LOCK TABLES `tb_service_evaluate` WRITE;
/*!40000 ALTER TABLE `tb_service_evaluate` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_service_evaluate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_suggestion`
--

DROP TABLE IF EXISTS `tb_suggestion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_suggestion` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `nick_name` varchar(155) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(155) COLLATE utf8_unicode_ci NOT NULL,
  `fk_user_id` int(32) DEFAULT NULL,
  `fk_mch_id` int(32) DEFAULT NULL,
  `info` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ext_props` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_suggestion`
--

LOCK TABLES `tb_suggestion` WRITE;
/*!40000 ALTER TABLE `tb_suggestion` DISABLE KEYS */;
INSERT INTO `tb_suggestion` VALUES (1,'小甜甜','chaoxiyan125@huawei.com',1,2,'太贵了','2020-10-29 21:31:02',NULL),(2,'小甜甜','chaoxiyan125@huawei.com',1,1,'不错，希望量能多点，后续会再来','2020-10-29 21:31:03',NULL),(3,'小甜甜','chaoxiyan125@huawei.com',1,2,'服务员服务态度不好，建议改正','2020-10-29 21:31:04',NULL),(4,'小甜甜','chaoxiyan125@huawei.com',1,1,'服务员质量高。建议后续多来这样的','2020-10-29 21:31:08',NULL);
/*!40000 ALTER TABLE `tb_suggestion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_transaction_record`
--

DROP TABLE IF EXISTS `tb_transaction_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_transaction_record` (
  `record_id` int(32) unsigned NOT NULL AUTO_INCREMENT COMMENT '交易记录主键 自动递增',
  `fk_product_id` int(32) DEFAULT NULL COMMENT '交易记录所属的商品',
  `fk_staff_id` int(32) DEFAULT '0',
  `fk_mch_id` int(32) NOT NULL DEFAULT '0' COMMENT '交易记录所属的商家',
  `fk_open_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '交易关联的微信用户的 openid',
  `record_type` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '交易类型',
  `record_money` int(32) NOT NULL DEFAULT '0' COMMENT '易交涉及的金额',
  `record_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '交易产生的时间',
  `out_trade_no` varchar(155) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '信微订单号',
  `record_status` int(11) NOT NULL DEFAULT '0' COMMENT '是否已经支付 ： 0 未 成功支付  1 ，已经成功',
  `product_num` int(11) DEFAULT '1',
  `is_scaned` int(11) NOT NULL DEFAULT '0',
  `ext_props` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`record_id`),
  KEY `fk_product_id` (`fk_product_id`),
  KEY `fk_mch_id` (`fk_mch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_transaction_record`
--

LOCK TABLES `tb_transaction_record` WRITE;
/*!40000 ALTER TABLE `tb_transaction_record` DISABLE KEYS */;
INSERT INTO `tb_transaction_record` VALUES (1,3,0,2,'2','',5000,'2020-11-01 03:01:23','2016-06-23-28-10-269418287465',0,1,0,NULL),(2,1,1,1,'1','',30,'2020-11-03 14:37:41','12123456656556',3,1,1,'{\"detail\":\"已经处理了\",\"contentPicture\":\"staticfile\\\\wechatimages\\\\mchusers\\\\2_fd872caa-ac43-41d2-8fdf-bf5f39e2748d_0.jpg,staticfile\\\\wechatimages\\\\mchusers\\\\2_fd872caa-ac43-41d2-8fdf-bf5f39e2748d_1.png,staticfile\\\\wechatimages\\\\mchusers\\\\2_fd872caa-ac43-41d2-8fdf-bf5f39e2748d_2.jpg,staticfile\\\\wechatimages\\\\mchusers\\\\2_fd872caa-ac43-41d2-8fdf-bf5f39e2748d_3.jpg\",\"recordUUid\":\"2_fd872caa-ac43-41d2-8fdf-bf5f39e2748d\",\"modifyTime\":\"2021-1-3 18:28:35\"}'),(3,2,0,1,'1','',55,'2020-11-01 03:01:26','kjijkljkljkljkljkjkjkjkjkljkl',0,1,0,NULL),(4,1,0,1,'1','',16,'2020-11-01 03:02:04','22222222222',0,1,0,NULL),(5,1,0,2,'1','',36,'2020-11-01 03:02:04',';lkkljkjlkjljkljkljkljkl',0,1,0,NULL),(6,2,0,2,'2','',45,'2020-11-01 03:02:04','jkhhjkhjkhjkj',1,1,1,NULL),(7,1,0,1,'1','',58,'2020-11-01 03:02:04','2016-06-23-30-10-127646943613',0,1,0,NULL),(8,1,0,1,'1','',50,'2020-11-01 03:02:04','2016-06-23-30-10-252943043192',0,1,0,NULL),(9,1,0,1,'1','',356,'2020-11-01 03:02:04','2016-06-24-19-10-336199833102',0,1,0,NULL),(11,1,0,1,'1','',500,'2020-11-01 03:02:04','2016-06-24-23-11-521543014577',0,1,0,NULL),(12,1,0,1,'1','',450,'2020-11-01 03:02:04','2016-06-24-27-11-279289033388',0,1,0,NULL),(13,1,0,1,'0','',5000,'2020-11-01 03:02:04','2016-06-24-27-11-595021686977',0,1,0,NULL),(14,3,0,2,'0','',5000,'2020-11-01 03:02:04','2016-07-20-55-09-083722917042',0,1,0,NULL),(15,3,0,2,'0','',5000,'2020-11-01 03:02:04','2016-07-24-15-08-404615800458',0,1,0,NULL);
/*!40000 ALTER TABLE `tb_transaction_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_wechat_msg`
--

DROP TABLE IF EXISTS `tb_wechat_msg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_wechat_msg` (
  `id` varchar(155) NOT NULL DEFAULT '',
  `content` text,
  `sign_type` varchar(155) DEFAULT NULL,
  `input_charset` varchar(155) DEFAULT NULL,
  `sign` varchar(155) DEFAULT NULL,
  `trade_mode` varchar(155) DEFAULT NULL,
  `trade_state` varchar(155) DEFAULT NULL,
  `partner` varchar(155) DEFAULT NULL,
  `bank_type` varchar(155) DEFAULT NULL,
  `bank_billno` varchar(155) DEFAULT NULL,
  `total_fee` varchar(155) DEFAULT NULL,
  `fee_type` varchar(155) DEFAULT NULL,
  `notify_id` varchar(155) DEFAULT NULL,
  `transaction_id` varchar(155) DEFAULT NULL,
  `out_trade_no` varchar(155) DEFAULT NULL,
  `attach` varchar(155) DEFAULT NULL,
  `time_end` varchar(155) DEFAULT NULL,
  `transport_fee` varchar(155) DEFAULT NULL,
  `product_fee` varchar(155) DEFAULT NULL,
  `discount` varchar(155) DEFAULT NULL,
  `time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_wechat_msg`
--

LOCK TABLES `tb_wechat_msg` WRITE;
/*!40000 ALTER TABLE `tb_wechat_msg` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_wechat_msg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_wechat_user`
--

DROP TABLE IF EXISTS `tb_wechat_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_wechat_user` (
  `user_id` int(155) NOT NULL AUTO_INCREMENT,
  `user_nick_name` varchar(155) DEFAULT NULL,
  `user_head_path` varchar(255) DEFAULT NULL COMMENT '微信头像路径',
  `user_tel_num` varchar(20) DEFAULT NULL,
  `user_openid` varchar(155) DEFAULT NULL,
  `user_sex` bit(1) DEFAULT b'0' COMMENT '0: 女  1: 男',
  `user_reward_point` int(32) NOT NULL DEFAULT '0' COMMENT '户用积分',
  `user_level` int(32) NOT NULL DEFAULT '1' COMMENT '户用的级别',
  `user_register_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_status` int(32) DEFAULT NULL,
  `ext_props` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_wechat_user`
--

LOCK TABLES `tb_wechat_user` WRITE;
/*!40000 ALTER TABLE `tb_wechat_user` DISABLE KEYS */;
INSERT INTO `tb_wechat_user` VALUES (1,'111','111','111','st0628','',0,1,'2020-11-27 14:40:12',NULL,NULL);
/*!40000 ALTER TABLE `tb_wechat_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-18 13:34:53
