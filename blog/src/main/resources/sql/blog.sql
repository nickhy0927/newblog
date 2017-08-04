-- --------------------------------------------------------
-- 主机:                           192.168.254.129
-- 服务器版本:                        5.5.28 - MySQL Community Server (GPL)
-- 服务器操作系统:                      Win32
-- HeidiSQL 版本:                  9.4.0.5138
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- 导出 blog 的数据库结构
DROP DATABASE IF EXISTS `blog`;
CREATE DATABASE IF NOT EXISTS `blog` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `blog`;

-- 导出  表 blog.t_p_icon 结构
DROP TABLE IF EXISTS `t_p_icon`;
CREATE TABLE IF NOT EXISTS `t_p_icon` (
  `id` varchar(255) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `disabled` bit(1) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `class_name` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  blog.t_p_icon 的数据：~5 rows (大约)
DELETE FROM `t_p_icon`;
/*!40000 ALTER TABLE `t_p_icon` DISABLE KEYS */;
INSERT INTO `t_p_icon` (`id`, `create_time`, `disabled`, `update_time`, `class_name`, `name`) VALUES
	('0fbdfb98-fdbc-423a-88a0-45c2b12d575a', '2017-08-01 17:10:06', b'0', '2017-08-01 17:10:06', '<i class="fa fa-address-card" aria-hidden="true"></i>', '平台管理'),
	('812d54d8-c99d-4a9b-a659-12f37894f6f3', '2017-08-01 17:58:20', b'0', '2017-08-01 18:00:01', '<i class="fa fa-commenting" aria-hidden="true"></i>', '评论管理'),
	('8d9397d0-89f3-473b-9317-4880aeb06047', '2017-08-01 17:48:45', b'0', '2017-08-01 17:56:12', '<i class="fa fa-file-image-o" aria-hidden="true"></i>', '图片管理'),
	('e6b58065-a6ca-41d1-906c-5f19917256a9', '2017-08-01 17:39:49', b'0', '2017-08-01 17:39:49', '<i class="fa fa-caret-right" aria-hidden="true"></i>', '列表图标'),
	('ef3ada9e-f90d-4437-a27f-509287ac1157', '2017-08-01 17:38:12', b'0', '2017-08-01 17:38:12', '<i class="fa fa-bars" aria-hidden="true"></i>', '系统管理');
/*!40000 ALTER TABLE `t_p_icon` ENABLE KEYS */;

-- 导出  表 blog.t_p_module 结构
DROP TABLE IF EXISTS `t_p_module`;
CREATE TABLE IF NOT EXISTS `t_p_module` (
  `id` varchar(255) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `disabled` bit(1) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `pid` varchar(255) DEFAULT NULL,
  `descs` varchar(255) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `shows` varchar(255) DEFAULT NULL,
  `icon_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_k7ug1elvma66xbax2kh3nsqqm` (`pid`),
  KEY `FK_tlvag5oykuyhu8wfg2m7g1g43` (`icon_id`),
  CONSTRAINT `FK_k7ug1elvma66xbax2kh3nsqqm` FOREIGN KEY (`pid`) REFERENCES `t_p_module` (`id`),
  CONSTRAINT `FK_tlvag5oykuyhu8wfg2m7g1g43` FOREIGN KEY (`icon_id`) REFERENCES `t_p_icon` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  blog.t_p_module 的数据：~19 rows (大约)
DELETE FROM `t_p_module`;
/*!40000 ALTER TABLE `t_p_module` DISABLE KEYS */;
INSERT INTO `t_p_module` (`id`, `create_time`, `disabled`, `update_time`, `name`, `url`, `pid`, `descs`, `alias`, `shows`, `icon_id`) VALUES
	('007a27e3-d5cd-436e-a2da-ce58e8a09db8', '2017-07-28 16:13:39', b'0', '2017-08-01 17:32:29', '平台管理', '#', '1', '管理所有的平台信息', 'platform-manager', NULL, '0fbdfb98-fdbc-423a-88a0-45c2b12d575a'),
	('1', '2017-07-28 14:46:08', b'0', NULL, '根节点', '#', NULL, '根节点', NULL, '0', NULL),
	('1cd17747-5bd3-4cba-a4ef-4315dce77af8', '2017-08-01 15:42:02', b'0', '2017-08-01 17:43:41', '用户角色管理', '/platform/user/role/list', '007a27e3-d5cd-436e-a2da-ce58e8a09db8', '用户所对应的角色', 'userRole-manager', NULL, 'e6b58065-a6ca-41d1-906c-5f19917256a9'),
	('22c9ee7b-2f6b-48ed-9acc-ffec2df2c614', '2017-07-31 10:02:06', b'0', '2017-07-31 10:02:06', '修改菜单', '/platform/module/edit', '56688a3d-fda3-41b1-90db-2af1957e249c', '修改菜单', 'module-edit', '0', NULL),
	('4210dc83-2d04-40db-95cc-f0d3f7b8c0bc', '2017-07-31 10:04:51', b'0', '2017-07-31 10:04:51', '添加角色', '/platform/role/add', 'be6debfe-a075-416f-ad9d-d53785c86520', '添加角色', 'role-add', '0', NULL),
	('495c99b8-62b7-4d30-ac5e-7716adf64c0c', '2017-07-28 16:20:55', b'0', '2017-08-01 17:40:24', '用户管理', '/platform/user/list', '007a27e3-d5cd-436e-a2da-ce58e8a09db8', '管理所有的用户信息', 'user-manager', NULL, 'e6b58065-a6ca-41d1-906c-5f19917256a9'),
	('56688a3d-fda3-41b1-90db-2af1957e249c', '2017-07-28 16:14:39', b'0', '2017-08-01 17:43:28', '菜单管理', '/platform/module/list', '007a27e3-d5cd-436e-a2da-ce58e8a09db8', '管理所有的菜单信息', 'module-manager', NULL, 'e6b58065-a6ca-41d1-906c-5f19917256a9'),
	('5c5d86ca-1aca-4e3c-8d04-d648d6a508cb', '2017-07-31 10:11:18', b'0', '2017-07-31 10:11:18', '修改用户', '/platform/user/edit', '495c99b8-62b7-4d30-ac5e-7716adf64c0c', '修改用户信息', 'user-edit', '0', NULL),
	('60f738ac-16c5-4507-bb33-a4455740b760', '2017-08-01 17:02:31', b'0', '2017-08-01 17:43:52', '图标管理', '/platform/icon/list', '007a27e3-d5cd-436e-a2da-ce58e8a09db8', '菜单旁边的图标', 'icon-manager', NULL, 'e6b58065-a6ca-41d1-906c-5f19917256a9'),
	('610c0493-aeca-47d3-83b8-38c285656ae5', '2017-08-01 16:42:50', b'0', '2017-08-01 17:38:22', '系统管理', '#', '1', '系统的配置设置', 'system-manager', NULL, 'ef3ada9e-f90d-4437-a27f-509287ac1157'),
	('7684d388-473f-4f86-95b1-a9f44e3273d7', '2017-07-31 10:10:29', b'0', '2017-07-31 10:10:29', '删除用户', '/platform/user/delete', '495c99b8-62b7-4d30-ac5e-7716adf64c0c', '删除用户信息', 'user-delete', '0', NULL),
	('7d7f598f-eeab-437f-ba28-976b63f26941', '2017-07-31 10:04:04', b'0', '2017-07-31 10:04:04', '删除角色', '/platform/role/delete', 'be6debfe-a075-416f-ad9d-d53785c86520', '删除角色', 'role-delete', '0', NULL),
	('a149857a-8e2d-472c-9c79-122ba5d7c32f', '2017-07-31 10:03:19', b'0', '2017-07-31 10:03:19', '修改角色', '/platform/role/edit', 'be6debfe-a075-416f-ad9d-d53785c86520', '修改角色', 'role-edit', '0', NULL),
	('aa1c6430-10c7-4904-914e-330dd684faf6', '2017-07-31 09:58:39', b'0', '2017-07-31 09:58:39', '添加菜单', '/platform/module/add', '56688a3d-fda3-41b1-90db-2af1957e249c', '添加菜单的功能', 'module-add', '0', NULL),
	('ad34d6e8-4ac5-4841-8cca-ea7ccc675ab1', '2017-08-01 15:46:39', b'0', '2017-08-01 15:46:39', '修改用户', '/platform/user/edit', '495c99b8-62b7-4d30-ac5e-7716adf64c0c', '修改用户信息', 'user-edit', '0', NULL),
	('be6debfe-a075-416f-ad9d-d53785c86520', '2017-07-28 16:16:19', b'0', '2017-08-01 17:43:18', '角色管理', '/platform/role/list', '007a27e3-d5cd-436e-a2da-ce58e8a09db8', '管理所有的角色信息', 'role-manager', NULL, 'e6b58065-a6ca-41d1-906c-5f19917256a9'),
	('c83cc0d6-e8a5-4b73-a214-1a6727fa086e', '2017-07-31 10:00:29', b'0', '2017-07-31 10:00:29', '删除菜单', '/platform/module/delete', '56688a3d-fda3-41b1-90db-2af1957e249c', '删除菜单', 'module-delete', '0', NULL),
	('e35bb92d-53b9-469c-8f7b-bff1d8e8c493', '2017-08-01 18:00:49', b'0', '2017-08-01 18:00:49', '评论管理', '#', '1', '评论管理', 'comments-manager', '1', '812d54d8-c99d-4a9b-a659-12f37894f6f3'),
	('e7f32c96-1d5f-474f-95df-84116a71a20a', '2017-07-31 10:09:48', b'0', '2017-07-31 10:09:48', '添加用户', '/platform/user/add', '495c99b8-62b7-4d30-ac5e-7716adf64c0c', '添加用户信息', 'user-add', '0', NULL);
/*!40000 ALTER TABLE `t_p_module` ENABLE KEYS */;

-- 导出  表 blog.t_p_premission 结构
DROP TABLE IF EXISTS `t_p_premission`;
CREATE TABLE IF NOT EXISTS `t_p_premission` (
  `id` varchar(255) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `disabled` bit(1) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  blog.t_p_premission 的数据：~0 rows (大约)
DELETE FROM `t_p_premission`;
/*!40000 ALTER TABLE `t_p_premission` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_p_premission` ENABLE KEYS */;

-- 导出  表 blog.t_p_role 结构
DROP TABLE IF EXISTS `t_p_role`;
CREATE TABLE IF NOT EXISTS `t_p_role` (
  `id` varchar(255) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `disabled` bit(1) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `role_desc` varchar(255) DEFAULT NULL,
  `role_name` varchar(255) DEFAULT NULL,
  `pid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_qwbn7vxfab3kgb863yn7drotw` (`pid`),
  CONSTRAINT `FK_qwbn7vxfab3kgb863yn7drotw` FOREIGN KEY (`pid`) REFERENCES `t_p_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  blog.t_p_role 的数据：~6 rows (大约)
DELETE FROM `t_p_role`;
/*!40000 ALTER TABLE `t_p_role` DISABLE KEYS */;
INSERT INTO `t_p_role` (`id`, `create_time`, `disabled`, `update_time`, `role_desc`, `role_name`, `pid`) VALUES
	('031adfe8-ff19-46df-aa1c-2fc0b6149189', '2017-07-31 16:37:07', b'0', '2017-07-31 16:37:07', '222', '222', '1b6f84eb-5d4c-49d0-8393-14b511b56ef1'),
	('1', '2017-07-31 16:06:06', b'0', NULL, '根节点', '根节点', NULL),
	('1b6f84eb-5d4c-49d0-8393-14b511b56ef1', '2017-07-31 16:36:56', b'0', '2017-07-31 16:36:56', '1111', '111', 'db8fa132-1e5d-48d2-bd42-9c6d7291c639'),
	('c15cc5a0-4e67-493a-864f-21a007d6b2ad', '2017-07-31 16:12:47', b'0', '2017-07-31 16:12:57', '管理员角色', '管理员', '1'),
	('db8fa132-1e5d-48d2-bd42-9c6d7291c639', '2017-07-31 16:36:33', b'0', '2017-07-31 16:36:37', '测试角色0001', '测试部门', '1'),
	('efd2bf21-d928-4aec-a486-7aacbaf51c29', '2017-07-31 16:37:19', b'0', '2017-07-31 16:37:19', '333', '333', '1b6f84eb-5d4c-49d0-8393-14b511b56ef1');
/*!40000 ALTER TABLE `t_p_role` ENABLE KEYS */;

-- 导出  表 blog.t_p_role_module 结构
DROP TABLE IF EXISTS `t_p_role_module`;
CREATE TABLE IF NOT EXISTS `t_p_role_module` (
  `role_id` varchar(255) NOT NULL,
  `module_id` varchar(255) NOT NULL,
  KEY `FK_9pncp8k4tf1wr6p1ojb1jynxs` (`module_id`),
  KEY `FK_nyeeltyagdtxtuqpdt9pdka3a` (`role_id`),
  CONSTRAINT `FK_9pncp8k4tf1wr6p1ojb1jynxs` FOREIGN KEY (`module_id`) REFERENCES `t_p_module` (`id`),
  CONSTRAINT `FK_nyeeltyagdtxtuqpdt9pdka3a` FOREIGN KEY (`role_id`) REFERENCES `t_p_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  blog.t_p_role_module 的数据：~0 rows (大约)
DELETE FROM `t_p_role_module`;
/*!40000 ALTER TABLE `t_p_role_module` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_p_role_module` ENABLE KEYS */;

-- 导出  表 blog.t_p_user 结构
DROP TABLE IF EXISTS `t_p_user`;
CREATE TABLE IF NOT EXISTS `t_p_user` (
  `id` varchar(255) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `disabled` bit(1) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `card_type` varchar(255) DEFAULT NULL,
  `id_card` varchar(255) DEFAULT NULL,
  `last_login_time` datetime DEFAULT NULL,
  `locked` bit(1) DEFAULT NULL,
  `login_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `real_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  blog.t_p_user 的数据：~2 rows (大约)
DELETE FROM `t_p_user`;
/*!40000 ALTER TABLE `t_p_user` DISABLE KEYS */;
INSERT INTO `t_p_user` (`id`, `create_time`, `disabled`, `update_time`, `card_type`, `id_card`, `last_login_time`, `locked`, `login_name`, `password`, `phone_number`, `real_name`) VALUES
	('bc7809fe-b085-4ea1-bbe7-584e73a8bd5e', '2017-07-27 16:49:03', b'0', '2017-08-02 11:52:37', '1', '123456789123456789', NULL, b'0', 'lisi10010', 'e10adc3949ba59abbe56e057f20f883e', '13299999998', '李四'),
	('cb19a72c-1496-492b-9440-51241cdc3485', '2017-07-27 16:40:09', b'0', '2017-08-02 11:52:48', '1', '123456789123456789', NULL, b'0', 'zhangsan', 'e10adc3949ba59abbe56e057f20f883e', '13299999999', '张三');
/*!40000 ALTER TABLE `t_p_user` ENABLE KEYS */;

-- 导出  表 blog.t_p_user_role 结构
DROP TABLE IF EXISTS `t_p_user_role`;
CREATE TABLE IF NOT EXISTS `t_p_user_role` (
  `user_id` varchar(255) NOT NULL,
  `role_id` varchar(255) NOT NULL,
  KEY `FK_mk0l42w3v5e0xkrfxpa97w3bv` (`role_id`),
  KEY `FK_8np60bshs5317b62gbrbqsyt4` (`user_id`),
  CONSTRAINT `FK_8np60bshs5317b62gbrbqsyt4` FOREIGN KEY (`user_id`) REFERENCES `t_p_user` (`id`),
  CONSTRAINT `FK_mk0l42w3v5e0xkrfxpa97w3bv` FOREIGN KEY (`role_id`) REFERENCES `t_p_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  blog.t_p_user_role 的数据：~11 rows (大约)
DELETE FROM `t_p_user_role`;
/*!40000 ALTER TABLE `t_p_user_role` DISABLE KEYS */;
INSERT INTO `t_p_user_role` (`user_id`, `role_id`) VALUES
	('bc7809fe-b085-4ea1-bbe7-584e73a8bd5e', '1'),
	('bc7809fe-b085-4ea1-bbe7-584e73a8bd5e', 'c15cc5a0-4e67-493a-864f-21a007d6b2ad'),
	('bc7809fe-b085-4ea1-bbe7-584e73a8bd5e', 'db8fa132-1e5d-48d2-bd42-9c6d7291c639'),
	('bc7809fe-b085-4ea1-bbe7-584e73a8bd5e', '1b6f84eb-5d4c-49d0-8393-14b511b56ef1'),
	('bc7809fe-b085-4ea1-bbe7-584e73a8bd5e', '031adfe8-ff19-46df-aa1c-2fc0b6149189'),
	('bc7809fe-b085-4ea1-bbe7-584e73a8bd5e', 'efd2bf21-d928-4aec-a486-7aacbaf51c29'),
	('cb19a72c-1496-492b-9440-51241cdc3485', '1'),
	('cb19a72c-1496-492b-9440-51241cdc3485', 'db8fa132-1e5d-48d2-bd42-9c6d7291c639'),
	('cb19a72c-1496-492b-9440-51241cdc3485', '1b6f84eb-5d4c-49d0-8393-14b511b56ef1'),
	('cb19a72c-1496-492b-9440-51241cdc3485', '031adfe8-ff19-46df-aa1c-2fc0b6149189'),
	('cb19a72c-1496-492b-9440-51241cdc3485', 'efd2bf21-d928-4aec-a486-7aacbaf51c29');
/*!40000 ALTER TABLE `t_p_user_role` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
