# Host: 127.0.0.1  (Version 5.5.62-log)
# Date: 2019-04-29 21:37:45
# Generator: MySQL-Front 6.1  (Build 1.26)


#
# Structure for table "tb_dialog"
#

CREATE TABLE `tb_dialog` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '会话编号',
  `beginTime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '会话开始时间',
  `diaguser` varchar(255) NOT NULL DEFAULT '' COMMENT '涉及用户1',
  `contactUserId` varchar(255) NOT NULL DEFAULT '' COMMENT '涉及用户',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='会话表';

#
# Data for table "tb_dialog"
#

INSERT INTO `tb_dialog` VALUES (1,'2019-04-20 17:12:27','1','2'),(10,'2019-04-22 10:12:27','1','3'),(11,'2019-04-22 10:13:27','1','4'),(13,'2019-04-22 15:35:54','1','1'),(14,'2019-04-25 23:12:56','2','2');

#
# Structure for table "tb_equipment_info"
#

CREATE TABLE `tb_equipment_info` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `zzsId` varchar(255) NOT NULL DEFAULT '' COMMENT '制造商id',
  `DeviceName` varchar(255) NOT NULL DEFAULT '' COMMENT '设备名称',
  `Type` varchar(255) DEFAULT NULL COMMENT '设备类型',
  `Manufactory` varchar(255) DEFAULT NULL COMMENT '制造厂商',
  `Version` varchar(255) DEFAULT NULL COMMENT '设备版本',
  `Code` varchar(255) NOT NULL DEFAULT '' COMMENT '设备序列号',
  `DeviceDescription` varchar(255) DEFAULT NULL COMMENT '设备描述',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

#
# Data for table "tb_equipment_info"
#

INSERT INTO `tb_equipment_info` VALUES (1,'1','小米台灯','light','小米','1.0','00000001',NULL),(2,'1','小米门锁','lock','小米','1.0','00000002',NULL),(3,'1','小米空调','air','小米','1.0','00000003',NULL),(5,'2','美的空调A1','air','美的','1.0','00000004',NULL),(6,'2','美的洗衣机B2','wash','美的','1.0','00000005',NULL),(7,'2','美的空调A2','air','美的','1.0','00000006',NULL);

#
# Structure for table "tb_fee_calc"
#

CREATE TABLE `tb_fee_calc` (
  `FeeCalcId` int(11) NOT NULL AUTO_INCREMENT,
  `UserId` varchar(255) NOT NULL DEFAULT '' COMMENT '用户编码',
  `wuyeFee` varchar(255) DEFAULT NULL COMMENT '物业费',
  `waterFee` varchar(255) DEFAULT NULL COMMENT '水费',
  `dianFee` varchar(255) DEFAULT NULL COMMENT '电费',
  `countFee` varchar(255) DEFAULT NULL COMMENT '总的费用',
  `payMethod` varchar(255) DEFAULT NULL COMMENT '付款方式',
  PRIMARY KEY (`FeeCalcId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='费用结算';

#
# Data for table "tb_fee_calc"
#

INSERT INTO `tb_fee_calc` VALUES (1,'1',NULL,NULL,NULL,NULL,NULL);

#
# Structure for table "tb_hosp_discate"
#

CREATE TABLE `tb_hosp_discate` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '科室编号',
  `cateName` varchar(255) NOT NULL DEFAULT '' COMMENT '科室名称',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='医院科室分类表';

#
# Data for table "tb_hosp_discate"
#

INSERT INTO `tb_hosp_discate` VALUES (1,'内科'),(2,'儿科'),(3,'五官科'),(4,'肠胃科');

#
# Structure for table "tb_hosp_disease"
#

CREATE TABLE `tb_hosp_disease` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '常见疾病编号',
  `disName` varchar(45) NOT NULL DEFAULT '' COMMENT '疾病名称',
  `cateId` int(11) NOT NULL DEFAULT '0' COMMENT '负责科室',
  PRIMARY KEY (`id`),
  KEY `cateId` (`cateId`),
  CONSTRAINT `tb_hosp_disease_ibfk_1` FOREIGN KEY (`cateId`) REFERENCES `tb_hosp_discate` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

#
# Data for table "tb_hosp_disease"
#

INSERT INTO `tb_hosp_disease` VALUES (1,'流行性感冒',1),(2,'糖尿病',1),(3,'胃病',1),(4,'阑尾炎',1),(5,'高血压',1),(6,'心肌梗塞',1),(7,'冠心病',1),(8,'气胸',1),(9,'小儿厌食',2),(10,'小儿多动症',2),(11,'小儿感冒',2),(12,'哮喘',2),(13,'小儿咳嗽',2),(14,'小儿支气管',2),(15,'发烧',2),(16,'白内障',3),(17,'肉鼻息',3),(18,'青光眼',3),(19,'斜视',3),(20,'近视',3),(21,'沙眼',3),(22,'红眼病',3);

