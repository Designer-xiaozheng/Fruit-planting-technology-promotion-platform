DROP TABLE IF EXISTS `auth`;
CREATE TABLE `auth` (
  `auth_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '授权ID：',
  `user_group` varchar(64) DEFAULT NULL COMMENT '用户组：',
  `mod_name` varchar(64) DEFAULT NULL COMMENT '模块名：',
  `table_name` varchar(64) DEFAULT NULL COMMENT '表名：',
  `page_title` varchar(255) DEFAULT NULL COMMENT '页面标题：',
  `path` varchar(255) DEFAULT NULL COMMENT '路由路径：',
  `position` varchar(32) DEFAULT NULL COMMENT '位置：',
  `mode` varchar(32) NOT NULL DEFAULT '_blank' COMMENT '跳转方式：',
  `add` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否可增加：',
  `del` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否可删除：',
  `set` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否可修改：',
  `get` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否可查看：',
  `field_add` text COMMENT '添加字段：',
  `field_set` text COMMENT '修改字段：',
  `field_get` text COMMENT '查询字段：',
  `table_nav_name` varchar(500) DEFAULT NULL COMMENT '跨表导航名称：',
  `table_nav` varchar(500) DEFAULT NULL COMMENT '跨表导航：',
  `option` text COMMENT '配置：',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  PRIMARY KEY (`auth_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户权限管理';
DROP TABLE IF EXISTS `upload`;
CREATE TABLE `upload` (
  `upload_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '上传ID',
  `name` varchar(64) DEFAULT NULL COMMENT '文件名',
  `path` varchar(255) DEFAULT NULL COMMENT '访问路径',
  `file` varchar(255) DEFAULT NULL COMMENT '文件路径',
  `display` varchar(255) DEFAULT NULL COMMENT '显示顺序',
  `father_id` int(11) DEFAULT '0' COMMENT '父级ID',
  `dir` varchar(255) DEFAULT NULL COMMENT '文件夹',
  `type` varchar(32) DEFAULT NULL COMMENT '文件类型',
  PRIMARY KEY (`upload_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='文件上传';
insert into `upload` values ('1','movie.mp4','/upload/movie.mp4','',null,'0',null,'video');
DROP TABLE IF EXISTS `user_group`;
CREATE TABLE `user_group` (
  `group_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组ID：[0,8388607]',
  `display` smallint(4) unsigned NOT NULL DEFAULT '100' COMMENT '显示顺序：[0,1000]',
  `name` varchar(16) NOT NULL DEFAULT '' COMMENT '名称：[0,16]',
  `description` varchar(255) DEFAULT NULL COMMENT '描述：[0,255]描述该用户组的特点或权限范围',
  `source_table` varchar(255) DEFAULT NULL COMMENT '来源表：',
  `source_field` varchar(255) DEFAULT NULL COMMENT '来源字段：',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '来源ID：',
  `register` smallint(1) unsigned DEFAULT '0' COMMENT '注册位置:',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  PRIMARY KEY (`group_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户组：用于用户前端身份和鉴权';
DROP TABLE IF EXISTS `access_token`;
CREATE TABLE `access_token` (
  `token_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '临时访问牌ID',
  `token` varchar(64) DEFAULT NULL COMMENT '临时访问牌',
  `info` text,
  `maxage` int(2) NOT NULL DEFAULT '2' COMMENT '最大寿命：默认2小时',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户编号:',
  PRIMARY KEY (`token_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='登陆访问时长';
insert into `access_token` values ('57','5accf85cb6a7f06f0aa2968deadaec1b',null,'2','2023-04-28 18:21:49.0','2023-04-28 18:21:49.0','1');
insert into `access_token` values ('58','46ff1d4d07714f046ba07b34bffe0af9',null,'2','2023-04-28 18:21:49.0','2023-04-28 18:21:49.0','1');
insert into `access_token` values ('59','ed9d6cba9826fda1beafcd9326be7a86',null,'2','2023-04-28 18:21:49.0','2023-04-28 18:21:49.0','1');
insert into `access_token` values ('60','c99763c1833ea0785d9e2b81da3fd28f',null,'2','2023-04-28 18:21:49.0','2023-04-28 18:21:49.0','1');
insert into `access_token` values ('61','33fbfaccd6d1cb9143e4129bd919d4b0',null,'2','2023-04-28 18:21:49.0','2023-04-28 18:21:49.0','1');
insert into `access_token` values ('62','493e13da5f293ba67a56a0fe3e1fa6cf',null,'2','2023-04-28 18:21:49.0','2023-04-28 18:21:49.0','1');
insert into `access_token` values ('63','c4b48e9e2160db09c703041a8fee0a1f',null,'2','2023-04-28 18:21:49.0','2023-04-28 18:21:49.0','1');
insert into `access_token` values ('64','d13cdaefd3823c360c959a02a262f71d',null,'2','2023-04-28 18:21:49.0','2023-04-28 18:21:49.0','1');
insert into `access_token` values ('65','6c6ff426fd77ea5a2025ce5ed2e42c8a',null,'2','2023-04-28 18:21:49.0','2023-04-28 18:21:49.0','1');
insert into `access_token` values ('66','80930065a61ffcdd5cbb75f60932973c',null,'2','2023-04-28 18:21:49.0','2023-04-28 18:21:49.0','1');
insert into `access_token` values ('67','94114763cf2e3b020495d8a27096d4ef',null,'2','2023-04-28 18:21:49.0','2023-04-28 18:21:49.0','1');
insert into `access_token` values ('68','761052c551c97c9317bc3aa475c85b84',null,'2','2023-04-28 18:21:49.0','2023-04-28 18:21:49.0','1');
insert into `access_token` values ('69','7c44ef14131a0ba7c16aa16cef104065',null,'2','2023-04-28 18:21:49.0','2023-04-28 18:21:49.0','1');
insert into `access_token` values ('70','96380f3d9542c80d04bdade1cf7635a5',null,'2','2023-04-28 18:21:49.0','2023-04-28 18:21:49.0','1');
insert into `access_token` values ('71','bfdc7acfcbf5763fda81945b60961222',null,'2','2023-04-28 18:21:49.0','2023-04-28 18:21:49.0','1');
insert into `access_token` values ('72','170a598e51ae8ae2badde20a42fe171d',null,'2','2023-04-28 18:21:49.0','2023-04-28 18:21:49.0','1');
insert into `access_token` values ('73','c82c357488c75926a92d8a9608d4b367',null,'2','2023-04-28 18:21:49.0','2023-04-28 18:21:49.0','1');
insert into `access_token` values ('74','4d35290c023f407a820f37dbbb1ceb09',null,'2','2023-04-28 18:21:49.0','2023-04-28 18:21:49.0','1');
insert into `access_token` values ('75','8d19162776682b695c0f62f3c7a92fec',null,'2','2023-04-28 18:21:49.0','2023-04-28 18:21:49.0','1');
insert into `access_token` values ('76','a7ea2cdc9a2be179e19200e593ad5a69',null,'2','2023-04-28 18:21:49.0','2023-04-28 18:21:49.0','1');
insert into `access_token` values ('77','c79a554f9832adc01f19682c5d576bc4',null,'2','2023-04-28 18:21:49.0','2023-04-28 18:21:49.0','1');
insert into `access_token` values ('78','1c7d95001fa09951a679841c8100ad1f',null,'2','2023-04-28 18:21:49.0','2023-04-28 18:21:49.0','1');
insert into `access_token` values ('79','776da1bcdd01ddb3cbf0a37fa13fc5b0',null,'2','2023-04-28 18:21:49.0','2023-04-28 18:21:49.0','1');
insert into `access_token` values ('80','d336e88e57c329d0166931292c1fac41',null,'2','2023-04-28 18:21:49.0','2023-04-28 18:21:49.0','1');
insert into `access_token` values ('81','37a40f526a6c82fc6110b512802d35bf',null,'2','2023-04-28 18:21:49.0','2023-04-28 18:21:49.0','1');
insert into `access_token` values ('82','691ad331771f4109206d58aeee572371',null,'2','2023-04-28 18:21:49.0','2023-04-28 18:21:49.0','1');
insert into `access_token` values ('83','9942e458886219960d3344b4a6a6fbec',null,'2','2023-04-28 18:21:49.0','2023-04-28 18:21:49.0','1');
insert into `access_token` values ('84','e9939a8b7ccf9f548f0bbb5664981f96',null,'2','2023-04-28 18:21:49.0','2023-04-28 18:21:49.0','1');
insert into `access_token` values ('85','f5b27912060d1909bef61fab9d96faae',null,'2','2023-04-28 18:21:49.0','2023-04-28 18:21:49.0','1');
insert into `access_token` values ('86','7c5888682f1d449eb1b62f0054a79fbf',null,'2','2023-04-28 18:21:49.0','2023-04-28 18:21:49.0','1');
insert into `access_token` values ('87','00dfdc6ac21c4a9da80fd71c990764d1',null,'2','2023-04-28 18:21:49.0','2023-04-28 18:21:49.0','1');
insert into `access_token` values ('88','3cce592bc72840ab932ce96d85a194da',null,'2','2023-04-28 18:21:49.0','2023-04-28 18:21:49.0','1');
insert into `access_token` values ('89','43fdaa989a644ad683ef4b4d488e8629',null,'2','2023-04-28 18:21:49.0','2023-04-28 18:21:49.0','1');
insert into `access_token` values ('90','d6a3cecadacff0dbd6b43b25372cc2a2',null,'2','2023-04-28 18:21:49.0','2023-04-28 18:21:49.0','1');
insert into `access_token` values ('91','5570bc5b07b3589f4ef8553bd46eb0d1',null,'2','2023-04-28 18:21:49.0','2023-04-28 18:21:49.0','1');
insert into `access_token` values ('92','5570bc5b07b3589f4ef8553bd46eb0d1',null,'2','2023-04-28 18:21:49.0','2023-04-28 18:21:49.0','1');
insert into `access_token` values ('93','26c553bd2ee2ab6605d18dfd310d85f9',null,'2','2023-04-28 18:21:49.0','2023-04-28 18:21:49.0','1');
insert into `access_token` values ('94','3fd52f81236ed2c37ff91a6696d4e47a',null,'2','2023-04-28 18:21:49.0','2023-04-28 18:21:49.0','1');
insert into `access_token` values ('95','893332e9ee67d60d8312b3700c58a359',null,'2','2023-04-28 18:21:49.0','2023-04-28 18:21:49.0','1');
insert into `access_token` values ('96','b7844068ade535b2e517df4a40948703',null,'2','2023-04-28 18:21:49.0','2023-04-28 18:21:49.0','1');
insert into `access_token` values ('97','179b37a5e1893c3af6b946bd5a1c8625',null,'2','2023-04-28 18:21:49.0','2023-04-28 18:21:49.0','1');
insert into `access_token` values ('98','3a47b8a040a83ebbc9194cb255dc668c',null,'2','2023-04-28 18:21:49.0','2023-04-28 18:21:49.0','1');
insert into `access_token` values ('99','afa60196afb77dcc2b520ed13a817560',null,'2','2023-04-28 18:21:49.0','2023-04-28 18:21:49.0','1');
insert into `access_token` values ('100','7fc6d9b324f8c0a3a1784d04ef132692',null,'2','2023-04-28 18:21:49.0','2023-04-28 18:21:49.0','1');
insert into `access_token` values ('101','84e31b291f2bde6b7ceb27af5fe8eee3',null,'2','2023-04-28 18:21:49.0','2023-04-28 18:21:49.0','1');
DROP TABLE IF EXISTS `hits`;
CREATE TABLE `hits` (
  `hits_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '点赞ID：',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '点赞人：',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  `source_table` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '来源表：',
  `source_field` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '来源字段：',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '来源ID：',
  PRIMARY KEY (`hits_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC COMMENT='用户点击';
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID：[0,8388607]用户获取其他与用户相关的数据',
  `state` smallint(1) unsigned NOT NULL DEFAULT '1' COMMENT '账户状态：[0,10](1可用|2异常|3已冻结|4已注销)',
  `user_group` varchar(32) DEFAULT NULL COMMENT '所在用户组：[0,32767]决定用户身份和权限',
  `login_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '上次登录时间：',
  `phone` varchar(11) DEFAULT NULL COMMENT '手机号码：[0,11]用户的手机号码，用于找回密码时或登录时',
  `phone_state` smallint(1) unsigned NOT NULL DEFAULT '0' COMMENT '手机认证：[0,1](0未认证|1审核中|2已认证)',
  `username` varchar(16) NOT NULL DEFAULT '' COMMENT '用户名：[0,16]用户登录时所用的账户名称',
  `nickname` varchar(16) DEFAULT '' COMMENT '昵称：[0,16]',
  `password` varchar(64) NOT NULL DEFAULT '' COMMENT '密码：[0,32]用户登录所需的密码，由6-16位数字或英文组成',
  `email` varchar(64) DEFAULT '' COMMENT '邮箱：[0,64]用户的邮箱，用于找回密码时或登录时',
  `email_state` smallint(1) unsigned NOT NULL DEFAULT '0' COMMENT '邮箱认证：[0,1](0未认证|1审核中|2已认证)',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像地址：[0,255]',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户账户：用于保存用户登录信息';
insert into `user` values ('1','1','管理员','2023-04-07 16:29:25.0',null,'0','admin','admin','bfd59291e825b5f2bbf1eb76569f8fe7','','0','/api/upload/admin_avatar.jpg','2023-04-28 17:35:13.0');
DROP TABLE IF EXISTS `ordinary_users`;
CREATE TABLE `ordinary_users`(ordinary_users_id int(11) NOT NULL AUTO_INCREMENT COMMENT '普通用户ID',
`user_name` varchar(64) comment '用户姓名',
`user_gender` varchar(64) comment '用户性别',
`user_age` varchar(64) comment '用户年龄',
`examine_state` varchar(16) DEFAULT '已通过' NOT NULL comment '审核状态',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`user_id` int(11) DEFAULT '0' NOT NULL comment '用户ID',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (ordinary_users_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '普通用户';

DROP TABLE IF EXISTS `item_information`;
CREATE TABLE `item_information`(item_information_id int(11) NOT NULL AUTO_INCREMENT COMMENT '物品信息ID',
`serial_number` varchar(64) comment '物品编号',
`item_name` varchar(64) comment '物品名称',
`storage_warehouse` varchar(64) comment '储存仓库',
`item_storage_location` varchar(64) comment '物品库位',
`number_of_items` int(11) DEFAULT 0 comment '物品数量',
`item_image` varchar(255) comment '物品图片',
`item_description` text comment '物品描述',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (item_information_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '物品信息';
insert into `item_information` values (1,'物品编号1','物品名称1','储存仓库1','物品库位1',1,'/api/upload/1573868031610716161.jpg','物品描述1',0,'2023-04-25 16:10:01','2023-04-25 16:10:01');
insert into `item_information` values (2,'物品编号2','物品名称2','储存仓库2','物品库位2',2,'/api/upload/1573867851146592256.jpg','物品描述2',0,'2023-04-25 16:10:01','2023-04-25 16:10:01');
insert into `item_information` values (3,'物品编号3','物品名称3','储存仓库3','物品库位3',3,'/api/upload/1574324768247644161.jpg','物品描述3',0,'2023-04-25 16:10:01','2023-04-25 16:10:01');
insert into `item_information` values (4,'物品编号4','物品名称4','储存仓库4','物品库位4',4,'/api/upload/1573867934198005760.jpg','物品描述4',0,'2023-04-25 16:10:01','2023-04-25 16:10:01');
insert into `item_information` values (5,'物品编号5','物品名称5','储存仓库5','物品库位5',5,'/api/upload/1574324930663677953.jpg','物品描述5',0,'2023-04-25 16:10:01','2023-04-25 16:10:01');
insert into `item_information` values (6,'物品编号6','物品名称6','储存仓库6','物品库位6',6,'/api/upload/1573867692425740288.jpg','物品描述6',0,'2023-04-25 16:10:01','2023-04-25 16:10:01');
insert into `item_information` values (7,'物品编号7','物品名称7','储存仓库7','物品库位7',7,'/api/upload/1573868132919934977.jpg','物品描述7',0,'2023-04-25 16:10:01','2023-04-25 16:10:01');
insert into `item_information` values (8,'物品编号8','物品名称8','储存仓库8','物品库位8',8,'/api/upload/1574324865966538752.jpg','物品描述8',0,'2023-04-25 16:10:01','2023-04-25 16:10:01');

DROP TABLE IF EXISTS `personnel_information`;
CREATE TABLE `personnel_information`(personnel_information_id int(11) NOT NULL AUTO_INCREMENT COMMENT '人员信息ID',
`personnel_name` varchar(64) comment '人员姓名',
`gender_of_personnel` varchar(64) comment '人员性别',
`personnel_id` varchar(64) comment '人员工号',
`personnel_position` varchar(64) comment '人员职务',
`contact_number` varchar(64) comment '联系电话',
`personnel_introduction` text comment '人员介绍',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (personnel_information_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '人员信息';
insert into `personnel_information` values (1,'人员姓名1','人员性别1','人员工号1','人员职务1','联系电话1','人员介绍1',0,'2023-04-25 16:10:01','2023-04-25 16:10:01');
insert into `personnel_information` values (2,'人员姓名2','人员性别2','人员工号2','人员职务2','联系电话2','人员介绍2',0,'2023-04-25 16:10:01','2023-04-25 16:10:01');
insert into `personnel_information` values (3,'人员姓名3','人员性别3','人员工号3','人员职务3','联系电话3','人员介绍3',0,'2023-04-25 16:10:01','2023-04-25 16:10:01');
insert into `personnel_information` values (4,'人员姓名4','人员性别4','人员工号4','人员职务4','联系电话4','人员介绍4',0,'2023-04-25 16:10:01','2023-04-25 16:10:01');
insert into `personnel_information` values (5,'人员姓名5','人员性别5','人员工号5','人员职务5','联系电话5','人员介绍5',0,'2023-04-25 16:10:01','2023-04-25 16:10:01');
insert into `personnel_information` values (6,'人员姓名6','人员性别6','人员工号6','人员职务6','联系电话6','人员介绍6',0,'2023-04-25 16:10:01','2023-04-25 16:10:01');
insert into `personnel_information` values (7,'人员姓名7','人员性别7','人员工号7','人员职务7','联系电话7','人员介绍7',0,'2023-04-25 16:10:01','2023-04-25 16:10:01');
insert into `personnel_information` values (8,'人员姓名8','人员性别8','人员工号8','人员职务8','联系电话8','人员介绍8',0,'2023-04-25 16:10:01','2023-04-25 16:10:01');

DROP TABLE IF EXISTS `vehicle_information`;
CREATE TABLE `vehicle_information`(vehicle_information_id int(11) NOT NULL AUTO_INCREMENT COMMENT '车辆信息ID',
`vehicle_number` varchar(64) comment '车辆编号',
`vehicle_name` varchar(64) comment '车辆名称',
`vehicle_status` varchar(64) comment '车辆状态',
`vehicle_image` varchar(255) comment '车辆图片',
`vehicle_description` text comment '车辆描述',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (vehicle_information_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '车辆信息';
insert into `vehicle_information` values (1,'车辆编号1','车辆名称1','车辆状态1','/api/upload/1609034163279626240.jpg','车辆描述1',0,'2023-04-25 16:10:01','2023-04-25 16:10:01');
insert into `vehicle_information` values (2,'车辆编号2','车辆名称2','车辆状态2','/api/upload/1609034072695242753.jpg','车辆描述2',0,'2023-04-25 16:10:01','2023-04-25 16:10:01');
insert into `vehicle_information` values (3,'车辆编号3','车辆名称3','车辆状态3','/api/upload/1609034027602280449.jpg','车辆描述3',0,'2023-04-25 16:10:01','2023-04-25 16:10:01');
insert into `vehicle_information` values (4,'车辆编号4','车辆名称4','车辆状态4','/api/upload/1609034234368884737.jpg','车辆描述4',0,'2023-04-25 16:10:01','2023-04-25 16:10:01');
insert into `vehicle_information` values (5,'车辆编号5','车辆名称5','车辆状态5','/api/upload/1609034199434526721.jpg','车辆描述5',0,'2023-04-25 16:10:01','2023-04-25 16:10:01');
insert into `vehicle_information` values (6,'车辆编号6','车辆名称6','车辆状态6','/api/upload/1609034107281473537.jpg','车辆描述6',0,'2023-04-25 16:10:01','2023-04-25 16:10:01');
insert into `vehicle_information` values (7,'车辆编号7','车辆名称7','车辆状态7','/api/upload/1609034272901955585.jpg','车辆描述7',0,'2023-04-25 16:10:01','2023-04-25 16:10:01');
insert into `vehicle_information` values (8,'车辆编号8','车辆名称8','车辆状态8','/api/upload/1609033980336668672.jpg','车辆描述8',0,'2023-04-25 16:10:01','2023-04-25 16:10:01');

DROP TABLE IF EXISTS `order_information`;
CREATE TABLE `order_information`(order_information_id int(11) NOT NULL AUTO_INCREMENT COMMENT '订单信息ID',
`order_number` varchar(64) comment '订单编号',
`user_information` int(11) DEFAULT 0 comment '用户信息',
`user_name` varchar(64) comment '用户姓名',
`contact_number` varchar(64) comment '联系电话',
`sending_items` varchar(64) comment '寄送物品',
`number_of_items` int(11) DEFAULT 0 comment '物品数量',
`addressee` varchar(64) comment '收件人',
`receiving_phone_number` varchar(64) comment '收件电话',
`shipping_address` text comment '收件地址',
`delivery_price` varchar(64) comment '寄送价格',
`order_status` varchar(64) comment '订单状态',
`pay_state` varchar(16) DEFAULT '未支付' NOT NULL comment '支付状态',
`pay_type` varchar(16) DEFAULT '' comment '支付类型: 微信、支付宝、网银',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (order_information_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '订单信息';
insert into `order_information` values (1,'订单编号1',0,'用户姓名1','联系电话1','寄送物品1',1,'收件人1','收件电话1','收件地址1','寄送价格1','订单状态1','未支付','支付宝',0,'2023-04-25 16:10:01','2023-04-25 16:10:01');
insert into `order_information` values (2,'订单编号2',0,'用户姓名2','联系电话2','寄送物品2',2,'收件人2','收件电话2','收件地址2','寄送价格2','订单状态2','未支付','支付宝',0,'2023-04-25 16:10:01','2023-04-25 16:10:01');
insert into `order_information` values (3,'订单编号3',0,'用户姓名3','联系电话3','寄送物品3',3,'收件人3','收件电话3','收件地址3','寄送价格3','订单状态3','未支付','支付宝',0,'2023-04-25 16:10:01','2023-04-25 16:10:01');
insert into `order_information` values (4,'订单编号4',0,'用户姓名4','联系电话4','寄送物品4',4,'收件人4','收件电话4','收件地址4','寄送价格4','订单状态4','未支付','支付宝',0,'2023-04-25 16:10:01','2023-04-25 16:10:01');
insert into `order_information` values (5,'订单编号5',0,'用户姓名5','联系电话5','寄送物品5',5,'收件人5','收件电话5','收件地址5','寄送价格5','订单状态5','未支付','支付宝',0,'2023-04-25 16:10:01','2023-04-25 16:10:01');
insert into `order_information` values (6,'订单编号6',0,'用户姓名6','联系电话6','寄送物品6',6,'收件人6','收件电话6','收件地址6','寄送价格6','订单状态6','未支付','支付宝',0,'2023-04-25 16:10:01','2023-04-25 16:10:01');
insert into `order_information` values (7,'订单编号7',0,'用户姓名7','联系电话7','寄送物品7',7,'收件人7','收件电话7','收件地址7','寄送价格7','订单状态7','未支付','支付宝',0,'2023-04-25 16:10:01','2023-04-25 16:10:01');
insert into `order_information` values (8,'订单编号8',0,'用户姓名8','联系电话8','寄送物品8',8,'收件人8','收件电话8','收件地址8','寄送价格8','订单状态8','未支付','支付宝',0,'2023-04-25 16:10:01','2023-04-25 16:10:01');

DROP TABLE IF EXISTS `logistics_information`;
CREATE TABLE `logistics_information`(logistics_information_id int(11) NOT NULL AUTO_INCREMENT COMMENT '物流信息ID',
`order_number` varchar(64) comment '订单编号',
`user_information` int(11) DEFAULT 0 comment '用户信息',
`user_name` varchar(64) comment '用户姓名',
`contact_number` varchar(64) comment '联系电话',
`sending_items` varchar(64) comment '寄送物品',
`number_of_items` varchar(64) comment '物品数量',
`addressee` varchar(64) comment '收件人',
`receiving_phone_number` varchar(64) comment '收件电话',
`shipping_address` text comment '收件地址',
`vehicle_name` varchar(64) comment '车辆名称',
`logistics_description` text comment '物流描述',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (logistics_information_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '物流信息';
insert into `logistics_information` values (1,'订单编号1',0,'用户姓名1','联系电话1','寄送物品1','物品数量1','收件人1','收件电话1','收件地址1','车辆名称1','物流描述1',0,'2023-04-25 16:10:01','2023-04-25 16:10:01');
insert into `logistics_information` values (2,'订单编号2',0,'用户姓名2','联系电话2','寄送物品2','物品数量2','收件人2','收件电话2','收件地址2','车辆名称2','物流描述2',0,'2023-04-25 16:10:01','2023-04-25 16:10:01');
insert into `logistics_information` values (3,'订单编号3',0,'用户姓名3','联系电话3','寄送物品3','物品数量3','收件人3','收件电话3','收件地址3','车辆名称3','物流描述3',0,'2023-04-25 16:10:01','2023-04-25 16:10:01');
insert into `logistics_information` values (4,'订单编号4',0,'用户姓名4','联系电话4','寄送物品4','物品数量4','收件人4','收件电话4','收件地址4','车辆名称4','物流描述4',0,'2023-04-25 16:10:01','2023-04-25 16:10:01');
insert into `logistics_information` values (5,'订单编号5',0,'用户姓名5','联系电话5','寄送物品5','物品数量5','收件人5','收件电话5','收件地址5','车辆名称5','物流描述5',0,'2023-04-25 16:10:01','2023-04-25 16:10:01');
insert into `logistics_information` values (6,'订单编号6',0,'用户姓名6','联系电话6','寄送物品6','物品数量6','收件人6','收件电话6','收件地址6','车辆名称6','物流描述6',0,'2023-04-25 16:10:01','2023-04-25 16:10:01');
insert into `logistics_information` values (7,'订单编号7',0,'用户姓名7','联系电话7','寄送物品7','物品数量7','收件人7','收件电话7','收件地址7','车辆名称7','物流描述7',0,'2023-04-25 16:10:01','2023-04-25 16:10:01');
insert into `logistics_information` values (8,'订单编号8',0,'用户姓名8','联系电话8','寄送物品8','物品数量8','收件人8','收件电话8','收件地址8','车辆名称8','物流描述8',0,'2023-04-25 16:10:01','2023-04-25 16:10:01');

DROP TABLE IF EXISTS `announcement_information`;
CREATE TABLE `announcement_information`(announcement_information_id int(11) NOT NULL AUTO_INCREMENT COMMENT '公告信息ID',
`announcement_number` varchar(64) comment '公告编号',
`announcement_title` varchar(64) comment '公告标题',
`release_date` date comment '发布日期',
`announcement_attachment` varchar(255) comment '公告附件',
`announcement_content` text comment '公告内容',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (announcement_information_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '公告信息';
insert into `announcement_information` values (1,'公告编号1','公告标题1','2023-04-25','','公告内容1',0,'2023-04-25 16:10:01','2023-04-25 16:10:01');
insert into `announcement_information` values (2,'公告编号2','公告标题2','2023-04-25','','公告内容2',0,'2023-04-25 16:10:01','2023-04-25 16:10:01');
insert into `announcement_information` values (3,'公告编号3','公告标题3','2023-04-25','','公告内容3',0,'2023-04-25 16:10:01','2023-04-25 16:10:01');
insert into `announcement_information` values (4,'公告编号4','公告标题4','2023-04-25','','公告内容4',0,'2023-04-25 16:10:01','2023-04-25 16:10:01');
insert into `announcement_information` values (5,'公告编号5','公告标题5','2023-04-25','','公告内容5',0,'2023-04-25 16:10:01','2023-04-25 16:10:01');
insert into `announcement_information` values (6,'公告编号6','公告标题6','2023-04-25','','公告内容6',0,'2023-04-25 16:10:01','2023-04-25 16:10:01');
insert into `announcement_information` values (7,'公告编号7','公告标题7','2023-04-25','','公告内容7',0,'2023-04-25 16:10:01','2023-04-25 16:10:01');
insert into `announcement_information` values (8,'公告编号8','公告标题8','2023-04-25','','公告内容8',0,'2023-04-25 16:10:01','2023-04-25 16:10:01');

DROP TABLE IF EXISTS `information`;
CREATE TABLE `information`(information_id int(11) NOT NULL AUTO_INCREMENT COMMENT '资讯信息ID',
`information_number` varchar(64) comment '资讯编号',
`information_title` varchar(64) comment '资讯标题',
`release_date` date comment '发布日期',
`information_pictures` varchar(255) comment '资讯图片',
`information_content` text comment '资讯内容',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (information_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '资讯信息';
insert into `information` values (1,'资讯编号1','资讯标题1','2023-04-25','/api/upload/1605383598666416128.jpg','资讯内容1',0,'2023-04-25 16:10:02','2023-04-25 16:10:02');
insert into `information` values (2,'资讯编号2','资讯标题2','2023-04-25','/api/upload/1605383752110833664.jpg','资讯内容2',0,'2023-04-25 16:10:02','2023-04-25 16:10:02');
insert into `information` values (3,'资讯编号3','资讯标题3','2023-04-25','/api/upload/1605383480412209152.jpg','资讯内容3',0,'2023-04-25 16:10:02','2023-04-25 16:10:02');
insert into `information` values (4,'资讯编号4','资讯标题4','2023-04-25','/api/upload/1605383529531703297.jpg','资讯内容4',0,'2023-04-25 16:10:02','2023-04-25 16:10:02');
insert into `information` values (5,'资讯编号5','资讯标题5','2023-04-25','/api/upload/1605383363164635137.jpg','资讯内容5',0,'2023-04-25 16:10:02','2023-04-25 16:10:02');
insert into `information` values (6,'资讯编号6','资讯标题6','2023-04-25','/api/upload/1605383431808614401.jpg','资讯内容6',0,'2023-04-25 16:10:02','2023-04-25 16:10:02');
insert into `information` values (7,'资讯编号7','资讯标题7','2023-04-25','/api/upload/1605383857165565952.jpg','资讯内容7',0,'2023-04-25 16:10:02','2023-04-25 16:10:02');
insert into `information` values (8,'资讯编号8','资讯标题8','2023-04-25','/api/upload/1605383309079085056.jpg','资讯内容8',0,'2023-04-25 16:10:02','2023-04-25 16:10:02');

insert into `auth` values ('1','管理员','普通用户','ordinary_users','普通用户','/ordinary_users/table','','_blank','1','1','1','1','user_name,user_gender,user_age','user_name,user_gender,user_age','user_name,user_gender,user_age',null,'0','{}','2023-04-25 16:10:02.0','2023-04-25 16:10:02.0');
insert into `auth` values ('2','管理员','普通用户','ordinary_users','普通用户详情','/ordinary_users/view','','_blank','1','1','1','1','user_name,user_gender,user_age','user_name,user_gender,user_age','user_name,user_gender,user_age',null,'0','{}','2023-04-25 16:10:02.0','2023-04-25 16:10:02.0');
insert into `auth` values ('3','管理员','物品信息','item_information','物品信息','/item_information/table','','_blank','1','1','1','1','serial_number,item_name,storage_warehouse,item_storage_location,number_of_items,item_image,item_description','serial_number,item_name,storage_warehouse,item_storage_location,number_of_items,item_image,item_description','serial_number,item_name,storage_warehouse,item_storage_location,number_of_items,item_image,item_description',null,'0','{"figure":true}','2023-04-25 16:10:02.0','2023-04-25 16:10:02.0');
insert into `auth` values ('4','管理员','物品信息','item_information','物品信息详情','/item_information/view','','_blank','1','1','1','1','serial_number,item_name,storage_warehouse,item_storage_location,number_of_items,item_image,item_description','serial_number,item_name,storage_warehouse,item_storage_location,number_of_items,item_image,item_description','serial_number,item_name,storage_warehouse,item_storage_location,number_of_items,item_image,item_description',null,'0','{}','2023-04-25 16:10:02.0','2023-04-25 16:10:02.0');
insert into `auth` values ('5','管理员','人员信息','personnel_information','人员信息','/personnel_information/table','','_blank','1','1','1','1','personnel_name,gender_of_personnel,personnel_id,personnel_position,contact_number,personnel_introduction','personnel_name,gender_of_personnel,personnel_id,personnel_position,contact_number,personnel_introduction','personnel_name,gender_of_personnel,personnel_id,personnel_position,contact_number,personnel_introduction',null,'0','{}','2023-04-25 16:10:02.0','2023-04-25 16:10:02.0');
insert into `auth` values ('6','管理员','人员信息','personnel_information','人员信息详情','/personnel_information/view','','_blank','1','1','1','1','personnel_name,gender_of_personnel,personnel_id,personnel_position,contact_number,personnel_introduction','personnel_name,gender_of_personnel,personnel_id,personnel_position,contact_number,personnel_introduction','personnel_name,gender_of_personnel,personnel_id,personnel_position,contact_number,personnel_introduction',null,'0','{}','2023-04-25 16:10:02.0','2023-04-25 16:10:02.0');
insert into `auth` values ('7','管理员','车辆信息','vehicle_information','车辆信息','/vehicle_information/table','','_blank','1','1','1','1','vehicle_number,vehicle_name,vehicle_status,vehicle_image,vehicle_description','vehicle_number,vehicle_name,vehicle_status,vehicle_image,vehicle_description','vehicle_number,vehicle_name,vehicle_status,vehicle_image,vehicle_description',null,'0','{"figure":true}','2023-04-25 16:10:02.0','2023-04-25 16:10:02.0');
insert into `auth` values ('8','管理员','车辆信息','vehicle_information','车辆信息详情','/vehicle_information/view','','_blank','1','1','1','1','vehicle_number,vehicle_name,vehicle_status,vehicle_image,vehicle_description','vehicle_number,vehicle_name,vehicle_status,vehicle_image,vehicle_description','vehicle_number,vehicle_name,vehicle_status,vehicle_image,vehicle_description',null,'0','{}','2023-04-25 16:10:02.0','2023-04-25 16:10:02.0');
insert into `auth` values ('9','管理员','订单信息','order_information','订单信息','/order_information/table','','_blank','1','1','1','1','order_number,user_information,user_name,contact_number,sending_items,number_of_items,addressee,receiving_phone_number,shipping_address,delivery_price,order_status','order_number,user_information,user_name,contact_number,sending_items,number_of_items,addressee,receiving_phone_number,shipping_address,delivery_price,order_status','order_number,user_information,user_name,contact_number,sending_items,number_of_items,addressee,receiving_phone_number,shipping_address,delivery_price,order_status',null,'0','{"pay":true}','2023-04-25 16:10:02.0','2023-04-25 16:10:02.0');
insert into `auth` values ('10','管理员','订单信息','order_information','订单信息详情','/order_information/view','','_blank','1','1','1','1','order_number,user_information,user_name,contact_number,sending_items,number_of_items,addressee,receiving_phone_number,shipping_address,delivery_price,order_status','order_number,user_information,user_name,contact_number,sending_items,number_of_items,addressee,receiving_phone_number,shipping_address,delivery_price,order_status','order_number,user_information,user_name,contact_number,sending_items,number_of_items,addressee,receiving_phone_number,shipping_address,delivery_price,order_status',null,'0','{}','2023-04-25 16:10:02.0','2023-04-25 16:10:02.0');
insert into `auth` values ('11','管理员','物流信息','logistics_information','物流信息','/logistics_information/table','','_blank','1','1','1','1','order_number,user_information,user_name,contact_number,sending_items,number_of_items,addressee,receiving_phone_number,shipping_address,vehicle_name,logistics_description','order_number,user_information,user_name,contact_number,sending_items,number_of_items,addressee,receiving_phone_number,shipping_address,vehicle_name,logistics_description','order_number,user_information,user_name,contact_number,sending_items,number_of_items,addressee,receiving_phone_number,shipping_address,vehicle_name,logistics_description',null,'0','{}','2023-04-25 16:10:02.0','2023-04-25 16:10:02.0');
insert into `auth` values ('12','管理员','物流信息','logistics_information','物流信息详情','/logistics_information/view','','_blank','1','1','1','1','order_number,user_information,user_name,contact_number,sending_items,number_of_items,addressee,receiving_phone_number,shipping_address,vehicle_name,logistics_description','order_number,user_information,user_name,contact_number,sending_items,number_of_items,addressee,receiving_phone_number,shipping_address,vehicle_name,logistics_description','order_number,user_information,user_name,contact_number,sending_items,number_of_items,addressee,receiving_phone_number,shipping_address,vehicle_name,logistics_description',null,'0','{}','2023-04-25 16:10:02.0','2023-04-25 16:10:02.0');
insert into `auth` values ('13','管理员','公告信息','announcement_information','公告信息','/announcement_information/table','','_blank','1','1','1','1','announcement_number,announcement_title,release_date,announcement_attachment,announcement_content','announcement_number,announcement_title,release_date,announcement_attachment,announcement_content','announcement_number,announcement_title,release_date,announcement_attachment,announcement_content',null,'0','{}','2023-04-25 16:10:02.0','2023-04-25 16:10:02.0');
insert into `auth` values ('14','管理员','公告信息','announcement_information','公告信息详情','/announcement_information/view','','_blank','1','1','1','1','announcement_number,announcement_title,release_date,announcement_attachment,announcement_content','announcement_number,announcement_title,release_date,announcement_attachment,announcement_content','announcement_number,announcement_title,release_date,announcement_attachment,announcement_content',null,'0','{}','2023-04-25 16:10:02.0','2023-04-25 16:10:02.0');
insert into `auth` values ('15','管理员','资讯信息','information','资讯信息','/information/table','','_blank','1','1','1','1','information_number,information_title,release_date,information_pictures,information_content','information_number,information_title,release_date,information_pictures,information_content','information_number,information_title,release_date,information_pictures,information_content',null,'0','{}','2023-04-25 16:10:02.0','2023-04-25 16:10:02.0');
insert into `auth` values ('16','管理员','资讯信息','information','资讯信息详情','/information/view','','_blank','1','1','1','1','information_number,information_title,release_date,information_pictures,information_content','information_number,information_title,release_date,information_pictures,information_content','information_number,information_title,release_date,information_pictures,information_content',null,'0','{}','2023-04-25 16:10:02.0','2023-04-25 16:10:02.0');
insert into `auth` values ('17','管理员','评论','comment','评论列表','/comment/table','','_blank','0','0','0','0','','','',null,'0','{}','2023-04-25 16:10:02.0','2023-04-25 16:10:02.0');
insert into `auth` values ('18','管理员','评论','comment','评论详情','/comment/view','','_blank','0','0','0','0','','','',null,'0','{}','2023-04-25 16:10:02.0','2023-04-25 16:10:02.0');
insert into `auth` values ('19','管理员','评论','comment','我的评论','/comment/list','','_blank','0','0','0','0','','','',null,'0','{}','2023-04-25 16:10:02.0','2023-04-25 16:10:02.0');
insert into `auth` values ('20','管理员','评论','comment','评论详情','/comment/details','','_blank','0','0','0','0','','','',null,'0','{}','2023-04-25 16:10:02.0','2023-04-25 16:10:02.0');
insert into `auth` values ('21','游客','普通用户','ordinary_users','普通用户','/ordinary_users/table','','_blank','1','0','0','0','user_name,user_gender,user_age','user_name,user_gender,user_age','user_name,user_gender,user_age',null,'0','{}','2023-04-25 16:10:02.0','2023-04-25 16:10:02.0');
insert into `auth` values ('22','游客','普通用户','ordinary_users','普通用户详情','/ordinary_users/view','','_blank','1','0','0','0','user_name,user_gender,user_age','user_name,user_gender,user_age','user_name,user_gender,user_age',null,'0','{}','2023-04-25 16:10:02.0','2023-04-25 16:10:02.0');
insert into `auth` values ('23','游客','物品信息','item_information','物品信息','/item_information/table','','_blank','0','0','0','0','serial_number,item_name,storage_warehouse,item_storage_location,number_of_items,item_image,item_description','serial_number,item_name,storage_warehouse,item_storage_location,number_of_items,item_image,item_description','serial_number,item_name,storage_warehouse,item_storage_location,number_of_items,item_image,item_description',null,'0','{"figure":false}','2023-04-25 16:10:02.0','2023-04-25 16:10:02.0');
insert into `auth` values ('24','游客','物品信息','item_information','物品信息详情','/item_information/view','','_blank','0','0','0','0','serial_number,item_name,storage_warehouse,item_storage_location,number_of_items,item_image,item_description','serial_number,item_name,storage_warehouse,item_storage_location,number_of_items,item_image,item_description','serial_number,item_name,storage_warehouse,item_storage_location,number_of_items,item_image,item_description',null,'0','{}','2023-04-25 16:10:02.0','2023-04-25 16:10:02.0');
insert into `auth` values ('25','游客','人员信息','personnel_information','人员信息','/personnel_information/table','','_blank','0','0','0','0','personnel_name,gender_of_personnel,personnel_id,personnel_position,contact_number,personnel_introduction','personnel_name,gender_of_personnel,personnel_id,personnel_position,contact_number,personnel_introduction','personnel_name,gender_of_personnel,personnel_id,personnel_position,contact_number,personnel_introduction',null,'0','{}','2023-04-25 16:10:02.0','2023-04-25 16:10:02.0');
insert into `auth` values ('26','游客','人员信息','personnel_information','人员信息详情','/personnel_information/view','','_blank','0','0','0','0','personnel_name,gender_of_personnel,personnel_id,personnel_position,contact_number,personnel_introduction','personnel_name,gender_of_personnel,personnel_id,personnel_position,contact_number,personnel_introduction','personnel_name,gender_of_personnel,personnel_id,personnel_position,contact_number,personnel_introduction',null,'0','{}','2023-04-25 16:10:02.0','2023-04-25 16:10:02.0');
insert into `auth` values ('27','游客','车辆信息','vehicle_information','车辆信息','/vehicle_information/table','','_blank','0','0','0','0','vehicle_number,vehicle_name,vehicle_status,vehicle_image,vehicle_description','vehicle_number,vehicle_name,vehicle_status,vehicle_image,vehicle_description','vehicle_number,vehicle_name,vehicle_status,vehicle_image,vehicle_description',null,'0','{"figure":false}','2023-04-25 16:10:02.0','2023-04-25 16:10:02.0');
insert into `auth` values ('28','游客','车辆信息','vehicle_information','车辆信息详情','/vehicle_information/view','','_blank','0','0','0','0','vehicle_number,vehicle_name,vehicle_status,vehicle_image,vehicle_description','vehicle_number,vehicle_name,vehicle_status,vehicle_image,vehicle_description','vehicle_number,vehicle_name,vehicle_status,vehicle_image,vehicle_description',null,'0','{}','2023-04-25 16:10:02.0','2023-04-25 16:10:02.0');
insert into `auth` values ('29','游客','订单信息','order_information','订单信息','/order_information/table','','_blank','0','0','0','0','order_number,user_information,user_name,contact_number,sending_items,number_of_items,addressee,receiving_phone_number,shipping_address,delivery_price,order_status','order_number,user_information,user_name,contact_number,sending_items,number_of_items,addressee,receiving_phone_number,shipping_address,delivery_price,order_status','order_number,user_information,user_name,contact_number,sending_items,number_of_items,addressee,receiving_phone_number,shipping_address,delivery_price,order_status',null,'0','{"pay":false}','2023-04-25 16:10:02.0','2023-04-25 16:10:02.0');
insert into `auth` values ('30','游客','订单信息','order_information','订单信息详情','/order_information/view','','_blank','0','0','0','0','order_number,user_information,user_name,contact_number,sending_items,number_of_items,addressee,receiving_phone_number,shipping_address,delivery_price,order_status','order_number,user_information,user_name,contact_number,sending_items,number_of_items,addressee,receiving_phone_number,shipping_address,delivery_price,order_status','order_number,user_information,user_name,contact_number,sending_items,number_of_items,addressee,receiving_phone_number,shipping_address,delivery_price,order_status',null,'0','{}','2023-04-25 16:10:02.0','2023-04-25 16:10:02.0');
insert into `auth` values ('31','游客','物流信息','logistics_information','物流信息','/logistics_information/table','','_blank','0','0','0','0','order_number,user_information,user_name,contact_number,sending_items,number_of_items,addressee,receiving_phone_number,shipping_address,vehicle_name,logistics_description','order_number,user_information,user_name,contact_number,sending_items,number_of_items,addressee,receiving_phone_number,shipping_address,vehicle_name,logistics_description','order_number,user_information,user_name,contact_number,sending_items,number_of_items,addressee,receiving_phone_number,shipping_address,vehicle_name,logistics_description',null,'0','{}','2023-04-25 16:10:02.0','2023-04-25 16:10:02.0');
insert into `auth` values ('32','游客','物流信息','logistics_information','物流信息详情','/logistics_information/view','','_blank','0','0','0','0','order_number,user_information,user_name,contact_number,sending_items,number_of_items,addressee,receiving_phone_number,shipping_address,vehicle_name,logistics_description','order_number,user_information,user_name,contact_number,sending_items,number_of_items,addressee,receiving_phone_number,shipping_address,vehicle_name,logistics_description','order_number,user_information,user_name,contact_number,sending_items,number_of_items,addressee,receiving_phone_number,shipping_address,vehicle_name,logistics_description',null,'0','{}','2023-04-25 16:10:02.0','2023-04-25 16:10:02.0');
insert into `auth` values ('33','游客','公告信息','announcement_information','公告信息','/announcement_information/table','','_blank','0','0','0','0','announcement_number,announcement_title,release_date,announcement_attachment,announcement_content','announcement_number,announcement_title,release_date,announcement_attachment,announcement_content','announcement_number,announcement_title,release_date,announcement_attachment,announcement_content',null,'0','{}','2023-04-25 16:10:02.0','2023-04-25 16:10:02.0');
insert into `auth` values ('34','游客','公告信息','announcement_information','公告信息详情','/announcement_information/view','','_blank','0','0','0','0','announcement_number,announcement_title,release_date,announcement_attachment,announcement_content','announcement_number,announcement_title,release_date,announcement_attachment,announcement_content','announcement_number,announcement_title,release_date,announcement_attachment,announcement_content',null,'0','{}','2023-04-25 16:10:02.0','2023-04-25 16:10:02.0');
insert into `auth` values ('35','游客','资讯信息','information','资讯信息','/information/table','','_blank','0','0','0','0','information_number,information_title,release_date,information_pictures,information_content','information_number,information_title,release_date,information_pictures,information_content','information_number,information_title,release_date,information_pictures,information_content',null,'0','{}','2023-04-25 16:10:02.0','2023-04-25 16:10:02.0');
insert into `auth` values ('36','游客','资讯信息','information','资讯信息详情','/information/view','','_blank','0','0','0','0','information_number,information_title,release_date,information_pictures,information_content','information_number,information_title,release_date,information_pictures,information_content','information_number,information_title,release_date,information_pictures,information_content',null,'0','{}','2023-04-25 16:10:02.0','2023-04-25 16:10:02.0');
insert into `auth` values ('37','游客','评论','comment','评论列表','/comment/table','','_blank','0','0','0','0','','','',null,'0','{}','2023-04-25 16:10:02.0','2023-04-25 16:10:02.0');
insert into `auth` values ('38','游客','评论','comment','评论详情','/comment/view','','_blank','0','0','0','0','','','',null,'0','{}','2023-04-25 16:10:02.0','2023-04-25 16:10:02.0');
insert into `auth` values ('39','游客','评论','comment','我的评论','/comment/list','','_blank','0','0','0','0','','','',null,'0','{}','2023-04-25 16:10:02.0','2023-04-25 16:10:02.0');
insert into `auth` values ('40','游客','评论','comment','评论详情','/comment/details','','_blank','0','0','0','0','','','',null,'0','{}','2023-04-25 16:10:02.0','2023-04-25 16:10:02.0');
insert into `auth` values ('41','普通用户','普通用户','ordinary_users','普通用户','/ordinary_users/table','','_blank','0','0','0','0','user_name,user_gender,user_age','user_name,user_gender,user_age','user_name,user_gender,user_age',null,'0','{}','2023-04-25 16:10:02.0','2023-04-25 16:10:02.0');
insert into `auth` values ('42','普通用户','普通用户','ordinary_users','普通用户详情','/ordinary_users/view','','_blank','0','0','0','0','user_name,user_gender,user_age','user_name,user_gender,user_age','user_name,user_gender,user_age',null,'0','{}','2023-04-25 16:10:02.0','2023-04-25 16:10:02.0');
insert into `auth` values ('43','普通用户','物品信息','item_information','物品信息','/item_information/table','','_blank','0','0','0','0','serial_number,item_name,storage_warehouse,item_storage_location,number_of_items,item_image,item_description','serial_number,item_name,storage_warehouse,item_storage_location,number_of_items,item_image,item_description','serial_number,item_name,storage_warehouse,item_storage_location,number_of_items,item_image,item_description',null,'0','{"figure":false}','2023-04-25 16:10:02.0','2023-04-25 16:10:02.0');
insert into `auth` values ('44','普通用户','物品信息','item_information','物品信息详情','/item_information/view','','_blank','0','0','0','0','serial_number,item_name,storage_warehouse,item_storage_location,number_of_items,item_image,item_description','serial_number,item_name,storage_warehouse,item_storage_location,number_of_items,item_image,item_description','serial_number,item_name,storage_warehouse,item_storage_location,number_of_items,item_image,item_description',null,'0','{}','2023-04-25 16:10:02.0','2023-04-25 16:10:02.0');
insert into `auth` values ('45','普通用户','人员信息','personnel_information','人员信息','/personnel_information/table','','_blank','0','0','0','0','personnel_name,gender_of_personnel,personnel_id,personnel_position,contact_number,personnel_introduction','personnel_name,gender_of_personnel,personnel_id,personnel_position,contact_number,personnel_introduction','personnel_name,gender_of_personnel,personnel_id,personnel_position,contact_number,personnel_introduction',null,'0','{}','2023-04-25 16:10:02.0','2023-04-25 16:10:02.0');
insert into `auth` values ('46','普通用户','人员信息','personnel_information','人员信息详情','/personnel_information/view','','_blank','0','0','0','0','personnel_name,gender_of_personnel,personnel_id,personnel_position,contact_number,personnel_introduction','personnel_name,gender_of_personnel,personnel_id,personnel_position,contact_number,personnel_introduction','personnel_name,gender_of_personnel,personnel_id,personnel_position,contact_number,personnel_introduction',null,'0','{}','2023-04-25 16:10:02.0','2023-04-25 16:10:02.0');
insert into `auth` values ('47','普通用户','车辆信息','vehicle_information','车辆信息','/vehicle_information/table','','_blank','0','0','0','0','vehicle_number,vehicle_name,vehicle_status,vehicle_image,vehicle_description','vehicle_number,vehicle_name,vehicle_status,vehicle_image,vehicle_description','vehicle_number,vehicle_name,vehicle_status,vehicle_image,vehicle_description',null,'0','{"figure":false}','2023-04-25 16:10:02.0','2023-04-25 16:10:02.0');
insert into `auth` values ('48','普通用户','车辆信息','vehicle_information','车辆信息详情','/vehicle_information/view','','_blank','0','0','0','0','vehicle_number,vehicle_name,vehicle_status,vehicle_image,vehicle_description','vehicle_number,vehicle_name,vehicle_status,vehicle_image,vehicle_description','vehicle_number,vehicle_name,vehicle_status,vehicle_image,vehicle_description',null,'0','{}','2023-04-25 16:10:02.0','2023-04-25 16:10:02.0');
insert into `auth` values ('49','普通用户','订单信息','order_information','订单信息','/order_information/table','','_blank','1','0','0','1','order_number,user_information,user_name,contact_number,sending_items,number_of_items,addressee,receiving_phone_number,shipping_address,delivery_price,order_status','order_number,user_information,user_name,contact_number,sending_items,number_of_items,addressee,receiving_phone_number,shipping_address,delivery_price,order_status','order_number,user_information,user_name,contact_number,sending_items,number_of_items,addressee,receiving_phone_number,shipping_address,delivery_price,order_status',null,'0','{"pay":true}','2023-04-25 16:10:02.0','2023-04-25 16:10:02.0');
insert into `auth` values ('50','普通用户','订单信息','order_information','订单信息详情','/order_information/view','','_blank','1','0','0','1','order_number,user_information,user_name,contact_number,sending_items,number_of_items,addressee,receiving_phone_number,shipping_address','order_number,user_information,user_name,contact_number,sending_items,number_of_items,addressee,receiving_phone_number,shipping_address,delivery_price,order_status','order_number,user_information,user_name,contact_number,sending_items,number_of_items,addressee,receiving_phone_number,shipping_address,delivery_price,order_status',null,'0','{}','2023-04-25 16:10:02.0','2023-04-25 16:10:02.0');
insert into `auth` values ('51','普通用户','物流信息','logistics_information','物流信息','/logistics_information/table','','_blank','0','0','0','1','order_number,user_information,user_name,contact_number,sending_items,number_of_items,addressee,receiving_phone_number,shipping_address,vehicle_name,logistics_description','order_number,user_information,user_name,contact_number,sending_items,number_of_items,addressee,receiving_phone_number,shipping_address,vehicle_name,logistics_description','order_number,user_information,user_name,contact_number,sending_items,number_of_items,addressee,receiving_phone_number,shipping_address,vehicle_name,logistics_description',null,'0','{}','2023-04-25 16:10:02.0','2023-04-25 16:10:02.0');
insert into `auth` values ('52','普通用户','物流信息','logistics_information','物流信息详情','/logistics_information/view','','_blank','0','0','0','1','order_number,user_information,user_name,contact_number,sending_items,number_of_items,addressee,receiving_phone_number,shipping_address,vehicle_name,logistics_description','order_number,user_information,user_name,contact_number,sending_items,number_of_items,addressee,receiving_phone_number,shipping_address,vehicle_name,logistics_description','order_number,user_information,user_name,contact_number,sending_items,number_of_items,addressee,receiving_phone_number,shipping_address,vehicle_name,logistics_description',null,'0','{}','2023-04-25 16:10:02.0','2023-04-25 16:10:02.0');
insert into `auth` values ('53','普通用户','公告信息','announcement_information','公告信息','/announcement_information/table','','_blank','0','0','0','1','announcement_number,announcement_title,release_date,announcement_attachment,announcement_content','announcement_number,announcement_title,release_date,announcement_attachment,announcement_content','announcement_number,announcement_title,release_date,announcement_attachment,announcement_content',null,'0','{}','2023-04-25 16:10:02.0','2023-04-25 16:10:02.0');
insert into `auth` values ('54','普通用户','公告信息','announcement_information','公告信息详情','/announcement_information/view','','_blank','0','0','0','1','announcement_number,announcement_title,release_date,announcement_attachment,announcement_content','announcement_number,announcement_title,release_date,announcement_attachment,announcement_content','announcement_number,announcement_title,release_date,announcement_attachment,announcement_content',null,'0','{}','2023-04-25 16:10:02.0','2023-04-25 16:10:02.0');
insert into `auth` values ('55','普通用户','资讯信息','information','资讯信息','/information/table','','_blank','0','0','0','1','information_number,information_title,release_date,information_pictures,information_content','information_number,information_title,release_date,information_pictures,information_content','information_number,information_title,release_date,information_pictures,information_content',null,'0','{}','2023-04-25 16:10:02.0','2023-04-25 16:10:02.0');
insert into `auth` values ('56','普通用户','资讯信息','information','资讯信息详情','/information/view','','_blank','0','0','0','1','information_number,information_title,release_date,information_pictures,information_content','information_number,information_title,release_date,information_pictures,information_content','information_number,information_title,release_date,information_pictures,information_content',null,'0','{}','2023-04-25 16:10:02.0','2023-04-25 16:10:02.0');
insert into `auth` values ('57','普通用户','评论','comment','评论列表','/comment/table','','_blank','0','0','0','0','','','',null,'0','{}','2023-04-25 16:10:02.0','2023-04-25 16:10:02.0');
insert into `auth` values ('58','普通用户','评论','comment','评论详情','/comment/view','','_blank','0','0','0','0','','','',null,'0','{}','2023-04-25 16:10:02.0','2023-04-25 16:10:02.0');
insert into `auth` values ('59','普通用户','评论','comment','我的评论','/comment/list','','_blank','0','0','0','0','','','',null,'0','{}','2023-04-25 16:10:02.0','2023-04-25 16:10:02.0');
insert into `auth` values ('60','普通用户','评论','comment','评论详情','/comment/details','','_blank','0','0','0','0','','','',null,'0','{}','2023-04-25 16:10:02.0','2023-04-25 16:10:02.0');
insert into `user_group` values ('1','100','管理员',null,'','','0','0','2023-04-25 16:10:02.0','2023-04-25 16:10:02.0');
insert into `user_group` values ('2','100','游客',null,'','','0','0','2023-04-25 16:10:02.0','2023-04-25 16:10:02.0');
insert into `user_group` values ('3','100','普通用户',null,'ordinary_users','ordinary_users_id','0','1','2023-04-25 16:10:02.0','2023-04-25 16:10:02.0');
