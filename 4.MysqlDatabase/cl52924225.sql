-- MySQL dump 10.13  Distrib 5.7.31, for Linux (x86_64)
--
-- Host: localhost    Database: cl52924225
-- ------------------------------------------------------
-- Server version	5.7.31

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
-- Current Database: `cl52924225`
--

/*!40000 DROP DATABASE IF EXISTS `cl52924225`*/;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `cl52924225` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `cl52924225`;

--
-- Table structure for table `anlileixing`
--

DROP TABLE IF EXISTS `anlileixing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `anlileixing` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `anlileixing` varchar(200) NOT NULL COMMENT '案例类型',
  PRIMARY KEY (`id`),
  UNIQUE KEY `anlileixing` (`anlileixing`)
) ENGINE=InnoDB AUTO_INCREMENT=1712649958660 DEFAULT CHARSET=utf8 COMMENT='案例类型';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `anlileixing`
--

LOCK TABLES `anlileixing` WRITE;
/*!40000 ALTER TABLE `anlileixing` DISABLE KEYS */;
INSERT INTO `anlileixing` VALUES (161,'2024-04-09 07:54:59','案例类型1'),(162,'2024-04-09 07:54:59','案例类型2'),(163,'2024-04-09 07:54:59','案例类型3'),(164,'2024-04-09 07:54:59','案例类型4'),(165,'2024-04-09 07:54:59','案例类型5'),(166,'2024-04-09 07:54:59','案例类型6'),(1712649958659,'2024-04-09 08:05:57','抑郁');
/*!40000 ALTER TABLE `anlileixing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `anlixinxi`
--

DROP TABLE IF EXISTS `anlixinxi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `anlixinxi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `anlimingcheng` varchar(200) NOT NULL COMMENT '案例名称',
  `tupian` longtext COMMENT '图片',
  `anlileixing` varchar(200) NOT NULL COMMENT '案例类型',
  `anlishipin` longtext COMMENT '案例视频',
  `anlixiangqing` longtext COMMENT '案例详情',
  `fabushijian` datetime DEFAULT NULL COMMENT '发布时间',
  `storeupnum` int(11) DEFAULT NULL COMMENT '收藏数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1712649998132 DEFAULT CHARSET=utf8 COMMENT='案例信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `anlixinxi`
--