#
# Structure for table "tb_hosp_doctor"
#

CREATE TABLE `tb_hosp_doctor` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '医师编号',
  `docname` varchar(45) NOT NULL DEFAULT '' COMMENT '医生姓名',
  `position` varchar(45) NOT NULL DEFAULT '' COMMENT '医生职位',
  `department` varchar(45) NOT NULL DEFAULT '' COMMENT '所在科室',
  `description` varchar(45) NOT NULL DEFAULT '' COMMENT '个人介绍',
  `disId` int(11) NOT NULL DEFAULT '0' COMMENT '疾病编号',
  `startTime` time NOT NULL DEFAULT '00:00:00' COMMENT '医生工作开始时间',
  `EndTime` time NOT NULL DEFAULT '00:00:00',
  PRIMARY KEY (`id`),
  KEY `disId` (`disId`),
  CONSTRAINT `tb_hosp_doctor_ibfk_1` FOREIGN KEY (`disId`) REFERENCES `tb_hosp_disease` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

#
# Data for table "tb_hosp_doctor"
#

INSERT INTO `tb_hosp_doctor` VALUES (7,'柳侑绮','医师','冠心病','专治冠心病',7,'07:35:00','18:00:00'),(8,'刘峰','主任医师','气胸','气胸病专家',8,'07:35:00','18:00:00'),(10,'方书雁','主任医师','小儿多动症','简介简介简介',10,'07:35:00','17:00:00'),(11,'针乐正','医师','小儿感冒','简介简介简介',11,'07:35:00','18:00:00'),(12,'坚才艺','副主任医师','小儿哮喘','简介简介简介',12,'07:35:00','17:00:00'),(13,'李晓明','主任医师','小儿咳嗽','简介简介简介',13,'08:25:00','18:00:00'),(14,'王二里','医师','小儿支气管炎','简介简介简介',14,'08:35:00','18:00:00'),(15,'测试用例','主任医师','发烧','简介简介简介',15,'07:35:00','17:00:00'),(16,'用例','副主任医师','白内障','简介简介简介',16,'07:35:00','18:00:00');

#
# Structure for table "tb_hosp_order"
#

CREATE TABLE `tb_hosp_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '订单编号',
  `docId` varchar(45) NOT NULL DEFAULT '' COMMENT '医师编号',
  `docname` varchar(45) NOT NULL DEFAULT '' COMMENT '医师姓名',
  `docDepartment` varchar(45) NOT NULL DEFAULT '' COMMENT '医生科室',
  `userId` varchar(45) NOT NULL DEFAULT '' COMMENT '用户编号',
  `username` varchar(45) NOT NULL DEFAULT '' COMMENT '用户姓名',
  `bookdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '预定时间',
  `timeFrame` varchar(45) NOT NULL DEFAULT '' COMMENT '预定时间段',
  `cost` varchar(45) NOT NULL DEFAULT '' COMMENT '费用',
  `paystatue` varchar(45) NOT NULL DEFAULT '' COMMENT '支付状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

#
# Data for table "tb_hosp_order"
#

INSERT INTO `tb_hosp_order` VALUES (1,'7','柳侑绮','内科','1','张三','2019-04-16 13:30:00','2019-04-16 13:45:00','9','已支付'),(2,'10','方书雁','儿科','2','李四','2019-04-17 13:30:00','2019-04-16 13:45:00','8','已支付');

#
# Structure for table "tb_message"
#

CREATE TABLE `tb_message` (
  `MessageId` int(11) NOT NULL AUTO_INCREMENT COMMENT '留言id',
  `MessageText` longtext COMMENT '留言内容',
  `MessageUser` varchar(255) DEFAULT NULL COMMENT '留言用户',
  `AddTime` datetime DEFAULT NULL COMMENT '留言时间',
  `state` varchar(255) DEFAULT NULL COMMENT '状态',
  `diaglogId` varchar(255) NOT NULL DEFAULT '' COMMENT '会话id',
  PRIMARY KEY (`MessageId`)
) ENGINE=InnoDB AUTO_INCREMENT=143 DEFAULT CHARSET=utf8 COMMENT='留言信息表';

#
# Data for table "tb_message"
#

