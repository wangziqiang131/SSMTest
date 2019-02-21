/*
SQLyog Ultimate v8.32 
MySQL - 5.5.27 : Database - interestingssm
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`interestingssm` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `interestingssm`;

/*Table structure for table `base_dict` */

DROP TABLE IF EXISTS `base_dict`;

CREATE TABLE `base_dict` (
  `dict_id` varchar(32) NOT NULL COMMENT '数据字典id(主键)',
  `dict_type_code` varchar(10) NOT NULL COMMENT '数据字典类别代码',
  `dict_type_name` varchar(64) NOT NULL COMMENT '数据字典类别名称',
  `dict_item_name` varchar(64) NOT NULL COMMENT '数据字典项目名称',
  `dict_item_code` varchar(10) DEFAULT NULL COMMENT '数据字典项目代码(可为空)',
  `dict_sort` int(10) DEFAULT NULL COMMENT '排序字段',
  `dict_enable` char(1) NOT NULL COMMENT '1:使用 0:停用',
  `dict_memo` varchar(64) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `base_dict` */

insert  into `base_dict`(`dict_id`,`dict_type_code`,`dict_type_name`,`dict_item_name`,`dict_item_code`,`dict_sort`,`dict_enable`,`dict_memo`) values ('1','001','客户行业','教育培训 ',NULL,1,'1',NULL),('10','003','公司性质','民企',NULL,3,'1',NULL),('12','004','年营业额','1-10万',NULL,1,'1',NULL),('13','004','年营业额','10-20万',NULL,2,'1',NULL),('14','004','年营业额','20-50万',NULL,3,'1',NULL),('15','004','年营业额','50-100万',NULL,4,'1',NULL),('16','004','年营业额','100-500万',NULL,5,'1',NULL),('17','004','年营业额','500-1000万',NULL,6,'1',NULL),('18','005','客户状态','基础客户',NULL,1,'1',NULL),('19','005','客户状态','潜在客户',NULL,2,'1',NULL),('2','001','客户行业','电子商务',NULL,2,'1',NULL),('20','005','客户状态','成功客户',NULL,3,'1',NULL),('21','005','客户状态','无效客户',NULL,4,'1',NULL),('22','006','客户级别','普通客户',NULL,1,'1',NULL),('23','006','客户级别','VIP客户',NULL,2,'1',NULL),('24','007','商机状态','意向客户',NULL,1,'1',NULL),('25','007','商机状态','初步沟通',NULL,2,'1',NULL),('26','007','商机状态','深度沟通',NULL,3,'1',NULL),('27','007','商机状态','签订合同',NULL,4,'1',NULL),('3','001','客户行业','对外贸易',NULL,3,'1',NULL),('30','008','商机类型','新业务',NULL,1,'1',NULL),('31','008','商机类型','现有业务',NULL,2,'1',NULL),('32','009','商机来源','电话营销',NULL,1,'1',NULL),('33','009','商机来源','网络营销',NULL,2,'1',NULL),('34','009','商机来源','推广活动',NULL,3,'1',NULL),('4','001','客户行业','酒店旅游',NULL,4,'1',NULL),('5','001','客户行业','房地产',NULL,5,'1',NULL),('6','002','客户信息来源','电话营销',NULL,1,'1',NULL),('7','002','客户信息来源','网络营销',NULL,2,'1',NULL),('8','003','公司性质','合资',NULL,1,'1',NULL),('9','003','公司性质','国企',NULL,2,'1',NULL);

/*Table structure for table `customer` */

DROP TABLE IF EXISTS `customer`;

CREATE TABLE `customer` (
  `cust_id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT '客户编号(主键)',
  `cust_name` varchar(32) NOT NULL COMMENT '客户名称(公司名称)',
  `cust_user_id` bigint(32) DEFAULT NULL COMMENT '负责人id',
  `cust_create_id` bigint(32) DEFAULT NULL COMMENT '创建人id',
  `cust_source` varchar(32) DEFAULT NULL COMMENT '客户信息来源',
  `cust_industry` varchar(32) DEFAULT NULL COMMENT '客户所属行业',
  `cust_level` varchar(32) DEFAULT NULL COMMENT '客户级别',
  `cust_linkman` varchar(64) DEFAULT NULL COMMENT '联系人',
  `cust_phone` varchar(64) DEFAULT NULL COMMENT '固定电话',
  `cust_mobile` varchar(16) DEFAULT NULL COMMENT '移动电话',
  `cust_zipcode` varchar(10) DEFAULT NULL,
  `cust_address` varchar(100) DEFAULT NULL,
  `cust_createtime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`cust_id`),
  KEY `FK_cst_customer_source` (`cust_source`),
  KEY `FK_cst_customer_industry` (`cust_industry`),
  KEY `FK_cst_customer_level` (`cust_level`),
  KEY `FK_cst_customer_user_id` (`cust_user_id`),
  KEY `FK_cst_customer_create_id` (`cust_create_id`)
) ENGINE=InnoDB AUTO_INCREMENT=162 DEFAULT CHARSET=utf8;

/*Data for the table `customer` */