LOCK TABLES `anlixinxi` WRITE;
/*!40000 ALTER TABLE `anlixinxi` DISABLE KEYS */;
INSERT INTO `anlixinxi` VALUES (151,'2024-04-09 07:54:59','案例名称1','file/anlixinxiTupian1.jpg,file/anlixinxiTupian2.jpg,file/anlixinxiTupian3.jpg','案例类型1','','案例详情1','2024-04-09 15:54:59',1),(152,'2024-04-09 07:54:59','案例名称2','file/anlixinxiTupian2.jpg,file/anlixinxiTupian3.jpg,file/anlixinxiTupian4.jpg','案例类型2','','案例详情2','2024-04-09 15:54:59',2),(153,'2024-04-09 07:54:59','案例名称3','file/anlixinxiTupian3.jpg,file/anlixinxiTupian4.jpg,file/anlixinxiTupian5.jpg','案例类型3','','案例详情3','2024-04-09 15:54:59',3),(154,'2024-04-09 07:54:59','案例名称4','file/anlixinxiTupian4.jpg,file/anlixinxiTupian5.jpg,file/anlixinxiTupian6.jpg','案例类型4','','案例详情4','2024-04-09 15:54:59',4),(155,'2024-04-09 07:54:59','案例名称5','file/anlixinxiTupian5.jpg,file/anlixinxiTupian6.jpg,file/anlixinxiTupian7.jpg','案例类型5','','案例详情5','2024-04-09 15:54:59',5),(156,'2024-04-09 07:54:59','案例名称6','file/anlixinxiTupian6.jpg,file/anlixinxiTupian7.jpg,file/anlixinxiTupian8.jpg','案例类型6','','案例详情6','2024-04-09 15:54:59',6),(1712649998131,'2024-04-09 08:06:38','青少年抑郁','file/1712649983419.jpeg','抑郁','file/1712649991747.mp4','<p>案例详情</p>','2024-04-09 16:06:11',0);
/*!40000 ALTER TABLE `anlixinxi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `binglixinxi`
--

DROP TABLE IF EXISTS `binglixinxi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `binglixinxi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `binglibianhao` varchar(200) DEFAULT NULL COMMENT '病历编号',
  `yonghuzhanghao` varchar(200) DEFAULT NULL COMMENT '用户账号',
  `yonghuxingming` varchar(200) DEFAULT NULL COMMENT '用户姓名',
  `nianling` varchar(200) DEFAULT NULL COMMENT '年龄',
  `xingbie` varchar(200) DEFAULT NULL COMMENT '性别',
  `shoujihaoma` varchar(200) DEFAULT NULL COMMENT '手机号码',
  `bingqingxiangqing` longtext NOT NULL COMMENT '病情详情',
  `jiuzhenshijian` datetime DEFAULT NULL COMMENT '就诊时间',
  `zhenduanjieguo` longtext NOT NULL COMMENT '诊断结果',
  `yishengzhanghao` varchar(200) DEFAULT NULL COMMENT '医生账号',
  `yishengxingming` varchar(200) DEFAULT NULL COMMENT '医生姓名',
  PRIMARY KEY (`id`),
  UNIQUE KEY `binglibianhao` (`binglibianhao`)
) ENGINE=InnoDB AUTO_INCREMENT=1712650283691 DEFAULT CHARSET=utf8 COMMENT='病历信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `binglixinxi`
--

LOCK TABLES `binglixinxi` WRITE;
/*!40000 ALTER TABLE `binglixinxi` DISABLE KEYS */;
INSERT INTO `binglixinxi` VALUES (141,'2024-04-09 07:54:59','1111111111','用户账号1','用户姓名1','年龄1','性别1','19819881111','病情详情1','2024-04-09 15:54:59','诊断结果1','医生账号1','医生姓名1'),(142,'2024-04-09 07:54:59','2222222222','用户账号2','用户姓名2','年龄2','性别2','19819881112','病情详情2','2024-04-09 15:54:59','诊断结果2','医生账号2','医生姓名2'),(143,'2024-04-09 07:54:59','3333333333','用户账号3','用户姓名3','年龄3','性别3','19819881113','病情详情3','2024-04-09 15:54:59','诊断结果3','医生账号3','医生姓名3'),(144,'2024-04-09 07:54:59','4444444444','用户账号4','用户姓名4','年龄4','性别4','19819881114','病情详情4','2024-04-09 15:54:59','诊断结果4','医生账号4','医生姓名4'),(145,'2024-04-09 07:54:59','5555555555','用户账号5','用户姓名5','年龄5','性别5','19819881115','病情详情5','2024-04-09 15:54:59','诊断结果5','医生账号5','医生姓名5'),(146,'2024-04-09 07:54:59','6666666666','用户账号6','用户姓名6','年龄6','性别6','19819881116','病情详情6','2024-04-09 15:54:59','诊断结果6','医生账号6','医生姓名6'),(1712650283690,'2024-04-09 08:11:23','1712650285116','11','小张','25','女','13512312312','病情','2024-04-09 16:11:25','结果','22','王医生');
/*!40000 ALTER TABLE `binglixinxi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config`
--

DROP TABLE IF EXISTS `config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) DEFAULT NULL COMMENT '配置参数值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='配置文件';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config`
--

LOCK TABLES `config` WRITE;
/*!40000 ALTER TABLE `config` DISABLE KEYS */;
INSERT INTO `config` VALUES (1,'swiper1','file/swiperPicture1.jpg'),(2,'swiper2','file/1712650145373.png'),(3,'swiper3','file/swiperPicture3.jpg');
/*!40000 ALTER TABLE `config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exampaper`
--

DROP TABLE IF EXISTS `exampaper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exampaper` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `name` varchar(200) NOT NULL COMMENT '试卷名称',
  `time` int(11) NOT NULL COMMENT '考试时长(分钟)',
  `status` varchar(200) DEFAULT NULL COMMENT '试卷状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1712650024578 DEFAULT CHARSET=utf8 COMMENT='试卷管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exampaper`
--

LOCK TABLES `exampaper` WRITE;
/*!40000 ALTER TABLE `exampaper` DISABLE KEYS */;
INSERT INTO `exampaper` VALUES (1,'2024-04-09 07:54:58','试卷1',120,'1'),(1712650024577,'2024-04-09 08:07:03','心理测试',60,'1');
/*!40000 ALTER TABLE `exampaper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `examquestion`
--

DROP TABLE IF EXISTS `examquestion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `examquestion` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `paperid` bigint(20) NOT NULL COMMENT '试卷id（外键）',
  `papername` varchar(200) NOT NULL COMMENT '试卷名称',
  `questionname` varchar(200) NOT NULL COMMENT '试题名称',
  `options` longtext COMMENT '选项，json字符串',
  `score` bigint(20) DEFAULT NULL COMMENT '分值',
  `answer` varchar(200) DEFAULT NULL COMMENT '正确答案',
  `analysis` longtext COMMENT '答案解析',
  `type` bigint(20) DEFAULT NULL COMMENT '试题类型',
  `sequence` bigint(20) DEFAULT NULL COMMENT '试题排序，值越大排越前面',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1712650118521 DEFAULT CHARSET=utf8 COMMENT='试题管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `examquestion`
--

LOCK TABLES `examquestion` WRITE;
/*!40000 ALTER TABLE `examquestion` DISABLE KEYS */;
INSERT INTO `examquestion` VALUES (1,'2024-04-09 07:54:58',1,'试卷1','1+1等于多少?','[{\"text\":\"2\",\"code\":\"A\"},{\"text\":\"11\",\"code\":\"B\"},{\"text\":\"十\",\"code\":\"C\"},{\"text\":\"王\",\"code\":\"D\"}]',20,'A','2',0,1),(2,'2024-04-09 07:54:58',1,'试卷1','2-1等于1，对吗?','[{\"text\":\"对\",\"code\":\"A\"},{\"text\":\"错\",\"code\":\"B\"}]',20,'A','2-1等于1',2,2),(3,'2024-04-09 07:54:58',1,'试卷1','下面哪些数是质数？。','[{\"text\":\"2\",\"code\":\"A\"},{\"text\":\"3\",\"code\":\"B\"},{\"text\":\"4\",\"code\":\"C\"},{\"text\":\"5\",\"code\":\"D\"}]',30,'A,B,D','2,3,5属于质数',1,3),(4,'2024-04-09 07:54:58',1,'试卷1','最小的自然是( )。','[]',30,'0','最小的自然数是0',3,4),(1712650071535,'2024-04-09 08:07:51',1712650024577,'心理测试','你是不 是经常感觉到脸红','[{\"text\":\"没有\",\"score\":\"5\",\"code\":\"A\"},{\"text\":\"有时候\",\"score\":\"10\",\"code\":\"B\"},{\"text\":\"经常\",\"score\":\"15\",\"code\":\"C\"},{\"text\":\"总是如此\",\"score\":\"20\",\"code\":\"D\"}]',NULL,'','可以解析每个选项是什么心理',0,1),(1712650118520,'2024-04-09 08:08:37',1712650024577,'心理测试','你是不是经常睡不着','[{\"text\":\"没有\",\"score\":\"5\",\"code\":\"A\"},{\"text\":\"有时候\",\"score\":\"10\",\"code\":\"B\"},{\"text\":\"经常\",\"score\":\"15\",\"code\":\"C\"},{\"text\":\"总是如此\",\"score\":\"20\",\"code\":\"D\"}]',NULL,'','继续这样增加你自己需要的题目',0,2);
/*!40000 ALTER TABLE `examquestion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `examrecord`
--

DROP TABLE IF EXISTS `examrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `examrecord` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `username` varchar(200) NOT NULL COMMENT '用户名',
  `paperid` bigint(20) NOT NULL COMMENT '试卷id（外键）',
  `papername` varchar(200) NOT NULL COMMENT '试卷名称',
  `questionid` bigint(20) NOT NULL COMMENT '试题id（外键）',
  `questionname` varchar(200) NOT NULL COMMENT '试题名称',
  `options` longtext COMMENT '选项，json字符串',
  `score` bigint(20) DEFAULT NULL COMMENT '分值',
  `answer` varchar(200) DEFAULT NULL COMMENT '正确答案',
  `analysis` longtext COMMENT '答案解析',
  `myscore` bigint(20) DEFAULT NULL COMMENT '试题得分',
  `myanswer` varchar(200) DEFAULT NULL COMMENT '考生答案',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1712650194780 DEFAULT CHARSET=utf8 COMMENT='心理测试';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `examrecord`
--

LOCK TABLES `examrecord` WRITE;
/*!40000 ALTER TABLE `examrecord` DISABLE KEYS */;
INSERT INTO `examrecord` VALUES (1712650194265,'2024-04-09 08:09:53','11',1712650024577,'心理测试',1712650118520,'你是不是经常睡不着','[{\"text\":\"没有\",\"score\":\"5\",\"code\":\"A\"},{\"text\":\"有时候\",\"score\":\"10\",\"code\":\"B\"},{\"text\":\"经常\",\"score\":\"15\",\"code\":\"C\"},{\"text\":\"总是如此\",\"score\":\"20\",\"code\":\"D\"}]',NULL,'','继续这样增加你自己需要的题目',15,'C',1712649792431),(1712650194779,'2024-04-09 08:09:53','11',1712650024577,'心理测试',1712650071535,'你是不 是经常感觉到脸红','[{\"text\":\"没有\",\"score\":\"5\",\"code\":\"A\"},{\"text\":\"有时候\",\"score\":\"10\",\"code\":\"B\"},{\"text\":\"经常\",\"score\":\"15\",\"code\":\"C\"},{\"text\":\"总是如此\",\"score\":\"20\",\"code\":\"D\"}]',NULL,'','可以解析每个选项是什么心理',10,'B',1712649792431);
/*!40000 ALTER TABLE `examrecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forum`
--

DROP TABLE IF EXISTS `forum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forum` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `title` varchar(200) DEFAULT NULL COMMENT '帖子标题',
  `content` longtext NOT NULL COMMENT '帖子内容',
  `parentid` bigint(20) DEFAULT NULL COMMENT '父节点id',
  `username` varchar(200) DEFAULT NULL COMMENT '用户名',
  `avatarurl` longtext COMMENT '头像',
  `isdone` varchar(200) DEFAULT NULL COMMENT '状态',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1712649834797 DEFAULT CHARSET=utf8 COMMENT='论坛交流';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forum`
--

LOCK TABLES `forum` WRITE;
/*!40000 ALTER TABLE `forum` DISABLE KEYS */;
INSERT INTO `forum` VALUES (121,'2024-04-09 07:54:59','帖子标题1','帖子内容1',0,'用户名1','file/forumAvatarurl1.jpg,file/forumAvatarurl2.jpg,file/forumAvatarurl3.jpg','开放',1),(122,'2024-04-09 07:54:59','帖子标题2','帖子内容2',0,'用户名2','file/forumAvatarurl2.jpg,file/forumAvatarurl3.jpg,file/forumAvatarurl4.jpg','开放',2),(123,'2024-04-09 07:54:59','帖子标题3','帖子内容3',0,'用户名3','file/forumAvatarurl3.jpg,file/forumAvatarurl4.jpg,file/forumAvatarurl5.jpg','开放',3),(124,'2024-04-09 07:54:59','帖子标题4','帖子内容4',0,'用户名4','file/forumAvatarurl4.jpg,file/forumAvatarurl5.jpg,file/forumAvatarurl6.jpg','开放',4),(125,'2024-04-09 07:54:59','帖子标题5','帖子内容5',0,'用户名5','file/forumAvatarurl5.jpg,file/forumAvatarurl6.jpg,file/forumAvatarurl7.jpg','开放',5),(126,'2024-04-09 07:54:59','帖子标题6','帖子内容6',0,'用户名6','file/forumAvatarurl6.jpg,file/forumAvatarurl7.jpg,file/forumAvatarurl8.jpg','开放',6),(1712649823502,'2024-04-09 08:03:42','这里可以交流','<p>评论</p>',0,'11',NULL,'开放',1712649792431),(1712649834796,'2024-04-09 08:03:54',NULL,'<p>可以评论</p>',121,'11','file/1712649781490.jpg',NULL,1712649792431);
/*!40000 ALTER TABLE `forum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `menujson` longtext COMMENT '菜单',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='菜单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'2024-04-09 07:54:59','[{\"backMenu\":[{\"child\":[{\"appFrontIcon\":\"cuIcon-newshot\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\",\"审核\",\"年龄统计\",\"性别统计\",\"首页总数\",\"首页统计\"],\"menu\":\"用户\",\"menuJump\":\"列表\",\"tableName\":\"yonghu\"}],\"fontClass\":\"icon-user1\",\"menu\":\"用户管理\",\"unicode\":\"&#xef97;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-send\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\",\"审核\"],\"menu\":\"心理医生\",\"menuJump\":\"列表\",\"tableName\":\"xinliyisheng\"}],\"fontClass\":\"icon-user7\",\"menu\":\"心理医生管理\",\"unicode\":\"&#xef9d;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-skin\",\"buttons\":[\"查看\",\"修改\",\"删除\",\"预约次数\",\"首页总数\",\"首页统计\"],\"menu\":\"预约医生\",\"menuJump\":\"列表\",\"tableName\":\"yuyueyisheng\"},{\"appFrontIcon\":\"cuIcon-shop\",\"buttons\":[\"查看\",\"删除\"],\"menu\":\"坐诊医生\",\"menuJump\":\"列表\",\"tableName\":\"zuozhenyisheng\"},{\"appFrontIcon\":\"cuIcon-paint\",\"buttons\":[\"查看\",\"删除\",\"取消次数\",\"首页总数\",\"首页统计\"],\"menu\":\"取消预约\",\"menuJump\":\"列表\",\"tableName\":\"quxiaoyuyue\"},{\"appFrontIcon\":\"cuIcon-full\",\"buttons\":[\"删除\",\"查看\"],\"menu\":\"医生就诊\",\"menuJump\":\"列表\",\"tableName\":\"yishengjiuzhen\"}],\"fontClass\":\"icon-common7\",\"menu\":\"坐诊医生管理\",\"unicode\":\"&#xedb4;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-news\",\"buttons\":[\"查看\",\"删除\",\"修改\"],\"menu\":\"病历信息\",\"menuJump\":\"列表\",\"tableName\":\"binglixinxi\"}],\"fontClass\":\"icon-common22\",\"menu\":\"病历信息管理\",\"unicode\":\"&#xee04;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-medal\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"menu\":\"案例信息\",\"menuJump\":\"列表\",\"tableName\":\"anlixinxi\"},{\"appFrontIcon\":\"cuIcon-similar\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"menu\":\"案例类型\",\"menuJump\":\"列表\",\"tableName\":\"anlileixing\"}],\"fontClass\":\"icon-common50\",\"menu\":\"案例信息管理\",\"unicode\":\"&#xef96;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-full\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\",\"组卷\"],\"menu\":\"试卷管理\",\"tableName\":\"exampaper\"},{\"appFrontIcon\":\"cuIcon-form\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\",\"打印\",\"导出\"],\"menu\":\"试题管理\",\"menuJump\":\"列表\",\"tableName\":\"examquestion\"},{\"appFrontIcon\":\"cuIcon-full\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"menu\":\"试卷列表\",\"menuJump\":\"12\",\"tableName\":\"exampaper\"},{\"appFrontIcon\":\"cuIcon-circle\",\"buttons\":[\"删除\",\"查看\"],\"menu\":\"心理测试\",\"tableName\":\"examrecord\"}],\"fontClass\":\"icon-common4\",\"menu\":\"测试信息管理\",\"unicode\":\"&#xedab;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-addressbook\",\"buttons\":[\"查看\",\"删除\",\"查看评论\"],\"menu\":\"论坛交流\",\"tableName\":\"forum\"}],\"fontClass\":\"icon-common4\",\"menu\":\"论坛管理\",\"unicode\":\"&#xedab;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-camera\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"menu\":\"轮播图\",\"menuJump\":\"列表\",\"tableName\":\"config\"}],\"fontClass\":\"icon-common23\",\"menu\":\"轮播图管理\",\"unicode\":\"&#xee05;\"}],\"frontMenu\":[{\"child\":[{\"appFrontIcon\":\"cuIcon-goods\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"menu\":\"论坛交流\",\"menuJump\":\"列表\",\"tableName\":\"forum\"}],\"menu\":\"论坛交流\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-copy\",\"buttons\":[\"查看\",\"预约\"],\"menu\":\"坐诊医生\",\"menuJump\":\"列表\",\"tableName\":\"zuozhenyisheng\"}],\"menu\":\"坐诊医生管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-attentionfavor\",\"buttons\":[\"查看\"],\"menu\":\"案例信息\",\"menuJump\":\"列表\",\"tableName\":\"anlixinxi\"}],\"menu\":\"案例信息管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-present\",\"buttons\":[\"查看\"],\"fontClass\":\"icon-common15\",\"menu\":\"试卷列表\",\"menuJump\":\"12\",\"tableName\":\"exampaper\",\"unicode\":\"&#xedfc;\"}],\"fontClass\":\"icon-common15\",\"menu\":\"心理测试\",\"unicode\":\"&#xedfc;\"}],\"hasBackLogin\":\"是\",\"hasBackRegister\":\"否\",\"hasFrontLogin\":\"否\",\"hasFrontRegister\":\"否\",\"roleName\":\"管理员\",\"tableName\":\"users\"},{\"backMenu\":[{\"child\":[{\"appFrontIcon\":\"cuIcon-skin\",\"buttons\":[\"查看\",\"删除\",\"支付\",\"取消预约\"],\"menu\":\"预约医生\",\"menuJump\":\"列表\",\"tableName\":\"yuyueyisheng\"},{\"appFrontIcon\":\"cuIcon-paint\",\"buttons\":[\"查看\",\"删除\",\"审核\"],\"menu\":\"取消预约\",\"menuJump\":\"列表\",\"tableName\":\"quxiaoyuyue\"},{\"appFrontIcon\":\"cuIcon-full\",\"buttons\":[\"查看\",\"删除\"],\"menu\":\"医生就诊\",\"menuJump\":\"列表\",\"tableName\":\"yishengjiuzhen\"}],\"fontClass\":\"icon-common7\",\"menu\":\"坐诊医生管理\",\"unicode\":\"&#xedb4;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-circle\",\"buttons\":[\"查看\",\"删除\"],\"menu\":\"心理测试\",\"tableName\":\"examrecord\"}],\"fontClass\":\"icon-common4\",\"menu\":\"测试信息管理\",\"unicode\":\"&#xedab;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-addressbook\",\"buttons\":[\"查看\",\"删除\"],\"menu\":\"我的发布\",\"menuJump\":\"14\",\"tableName\":\"forum\"}],\"fontClass\":\"icon-common4\",\"menu\":\"论坛管理\",\"unicode\":\"&#xedab;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-form\",\"buttons\":[\"查看\"],\"menu\":\"我的收藏\",\"menuJump\":\"1\",\"tableName\":\"storeup\"}],\"fontClass\":\"icon-common4\",\"menu\":\"我的收藏管理\",\"unicode\":\"&#xedab;\"}],\"frontMenu\":[{\"child\":[{\"appFrontIcon\":\"cuIcon-goods\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"menu\":\"论坛交流\",\"menuJump\":\"列表\",\"tableName\":\"forum\"}],\"menu\":\"论坛交流\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-copy\",\"buttons\":[\"查看\",\"预约\"],\"menu\":\"坐诊医生\",\"menuJump\":\"列表\",\"tableName\":\"zuozhenyisheng\"}],\"menu\":\"坐诊医生管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-attentionfavor\",\"buttons\":[\"查看\"],\"menu\":\"案例信息\",\"menuJump\":\"列表\",\"tableName\":\"anlixinxi\"}],\"menu\":\"案例信息管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-present\",\"buttons\":[\"查看\"],\"fontClass\":\"icon-common15\",\"menu\":\"试卷列表\",\"menuJump\":\"12\",\"tableName\":\"exampaper\",\"unicode\":\"&#xedfc;\"}],\"fontClass\":\"icon-common15\",\"menu\":\"心理测试\",\"unicode\":\"&#xedfc;\"}],\"hasBackLogin\":\"否\",\"hasBackRegister\":\"否\",\"hasFrontLogin\":\"是\",\"hasFrontRegister\":\"是\",\"roleName\":\"用户\",\"tableName\":\"yonghu\"},{\"backMenu\":[{\"child\":[{\"appFrontIcon\":\"cuIcon-newshot\",\"buttons\":[\"年龄统计\",\"性别统计\",\"首页总数\",\"首页统计\"],\"menu\":\"用户\",\"menuJump\":\"列表\",\"tableName\":\"yonghu\"}],\"fontClass\":\"icon-user1\",\"menu\":\"用户管理\",\"unicode\":\"&#xef97;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-skin\",\"buttons\":[\"查看\",\"删除\",\"审核\",\"预约次数\",\"首页总数\",\"首页统计\",\"就诊\"],\"menu\":\"预约医生\",\"menuJump\":\"列表\",\"tableName\":\"yuyueyisheng\"},{\"appFrontIcon\":\"cuIcon-shop\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"menu\":\"坐诊医生\",\"menuJump\":\"列表\",\"tableName\":\"zuozhenyisheng\"},{\"appFrontIcon\":\"cuIcon-paint\",\"buttons\":[\"查看\",\"删除\",\"审核\",\"首页总数\",\"首页统计\",\"取消次数\"],\"menu\":\"取消预约\",\"menuJump\":\"列表\",\"tableName\":\"quxiaoyuyue\"},{\"appFrontIcon\":\"cuIcon-full\",\"buttons\":[\"查看\",\"删除\"],\"menu\":\"医生就诊\",\"menuJump\":\"列表\",\"tableName\":\"yishengjiuzhen\"}],\"fontClass\":\"icon-common7\",\"menu\":\"坐诊医生管理\",\"unicode\":\"&#xedb4;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-news\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"menu\":\"病历信息\",\"menuJump\":\"列表\",\"tableName\":\"binglixinxi\"}],\"fontClass\":\"icon-common22\",\"menu\":\"病历信息管理\",\"unicode\":\"&#xee04;\"}],\"frontMenu\":[{\"child\":[{\"appFrontIcon\":\"cuIcon-goods\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"menu\":\"论坛交流\",\"menuJump\":\"列表\",\"tableName\":\"forum\"}],\"menu\":\"论坛交流\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-copy\",\"buttons\":[\"查看\",\"预约\"],\"menu\":\"坐诊医生\",\"menuJump\":\"列表\",\"tableName\":\"zuozhenyisheng\"}],\"menu\":\"坐诊医生管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-attentionfavor\",\"buttons\":[\"查看\"],\"menu\":\"案例信息\",\"menuJump\":\"列表\",\"tableName\":\"anlixinxi\"}],\"menu\":\"案例信息管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-present\",\"buttons\":[\"查看\"],\"fontClass\":\"icon-common15\",\"menu\":\"试卷列表\",\"menuJump\":\"12\",\"tableName\":\"exampaper\",\"unicode\":\"&#xedfc;\"}],\"fontClass\":\"icon-common15\",\"menu\":\"心理测试\",\"unicode\":\"&#xedfc;\"}],\"hasBackLogin\":\"是\",\"hasBackRegister\":\"是\",\"hasFrontLogin\":\"否\",\"hasFrontRegister\":\"否\",\"roleName\":\"心理医生\",\"tableName\":\"xinliyisheng\"}]');
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quxiaoyuyue`
--

DROP TABLE IF EXISTS `quxiaoyuyue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quxiaoyuyue` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yishengzhanghao` varchar(200) NOT NULL COMMENT '医生账号',
  `yishengxingming` varchar(200) NOT NULL COMMENT '医生姓名',
  `lianxidianhua` varchar(200) DEFAULT NULL COMMENT '联系电话',
  `keyueshijian` varchar(200) DEFAULT NULL COMMENT '可约时间',
  `keyuerenshu` int(11) NOT NULL COMMENT '取消次数',
  `quxiaoyuanyin` varchar(200) DEFAULT NULL COMMENT '取消原因',
  `quxiaoshijian` datetime DEFAULT NULL COMMENT '取消时间',
  `yonghuzhanghao` varchar(200) DEFAULT NULL COMMENT '用户账号',
  `yonghuxingming` varchar(200) DEFAULT NULL COMMENT '用户姓名',
  `sfsh` varchar(200) DEFAULT NULL COMMENT '是否审核',
  `shhf` longtext COMMENT '回复内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1712650300433 DEFAULT CHARSET=utf8 COMMENT='取消预约';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quxiaoyuyue`
--

LOCK TABLES `quxiaoyuyue` WRITE;
/*!40000 ALTER TABLE `quxiaoyuyue` DISABLE KEYS */;
INSERT INTO `quxiaoyuyue` VALUES (81,'2024-04-09 07:54:58','医生账号1','医生姓名1','19819881111','可约时间1',1,'取消原因1','2024-04-09 15:54:58','用户账号1','用户姓名1','是',''),(82,'2024-04-09 07:54:58','医生账号2','医生姓名2','19819881112','可约时间2',2,'取消原因2','2024-04-09 15:54:58','用户账号2','用户姓名2','是',''),(83,'2024-04-09 07:54:58','医生账号3','医生姓名3','19819881113','可约时间3',3,'取消原因3','2024-04-09 15:54:58','用户账号3','用户姓名3','是',''),(84,'2024-04-09 07:54:58','医生账号4','医生姓名4','19819881114','可约时间4',4,'取消原因4','2024-04-09 15:54:58','用户账号4','用户姓名4','是',''),(85,'2024-04-09 07:54:58','医生账号5','医生姓名5','19819881115','可约时间5',5,'取消原因5','2024-04-09 15:54:58','用户账号5','用户姓名5','是',''),(86,'2024-04-09 07:54:58','医生账号6','医生姓名6','19819881116','可约时间6',6,'取消原因6','2024-04-09 15:54:58','用户账号6','用户姓名6','是',''),(1712650300432,'2024-04-09 08:11:40','22','王医生','13645645645','8.100-12.00',1,'原因','2024-04-09 16:11:45','11','小张','是','可以');
/*!40000 ALTER TABLE `quxiaoyuyue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storeup`
--

DROP TABLE IF EXISTS `storeup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `storeup` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `refid` bigint(20) DEFAULT NULL COMMENT 'refid',
  `tablename` varchar(200) DEFAULT NULL COMMENT '表名',
  `name` varchar(200) NOT NULL COMMENT '名称',
  `picture` longtext NOT NULL COMMENT '图片',
  `type` varchar(200) DEFAULT NULL COMMENT '类型(1:收藏,21:赞,22:踩,31:竞拍参与,41:关注)',
  `inteltype` varchar(200) DEFAULT NULL COMMENT '推荐类型',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1712650176903 DEFAULT CHARSET=utf8 COMMENT='我的收藏';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storeup`
--

LOCK TABLES `storeup` WRITE;
/*!40000 ALTER TABLE `storeup` DISABLE KEYS */;
INSERT INTO `storeup` VALUES (1712650176902,'2024-04-09 08:09:36',1712649930800,'zuozhenyisheng','王医生','file/1712649908651.jpg','1',NULL,NULL,1712649792431);
/*!40000 ALTER TABLE `storeup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `token`
--

DROP TABLE IF EXISTS `token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `tablename` varchar(100) DEFAULT NULL COMMENT '表名',
  `role` varchar(100) DEFAULT NULL COMMENT '角色',
  `token` varchar(200) NOT NULL COMMENT '密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `expiratedtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='token表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token`
--

LOCK TABLES `token` WRITE;
/*!40000 ALTER TABLE `token` DISABLE KEYS */;
INSERT INTO `token` VALUES (1,1,'admin','users','管理员','hit9w1bq50ggrf3tv5ggp5boytfvo3br','2024-04-09 08:01:18','2024-04-09 09:12:27'),(2,1712649792431,'11','yonghu','用户','dz7h1okb6znl7hc8rslqgb8qzip8n94q','2024-04-09 08:03:18','2024-04-09 09:09:15'),(3,1712649860104,'22','xinliyisheng','心理医生','04nsbz09qb98k0wd3kh1oi9q0m5vejot','2024-04-09 08:04:52','2024-04-09 09:10:24');
/*!40000 ALTER TABLE `token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `username` varchar(200) NOT NULL COMMENT '用户名',
  `password` varchar(200) NOT NULL COMMENT '密码',
  `role` varchar(200) DEFAULT NULL COMMENT '角色',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='管理员';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'2024-04-09 07:54:59','admin','admin','管理员');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xinliyisheng`
--

DROP TABLE IF EXISTS `xinliyisheng`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xinliyisheng` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yishengzhanghao` varchar(200) NOT NULL COMMENT '医生账号',
  `yishengmima` varchar(200) NOT NULL COMMENT '医生密码',
  `yishengxingming` varchar(200) NOT NULL COMMENT '医生姓名',
  `zhaopian` longtext COMMENT '照片',
  `xingbie` varchar(200) DEFAULT NULL COMMENT '性别',
  `lianxidianhua` varchar(200) DEFAULT NULL COMMENT '联系电话',
  `sfsh` varchar(200) DEFAULT NULL COMMENT '是否审核',
  `shhf` longtext COMMENT '回复内容',
  PRIMARY KEY (`id`),
  UNIQUE KEY `yishengzhanghao` (`yishengzhanghao`)
) ENGINE=InnoDB AUTO_INCREMENT=1712649860105 DEFAULT CHARSET=utf8 COMMENT='心理医生';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xinliyisheng`
--

LOCK TABLES `xinliyisheng` WRITE;
/*!40000 ALTER TABLE `xinliyisheng` DISABLE KEYS */;
INSERT INTO `xinliyisheng` VALUES (41,'2024-04-09 07:54:58','医生账号1','123456','医生姓名1','file/xinliyishengZhaopian1.jpg','男','19819881111','是',''),(42,'2024-04-09 07:54:58','医生账号2','123456','医生姓名2','file/xinliyishengZhaopian2.jpg','男','19819881112','是',''),(43,'2024-04-09 07:54:58','医生账号3','123456','医生姓名3','file/xinliyishengZhaopian3.jpg','男','19819881113','是',''),(44,'2024-04-09 07:54:58','医生账号4','123456','医生姓名4','file/xinliyishengZhaopian4.jpg','男','19819881114','是',''),(45,'2024-04-09 07:54:58','医生账号5','123456','医生姓名5','file/xinliyishengZhaopian5.jpg','男','19819881115','是',''),(46,'2024-04-09 07:54:58','医生账号6','123456','医生姓名6','file/xinliyishengZhaopian6.jpg','男','19819881116','是',''),(1712649860104,'2024-04-09 08:04:20','22','22','王医生','file/1712649852642.jpg','女','13645645645','是','批准');
/*!40000 ALTER TABLE `xinliyisheng` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yishengjiuzhen`
--

DROP TABLE IF EXISTS `yishengjiuzhen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yishengjiuzhen` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yuyuebianhao` varchar(200) DEFAULT NULL COMMENT '预约编号',
  `yishengzhanghao` varchar(200) DEFAULT NULL COMMENT '医生账号',
  `yishengxingming` varchar(200) DEFAULT NULL COMMENT '医生姓名',
  `yonghuzhanghao` varchar(200) DEFAULT NULL COMMENT '用户账号',
  `yonghuxingming` varchar(200) DEFAULT NULL COMMENT '用户姓名',
  `shoujihaoma` varchar(200) DEFAULT NULL COMMENT '手机号码',
  `jiwangbingshi` longtext COMMENT '既往病史',
  `zhenduanwenti` longtext COMMENT '诊断问题',
  `zhiliaofangan` longtext COMMENT '治疗方案',
  `jiuzhenxiangqing` longtext COMMENT '就诊详情',
  `jiuzhenshijian` datetime DEFAULT NULL COMMENT '就诊时间',
  `jiuzhenzhuangtai` varchar(200) DEFAULT NULL COMMENT '就诊状态',
  `yanzhongchengdu` varchar(200) DEFAULT NULL COMMENT '严重程度',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1712650269707 DEFAULT CHARSET=utf8 COMMENT='医生就诊';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yishengjiuzhen`
--

LOCK TABLES `yishengjiuzhen` WRITE;
/*!40000 ALTER TABLE `yishengjiuzhen` DISABLE KEYS */;
INSERT INTO `yishengjiuzhen` VALUES (131,'2024-04-09 07:54:59','预约编号1','医生账号1','医生姓名1','用户账号1','用户姓名1','19819881111','既往病史1','诊断问题1','治疗方案1','就诊详情1','2024-04-09 15:54:59','就诊状态1','轻微'),(132,'2024-04-09 07:54:59','预约编号2','医生账号2','医生姓名2','用户账号2','用户姓名2','19819881112','既往病史2','诊断问题2','治疗方案2','就诊详情2','2024-04-09 15:54:59','就诊状态2','轻微'),(133,'2024-04-09 07:54:59','预约编号3','医生账号3','医生姓名3','用户账号3','用户姓名3','19819881113','既往病史3','诊断问题3','治疗方案3','就诊详情3','2024-04-09 15:54:59','就诊状态3','轻微'),(134,'2024-04-09 07:54:59','预约编号4','医生账号4','医生姓名4','用户账号4','用户姓名4','19819881114','既往病史4','诊断问题4','治疗方案4','就诊详情4','2024-04-09 15:54:59','就诊状态4','轻微'),(135,'2024-04-09 07:54:59','预约编号5','医生账号5','医生姓名5','用户账号5','用户姓名5','19819881115','既往病史5','诊断问题5','治疗方案5','就诊详情5','2024-04-09 15:54:59','就诊状态5','轻微'),(136,'2024-04-09 07:54:59','预约编号6','医生账号6','医生姓名6','用户账号6','用户姓名6','19819881116','既往病史6','诊断问题6','治疗方案6','就诊详情6','2024-04-09 15:54:59','就诊状态6','轻微'),(1712650269706,'2024-04-09 08:11:09','','22','王医生','11','小张','13512312312','<p>内饰</p>','问题','方案 ','<p>详情</p>','2024-04-09 16:11:02','初诊','中等');
/*!40000 ALTER TABLE `yishengjiuzhen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yonghu`
--

DROP TABLE IF EXISTS `yonghu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yonghu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yonghuzhanghao` varchar(200) NOT NULL COMMENT '用户账号',
  `yonghumima` varchar(200) NOT NULL COMMENT '用户密码',
  `yonghuxingming` varchar(200) NOT NULL COMMENT '用户姓名',
  `touxiang` longtext COMMENT '头像',
  `xingbie` varchar(200) DEFAULT NULL COMMENT '性别',
  `shoujihaoma` varchar(200) DEFAULT NULL COMMENT '手机号码',
  `nianling` int(11) DEFAULT NULL COMMENT '年龄',
  `zhuzhi` varchar(200) DEFAULT NULL COMMENT '住址',
  PRIMARY KEY (`id`),
  UNIQUE KEY `yonghuzhanghao` (`yonghuzhanghao`)
) ENGINE=InnoDB AUTO_INCREMENT=1712649792432 DEFAULT CHARSET=utf8 COMMENT='用户';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yonghu`
--

LOCK TABLES `yonghu` WRITE;
/*!40000 ALTER TABLE `yonghu` DISABLE KEYS */;
INSERT INTO `yonghu` VALUES (31,'2024-04-09 07:54:58','用户账号1','123456','用户姓名1','file/yonghuTouxiang1.jpg','男','19819881111',1,'住址1'),(32,'2024-04-09 07:54:58','用户账号2','123456','用户姓名2','file/yonghuTouxiang2.jpg','男','19819881112',2,'住址2'),(33,'2024-04-09 07:54:58','用户账号3','123456','用户姓名3','file/yonghuTouxiang3.jpg','男','19819881113',3,'住址3'),(34,'2024-04-09 07:54:58','用户账号4','123456','用户姓名4','file/yonghuTouxiang4.jpg','男','19819881114',4,'住址4'),(35,'2024-04-09 07:54:58','用户账号5','123456','用户姓名5','file/yonghuTouxiang5.jpg','男','19819881115',5,'住址5'),(36,'2024-04-09 07:54:58','用户账号6','123456','用户姓名6','file/yonghuTouxiang6.jpg','男','19819881116',6,'住址6'),(1712649792431,'2024-04-09 08:03:12','11','11','小张','file/1712649781490.jpg','女','13512312312',25,'广州大道2号');
/*!40000 ALTER TABLE `yonghu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yuyueyisheng`
--

DROP TABLE IF EXISTS `yuyueyisheng`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yuyueyisheng` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yishengzhanghao` varchar(200) NOT NULL COMMENT '医生账号',
  `yishengxingming` varchar(200) NOT NULL COMMENT '医生姓名',
  `lianxidianhua` varchar(200) DEFAULT NULL COMMENT '联系电话',
  `keyueshijian` varchar(200) DEFAULT NULL COMMENT '可约时间',
  `zixunfeiyong` double DEFAULT NULL COMMENT '咨询费用',
  `keyuerenshu` int(11) DEFAULT NULL COMMENT '预约数量',
  `yuyueshijian` datetime DEFAULT NULL COMMENT '预约时间',
  `yonghuzhanghao` varchar(200) DEFAULT NULL COMMENT '用户账号',
  `yonghuxingming` varchar(200) DEFAULT NULL COMMENT '用户姓名',
  `shoujihaoma` varchar(200) DEFAULT NULL COMMENT '手机号码',
  `zhuzhi` varchar(200) DEFAULT NULL COMMENT '住址',
  `sfsh` varchar(200) DEFAULT NULL COMMENT '是否审核',
  `shhf` longtext COMMENT '回复内容',
  `ispay` varchar(200) DEFAULT NULL COMMENT '是否支付',
  `jiuzhenzhuangtai` varchar(200) DEFAULT NULL COMMENT '就诊状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1712650170240 DEFAULT CHARSET=utf8 COMMENT='预约医生';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yuyueyisheng`
--

LOCK TABLES `yuyueyisheng` WRITE;
/*!40000 ALTER TABLE `yuyueyisheng` DISABLE KEYS */;
INSERT INTO `yuyueyisheng` VALUES (51,'2024-04-09 07:54:58','医生账号1','医生姓名1','19819881111','可约时间1',1,1,'2024-04-09 15:54:58','用户账号1','用户姓名1','19819881111','住址1','是','','未支付','初诊'),(52,'2024-04-09 07:54:58','医生账号2','医生姓名2','19819881112','可约时间2',2,2,'2024-04-09 15:54:58','用户账号2','用户姓名2','19819881112','住址2','是','','未支付','初诊'),(53,'2024-04-09 07:54:58','医生账号3','医生姓名3','19819881113','可约时间3',3,3,'2024-04-09 15:54:58','用户账号3','用户姓名3','19819881113','住址3','是','','未支付','初诊'),(54,'2024-04-09 07:54:58','医生账号4','医生姓名4','19819881114','可约时间4',4,4,'2024-04-09 15:54:58','用户账号4','用户姓名4','19819881114','住址4','是','','未支付','初诊'),(55,'2024-04-09 07:54:58','医生账号5','医生姓名5','19819881115','可约时间5',5,5,'2024-04-09 15:54:58','用户账号5','用户姓名5','19819881115','住址5','是','','未支付','初诊'),(56,'2024-04-09 07:54:58','医生账号6','医生姓名6','19819881116','可约时间6',6,6,'2024-04-09 15:54:58','用户账号6','用户姓名6','19819881116','住址6','是','','未支付','初诊'),(1712650170239,'2024-04-09 08:09:30','22','王医生','13645645645','8.100-12.00',20,1,'2024-04-09 16:09:36','11','小张','13512312312','广州大道2号','是','可以约','已支付','初诊');
/*!40000 ALTER TABLE `yuyueyisheng` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zuozhenyisheng`
--

DROP TABLE IF EXISTS `zuozhenyisheng`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zuozhenyisheng` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yishengzhanghao` varchar(200) NOT NULL COMMENT '医生账号',
  `yishengxingming` varchar(200) NOT NULL COMMENT '医生姓名',
  `lianxidianhua` varchar(200) DEFAULT NULL COMMENT '联系电话',
  `zhaopian` longtext COMMENT '照片',
  `keyuerenshu` int(11) DEFAULT NULL COMMENT '可约人数',
  `zixunfeiyong` double DEFAULT NULL COMMENT '咨询费用',
  `keyueshijian` varchar(200) DEFAULT NULL COMMENT '可约时间',
  `zhuanyezizhi` longtext COMMENT '专业资质',
  `zhuanyelingyu` longtext COMMENT '专业领域',
  `gerenjianjie` longtext COMMENT '个人简介',
  `storeupnum` int(11) DEFAULT NULL COMMENT '收藏数量',
  `jiuzhendidian` varchar(200) DEFAULT NULL COMMENT '就诊地点',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1712649930801 DEFAULT CHARSET=utf8 COMMENT='坐诊医生';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zuozhenyisheng`
--

LOCK TABLES `zuozhenyisheng` WRITE;
/*!40000 ALTER TABLE `zuozhenyisheng` DISABLE KEYS */;
INSERT INTO `zuozhenyisheng` VALUES (71,'2024-04-09 07:54:58','医生账号1','医生姓名1','19819881111','file/zuozhenyishengZhaopian1.jpg,file/zuozhenyishengZhaopian2.jpg,file/zuozhenyishengZhaopian3.jpg',1,1,'可约时间1','专业资质1','专业领域1','个人简介1',1,'就诊地点1'),(72,'2024-04-09 07:54:58','医生账号2','医生姓名2','19819881112','file/zuozhenyishengZhaopian2.jpg,file/zuozhenyishengZhaopian3.jpg,file/zuozhenyishengZhaopian4.jpg',2,2,'可约时间2','专业资质2','专业领域2','个人简介2',2,'就诊地点2'),(73,'2024-04-09 07:54:58','医生账号3','医生姓名3','19819881113','file/zuozhenyishengZhaopian3.jpg,file/zuozhenyishengZhaopian4.jpg,file/zuozhenyishengZhaopian5.jpg',3,3,'可约时间3','专业资质3','专业领域3','个人简介3',3,'就诊地点3'),(74,'2024-04-09 07:54:58','医生账号4','医生姓名4','19819881114','file/zuozhenyishengZhaopian4.jpg,file/zuozhenyishengZhaopian5.jpg,file/zuozhenyishengZhaopian6.jpg',4,4,'可约时间4','专业资质4','专业领域4','个人简介4',4,'就诊地点4'),(75,'2024-04-09 07:54:58','医生账号5','医生姓名5','19819881115','file/zuozhenyishengZhaopian5.jpg,file/zuozhenyishengZhaopian6.jpg,file/zuozhenyishengZhaopian7.jpg',5,5,'可约时间5','专业资质5','专业领域5','个人简介5',5,'就诊地点5'),(76,'2024-04-09 07:54:58','医生账号6','医生姓名6','19819881116','file/zuozhenyishengZhaopian6.jpg,file/zuozhenyishengZhaopian7.jpg,file/zuozhenyishengZhaopian8.jpg',6,6,'可约时间6','专业资质6','专业领域6','个人简介6',6,'就诊地点6'),(1712649930800,'2024-04-09 08:05:29','22','王医生','13645645645','file/1712649908651.jpg',4,20,'8.100-12.00','抑郁','抑郁','<p>简介</p>',1,'广州大道2号');
/*!40000 ALTER TABLE `zuozhenyisheng` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-16 16:22:47