INSERT INTO `tb_message` VALUES (1,'我','1',NULL,NULL,'1'),(2,'嗯嗯','2',NULL,NULL,'1'),(3,'2131','1','2019-04-21 11:10:19',NULL,'1'),(4,'你好','1','2019-04-21 11:10:47',NULL,'1'),(5,'你好','1','2019-04-22 10:12:44',NULL,'10'),(16,'1232','1','2019-04-22 12:30:23',NULL,'10'),(17,'1232','1','2019-04-22 12:30:26',NULL,'10'),(18,'ok','1','2019-04-22 12:30:39',NULL,'1'),(19,'fine','1','2019-04-22 15:26:50',NULL,'1'),(28,'123','1','2019-04-22 17:58:39',NULL,'1'),(29,'可以聊天了','1','2019-04-22 17:59:17',NULL,'1'),(38,'123','1','2019-04-22 17:59:48',NULL,'1'),(39,'123','1','2019-04-22 17:59:48',NULL,'1'),(52,'123','1','2019-04-22 18:00:03',NULL,'1'),(53,'123','1','2019-04-22 18:00:04',NULL,'1'),(82,'热','1','2019-04-22 18:02:19',NULL,'1'),(83,'热','1','2019-04-22 18:02:19',NULL,'1'),(84,'杭州','1','2019-04-22 18:02:30',NULL,'1'),(85,'杭州','1','2019-04-22 18:02:30',NULL,'1'),(86,'杭州','1','2019-04-22 18:02:30',NULL,'1'),(87,'23','1','2019-04-22 18:03:13',NULL,'1'),(88,'23','1','2019-04-22 18:03:13',NULL,'1'),(89,'23','1','2019-04-22 18:03:14',NULL,'1'),(90,'23','1','2019-04-22 18:03:14',NULL,'1'),(91,'有','1','2019-04-22 18:03:22',NULL,'1'),(92,'有','1','2019-04-22 18:03:22',NULL,'1'),(93,'哦','1','2019-04-22 18:05:09',NULL,'1'),(94,'哦','1','2019-04-22 18:05:09',NULL,'1'),(95,'哦','1','2019-04-22 18:05:58',NULL,'1'),(96,'5','1','2019-04-22 18:06:12',NULL,'1'),(97,'ok','1','2019-04-22 18:06:16',NULL,'1'),(130,'怕','1','2019-04-22 18:10:55',NULL,'1'),(131,'了','1','2019-04-22 18:11:01',NULL,'1'),(136,'fine','1','2019-04-22 18:16:03',NULL,'1'),(137,'破','1','2019-04-22 18:16:11',NULL,'1'),(138,'哦','1','2019-04-22 18:16:18',NULL,'1'),(139,'有','1','2019-04-22 18:16:25',NULL,'1'),(140,'有','1','2019-04-22 18:16:35',NULL,'1'),(142,'1','1','2019-04-26 15:05:45',NULL,'11');

#
# Structure for table "tb_nav"
#

CREATE TABLE `tb_nav` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '模块编号',
  `text` varchar(255) DEFAULT NULL COMMENT '模块名称',
  `state` varchar(255) DEFAULT NULL COMMENT '节点状态',
  `iconCls` varchar(255) DEFAULT NULL COMMENT '图标分类',
  `url` varchar(255) DEFAULT NULL COMMENT '连接',
  `nodeId` int(11) NOT NULL DEFAULT '0' COMMENT '父节点ID',
  `navtab` varchar(255) NOT NULL DEFAULT '' COMMENT '子系统编号',
  `navAuth` varchar(255) DEFAULT 'user' COMMENT '面板权限',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='导航栏数据';

#
# Data for table "tb_nav"
#

INSERT INTO `tb_nav` VALUES (1,'首页',NULL,'icon-house','pageFirst.jsp',0,'1','user'),(2,'用户管理','closed','icon-manager',NULL,0,'1','user'),(3,'修改账户信息',NULL,'icon-mini-edit','pageChangeInfo.jsp',2,'1','user'),(5,'用户维修报障功能','closed',NULL,NULL,0,'2','user'),(6,'用户维修预约',NULL,NULL,'pageRepairOrder.jsp',5,'2','user'),(7,'测试页1',NULL,NULL,'page01.jsp',0,'','user'),(8,'测试页2',NULL,NULL,'page02.jsp',0,'','user'),(9,'预约管理',NULL,'icon-ordering','pageOrderManager.jsp',5,'2','user'),(10,'二手市场','closed','icon-market','',0,'3','user'),(11,'商品搜索',NULL,'icon-search','pageSearch.jsp',10,'3','user'),(12,'购物车',NULL,'icon-shopping','pagePurchase.jsp',10,'3','user'),(13,'订单管理',NULL,'icon-ordering','pageShopManager.jsp',10,'3','user'),(14,'上架物品',NULL,NULL,'pageUploadItem.jsp',10,'3','user'),(15,'留言表单管理','closed',NULL,NULL,0,'4','user'),(16,'发起留言表单',NULL,NULL,'pageLiuyan.jsp',15,'4','user'),(17,'查看留言',NULL,NULL,'pageLiuyanGuanli.jsp',15,'4','user'),(18,'报修系统管理功能','closed',NULL,NULL,0,'9','user'),(19,'维修人员管理',NULL,NULL,'./adminjsp/AdminRepiar.jsp',18,'9','user'),(20,'二手市场管理',NULL,NULL,NULL,0,'','user');

#
# Structure for table "tb_news"
#