insert  into `customer`(`cust_id`,`cust_name`,`cust_user_id`,`cust_create_id`,`cust_source`,`cust_industry`,`cust_level`,`cust_linkman`,`cust_phone`,`cust_mobile`,`cust_zipcode`,`cust_address`,`cust_createtime`) values (17,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:02'),(22,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:03'),(24,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:03'),(25,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:03'),(26,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:03'),(28,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:04'),(29,'令狐冲',NULL,NULL,'7','1','23','任盈盈','0108888886','13888888886','6123456','北京三里桥6','2016-04-08 16:32:04'),(30,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:04'),(31,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:04'),(33,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:04'),(34,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:05'),(35,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:05'),(36,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:05'),(37,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:05'),(38,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:05'),(39,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:06'),(40,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:06'),(41,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:06'),(42,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:06'),(43,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:06'),(44,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:07'),(45,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:07'),(46,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:07'),(47,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:07'),(48,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:07'),(49,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:07'),(50,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:08'),(51,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:08'),(52,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:08'),(53,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:08'),(54,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:08'),(55,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:08'),(56,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:09'),(57,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:09'),(58,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:09'),(59,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:29'),(60,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:29'),(61,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:29'),(62,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:29'),(63,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:30'),(64,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:30'),(65,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:30'),(66,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:30'),(67,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:30'),(68,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:30'),(69,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:31'),(70,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:31'),(71,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:31'),(72,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:31'),(73,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:31'),(74,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:32'),(75,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:32'),(76,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:32'),(77,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:32'),(78,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:32'),(79,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:32'),(80,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:33'),(81,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:33'),(82,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:33'),(83,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:33'),(84,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:33'),(85,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:33'),(86,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:34'),(87,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:34'),(88,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:34'),(89,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:34'),(90,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:34'),(91,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:34'),(92,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:35'),(93,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:35'),(94,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:35'),(95,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:35'),(96,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:35'),(97,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:36'),(98,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:36'),(99,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:36'),(100,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:36'),(101,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:36'),(102,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:36'),(103,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:37'),(104,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:37'),(105,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:37'),(106,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:37'),(107,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:37'),(108,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:38'),(109,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:38'),(110,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:38'),(111,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:38'),(112,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:38'),(113,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:38'),(114,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:39'),(115,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:39'),(116,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:39'),(117,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:39'),(118,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:39'),(119,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:40'),(120,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:40'),(121,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:40'),(122,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:40'),(123,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:40'),(124,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:40'),(125,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:41'),(126,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:41'),(127,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:41'),(128,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:41'),(129,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:41'),(130,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:42'),(131,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:42'),(132,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:42'),(133,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:42'),(134,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:42'),(135,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:42'),(136,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:43'),(137,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:43'),(138,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:43'),(139,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:43'),(140,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:43'),(141,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:44'),(142,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:44'),(143,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:44'),(144,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:44'),(145,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:44'),(146,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:44'),(147,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:45'),(148,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:45'),(149,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:45'),(150,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:45'),(151,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:45'),(152,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:46'),(153,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:46'),(154,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:46'),(155,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:46'),(156,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:46'),(157,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:46'),(158,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:47'),(159,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:47'),(160,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:47'),(161,'马云',NULL,NULL,'6','2','22','马化腾','0108888887','13888888888','123456','北京三里桥','2016-04-08 16:32:47');

/*Table structure for table `items` */

DROP TABLE IF EXISTS `items`;

CREATE TABLE `items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL COMMENT '商品名称',
  `price` float(10,1) NOT NULL COMMENT '商品定价',
  `detail` text COMMENT '商品描述',
  `pic` varchar(64) DEFAULT NULL COMMENT '商品图片',
  `createtime` datetime NOT NULL COMMENT '生产日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `items` */

insert  into `items`(`id`,`name`,`price`,`detail`,`pic`,`createtime`) values (1,'台式机',3000.0,'该电脑质量非常好！！！！666',NULL,'2017-12-25 13:22:53'),(2,'笔记本',6000.0,'笔记本性能好，质量好！！！！！','178dcebe-409c-449d-b339-2df759f8d33a.png','2015-02-09 13:22:57'),(3,'背包',200.0,'名牌背包，容量大质量好！！！！',NULL,'2015-02-06 13:23:02');

/*Table structure for table `orders` */

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '下单用户id',
  `number` varchar(32) NOT NULL COMMENT '订单号',
  `createtime` datetime NOT NULL COMMENT '创建订单时间',
  `note` varchar(100) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `FK_orders_1` (`user_id`),
  CONSTRAINT `FK_orders_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `orders` */

insert  into `orders`(`id`,`user_id`,`number`,`createtime`,`note`) values (3,1,'1000010','2015-02-04 13:22:35',NULL),(4,1,'1000011','2015-02-03 13:22:41',NULL),(5,10,'1000012','2015-02-12 16:13:23',NULL);

