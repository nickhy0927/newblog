/*
Navicat MySQL Data Transfer

Source Server         : 192.168.254.129
Source Server Version : 50528
Source Host           : 192.168.254.129:3306
Source Database       : blog

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2017-08-02 16:32:53
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_p_icon
-- ----------------------------
DROP TABLE IF EXISTS `t_p_icon`;
CREATE TABLE `t_p_icon` (
  `id` varchar(255) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `disabled` bit(1) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `class_name` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_p_icon
-- ----------------------------
INSERT INTO `t_p_icon` VALUES ('0fbdfb98-fdbc-423a-88a0-45c2b12d575a', '2017-08-01 17:10:06', '\0', '2017-08-01 17:10:06', '<i class=\"fa fa-address-card\" aria-hidden=\"true\"></i>', '平台管理');
INSERT INTO `t_p_icon` VALUES ('812d54d8-c99d-4a9b-a659-12f37894f6f3', '2017-08-01 17:58:20', '\0', '2017-08-01 18:00:01', '<i class=\"fa fa-commenting\" aria-hidden=\"true\"></i>', '评论管理');
INSERT INTO `t_p_icon` VALUES ('8d9397d0-89f3-473b-9317-4880aeb06047', '2017-08-01 17:48:45', '\0', '2017-08-01 17:56:12', '<i class=\"fa fa-file-image-o\" aria-hidden=\"true\"></i>', '图片管理');
INSERT INTO `t_p_icon` VALUES ('e6b58065-a6ca-41d1-906c-5f19917256a9', '2017-08-01 17:39:49', '\0', '2017-08-01 17:39:49', '<i class=\"fa fa-caret-right\" aria-hidden=\"true\"></i>', '列表图标');
INSERT INTO `t_p_icon` VALUES ('ef3ada9e-f90d-4437-a27f-509287ac1157', '2017-08-01 17:38:12', '\0', '2017-08-01 17:38:12', '<i class=\"fa fa-bars\" aria-hidden=\"true\"></i>', '系统管理');

-- ----------------------------
-- Table structure for t_p_module
-- ----------------------------
DROP TABLE IF EXISTS `t_p_module`;
CREATE TABLE `t_p_module` (
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

-- ----------------------------
-- Records of t_p_module
-- ----------------------------
INSERT INTO `t_p_module` VALUES ('007a27e3-d5cd-436e-a2da-ce58e8a09db8', '2017-07-28 16:13:39', '\0', '2017-08-01 17:32:29', '平台管理', '#', '1', '管理所有的平台信息', 'platform-manager', null, '0fbdfb98-fdbc-423a-88a0-45c2b12d575a');
INSERT INTO `t_p_module` VALUES ('1', '2017-07-28 14:46:08', '\0', null, '根节点', '#', null, '根节点', null, '0', null);
INSERT INTO `t_p_module` VALUES ('1cd17747-5bd3-4cba-a4ef-4315dce77af8', '2017-08-01 15:42:02', '\0', '2017-08-01 17:43:41', '用户角色管理', '/platform/user/role/list', '007a27e3-d5cd-436e-a2da-ce58e8a09db8', '用户所对应的角色', 'userRole-manager', null, 'e6b58065-a6ca-41d1-906c-5f19917256a9');
INSERT INTO `t_p_module` VALUES ('22c9ee7b-2f6b-48ed-9acc-ffec2df2c614', '2017-07-31 10:02:06', '\0', '2017-07-31 10:02:06', '修改菜单', '/platform/module/edit', '56688a3d-fda3-41b1-90db-2af1957e249c', '修改菜单', 'module-edit', '0', null);
INSERT INTO `t_p_module` VALUES ('4210dc83-2d04-40db-95cc-f0d3f7b8c0bc', '2017-07-31 10:04:51', '\0', '2017-07-31 10:04:51', '添加角色', '/platform/role/add', 'be6debfe-a075-416f-ad9d-d53785c86520', '添加角色', 'role-add', '0', null);
INSERT INTO `t_p_module` VALUES ('495c99b8-62b7-4d30-ac5e-7716adf64c0c', '2017-07-28 16:20:55', '\0', '2017-08-01 17:40:24', '用户管理', '/platform/user/list', '007a27e3-d5cd-436e-a2da-ce58e8a09db8', '管理所有的用户信息', 'user-manager', null, 'e6b58065-a6ca-41d1-906c-5f19917256a9');
INSERT INTO `t_p_module` VALUES ('56688a3d-fda3-41b1-90db-2af1957e249c', '2017-07-28 16:14:39', '\0', '2017-08-01 17:43:28', '菜单管理', '/platform/module/list', '007a27e3-d5cd-436e-a2da-ce58e8a09db8', '管理所有的菜单信息', 'module-manager', null, 'e6b58065-a6ca-41d1-906c-5f19917256a9');
INSERT INTO `t_p_module` VALUES ('5c5d86ca-1aca-4e3c-8d04-d648d6a508cb', '2017-07-31 10:11:18', '\0', '2017-07-31 10:11:18', '修改用户', '/platform/user/edit', '495c99b8-62b7-4d30-ac5e-7716adf64c0c', '修改用户信息', 'user-edit', '0', null);
INSERT INTO `t_p_module` VALUES ('60f738ac-16c5-4507-bb33-a4455740b760', '2017-08-01 17:02:31', '\0', '2017-08-01 17:43:52', '图标管理', '/platform/icon/list', '007a27e3-d5cd-436e-a2da-ce58e8a09db8', '菜单旁边的图标', 'icon-manager', null, 'e6b58065-a6ca-41d1-906c-5f19917256a9');
INSERT INTO `t_p_module` VALUES ('610c0493-aeca-47d3-83b8-38c285656ae5', '2017-08-01 16:42:50', '\0', '2017-08-01 17:38:22', '系统管理', '#', '1', '系统的配置设置', 'system-manager', null, 'ef3ada9e-f90d-4437-a27f-509287ac1157');
INSERT INTO `t_p_module` VALUES ('7684d388-473f-4f86-95b1-a9f44e3273d7', '2017-07-31 10:10:29', '\0', '2017-07-31 10:10:29', '删除用户', '/platform/user/delete', '495c99b8-62b7-4d30-ac5e-7716adf64c0c', '删除用户信息', 'user-delete', '0', null);
INSERT INTO `t_p_module` VALUES ('7d7f598f-eeab-437f-ba28-976b63f26941', '2017-07-31 10:04:04', '\0', '2017-07-31 10:04:04', '删除角色', '/platform/role/delete', 'be6debfe-a075-416f-ad9d-d53785c86520', '删除角色', 'role-delete', '0', null);
INSERT INTO `t_p_module` VALUES ('a149857a-8e2d-472c-9c79-122ba5d7c32f', '2017-07-31 10:03:19', '\0', '2017-07-31 10:03:19', '修改角色', '/platform/role/edit', 'be6debfe-a075-416f-ad9d-d53785c86520', '修改角色', 'role-edit', '0', null);
INSERT INTO `t_p_module` VALUES ('aa1c6430-10c7-4904-914e-330dd684faf6', '2017-07-31 09:58:39', '\0', '2017-07-31 09:58:39', '添加菜单', '/platform/module/add', '56688a3d-fda3-41b1-90db-2af1957e249c', '添加菜单的功能', 'module-add', '0', null);
INSERT INTO `t_p_module` VALUES ('ad34d6e8-4ac5-4841-8cca-ea7ccc675ab1', '2017-08-01 15:46:39', '\0', '2017-08-01 15:46:39', '修改用户', '/platform/user/edit', '495c99b8-62b7-4d30-ac5e-7716adf64c0c', '修改用户信息', 'user-edit', '0', null);
INSERT INTO `t_p_module` VALUES ('be6debfe-a075-416f-ad9d-d53785c86520', '2017-07-28 16:16:19', '\0', '2017-08-01 17:43:18', '角色管理', '/platform/role/list', '007a27e3-d5cd-436e-a2da-ce58e8a09db8', '管理所有的角色信息', 'role-manager', null, 'e6b58065-a6ca-41d1-906c-5f19917256a9');
INSERT INTO `t_p_module` VALUES ('c83cc0d6-e8a5-4b73-a214-1a6727fa086e', '2017-07-31 10:00:29', '\0', '2017-07-31 10:00:29', '删除菜单', '/platform/module/delete', '56688a3d-fda3-41b1-90db-2af1957e249c', '删除菜单', 'module-delete', '0', null);
INSERT INTO `t_p_module` VALUES ('e35bb92d-53b9-469c-8f7b-bff1d8e8c493', '2017-08-01 18:00:49', '\0', '2017-08-01 18:00:49', '评论管理', '#', '1', '评论管理', 'comments-manager', '1', '812d54d8-c99d-4a9b-a659-12f37894f6f3');
INSERT INTO `t_p_module` VALUES ('e7f32c96-1d5f-474f-95df-84116a71a20a', '2017-07-31 10:09:48', '\0', '2017-07-31 10:09:48', '添加用户', '/platform/user/add', '495c99b8-62b7-4d30-ac5e-7716adf64c0c', '添加用户信息', 'user-add', '0', null);

-- ----------------------------
-- Table structure for t_p_premission
-- ----------------------------
DROP TABLE IF EXISTS `t_p_premission`;
CREATE TABLE `t_p_premission` (
  `id` varchar(255) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `disabled` bit(1) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_p_premission
-- ----------------------------

-- ----------------------------
-- Table structure for t_p_role
-- ----------------------------
DROP TABLE IF EXISTS `t_p_role`;
CREATE TABLE `t_p_role` (
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

-- ----------------------------
-- Records of t_p_role
-- ----------------------------
INSERT INTO `t_p_role` VALUES ('031adfe8-ff19-46df-aa1c-2fc0b6149189', '2017-07-31 16:37:07', '\0', '2017-07-31 16:37:07', '222', '222', '1b6f84eb-5d4c-49d0-8393-14b511b56ef1');
INSERT INTO `t_p_role` VALUES ('1', '2017-07-31 16:06:06', '\0', null, '根节点', '根节点', null);
INSERT INTO `t_p_role` VALUES ('1b6f84eb-5d4c-49d0-8393-14b511b56ef1', '2017-07-31 16:36:56', '\0', '2017-07-31 16:36:56', '1111', '111', 'db8fa132-1e5d-48d2-bd42-9c6d7291c639');
INSERT INTO `t_p_role` VALUES ('c15cc5a0-4e67-493a-864f-21a007d6b2ad', '2017-07-31 16:12:47', '\0', '2017-07-31 16:12:57', '管理员角色', '管理员', '1');
INSERT INTO `t_p_role` VALUES ('db8fa132-1e5d-48d2-bd42-9c6d7291c639', '2017-07-31 16:36:33', '\0', '2017-07-31 16:36:37', '测试角色0001', '测试部门', '1');
INSERT INTO `t_p_role` VALUES ('efd2bf21-d928-4aec-a486-7aacbaf51c29', '2017-07-31 16:37:19', '\0', '2017-07-31 16:37:19', '333', '333', '1b6f84eb-5d4c-49d0-8393-14b511b56ef1');

-- ----------------------------
-- Table structure for t_p_user
-- ----------------------------
DROP TABLE IF EXISTS `t_p_user`;
CREATE TABLE `t_p_user` (
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

-- ----------------------------
-- Records of t_p_user
-- ----------------------------
INSERT INTO `t_p_user` VALUES ('bc7809fe-b085-4ea1-bbe7-584e73a8bd5e', '2017-07-27 16:49:03', '\0', '2017-08-02 11:52:37', '1', '123456789123456789', null, '\0', 'lisi10010', 'e10adc3949ba59abbe56e057f20f883e', '13299999998', '李四');
INSERT INTO `t_p_user` VALUES ('cb19a72c-1496-492b-9440-51241cdc3485', '2017-07-27 16:40:09', '\0', '2017-08-02 11:52:48', '1', '123456789123456789', null, '\0', 'zhangsan', 'e10adc3949ba59abbe56e057f20f883e', '13299999999', '张三');

-- ----------------------------
-- Table structure for t_p_user_role
-- ----------------------------
DROP TABLE IF EXISTS `t_p_user_role`;
CREATE TABLE `t_p_user_role` (
  `user_id` varchar(255) NOT NULL,
  `role_id` varchar(255) NOT NULL,
  KEY `FK_mk0l42w3v5e0xkrfxpa97w3bv` (`role_id`),
  KEY `FK_8np60bshs5317b62gbrbqsyt4` (`user_id`),
  CONSTRAINT `FK_8np60bshs5317b62gbrbqsyt4` FOREIGN KEY (`user_id`) REFERENCES `t_p_user` (`id`),
  CONSTRAINT `FK_mk0l42w3v5e0xkrfxpa97w3bv` FOREIGN KEY (`role_id`) REFERENCES `t_p_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_p_user_role
-- ----------------------------
INSERT INTO `t_p_user_role` VALUES ('bc7809fe-b085-4ea1-bbe7-584e73a8bd5e', '1');
INSERT INTO `t_p_user_role` VALUES ('bc7809fe-b085-4ea1-bbe7-584e73a8bd5e', 'c15cc5a0-4e67-493a-864f-21a007d6b2ad');
INSERT INTO `t_p_user_role` VALUES ('bc7809fe-b085-4ea1-bbe7-584e73a8bd5e', 'db8fa132-1e5d-48d2-bd42-9c6d7291c639');
INSERT INTO `t_p_user_role` VALUES ('bc7809fe-b085-4ea1-bbe7-584e73a8bd5e', '1b6f84eb-5d4c-49d0-8393-14b511b56ef1');
INSERT INTO `t_p_user_role` VALUES ('bc7809fe-b085-4ea1-bbe7-584e73a8bd5e', '031adfe8-ff19-46df-aa1c-2fc0b6149189');
INSERT INTO `t_p_user_role` VALUES ('bc7809fe-b085-4ea1-bbe7-584e73a8bd5e', 'efd2bf21-d928-4aec-a486-7aacbaf51c29');
INSERT INTO `t_p_user_role` VALUES ('cb19a72c-1496-492b-9440-51241cdc3485', '1');
INSERT INTO `t_p_user_role` VALUES ('cb19a72c-1496-492b-9440-51241cdc3485', 'db8fa132-1e5d-48d2-bd42-9c6d7291c639');
INSERT INTO `t_p_user_role` VALUES ('cb19a72c-1496-492b-9440-51241cdc3485', '1b6f84eb-5d4c-49d0-8393-14b511b56ef1');
INSERT INTO `t_p_user_role` VALUES ('cb19a72c-1496-492b-9440-51241cdc3485', '031adfe8-ff19-46df-aa1c-2fc0b6149189');
INSERT INTO `t_p_user_role` VALUES ('cb19a72c-1496-492b-9440-51241cdc3485', 'efd2bf21-d928-4aec-a486-7aacbaf51c29');