CREATE TABLE `tb_news` (
  `NewsId` int(11) NOT NULL AUTO_INCREMENT COMMENT '公告id',
  `DeliverUser` varchar(255) DEFAULT NULL COMMENT '发送公告的用户',
  `NewsClass` varchar(255) DEFAULT NULL COMMENT '新闻分类',
  `Text` longtext COMMENT '公告内容',
  `CreateUser` varchar(255) DEFAULT NULL COMMENT '公告编写者',
  `AddDate` datetime DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`NewsId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='公告';

#
# Data for table "tb_news"
#

INSERT INTO `tb_news` VALUES (1,'admin',NULL,'社区将努力建设“树立健康生活理念，建设文明和谐社区“精神','admin',NULL);

#
# Structure for table "tb_repair_order"
#

CREATE TABLE `tb_repair_order` (
  `yyId` int(11) NOT NULL AUTO_INCREMENT COMMENT '预约id',
  `UserId` varchar(255) NOT NULL DEFAULT '',
  `RepairManId` varchar(255) NOT NULL DEFAULT '' COMMENT '维修人员Id',
  `StartTime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '开始时间',
  `RepairTime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `FinishTime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '维修结束时间',
  `state` varchar(255) DEFAULT NULL COMMENT '预约单状态',
  PRIMARY KEY (`yyId`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COMMENT='维修预约表';

#
# Data for table "tb_repair_order"
#

INSERT INTO `tb_repair_order` VALUES (18,'1','3','2019-03-08 04:10:31','2019-03-08 16:10:25','2019-03-08 19:10:25','用户取消'),(19,'1','2','2019-03-11 09:57:33','2019-03-11 09:57:28','2019-03-11 12:57:28','用户取消'),(28,'1','1','2019-04-04 07:49:38','2019-04-04 19:49:07','2019-04-04 22:49:07','用户取消'),(29,'1','1','2019-04-04 07:53:00','2019-04-04 19:52:56','2019-04-04 22:52:56','用户取消'),(31,'1','1','2019-04-04 07:53:09','2019-04-04 19:52:56','2019-04-04 22:52:56','进行中'),(32,'1','1','2019-04-04 08:44:42','2019-04-04 20:44:28','2019-04-04 23:44:28','用户取消'),(33,'1','2','2019-04-04 09:00:17','2019-04-04 21:00:06','2019-04-05 00:00:06','用户取消'),(34,'1','2','2019-04-08 02:27:59','2019-04-08 14:27:50','2019-04-08 17:27:50','用户取消'),(35,'1','3','2019-04-08 02:28:31','2019-04-08 14:28:18','2019-04-08 17:28:18','进行中'),(37,'1','2','2019-04-08 02:29:38','2019-04-08 14:29:29','2019-04-08 17:29:29','用户取消'),(38,'1','2','2019-04-18 09:04:03','2019-04-18 21:03:58','2019-04-19 00:03:58','进行中'),(39,'1','2','2019-04-29 04:52:08','2019-04-29 16:51:52','2019-04-29 19:51:52','进行中'),(40,'1','2','2019-04-29 05:08:42','2019-04-29 17:08:31','2019-04-29 20:08:31','进行中');

#
# Structure for table "tb_repair_sheet"
#

CREATE TABLE `tb_repair_sheet` (
  `SheetsId` int(11) NOT NULL AUTO_INCREMENT COMMENT '工单的id',
  `UserId` varchar(255) DEFAULT NULL COMMENT '用户id',
  `RepairManId` varchar(255) NOT NULL DEFAULT '' COMMENT '维修人员id',
  `orderId` varchar(255) NOT NULL DEFAULT '' COMMENT '预约单编号',
  `zzsName` varchar(255) DEFAULT NULL COMMENT '制造商名称',
  `ErrorEquipmentInfo` varchar(255) NOT NULL DEFAULT '',
  `ErrorDescription` longtext COMMENT '错误描述',
  `ErrorPictureUrl` varchar(255) DEFAULT NULL COMMENT '故障图片',
  `SheetStartTime` datetime DEFAULT NULL COMMENT '维修单开始时间',
  `SheetEndTime` varchar(255) DEFAULT NULL COMMENT '工单结束时间',
  `FeedBackInfo` varchar(255) NOT NULL DEFAULT '' COMMENT '反馈信息',
  `SheetAddress` varchar(255) DEFAULT NULL COMMENT '维修地址',
  `Price` float(3,2) DEFAULT NULL COMMENT '维修价格',
  PRIMARY KEY (`SheetsId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

#
# Data for table "tb_repair_sheet"
#

INSERT INTO `tb_repair_sheet` VALUES (1,'1','1','28','小米','32','3232','4242','2018-04-03 00:00:00','2019-4-5 00:04:00','1','大河巷31幢703室',9.99),(2,'2','','','小米','',NULL,NULL,'2018-04-03 18:16:00','2019-4-4 00:04:00','','银杏巷28幢203室',9.99),(3,'2','','',NULL,'',NULL,NULL,'2018-04-08 18:16:00','2019-4-15 00:04:00','','银杏巷21幢408室',NULL);

#
# Structure for table "tb_shop_items"
#

CREATE TABLE `tb_shop_items` (
  `ItemId` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品编号',
  `ItemName` varchar(255) NOT NULL DEFAULT '' COMMENT '商品名称',
  `itemclass` varchar(255) DEFAULT NULL COMMENT '分类',
  `imgurl` varchar(255) DEFAULT NULL COMMENT '商品图片',
  `ItemPrice` float NOT NULL DEFAULT '0' COMMENT '商品单价',
  `ItemUnit` varchar(10) NOT NULL DEFAULT '' COMMENT '单位',
  `ItemSerialNo` varchar(255) NOT NULL DEFAULT '' COMMENT '产品厂家序列号',
  `ItemStock` int(11) NOT NULL DEFAULT '0' COMMENT '商品库存',
  `offerUserId` int(11) DEFAULT NULL COMMENT '供货人id',
  `state` varchar(255) DEFAULT NULL COMMENT '物品状态',
  `description` longtext COMMENT '商家描述',
  `AddTime` datetime DEFAULT NULL COMMENT '上架日期',
  `Address` varchar(255) DEFAULT NULL COMMENT '取货地址',
  `Phone` varchar(255) DEFAULT NULL COMMENT '卖家联系电话',
  PRIMARY KEY (`ItemId`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COMMENT='二手商品表';

#
# Data for table "tb_shop_items"
#

INSERT INTO `tb_shop_items` VALUES (1,'蜡烛','生活用品','img/upload/item/1.gif',111.15,'根','0000001',2,1,'在库','好用的蜡烛','2019-03-11 00:00:00','我','123123'),(2,'衣服','服饰',NULL,50,'件','000005',1,2,'在库',NULL,NULL,NULL,NULL),(3,'蜡','生活',NULL,3,'根','0000003',2,2,'在库',NULL,NULL,NULL,NULL),(5,'罗技/Logitech G903有线','鼠标',NULL,699,'个','123213',1,1,'审核中','产品名称: Logitech/罗技 G903\n\t\n\t\n\t\t品牌: Logitech/罗技\n\t\n\t\n\t\t罗技无线型号: G903\n\t\n\t\n\t\t无线距离: 10m\n\t\n\t\n\t\t无线技术: 2.4GHz\n\t\n\t\n\t\t工作方式: 光电\n\t\n\t\n\t\t按键数: 3个\n\t\n\t\n\t\t光学分辨率: 1600dpi\n\t\n\t\n\t\t滚轮数: 1个\n\t\n\t\n\t\t是否支持人体工程学: 不支持\n\t\n\t\n\t\t成色: 全新\n\t\n\t\n\t\t是否盒装正品: 是\n\t\n\t\n\t\t套餐类型: 官方标配\n\t\n\t\n\t\t毛重: 1\n\t\n\t\n\t\t包装体积: 1\n\t\n\t\n\t\t颜色分类: 全新未拆G903\n\t\n\t\n\t\t<img src=\"/DaheCommunity/plugin/kindeditor/plugins/emoticons/images/12.gif\" border=\"0\" alt=\"\" />','2019-03-18 17:48:57',NULL,'17000000'),(6,'任天堂 Switch nx NS Joy-Con左右手柄 双手柄红蓝灰色奥德赛红色','游戏',NULL,855,'套','128912',1,1,'审核中','品牌: Nintendo/任天堂\n\t\n\t\n\t\t型号: 其他/other\n\t\n\t\n\t\t有无线: 无线\n\t\n\t\n\t\t手柄特性: 震动\n\t\n\t\n\t\t接口类型: 其他\n\t\n\n\n\t\n\t\t\n\t\t\t颜色分类: 黑色 黄色 红蓝色 粉绿色 奥\n\t\t\n\t\n\t\n\t\t<img src=\"/DaheCommunity/plugin/kindeditor/plugins/emoticons/images/0.gif\" border=\"0\" alt=\"\" />','2019-03-18 18:34:29',NULL,'12321321321'),(7,'鼠标垫','鼠标',NULL,890,'个','12312321',1,1,'审核中','<img src=\"/DaheCommunity/plugin/kindeditor/plugins/emoticons/images/20.gif\" border=\"0\" alt=\"\" />','2019-03-18 18:36:04',NULL,'19292919'),(8,'Tajima田岛外热式烙铁头','烙铁',NULL,323,'件','1',1,1,'审核中','','2019-03-18 18:40:13',NULL,'12321321'),(9,'Radius Design Feet Back Ⅱ 圆刷','圆刷',NULL,3333,'个','ZW878511',1,1,'审核中','<img src=\"/DaheCommunity/img/upload/itemDescription/image/20190318/20190318184455_519.png\" alt=\"\" /> <img src=\"/DaheCommunity/plugin/kindeditor/plugins/emoticons/images/10.gif\" border=\"0\" alt=\"\" /><img src=\"/DaheCommunity/plugin/kindeditor/plugins/emoticons/images/0.gif\" border=\"0\" alt=\"\" />','2019-03-18 18:45:19',NULL,'231321321'),(13,'茅台迎宾酒酱香型白酒500ml','酒',NULL,150,'瓶','',2,2,'审核中','好喝的酒<img src=\"/DaheCommunity/plugin/kindeditor/plugins/emoticons/images/13.gif\" border=\"0\" alt=\"\" />','2019-04-25 23:12:33',NULL,'13959988777'),(14,'茅台迎宾酒酱香型白酒500ml','酒',NULL,196,'瓶','',2,2,'审核中','好喝的酒<img src=\"/DaheCommunity/plugin/kindeditor/plugins/emoticons/images/13.gif\" border=\"0\" alt=\"\" />','2019-04-25 23:15:23',NULL,'1855559988'),(15,'小米热水壶','生活用品',NULL,99,'只','XW787878',2,1,'审核中','闲置热水壶一只','2019-04-26 09:55:36',NULL,'139898989'),(16,'热水壶','生活用品',NULL,99,'只','XW787878',2,1,'审核中','闲置热水壶一只','2019-04-26 09:56:02',NULL,'139898989'),(17,'手表','生活用品',NULL,99,'块','ws8199',1,1,'审核中','手表<img src=\"/DaheCommunity/plugin/kindeditor/plugins/emoticons/images/13.gif\" border=\"0\" alt=\"\" /><img src=\"/DaheCommunity/plugin/kindeditor/plugins/emoticons/images/13.gif\" border=\"0\" alt=\"\" />','2019-04-26 09:58:11',NULL,'178579565'),(18,'天王表','生活用品',NULL,128,'只','',1,1,'审核中','闲置天王表一只','2019-04-26 10:01:14',NULL,'1886998998'),(19,'优衣库衣服','','img/upload/item/43d23b31-972f-4907-9daa-df3d7df4decb_O1CN01IhnIEq1ewH2CqzY2F_!!196993935.jpg',199,'件','',1,1,'审核中','','2019-04-26 10:04:13',NULL,''),(20,'优衣库衣服','','img/upload/item/43d23b31-972f-4907-9daa-df3d7df4decb_O1CN01IhnIEq1ewH2CqzY2F_!!196993935.jpg',1,'件','',1,1,'审核中','','2019-04-26 10:04:40',NULL,''),(21,'正版游戏cd','',NULL,1,'盘','',1,1,'审核中','','2019-04-26 10:05:56',NULL,''),(25,'游戏cd 仁王','',NULL,1,'','',2,1,'审核中','','2019-04-26 10:20:09',NULL,''),(26,'游戏cd','',NULL,1,'','',2,1,'审核中','','2019-04-26 10:21:24',NULL,''),(35,'test5','','img/upload/item/43d23b31-972f-4907-9daa-df3d7df4decb_O1CN01IhnIEq1ewH2CqzY2F_!!196993935.jpg',123,'','',12,1,'审核中','','2019-04-26 11:02:59',NULL,'');

#
# Structure for table "tb_shop_items_invoices"
#

CREATE TABLE `tb_shop_items_invoices` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '账单编号',
  `invoiceDate` datetime DEFAULT '0000-00-00 00:00:00' COMMENT '付款时间',
  `userId` varchar(255) NOT NULL DEFAULT '' COMMENT '用户编号',
  `itemId` varchar(255) NOT NULL DEFAULT '' COMMENT '物品编号',
  `itemNumber` varchar(255) DEFAULT NULL COMMENT '物品数量',
  `itemPrice` varchar(255) DEFAULT NULL COMMENT '物品单价',
  `total` varchar(255) NOT NULL DEFAULT '' COMMENT '商品总价',
  `state` varchar(255) DEFAULT NULL COMMENT '订单状态',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='二手市场账单';

#
# Data for table "tb_shop_items_invoices"
#

INSERT INTO `tb_shop_items_invoices` VALUES (3,'2019-04-25 17:41:40','1','5','1',NULL,'699.00','支付完毕');

#
# Structure for table "tb_shop_items_order"
#

CREATE TABLE `tb_shop_items_order` (
  `OrderId` int(11) NOT NULL AUTO_INCREMENT COMMENT '购物车记录编号',
  `ItemId` varchar(255) NOT NULL DEFAULT '' COMMENT '商品编号',
  `UserId` varchar(255) NOT NULL DEFAULT '' COMMENT '用户编号',
  `ItemNumber` int(11) NOT NULL DEFAULT '0' COMMENT '商品数量',
  `OrderDate` datetime DEFAULT NULL COMMENT '加入购物车时间',
  `payStatus` varchar(255) NOT NULL DEFAULT '' COMMENT '支付状态',
  PRIMARY KEY (`OrderId`),
  UNIQUE KEY `ItemId` (`ItemId`,`UserId`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8 COMMENT='商品订单表';

#
# Data for table "tb_shop_items_order"
#

INSERT INTO `tb_shop_items_order` VALUES (16,'9','2',1,'2019-03-19 08:47:05','购物车中'),(18,'1','2',0,NULL,''),(63,'5','1',1,'2019-04-17 20:03:10','购物车中'),(66,'4','1',1,'2019-04-17 20:08:31','购物车中'),(68,'2','1',1,'2019-04-17 20:09:03','购物车中'),(69,'3','1',1,'2019-04-25 21:40:01','购物车中'),(72,'7','1',1,'2019-04-25 22:06:45','购物车中'),(74,'8','1',1,'2019-04-25 22:07:56','购物车中'),(78,'1','1',1,'2019-04-25 22:26:06','购物车中');

#
# Structure for table "tb_shop_review"
#

CREATE TABLE `tb_shop_review` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='评价表';

#
# Data for table "tb_shop_review"
#


#
# Structure for table "tb_system_log"
#

CREATE TABLE `tb_system_log` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='信息系统日志';

#
# Data for table "tb_system_log"
#


#
# Structure for table "tb_users"
#

CREATE TABLE `tb_users` (
  `UserId` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户编号',
  `LoginUserName` varchar(255) NOT NULL DEFAULT '' COMMENT '用户登录名',
  `LoginPassword` varchar(255) NOT NULL DEFAULT '' COMMENT '用户密码',
  `UserPersonName` varchar(255) NOT NULL DEFAULT '' COMMENT '用户真实姓名',
  `UserAuth` varchar(255) NOT NULL DEFAULT '用户' COMMENT '用户权限',
  `UserEmail` varchar(255) DEFAULT '' COMMENT '用户邮箱',
  `UserGender` char(1) NOT NULL DEFAULT '' COMMENT '用户性别',
  `UserPhoneNumber` varchar(255) DEFAULT NULL COMMENT '用户电话号码',
  `UserAddress` varchar(255) DEFAULT NULL COMMENT '用户地址',
  `UserAvatar` varchar(255) DEFAULT NULL COMMENT '用户头像',
  `UserAddTime` datetime DEFAULT NULL COMMENT '用户注册日期',
  `UserMoney` float(16,2) NOT NULL DEFAULT '0.00' COMMENT '账户余额',
  PRIMARY KEY (`UserId`),
  UNIQUE KEY `LoginUserName` (`LoginUserName`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;

#
# Data for table "tb_users"
#

INSERT INTO `tb_users` VALUES (1,'zhangsan','123','张三','用户','zhangsan@qq.com','男',NULL,NULL,'a',NULL,100.20),(2,'lisi','123','李四','用户','lisi@qq.com','男',NULL,NULL,NULL,NULL,0.00),(3,'123','123','123','用户','123@123.com','男','123456','zhongshan',NULL,NULL,0.00),(4,'kenan','123','柯南','维修','123@4343.c','男','123','3333',NULL,NULL,0.00),(5,'cherry','123','樱桃小丸子','维修','78584858@qq.com','女','45887512','',NULL,'2019-04-28 17:47:46',0.00),(24,'zhangsan444','1233213','23432','用户','1516@huh.c','男','123','',NULL,NULL,0.00),(25,'wangwu','123','王五','维修','123@163.c','男','55666622','学院街',NULL,NULL,0.00),(28,'zhaoliu','123','赵六','管理员','123@123.c','男','15561212312','大河巷28幢303室',NULL,'2019-04-05 14:37:46',0.00),(29,'wangmazi','123','','用户','99989@66.c','男','1232321312','',NULL,NULL,0.00),(30,'zhangsan2','123','12516156','用户','8998989@h.c','男','12312321','',NULL,NULL,0.00),(31,'98989','123','123123','用户','3242143@qq.c','男','123213','12321321',NULL,NULL,0.00),(33,'123213','123123','12312321','用户','zhaoliu@163.com','男','132231231151','大河巷26幢102室',NULL,'2019-04-25 14:37:46',0.00),(45,'admin','admin','管理员','管理员','admin@dahe.com','男','156123123794','大河巷31幢102室',NULL,'2019-04-17 17:47:46',0.00),(46,'zhangqi','123','张琪','用户','6662206065@qq.com','男','132648987151','',NULL,NULL,0.00),(47,'liuanfang','123','刘安防','用户','','男','','',NULL,NULL,0.00),(53,'test3','123','跳跳熊','维修','6069897@qq.com','男','123','',NULL,'2019-04-28 15:37:51',0.00),(54,'test4','123','跳跳龙','维修','88555@qq.com','男','1238346','',NULL,'2019-04-28 15:39:14',0.00);

#
# Structure for table "tb_repair_staff_info"
#

CREATE TABLE `tb_repair_staff_info` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '维修人员编号',
  `StaffName` varchar(255) NOT NULL DEFAULT '' COMMENT '员工姓名',
  `LoginName` varchar(255) NOT NULL DEFAULT '' COMMENT '登录名称',
  `Duties` varchar(255) NOT NULL DEFAULT '' COMMENT '维修范围',
  `SpareTime` datetime DEFAULT NULL COMMENT '维修时间开始',
  `NoSpareTime` datetime DEFAULT NULL COMMENT '维修时间结束',
  `Email` varchar(255) DEFAULT NULL COMMENT '电子邮箱',
  `Phone` varchar(13) DEFAULT NULL COMMENT '联系电话',
  `Company` varchar(255) DEFAULT NULL COMMENT '所属公司',
  `state` int(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `userid` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`LoginName`),
  UNIQUE KEY `id` (`Id`),
  KEY `userid` (`userid`),
  CONSTRAINT `tb_repair_staff_info_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `tb_users` (`UserId`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='设备维修人员信息';

#
# Data for table "tb_repair_staff_info"
#

INSERT INTO `tb_repair_staff_info` VALUES (2,'樱桃小丸子','cherry','电工','2000-05-06 00:00:00','2026-09-09 00:00:00',NULL,'13517483633','美屋物业',1,5),(3,'柯南','kenan','电工','2000-05-06 00:00:00','2026-09-09 00:00:00',NULL,'13322383322','爱屋及乌物业',1,4),(5,'跳跳龙','test4','管道工','2019-04-28 15:38:59','2019-04-28 15:38:59','88555@qq.com','1238346','美物物业',1,54),(1,'王五','wangwu','电工','2000-12-01 00:00:00','2022-01-15 00:00:00','132456@15.c','13517483633','美屋物业',1,25);

#
# View "messagea"
#

CREATE
  ALGORITHM = UNDEFINED
  VIEW `messagea`
  AS
  SELECT
    `tb_dialog`.`Id`, `tb_dialog`.`beginTime`, `tb_dialog`.`diaguser`, `tb_users`.`UserPersonName`
  FROM
    (`tb_dialog`
      JOIN `tb_users`)
  WHERE
    (`tb_users`.`UserId` = `tb_dialog`.`diaguser`);

#
# View "messageb"
#

CREATE
  ALGORITHM = UNDEFINED
  VIEW `messageb`
  AS
  SELECT
    `tb_dialog`.`Id`, `tb_dialog`.`contactUserId`, `tb_users`.`UserPersonName`
  FROM
    (`tb_dialog`
      JOIN `tb_users`)
  WHERE
    (`tb_users`.`UserId` = `tb_dialog`.`contactUserId`);

#
# View "messagemain"
#

CREATE
  ALGORITHM = UNDEFINED
  VIEW `messagemain`
  AS
  SELECT
    `messagea`.`Id` AS 'id',
    `messagea`.`beginTime` AS 'begintime',
    `messagea`.`diaguser`,
    `messagea`.`UserPersonName` AS 'userpersonname',
    `messageb`.`contactUserId` AS 'contactuserid',
    `messageb`.`UserPersonName` AS 'userpersonname2'
  FROM
    (`messagea`
      JOIN `messageb` ON ((`messageb`.`Id` = `messagea`.`Id`)));

#
# View "view_shop_invoice"
#

CREATE
  ALGORITHM = UNDEFINED
  VIEW `view_shop_invoice`
  AS
  SELECT
    `tb_shop_items_invoices`.`Id`,
    `tb_shop_items_invoices`.`userId` AS 'userid',
    `tb_shop_items_invoices`.`invoiceDate`,
    `tb_shop_items`.`ItemId` AS 'itemId',
    `tb_shop_items`.`ItemName`,
    `tb_shop_items`.`offerUserId`,
    `tb_shop_items_invoices`.`itemNumber`,
    `tb_shop_items_invoices`.`total`,
    `tb_shop_items_invoices`.`state`
  FROM
    (`tb_shop_items_invoices`
      LEFT JOIN `tb_shop_items` ON ((`tb_shop_items`.`ItemId` = `tb_shop_items_invoices`.`itemId`)));

#
# View "新视图2"
#

CREATE
  ALGORITHM = UNDEFINED
  VIEW `新视图2`
  AS
  SELECT
    `tb_shop_items_invoices`.`Id` AS 'id',
    `tb_shop_items_invoices`.`invoiceDate`,
    `tb_shop_items_invoices`.`userId`,
    `tb_shop_items`.`ItemId` AS 'itemId',
    `tb_shop_items_invoices`.`total`,
    `tb_shop_items_invoices`.`itemNumber`,
    `tb_shop_items_invoices`.`state`,
    `tb_shop_items`.`ItemName`,
    `tb_shop_items_invoices`.`itemPrice` AS 'ItemPrice'
  FROM
    (`tb_shop_items_invoices`
      JOIN `tb_shop_items`)
  WHERE
    (`tb_shop_items`.`ItemId` = `tb_shop_items_invoices`.`itemId`);