/*Table structure for table `sys_user` */

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `id` char(32) NOT NULL DEFAULT '',
  `account` varchar(32) NOT NULL,
  `name` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_user` */

insert  into `sys_user`(`id`,`account`,`name`,`password`) values ('1','0001','系统管理员','7d8334f115758f93b3cb5e976e07b185'),('2','0002','测试账号','202cb962ac59075b964b07152d234b70');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL COMMENT '用户名称',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `sex` char(1) DEFAULT NULL COMMENT '性别',
  `address` varchar(256) DEFAULT NULL COMMENT '地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`id`,`username`,`birthday`,`sex`,`address`) values (1,'王五',NULL,'2',NULL),(10,'张三','2014-07-10','1','北京市'),(16,'张小明',NULL,'1','河南郑州'),(22,'陈小明',NULL,'1','河南郑州'),(24,'张三丰',NULL,'1','河南郑州'),(25,'陈小明',NULL,'1','河南郑州'),(26,'王五',NULL,NULL,NULL),(27,'张角','2017-12-11','1','蜀国'),(32,'赵云','2017-12-11','1','正定'),(34,'庞统','2017-12-11','1','布吉岛'),(35,'庞统2','2017-12-18','1','布吉岛2'),(36,'武大郎','2017-12-18','1','河北清河县'),(37,'张飞','2017-12-11','1','蜀国');

/*Table structure for table `vip_consume` */

DROP TABLE IF EXISTS `vip_consume`;

CREATE TABLE `vip_consume` (
  `id` char(32) NOT NULL DEFAULT '' COMMENT '编号',
  `vip_id` char(32) DEFAULT NULL COMMENT 'vip编号',
  `whens` datetime DEFAULT NULL COMMENT '录入时间',
  `orderno` varchar(32) DEFAULT NULL COMMENT '哪个订单',
  `amount` int(11) DEFAULT NULL COMMENT '消费金额，单元分',
  `operator_id` char(32) DEFAULT NULL COMMENT '录入人编号',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `flag` tinyint(1) DEFAULT NULL COMMENT '生效否标志',
  PRIMARY KEY (`id`),
  KEY `vip_id` (`vip_id`),
  KEY `operator_id` (`operator_id`),
  CONSTRAINT `vip_consume_ibfk_1` FOREIGN KEY (`vip_id`) REFERENCES `vip_detail` (`id`),
  CONSTRAINT `vip_consume_ibfk_2` FOREIGN KEY (`operator_id`) REFERENCES `sys_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `vip_consume` */

insert  into `vip_consume`(`id`,`vip_id`,`whens`,`orderno`,`amount`,`operator_id`,`remark`,`flag`) values ('1','1','2016-02-10 20:42:36','2016021000002',5000,'1','客人很友好',0);

/*Table structure for table `vip_detail` */

DROP TABLE IF EXISTS `vip_detail`;

CREATE TABLE `vip_detail` (
  `id` char(32) NOT NULL DEFAULT '',
  `code` varchar(32) DEFAULT NULL COMMENT '客户编号（手机号）',
  `name` varchar(32) NOT NULL COMMENT '客户姓名',
  `sex` tinyint(1) NOT NULL COMMENT '性别',
  `age` tinyint(4) NOT NULL COMMENT '年龄',
  `qq` varchar(32) DEFAULT NULL,
  `email` varchar(32) DEFAULT NULL,
  `address` varchar(128) DEFAULT NULL COMMENT '地址',
  `zip` varchar(16) NOT NULL COMMENT '邮编',
  `remark` varchar(256) NOT NULL COMMENT '客户备注',
  `rank` tinyint(1) DEFAULT NULL COMMENT 'vip等级',
  `amount` int(11) DEFAULT NULL COMMENT '消费金额，单位"分"',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `vip_detail` */

insert  into `vip_detail`(`id`,`code`,`name`,`sex`,`age`,`qq`,`email`,`address`,`zip`,`remark`,`rank`,`amount`) values ('1','13888888888','王老五',1,40,'10000','10000@qq.com','北京中关村xxx路xx号','2000000','测试',1,12000),('64b0cfaa4f9c9a08f3e41caeb223eef8','12345678900','邹涛',0,22,'123456','123456@qq.com','美国纽约市','563211','这个是vip录入的测试。',0,0),('76ada7de690b4188b9b4ceb622b226e4','13888888887','张飞飞',0,18,'321','2','354','43','543',2,100000),('b843ed8439a171594aa4425db9f23856','18288888888','李四',1,25,'7876516516','dada@qq.com','贵州贵阳','46556','这个vip客户录入的测试。',4,1500000);

/*Table structure for table `vip_rank` */

DROP TABLE IF EXISTS `vip_rank`;

CREATE TABLE `vip_rank` (
  `code` tinyint(1) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `needAmount` int(11) DEFAULT NULL,
  `discount` tinyint(4) DEFAULT NULL,
  `remark` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `vip_rank` */

insert  into `vip_rank`(`code`,`name`,`needAmount`,`discount`,`remark`) values (1,'普通VIP',100,98,'消费满100即可成为普通会员'),(2,'黄金VIP',1000,95,'消费满1000即可成为黄金会员'),(3,'白金VIP',5000,90,'消费满5000即可成为白金会员'),(4,'钻石VIP',10000,85,'消费满10000即可成为钻石会员'),(5,'终身VIP',20000,80,'消费满20000即可成为终身会员');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
