/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50643
 Source Host           : localhost:3306
 Source Schema         : blog

 Target Server Type    : MySQL
 Target Server Version : 50643
 File Encoding         : 65001

 Date: 16/04/2021 19:10:17
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for black_word
-- ----------------------------
DROP TABLE IF EXISTS `black_word`;
CREATE TABLE `black_word` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `content` varchar(100) NOT NULL COMMENT '内容',
  `del_flag` int(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `create_by` varchar(20) DEFAULT NULL COMMENT '更新人',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(20) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of black_word
-- ----------------------------
BEGIN;
INSERT INTO `black_word` VALUES (1, '博彩', 0, NULL, '2020-04-04 11:07:41', NULL, '2022-04-04 11:07:41');
INSERT INTO `black_word` VALUES (2, '老虎机', 0, NULL, '2020-04-04 11:07:50', NULL, '2022-04-04 11:07:50');
INSERT INTO `black_word` VALUES (3, '枪支', 0, NULL, '2020-04-04 11:07:54', NULL, '2022-04-04 11:07:54');
INSERT INTO `black_word` VALUES (4, '红包', 0, NULL, '2020-04-04 11:07:58', NULL, '2022-04-04 11:07:58');
INSERT INTO `black_word` VALUES (5, '彩票', 0, NULL, '2020-04-04 11:08:02', NULL, '2022-04-04 11:08:02');
INSERT INTO `black_word` VALUES (6, '优惠券', 0, NULL, '2020-04-04 11:12:20', NULL, '2022-04-04 11:12:20');
INSERT INTO `black_word` VALUES (7, '成人', 0, NULL, '2020-04-04 11:15:43', NULL, '2022-04-04 11:15:43');
INSERT INTO `black_word` VALUES (8, '澳门', 0, NULL, '2020-04-04 11:15:49', NULL, '2022-04-04 11:15:49');
INSERT INTO `black_word` VALUES (9, '共产党', 0, NULL, '2020-04-04 11:15:53', NULL, '2022-04-04 11:15:53');
COMMIT;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `cate_name` varchar(100) NOT NULL COMMENT '分类名称',
  `cate_sort` int(11) NOT NULL DEFAULT '1' COMMENT '分类序号',
  `cate_desc` varchar(100) DEFAULT NULL COMMENT '分类描述',
  `del_flag` int(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `create_by` varchar(20) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(20) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of category
-- ----------------------------
BEGIN;
INSERT INTO `category` VALUES (8, '前端开发', 1, '分享前端相关技术：H5,VueJS,React,NodeJS', 0, NULL, '2022-03-12 15:17:58', NULL, '2022-03-12 15:17:58');
INSERT INTO `category` VALUES (9, '后端开发', 2, '分享后端开发技术：Java、SpringBoot、SpringCloud、分布式、高并发、面向对象', 0, NULL, '2022-03-12 15:18:56', NULL, '2020-03-12 15:20:38');
INSERT INTO `category` VALUES (10, '大数据', 3, '分享大数据相关技术：数据采集、数据挖掘、数据分析', 0, NULL, '2022-03-12 15:19:48', NULL, '2022-03-12 15:19:48');
INSERT INTO `category` VALUES (11, '人工智能', 4, '分析AI相关技术：计算机视觉、自然语言翻译、人脸识别、知识图谱', 0, NULL, '2022-03-12 15:27:12', NULL, '2022-03-12 15:27:12');
INSERT INTO `category` VALUES (12, '程序人生', 100, '分享程序人生的酸甜苦辣', 0, NULL, '2022-03-12 15:28:53', NULL, '2022-03-12 15:28:53');
INSERT INTO `category` VALUES (13, '计算机原理', 5, '分享学习计算机原理的成长过程', 0, NULL, '2022-03-12 15:30:01', NULL, '2022-03-12 15:30:01');
INSERT INTO `category` VALUES (14, '算法', 8, '分享数据结构和算法以及应用实践', 0, NULL, '2022-03-12 18:16:12', NULL, '2022-03-12 18:16:12');
COMMIT;

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `comment_content` text NOT NULL COMMENT '内容',
  `comment_parent` bigint(20) NOT NULL COMMENT '上级评论ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '文章ID',
  `path_trace` varchar(1000) DEFAULT NULL COMMENT 'ID上下级路径',
  `accept_user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '接受评论用户ID',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(255) DEFAULT 'admin' COMMENT '创建人',
  `update_by` varchar(255) DEFAULT 'admin' COMMENT '更新人',
  `del_flag` int(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `like_count` int(11) NOT NULL DEFAULT '0' COMMENT '点赞数',
  `dislike_count` int(11) NOT NULL DEFAULT '0' COMMENT '点踩数',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FKlhqkt5diooecok7509whj2li6` (`post_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of comment
-- ----------------------------
BEGIN;
INSERT INTO `comment` VALUES (9, '赞！！！', 0, 9, 18, '/', 3, '2022-03-12 18:25:29', '2022-03-12 18:25:29', 'admin', 'admin', 0, 0, 0);
INSERT INTO `comment` VALUES (10, '<a href=\'#comment-id-9\'>@zhaoyun</a> zhaoyun: 再赞！', 9, 9, 18, '/9/', 9, '2022-03-12 18:25:42', '2022-03-12 18:25:42', 'admin', 'admin', 0, 0, 0);
INSERT INTO `comment` VALUES (11, '看来要学Kotlin啦！', 0, 1, 14, '/', 1, '2022-03-12 18:43:55', '2022-03-12 18:43:55', 'admin', 'admin', 0, 0, 0);
INSERT INTO `comment` VALUES (12, '<a href=\'#comment-id-11\'>@管理员</a> 管理员: 回复测试！', 11, 1, 14, '/11/', 1, '2022-03-12 18:44:07', '2022-03-12 18:44:07', 'admin', 'admin', 0, 0, 0);
INSERT INTO `comment` VALUES (13, '6666', 0, 3, 24, '/', 9, '2022-03-12 18:50:06', '2022-03-12 18:50:06', 'admin', 'admin', 0, 1, 0);
INSERT INTO `comment` VALUES (14, '优秀！', 0, 3, 22, '/', 9, '2022-03-12 22:32:41', '2022-08-17 22:35:01', 'admin', 'admin', 1, 1, 0);
INSERT INTO `comment` VALUES (15, '<a href=\'#comment-id-14\'>@张三</a> 张三: 哈哈！', 14, 9, 22, '/14/', 3, '2022-03-12 22:33:05', '2022-08-17 22:35:01', 'admin', 'admin', 1, 0, 0);
INSERT INTO `comment` VALUES (16, '<a href=\'#comment-id-13\'>@张三</a> 张三: 赞！！！', 13, 9, 24, '/13/', 3, '2022-03-14 15:19:56', '2022-08-17 22:35:12', 'admin', 'admin', 1, 0, 0);
INSERT INTO `comment` VALUES (17, '111', 0, 1, 25, '/', 1, '2022-08-17 22:19:25', '2022-08-17 22:19:25', 'admin', 'admin', 0, 1, 0);
INSERT INTO `comment` VALUES (18, '<a href=\'#comment-id-17\'>@管理员</a> 222', 17, 1, 25, '/17/', 1, '2022-08-17 22:35:08', '2022-08-17 22:35:08', 'admin', 'admin', 0, 0, 0);
INSERT INTO `comment` VALUES (19, '22222', 0, 1, 25, '/', 1, '2022-08-17 22:59:50', '2022-08-17 22:59:50', 'admin', 'admin', 0, 0, 0);
INSERT INTO `comment` VALUES (20, '222', 0, 1, 25, '/', 1, '2022-08-17 22:59:53', '2022-08-17 22:59:53', 'admin', 'admin', 0, 0, 0);
INSERT INTO `comment` VALUES (21, '测试评论！', 0, 1, 23, '/', 9, '2022-04-16 19:01:32', '2022-04-16 19:01:32', 'admin', 'admin', 0, 1, 0);
INSERT INTO `comment` VALUES (22, '<a href=\'#comment-id-21\'>@管理员</a> 管理员: 回复评论！', 21, 1, 23, '/21/', 1, '2022-04-16 19:01:41', '2022-04-16 19:01:41', 'admin', 'admin', 0, 0, 0);
INSERT INTO `comment` VALUES (23, '来了！！', 0, 1, 23, '/', 9, '2022-04-16 19:01:47', '2022-04-16 19:01:47', 'admin', 'admin', 0, 0, 1);
COMMIT;

-- ----------------------------
-- Table structure for follow
-- ----------------------------
DROP TABLE IF EXISTS `follow`;
CREATE TABLE `follow` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `del_flag` int(1) NOT NULL DEFAULT '0',
  `create_by` varchar(20) DEFAULT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(20) DEFAULT NULL,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `user_id` bigint(20) DEFAULT NULL,
  `accept_user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `user_id` (`user_id`),
  KEY `accept_user_id` (`accept_user_id`),
  CONSTRAINT `follow_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `follow_ibfk_2` FOREIGN KEY (`accept_user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of follow
-- ----------------------------
BEGIN;
INSERT INTO `follow` VALUES (13, 1, 'admin', '2022-04-16 18:35:03', 'admin', '2022-04-16 18:35:12', 1, 9);
INSERT INTO `follow` VALUES (14, 1, 'admin', '2022-04-16 18:35:14', 'admin', '2022-04-16 18:37:11', 1, 9);
INSERT INTO `follow` VALUES (15, 0, 'admin', '2022-04-16 18:43:37', 'admin', '2022-04-16 18:43:37', 1, 9);
INSERT INTO `follow` VALUES (16, 0, 'zhaoyun', '2022-04-16 18:44:14', 'zhaoyun', '2022-04-16 18:44:14', 9, 1);
INSERT INTO `follow` VALUES (17, 0, 'zhaoyun', '2022-04-16 18:49:11', 'zhaoyun', '2022-04-16 18:49:11', 9, 3);
INSERT INTO `follow` VALUES (18, 0, 'zhangsan', '2022-04-16 18:50:50', 'zhangsan', '2022-04-16 18:50:50', 3, 9);
INSERT INTO `follow` VALUES (19, 0, 'zhangsan', '2022-04-16 18:50:53', 'zhangsan', '2022-04-16 18:50:53', 3, 1);
INSERT INTO `follow` VALUES (20, 0, 'admin', '2022-04-16 18:57:33', 'admin', '2022-04-16 18:57:33', 1, 3);
INSERT INTO `follow` VALUES (21, 0, 'admin', '2022-04-16 18:58:30', 'admin', '2022-04-16 18:58:30', 1, 10);
INSERT INTO `follow` VALUES (22, 0, 'admin', '2022-04-16 18:58:36', 'admin', '2022-04-16 18:58:36', 1, 11);
INSERT INTO `follow` VALUES (23, 0, 'mahuateng', '2022-04-16 18:58:53', 'mahuateng', '2022-04-16 18:58:53', 8, 1);
COMMIT;

-- ----------------------------
-- Table structure for friend
-- ----------------------------
DROP TABLE IF EXISTS `friend`;
CREATE TABLE `friend` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `friend_id` bigint(20) NOT NULL COMMENT '好友用户ID',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(255) DEFAULT 'admin' COMMENT '创建人',
  `update_by` varchar(255) DEFAULT 'admin' COMMENT '更新人',
  `del_flag` int(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK5hvavpcp1efcf6vxo09bhi9a7` (`user_id`),
  KEY `friend_id` (`friend_id`),
  CONSTRAINT `friend_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `friend_ibfk_2` FOREIGN KEY (`friend_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of friend
-- ----------------------------
BEGIN;
INSERT INTO `friend` VALUES (1, 1, 2, '2022-03-05 15:28:43', '2022-03-05 15:48:38', 'admin', 'admin', 1);
INSERT INTO `friend` VALUES (10, 1, 9, '2022-03-05 15:55:06', '2022-03-05 15:55:06', 'admin', 'admin', 0);
INSERT INTO `friend` VALUES (11, 1, 3, '2022-03-05 16:44:32', '2022-03-05 16:44:32', 'admin', 'admin', 0);
COMMIT;

-- ----------------------------
-- Table structure for link
-- ----------------------------
DROP TABLE IF EXISTS `link`;
CREATE TABLE `link` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `link_desc` varchar(255) DEFAULT NULL COMMENT '描述',
  `link_name` varchar(255) NOT NULL COMMENT '名称',
  `link_pic` varchar(255) DEFAULT NULL COMMENT '图片URL',
  `link_url` varchar(255) NOT NULL COMMENT '地址',
  `del_flag` int(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `create_by` varchar(20) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(20) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) NOT NULL COMMENT '权限名称',
  `url` varchar(200) NOT NULL COMMENT 'URL',
  `resource_type` varchar(255) NOT NULL COMMENT '类型',
  `pid` bigint(20) NOT NULL COMMENT '上级ID',
  `icon` varchar(255) DEFAULT NULL COMMENT '图标',
  `del_flag` int(1) DEFAULT '0' COMMENT '删除标记',
  `create_by` varchar(20) NOT NULL DEFAULT 'admin' COMMENT '创建人',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(20) DEFAULT 'admin' COMMENT '更新人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `sort` double(11,0) DEFAULT '1' COMMENT '排序号',
  `target` varchar(20) DEFAULT '_self' COMMENT '打开方式',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=197 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of permission
-- ----------------------------
BEGIN;
INSERT INTO `permission` VALUES (1, '首页', '/admin', 'menu', 0, 'fa fa-dashboard', 0, 'admin', '2021-10-15 20:22:36', 'admin', '2022-02-16 12:42:25', 1, '_self');
INSERT INTO `permission` VALUES (6, '获得侧边栏菜单', '/admin/currentMenus', 'button', 1, '', 0, 'admin', '2021-10-15 20:22:36', 'admin', '2022-02-07 23:45:28', 6, '_self');
INSERT INTO `permission` VALUES (70, '用户管理', '/admin/user', 'menu', 0, 'fa fa-user', 0, 'admin', '2021-10-15 20:22:36', 'admin', '2022-03-07 20:07:52', 80, '_self');
INSERT INTO `permission` VALUES (72, '添加用户', '/admin/user/new', 'menu', 70, 'fa fa-circle-o', 0, 'admin', '2021-10-15 20:22:36', 'admin', '2022-02-16 12:54:40', 72, '_self');
INSERT INTO `permission` VALUES (73, '用户保存', '/admin/user/save', 'button', 70, NULL, 0, 'admin', '2021-10-15 20:22:36', 'admin', '2021-10-15 20:30:55', 73, '_self');
INSERT INTO `permission` VALUES (74, '删除用户', '/admin/user/delete', 'button', 70, NULL, 0, 'admin', '2021-10-15 20:22:36', 'admin', '2022-10-15 20:30:55', 74, '_self');
INSERT INTO `permission` VALUES (75, '批量删除用户', '/admin/user/batchDelete', 'button', 70, NULL, 0, 'admin', '2021-10-15 20:22:36', 'admin', '2021-10-15 20:30:55', 75, '_self');
INSERT INTO `permission` VALUES (76, '编辑用户', '/admin/user/edit', 'button', 70, '', 0, 'admin', '2021-10-15 20:22:36', 'admin', '2022-02-16 13:27:24', 76, '_self');
INSERT INTO `permission` VALUES (82, '保存个人信息', '/admin/user/profile/save', 'button', 120, '', 0, 'admin', '2021-10-15 20:22:36', 'admin', '2022-02-07 23:43:51', 82, '_self');
INSERT INTO `permission` VALUES (83, '修改密码', '/admin/user/changePass', 'button', 120, '', 0, 'admin', '2021-10-15 20:22:36', 'admin', '2022-02-07 23:43:41', 83, '_self');
INSERT INTO `permission` VALUES (91, '角色管理', '/admin/role', 'menu', 0, 'fa fa-snowflake-o', 0, 'admin', '2021-10-15 20:22:36', 'admin', '2022-02-16 12:52:05', 91, '_self');
INSERT INTO `permission` VALUES (92, '保存角色', '/admin/role/save', 'button', 91, '', 0, 'admin', '2021-10-15 20:22:36', 'admin', '2022-02-07 23:55:53', 92, '_self');
INSERT INTO `permission` VALUES (93, '编辑角色', '/admin/role/edit', 'page', 91, '', 0, 'admin', '2021-10-15 20:22:36', 'admin', '2022-02-07 23:58:40', 93, '_self');
INSERT INTO `permission` VALUES (94, '删除角色', '/admin/role/delete', 'button', 91, '', 0, 'admin', '2021-10-15 20:22:36', 'admin', '2022-02-07 23:55:47', 94, '_self');
INSERT INTO `permission` VALUES (95, '权限管理', '/admin/permission', 'menu', 0, 'fa fa-podcast', 0, 'admin', '2021-10-15 20:22:36', 'admin', '2022-03-12 15:08:17', 95, '_self');
INSERT INTO `permission` VALUES (96, '保存权限', '/admin/permission/save', 'button', 95, '', 0, 'admin', '2021-10-15 20:22:36', 'admin', '2022-02-07 23:55:45', 96, '_self');
INSERT INTO `permission` VALUES (97, '编辑权限', '/admin/permission/edit', 'page', 95, '', 0, 'admin', '2021-10-15 20:22:36', 'admin', '2022-02-07 23:57:13', 97, '_self');
INSERT INTO `permission` VALUES (98, '删除权限', '/admin/permission/delete', 'button', 95, '', 0, 'admin', '2021-10-15 20:22:36', 'admin', '2022-02-07 23:55:43', 98, '_self');
INSERT INTO `permission` VALUES (106, '获得当前登录用户信息接口', '/admin/currentUser', 'button', 1, '', 0, 'admin', '2022-02-04 10:26:13', 'admin', '2022-02-07 23:37:08', 1, '_self');
INSERT INTO `permission` VALUES (110, '添加权限', '/admin/permission/new', 'menu', 95, 'fa fa-circle-o', 0, 'admin', '2022-02-07 23:14:11', 'admin', '2022-02-16 12:55:01', 1, '_self');
INSERT INTO `permission` VALUES (111, '添加角色', '/admin/role/new', 'menu', 91, 'fa fa-circle-o', 0, 'admin', '2022-02-07 23:19:05', 'admin', '2022-02-16 12:54:51', 1, '_self');
INSERT INTO `permission` VALUES (120, '个人信息', '/admin/user/profile', 'page', 0, '', 0, 'admin', '2022-02-07 23:38:51', 'admin', '2022-02-08 00:02:34', 99, '_self');
INSERT INTO `permission` VALUES (126, '用户列表', '/admin/user', 'menu', 70, 'fa fa-circle-o', 0, 'admin', '2022-02-08 19:20:23', 'admin', '2022-02-16 12:54:33', 0, '_self');
INSERT INTO `permission` VALUES (127, '角色列表', '/admin/role', 'menu', 91, 'fa fa-circle-o', 0, 'admin', '2022-02-08 19:20:54', 'admin', '2022-02-16 12:54:47', 0, '_self');
INSERT INTO `permission` VALUES (128, '权限列表', '/admin/permission', 'menu', 95, 'fa fa-circle-o', 0, 'admin', '2022-02-08 19:21:16', 'admin', '2022-02-16 12:54:57', 0, '_self');
INSERT INTO `permission` VALUES (131, '文章管理', '/admin/post', 'menu', 0, 'fa fa-paint-brush', 0, 'admin', '2022-03-07 19:37:26', 'admin', '2022-03-12 15:06:22', 5, '_self');
INSERT INTO `permission` VALUES (132, '发布文章', '/admin/post/new', 'menu', 131, 'fa fa-circle-o', 0, 'admin', '2022-03-07 19:39:34', 'admin', '2022-03-12 15:06:18', 9, '_self');
INSERT INTO `permission` VALUES (133, '文章列表', '/admin/post', 'menu', 131, 'fa fa-circle-o', 0, 'admin', '2022-03-07 19:40:00', 'admin', '2022-03-12 15:06:15', 8, '_self');
INSERT INTO `permission` VALUES (134, '评论管理', '/admin/comment', 'menu', 0, 'fa fa-comment', 0, 'admin', '2022-03-07 19:46:32', 'admin', '2022-03-12 15:06:12', 11, '_self');
INSERT INTO `permission` VALUES (135, '回复我的', '/admin/comment/receive', 'menu', 134, 'fa fa-circle-o', 0, 'admin', '2022-03-07 19:57:53', 'admin', '2022-03-08 19:35:18', 20, '_self');
INSERT INTO `permission` VALUES (136, '我的评论', '/admin/comment/send', 'menu', 134, 'fa fa-circle-o', 0, 'admin', '2022-03-07 19:58:54', 'admin', '2022-03-12 15:13:32', 2, '_self');
INSERT INTO `permission` VALUES (138, '分类管理', '/admin/category', 'menu', 0, 'fa fa-book', 0, 'admin', '2022-03-07 20:01:36', 'admin', '2022-05-04 12:54:06', 6, '_self');
INSERT INTO `permission` VALUES (140, '删除文章', '/admin/post/delete', 'button', 133, '', 0, 'admin', '2022-03-08 15:02:20', 'admin', '2022-03-12 15:13:24', 1, '_self');
INSERT INTO `permission` VALUES (141, '批量删除文章', '/admin/post/batchDelete', 'button', 133, '', 0, 'admin', '2022-03-08 15:03:02', 'admin', '2022-03-12 15:13:17', 1, '_self');
INSERT INTO `permission` VALUES (142, '编辑文章', '/admin/post/edit', 'page', 133, '', 0, 'admin', '2022-03-08 15:03:49', 'admin', '2022-04-03 22:55:00', 1, '_self');
INSERT INTO `permission` VALUES (143, '保存文章', '/admin/post/save', 'button', 132, '', 0, 'admin', '2022-03-08 15:04:42', 'admin', '2020-03-12 15:13:15', 1, '_self');
INSERT INTO `permission` VALUES (144, '恢复文章', '/admin/post/revert', 'button', 133, '', 0, 'admin', '2022-03-08 15:05:23', 'admin', '2020-03-12 15:13:12', 1, '_self');
INSERT INTO `permission` VALUES (145, '移到回收站', '/admin/post/throw', 'button', 133, '', 0, 'admin', '2022-03-08 15:07:01', 'admin', '2020-03-08 15:07:01', 1, '_self');
INSERT INTO `permission` VALUES (146, '文件上传', '/admin/file/upload', 'button', 132, '', 0, 'admin', '2022-03-08 17:53:01', 'admin', '2020-03-08 17:53:01', 1, '_self');
INSERT INTO `permission` VALUES (147, '保存分类', '/admin/category/save', 'button', 138, '', 0, 'admin', '2022-03-08 18:51:48', 'admin', '2020-05-04 12:53:12', 1, '_self');
INSERT INTO `permission` VALUES (148, '编辑分类', '/admin/category/edit', 'button', 138, '', 0, 'admin', '2022-03-08 18:52:27', 'admin', '2020-03-12 15:05:40', 1, '_self');
INSERT INTO `permission` VALUES (149, '删除分类', '/admin/category/delete', 'button', 138, '', 0, 'admin', '2022-03-08 18:54:13', 'admin', '2020-03-12 15:13:40', 1, '_self');
INSERT INTO `permission` VALUES (151, '标签管理', '/admin/tag', 'menu', 0, 'fa fa-tag', 0, 'admin', '2022-03-08 19:30:16', 'admin', '2020-05-04 12:54:47', 8, '_self');
INSERT INTO `permission` VALUES (152, '删除标签', '/admin/tag/delete', 'button', 151, '', 0, 'admin', '2022-03-08 19:32:56', 'admin', '2020-03-08 19:32:56', 1, '_self');
INSERT INTO `permission` VALUES (153, '所有评论', '/admin/comment', 'menu', 134, 'fa fa-circle-o', 0, 'admin', '2022-03-08 19:34:13', 'admin', '2020-03-13 11:56:36', 1, '_self');
INSERT INTO `permission` VALUES (155, '编辑标签', '/admin/tag/edit', 'page', 151, '', 0, 'admin', '2022-03-08 19:43:06', 'admin', '2020-03-08 19:43:06', 1, '_self');
INSERT INTO `permission` VALUES (156, '保存标签', '/admin/tag/save', 'button', 151, '', 0, 'admin', '2022-03-08 19:44:45', 'admin', '2020-05-04 12:52:52', 1, '_self');
INSERT INTO `permission` VALUES (157, '删除评论', '/admin/comment/delete', 'button', 134, '', 0, 'admin', '2022-03-08 22:13:57', 'admin', '2021-04-16 16:58:31', 1, '_self');
INSERT INTO `permission` VALUES (158, '批量删除评论', '/admin/comment/batchDelete', 'button', 134, '', 0, 'admin', '2022-03-08 22:15:57', 'admin', '2021-04-16 16:59:07', 1, '_self');
INSERT INTO `permission` VALUES (159, '后台回复评论', '/admin/comment/reply', 'button', 134, '', 0, 'admin', '2022-03-08 22:27:39', 'admin', '2021-04-16 16:58:51', 1, '_self');
INSERT INTO `permission` VALUES (160, '置顶文章', '/admin/post/stick', 'button', 133, '', 0, 'admin', '2022-04-03 22:54:45', 'admin', '2020-04-03 22:54:45', 1, '_self');
INSERT INTO `permission` VALUES (161, '取消置顶文章', '/admin/post/unStick', 'button', 133, '', 0, 'admin', '2022-04-03 22:55:22', 'admin', '2020-04-03 22:57:07', 1, '_self');
INSERT INTO `permission` VALUES (162, '推荐文章', '/admin/post/recommend', 'button', 133, '', 0, 'admin', '2022-04-03 22:55:49', 'admin', '2020-04-03 22:55:49', 1, '_self');
INSERT INTO `permission` VALUES (163, '取消置顶文章', '/admin/post/unRecommend', 'button', 133, '', 0, 'admin', '2022-04-03 22:56:16', 'admin', '2020-04-03 22:56:16', 1, '_self');
INSERT INTO `permission` VALUES (165, '相册管理', '/admin/photoCategory', 'menu', 0, 'fa fa-picture-o', 0, 'admin', '2021-03-02 18:35:21', 'admin', '2021-03-02 22:39:14', 30, '_self');
INSERT INTO `permission` VALUES (166, '相册保存', '/admin/photoCategory/save', 'button', 165, '', 0, 'admin', '2021-03-02 18:35:55', 'admin', '2021-03-02 18:35:55', 1, '_self');
INSERT INTO `permission` VALUES (167, '删除相册', '/admin/photoCategory/delete', 'button', 165, '', 0, 'admin', '2021-03-02 18:36:29', 'admin', '2021-03-02 18:36:29', 1, '_self');
INSERT INTO `permission` VALUES (168, '照片列表', '/admin/photo', 'page', 165, '', 0, 'admin', '2021-03-02 18:41:41', 'admin', '2021-03-02 18:41:41', 1, '_self');
INSERT INTO `permission` VALUES (169, '照片上传', '/admin/photo/upload', 'button', 165, '', 0, 'admin', '2021-03-02 18:42:16', 'admin', '2021-03-05 00:13:02', 1, '_self');
INSERT INTO `permission` VALUES (170, '删除照片', '/admin/photo/delete', 'button', 165, '', 0, 'admin', '2021-03-02 18:42:35', 'admin', '2021-03-02 18:42:35', 1, '_self');
INSERT INTO `permission` VALUES (171, '批量删除相册', '/admin/photoCategory/batchDelete', 'button', 165, '', 0, 'admin', '2021-03-03 22:55:59', 'admin', '2021-03-03 22:55:59', 1, '_self');
INSERT INTO `permission` VALUES (172, '相册详情', '/admin/photoCategory/detail', 'button', 165, '', 0, 'admin', '2021-03-03 22:56:23', 'admin', '2021-03-03 22:56:23', 1, '_self');
INSERT INTO `permission` VALUES (173, '照片详情', '/admin/photo/detail', 'page', 165, '', 0, 'admin', '2021-03-05 11:00:09', 'admin', '2021-03-05 11:00:09', 1, '_self');
INSERT INTO `permission` VALUES (174, '照片保存', '/admin/photo/save', 'button', 165, '', 0, 'admin', '2021-03-05 14:09:33', 'admin', '2021-03-05 14:09:33', 1, '_self');
INSERT INTO `permission` VALUES (175, '好友管理', '/admin/friend', 'menu', 0, 'fa fa-users', 0, 'admin', '2021-03-05 14:30:43', 'admin', '2021-04-15 23:45:12', 30, '_self');
INSERT INTO `permission` VALUES (176, '搜索好友', '/admin/friend/search', 'button', 175, '', 0, 'admin', '2021-03-05 14:31:37', 'admin', '2021-04-15 23:45:10', 1, '_self');
INSERT INTO `permission` VALUES (177, '添加好友', '/admin/friend/save', 'button', 175, '', 0, 'admin', '2021-03-05 14:31:51', 'admin', '2021-04-15 23:45:09', 1, '_self');
INSERT INTO `permission` VALUES (178, '删除好友', '/admin/friend/delete', 'button', 175, '', 0, 'admin', '2021-03-05 14:32:03', 'admin', '2021-04-15 23:45:08', 1, '_self');
INSERT INTO `permission` VALUES (179, '批量删除好友', '/admin/friend/batchDelete', 'button', 175, '', 0, 'admin', '2021-03-05 14:32:21', 'admin', '2021-04-15 23:45:07', 1, '_self');
INSERT INTO `permission` VALUES (180, '公告管理', '/admin/notice', 'menu', 0, 'fa fa-volume-up', 0, 'admin', '2021-02-26 14:11:36', 'admin', '2021-02-26 14:12:53', 30, '_self');
INSERT INTO `permission` VALUES (181, '添加公告', '/admin/notice/new', 'page', 180, '', 0, 'admin', '2021-02-26 14:12:06', 'admin', '2021-03-05 17:34:55', 1, '_self');
INSERT INTO `permission` VALUES (182, '保存公告', '/admin/notice/save', 'button', 180, '', 0, 'admin', '2021-02-26 14:13:17', 'admin', '2021-03-05 17:34:56', 1, '_self');
INSERT INTO `permission` VALUES (183, '删除公告', '/admin/notice/delete', 'button', 180, '', 0, 'admin', '2021-02-26 14:13:41', 'admin', '2021-03-05 17:34:56', 1, '_self');
INSERT INTO `permission` VALUES (184, '编辑公告', '/admin/notice/edit', 'page', 180, '', 0, 'admin', '2021-02-26 14:14:01', 'admin', '2021-03-05 17:34:57', 1, '_self');
INSERT INTO `permission` VALUES (185, '丢弃公告', '/admin/notice/throw', 'button', 180, '', 0, 'admin', '2021-02-26 14:27:40', 'admin', '2021-03-05 17:34:57', 1, '_self');
INSERT INTO `permission` VALUES (186, '恢复公告', '/admin/notice/revert', 'button', 180, '', 0, 'admin', '2021-02-26 14:28:07', 'admin', '2021-03-05 17:35:00', 1, '_self');
INSERT INTO `permission` VALUES (190, '反馈管理', '/admin/report', 'menu', 0, 'fa fa-warning', 0, 'admin', '2021-02-24 20:56:43', 'admin', '2021-02-24 22:11:50', 20, '_self');
INSERT INTO `permission` VALUES (191, '删除反馈', '/admin/report/delete', 'button', 190, 'fa fa-circle-o', 0, 'admin', '2021-02-24 21:53:44', 'admin', '2021-02-24 22:11:56', 1, '_self');
INSERT INTO `permission` VALUES (192, '更新反馈信息', '/admin/report/save', 'button', 190, '', 0, 'admin', '2021-02-24 21:54:20', 'admin', '2021-02-24 22:12:02', 1, '_self');
INSERT INTO `permission` VALUES (193, '编辑反馈', '/admin/report/edit', 'page', 190, '', 0, 'admin', '2021-02-24 22:13:46', 'admin', '2021-02-24 22:13:46', 1, '_self');
INSERT INTO `permission` VALUES (194, '批量删除反馈', '/admin/report/batchDelete', 'button', 190, '', 0, 'admin', '2021-02-24 23:03:57', 'admin', '2021-02-24 23:03:57', 1, '_self');
INSERT INTO `permission` VALUES (195, '反馈详情', '/admin/report/detail', 'button', 190, '', 0, 'admin', '2021-02-26 11:27:41', 'admin', '2021-02-26 11:27:41', 1, '_self');
INSERT INTO `permission` VALUES (196, '下架文章', '/admin/post/down', 'button', 133, '', 0, 'admin', '2021-04-15 23:15:02', 'admin', '2021-04-15 23:15:02', 1, '_self');
COMMIT;

-- ----------------------------
-- Table structure for photo
-- ----------------------------
DROP TABLE IF EXISTS `photo`;
CREATE TABLE `photo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `category_id` bigint(20) DEFAULT NULL COMMENT '相册ID',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(255) DEFAULT 'admin' COMMENT '创建人',
  `update_by` varchar(255) DEFAULT 'admin' COMMENT '更新人',
  `del_flag` int(1) NOT NULL DEFAULT '0' COMMENT '删除标志',
  `file_name` varchar(255) DEFAULT NULL COMMENT '照片名称',
  `file_path` varchar(255) DEFAULT NULL COMMENT '照片路径',
  `file_small_path` varchar(255) DEFAULT NULL COMMENT '照片缩略图路径',
  `file_suffix` varchar(255) DEFAULT NULL COMMENT '照片后缀',
  `file_size` varchar(255) DEFAULT NULL COMMENT '照片大小',
  `file_wh` varchar(255) DEFAULT NULL COMMENT '照片尺寸',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK5hvavpcp1efcf6vxo09bhi9a7` (`user_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `photo_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `photo_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for photo_category
-- ----------------------------
DROP TABLE IF EXISTS `photo_category`;
CREATE TABLE `photo_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `cate_name` varchar(100) NOT NULL COMMENT '相册名称',
  `cate_sort` int(11) NOT NULL DEFAULT '1' COMMENT '排序号',
  `cate_desc` varchar(100) DEFAULT NULL COMMENT '描述',
  `del_flag` int(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `create_by` varchar(20) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(20) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `user_id` (`user_id`),
  CONSTRAINT `photo_category_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of photo_category
-- ----------------------------
BEGIN;
INSERT INTO `photo_category` VALUES (1, '北京之旅', 1, '北京之旅的照片', 0, NULL, '2021-03-03 22:24:52', NULL, '2021-03-05 17:25:24', 1);
INSERT INTO `photo_category` VALUES (2, '上海', 1, NULL, 1, NULL, '2021-03-03 22:24:59', NULL, '2021-03-05 17:21:37', 1);
INSERT INTO `photo_category` VALUES (3, '深圳', 1, NULL, 1, NULL, '2021-03-03 22:25:01', NULL, '2021-03-05 17:21:37', 1);
INSERT INTO `photo_category` VALUES (4, '日本之旅', 20, '', 0, NULL, '2021-03-03 22:25:05', NULL, '2021-03-05 17:25:33', 1);
INSERT INTO `photo_category` VALUES (5, '杭州', 1, NULL, 1, NULL, '2021-03-03 22:25:08', NULL, '2021-03-05 17:21:37', 1);
INSERT INTO `photo_category` VALUES (6, '大理', 1, NULL, 1, NULL, '2021-03-03 22:25:12', NULL, '2021-03-05 17:21:37', 1);
INSERT INTO `photo_category` VALUES (7, '重庆', 1, NULL, 1, NULL, '2021-03-03 22:25:19', NULL, '2021-03-05 17:21:37', 1);
INSERT INTO `photo_category` VALUES (8, '韩国', 1, NULL, 1, NULL, '2021-03-03 22:25:25', NULL, '2021-03-03 22:57:48', 1);
INSERT INTO `photo_category` VALUES (9, '哈尔滨', 1, '哈尔滨旅游记录', 1, NULL, '2021-03-03 22:37:58', NULL, '2021-03-05 17:21:37', 1);
COMMIT;

-- ----------------------------
-- Table structure for post
-- ----------------------------
DROP TABLE IF EXISTS `post`;
CREATE TABLE `post` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `allow_comment` int(11) DEFAULT NULL COMMENT '是否允许评论',
  `post_content` longtext NOT NULL COMMENT '内容',
  `post_status` int(11) NOT NULL COMMENT '状态',
  `post_summary` varchar(2000) DEFAULT NULL COMMENT '摘要',
  `post_thumbnail` varchar(255) DEFAULT NULL COMMENT '缩略图',
  `post_title` varchar(255) NOT NULL COMMENT '标题',
  `post_views` bigint(20) NOT NULL COMMENT '访问量',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `comment_size` int(11) NOT NULL COMMENT '评论数',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `post_likes` int(11) NOT NULL COMMENT '点赞数',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(255) DEFAULT 'admin' COMMENT '创建人',
  `update_by` varchar(255) DEFAULT 'admin' COMMENT '更新人',
  `del_flag` int(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `post_type` varchar(10) NOT NULL COMMENT '文章类型',
  `is_recommend` int(1) NOT NULL DEFAULT '0' COMMENT '是否推荐',
  `is_sticky` int(1) NOT NULL DEFAULT '0' COMMENT '是否置顶',
  `post_dis_likes` int(11) NOT NULL DEFAULT '0' COMMENT '点踩数',
  `mark_count` int(11) NOT NULL DEFAULT '0' COMMENT '收藏数',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK5hvavpcp1efcf6vxo09bhi9a7` (`user_id`),
  CONSTRAINT `post_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of post
-- ----------------------------
BEGIN;
INSERT INTO `post` VALUES (14, NULL, '<h2>Kotlin，东宫太子</h2><p>谷歌今天宣布，Kotlin 编程语言现在是 Android 应用程序开发人员的首选语言。</p><p>谷歌在今天的声明中写道：&ldquo;Android 的开发将越来越以 Kotlin 为先。&rdquo;许多新的 Jetpack API 和特性将首先在 Kotlin 中提供。如果你要开始一个新项目，你应该用 Kotlin 来写；用 Kotlin 编写通常意味着更少的代码&mdash;&mdash;更少用于类型、测试和维护方面的代码。&rdquo;</p><p>就在两年前的 2017 年 I/O 大会上，谷歌宣布在其 Android Studio IDE 中支持 Kotlin。考虑到 Java 长期以来一直是 Android 应用程序开发的首选语言，这有点令人惊讶。在过去的两年里，Kotlin 的人气只增不减。谷歌说，超过 50% 的专业 Android 开发人员现在使用该语言开发他们的应用程序，在最新的 Stack Overflow 开发人员调查中，它被列为第四大最受欢迎的编程语言。</p><p>Android 的首席倡导者切特&middot;哈斯 (Chet Haase) 表示：&ldquo;我们宣布，我们正在采取的下一个重大举措是，我们将以 Kotlin 为先。&rdquo;</p><p>哈斯说：&ldquo;我们知道，不是每个人现在都在用 Kotlin，但是我们相信，你会需要它的。&rdquo;&ldquo;你可能有充分的理由继续使用 C++ 和 Java 编程语言，这完全没问题。这些语言不会消失。&rdquo;</p><p>Kotlin，Android 世界的 Swift？</p><p>早在 2015 年，Kotlin 就有&ldquo;Android 世界的 Swift &rdquo;的称号。</p><p>Kotlin 是一门与 Swift 类似的静态类型 JVM 语言，由 JetBrains 设计开发并开源。与 Java 相比，Kotlin 的语法更简洁、更具表达性，而且提供了更多的特性，比如，高阶函数、操作符重载、字符串模板。它与 Java 高度可互操作，可以同时用在一个项目中。</p><p>按照 JetBrains 的说法，根据他们多年的 Java 平台开发经验，他们认为 Java 编程语言有一定的局限性和问题，而且由于需要向后兼容，它们不可能或很难得到解决。因此，他们创建了 Kotlin 项目，主要目标是：</p><ul><li><p>创建一种兼容 Java 的语言</p></li><li><p>编译速度至少同 Java 一样快</p></li><li><p>比 Java 更安全</p></li><li><p>比 Java 更简洁</p></li><li><p>比最成熟的竞争者 Scala 还简单</p></li></ul><p>若在当时看来，Android 世界的 Swift 称号似乎底气不足，更像是一种美好的愿望。那么在 2017、2019 两届的 Google I/O 以后，这个说法可以站住脚了。</p><p>Kotlin 真比 Java 强？</p><p>许多新语言的出现似乎都是源于对某种其它语言的厌倦。似乎 Kotlin 也是如此。但在 JetBrains 看来，Kotlin 项目的原始动机就是为了提升生产力。JetBrains 开发者支持组组长 Hadi Hariri 在接受 InfoQ 采访时表示：</p><p><br></p><p>&rdquo;尽管当时我们已经开发了对几种基于 JVM 的编程语言的支持，我们还是基本都在 Java 环境下写基于 IntelliJ 的 API。IntelliJ 开发系统是基于 Groovy 和 Gant 的，Groovy 也用于测试，RubyMine 中还有一些 JRuby 代码，情况就是如此。我们希望转向更具表现力的语言从而提高生产力。同时，我们不能接受在 Java 互操作性或编译速度方面的妥协。&ldquo;</p><p><br></p><p>Kotlin 与 Java 总是在主观比较</p><p>&ldquo;Kotlin 比 Java 好&rdquo;，&ldquo;Kotlin 可读性比 Java 强&rdquo;，&ldquo;Kotlin 开发速度比 Java 快&rdquo;，类似这样的陈述缺少相关准确数据的支持，所以都归为主观看法一类。</p><p>主观看法是个体开发人员在对与 Kotlin 或 Java 相关的主题作出一个或多个主观判断时形成。</p><p>开发人员的主观判断存在如下问题：</p><ul><li><p>没有与主观判断相关联的量化指标。</p></li><li><p>主观判断存在很大的偏见。</p></li><li><p>主观判断的偏见在开发人员之间存在很大的差异。</p></li></ul><p>由于没有与主观判断相关联的量化指标，建立在这些判断基础上的观点只是反映出了开发人员之前就有的偏见。不同的开发人员可能有着截然不同的偏见，因此，有开发人员认为 Kotlin 是不错（或糟糕）的 Java 替代者并不意味着其他开发人员也这么认为。</p><p>而且，由于没有客观指标，主观分歧就无法客观地消除，这经常会导致&ldquo;口水战&rdquo;。</p><p>相较于 Java，Kotlin 的确在一些方面有较大优势：效率高、易维护、可靠、简单易学。在一些特定场景下，许多 Java 开发者因为某些方面的问题选择了切换到 Kotlin：比如受够了 Java NullPointerException 的人都喜欢 Kotlin 的 Null 安全特性；扩展函数被大量使用；除了扩展 Java 类，人们也常常将 Java 代码迁移到 Kotlin。</p><p>根据英国软件公司 Pusher 调查的数据显示，在样本数 2744 人的调查中，超过 87% 的受调者已经完成了迁移。他们有的使用了迁移向导，有的直接手动修改代码。超过四分之一的受调者迁移到 Kotlin 后又回到了 Java。有技术方面的原因，也有组织方面的原因。其中使用了反射或代码生成的工具是被提及最多的因素。</p><ul><li><p>&ldquo;Kotlin 的枚举不能包含常量。在自定义注解时（比如 @IntDef），为了保持接口的整洁，需要将值保存在枚举中。&rdquo;</p></li><li><p>&ldquo;我们正在使用 Realm，但它不能与数据类一起使用。&rdquo;</p></li><li><p>&ldquo;我们的 Java 代码中使用了 Retrolambda，因为类型缺失，很难转到 Kotlin。&rdquo;</p></li><li><p>&ldquo;另一个团队不喜欢 Kotlin，我们也预料不到会这样。&rdquo;</p></li><li><p>&ldquo;这不是我们决定的，我们是按照公司的规则来的。&rdquo;</p></li></ul><p>Java 依旧是编程语言排行榜上的第一名。但 Java 是最好的语言么？不是，因为在每个领域都有更合适的编程语言。</p><p>那么，Java 语言到底有什么优势可以占据排行榜第一的位置呢？</p><ul><li><p>其一，语法比较简单，学过计算机编程的开发者都能快速上手。</p></li><li><p>其二，在若干了领域都有很强的竞争力，比如服务端编程，高性能网络程序，企业软件事务处理，分布式计算，Android 移动终端应用开发等等。</p></li><li><p>最重要的一点是符合工程学的需求，成为企业软件公司的首选，也受到互联网公司的青睐。</p></li></ul><p>综合而言，Java 语言全能方面是最好的。但同样可以看到，Android 社区拥抱 Kotlin 的速度越来越快，也许有一天，在 Android 世界里，我们会看到 Kotlin 对 Java 的超越。</p><h2><s>为什么谷歌会支持 Kotlin？</s></h2><p><br></p><p>免责声明：以下内容纯属基于既有事实合理推测，毫无任何实锤。</p><p><br></p><p>还记得谷歌与 Oracle 旷日持久的 Java 侵权案吗？这个持续时间长达 8、9 年的纷争目前以谷歌败诉为最新结局，其需要向 Oracle 赔偿 88 亿美元。（编者注：在过去几年时间里，几次裁决分别判两家公司胜诉或败诉。今年 1 月份，谷歌不服判决上诉美国最高法院做最终裁决。）</p><p>事件的起因是在 2010 年，作为 Java 拥有者的 Oracle 认为，谷歌在 Android 系统上无偿使用了 37 个 Java APIs，这侵犯了他们的专利，而在 Android 中还有 9 行代码抄袭了 Java，这侵犯了他们的版权。</p><p>那 9 行代码造成抄袭的缘由据说是因为当时谷歌的一位工程师在为 Android 项目工作的同时，又为 Sun 公司的 OpenJDK 效力，后来，该工程师直接从 OpenJDK 中复制了 9 行代码到 Android 中，由于 Google 没有得到 Sun 公司的授权，所以 Oracle 收购 Sun 之后，Java 易主，这就相当于侵犯了 Oracle 的版权。</p><p>而对于那 37 个 Java APIs，双方各执己见，谷歌认为 API 不应受版权保护，而 Oracle 则认为 谷歌对其的使用具有很强的商业性，再加上用 Java 写的 Android 代码无法在 JVM 上运行，这对 Java 语言是一种分裂，同时 Oracle 认为，Android 通过不当使用 Java API 挤占了 Java ME 可能的市场，这是它巨额索赔的根基。</p><p>2016 年初，Google 发言人表示，Android N（7.0) 不再沿用现有的 Java APIs 内容，而是迁移至基于 OpenJDK 的方法，为开发者创建一个通用代码库。虽然没法规避 Java APIs 官司，但至少可以减少潜在的可能纠纷。</p><p>到了 2017 年的 Google I/O 大会，Google 宣布 Kotlin 成为 Android 开发的一级语言，可以说对 Kotlin 寄予了厚望。此后，Kotlin 也被开发者视为 Java 的替代品。</p><p>在之后的一年时间里，Google 可以说把 Kotlin 当亲儿子看待，为什么这么说呢？让我们来梳理这一年 Google 为 Kotlin 做了什么：</p><ul><li><p>2017 年 11 月，Android Studio 3.0 正式开放下载，此版本的 Android Studio 将 Kotlin 语言支持集成到 IDE 中，在此版本上，代码自动完成和语法突出显示都可以在此版本上平稳运行，今年 4 月推出的 Android Studio 3.1 为 Kotlin 代码提供了更好的 Lint 支持，并通过为 Android Emulator 添加 Quick Boot 功能加快了测试速度。</p></li><li><p>2018 年 2 月，Google 推出预览版本的 Android KTX，Android KTX 是一组扩展程序，它在 Android 框架和支持库上提供了一个良好的 API 层，使 Kotlin 代码更加简洁。</p></li><li><p>在 Google I/O 2018 上，Google 发布了 Android Jetpack，它是下一代的 Android 组件，它将支持库向后兼容和立即更新的优点融合到更多组件中，提高开发速率和质量，不仅如此，Android Jetpack 将全面兼容 Kotlin，而且它还能利用 Android KTX 使得 Kotlin 代码更加简洁。</p></li></ul><p>这些都是 Google 逐渐向 Kotlin 靠拢的证据，虽然还不至于让 Kotlin 完全取代 Java，但不难看出 Google 的&ldquo;偏心&rdquo;。事实上，Kotlin 自己也非常争气：2017 年 11 月，在第一届 Kotlin 专题大会 KotlinConf 上，Kotlin 首席设计师 Andrey Breslav 宣布 Kotlin 将支持 iOS 开发和 Web 开发，这意味着 Kotlin 向全平台开发迈出了重要的一步。</p><p>Kotlin 目前正处于发展的初始阶段，还有很多成长的空间。Google 现在是把它当成 Android 黄昏时期的救命稻草，它能与 Java 100% 互通，但它存在的目的并不是为了取代 Java，只是为了让开发者有多种选择。虽说编程语言只是软件实现的一种工具，开发者无论选择哪种语言都没有绝对的对与错。但在互联网时代，开发者应该懂得审时度势，拥抱变化，才能走得更远。</p>', 0, 'Kotlin，东宫太子谷歌今天宣布，Kotlin 编程语言现在是 Android 应用程序开发人员的首选语言。谷歌在今天的声明中写道：&ldquo;Android 的开发将越来越以 Kotlin 为先', NULL, 'Java 失宠，谷歌宣布 Kotlin 现在是 Android 开发的首选语言', 6, 1, 2, '2021-02-05 18:32:03', 0, '2021-02-26 00:32:18', 'admin', 'admin', 0, 'post', 1, 0, 0, 0);
INSERT INTO `post` VALUES (15, NULL, '<h2>你的面孔，他的&ldquo;玩物&rdquo;</h2><p>&ldquo;上流社会&rdquo;人士从来不缺乏对于新技术的&ldquo;热情&rdquo;。</p><p>2018 年 10 月的一个星期二晚上，Gristedes 便利连锁店的亿万富翁老板 John Catsimatidis 在曼哈顿苏活区附近一家高档意大利餐厅用餐，他的女儿 Andrea 与一名 Catsimatidis 不认识的人一同走了进来。显然，他的女儿没有发现自己的父亲也在这家餐厅里，此时，Catsimatidis 叫服务员走过去拍张照片。</p><p>随后，Catsimatidis 将图片上传到手机上的面部识别应用程序&mdash;&mdash;Clearview AI。该应用程序背后的初创公司拥有一个庞大的数据库，其中包含数十亿张照片，这些照片是从 Facebook、Twitter 和 LinkedIn 等网站上抓取的。几秒钟之内，Catsimatidis 看到了这个神秘男子的照片集，以及它们出现的网址，并且清楚地知道了：他女儿的约会对象是来自旧金山的一位风险投资家。</p><p>Catsimatidis 说：&ldquo;我只是想确保他不是骗子。&rdquo;随后，他将该男子的简历发给了女儿。</p><p>Andrea 的约会对象惊讶于 Catsimatidis 如何迅速地得到这样详尽的信息。而 Andrea 则表示：&ldquo;我了解我父亲，他确实能够做出这样疯狂的事情，他对新的技术非常敏感。&rdquo;</p><p>Catsimatidis 是从公司另一位创始人那里知道了这一应用，而在此前，那位创始人已经把这一应用放在了部分线下商店里，用以侦察小偷或竞争对手的潜入。除此之外，Clearview AI 早已在美国&ldquo;上流社会&rdquo;的聚会中流传开来，他们用这一软件来识别感兴趣的陌生人，或者帮他们想起那些熟悉但不记得名字的脸孔。</p><p>至于 Clearview AI 本身也是很乐于向这些人提供服务的，&ldquo;我们向潜在和现有投资者以及其他战略合作伙伴提供了试用帐户，以便他们可以测试该技术。&rdquo;该公司的联合创始人 Hoan Ton-That 说。</p><p>&ldquo;人脸搜索&rdquo;产业浮出水面</p><p>一张照片，只消数分钟，一个人在全网发布过的照片以及来源就查的一清二楚，这样的操作让人不寒而栗，而其背后的&ldquo;人脸搜索&rdquo;产业更加让人惶恐。</p><p>以 Clearview AI 为例，这家公司虽然以人脸识别技术起家，但是在业内也算得上是&ldquo;名声在外&rdquo;了。</p><p>这家公司声称自己设计了一套人脸识别寻人系统：用户可以通过上传某人的照片到该系统，即可获得此人在全网公开的照片信息及其源头链接，简单来讲就是&ldquo;一张照片，全网寻人&rdquo;。同时，该公司表示，他们从 Facebook，YouTube，Venmo 等数百万其他网站中抓取了约 30 亿张图像，远远超出了美国政府或硅谷科技巨头们建造的任何数据库。</p><p>该公司创始人 Hoan Ton-Town 说，他希望将这套系统提供给执法部门使用，这样可以大大增加走失人员的搜索以及暴恐人员的跟踪力度。比如，Clearview AI 就曾声称协助纽约警方破获了一起疑似爆炸物的案件，虽然纽约警方后来表示案件破获与这家公司并无关系。</p><p><img src=\"https://constatic.geekbang.org/infoq/5e6717a2bde96.png?imageView2/0/w/800\" alt=\"人脸搜索，在AI的阴暗面肆无忌惮\" class=\"fr-fic fr-dii\"></p><p>Clearview AI 号称协助破案的宣传文件</p><p><br></p><p>抛开这一&ldquo;打脸&rdquo;事件不说，像 Clearview AI 这样依靠&ldquo;人脸搜索&rdquo;业务吃饭的公司正在悄悄崛起，甚至在逐渐成长为一个庞大的产业。</p><p>比如，一家名叫 Trustwave 的新加坡公司就推出了一款基于人脸识别的情报搜索工具&mdash;&mdash;SocialMapper。使用方法同样简单，只需要上传一张人脸照片和姓名，就能找到此人在 Twitter、Facebook、LinkedIn、Instagram，甚至微博、豆瓣等等社交媒体上的用户主页。最后，SocialMapper 还会综合这些社交媒体内容出具报告，报告会包含性别、年龄、所在地、电子邮箱等等详细的个人信息。</p><p>除了形形色色的 App，还有一些专门以搜脸找人为核心业务的网站。这些网站往往打着一些看似正义的旗号，比如&ldquo;帮您查看是否有人非法使用您的照片&rdquo;，实际上则是依靠人脸搜索来帮助别有用心之人完成类似人肉搜索的业务。这些网站甚至会对不同的业务明码标价，按级别收费，某些网站的&ldquo;高级 VIP&rdquo;甚至可以获得极其详细的目标人物资料，与之相关的亲属等信息也会统统暴露。</p><p><img src=\"https://constatic.geekbang.org/infoq/5e6717a282e24.png?imageView2/0/w/800\" alt=\"人脸搜索，在AI的阴暗面肆无忌惮\" class=\"fr-fic fr-dii\"></p><p>某人脸搜索宣传</p><p><br></p><h2>在质疑声中成长的人脸识别</h2><p>2020 年 1 月，Twitter 向 Clearview AI 发送了一封停止访问信，指出该公司从其网站收集了照片，这违反了 Twitter 的服务条款，并要求 Clearview AI 停止数据抓取并删除从 Twitter 收集的所有数据；不久后，Facebook 也对 Clearview AI 发出了类似的警告。</p><p>虽然该公司一再强调，其技术&ldquo;仅适用于执法机构和选择安全专业人员作为调查工具&rdquo;。但是也并没有任何行动来制止这项技术被滥用。或许是无能为力，又或者是收到了&ldquo;其他力量&rdquo;的控制，总之 Clearview AI 要面临的问题恐怕不止一两件，据悉，美国伊利诺斯州东部北区地方法院已经向 Clearview AI 提起诉讼，称 Clearview AI 的行为是对公民自由的威胁。</p><p>Clearview AI 未来的命运会如何暂且不表，回过头来说说人脸识别这项质疑声中不断成长的技术。</p><p>安全问题是一直围绕着人脸识别技术的核心话题，虽然无数企业都在强调对于这项技术安全性的保障，并且在很多场景下，人脸识别真的提供了不少的便利，但是质疑一直没能从用户的心头打消。</p><p>相比搜脸寻人这种刚刚崛起的产业，Deepfake、AI 换脸这样的名词或许更能引起人们的警觉。毕竟当换脸技术刚刚兴起的时候，就在全球引发了热议，换脸 App 虽然挑起了一段时间的热度，但更加剧了人们对于人脸识别的恐惧&mdash;&mdash;换脸之后毫无违和感，不正可以用来造假吗？</p><p>受舆论的压力影响，一些换脸 App 下架了，就连 GitHub 也禁封了 Deepfake 的相关开源项目。但是影响已经形成，且仍然有不少人在早先下载好的代码中不断&ldquo;优化&rdquo;，在那些普通用户看不到的地方继续散播着伪造的图片、视频。</p><p>除了来自用户的不信任，人脸识别还被不同国家和地区的立法机构&ldquo;特殊关注&rdquo;，比如第一个全面禁止人脸识别的城市&mdash;&mdash;旧金山，以及号称&ldquo;史上最严&rdquo;的 GDPR 都曾对人脸识别的&ldquo;不正确使用&rdquo;进行过处罚或警告。</p><p>虽然这些严格执行的法律一定程度上保护了用户的隐私安全，但却也不同程度地限制了技术的发展。安全与发展两者如何能全面发展，也成为了立法者与企业不断为之努力的方向。</p><h2>结 语</h2><p>人脸识别，老生常谈，常谈常新。</p><p>技术在进步，制度在完善，但是灰色、黑色的产业链却总也没法一网打尽，本该用来向善的科技也在那些阴暗的角落里滋生更多的病毒，甚至成为某些权钱交易的&ldquo;桥梁&rdquo;。是的，技术向善在与人，但人心若向恶又当如何？</p><p>拓展阅读：</p><p>https://www.infoq.cn/article/422lAN7NjQVkRYuZ8vcs</p><p>https://www.nytimes.com/2020/03/05/technology/clearview-investors.html</p>', 0, '你的面孔，他的&ldquo;玩物&rdquo;&ldquo;上流社会&rdquo;人士从来不缺乏对于新技术的&ldquo;热情&rdquo;。2018 年 10 月的一个星期二晚上，Gristedes', NULL, '人脸搜索，在 AI 的阴暗面肆无忌惮', 2, 1, 0, '2021-02-05 18:32:03', 0, '2021-02-26 00:32:17', 'admin', 'admin', 0, 'post', 1, 0, 0, 0);
INSERT INTO `post` VALUES (16, NULL, '<p>&ldquo;去 O&rdquo;一直是最近 10 年描述系统架构改造中最常出现的词之一。虽然&ldquo;去 O&rdquo;被很多工程师和技术从业者津津乐道，但业界真正能实现把系统全部去 O，特别是金融场景的核心系统全部去 O 的案例并不多。那么去 O 到底难在哪里呢。</p><p>为了解答这个问题，首先我们要理解去 O 架构改造的本质是什么？去 O 架构改造的本质其一是让系统架构具备在线更换数据库的能力，无论去 O 的目标库是 MySQL，或是其他的关系型数据库，最终都是要解决这样一个问题。</p><p>在线更换数据库到底难在哪里，会遇到哪些问题呢？</p><p>问题一：如何无感知的实时动态数据的迁移？</p><p>首先数据库作为交易型系统最核心的组件没有之一，这一点对于数据库的重要性评价一点都不夸张。当前大部分知名的网站和系统都是 7x24 小时对外提供服务，数据库也是 7*24 小时无时不刻处理着大量的读写服务，要实现去 O 就意味着你要在一个 Oracle 库还在对外提供服务的时候，在某个时间点让一个 MySQL 库快速替换掉 Oracle 库，并平稳的接管 Oracle 的所有服务。</p><p>不同于无状态的系统组件切换把流量切走即完成切换工作，而数据库作为有状态的系统组件，如何设计一套从应用改造、到数据同步、再到数据库流量切换的稳妥去 O 方案，可以非常谨慎的把一个正在对外提供服务，数据处在实时变化状态的 Oracle 库上的数据无缝的方式迁移至 MySQL 中。</p><p>为了有效解决这个问题，陆金所研发的去 O 工具包含一整套完善的在线数据迁移功能。在工具中勾选需要去 O 的 Oracle 表，工具会自动完成 O to M 的全量同步、增量同步，并通过解析 Oracle redolog 来追增量日志，最终形成一个 Oracle 为主库，MySQL 为备库的异构实时备库。</p><p>问题二：如何管理和协调好高频迭代的去 O 改造和功能改造？</p><p>其次去 O 架构改造的主体工作是对应用层代码的重构，特别对 DAO（数据访问层）的重构，对于某些复杂的系统来说，重构的时间会持续数月甚至更久。在这段漫长的去 O 改造时间窗口里，不但 Oracle 库的数据在动态发生变化，对于一个处在高速迭代中的网站和系统来说，应用的功能代码也在不断发生变化。如果 A 团队在为应用做去 O 架构改造，而这个期间 B 团队在不断的给应用开发新的功能，如何进行去 O 的工作拆分可以有效的管理和协调好两个开发团队的编码和上线节奏呢。</p><p>为了有效应对这个场景，陆金所研发的去 O 工具会在去 O 架构改造和应用业务改造之前进行有效协调，并向业务开发尽可能屏蔽去 O 架构改造的影响。比如业务改造需要在处于 O 和 M 并行双写的库上修改表结构并发布新的数据库访问接口，大量的工作会由去 O 工具来自动化完成。</p><p><img src=\"https://static001.infoq.cn/resource/image/39/7a/39c99b11fc68e8b8ea609136066a807a.png\" alt=\"金融系统去Oracle实践，到底需要解决哪些问题？\" class=\"fr-fic fr-dii\"></p><p>问题三：如何稳妥落地数据库流量的在线切换？</p><p>当某个库的应用去 O 改造完成并上线后，会实施生产环境 Oracle 的流量切换到 MySQL 上。在这个切换过程中，如何确保 Oracle 上的最后一笔事务提交成功，并同步到 MySQL 后完成数据一致性校验，且针对这个 Oracle 库的所有写操作能在快速、全部切换到 MySQL 上，不会出现部分写流量 Oracle，部分写流量 MySQL，两库双写的异常状态。</p><p>当流量切换到 MySQL 后 a，如果出现应用报错或 bug、MySQL 性能问题等在前期压测或准备工作中未覆盖到的突发情况，如何实现流量快速回切到 Oracle 上，且确保在 MySQL 中写入的数据也能完全一致的回到 Oracle 中。</p><p>解决好这个问题，是控制好去 O 落地风险的核心所在。陆金所设计了一整套在线切换数据库的架构框架来确保在瞬间把流量从 Oracle 切走到 MySQL 中，同时也可以瞬间把流量切回到 Oracle，并确保两边的数据完全一致。</p><p><img src=\"https://static001.infoq.cn/resource/image/cb/79/cb77e1221fa15a28a0967a50ec500379.png\" alt=\"金融系统去Oracle实践，到底需要解决哪些问题？\" class=\"fr-fic fr-dii\"></p><p>问题四：如何有效拆分去 O 的任务，从而实现对全站业务单次影响小、迭代频度快的去 O 上线？</p><p>要实现全站去 O，必然面临着对一些复杂、庞大的核心系统进行去 O 改造。以陆金所为例，在全站中像用户中心、资产中心、资金账户等这种给全站所有金融产品线都提供基础服务的子系统就是这类复杂和庞大的核心系统，同时包括基金、主账户等专属金融产品线的业务逻辑复杂，所以子系统也非常庞大。</p><p>所以对于这类子系统，如果需要在一个大版本里全部去 O 改造完成，并在一个晚上业务低峰期一次性全部从 O 切换到 M，无论是当晚的切换风险，还是切换完成后，在第二天业务高峰期出现问题和 bug 的风险，包括开发团队短时间内去 O 改造的工作量和出现重大 bug 的机率都是非常大且不可控的。</p><p>如何把一个庞大且重要的复杂子系统拆分成多个去 O 的版本按批次上线和切换流量，且做到单个批次影响可控，也是全站去 O 中需要谨慎设计的方案。</p><p>而这也是整个去 O 过程中架构设计最有趣的部分。</p><p>上面提到了去 O 中在架构层实现在线换库需要解决的四大问题。除了在线换库外，去 O 架构改造的本质其二是引入更多的存储引擎在合适的场景来承接 Oracle 数据库的计算和存储能力。这就引出了第五个问题。</p><p>问题五：如何在各种场景下使用合适的开源存储引擎来去 O，并且在架构上进行融合。</p><p>首先 Oracle 是个非常强大的关系型数据库，无论在 OLTP 和 OLAP 场景表现都很出色，且具备一整套完善、好用的运维和监控工具。但于此同时 Oracle 虽然对各种场景支持较为全面，但在各个特定场景下，一些开源的数据库或存储引擎在性能或成本投入的综合考量上胜过 Oracle，都会是比 Oracle 更合适的选择方案。</p><p>所以全站去 O 不仅仅是去 O 到 MySQL 中，MySQL 能承接的只是 Oracle 的部分计算和存储能力，在整个陆金所的全站去 O 落地过程中，除了 MySQL 外，我们还在不同的场景下使用 ES、HBase、TiDB、Impala+kudu 等存储引擎，甚至是应用层的代码来承接和替换 Oracle，并且整体收益比使用 Oracle 更好。</p><p>在完成去 O 后，陆金所的生产环境出现了大量开源的存储引擎来支撑各种合适的业务场景。同时我们也研发了数据总线平台来实现数据在一个地方写入和提交，秒级同步到其他存储引擎的架构。</p><p><img src=\"https://static001.infoq.cn/resource/image/8a/8e/8a4b88fcfeab8fa62c6c6b5a6617418e.png\" alt=\"金融系统去Oracle实践，到底需要解决哪些问题？\" class=\"fr-fic fr-dii\"></p><p>上述是陆金所在全站去 O 过程中遇到的 5 个实战问题大类，整个全站去 O 过程中需要解决细节问题还有很多，这里无法一一列举，因为去 O 作为一个复杂的系统架构改造本身就要求技术团队事无巨细的处理好各种细节问题。</p><p>基于此，陆金所优化和开发了一整套方案和工具来，有效推进去 O 改造稳妥落地且保障风险可控。后续会推出一个系列的去 O 专题和大家分享，希望给有去 O 改造计划的技术团队和公司带来一些参考和借鉴价值，敬请期待。</p>', 0, '&ldquo;去 O&rdquo;一直是最近 10 年描述系统架构改造中最常出现的词之一。虽然&ldquo;去 O&rdquo;被很多工程师和技术从业者津津乐道，但业界真正能实现把系统全部去 O，特别', NULL, '金融系统去 Oracle 实践，到底需要解决哪些问题？', 0, 3, 0, '2021-02-05 18:32:03', 0, '2021-02-26 00:32:19', 'admin', 'admin', 1, 'post', 0, 0, 0, 0);
INSERT INTO `post` VALUES (17, NULL, '<p>前几天，我在 Reddit 上面闲逛的时候，发现了一篇有趣的文章，名为《影响我们世界的十大算法》。作者 George Dvorsky 希望通过此文解释算法在当今世界上的重要意义，以及哪些算法为我们的文明做出突出贡献。</p><p>现在，如果大家对于算法有些涉猎，那么在读过文章后的第一个想法很可能是&mdash;&mdash;作者真的知道算法是什么吗？或者说 Facebook 新闻源是否属于算法？因为如果 Facebook 新闻源也是一种算法，那么我们几乎可以把一切东西都归结为算法。因此，我希望在本篇文章中解释算法的真实定义，而后探讨 10 种（或者更多）真正支配着整个世界的算法。</p><p>算法究竟是什么？</p><p><br></p><p>直白地讲，算法是指一切经过明确定义的计算过程，其将某个或者某组值作为输入内容，并产生某个或者某组值作为输出结果。因此，算法代表的是一系列计算步骤，用于将输入转换为输出。&mdash;&mdash;资源来源：Thomas H. Cormen 与 Chales E. Leiserson (2009 年)，《算法导论》第 3 版。</p><p><br></p><p>更简单地总结，我们可以将算法视为一系列用于解决某个任务的步骤（是的，不仅仅是计算机会使用算法，人类同样在使用算法）。就目前的标准来看，算法应当具有以下三大重要特征才被视为拥有实际效果：</p><ol><li><p>应该是有限的: 算法应该在有限的时间内用有限的步骤解决掉其旨在解决的问题，也就是说算法必须在有限的时间内可以完成，要不然就没有现实意义。</p></li><li><p>应该具有明确的指令: 算法中的每个步骤必须经过精确定义 ; 同时应针对每种情况做出明确说明。</p></li><li><p>应该切实有效: 算法应当能够解决其旨在解决的问题。此外，算法应该被证明可以单纯利用纸笔工具实现收敛。</p></li></ol><p>此外，需要强调的是算法的应用不仅局限于计算科学，同时它也作为一种数学实体。事实上，早在公元前 1600 年就已经出现第一条记录在案的数学算法&mdash;&mdash;巴比伦人发现了最早的已知算法，用于分解平方根。因此，回到文章开头我们讨论的问题，我读到的那篇文章将算法视为计算实体，但如果采取这样一个更为宽泛的定义，那么支配世界的十大算法很可能体现为算术方法（例如减法、乘法等）。</p><p>但是，如果采取我们在本文中做出的算法定义，那么问题仍然存在：支配世界的十种算法究竟有哪些？在这里，我列出一份小小的清单，排名不分先后。</p><p>1. 合并排序，快速排序与堆排序</p><p><img src=\"https://static001.geekbang.org/wechat/images/28/28f8f7971b1f226775a563ddb63184ed.png\" alt=\"真正支配世界的十种算法\" class=\"fr-fic fr-dii\"></p><p>对元素进行排序的最佳算法是什么？具体答案取决于你的实际需要，因此我把这三种比较常用的排序算法列为同一类 ; 也许你更偏爱其中一种，但事实上三者都非常重要。</p><p>其中合并排序算法是迄今为止我们所拥有的最为重要的算法之一。这是一种基于比较的排序算法，以分治的方法解决原本时间复杂度为 O(n^2) 的问题。该算法由数学家 John von Neumann 于 1945 年发明得出。</p><p>快速排序是另一种用于解决排序问题的方法，其能够实现就地分区，同样属于一类分而治之的算法。该算法的问题在于其在排序方面并不稳定，但在对基于内存的数组进行排序时表现出色。</p><p>最后是堆排序算法，其利用优先级队列来减少数据中的搜索时间。该算法同样属于就地算法，且同样不属于稳定排序。</p><p>这些算法相较于我们之前使用过的其它方法（例如冒泡排序）有了很大的改进。事实上，正是由于这些算法的出现，我们才得以迎来数据挖掘、人工智能等网络上常见的众多现代计算工具。</p><p>2. 傅利叶变换与快速傅利叶变换</p><p><img src=\"https://static001.geekbang.org/wechat/images/46/467017bc978831b23a99833f2c2d3872.jpeg\" alt=\"真正支配世界的十种算法\" class=\"fr-fic fr-dii\"></p><p>整个数字世界都在使用这些简单但非常强大的算法，这些算法能够将信号从时域转换为频域，反之亦然。事实上，正是由于这些算法的存在，本篇文章才能被更多朋友所看到。</p><p>互联网、Wi-Fi、智能手机、电话、计算机、路由器以及卫星等几乎一切具有内置计算装置的设备都会以这样或者那样的方式使用这些算法以保持运行。如果不研究这些重要的算法，大家也不可能拿下电子学、计算机或者通信科学学位。</p><p>3. 迪杰斯特拉算法（Dijkstra，又译戴克斯特拉算法）</p><p><img src=\"https://static001.geekbang.org/wechat/images/8a/8a6e051c7cf08e18f9c537126f4fc1be.jpeg\" alt=\"真正支配世界的十种算法\" class=\"fr-fic fr-dii\"></p><p>实事求是地讲，如果没有这种算法，互联网根本无法像今天这样保持高效运作。这种图搜索算法具有多种应用方式，能够将需要解决的问题建模为图，并在其中找到两个节点间的最短路径。</p><p>今天，虽然我们已经拥有更好的最短路径问题解决方案，但迪杰斯特拉算法仍然在强调稳定性的众多系统当中得到广泛应用。</p><p>4. RSA 算法</p><p>如果没有加密与网络安全机制作为保障，互联网的重要程度不可能达到如今的水平。大家可能会想&ldquo;胡说，国家安全局局和众多情报机构的监控早就毁掉了互联网安全&rdquo;或者&ldquo;互联网根本就没有安全可言，傻子才会相信这种安全宣传&rdquo;; 但必须承认，大多数人仍然具有一定程度的安全信心，否则你根本就不会通过互联网进行消费。毕竟如果真的否定现有网络体系的安全性，谁会愿意在 Web 服务中输入自己的信用卡号码？</p><p>在密码学领域，有一种算法仍然是目前世界上最重要的算法之一，这就是 RSA 算法。该算法由 RSA 公司的创始人们开发而成，使得密码学成果得以供世界上的每个人随意使用，甚至最终塑造了当今密码学技术的实现方式。RSA 算法希望解决的问题是如何在独立平台及最终用户之间共享公钥，从而实现加密（当然，我认为 RSA 算法并没能彻底解决这个问题，从业者们还需要在这个方向上投入更多努力）。</p><p>5. 安全哈希算法</p><p>这实际上并不是真正的算法，而是由 NIST（美国国家标准技术研究所）所开发的一系列加密散列函数。然而，该算法家族对于世界秩序的维持起到了至关重要的作用。从应用程序商店、电子邮件、防病毒软件再到常用的网络浏览器，这一切都在使用这类算法（实际上，使用的是由这类算法生成的哈希值），用以确定你所下载的是否正是你希望获得的内容，或者你是否已经成为中间人攻击或者网络钓鱼攻击的受害者。</p><p>6. 整数分解</p><p>这是一种在计算领域被大量采用的数学算法。如果没有这种算法，密码学技术的安全水平将受到严重破坏。该算法用于将复合数的质数因子分解为较小的非零因数。这也被称为 FNP 类问题，属于 NP 类问题的扩展，且解决难度极高。</p><p>很多加密协议都以分解大型复合整数或相关问题的难度为基础&mdash;&mdash;RSA 算法就是其中的典型代表。正是由于对任意整数进行因子分解的难度极高，才使得基于 RSA 的公钥加密机制拥有较高的安全性水平。</p><p>量子计算的诞生大大降低了此类问题的解决难度，并开辟出一个全新的科学研究领域&mdash;&mdash;利用量子特性保障系统安全。</p><p>7. 链接分析</p><p><img src=\"https://static001.geekbang.org/wechat/images/60/607519b2cd07fb2322ba95028d7800c9.jpeg\" alt=\"真正支配世界的十种算法\" class=\"fr-fic fr-dii\"></p><p>在互联网时代下，分析不同实体间的关系当然非常重要。从搜索引擎到社交网络再到营销分析工具，每一方都在努力发现随着时间推移而不断变化的互联网结构。</p><p>链接分析可以说是普罗大众眼中最神秘也最难以理解的算法之一。问题在于，我们可以通过多种不同方法实现链接分析，而且多种特征的存在使得每种算法间都存在着一定差异（允许对算法申请专利），但其底层基础却又高度相似。</p><p>链接分析背后的基本思路非常简单，即允许使用者以矩阵的形式表示图形，从而将其转化为特征值问题。这一特征值可以为我们提供衡量图形结构以及各节点相对重要性的好方法。该算法由 Gabriel Pinski 与 Francis Narin 于 1976 年发明得出。</p><p>那么，谁在使用这一算法？谷歌公司需要进行网页排名，Facebook 需要发布新闻提要（因此，我们将 Facebook 的新闻源服务视为算法结果，而非算法本身），Google+ 与 Facebook 的好友推荐，LinkedIn 的工作岗位与联系人推荐，Netflix 与 Hulu 的影视关联、YouTube 的相关视频等等皆属于这一类。虽然其各自拥有不同的目标与参数组合，但背后的数学原理却是相通的。</p><p>最后，我想强调一点，虽然很多人认为谷歌公司似乎是第一家使用这种算法的企业，但早在 1996 年（谷歌公司诞生的两年之前），由 Robin Li 开发的 RankDex 小型搜索引擎已经开始利用这一基本思路进行页面排名。最终，HyperSearch 的创始人 Massimo Marchiori 也开始使用这种基于单页间关系的页面排名算法。（谷歌在其申请的专利当中提到了这两位奠基者。）</p><p>8. 比例微积分算法</p><p><img src=\"https://static001.geekbang.org/wechat/images/a1/a182389909a26e8162b1344fed251c3f.png\" alt=\"真正支配世界的十种算法\" class=\"fr-fic fr-dii\"></p><p>大家应该都体验过飞机、汽车、卫星服务或者手机网络吧？有些朋友还在工厂当中看到过机器人设备。如果是这样，那么你已经见识到了这一算法的威力。</p><p>该算法旨在利用控制回路反馈机制以最大程度控制期望输出信号与实际输出信号间的误差。其适用于一切存在信号处理需求的场景，包括以自动化方式通过电子技术控制的机械、液压或者热力系统。</p><p>也可以说，如果没有这种算法，那么我们的现代文明将无从谈起。</p><p>9. 数据压缩算法</p><p>很难确定哪种压缩算法的重要性最高，因为根据实际应用需求，大家使用的算法可能包括 zip、mp3 乃至 JPEG 以及 MPEG-2 等等。但相信大家都能清晰地感受到这些算法在各类结构中的重要作用。</p><p>除了最直观的文件压缩之外，大家还能在哪里看到压缩算法的踪影？很明显，网页会利用数据压缩技术控制你需要下载的文件体积，此外视频游戏、视频、音乐、数据存储、云计算以及数据库等也都是数据压缩算法大显身手的舞台。可以说，万事万物都离不开数据压缩，这类算法的存在使得系统能够以成本更低且效率更高的方式为用户服务。</p><p>10. 随机数生成算法</p><p><img src=\"https://static001.geekbang.org/wechat/images/dc/dc6bb6867496c7050a38842e37e306c7.png\" alt=\"真正支配世界的十种算法\" class=\"fr-fic fr-dii\"></p><p>今天，我们还没有&ldquo;真正的&rdquo;随机数生成器，但已经拥有众多完全可以满足需求的伪随机数生成器。这些算法广泛存在于互连链接、加密、安全哈希算法、视频游戏、人工智能、优化、问题条件初始化以及财务等领域。</p><p>最后，我想补充一点：这份清单只代表一种观点，而非真正全面的列表。因为在机器学习、矩阵乘法以及分类等领域还存在着诸多堪称文明社会根基的重要算法，而我在本文中并没有明确提及。</p>', 0, '前几天，我在 Reddit 上面闲逛的时候，发现了一篇有趣的文章，名为《影响我们世界的十大算法》。作者 George Dvorsky 希望通过此文解释算法在当今世界上的重要意义，以及哪些算法为我们的文', NULL, '真正支配世界的十种算法', 2, 1, 0, '2021-02-05 18:32:03', 0, '2021-02-26 00:32:20', 'admin', 'admin', 0, 'post', 0, 0, 0, 0);
INSERT INTO `post` VALUES (18, NULL, '<p><br></p><p><img src=\"https://static001.infoq.cn/resource/image/5b/50/5bbc22ba8f487342066a19210f02e050.jpg\" alt=\"开发安全、高质量代码的5款顶级Python工具\" class=\"fr-fic fr-dii\"></p><p>为提高代码的质量、安全性和可维护性，软件工程师每天会用到无数工具。</p><p>我会列出一些自己最喜欢的 python 工具，并从易用性（是否易于安装、运行和自动化）、质量影响（能否阻止可预见的 bug）、可维护性影响（是否让工作更轻松）和安全性影响（能否发现并阻止安全性问题）对它们进行打分，以供读者参考。</p><p>并且，我还将介绍如何将这些工具全包含进 CI pipeline，从而实现自动化和高效。</p><h2>1.Pipenv</h2><p>它是为Python 设计的开发管理和依赖管理的工具，最早由&nbsp;Requests&nbsp;的作者&nbsp;Kenneth Reitz&nbsp;编写。</p><p>如果你用 python 做过一段时间的开发，那么管理环境，你可能用过&nbsp;virtualenv&nbsp;或&nbsp;venv&nbsp;；依赖管理可能用过较可靠的pip freeze &gt; requirements.txt。</p><p>大多数情况下，这完全没问题。但是，我发现 pipenv 更方便，且很强大，加上它通过Pipfile和Pipfile.lock近乎去掉固定依赖的做法，很大程度上替代了requirements.txt，从而带来更可靠的部署。</p><p>不过，我对 pipenv 的未来有点担忧，因为 Python 基金会已搁置对 pip 的改进。而且，pipenv 在 2019 年缺乏实质性进展。但是，我仍然认为，对大多数 python 用户来说，pipenv 是绝佳的工具。</p><p>官网下载地址</p><p>月下载量： 2111976</p><p>备选方案：&nbsp;poetry&nbsp;、&nbsp;virtualenv&nbsp;、&nbsp;venv</p><p><img src=\"https://static001.infoq.cn/resource/image/0a/cb/0ac04953d9c3d17bf5f6b6997a779ecb.jpg\" alt=\"开发安全、高质量代码的5款顶级Python工具\" class=\"fr-fic fr-dii\"></p><h2>2.Ochrona</h2><p>这里，我有点私心，因为 Ochrona 是我积极开发并希望 2020 年发布的工具。不过，我还会介绍这个工具的替代方案。</p><p>Ochrona 是一款依赖分析和软件组成分析的工具，它可以用来检查你的开源依赖是否存在已知漏洞。这个领域，另一款很流行的开源工具是 pyup.io 的&nbsp;Safety&nbsp;。</p><p>我认为，Ochrona 比 Safety 更好的地方在于：</p><ol><li>无论是用于开源项目还是商业项目，它都提供免费方案，而且免费方案始终跟进最新的漏洞信息。</li><li>磁盘和 IO 使用非常少。不同于需要拉取整个漏洞数据库的本地工具，它是 SaaS 模式，只需调用一次公开的 API。</li><li>它提供优秀的漏洞数据并且每天更新，并比其他工具提供更多的漏洞详细信息，包括免费用户。</li></ol><p>官网下载地址</p><p>月下载量： 尚未发布</p><p>备选方案：&nbsp;safety&nbsp;、&nbsp;snyk&nbsp;(收费)</p><p><img src=\"https://static001.infoq.cn/resource/image/73/20/73bb1b1f17b2941c74f03f5b7baed220.jpg\" alt=\"开发安全、高质量代码的5款顶级Python工具\" class=\"fr-fic fr-dii\"></p><h2>3.Bandit</h2><p>如果必须推荐一个可提高 python 项目安全性的工具，那我推荐&nbsp;Bandit&nbsp;。</p><p>据悉，Bandit 出自 OpenStack，但现在由&nbsp;PyCQA&nbsp;维护。它是一款开源的 SAST（静态应用安全测试）工具，免费、可配置且快速。从某些方面来讲，它就像是关注安全领域的 linter。</p><p>Bandit 很适合用来发现问题，比如不安全的配置、已知的不安全模块使用情况等。</p><p>官网下载地址</p><p>月下载量： 575101</p><p>备选方案：&nbsp;pyre&nbsp;、&nbsp;pyt&nbsp;、&nbsp;dodgy</p><p><img src=\"https://static001.infoq.cn/resource/image/81/5d/8186f94fe7feab5fb5a235799f7eec5d.jpg\" alt=\"开发安全、高质量代码的5款顶级Python工具\" class=\"fr-fic fr-dii\"></p><h2>4.Black</h2><p>Black 是一款独特的代码格式化工具。它能自动将你的代码更正为 Black 样式（一个 Pep-8 的超集）。</p><p>传统的 linter 通常需要你把代码改为合规代码，而 Black 可以节省不少时间。并且，Black 只需有限的配置，这意味着你如果用过 Black，其他任何项目你都会觉得眼熟。</p><p>官网下载地址</p><p>月下载量： 1891711</p><p>备选方案：flake8、pylint</p><p><img src=\"https://static001.infoq.cn/resource/image/9b/35/9b8ef5b5261e1f3110fbe0dbb32d9c35.jpg\" alt=\"开发安全、高质量代码的5款顶级Python工具\" class=\"fr-fic fr-dii\"></p><h2>5.Mypy</h2><p>它是python 一个可选的静态类型检查器。&nbsp;PEP 484&nbsp;引入 python 的类型提示，Mypy 则利用这些类型提示对项目进行静态类型检查。</p><p>Python 依然有动态的 duck 类型，不过，添加静态类型检查能帮你减少测试和调试时间，更早发现错误。</p><p>目前，大公司也在跟进 python 的静态类型检查。在 Guido van Rossum 任职期间，Dropbox 用 Mypy 检查了 400 多万行代码。其他的 python 用户，比如 Instagram 也开始做静态类型检查。</p><p>官网下载地址</p><p>月下载量： 2487228</p><p>备选方案：&nbsp;pyre</p><p><img src=\"https://static001.infoq.cn/resource/image/06/18/061ec86ab8565a673459ad83368fc418.jpg\" alt=\"开发安全、高质量代码的5款顶级Python工具\" class=\"fr-fic fr-dii\"></p><h2>全部集成到一起</h2><p>这个例子种，我会用到&nbsp;Travis-CI&nbsp;，配置其他 CI 工具的过程与之类似相似，只是语法上会有差异。这里，我用一个简单、不安全且有问题的 flask 应用作为例子。</p><p>app.py文件如下：</p><p>复制代码</p><pre><table><tbody><tr><td><div data-line-number=\"1\">\n</div></td><td><p>from flask import Flask </p></td></tr><tr><td><div data-line-number=\"2\">\n</div></td><td><p>     </p></td></tr><tr><td><div data-line-number=\"3\">\n</div></td><td><p>app = Flask(__name__) </p></td></tr><tr><td><div data-line-number=\"4\">\n</div></td><td><p>    </p></td></tr><tr><td><div data-line-number=\"5\">\n</div></td><td><p>@app.route(&#39;/&lt;name&gt;&#39;) </p></td></tr><tr><td><div data-line-number=\"6\">\n</div></td><td><p>def hello_world(name: str) -&gt; str: </p></td></tr><tr><td><div data-line-number=\"7\">\n</div></td><td><p>    return hello_name(name)</p></td></tr><tr><td><div data-line-number=\"8\">\n</div></td><td><p>def hello_name(name: str) -&gt; int:</p></td></tr><tr><td><div data-line-number=\"9\">\n</div></td><td><p>    return f&quot;hello, {name}&quot;</p></td></tr><tr><td><div data-line-number=\"10\">\n</div></td><td><p>    </p></td></tr><tr><td><div data-line-number=\"11\">\n</div></td><td><p>if __name__ == &#39;__main__&#39;: </p></td></tr><tr><td><div data-line-number=\"12\">\n</div></td><td><p>    app.run(debug=True)</p></td></tr></tbody></table></pre><p>Pipfile如下：</p><p>复制代码</p><pre><table><tbody><tr><td><div data-line-number=\"1\">\n</div></td><td><p>[[source]]</p></td></tr><tr><td><div data-line-number=\"2\">\n</div></td><td><p>name = &quot;pypi&quot;</p></td></tr><tr><td><div data-line-number=\"3\">\n</div></td><td><p>url = &quot;https://pypi.org/simple&quot;</p></td></tr><tr><td><div data-line-number=\"4\">\n</div></td><td><p>verify_ssl = true</p></td></tr><tr><td><div data-line-number=\"5\">\n</div></td><td><p>\n</p></td></tr><tr><td><div data-line-number=\"6\">\n</div></td><td><p>[dev-packages]</p></td></tr><tr><td><div data-line-number=\"7\">\n</div></td><td><p>bandit = &quot;*&quot;</p></td></tr><tr><td><div data-line-number=\"8\">\n</div></td><td><p>v = {editable = true,version = &quot;*&quot;}</p></td></tr><tr><td><div data-line-number=\"9\">\n</div></td><td><p>black = &quot;*&quot;</p></td></tr><tr><td><div data-line-number=\"10\">\n</div></td><td><p>mypy = &quot;*&quot;</p></td></tr><tr><td><div data-line-number=\"11\">\n</div></td><td><p>ochrona = &quot;*&quot;</p></td></tr><tr><td><div data-line-number=\"12\">\n</div></td><td><p>\n</p></td></tr><tr><td><div data-line-number=\"13\">\n</div></td><td><p>[packages]</p></td></tr><tr><td><div data-line-number=\"14\">\n</div></td><td><p>flask = &quot;==0.12.2&quot;</p></td></tr><tr><td><div data-line-number=\"15\">\n</div></td><td><p>\n</p></td></tr><tr><td><div data-line-number=\"16\">\n</div></td><td><p>[requires]</p></td></tr><tr><td><div data-line-number=\"17\">\n</div></td><td><p>python_version = &quot;3.7&quot;</p></td></tr></tbody></table></pre><p>最后在根目录下创建一个.travis.yml文件，内容如下：</p><p>复制代码</p><pre><table><tbody><tr><td><div data-line-number=\"1\">\n</div></td><td><p>language: python</p></td></tr><tr><td><div data-line-number=\"2\">\n</div></td><td><p>python:</p></td></tr><tr><td><div data-line-number=\"3\">\n</div></td><td><p>  - 3.7</p></td></tr><tr><td><div data-line-number=\"4\">\n</div></td><td><p>install:</p></td></tr><tr><td><div data-line-number=\"5\">\n</div></td><td><p>  - pip install -U pip</p></td></tr><tr><td><div data-line-number=\"6\">\n</div></td><td><p>  - pip install pipenv</p></td></tr><tr><td><div data-line-number=\"7\">\n</div></td><td><p>  - pipenv install --dev</p></td></tr><tr><td><div data-line-number=\"8\">\n</div></td><td><p>script:</p></td></tr><tr><td><div data-line-number=\"9\">\n</div></td><td><p>  - bandit ./*</p></td></tr><tr><td><div data-line-number=\"10\">\n</div></td><td><p>  - black --check .</p></td></tr><tr><td><div data-line-number=\"11\">\n</div></td><td><p>  - ochrona</p></td></tr><tr><td><div data-line-number=\"12\">\n</div></td><td><p>  - mypy .</p></td></tr></tbody></table></pre><p>如果查看这里的构建，你会发现每个工具都标出错误或指出需修改的地方。那么，我们来做一些修正，如这个 PR&nbsp;所示，构建就可以通过。</p><p><img src=\"https://static001.infoq.cn/resource/image/fa/50/faa90fd7b730dbf5adf6f205bfe88c50.png\" alt=\"开发安全、高质量代码的5款顶级Python工具\" class=\"fr-fic fr-dii\"></p><p>将 Flask 升级到一个没有已知漏洞的版本</p><p><img src=\"https://static001.infoq.cn/resource/image/51/20/51dee83cd02c91d5fc6f123bad1e7f20.png\" alt=\"开发安全、高质量代码的5款顶级Python工具\" class=\"fr-fic fr-dii\"></p><p>修复类型注释，禁用调试模式，规范格式</p><p>虽然这个例子只涉及一个 CI 平台，但其实和集成到其他大多数平台的方法都很相似。</p><p>下面是一个总的评分表：</p><p><img src=\"https://static001.infoq.cn/resource/image/28/f6/28d907b9bd2ba1998c1d83bd541c63f6.jpg\" alt=\"开发安全、高质量代码的5款顶级Python工具\" class=\"fr-fic fr-dii\"></p><p>英文原文：</p><p>Top Python Tools for Developing Secure, Quality Code</p><p><br></p>', 0, '为提高代码的质量、安全性和可维护性，软件工程师每天会用到无数工具。我会列出一些自己最喜欢的 python 工具，并从易用性（是否易于安装、运行和自动化）、质量影响（能否阻止可预见的 bug）、可维护性', NULL, '开发安全、高质量代码的 5 款顶级 Python 工具', 5, 3, 2, '2021-02-05 18:32:03', 0, '2021-02-26 00:32:21', 'admin', 'admin', 0, 'post', 0, 0, 0, 0);
INSERT INTO `post` VALUES (22, NULL, '<p>2020 年 3 月 9 日，腾讯公司正式对外发布了《腾讯研发大数据报告》，该报告首次披露了腾讯集团在 2019 年在产品及研发方面的关键数据。报告显示，研发人员在集团员工的占比已超过 66%，2019 年全年新增 12.9 亿行代码，C++ 是腾讯使用最多编程语言，Go 语言首次跻身前五。</p><p>本次公布的报告数据来源于支撑腾讯全业务研发流程的三大平台：敏捷研发协作平台 TAPD、腾讯代码托管平台工蜂与腾讯集成交付系统腾讯 CI。</p><p>在研发投入和研发效能方面，数据可圈可点：</p><ul><li>研发人员占比达 66%，位居互联网公司前列；</li><li>新增研发项目 3500 个，其中 To B 项目增长率达 77%；</li><li>新增代码行数 12.9 亿，同比增长 30%；</li><li>60% 的项目团队规模在 20 人以下，47.8% 的项目迭代周期在 1 周之内；</li><li>内部使用最多的五种编程语言分别是：C++、JavaScript、Go、Java、Python。</li><li>&hellip;&hellip;</li></ul><p>而在开源方面，腾讯 2019 年同样取得了不俗的成绩：</p><ul><li>在内部开源方面，腾讯内部整体代码开源率由 2019 年年初的 20% 增长至年底的 70%；</li><li>在外部开源方面，截至 2019 年年底，腾讯在 Github 自主开源项目数为 92 个，贡献者超过 1000 个，获得 Star 数超过 27 万，在 Github 全球公司贡献榜上的排名前十。</li></ul><p>2019 年全年，腾讯开源超过 22 个项目，包括 TubeMQ 亿万级分布式消息中间件、TencentOS tiny 自研轻量级物联网操作系统、TKE 腾讯云容器服务和 TBase 企业级分布式 HTAP 数据库管理系统。</p><p>除此以外，腾讯于开源社区也建立了良好的合作关系。Angel 项目完成了从单一的模型训练平台到全栈机器学习平台的技术演进，成功从 LF AI 基金会毕业；TARS 项目成为开源社区仅有支持五种开发语言并有完善服务治理和运营平台的微服务开发框架。此外，腾讯还作为创始会员，加入了 LF Edge 基金会，和业界合作伙伴一起推动边缘计算软硬件开源技术的发展。</p><p>自 2019 年 1 月 4 日，腾讯正式成立技术委员会以来，可以看到腾讯在自研上云和开源协同等方面都取得了不错的成绩，腾讯的研发文化与技术品牌也体现出了焕然一新的面貌。随着全面云计算时代的来临，一切与云相关的技术将成为未来的趋势与战略控制点，不管是互联网企业还是传统企业，都应该拥抱云、拥抱变化，保持自我革新，迎接无限的挑战。</p>', 0, '2020 年 3 月 9 日，腾讯公司正式对外发布了《腾讯研发大数据报告》，该报告首次披露了腾讯集团在 2019 年在产品及研发方面的关键数据。报告显示，研发人员在集团员工的占比已超过 66%，201', NULL, '腾讯首次公布研发大数据：研发人员占比 66%，C++ 是最常用语言', 39, 9, 2, '2021-02-25 18:32:03', 0, '2021-04-16 18:35:38', 'admin', 'admin', 0, 'post', 0, 0, 0, 1);
INSERT INTO `post` VALUES (23, NULL, '<p>Druid 是一个用于大数据实时查询和分析的高容错、高性能开源分布式系统，旨在快速处理大规模的数据，并能够实现快速查询和分析。尤其是当发生代码部署、机器故障以及其他产品系统遇到宕机等情况时，Druid 仍能够保持 100% 正常运行。</p><p>Apache Druid 社区在今年初发布了&nbsp;Druid 0.17.0&nbsp;。这是该项目自 Apache Incubator 毕业以来的第一个版本，因此也是一个重要的里程碑。</p><p>Twitter 在一年多之前就开始采用 Druid，并应用到多个场景中。对于 Twitter 的实践经验，我们采访了 Twitter 大数据引擎负责人罗震霄。他将在 QCon 全球软件开发大会（北京站）2020 分享主题为《&nbsp;Twitter ZB 级实时数据分析实践》的演讲。</p><p>罗震霄，Twitter Sr. Staff Engineer，负责 Twitter 大数据引擎的开发与运营，主要负责项目 Druid、Presto、Spark、Hive。在加入 Twitter 之前，在 Uber、Netflix、Facebook 从事大数据相关的研发与管理工作。是 Presto Foundation committer 和技术委员会委员。他于复旦大学获得学士学位，并于 University of Wisconsin Madison 获得硕士学位。</p><p>InfoQ：您好，请问 Druid 自开源以来，有哪些重要的演化？</p><p>罗震霄：Twitter 用 Druid 已经有一年多了，从 0.15 到 0.17，这几个版本都比较稳定，主要的变化有：</p><ul><li>设计并实现了 Native Ingestion，彻底摆脱了对 MapReduce 的依赖，可以直接 Ingest Parquet，ORC 文件。</li><li>Data Ingestion 设计了 Indexer Process。</li><li>SQL 功能持续加强。</li><li>方便易用的用户界面。</li><li>更全面的 Security and Privacy Support，例如 LDAP Authentication and Authorization。</li></ul><p>InfoQ：一般的企业，哪些场景需要使用 Druid？Twitter 为什么选择了 Druid？Twitter 里有哪些 Druid 的应用举例？</p><p>罗震霄：Druid 的主要特点是性能快，规模大，易用性好。</p><ul><li>性能可以达到 1 秒以下，真正实现了大数据的实时性计算；</li><li>Druid 单群可以扩展至 2000 台节点以上，很好的满足了企业对大数据规模的要求；</li><li>Druid 的用户界面非常友好，用户常常可以通过拖拖拽拽进行查询，方便非技术类人员的应用。</li></ul><p>Twitter 业务有很多实时的大数据需求，我们当时对比了市场上现有的开源方案，在稳定性、扩展性、性能和易用性方面 Druid 都有一定优势，最后选择 Druid。目前来看公司上下对 Druid 还比较满意。</p><p>Twitter 所有的 user events 都通过内部 Message Queue 导入 Druid，用户可以实时对 Druid 进行查询，也可以在 Druid 基础上设置各类的监控和提醒。实时监控很好的利用了 Druid 性能快和方便查询的特性。</p><p>Twitter 内部用 Druid 很多，有三大类：其一，将用户行为数据导入 Druid，进行实时用户行为分析；其二，通过 Druid 为广告商提供实时的广告效果分析；其三，利用 Druid 的实时特性，做实时监控和实时报表。</p><p><br></p><p>InfoQ：比如现在某个企业已经有了成熟的 Lamda 架构的离线实时系统。而 Druid 也是 Lamda 架构的，那哪些部分是可以相互 Share 的吗？</p><p>罗震霄：Druid 需要自己的存储，可以将 Message Queue 同时导入离线系统和实时系统（Druid）。</p><p>如果对一些数据经过滤后有实时的计算需求，也可以通过 Hadoop Distributed File System 将数据导入 Druid。</p><p>一般来说，企业的 Message Queue 可以共享，Hadoop Distributed File System 也可以作为 Druid 的数据源进行共享。</p><p>Twitter 现在正在开发 Presto Druid Connector，通过 Presto 实时查询 Druid 数据，这样企业内部的查询语言，查询系统也可以共享。</p><p>因为 Twitter 数据分析大多数是通过 SQL 进行的。公司上下对 SQL on Druid 的需求很高。</p><p>现有的 DruidSQL 功能不太完善，SubQuery、Join 都不支持。如果将 Druid 数据再导入其他存储系统，不仅费时费力，而且很难保证数据的一致性。基于这些考虑，我们决定开发 Presto Druid Connector，用 Presto 对 Druid 数据提供完整的 SQL 分析，避免了数据重复，节省了存储空间，而且还可以利用 Presto&nbsp;Connector 的优势，跨平台进行 Join 操作，比如，Join Hadoop Data with Druid Data。</p><p>现在有一些用户在使用 Presto Druid Connector，大家还是比较满意的。下一步，我们会进一步提升性能，pushdown 各类子运算到 Druid。最终的愿景是争取将所有的 SQL 操作统一到 Presto 上来。</p><p><br></p><p>InfoQ：如果一个系统每天需要处理 PB 级别的系统，再增加一个 Druid 这样的存储系统，是不是很大程度上增加了存储空间的压力？原系统和 Druid，最好的融合方式是什么样的？</p><p>罗震霄：为了性能的提升，Druid 需要自己的存储。对 Twitter 而言，查询速度，和系统的易用性，较之存储空间，更为重要。</p><p>Druid 需要做自己的存储的原因是：</p><p>Druid 一个重要的设计目标是实时查询，也就是查询延迟一定要在 1 秒以下。</p><p>现有硬件的基本性能决定，从内存中顺序读取 4GB 数据的延时在 1 秒左右，实际应用场景中，我们处理的数据远远大于 4GB，所以，没有索引，仅仅靠扫描文件，是不可能达到实时查询要求的。</p><p>基于这些考虑，Druid 设计并实现了自己的存储格式，主要是列式存储，并应用字典、RLE 等方式进行优化。Druid 还设计了 bitmap 索引。在实际应用中，bitmap 索引会以 mmap 方式放在内存中。绝大多数查询可以通过 bitmap 索引直接找到结果，少数查询会通过列式存储进行有选择性的文件查询。</p><p>我们也在开发一些项目，尽量减少不必要的数据重复。比如 Presto Druid Connector，通过 Presto 实时查询 Druid 数据，这样当用户需要对 Druid 数据进行 SQL 分析时，用 Presto 就可以了，不必要拷贝数据。</p><p><br></p><p>InfoQ：Druid 和 Kylin 这样的开源软件主要差别在哪里？</p><p>罗震霄：对 Kylin 实在不太熟悉，不好妄加评论。</p><p>我们当时主要考虑的是 Druid 和 Pinot，这两个现在应用比较广泛。相对而言，Druid 更稳定一些，社区也更大一些。</p><p><br></p><p>InfoQ：目前还有哪些 OLAP 平台可供选择？Druid 相对有何优势？</p><p>罗震霄：现有的 OLAP 平台比较多，开源方面，有 Hive、 Impala、Spark、Presto、Drill、Druid、Pinot 等等。</p><p>Twitter 现在的技术布局：对实时计算，统一于 Druid，对秒级到几十分钟级的数据分析，统一于 Presto，对小时级别的 ETL，统一于 Spark。</p><p>Druid 主要的优势在性能，稳定性，扩展性，和易用性。能够达到 1 秒以下的实时引擎，只有 Druid 和 Pinot，如果考虑到扩展性和稳定性，Druid 的优势比较明显。</p><p><br></p><p>InfoQ：在 Twitter 里，您们定制了关于 Druid 的哪些开发功能？（与开源版本不同的功能）</p><p>罗震霄：主要是四个方面：</p><ul><li>对 Thrift 文件格式的支持，Twitter 内部有大量的 Thrift 文件。</li><li>Presto Druid Connector，通过 Presto 对 Druid 数据进行 SQL 分析。</li><li>Multi-tenancy Druid，Druid 支持不同的用户类型，包括数据安全，隐私保护，和数据隔离。</li><li>Native Ingestion，摆脱对 MapReduce 的依赖，直接导入 Parquet 文件。</li></ul><p>InfoQ：未来，Twitter 还计划对 Druid 开发或加强哪些功能？</p><p>罗震霄：主要有以下计划：</p><ul><li>Unified Indexing Service，为用户提供方便的一键式导入。</li><li>Secure Druid，完整的 Druid 信息安全，包括 LDAP Authentication and Authorization。</li><li>Pushdown for Presto Druid Connector，用 Presto 为 Druid 提供完整的 SQL 分析，并充分发挥 Druid 的性能优势，包括 Predicate Pushdown， Aggregation Pushdown，Limit Pushdown。</li></ul>', 0, 'Druid 是一个用于大数据实时查询和分析的高容错、高性能开源分布式系统，旨在快速处理大规模的数据，并能够实现快速查询和分析。尤其是当发生代码部署、机器故障以及其他产品系统遇到宕机等情况时，Druid', NULL, 'Twitter 如何应用 Druid 分析 ZB 级实时数据？', 25, 9, 3, '2021-02-24 18:32:03', 1, '2021-04-16 19:01:48', 'admin', 'admin', 0, 'post', 1, 1, 0, 0);
INSERT INTO `post` VALUES (24, NULL, '<p>根据外媒报道，莱斯大学的计算机科学家们已经克服了人工智能产业迅速发展的一个主要障碍，他们证明了在不依赖于图形处理单元（GPU）等专业级加速硬件的情况下，也能够实现对深度学习技术的加速。这个名为 SLIDE 的算法是第一个在 CPU 上比 GPU 更快地训练深度神经网络的算法。</p><p>在奥斯汀召开的 2020 机器学习系统会议&nbsp;MLSys&nbsp;上，来自莱斯大学的计算机科学家们，在来自英特尔公司的合作伙伴的支持下，于 3 月 2 日在奥斯汀会议中心展示了他们的最新研究成果。</p><p>当下，为了实现深度学习，许多公司正大力投资于图形处理单元（GPU）和其他专业级硬件。深度学习是一种强大的人工智能，如今亚马逊 Alexa 和苹果 Siri 等智能助理、面部识别、产品推荐系统和其他技术都有深度学习在背后作为支撑。深度学习炙手可热的程度可以举一例说明，作为一手打造该行业金字招牌&ldquo;特斯拉 V100 Tensor Core GPU&rdquo;芯片的制造商，Nvidia 公司最近的财务报告显示，其 2019 第四季度收入同比增长了 41%。</p><p>而莱斯大学的研究人员创造了一种可替代 GPU 的节省成本的算法，称为&ldquo;次线性深度学习引擎&rdquo;（sub-linear deep learning engine，简称 SLIDE），这种算法只需使用一般通用的中央处理器（CPU），而无需专业级的加速硬件。</p><p>&ldquo;我们的测试表明，SLIDE 是第一个基于 CPU 实现的深度学习智能算法，它的性能可以超越那些依照产业规模的建议采用大型全连接架构使用 GPU 硬件加速来实现数据集的方法&rdquo;，&nbsp;Anshumali Shrivastava&nbsp;这样说。这位莱斯大学布朗工程学院的助理教授与研究生&nbsp;Beidi Chen&nbsp;和&nbsp;Tharun Medini&nbsp;一起开发了该 SLIDE 算法。</p><p>SLIDE 不需要依赖于 GPU，因为这种算法从根本上采用了一种完全不同的深度学习方法。深度神经网络训练技术标准的&ldquo;反向传播&rdquo;算法需要矩阵乘法，如此繁重的计算量正是适合 GPU 发挥性能的理想场所。然而，通过 SLIDE 算法，Shrivastava、Chen 和 Medini 把神经网络训练转变成为一个可以用哈希表来解决的搜索问题。</p><p>与反向传播训练技术相比，这种 SLIDE 算法可以从根本上减少大量的计算开销。Shrivastava 举例说，如今诸如亚马逊、谷歌以及其他公司使用 GPU 打造的基于云的深度学习服务的顶级平台，一般会使用 8 块&ldquo;特斯拉 V100&rdquo;芯片，其费用约为 10 万美元。</p><p>莱斯大学计算机科学研究生 Beidi Chen 和 Tharun Medini 参与开发了 SLIDE，这是一种无需依赖图形处理单元对深度神经网络进行训练的算法。（图片来源：Jeff Fitlow/ 莱斯大学）</p><p>&ldquo;我们有一个在实验室运行的测试用例，它完全能承载一块 V100 芯片的工作负荷，也即是一个适用于 GPU 内存的，运行在大型全连接网络中有超过 1 亿个参数的计算量&rdquo;，Shrivastava 说，&ldquo;我们用最先进的谷歌的 TensorFlow 软件包来训练该算法，它只花了 3 个半小时就完成了训练。&rdquo;</p><p>&ldquo;我们随后证明，我们的新算法甚至可以在一小时内完成该训练，而且并不是运行在 GPU 上，而是运行在 44 核的 xeon-class CPU 上，&rdquo; Shrivastava 说。</p><p>深度学习网络的灵感来自生物学，其核心特征是人工神经元，这些神经元是一小段可以学习并执行特定的任务计算机代码。一个深度学习网络可能包含数百万甚至数十亿这种人工神经元，只要通过对海量数据的学习，这些神经元共同工作就有可能学习并做出与人类水平相当的专家决策。例如，如果一个深度神经网络被训练来识别照片中的物体，当识别一张猫的照片或是识别一辆校车时，它将使用不同的神经元来进行学习。</p><p>&ldquo;你不需要对每个用例的所有神经元都进行训练，&rdquo; Medini 解释说，&ldquo;我们是这样想的，&lsquo;如果我们只去挑选出相关的神经元，那这就变成了一个搜索问题。&rsquo; 因此，从算法上讲，我们的想法就是使用局部敏感哈希算法来避免矩阵乘法的复杂性。&rdquo;</p><p>哈希算法是 20 世纪 90 年代为互联网搜索发明的一种数据索引方法。它使用数字方法将大量信息，例如整个网站所有网页或一本书的所有章节，编码为一串称为哈希散列的数字。哈希表就是记录这些哈希散列值并可以实现快速搜索的列表。</p><p>&ldquo;在 TensorFlow 或 PyTorch 上实现我们的算法是毫无意义的，因为这些软件执行的第一件事就是不管三七二十一先把你正在做的事情转换成一个矩阵乘法问题，&rdquo; Chen 说。&ldquo;而这正是我们的算法想要避免的。所以我们是从零开始写我们自己的 C++ 代码的。&rdquo;</p><p>Shrivastava 说，SLIDE 相对于反向传播的最大优势在于它采用了数据并行的方式。</p><p>&ldquo;我的意思是，通过数据并行，如果我想要训练两个数据实例，比方说一个是一只猫的形象，另一个是公共汽车，他们可能会激活不同的神经元，该 SLIDE 算法可以对这两个实例分别独立地进行更新或训练，&rdquo; 他说，&ldquo;这就大大地提高了 CPU 并行性的利用率。&rdquo;</p><p>&ldquo;另一方面，与 GPU 相比，我们需要更大的存储空间，&rdquo; 他说，&ldquo;在主存储器中有一个缓存层次结构，如果你使用时不够小心，可能会遇到一个叫做内存颠簸（cache thrashing）的问题，那样就会发生大量缺页中断。&rdquo;</p><p>Shrivastava 说，他的团队第一次使用 SLIDE 进行实验时，就发生了严重的内存颠簸，但他们的训练时间仍然与 GPU 的训练时间相当，甚至更快。于是，他、Chen 和 Medini 于 2019 年 3 月在 arXiv 上发布了初步实验结果，并将他们的代码上传到 GitHub。几周后，英特尔公司主动联系了他们。</p><p>&ldquo;来自英特尔的合作伙伴注意到了我们实验中的缓存问题，&rdquo; 他说，&ldquo;他们告诉我们，他们可以与我们进行合作，让这个算法更快地完成训练，之后的事实证明他们是正确的。在他们的帮助下，我们的实验性能又提高了约 50%。&rdquo;</p><p>Shrivastava 说，SLIDE 还远远未达到其最大潜力。</p><p>&ldquo;我们只能算是初尝甜头而已，&rdquo; 他说，&ldquo;我们还可以做很多事情来对这个算法进行优化。例如，我们还没有使用矢量化，也没有在 CPU 中使用内置的加速器，比如 Intel Deep Learning Boost 技术。我们还有很多其他的技巧可以让这个算法变得更快。&rdquo;</p><p>Shrivastava 说，SLIDE 的重要性在于，它证明了还有其他方式来实现深度学习。</p><p>&ldquo;我们想要传达的整个信息是，&lsquo;我们不要被矩阵乘法和 GPU 内存这两个瓶颈所限制住，&rsquo; &rdquo; Chen 说，&ldquo;我们的算法可能是第一个击败 GPU 的算法，但我希望它不是最后一个。这个领域需要新的想法，而这正是这次 MLSys 机器学习系统会议的重要意义所在。&rdquo;</p><p>该算法的其他共同作者包括 James Farwell、Sameh Gobriel 和 Charlie Tai，他们都是来自英特尔实验室的成员。</p><p>该研究还得到了美国国家科学基金会（NSF-1652131, NSF-BIGDATA 1838177）、空军科研办公室（FA9550-18-1-0152）、亚马逊和海军研究办公室的支持。</p>', 0, '根据外媒报道，莱斯大学的计算机科学家们已经克服了人工智能产业迅速发展的一个主要障碍，他们证明了在不依赖于图形处理单元（GPU）等专业级加速硬件的情况下，也能够实现对深度学习技术的加速。这个名为 SLI', NULL, 'CPU 上运算比 GPU 还快？美国莱斯大学最新研究克服硬件障碍', 48, 9, 1, '2021-02-05 18:32:03', 2, '2021-04-16 16:52:46', 'admin', 'admin', 0, 'post', 0, 0, 0, 0);
INSERT INTO `post` VALUES (25, NULL, '<p>根据外媒报道，莱斯大学的计算机科学家们已经克服了人工智能产业迅速发展的一个主要障碍，他们证明了在不依赖于图形处理单元（GPU）等专业级加速硬件的情况下，也能够实现对深度学习技术的加速。这个名为 SLIDE 的算法是第一个在 CPU 上比 GPU 更快地训练深度神经网络的算法。</p><p>在奥斯汀召开的 2020 机器学习系统会议&nbsp;MLSys&nbsp;上，来自莱斯大学的计算机科学家们，在来自英特尔公司的合作伙伴的支持下，于 3 月 2 日在奥斯汀会议中心展示了他们的最新研究成果。</p><p>当下，为了实现深度学习，许多公司正大力投资于图形处理单元（GPU）和其他专业级硬件。深度学习是一种强大的人工智能，如今亚马逊 Alexa 和苹果 Siri 等智能助理、面部识别、产品推荐系统和其他技术都有深度学习在背后作为支撑。深度学习炙手可热的程度可以举一例说明，作为一手打造该行业金字招牌&ldquo;特斯拉 V100 Tensor Core GPU&rdquo;芯片的制造商，Nvidia 公司最近的财务报告显示，其 2019 第四季度收入同比增长了 41%。</p><p>而莱斯大学的研究人员创造了一种可替代 GPU 的节省成本的算法，称为&ldquo;次线性深度学习引擎&rdquo;（sub-linear deep learning engine，简称 SLIDE），这种算法只需使用一般通用的中央处理器（CPU），而无需专业级的加速硬件。</p><p>&ldquo;我们的测试表明，SLIDE 是第一个基于 CPU 实现的深度学习智能算法，它的性能可以超越那些依照产业规模的建议采用大型全连接架构使用 GPU 硬件加速来实现数据集的方法&rdquo;，&nbsp;Anshumali Shrivastava&nbsp;这样说。这位莱斯大学布朗工程学院的助理教授与研究生&nbsp;Beidi Chen&nbsp;和&nbsp;Tharun Medini&nbsp;一起开发了该 SLIDE 算法。</p><p>SLIDE 不需要依赖于 GPU，因为这种算法从根本上采用了一种完全不同的深度学习方法。深度神经网络训练技术标准的&ldquo;反向传播&rdquo;算法需要矩阵乘法，如此繁重的计算量正是适合 GPU 发挥性能的理想场所。然而，通过 SLIDE 算法，Shrivastava、Chen 和 Medini 把神经网络训练转变成为一个可以用哈希表来解决的搜索问题。</p><p>与反向传播训练技术相比，这种 SLIDE 算法可以从根本上减少大量的计算开销。Shrivastava 举例说，如今诸如亚马逊、谷歌以及其他公司使用 GPU 打造的基于云的深度学习服务的顶级平台，一般会使用 8 块&ldquo;特斯拉 V100&rdquo;芯片，其费用约为 10 万美元。</p><p>莱斯大学计算机科学研究生 Beidi Chen 和 Tharun Medini 参与开发了 SLIDE，这是一种无需依赖图形处理单元对深度神经网络进行训练的算法。（图片来源：Jeff Fitlow/ 莱斯大学）</p><p>&ldquo;我们有一个在实验室运行的测试用例，它完全能承载一块 V100 芯片的工作负荷，也即是一个适用于 GPU 内存的，运行在大型全连接网络中有超过 1 亿个参数的计算量&rdquo;，Shrivastava 说，&ldquo;我们用最先进的谷歌的 TensorFlow 软件包来训练该算法，它只花了 3 个半小时就完成了训练。&rdquo;</p><p>&ldquo;我们随后证明，我们的新算法甚至可以在一小时内完成该训练，而且并不是运行在 GPU 上，而是运行在 44 核的 xeon-class CPU 上，&rdquo; Shrivastava 说。</p><p>深度学习网络的灵感来自生物学，其核心特征是人工神经元，这些神经元是一小段可以学习并执行特定的任务计算机代码。一个深度学习网络可能包含数百万甚至数十亿这种人工神经元，只要通过对海量数据的学习，这些神经元共同工作就有可能学习并做出与人类水平相当的专家决策。例如，如果一个深度神经网络被训练来识别照片中的物体，当识别一张猫的照片或是识别一辆校车时，它将使用不同的神经元来进行学习。</p><p>&ldquo;你不需要对每个用例的所有神经元都进行训练，&rdquo; Medini 解释说，&ldquo;我们是这样想的，&lsquo;如果我们只去挑选出相关的神经元，那这就变成了一个搜索问题。&rsquo; 因此，从算法上讲，我们的想法就是使用局部敏感哈希算法来避免矩阵乘法的复杂性。&rdquo;</p><p>哈希算法是 20 世纪 90 年代为互联网搜索发明的一种数据索引方法。它使用数字方法将大量信息，例如整个网站所有网页或一本书的所有章节，编码为一串称为哈希散列的数字。哈希表就是记录这些哈希散列值并可以实现快速搜索的列表。</p><p>&ldquo;在 TensorFlow 或 PyTorch 上实现我们的算法是毫无意义的，因为这些软件执行的第一件事就是不管三七二十一先把你正在做的事情转换成一个矩阵乘法问题，&rdquo; Chen 说。&ldquo;而这正是我们的算法想要避免的。所以我们是从零开始写我们自己的 C++ 代码的。&rdquo;</p><p>Shrivastava 说，SLIDE 相对于反向传播的最大优势在于它采用了数据并行的方式。</p><p>&ldquo;我的意思是，通过数据并行，如果我想要训练两个数据实例，比方说一个是一只猫的形象，另一个是公共汽车，他们可能会激活不同的神经元，该 SLIDE 算法可以对这两个实例分别独立地进行更新或训练，&rdquo; 他说，&ldquo;这就大大地提高了 CPU 并行性的利用率。&rdquo;</p><p>&ldquo;另一方面，与 GPU 相比，我们需要更大的存储空间，&rdquo; 他说，&ldquo;在主存储器中有一个缓存层次结构，如果你使用时不够小心，可能会遇到一个叫做内存颠簸（cache thrashing）的问题，那样就会发生大量缺页中断。&rdquo;</p><p>Shrivastava 说，他的团队第一次使用 SLIDE 进行实验时，就发生了严重的内存颠簸，但他们的训练时间仍然与 GPU 的训练时间相当，甚至更快。于是，他、Chen 和 Medini 于 2019 年 3 月在 arXiv 上发布了初步实验结果，并将他们的代码上传到 GitHub。几周后，英特尔公司主动联系了他们。</p><p>&ldquo;来自英特尔的合作伙伴注意到了我们实验中的缓存问题，&rdquo; 他说，&ldquo;他们告诉我们，他们可以与我们进行合作，让这个算法更快地完成训练，之后的事实证明他们是正确的。在他们的帮助下，我们的实验性能又提高了约 50%。&rdquo;</p><p>Shrivastava 说，SLIDE 还远远未达到其最大潜力。</p><p>&ldquo;我们只能算是初尝甜头而已，&rdquo; 他说，&ldquo;我们还可以做很多事情来对这个算法进行优化。例如，我们还没有使用矢量化，也没有在 CPU 中使用内置的加速器，比如 Intel Deep Learning Boost 技术。我们还有很多其他的技巧可以让这个算法变得更快。&rdquo;</p><p>Shrivastava 说，SLIDE 的重要性在于，它证明了还有其他方式来实现深度学习。</p><p>&ldquo;我们想要传达的整个信息是，&lsquo;我们不要被矩阵乘法和 GPU 内存这两个瓶颈所限制住，&rsquo; &rdquo; Chen 说，&ldquo;我们的算法可能是第一个击败 GPU 的算法，但我希望它不是最后一个。这个领域需要新的想法，而这正是这次 MLSys 机器学习系统会议的重要意义所在。&rdquo;</p><p>该算法的其他共同作者包括 James Farwell、Sameh Gobriel 和 Charlie Tai，他们都是来自英特尔实验室的成员。</p><p>该研究还得到了美国国家科学基金会（NSF-1652131, NSF-BIGDATA 1838177）、空军科研办公室（FA9550-18-1-0152）、亚马逊和海军研究办公室的支持。</p>', 0, '根据外媒报道，莱斯大学的计算机科学家们已经克服了人工智能产业迅速发展的一个主要障碍，他们证明了在不依赖于图形处理单元（GPU）等专业级加速硬件的情况下，也能够实现对深度学习技术的加速。这个名为 SLI', NULL, 'CPU 上运算比 GPU 还快？美国莱斯大学最新研究克服硬件障碍', 61, 9, 1, '2021-02-15 18:32:03', 3, '2021-04-16 18:43:56', 'admin', 'admin', 0, 'post', 0, 1, 1, 1);
INSERT INTO `post` VALUES (26, NULL, '<p>根据外媒报道，莱斯大学的计算机科学家们已经克服了人工智能产业迅速发展的一个主要障碍，他们证明了在不依赖于图形处理单元（GPU）等专业级加速硬件的情况下，也能够实现对深度学习技术的加速。这个名为 SLIDE 的算法是第一个在 CPU 上比 GPU 更快地训练深度神经网络的算法。</p><p>在奥斯汀召开的 2020 机器学习系统会议&nbsp;MLSys&nbsp;上，来自莱斯大学的计算机科学家们，在来自英特尔公司的合作伙伴的支持下，于 3 月 2 日在奥斯汀会议中心展示了他们的最新研究成果。</p><p>当下，为了实现深度学习，许多公司正大力投资于图形处理单元（GPU）和其他专业级硬件。深度学习是一种强大的人工智能，如今亚马逊 Alexa 和苹果 Siri 等智能助理、面部识别、产品推荐系统和其他技术都有深度学习在背后作为支撑。深度学习炙手可热的程度可以举一例说明，作为一手打造该行业金字招牌&ldquo;特斯拉 V100 Tensor Core GPU&rdquo;芯片的制造商，Nvidia 公司最近的财务报告显示，其 2019 第四季度收入同比增长了 41%。</p><p>而莱斯大学的研究人员创造了一种可替代 GPU 的节省成本的算法，称为&ldquo;次线性深度学习引擎&rdquo;（sub-linear deep learning engine，简称 SLIDE），这种算法只需使用一般通用的中央处理器（CPU），而无需专业级的加速硬件。</p><p>&ldquo;我们的测试表明，SLIDE 是第一个基于 CPU 实现的深度学习智能算法，它的性能可以超越那些依照产业规模的建议采用大型全连接架构使用 GPU 硬件加速来实现数据集的方法&rdquo;，&nbsp;Anshumali Shrivastava&nbsp;这样说。这位莱斯大学布朗工程学院的助理教授与研究生&nbsp;Beidi Chen&nbsp;和&nbsp;Tharun Medini&nbsp;一起开发了该 SLIDE 算法。</p><p>SLIDE 不需要依赖于 GPU，因为这种算法从根本上采用了一种完全不同的深度学习方法。深度神经网络训练技术标准的&ldquo;反向传播&rdquo;算法需要矩阵乘法，如此繁重的计算量正是适合 GPU 发挥性能的理想场所。然而，通过 SLIDE 算法，Shrivastava、Chen 和 Medini 把神经网络训练转变成为一个可以用哈希表来解决的搜索问题。</p><p>与反向传播训练技术相比，这种 SLIDE 算法可以从根本上减少大量的计算开销。Shrivastava 举例说，如今诸如亚马逊、谷歌以及其他公司使用 GPU 打造的基于云的深度学习服务的顶级平台，一般会使用 8 块&ldquo;特斯拉 V100&rdquo;芯片，其费用约为 10 万美元。</p><p>莱斯大学计算机科学研究生 Beidi Chen 和 Tharun Medini 参与开发了 SLIDE，这是一种无需依赖图形处理单元对深度神经网络进行训练的算法。（图片来源：Jeff Fitlow/ 莱斯大学）</p><p>&ldquo;我们有一个在实验室运行的测试用例，它完全能承载一块 V100 芯片的工作负荷，也即是一个适用于 GPU 内存的，运行在大型全连接网络中有超过 1 亿个参数的计算量&rdquo;，Shrivastava 说，&ldquo;我们用最先进的谷歌的 TensorFlow 软件包来训练该算法，它只花了 3 个半小时就完成了训练。&rdquo;</p><p>&ldquo;我们随后证明，我们的新算法甚至可以在一小时内完成该训练，而且并不是运行在 GPU 上，而是运行在 44 核的 xeon-class CPU 上，&rdquo; Shrivastava 说。</p><p>深度学习网络的灵感来自生物学，其核心特征是人工神经元，这些神经元是一小段可以学习并执行特定的任务计算机代码。一个深度学习网络可能包含数百万甚至数十亿这种人工神经元，只要通过对海量数据的学习，这些神经元共同工作就有可能学习并做出与人类水平相当的专家决策。例如，如果一个深度神经网络被训练来识别照片中的物体，当识别一张猫的照片或是识别一辆校车时，它将使用不同的神经元来进行学习。</p><p>&ldquo;你不需要对每个用例的所有神经元都进行训练，&rdquo; Medini 解释说，&ldquo;我们是这样想的，&lsquo;如果我们只去挑选出相关的神经元，那这就变成了一个搜索问题。&rsquo; 因此，从算法上讲，我们的想法就是使用局部敏感哈希算法来避免矩阵乘法的复杂性。&rdquo;</p><p>哈希算法是 20 世纪 90 年代为互联网搜索发明的一种数据索引方法。它使用数字方法将大量信息，例如整个网站所有网页或一本书的所有章节，编码为一串称为哈希散列的数字。哈希表就是记录这些哈希散列值并可以实现快速搜索的列表。</p><p>&ldquo;在 TensorFlow 或 PyTorch 上实现我们的算法是毫无意义的，因为这些软件执行的第一件事就是不管三七二十一先把你正在做的事情转换成一个矩阵乘法问题，&rdquo; Chen 说。&ldquo;而这正是我们的算法想要避免的。所以我们是从零开始写我们自己的 C++ 代码的。&rdquo;</p><p>Shrivastava 说，SLIDE 相对于反向传播的最大优势在于它采用了数据并行的方式。</p><p>&ldquo;我的意思是，通过数据并行，如果我想要训练两个数据实例，比方说一个是一只猫的形象，另一个是公共汽车，他们可能会激活不同的神经元，该 SLIDE 算法可以对这两个实例分别独立地进行更新或训练，&rdquo; 他说，&ldquo;这就大大地提高了 CPU 并行性的利用率。&rdquo;</p><p>&ldquo;另一方面，与 GPU 相比，我们需要更大的存储空间，&rdquo; 他说，&ldquo;在主存储器中有一个缓存层次结构，如果你使用时不够小心，可能会遇到一个叫做内存颠簸（cache thrashing）的问题，那样就会发生大量缺页中断。&rdquo;</p><p>Shrivastava 说，他的团队第一次使用 SLIDE 进行实验时，就发生了严重的内存颠簸，但他们的训练时间仍然与 GPU 的训练时间相当，甚至更快。于是，他、Chen 和 Medini 于 2019 年 3 月在 arXiv 上发布了初步实验结果，并将他们的代码上传到 GitHub。几周后，英特尔公司主动联系了他们。</p><p>&ldquo;来自英特尔的合作伙伴注意到了我们实验中的缓存问题，&rdquo; 他说，&ldquo;他们告诉我们，他们可以与我们进行合作，让这个算法更快地完成训练，之后的事实证明他们是正确的。在他们的帮助下，我们的实验性能又提高了约 50%。&rdquo;</p><p>Shrivastava 说，SLIDE 还远远未达到其最大潜力。</p><p>&ldquo;我们只能算是初尝甜头而已，&rdquo; 他说，&ldquo;我们还可以做很多事情来对这个算法进行优化。例如，我们还没有使用矢量化，也没有在 CPU 中使用内置的加速器，比如 Intel Deep Learning Boost 技术。我们还有很多其他的技巧可以让这个算法变得更快。&rdquo;</p><p>Shrivastava 说，SLIDE 的重要性在于，它证明了还有其他方式来实现深度学习。</p><p>&ldquo;我们想要传达的整个信息是，&lsquo;我们不要被矩阵乘法和 GPU 内存这两个瓶颈所限制住，&rsquo; &rdquo; Chen 说，&ldquo;我们的算法可能是第一个击败 GPU 的算法，但我希望它不是最后一个。这个领域需要新的想法，而这正是这次 MLSys 机器学习系统会议的重要意义所在。&rdquo;</p><p>该算法的其他共同作者包括 James Farwell、Sameh Gobriel 和 Charlie Tai，他们都是来自英特尔实验室的成员。</p><p>该研究还得到了美国国家科学基金会（NSF-1652131, NSF-BIGDATA 1838177）、空军科研办公室（FA9550-18-1-0152）、亚马逊和海军研究办公室的支持。</p>', 0, '根据外媒报道，莱斯大学的计算机科学家们已经克服了人工智能产业迅速发展的一个主要障碍，他们证明了在不依赖于图形处理单元（GPU）等专业级加速硬件的情况下，也能够实现对深度学习技术的加速。这个名为 SLI', NULL, 'CPU 上运算比 GPU 还快？美国莱斯大学最新研究克服硬件障碍', 47, 9, 1, '2021-02-21 18:32:03', 2, '2021-02-26 00:34:23', 'admin', 'admin', 0, 'post', 0, 0, 0, 0);
INSERT INTO `post` VALUES (27, NULL, '<p>根据外媒报道，莱斯大学的计算机科学家们已经克服了人工智能产业迅速发展的一个主要障碍，他们证明了在不依赖于图形处理单元（GPU）等专业级加速硬件的情况下，也能够实现对深度学习技术的加速。这个名为 SLIDE 的算法是第一个在 CPU 上比 GPU 更快地训练深度神经网络的算法。</p><p>在奥斯汀召开的 2020 机器学习系统会议&nbsp;MLSys&nbsp;上，来自莱斯大学的计算机科学家们，在来自英特尔公司的合作伙伴的支持下，于 3 月 2 日在奥斯汀会议中心展示了他们的最新研究成果。</p><p>当下，为了实现深度学习，许多公司正大力投资于图形处理单元（GPU）和其他专业级硬件。深度学习是一种强大的人工智能，如今亚马逊 Alexa 和苹果 Siri 等智能助理、面部识别、产品推荐系统和其他技术都有深度学习在背后作为支撑。深度学习炙手可热的程度可以举一例说明，作为一手打造该行业金字招牌&ldquo;特斯拉 V100 Tensor Core GPU&rdquo;芯片的制造商，Nvidia 公司最近的财务报告显示，其 2019 第四季度收入同比增长了 41%。</p><p>而莱斯大学的研究人员创造了一种可替代 GPU 的节省成本的算法，称为&ldquo;次线性深度学习引擎&rdquo;（sub-linear deep learning engine，简称 SLIDE），这种算法只需使用一般通用的中央处理器（CPU），而无需专业级的加速硬件。</p><p>&ldquo;我们的测试表明，SLIDE 是第一个基于 CPU 实现的深度学习智能算法，它的性能可以超越那些依照产业规模的建议采用大型全连接架构使用 GPU 硬件加速来实现数据集的方法&rdquo;，&nbsp;Anshumali Shrivastava&nbsp;这样说。这位莱斯大学布朗工程学院的助理教授与研究生&nbsp;Beidi Chen&nbsp;和&nbsp;Tharun Medini&nbsp;一起开发了该 SLIDE 算法。</p><p>SLIDE 不需要依赖于 GPU，因为这种算法从根本上采用了一种完全不同的深度学习方法。深度神经网络训练技术标准的&ldquo;反向传播&rdquo;算法需要矩阵乘法，如此繁重的计算量正是适合 GPU 发挥性能的理想场所。然而，通过 SLIDE 算法，Shrivastava、Chen 和 Medini 把神经网络训练转变成为一个可以用哈希表来解决的搜索问题。</p><p>与反向传播训练技术相比，这种 SLIDE 算法可以从根本上减少大量的计算开销。Shrivastava 举例说，如今诸如亚马逊、谷歌以及其他公司使用 GPU 打造的基于云的深度学习服务的顶级平台，一般会使用 8 块&ldquo;特斯拉 V100&rdquo;芯片，其费用约为 10 万美元。</p><p>莱斯大学计算机科学研究生 Beidi Chen 和 Tharun Medini 参与开发了 SLIDE，这是一种无需依赖图形处理单元对深度神经网络进行训练的算法。（图片来源：Jeff Fitlow/ 莱斯大学）</p><p>&ldquo;我们有一个在实验室运行的测试用例，它完全能承载一块 V100 芯片的工作负荷，也即是一个适用于 GPU 内存的，运行在大型全连接网络中有超过 1 亿个参数的计算量&rdquo;，Shrivastava 说，&ldquo;我们用最先进的谷歌的 TensorFlow 软件包来训练该算法，它只花了 3 个半小时就完成了训练。&rdquo;</p><p>&ldquo;我们随后证明，我们的新算法甚至可以在一小时内完成该训练，而且并不是运行在 GPU 上，而是运行在 44 核的 xeon-class CPU 上，&rdquo; Shrivastava 说。</p><p>深度学习网络的灵感来自生物学，其核心特征是人工神经元，这些神经元是一小段可以学习并执行特定的任务计算机代码。一个深度学习网络可能包含数百万甚至数十亿这种人工神经元，只要通过对海量数据的学习，这些神经元共同工作就有可能学习并做出与人类水平相当的专家决策。例如，如果一个深度神经网络被训练来识别照片中的物体，当识别一张猫的照片或是识别一辆校车时，它将使用不同的神经元来进行学习。</p><p>&ldquo;你不需要对每个用例的所有神经元都进行训练，&rdquo; Medini 解释说，&ldquo;我们是这样想的，&lsquo;如果我们只去挑选出相关的神经元，那这就变成了一个搜索问题。&rsquo; 因此，从算法上讲，我们的想法就是使用局部敏感哈希算法来避免矩阵乘法的复杂性。&rdquo;</p><p>哈希算法是 20 世纪 90 年代为互联网搜索发明的一种数据索引方法。它使用数字方法将大量信息，例如整个网站所有网页或一本书的所有章节，编码为一串称为哈希散列的数字。哈希表就是记录这些哈希散列值并可以实现快速搜索的列表。</p><p>&ldquo;在 TensorFlow 或 PyTorch 上实现我们的算法是毫无意义的，因为这些软件执行的第一件事就是不管三七二十一先把你正在做的事情转换成一个矩阵乘法问题，&rdquo; Chen 说。&ldquo;而这正是我们的算法想要避免的。所以我们是从零开始写我们自己的 C++ 代码的。&rdquo;</p><p>Shrivastava 说，SLIDE 相对于反向传播的最大优势在于它采用了数据并行的方式。</p><p>&ldquo;我的意思是，通过数据并行，如果我想要训练两个数据实例，比方说一个是一只猫的形象，另一个是公共汽车，他们可能会激活不同的神经元，该 SLIDE 算法可以对这两个实例分别独立地进行更新或训练，&rdquo; 他说，&ldquo;这就大大地提高了 CPU 并行性的利用率。&rdquo;</p><p>&ldquo;另一方面，与 GPU 相比，我们需要更大的存储空间，&rdquo; 他说，&ldquo;在主存储器中有一个缓存层次结构，如果你使用时不够小心，可能会遇到一个叫做内存颠簸（cache thrashing）的问题，那样就会发生大量缺页中断。&rdquo;</p><p>Shrivastava 说，他的团队第一次使用 SLIDE 进行实验时，就发生了严重的内存颠簸，但他们的训练时间仍然与 GPU 的训练时间相当，甚至更快。于是，他、Chen 和 Medini 于 2019 年 3 月在 arXiv 上发布了初步实验结果，并将他们的代码上传到 GitHub。几周后，英特尔公司主动联系了他们。</p><p>&ldquo;来自英特尔的合作伙伴注意到了我们实验中的缓存问题，&rdquo; 他说，&ldquo;他们告诉我们，他们可以与我们进行合作，让这个算法更快地完成训练，之后的事实证明他们是正确的。在他们的帮助下，我们的实验性能又提高了约 50%。&rdquo;</p><p>Shrivastava 说，SLIDE 还远远未达到其最大潜力。</p><p>&ldquo;我们只能算是初尝甜头而已，&rdquo; 他说，&ldquo;我们还可以做很多事情来对这个算法进行优化。例如，我们还没有使用矢量化，也没有在 CPU 中使用内置的加速器，比如 Intel Deep Learning Boost 技术。我们还有很多其他的技巧可以让这个算法变得更快。&rdquo;</p><p>Shrivastava 说，SLIDE 的重要性在于，它证明了还有其他方式来实现深度学习。</p><p>&ldquo;我们想要传达的整个信息是，&lsquo;我们不要被矩阵乘法和 GPU 内存这两个瓶颈所限制住，&rsquo; &rdquo; Chen 说，&ldquo;我们的算法可能是第一个击败 GPU 的算法，但我希望它不是最后一个。这个领域需要新的想法，而这正是这次 MLSys 机器学习系统会议的重要意义所在。&rdquo;</p><p>该算法的其他共同作者包括 James Farwell、Sameh Gobriel 和 Charlie Tai，他们都是来自英特尔实验室的成员。</p><p>该研究还得到了美国国家科学基金会（NSF-1652131, NSF-BIGDATA 1838177）、空军科研办公室（FA9550-18-1-0152）、亚马逊和海军研究办公室的支持。</p>', 0, '根据外媒报道，莱斯大学的计算机科学家们已经克服了人工智能产业迅速发展的一个主要障碍，他们证明了在不依赖于图形处理单元（GPU）等专业级加速硬件的情况下，也能够实现对深度学习技术的加速。这个名为 SLI', NULL, 'CPU 上运算比 GPU 还快？美国莱斯大学最新研究克服硬件障碍', 47, 9, 1, '2021-02-22 18:32:03', 2, '2021-02-26 09:53:35', 'admin', 'admin', 0, 'post', 0, 0, 0, 0);
INSERT INTO `post` VALUES (28, NULL, '<p>根据外媒报道，莱斯大学的计算机科学家们已经克服了人工智能产业迅速发展的一个主要障碍，他们证明了在不依赖于图形处理单元（GPU）等专业级加速硬件的情况下，也能够实现对深度学习技术的加速。这个名为 SLIDE 的算法是第一个在 CPU 上比 GPU 更快地训练深度神经网络的算法。</p><p>在奥斯汀召开的 2020 机器学习系统会议&nbsp;MLSys&nbsp;上，来自莱斯大学的计算机科学家们，在来自英特尔公司的合作伙伴的支持下，于 3 月 2 日在奥斯汀会议中心展示了他们的最新研究成果。</p><p>当下，为了实现深度学习，许多公司正大力投资于图形处理单元（GPU）和其他专业级硬件。深度学习是一种强大的人工智能，如今亚马逊 Alexa 和苹果 Siri 等智能助理、面部识别、产品推荐系统和其他技术都有深度学习在背后作为支撑。深度学习炙手可热的程度可以举一例说明，作为一手打造该行业金字招牌&ldquo;特斯拉 V100 Tensor Core GPU&rdquo;芯片的制造商，Nvidia 公司最近的财务报告显示，其 2019 第四季度收入同比增长了 41%。</p><p>而莱斯大学的研究人员创造了一种可替代 GPU 的节省成本的算法，称为&ldquo;次线性深度学习引擎&rdquo;（sub-linear deep learning engine，简称 SLIDE），这种算法只需使用一般通用的中央处理器（CPU），而无需专业级的加速硬件。</p><p>&ldquo;我们的测试表明，SLIDE 是第一个基于 CPU 实现的深度学习智能算法，它的性能可以超越那些依照产业规模的建议采用大型全连接架构使用 GPU 硬件加速来实现数据集的方法&rdquo;，&nbsp;Anshumali Shrivastava&nbsp;这样说。这位莱斯大学布朗工程学院的助理教授与研究生&nbsp;Beidi Chen&nbsp;和&nbsp;Tharun Medini&nbsp;一起开发了该 SLIDE 算法。</p><p>SLIDE 不需要依赖于 GPU，因为这种算法从根本上采用了一种完全不同的深度学习方法。深度神经网络训练技术标准的&ldquo;反向传播&rdquo;算法需要矩阵乘法，如此繁重的计算量正是适合 GPU 发挥性能的理想场所。然而，通过 SLIDE 算法，Shrivastava、Chen 和 Medini 把神经网络训练转变成为一个可以用哈希表来解决的搜索问题。</p><p>与反向传播训练技术相比，这种 SLIDE 算法可以从根本上减少大量的计算开销。Shrivastava 举例说，如今诸如亚马逊、谷歌以及其他公司使用 GPU 打造的基于云的深度学习服务的顶级平台，一般会使用 8 块&ldquo;特斯拉 V100&rdquo;芯片，其费用约为 10 万美元。</p><p>莱斯大学计算机科学研究生 Beidi Chen 和 Tharun Medini 参与开发了 SLIDE，这是一种无需依赖图形处理单元对深度神经网络进行训练的算法。（图片来源：Jeff Fitlow/ 莱斯大学）</p><p>&ldquo;我们有一个在实验室运行的测试用例，它完全能承载一块 V100 芯片的工作负荷，也即是一个适用于 GPU 内存的，运行在大型全连接网络中有超过 1 亿个参数的计算量&rdquo;，Shrivastava 说，&ldquo;我们用最先进的谷歌的 TensorFlow 软件包来训练该算法，它只花了 3 个半小时就完成了训练。&rdquo;</p><p>&ldquo;我们随后证明，我们的新算法甚至可以在一小时内完成该训练，而且并不是运行在 GPU 上，而是运行在 44 核的 xeon-class CPU 上，&rdquo; Shrivastava 说。</p><p>深度学习网络的灵感来自生物学，其核心特征是人工神经元，这些神经元是一小段可以学习并执行特定的任务计算机代码。一个深度学习网络可能包含数百万甚至数十亿这种人工神经元，只要通过对海量数据的学习，这些神经元共同工作就有可能学习并做出与人类水平相当的专家决策。例如，如果一个深度神经网络被训练来识别照片中的物体，当识别一张猫的照片或是识别一辆校车时，它将使用不同的神经元来进行学习。</p><p>&ldquo;你不需要对每个用例的所有神经元都进行训练，&rdquo; Medini 解释说，&ldquo;我们是这样想的，&lsquo;如果我们只去挑选出相关的神经元，那这就变成了一个搜索问题。&rsquo; 因此，从算法上讲，我们的想法就是使用局部敏感哈希算法来避免矩阵乘法的复杂性。&rdquo;</p><p>哈希算法是 20 世纪 90 年代为互联网搜索发明的一种数据索引方法。它使用数字方法将大量信息，例如整个网站所有网页或一本书的所有章节，编码为一串称为哈希散列的数字。哈希表就是记录这些哈希散列值并可以实现快速搜索的列表。</p><p>&ldquo;在 TensorFlow 或 PyTorch 上实现我们的算法是毫无意义的，因为这些软件执行的第一件事就是不管三七二十一先把你正在做的事情转换成一个矩阵乘法问题，&rdquo; Chen 说。&ldquo;而这正是我们的算法想要避免的。所以我们是从零开始写我们自己的 C++ 代码的。&rdquo;</p><p>Shrivastava 说，SLIDE 相对于反向传播的最大优势在于它采用了数据并行的方式。</p><p>&ldquo;我的意思是，通过数据并行，如果我想要训练两个数据实例，比方说一个是一只猫的形象，另一个是公共汽车，他们可能会激活不同的神经元，该 SLIDE 算法可以对这两个实例分别独立地进行更新或训练，&rdquo; 他说，&ldquo;这就大大地提高了 CPU 并行性的利用率。&rdquo;</p><p>&ldquo;另一方面，与 GPU 相比，我们需要更大的存储空间，&rdquo; 他说，&ldquo;在主存储器中有一个缓存层次结构，如果你使用时不够小心，可能会遇到一个叫做内存颠簸（cache thrashing）的问题，那样就会发生大量缺页中断。&rdquo;</p><p>Shrivastava 说，他的团队第一次使用 SLIDE 进行实验时，就发生了严重的内存颠簸，但他们的训练时间仍然与 GPU 的训练时间相当，甚至更快。于是，他、Chen 和 Medini 于 2019 年 3 月在 arXiv 上发布了初步实验结果，并将他们的代码上传到 GitHub。几周后，英特尔公司主动联系了他们。</p><p>&ldquo;来自英特尔的合作伙伴注意到了我们实验中的缓存问题，&rdquo; 他说，&ldquo;他们告诉我们，他们可以与我们进行合作，让这个算法更快地完成训练，之后的事实证明他们是正确的。在他们的帮助下，我们的实验性能又提高了约 50%。&rdquo;</p><p>Shrivastava 说，SLIDE 还远远未达到其最大潜力。</p><p>&ldquo;我们只能算是初尝甜头而已，&rdquo; 他说，&ldquo;我们还可以做很多事情来对这个算法进行优化。例如，我们还没有使用矢量化，也没有在 CPU 中使用内置的加速器，比如 Intel Deep Learning Boost 技术。我们还有很多其他的技巧可以让这个算法变得更快。&rdquo;</p><p>Shrivastava 说，SLIDE 的重要性在于，它证明了还有其他方式来实现深度学习。</p><p>&ldquo;我们想要传达的整个信息是，&lsquo;我们不要被矩阵乘法和 GPU 内存这两个瓶颈所限制住，&rsquo; &rdquo; Chen 说，&ldquo;我们的算法可能是第一个击败 GPU 的算法，但我希望它不是最后一个。这个领域需要新的想法，而这正是这次 MLSys 机器学习系统会议的重要意义所在。&rdquo;</p><p>该算法的其他共同作者包括 James Farwell、Sameh Gobriel 和 Charlie Tai，他们都是来自英特尔实验室的成员。</p><p>该研究还得到了美国国家科学基金会（NSF-1652131, NSF-BIGDATA 1838177）、空军科研办公室（FA9550-18-1-0152）、亚马逊和海军研究办公室的支持。</p>', 0, '根据外媒报道，莱斯大学的计算机科学家们已经克服了人工智能产业迅速发展的一个主要障碍，他们证明了在不依赖于图形处理单元（GPU）等专业级加速硬件的情况下，也能够实现对深度学习技术的加速。这个名为 SLI', NULL, 'CPU 上运算比 GPU 还快？美国莱斯大学最新研究克服硬件障碍', 46, 9, 1, '2021-02-23 18:32:03', 2, '2021-02-26 00:34:16', 'admin', 'admin', 0, 'post', 0, 0, 0, 0);
INSERT INTO `post` VALUES (29, NULL, '<h2>Kotlin，东宫太子</h2><p>谷歌今天宣布，Kotlin 编程语言现在是 Android 应用程序开发人员的首选语言。</p><p>谷歌在今天的声明中写道：&ldquo;Android 的开发将越来越以 Kotlin 为先。&rdquo;许多新的 Jetpack API 和特性将首先在 Kotlin 中提供。如果你要开始一个新项目，你应该用 Kotlin 来写；用 Kotlin 编写通常意味着更少的代码&mdash;&mdash;更少用于类型、测试和维护方面的代码。&rdquo;</p><p>就在两年前的 2017 年 I/O 大会上，谷歌宣布在其 Android Studio IDE 中支持 Kotlin。考虑到 Java 长期以来一直是 Android 应用程序开发的首选语言，这有点令人惊讶。在过去的两年里，Kotlin 的人气只增不减。谷歌说，超过 50% 的专业 Android 开发人员现在使用该语言开发他们的应用程序，在最新的 Stack Overflow 开发人员调查中，它被列为第四大最受欢迎的编程语言。</p><p>Android 的首席倡导者切特&middot;哈斯 (Chet Haase) 表示：&ldquo;我们宣布，我们正在采取的下一个重大举措是，我们将以 Kotlin 为先。&rdquo;</p><p>哈斯说：&ldquo;我们知道，不是每个人现在都在用 Kotlin，但是我们相信，你会需要它的。&rdquo;&ldquo;你可能有充分的理由继续使用 C++ 和 Java 编程语言，这完全没问题。这些语言不会消失。&rdquo;</p><p>Kotlin，Android 世界的 Swift？</p><p>早在 2015 年，Kotlin 就有&ldquo;Android 世界的 Swift &rdquo;的称号。</p><p>Kotlin 是一门与 Swift 类似的静态类型 JVM 语言，由 JetBrains 设计开发并开源。与 Java 相比，Kotlin 的语法更简洁、更具表达性，而且提供了更多的特性，比如，高阶函数、操作符重载、字符串模板。它与 Java 高度可互操作，可以同时用在一个项目中。</p><p>按照 JetBrains 的说法，根据他们多年的 Java 平台开发经验，他们认为 Java 编程语言有一定的局限性和问题，而且由于需要向后兼容，它们不可能或很难得到解决。因此，他们创建了 Kotlin 项目，主要目标是：</p><ul><li><p>创建一种兼容 Java 的语言</p></li><li><p>编译速度至少同 Java 一样快</p></li><li><p>比 Java 更安全</p></li><li><p>比 Java 更简洁</p></li><li><p>比最成熟的竞争者 Scala 还简单</p></li></ul><p>若在当时看来，Android 世界的 Swift 称号似乎底气不足，更像是一种美好的愿望。那么在 2017、2019 两届的 Google I/O 以后，这个说法可以站住脚了。</p><p>Kotlin 真比 Java 强？</p><p>许多新语言的出现似乎都是源于对某种其它语言的厌倦。似乎 Kotlin 也是如此。但在 JetBrains 看来，Kotlin 项目的原始动机就是为了提升生产力。JetBrains 开发者支持组组长 Hadi Hariri 在接受 InfoQ 采访时表示：</p><p><br></p><p>&rdquo;尽管当时我们已经开发了对几种基于 JVM 的编程语言的支持，我们还是基本都在 Java 环境下写基于 IntelliJ 的 API。IntelliJ 开发系统是基于 Groovy 和 Gant 的，Groovy 也用于测试，RubyMine 中还有一些 JRuby 代码，情况就是如此。我们希望转向更具表现力的语言从而提高生产力。同时，我们不能接受在 Java 互操作性或编译速度方面的妥协。&ldquo;</p><p><br></p><p>Kotlin 与 Java 总是在主观比较</p><p>&ldquo;Kotlin 比 Java 好&rdquo;，&ldquo;Kotlin 可读性比 Java 强&rdquo;，&ldquo;Kotlin 开发速度比 Java 快&rdquo;，类似这样的陈述缺少相关准确数据的支持，所以都归为主观看法一类。</p><p>主观看法是个体开发人员在对与 Kotlin 或 Java 相关的主题作出一个或多个主观判断时形成。</p><p>开发人员的主观判断存在如下问题：</p><ul><li><p>没有与主观判断相关联的量化指标。</p></li><li><p>主观判断存在很大的偏见。</p></li><li><p>主观判断的偏见在开发人员之间存在很大的差异。</p></li></ul><p>由于没有与主观判断相关联的量化指标，建立在这些判断基础上的观点只是反映出了开发人员之前就有的偏见。不同的开发人员可能有着截然不同的偏见，因此，有开发人员认为 Kotlin 是不错（或糟糕）的 Java 替代者并不意味着其他开发人员也这么认为。</p><p>而且，由于没有客观指标，主观分歧就无法客观地消除，这经常会导致&ldquo;口水战&rdquo;。</p><p>相较于 Java，Kotlin 的确在一些方面有较大优势：效率高、易维护、可靠、简单易学。在一些特定场景下，许多 Java 开发者因为某些方面的问题选择了切换到 Kotlin：比如受够了 Java NullPointerException 的人都喜欢 Kotlin 的 Null 安全特性；扩展函数被大量使用；除了扩展 Java 类，人们也常常将 Java 代码迁移到 Kotlin。</p><p>根据英国软件公司 Pusher 调查的数据显示，在样本数 2744 人的调查中，超过 87% 的受调者已经完成了迁移。他们有的使用了迁移向导，有的直接手动修改代码。超过四分之一的受调者迁移到 Kotlin 后又回到了 Java。有技术方面的原因，也有组织方面的原因。其中使用了反射或代码生成的工具是被提及最多的因素。</p><ul><li><p>&ldquo;Kotlin 的枚举不能包含常量。在自定义注解时（比如 @IntDef），为了保持接口的整洁，需要将值保存在枚举中。&rdquo;</p></li><li><p>&ldquo;我们正在使用 Realm，但它不能与数据类一起使用。&rdquo;</p></li><li><p>&ldquo;我们的 Java 代码中使用了 Retrolambda，因为类型缺失，很难转到 Kotlin。&rdquo;</p></li><li><p>&ldquo;另一个团队不喜欢 Kotlin，我们也预料不到会这样。&rdquo;</p></li><li><p>&ldquo;这不是我们决定的，我们是按照公司的规则来的。&rdquo;</p></li></ul><p>Java 依旧是编程语言排行榜上的第一名。但 Java 是最好的语言么？不是，因为在每个领域都有更合适的编程语言。</p><p>那么，Java 语言到底有什么优势可以占据排行榜第一的位置呢？</p><ul><li><p>其一，语法比较简单，学过计算机编程的开发者都能快速上手。</p></li><li><p>其二，在若干了领域都有很强的竞争力，比如服务端编程，高性能网络程序，企业软件事务处理，分布式计算，Android 移动终端应用开发等等。</p></li><li><p>最重要的一点是符合工程学的需求，成为企业软件公司的首选，也受到互联网公司的青睐。</p></li></ul><p>综合而言，Java 语言全能方面是最好的。但同样可以看到，Android 社区拥抱 Kotlin 的速度越来越快，也许有一天，在 Android 世界里，我们会看到 Kotlin 对 Java 的超越。</p><h2><s>为什么谷歌会支持 Kotlin？</s></h2><p><br></p><p>免责声明：以下内容纯属基于既有事实合理推测，毫无任何实锤。</p><p><br></p><p>还记得谷歌与 Oracle 旷日持久的 Java 侵权案吗？这个持续时间长达 8、9 年的纷争目前以谷歌败诉为最新结局，其需要向 Oracle 赔偿 88 亿美元。（编者注：在过去几年时间里，几次裁决分别判两家公司胜诉或败诉。今年 1 月份，谷歌不服判决上诉美国最高法院做最终裁决。）</p><p>事件的起因是在 2010 年，作为 Java 拥有者的 Oracle 认为，谷歌在 Android 系统上无偿使用了 37 个 Java APIs，这侵犯了他们的专利，而在 Android 中还有 9 行代码抄袭了 Java，这侵犯了他们的版权。</p><p>那 9 行代码造成抄袭的缘由据说是因为当时谷歌的一位工程师在为 Android 项目工作的同时，又为 Sun 公司的 OpenJDK 效力，后来，该工程师直接从 OpenJDK 中复制了 9 行代码到 Android 中，由于 Google 没有得到 Sun 公司的授权，所以 Oracle 收购 Sun 之后，Java 易主，这就相当于侵犯了 Oracle 的版权。</p><p>而对于那 37 个 Java APIs，双方各执己见，谷歌认为 API 不应受版权保护，而 Oracle 则认为 谷歌对其的使用具有很强的商业性，再加上用 Java 写的 Android 代码无法在 JVM 上运行，这对 Java 语言是一种分裂，同时 Oracle 认为，Android 通过不当使用 Java API 挤占了 Java ME 可能的市场，这是它巨额索赔的根基。</p><p>2016 年初，Google 发言人表示，Android N（7.0) 不再沿用现有的 Java APIs 内容，而是迁移至基于 OpenJDK 的方法，为开发者创建一个通用代码库。虽然没法规避 Java APIs 官司，但至少可以减少潜在的可能纠纷。</p><p>到了 2017 年的 Google I/O 大会，Google 宣布 Kotlin 成为 Android 开发的一级语言，可以说对 Kotlin 寄予了厚望。此后，Kotlin 也被开发者视为 Java 的替代品。</p><p>在之后的一年时间里，Google 可以说把 Kotlin 当亲儿子看待，为什么这么说呢？让我们来梳理这一年 Google 为 Kotlin 做了什么：</p><ul><li><p>2017 年 11 月，Android Studio 3.0 正式开放下载，此版本的 Android Studio 将 Kotlin 语言支持集成到 IDE 中，在此版本上，代码自动完成和语法突出显示都可以在此版本上平稳运行，今年 4 月推出的 Android Studio 3.1 为 Kotlin 代码提供了更好的 Lint 支持，并通过为 Android Emulator 添加 Quick Boot 功能加快了测试速度。</p></li><li><p>2018 年 2 月，Google 推出预览版本的 Android KTX，Android KTX 是一组扩展程序，它在 Android 框架和支持库上提供了一个良好的 API 层，使 Kotlin 代码更加简洁。</p></li><li><p>在 Google I/O 2018 上，Google 发布了 Android Jetpack，它是下一代的 Android 组件，它将支持库向后兼容和立即更新的优点融合到更多组件中，提高开发速率和质量，不仅如此，Android Jetpack 将全面兼容 Kotlin，而且它还能利用 Android KTX 使得 Kotlin 代码更加简洁。</p></li></ul><p>这些都是 Google 逐渐向 Kotlin 靠拢的证据，虽然还不至于让 Kotlin 完全取代 Java，但不难看出 Google 的&ldquo;偏心&rdquo;。事实上，Kotlin 自己也非常争气：2017 年 11 月，在第一届 Kotlin 专题大会 KotlinConf 上，Kotlin 首席设计师 Andrey Breslav 宣布 Kotlin 将支持 iOS 开发和 Web 开发，这意味着 Kotlin 向全平台开发迈出了重要的一步。</p><p>Kotlin 目前正处于发展的初始阶段，还有很多成长的空间。Google 现在是把它当成 Android 黄昏时期的救命稻草，它能与 Java 100% 互通，但它存在的目的并不是为了取代 Java，只是为了让开发者有多种选择。虽说编程语言只是软件实现的一种工具，开发者无论选择哪种语言都没有绝对的对与错。但在互联网时代，开发者应该懂得审时度势，拥抱变化，才能走得更远。</p>', 0, 'Kotlin，东宫太子谷歌今天宣布，Kotlin 编程语言现在是 Android 应用程序开发人员的首选语言。谷歌在今天的声明中写道：&ldquo;Android 的开发将越来越以 Kotlin 为先', NULL, 'Java 失宠，谷歌宣布 Kotlin 现在是 Android 开发的首选语言', 10, 1, 2, '2021-02-25 18:32:03', 0, '2021-04-16 18:35:20', 'admin', 'admin', 0, 'post', 1, 0, 0, 1);
INSERT INTO `post` VALUES (30, NULL, '<h2>你的面孔，他的&ldquo;玩物&rdquo;</h2><p>&ldquo;上流社会&rdquo;人士从来不缺乏对于新技术的&ldquo;热情&rdquo;。</p><p>2018 年 10 月的一个星期二晚上，Gristedes 便利连锁店的亿万富翁老板 John Catsimatidis 在曼哈顿苏活区附近一家高档意大利餐厅用餐，他的女儿 Andrea 与一名 Catsimatidis 不认识的人一同走了进来。显然，他的女儿没有发现自己的父亲也在这家餐厅里，此时，Catsimatidis 叫服务员走过去拍张照片。</p><p>随后，Catsimatidis 将图片上传到手机上的面部识别应用程序&mdash;&mdash;Clearview AI。该应用程序背后的初创公司拥有一个庞大的数据库，其中包含数十亿张照片，这些照片是从 Facebook、Twitter 和 LinkedIn 等网站上抓取的。几秒钟之内，Catsimatidis 看到了这个神秘男子的照片集，以及它们出现的网址，并且清楚地知道了：他女儿的约会对象是来自旧金山的一位风险投资家。</p><p>Catsimatidis 说：&ldquo;我只是想确保他不是骗子。&rdquo;随后，他将该男子的简历发给了女儿。</p><p>Andrea 的约会对象惊讶于 Catsimatidis 如何迅速地得到这样详尽的信息。而 Andrea 则表示：&ldquo;我了解我父亲，他确实能够做出这样疯狂的事情，他对新的技术非常敏感。&rdquo;</p><p>Catsimatidis 是从公司另一位创始人那里知道了这一应用，而在此前，那位创始人已经把这一应用放在了部分线下商店里，用以侦察小偷或竞争对手的潜入。除此之外，Clearview AI 早已在美国&ldquo;上流社会&rdquo;的聚会中流传开来，他们用这一软件来识别感兴趣的陌生人，或者帮他们想起那些熟悉但不记得名字的脸孔。</p><p>至于 Clearview AI 本身也是很乐于向这些人提供服务的，&ldquo;我们向潜在和现有投资者以及其他战略合作伙伴提供了试用帐户，以便他们可以测试该技术。&rdquo;该公司的联合创始人 Hoan Ton-That 说。</p><p>&ldquo;人脸搜索&rdquo;产业浮出水面</p><p>一张照片，只消数分钟，一个人在全网发布过的照片以及来源就查的一清二楚，这样的操作让人不寒而栗，而其背后的&ldquo;人脸搜索&rdquo;产业更加让人惶恐。</p><p>以 Clearview AI 为例，这家公司虽然以人脸识别技术起家，但是在业内也算得上是&ldquo;名声在外&rdquo;了。</p><p>这家公司声称自己设计了一套人脸识别寻人系统：用户可以通过上传某人的照片到该系统，即可获得此人在全网公开的照片信息及其源头链接，简单来讲就是&ldquo;一张照片，全网寻人&rdquo;。同时，该公司表示，他们从 Facebook，YouTube，Venmo 等数百万其他网站中抓取了约 30 亿张图像，远远超出了美国政府或硅谷科技巨头们建造的任何数据库。</p><p>该公司创始人 Hoan Ton-Town 说，他希望将这套系统提供给执法部门使用，这样可以大大增加走失人员的搜索以及暴恐人员的跟踪力度。比如，Clearview AI 就曾声称协助纽约警方破获了一起疑似爆炸物的案件，虽然纽约警方后来表示案件破获与这家公司并无关系。</p><p><img src=\"https://constatic.geekbang.org/infoq/5e6717a2bde96.png?imageView2/0/w/800\" alt=\"人脸搜索，在AI的阴暗面肆无忌惮\" class=\"fr-fic fr-dii\"></p><p>Clearview AI 号称协助破案的宣传文件</p><p><br></p><p>抛开这一&ldquo;打脸&rdquo;事件不说，像 Clearview AI 这样依靠&ldquo;人脸搜索&rdquo;业务吃饭的公司正在悄悄崛起，甚至在逐渐成长为一个庞大的产业。</p><p>比如，一家名叫 Trustwave 的新加坡公司就推出了一款基于人脸识别的情报搜索工具&mdash;&mdash;SocialMapper。使用方法同样简单，只需要上传一张人脸照片和姓名，就能找到此人在 Twitter、Facebook、LinkedIn、Instagram，甚至微博、豆瓣等等社交媒体上的用户主页。最后，SocialMapper 还会综合这些社交媒体内容出具报告，报告会包含性别、年龄、所在地、电子邮箱等等详细的个人信息。</p><p>除了形形色色的 App，还有一些专门以搜脸找人为核心业务的网站。这些网站往往打着一些看似正义的旗号，比如&ldquo;帮您查看是否有人非法使用您的照片&rdquo;，实际上则是依靠人脸搜索来帮助别有用心之人完成类似人肉搜索的业务。这些网站甚至会对不同的业务明码标价，按级别收费，某些网站的&ldquo;高级 VIP&rdquo;甚至可以获得极其详细的目标人物资料，与之相关的亲属等信息也会统统暴露。</p><p><img src=\"https://constatic.geekbang.org/infoq/5e6717a282e24.png?imageView2/0/w/800\" alt=\"人脸搜索，在AI的阴暗面肆无忌惮\" class=\"fr-fic fr-dii\"></p><p>某人脸搜索宣传</p><p><br></p><h2>在质疑声中成长的人脸识别</h2><p>2020 年 1 月，Twitter 向 Clearview AI 发送了一封停止访问信，指出该公司从其网站收集了照片，这违反了 Twitter 的服务条款，并要求 Clearview AI 停止数据抓取并删除从 Twitter 收集的所有数据；不久后，Facebook 也对 Clearview AI 发出了类似的警告。</p><p>虽然该公司一再强调，其技术&ldquo;仅适用于执法机构和选择安全专业人员作为调查工具&rdquo;。但是也并没有任何行动来制止这项技术被滥用。或许是无能为力，又或者是收到了&ldquo;其他力量&rdquo;的控制，总之 Clearview AI 要面临的问题恐怕不止一两件，据悉，美国伊利诺斯州东部北区地方法院已经向 Clearview AI 提起诉讼，称 Clearview AI 的行为是对公民自由的威胁。</p><p>Clearview AI 未来的命运会如何暂且不表，回过头来说说人脸识别这项质疑声中不断成长的技术。</p><p>安全问题是一直围绕着人脸识别技术的核心话题，虽然无数企业都在强调对于这项技术安全性的保障，并且在很多场景下，人脸识别真的提供了不少的便利，但是质疑一直没能从用户的心头打消。</p><p>相比搜脸寻人这种刚刚崛起的产业，Deepfake、AI 换脸这样的名词或许更能引起人们的警觉。毕竟当换脸技术刚刚兴起的时候，就在全球引发了热议，换脸 App 虽然挑起了一段时间的热度，但更加剧了人们对于人脸识别的恐惧&mdash;&mdash;换脸之后毫无违和感，不正可以用来造假吗？</p><p>受舆论的压力影响，一些换脸 App 下架了，就连 GitHub 也禁封了 Deepfake 的相关开源项目。但是影响已经形成，且仍然有不少人在早先下载好的代码中不断&ldquo;优化&rdquo;，在那些普通用户看不到的地方继续散播着伪造的图片、视频。</p><p>除了来自用户的不信任，人脸识别还被不同国家和地区的立法机构&ldquo;特殊关注&rdquo;，比如第一个全面禁止人脸识别的城市&mdash;&mdash;旧金山，以及号称&ldquo;史上最严&rdquo;的 GDPR 都曾对人脸识别的&ldquo;不正确使用&rdquo;进行过处罚或警告。</p><p>虽然这些严格执行的法律一定程度上保护了用户的隐私安全，但却也不同程度地限制了技术的发展。安全与发展两者如何能全面发展，也成为了立法者与企业不断为之努力的方向。</p><h2>结 语</h2><p>人脸识别，老生常谈，常谈常新。</p><p>技术在进步，制度在完善，但是灰色、黑色的产业链却总也没法一网打尽，本该用来向善的科技也在那些阴暗的角落里滋生更多的病毒，甚至成为某些权钱交易的&ldquo;桥梁&rdquo;。是的，技术向善在与人，但人心若向恶又当如何？</p><p>拓展阅读：</p><p>https://www.infoq.cn/article/422lAN7NjQVkRYuZ8vcs</p><p>https://www.nytimes.com/2020/03/05/technology/clearview-investors.html</p>', 0, '你的面孔，他的&ldquo;玩物&rdquo;&ldquo;上流社会&rdquo;人士从来不缺乏对于新技术的&ldquo;热情&rdquo;。2018 年 10 月的一个星期二晚上，Gristedes', NULL, '人脸搜索，在 AI 的阴暗面肆无忌惮', 2, 1, 0, '2021-02-05 18:32:03', 0, '2021-02-26 00:32:11', 'admin', 'admin', 0, 'post', 0, 0, 0, 0);
INSERT INTO `post` VALUES (31, NULL, '<p>&ldquo;去 O&rdquo;一直是最近 10 年描述系统架构改造中最常出现的词之一。虽然&ldquo;去 O&rdquo;被很多工程师和技术从业者津津乐道，但业界真正能实现把系统全部去 O，特别是金融场景的核心系统全部去 O 的案例并不多。那么去 O 到底难在哪里呢。</p><p>为了解答这个问题，首先我们要理解去 O 架构改造的本质是什么？去 O 架构改造的本质其一是让系统架构具备在线更换数据库的能力，无论去 O 的目标库是 MySQL，或是其他的关系型数据库，最终都是要解决这样一个问题。</p><p>在线更换数据库到底难在哪里，会遇到哪些问题呢？</p><p>问题一：如何无感知的实时动态数据的迁移？</p><p>首先数据库作为交易型系统最核心的组件没有之一，这一点对于数据库的重要性评价一点都不夸张。当前大部分知名的网站和系统都是 7x24 小时对外提供服务，数据库也是 7*24 小时无时不刻处理着大量的读写服务，要实现去 O 就意味着你要在一个 Oracle 库还在对外提供服务的时候，在某个时间点让一个 MySQL 库快速替换掉 Oracle 库，并平稳的接管 Oracle 的所有服务。</p><p>不同于无状态的系统组件切换把流量切走即完成切换工作，而数据库作为有状态的系统组件，如何设计一套从应用改造、到数据同步、再到数据库流量切换的稳妥去 O 方案，可以非常谨慎的把一个正在对外提供服务，数据处在实时变化状态的 Oracle 库上的数据无缝的方式迁移至 MySQL 中。</p><p>为了有效解决这个问题，陆金所研发的去 O 工具包含一整套完善的在线数据迁移功能。在工具中勾选需要去 O 的 Oracle 表，工具会自动完成 O to M 的全量同步、增量同步，并通过解析 Oracle redolog 来追增量日志，最终形成一个 Oracle 为主库，MySQL 为备库的异构实时备库。</p><p>问题二：如何管理和协调好高频迭代的去 O 改造和功能改造？</p><p>其次去 O 架构改造的主体工作是对应用层代码的重构，特别对 DAO（数据访问层）的重构，对于某些复杂的系统来说，重构的时间会持续数月甚至更久。在这段漫长的去 O 改造时间窗口里，不但 Oracle 库的数据在动态发生变化，对于一个处在高速迭代中的网站和系统来说，应用的功能代码也在不断发生变化。如果 A 团队在为应用做去 O 架构改造，而这个期间 B 团队在不断的给应用开发新的功能，如何进行去 O 的工作拆分可以有效的管理和协调好两个开发团队的编码和上线节奏呢。</p><p>为了有效应对这个场景，陆金所研发的去 O 工具会在去 O 架构改造和应用业务改造之前进行有效协调，并向业务开发尽可能屏蔽去 O 架构改造的影响。比如业务改造需要在处于 O 和 M 并行双写的库上修改表结构并发布新的数据库访问接口，大量的工作会由去 O 工具来自动化完成。</p><p><img src=\"https://static001.infoq.cn/resource/image/39/7a/39c99b11fc68e8b8ea609136066a807a.png\" alt=\"金融系统去Oracle实践，到底需要解决哪些问题？\" class=\"fr-fic fr-dii\"></p><p>问题三：如何稳妥落地数据库流量的在线切换？</p><p>当某个库的应用去 O 改造完成并上线后，会实施生产环境 Oracle 的流量切换到 MySQL 上。在这个切换过程中，如何确保 Oracle 上的最后一笔事务提交成功，并同步到 MySQL 后完成数据一致性校验，且针对这个 Oracle 库的所有写操作能在快速、全部切换到 MySQL 上，不会出现部分写流量 Oracle，部分写流量 MySQL，两库双写的异常状态。</p><p>当流量切换到 MySQL 后 a，如果出现应用报错或 bug、MySQL 性能问题等在前期压测或准备工作中未覆盖到的突发情况，如何实现流量快速回切到 Oracle 上，且确保在 MySQL 中写入的数据也能完全一致的回到 Oracle 中。</p><p>解决好这个问题，是控制好去 O 落地风险的核心所在。陆金所设计了一整套在线切换数据库的架构框架来确保在瞬间把流量从 Oracle 切走到 MySQL 中，同时也可以瞬间把流量切回到 Oracle，并确保两边的数据完全一致。</p><p><img src=\"https://static001.infoq.cn/resource/image/cb/79/cb77e1221fa15a28a0967a50ec500379.png\" alt=\"金融系统去Oracle实践，到底需要解决哪些问题？\" class=\"fr-fic fr-dii\"></p><p>问题四：如何有效拆分去 O 的任务，从而实现对全站业务单次影响小、迭代频度快的去 O 上线？</p><p>要实现全站去 O，必然面临着对一些复杂、庞大的核心系统进行去 O 改造。以陆金所为例，在全站中像用户中心、资产中心、资金账户等这种给全站所有金融产品线都提供基础服务的子系统就是这类复杂和庞大的核心系统，同时包括基金、主账户等专属金融产品线的业务逻辑复杂，所以子系统也非常庞大。</p><p>所以对于这类子系统，如果需要在一个大版本里全部去 O 改造完成，并在一个晚上业务低峰期一次性全部从 O 切换到 M，无论是当晚的切换风险，还是切换完成后，在第二天业务高峰期出现问题和 bug 的风险，包括开发团队短时间内去 O 改造的工作量和出现重大 bug 的机率都是非常大且不可控的。</p><p>如何把一个庞大且重要的复杂子系统拆分成多个去 O 的版本按批次上线和切换流量，且做到单个批次影响可控，也是全站去 O 中需要谨慎设计的方案。</p><p>而这也是整个去 O 过程中架构设计最有趣的部分。</p><p>上面提到了去 O 中在架构层实现在线换库需要解决的四大问题。除了在线换库外，去 O 架构改造的本质其二是引入更多的存储引擎在合适的场景来承接 Oracle 数据库的计算和存储能力。这就引出了第五个问题。</p><p>问题五：如何在各种场景下使用合适的开源存储引擎来去 O，并且在架构上进行融合。</p><p>首先 Oracle 是个非常强大的关系型数据库，无论在 OLTP 和 OLAP 场景表现都很出色，且具备一整套完善、好用的运维和监控工具。但于此同时 Oracle 虽然对各种场景支持较为全面，但在各个特定场景下，一些开源的数据库或存储引擎在性能或成本投入的综合考量上胜过 Oracle，都会是比 Oracle 更合适的选择方案。</p><p>所以全站去 O 不仅仅是去 O 到 MySQL 中，MySQL 能承接的只是 Oracle 的部分计算和存储能力，在整个陆金所的全站去 O 落地过程中，除了 MySQL 外，我们还在不同的场景下使用 ES、HBase、TiDB、Impala+kudu 等存储引擎，甚至是应用层的代码来承接和替换 Oracle，并且整体收益比使用 Oracle 更好。</p><p>在完成去 O 后，陆金所的生产环境出现了大量开源的存储引擎来支撑各种合适的业务场景。同时我们也研发了数据总线平台来实现数据在一个地方写入和提交，秒级同步到其他存储引擎的架构。</p><p><img src=\"https://static001.infoq.cn/resource/image/8a/8e/8a4b88fcfeab8fa62c6c6b5a6617418e.png\" alt=\"金融系统去Oracle实践，到底需要解决哪些问题？\" class=\"fr-fic fr-dii\"></p><p>上述是陆金所在全站去 O 过程中遇到的 5 个实战问题大类，整个全站去 O 过程中需要解决细节问题还有很多，这里无法一一列举，因为去 O 作为一个复杂的系统架构改造本身就要求技术团队事无巨细的处理好各种细节问题。</p><p>基于此，陆金所优化和开发了一整套方案和工具来，有效推进去 O 改造稳妥落地且保障风险可控。后续会推出一个系列的去 O 专题和大家分享，希望给有去 O 改造计划的技术团队和公司带来一些参考和借鉴价值，敬请期待。</p>', 0, '&ldquo;去 O&rdquo;一直是最近 10 年描述系统架构改造中最常出现的词之一。虽然&ldquo;去 O&rdquo;被很多工程师和技术从业者津津乐道，但业界真正能实现把系统全部去 O，特别', NULL, '金融系统去 Oracle 实践，到底需要解决哪些问题？', 0, 3, 0, '2021-02-05 18:32:03', 0, '2021-02-26 00:32:09', 'admin', 'admin', 1, 'post', 0, 0, 0, 0);
INSERT INTO `post` VALUES (32, NULL, '<p>前几天，我在 Reddit 上面闲逛的时候，发现了一篇有趣的文章，名为《影响我们世界的十大算法》。作者 George Dvorsky 希望通过此文解释算法在当今世界上的重要意义，以及哪些算法为我们的文明做出突出贡献。</p><p>现在，如果大家对于算法有些涉猎，那么在读过文章后的第一个想法很可能是&mdash;&mdash;作者真的知道算法是什么吗？或者说 Facebook 新闻源是否属于算法？因为如果 Facebook 新闻源也是一种算法，那么我们几乎可以把一切东西都归结为算法。因此，我希望在本篇文章中解释算法的真实定义，而后探讨 10 种（或者更多）真正支配着整个世界的算法。</p><p>算法究竟是什么？</p><p><br></p><p>直白地讲，算法是指一切经过明确定义的计算过程，其将某个或者某组值作为输入内容，并产生某个或者某组值作为输出结果。因此，算法代表的是一系列计算步骤，用于将输入转换为输出。&mdash;&mdash;资源来源：Thomas H. Cormen 与 Chales E. Leiserson (2009 年)，《算法导论》第 3 版。</p><p><br></p><p>更简单地总结，我们可以将算法视为一系列用于解决某个任务的步骤（是的，不仅仅是计算机会使用算法，人类同样在使用算法）。就目前的标准来看，算法应当具有以下三大重要特征才被视为拥有实际效果：</p><ol><li><p>应该是有限的: 算法应该在有限的时间内用有限的步骤解决掉其旨在解决的问题，也就是说算法必须在有限的时间内可以完成，要不然就没有现实意义。</p></li><li><p>应该具有明确的指令: 算法中的每个步骤必须经过精确定义 ; 同时应针对每种情况做出明确说明。</p></li><li><p>应该切实有效: 算法应当能够解决其旨在解决的问题。此外，算法应该被证明可以单纯利用纸笔工具实现收敛。</p></li></ol><p>此外，需要强调的是算法的应用不仅局限于计算科学，同时它也作为一种数学实体。事实上，早在公元前 1600 年就已经出现第一条记录在案的数学算法&mdash;&mdash;巴比伦人发现了最早的已知算法，用于分解平方根。因此，回到文章开头我们讨论的问题，我读到的那篇文章将算法视为计算实体，但如果采取这样一个更为宽泛的定义，那么支配世界的十大算法很可能体现为算术方法（例如减法、乘法等）。</p><p>但是，如果采取我们在本文中做出的算法定义，那么问题仍然存在：支配世界的十种算法究竟有哪些？在这里，我列出一份小小的清单，排名不分先后。</p><p>1. 合并排序，快速排序与堆排序</p><p><img src=\"https://static001.geekbang.org/wechat/images/28/28f8f7971b1f226775a563ddb63184ed.png\" alt=\"真正支配世界的十种算法\" class=\"fr-fic fr-dii\"></p><p>对元素进行排序的最佳算法是什么？具体答案取决于你的实际需要，因此我把这三种比较常用的排序算法列为同一类 ; 也许你更偏爱其中一种，但事实上三者都非常重要。</p><p>其中合并排序算法是迄今为止我们所拥有的最为重要的算法之一。这是一种基于比较的排序算法，以分治的方法解决原本时间复杂度为 O(n^2) 的问题。该算法由数学家 John von Neumann 于 1945 年发明得出。</p><p>快速排序是另一种用于解决排序问题的方法，其能够实现就地分区，同样属于一类分而治之的算法。该算法的问题在于其在排序方面并不稳定，但在对基于内存的数组进行排序时表现出色。</p><p>最后是堆排序算法，其利用优先级队列来减少数据中的搜索时间。该算法同样属于就地算法，且同样不属于稳定排序。</p><p>这些算法相较于我们之前使用过的其它方法（例如冒泡排序）有了很大的改进。事实上，正是由于这些算法的出现，我们才得以迎来数据挖掘、人工智能等网络上常见的众多现代计算工具。</p><p>2. 傅利叶变换与快速傅利叶变换</p><p><img src=\"https://static001.geekbang.org/wechat/images/46/467017bc978831b23a99833f2c2d3872.jpeg\" alt=\"真正支配世界的十种算法\" class=\"fr-fic fr-dii\"></p><p>整个数字世界都在使用这些简单但非常强大的算法，这些算法能够将信号从时域转换为频域，反之亦然。事实上，正是由于这些算法的存在，本篇文章才能被更多朋友所看到。</p><p>互联网、Wi-Fi、智能手机、电话、计算机、路由器以及卫星等几乎一切具有内置计算装置的设备都会以这样或者那样的方式使用这些算法以保持运行。如果不研究这些重要的算法，大家也不可能拿下电子学、计算机或者通信科学学位。</p><p>3. 迪杰斯特拉算法（Dijkstra，又译戴克斯特拉算法）</p><p><img src=\"https://static001.geekbang.org/wechat/images/8a/8a6e051c7cf08e18f9c537126f4fc1be.jpeg\" alt=\"真正支配世界的十种算法\" class=\"fr-fic fr-dii\"></p><p>实事求是地讲，如果没有这种算法，互联网根本无法像今天这样保持高效运作。这种图搜索算法具有多种应用方式，能够将需要解决的问题建模为图，并在其中找到两个节点间的最短路径。</p><p>今天，虽然我们已经拥有更好的最短路径问题解决方案，但迪杰斯特拉算法仍然在强调稳定性的众多系统当中得到广泛应用。</p><p>4. RSA 算法</p><p>如果没有加密与网络安全机制作为保障，互联网的重要程度不可能达到如今的水平。大家可能会想&ldquo;胡说，国家安全局局和众多情报机构的监控早就毁掉了互联网安全&rdquo;或者&ldquo;互联网根本就没有安全可言，傻子才会相信这种安全宣传&rdquo;; 但必须承认，大多数人仍然具有一定程度的安全信心，否则你根本就不会通过互联网进行消费。毕竟如果真的否定现有网络体系的安全性，谁会愿意在 Web 服务中输入自己的信用卡号码？</p><p>在密码学领域，有一种算法仍然是目前世界上最重要的算法之一，这就是 RSA 算法。该算法由 RSA 公司的创始人们开发而成，使得密码学成果得以供世界上的每个人随意使用，甚至最终塑造了当今密码学技术的实现方式。RSA 算法希望解决的问题是如何在独立平台及最终用户之间共享公钥，从而实现加密（当然，我认为 RSA 算法并没能彻底解决这个问题，从业者们还需要在这个方向上投入更多努力）。</p><p>5. 安全哈希算法</p><p>这实际上并不是真正的算法，而是由 NIST（美国国家标准技术研究所）所开发的一系列加密散列函数。然而，该算法家族对于世界秩序的维持起到了至关重要的作用。从应用程序商店、电子邮件、防病毒软件再到常用的网络浏览器，这一切都在使用这类算法（实际上，使用的是由这类算法生成的哈希值），用以确定你所下载的是否正是你希望获得的内容，或者你是否已经成为中间人攻击或者网络钓鱼攻击的受害者。</p><p>6. 整数分解</p><p>这是一种在计算领域被大量采用的数学算法。如果没有这种算法，密码学技术的安全水平将受到严重破坏。该算法用于将复合数的质数因子分解为较小的非零因数。这也被称为 FNP 类问题，属于 NP 类问题的扩展，且解决难度极高。</p><p>很多加密协议都以分解大型复合整数或相关问题的难度为基础&mdash;&mdash;RSA 算法就是其中的典型代表。正是由于对任意整数进行因子分解的难度极高，才使得基于 RSA 的公钥加密机制拥有较高的安全性水平。</p><p>量子计算的诞生大大降低了此类问题的解决难度，并开辟出一个全新的科学研究领域&mdash;&mdash;利用量子特性保障系统安全。</p><p>7. 链接分析</p><p><img src=\"https://static001.geekbang.org/wechat/images/60/607519b2cd07fb2322ba95028d7800c9.jpeg\" alt=\"真正支配世界的十种算法\" class=\"fr-fic fr-dii\"></p><p>在互联网时代下，分析不同实体间的关系当然非常重要。从搜索引擎到社交网络再到营销分析工具，每一方都在努力发现随着时间推移而不断变化的互联网结构。</p><p>链接分析可以说是普罗大众眼中最神秘也最难以理解的算法之一。问题在于，我们可以通过多种不同方法实现链接分析，而且多种特征的存在使得每种算法间都存在着一定差异（允许对算法申请专利），但其底层基础却又高度相似。</p><p>链接分析背后的基本思路非常简单，即允许使用者以矩阵的形式表示图形，从而将其转化为特征值问题。这一特征值可以为我们提供衡量图形结构以及各节点相对重要性的好方法。该算法由 Gabriel Pinski 与 Francis Narin 于 1976 年发明得出。</p><p>那么，谁在使用这一算法？谷歌公司需要进行网页排名，Facebook 需要发布新闻提要（因此，我们将 Facebook 的新闻源服务视为算法结果，而非算法本身），Google+ 与 Facebook 的好友推荐，LinkedIn 的工作岗位与联系人推荐，Netflix 与 Hulu 的影视关联、YouTube 的相关视频等等皆属于这一类。虽然其各自拥有不同的目标与参数组合，但背后的数学原理却是相通的。</p><p>最后，我想强调一点，虽然很多人认为谷歌公司似乎是第一家使用这种算法的企业，但早在 1996 年（谷歌公司诞生的两年之前），由 Robin Li 开发的 RankDex 小型搜索引擎已经开始利用这一基本思路进行页面排名。最终，HyperSearch 的创始人 Massimo Marchiori 也开始使用这种基于单页间关系的页面排名算法。（谷歌在其申请的专利当中提到了这两位奠基者。）</p><p>8. 比例微积分算法</p><p><img src=\"https://static001.geekbang.org/wechat/images/a1/a182389909a26e8162b1344fed251c3f.png\" alt=\"真正支配世界的十种算法\" class=\"fr-fic fr-dii\"></p><p>大家应该都体验过飞机、汽车、卫星服务或者手机网络吧？有些朋友还在工厂当中看到过机器人设备。如果是这样，那么你已经见识到了这一算法的威力。</p><p>该算法旨在利用控制回路反馈机制以最大程度控制期望输出信号与实际输出信号间的误差。其适用于一切存在信号处理需求的场景，包括以自动化方式通过电子技术控制的机械、液压或者热力系统。</p><p>也可以说，如果没有这种算法，那么我们的现代文明将无从谈起。</p><p>9. 数据压缩算法</p><p>很难确定哪种压缩算法的重要性最高，因为根据实际应用需求，大家使用的算法可能包括 zip、mp3 乃至 JPEG 以及 MPEG-2 等等。但相信大家都能清晰地感受到这些算法在各类结构中的重要作用。</p><p>除了最直观的文件压缩之外，大家还能在哪里看到压缩算法的踪影？很明显，网页会利用数据压缩技术控制你需要下载的文件体积，此外视频游戏、视频、音乐、数据存储、云计算以及数据库等也都是数据压缩算法大显身手的舞台。可以说，万事万物都离不开数据压缩，这类算法的存在使得系统能够以成本更低且效率更高的方式为用户服务。</p><p>10. 随机数生成算法</p><p><img src=\"https://static001.geekbang.org/wechat/images/dc/dc6bb6867496c7050a38842e37e306c7.png\" alt=\"真正支配世界的十种算法\" class=\"fr-fic fr-dii\"></p><p>今天，我们还没有&ldquo;真正的&rdquo;随机数生成器，但已经拥有众多完全可以满足需求的伪随机数生成器。这些算法广泛存在于互连链接、加密、安全哈希算法、视频游戏、人工智能、优化、问题条件初始化以及财务等领域。</p><p>最后，我想补充一点：这份清单只代表一种观点，而非真正全面的列表。因为在机器学习、矩阵乘法以及分类等领域还存在着诸多堪称文明社会根基的重要算法，而我在本文中并没有明确提及。</p>', 0, '前几天，我在 Reddit 上面闲逛的时候，发现了一篇有趣的文章，名为《影响我们世界的十大算法》。作者 George Dvorsky 希望通过此文解释算法在当今世界上的重要意义，以及哪些算法为我们的文', NULL, '真正支配世界的十种算法', 2, 1, 0, '2021-02-05 18:32:03', 0, '2021-02-26 00:32:08', 'admin', 'admin', 0, 'post', 0, 0, 0, 0);
INSERT INTO `post` VALUES (33, NULL, '<p><br></p><p><img src=\"https://static001.infoq.cn/resource/image/5b/50/5bbc22ba8f487342066a19210f02e050.jpg\" alt=\"开发安全、高质量代码的5款顶级Python工具\" class=\"fr-fic fr-dii\"></p><p>为提高代码的质量、安全性和可维护性，软件工程师每天会用到无数工具。</p><p>我会列出一些自己最喜欢的 python 工具，并从易用性（是否易于安装、运行和自动化）、质量影响（能否阻止可预见的 bug）、可维护性影响（是否让工作更轻松）和安全性影响（能否发现并阻止安全性问题）对它们进行打分，以供读者参考。</p><p>并且，我还将介绍如何将这些工具全包含进 CI pipeline，从而实现自动化和高效。</p><h2>1.Pipenv</h2><p>它是为Python 设计的开发管理和依赖管理的工具，最早由&nbsp;Requests&nbsp;的作者&nbsp;Kenneth Reitz&nbsp;编写。</p><p>如果你用 python 做过一段时间的开发，那么管理环境，你可能用过&nbsp;virtualenv&nbsp;或&nbsp;venv&nbsp;；依赖管理可能用过较可靠的pip freeze &gt; requirements.txt。</p><p>大多数情况下，这完全没问题。但是，我发现 pipenv 更方便，且很强大，加上它通过Pipfile和Pipfile.lock近乎去掉固定依赖的做法，很大程度上替代了requirements.txt，从而带来更可靠的部署。</p><p>不过，我对 pipenv 的未来有点担忧，因为 Python 基金会已搁置对 pip 的改进。而且，pipenv 在 2019 年缺乏实质性进展。但是，我仍然认为，对大多数 python 用户来说，pipenv 是绝佳的工具。</p><p>官网下载地址</p><p>月下载量： 2111976</p><p>备选方案：&nbsp;poetry&nbsp;、&nbsp;virtualenv&nbsp;、&nbsp;venv</p><p><img src=\"https://static001.infoq.cn/resource/image/0a/cb/0ac04953d9c3d17bf5f6b6997a779ecb.jpg\" alt=\"开发安全、高质量代码的5款顶级Python工具\" class=\"fr-fic fr-dii\"></p><h2>2.Ochrona</h2><p>这里，我有点私心，因为 Ochrona 是我积极开发并希望 2020 年发布的工具。不过，我还会介绍这个工具的替代方案。</p><p>Ochrona 是一款依赖分析和软件组成分析的工具，它可以用来检查你的开源依赖是否存在已知漏洞。这个领域，另一款很流行的开源工具是 pyup.io 的&nbsp;Safety&nbsp;。</p><p>我认为，Ochrona 比 Safety 更好的地方在于：</p><ol><li>无论是用于开源项目还是商业项目，它都提供免费方案，而且免费方案始终跟进最新的漏洞信息。</li><li>磁盘和 IO 使用非常少。不同于需要拉取整个漏洞数据库的本地工具，它是 SaaS 模式，只需调用一次公开的 API。</li><li>它提供优秀的漏洞数据并且每天更新，并比其他工具提供更多的漏洞详细信息，包括免费用户。</li></ol><p>官网下载地址</p><p>月下载量： 尚未发布</p><p>备选方案：&nbsp;safety&nbsp;、&nbsp;snyk&nbsp;(收费)</p><p><img src=\"https://static001.infoq.cn/resource/image/73/20/73bb1b1f17b2941c74f03f5b7baed220.jpg\" alt=\"开发安全、高质量代码的5款顶级Python工具\" class=\"fr-fic fr-dii\"></p><h2>3.Bandit</h2><p>如果必须推荐一个可提高 python 项目安全性的工具，那我推荐&nbsp;Bandit&nbsp;。</p><p>据悉，Bandit 出自 OpenStack，但现在由&nbsp;PyCQA&nbsp;维护。它是一款开源的 SAST（静态应用安全测试）工具，免费、可配置且快速。从某些方面来讲，它就像是关注安全领域的 linter。</p><p>Bandit 很适合用来发现问题，比如不安全的配置、已知的不安全模块使用情况等。</p><p>官网下载地址</p><p>月下载量： 575101</p><p>备选方案：&nbsp;pyre&nbsp;、&nbsp;pyt&nbsp;、&nbsp;dodgy</p><p><img src=\"https://static001.infoq.cn/resource/image/81/5d/8186f94fe7feab5fb5a235799f7eec5d.jpg\" alt=\"开发安全、高质量代码的5款顶级Python工具\" class=\"fr-fic fr-dii\"></p><h2>4.Black</h2><p>Black 是一款独特的代码格式化工具。它能自动将你的代码更正为 Black 样式（一个 Pep-8 的超集）。</p><p>传统的 linter 通常需要你把代码改为合规代码，而 Black 可以节省不少时间。并且，Black 只需有限的配置，这意味着你如果用过 Black，其他任何项目你都会觉得眼熟。</p><p>官网下载地址</p><p>月下载量： 1891711</p><p>备选方案：flake8、pylint</p><p><img src=\"https://static001.infoq.cn/resource/image/9b/35/9b8ef5b5261e1f3110fbe0dbb32d9c35.jpg\" alt=\"开发安全、高质量代码的5款顶级Python工具\" class=\"fr-fic fr-dii\"></p><h2>5.Mypy</h2><p>它是python 一个可选的静态类型检查器。&nbsp;PEP 484&nbsp;引入 python 的类型提示，Mypy 则利用这些类型提示对项目进行静态类型检查。</p><p>Python 依然有动态的 duck 类型，不过，添加静态类型检查能帮你减少测试和调试时间，更早发现错误。</p><p>目前，大公司也在跟进 python 的静态类型检查。在 Guido van Rossum 任职期间，Dropbox 用 Mypy 检查了 400 多万行代码。其他的 python 用户，比如 Instagram 也开始做静态类型检查。</p><p>官网下载地址</p><p>月下载量： 2487228</p><p>备选方案：&nbsp;pyre</p><p><img src=\"https://static001.infoq.cn/resource/image/06/18/061ec86ab8565a673459ad83368fc418.jpg\" alt=\"开发安全、高质量代码的5款顶级Python工具\" class=\"fr-fic fr-dii\"></p><h2>全部集成到一起</h2><p>这个例子种，我会用到&nbsp;Travis-CI&nbsp;，配置其他 CI 工具的过程与之类似相似，只是语法上会有差异。这里，我用一个简单、不安全且有问题的 flask 应用作为例子。</p><p>app.py文件如下：</p><p>复制代码</p><pre><table><tbody><tr><td><div data-line-number=\"1\">\n</div></td><td><p>from flask import Flask </p></td></tr><tr><td><div data-line-number=\"2\">\n</div></td><td><p>     </p></td></tr><tr><td><div data-line-number=\"3\">\n</div></td><td><p>app = Flask(__name__) </p></td></tr><tr><td><div data-line-number=\"4\">\n</div></td><td><p>    </p></td></tr><tr><td><div data-line-number=\"5\">\n</div></td><td><p>@app.route(&#39;/&lt;name&gt;&#39;) </p></td></tr><tr><td><div data-line-number=\"6\">\n</div></td><td><p>def hello_world(name: str) -&gt; str: </p></td></tr><tr><td><div data-line-number=\"7\">\n</div></td><td><p>    return hello_name(name)</p></td></tr><tr><td><div data-line-number=\"8\">\n</div></td><td><p>def hello_name(name: str) -&gt; int:</p></td></tr><tr><td><div data-line-number=\"9\">\n</div></td><td><p>    return f&quot;hello, {name}&quot;</p></td></tr><tr><td><div data-line-number=\"10\">\n</div></td><td><p>    </p></td></tr><tr><td><div data-line-number=\"11\">\n</div></td><td><p>if __name__ == &#39;__main__&#39;: </p></td></tr><tr><td><div data-line-number=\"12\">\n</div></td><td><p>    app.run(debug=True)</p></td></tr></tbody></table></pre><p>Pipfile如下：</p><p>复制代码</p><pre><table><tbody><tr><td><div data-line-number=\"1\">\n</div></td><td><p>[[source]]</p></td></tr><tr><td><div data-line-number=\"2\">\n</div></td><td><p>name = &quot;pypi&quot;</p></td></tr><tr><td><div data-line-number=\"3\">\n</div></td><td><p>url = &quot;https://pypi.org/simple&quot;</p></td></tr><tr><td><div data-line-number=\"4\">\n</div></td><td><p>verify_ssl = true</p></td></tr><tr><td><div data-line-number=\"5\">\n</div></td><td><p>\n</p></td></tr><tr><td><div data-line-number=\"6\">\n</div></td><td><p>[dev-packages]</p></td></tr><tr><td><div data-line-number=\"7\">\n</div></td><td><p>bandit = &quot;*&quot;</p></td></tr><tr><td><div data-line-number=\"8\">\n</div></td><td><p>v = {editable = true,version = &quot;*&quot;}</p></td></tr><tr><td><div data-line-number=\"9\">\n</div></td><td><p>black = &quot;*&quot;</p></td></tr><tr><td><div data-line-number=\"10\">\n</div></td><td><p>mypy = &quot;*&quot;</p></td></tr><tr><td><div data-line-number=\"11\">\n</div></td><td><p>ochrona = &quot;*&quot;</p></td></tr><tr><td><div data-line-number=\"12\">\n</div></td><td><p>\n</p></td></tr><tr><td><div data-line-number=\"13\">\n</div></td><td><p>[packages]</p></td></tr><tr><td><div data-line-number=\"14\">\n</div></td><td><p>flask = &quot;==0.12.2&quot;</p></td></tr><tr><td><div data-line-number=\"15\">\n</div></td><td><p>\n</p></td></tr><tr><td><div data-line-number=\"16\">\n</div></td><td><p>[requires]</p></td></tr><tr><td><div data-line-number=\"17\">\n</div></td><td><p>python_version = &quot;3.7&quot;</p></td></tr></tbody></table></pre><p>最后在根目录下创建一个.travis.yml文件，内容如下：</p><p>复制代码</p><pre><table><tbody><tr><td><div data-line-number=\"1\">\n</div></td><td><p>language: python</p></td></tr><tr><td><div data-line-number=\"2\">\n</div></td><td><p>python:</p></td></tr><tr><td><div data-line-number=\"3\">\n</div></td><td><p>  - 3.7</p></td></tr><tr><td><div data-line-number=\"4\">\n</div></td><td><p>install:</p></td></tr><tr><td><div data-line-number=\"5\">\n</div></td><td><p>  - pip install -U pip</p></td></tr><tr><td><div data-line-number=\"6\">\n</div></td><td><p>  - pip install pipenv</p></td></tr><tr><td><div data-line-number=\"7\">\n</div></td><td><p>  - pipenv install --dev</p></td></tr><tr><td><div data-line-number=\"8\">\n</div></td><td><p>script:</p></td></tr><tr><td><div data-line-number=\"9\">\n</div></td><td><p>  - bandit ./*</p></td></tr><tr><td><div data-line-number=\"10\">\n</div></td><td><p>  - black --check .</p></td></tr><tr><td><div data-line-number=\"11\">\n</div></td><td><p>  - ochrona</p></td></tr><tr><td><div data-line-number=\"12\">\n</div></td><td><p>  - mypy .</p></td></tr></tbody></table></pre><p>如果查看这里的构建，你会发现每个工具都标出错误或指出需修改的地方。那么，我们来做一些修正，如这个 PR&nbsp;所示，构建就可以通过。</p><p><img src=\"https://static001.infoq.cn/resource/image/fa/50/faa90fd7b730dbf5adf6f205bfe88c50.png\" alt=\"开发安全、高质量代码的5款顶级Python工具\" class=\"fr-fic fr-dii\"></p><p>将 Flask 升级到一个没有已知漏洞的版本</p><p><img src=\"https://static001.infoq.cn/resource/image/51/20/51dee83cd02c91d5fc6f123bad1e7f20.png\" alt=\"开发安全、高质量代码的5款顶级Python工具\" class=\"fr-fic fr-dii\"></p><p>修复类型注释，禁用调试模式，规范格式</p><p>虽然这个例子只涉及一个 CI 平台，但其实和集成到其他大多数平台的方法都很相似。</p><p>下面是一个总的评分表：</p><p><img src=\"https://static001.infoq.cn/resource/image/28/f6/28d907b9bd2ba1998c1d83bd541c63f6.jpg\" alt=\"开发安全、高质量代码的5款顶级Python工具\" class=\"fr-fic fr-dii\"></p><p>英文原文：</p><p>Top Python Tools for Developing Secure, Quality Code</p><p><br></p>', 0, '为提高代码的质量、安全性和可维护性，软件工程师每天会用到无数工具。我会列出一些自己最喜欢的 python 工具，并从易用性（是否易于安装、运行和自动化）、质量影响（能否阻止可预见的 bug）、可维护性', NULL, '开发安全、高质量代码的 5 款顶级 Python 工具', 4, 3, 2, '2021-02-05 18:32:03', 0, '2021-02-26 00:32:08', 'admin', 'admin', 0, 'post', 0, 0, 0, 0);
INSERT INTO `post` VALUES (34, NULL, '<p>2020 年 3 月 9 日，腾讯公司正式对外发布了《腾讯研发大数据报告》，该报告首次披露了腾讯集团在 2019 年在产品及研发方面的关键数据。报告显示，研发人员在集团员工的占比已超过 66%，2019 年全年新增 12.9 亿行代码，C++ 是腾讯使用最多编程语言，Go 语言首次跻身前五。</p><p>本次公布的报告数据来源于支撑腾讯全业务研发流程的三大平台：敏捷研发协作平台 TAPD、腾讯代码托管平台工蜂与腾讯集成交付系统腾讯 CI。</p><p>在研发投入和研发效能方面，数据可圈可点：</p><ul><li>研发人员占比达 66%，位居互联网公司前列；</li><li>新增研发项目 3500 个，其中 To B 项目增长率达 77%；</li><li>新增代码行数 12.9 亿，同比增长 30%；</li><li>60% 的项目团队规模在 20 人以下，47.8% 的项目迭代周期在 1 周之内；</li><li>内部使用最多的五种编程语言分别是：C++、JavaScript、Go、Java、Python。</li><li>&hellip;&hellip;</li></ul><p>而在开源方面，腾讯 2019 年同样取得了不俗的成绩：</p><ul><li>在内部开源方面，腾讯内部整体代码开源率由 2019 年年初的 20% 增长至年底的 70%；</li><li>在外部开源方面，截至 2019 年年底，腾讯在 Github 自主开源项目数为 92 个，贡献者超过 1000 个，获得 Star 数超过 27 万，在 Github 全球公司贡献榜上的排名前十。</li></ul><p>2019 年全年，腾讯开源超过 22 个项目，包括 TubeMQ 亿万级分布式消息中间件、TencentOS tiny 自研轻量级物联网操作系统、TKE 腾讯云容器服务和 TBase 企业级分布式 HTAP 数据库管理系统。</p><p>除此以外，腾讯于开源社区也建立了良好的合作关系。Angel 项目完成了从单一的模型训练平台到全栈机器学习平台的技术演进，成功从 LF AI 基金会毕业；TARS 项目成为开源社区仅有支持五种开发语言并有完善服务治理和运营平台的微服务开发框架。此外，腾讯还作为创始会员，加入了 LF Edge 基金会，和业界合作伙伴一起推动边缘计算软硬件开源技术的发展。</p><p>自 2019 年 1 月 4 日，腾讯正式成立技术委员会以来，可以看到腾讯在自研上云和开源协同等方面都取得了不错的成绩，腾讯的研发文化与技术品牌也体现出了焕然一新的面貌。随着全面云计算时代的来临，一切与云相关的技术将成为未来的趋势与战略控制点，不管是互联网企业还是传统企业，都应该拥抱云、拥抱变化，保持自我革新，迎接无限的挑战。</p>', 0, '2020 年 3 月 9 日，腾讯公司正式对外发布了《腾讯研发大数据报告》，该报告首次披露了腾讯集团在 2019 年在产品及研发方面的关键数据。报告显示，研发人员在集团员工的占比已超过 66%，201', NULL, '腾讯首次公布研发大数据：研发人员占比 66%，C++ 是最常用语言', 12, 9, 2, '2021-02-05 18:32:03', 0, '2021-02-26 00:32:07', 'admin', 'admin', 0, 'post', 0, 0, 0, 0);
INSERT INTO `post` VALUES (35, NULL, '<p>Druid 是一个用于大数据实时查询和分析的高容错、高性能开源分布式系统，旨在快速处理大规模的数据，并能够实现快速查询和分析。尤其是当发生代码部署、机器故障以及其他产品系统遇到宕机等情况时，Druid 仍能够保持 100% 正常运行。</p><p>Apache Druid 社区在今年初发布了&nbsp;Druid 0.17.0&nbsp;。这是该项目自 Apache Incubator 毕业以来的第一个版本，因此也是一个重要的里程碑。</p><p>Twitter 在一年多之前就开始采用 Druid，并应用到多个场景中。对于 Twitter 的实践经验，我们采访了 Twitter 大数据引擎负责人罗震霄。他将在 QCon 全球软件开发大会（北京站）2020 分享主题为《&nbsp;Twitter ZB 级实时数据分析实践》的演讲。</p><p>罗震霄，Twitter Sr. Staff Engineer，负责 Twitter 大数据引擎的开发与运营，主要负责项目 Druid、Presto、Spark、Hive。在加入 Twitter 之前，在 Uber、Netflix、Facebook 从事大数据相关的研发与管理工作。是 Presto Foundation committer 和技术委员会委员。他于复旦大学获得学士学位，并于 University of Wisconsin Madison 获得硕士学位。</p><p>InfoQ：您好，请问 Druid 自开源以来，有哪些重要的演化？</p><p>罗震霄：Twitter 用 Druid 已经有一年多了，从 0.15 到 0.17，这几个版本都比较稳定，主要的变化有：</p><ul><li>设计并实现了 Native Ingestion，彻底摆脱了对 MapReduce 的依赖，可以直接 Ingest Parquet，ORC 文件。</li><li>Data Ingestion 设计了 Indexer Process。</li><li>SQL 功能持续加强。</li><li>方便易用的用户界面。</li><li>更全面的 Security and Privacy Support，例如 LDAP Authentication and Authorization。</li></ul><p>InfoQ：一般的企业，哪些场景需要使用 Druid？Twitter 为什么选择了 Druid？Twitter 里有哪些 Druid 的应用举例？</p><p>罗震霄：Druid 的主要特点是性能快，规模大，易用性好。</p><ul><li>性能可以达到 1 秒以下，真正实现了大数据的实时性计算；</li><li>Druid 单群可以扩展至 2000 台节点以上，很好的满足了企业对大数据规模的要求；</li><li>Druid 的用户界面非常友好，用户常常可以通过拖拖拽拽进行查询，方便非技术类人员的应用。</li></ul><p>Twitter 业务有很多实时的大数据需求，我们当时对比了市场上现有的开源方案，在稳定性、扩展性、性能和易用性方面 Druid 都有一定优势，最后选择 Druid。目前来看公司上下对 Druid 还比较满意。</p><p>Twitter 所有的 user events 都通过内部 Message Queue 导入 Druid，用户可以实时对 Druid 进行查询，也可以在 Druid 基础上设置各类的监控和提醒。实时监控很好的利用了 Druid 性能快和方便查询的特性。</p><p>Twitter 内部用 Druid 很多，有三大类：其一，将用户行为数据导入 Druid，进行实时用户行为分析；其二，通过 Druid 为广告商提供实时的广告效果分析；其三，利用 Druid 的实时特性，做实时监控和实时报表。</p><p><br></p><p>InfoQ：比如现在某个企业已经有了成熟的 Lamda 架构的离线实时系统。而 Druid 也是 Lamda 架构的，那哪些部分是可以相互 Share 的吗？</p><p>罗震霄：Druid 需要自己的存储，可以将 Message Queue 同时导入离线系统和实时系统（Druid）。</p><p>如果对一些数据经过滤后有实时的计算需求，也可以通过 Hadoop Distributed File System 将数据导入 Druid。</p><p>一般来说，企业的 Message Queue 可以共享，Hadoop Distributed File System 也可以作为 Druid 的数据源进行共享。</p><p>Twitter 现在正在开发 Presto Druid Connector，通过 Presto 实时查询 Druid 数据，这样企业内部的查询语言，查询系统也可以共享。</p><p>因为 Twitter 数据分析大多数是通过 SQL 进行的。公司上下对 SQL on Druid 的需求很高。</p><p>现有的 DruidSQL 功能不太完善，SubQuery、Join 都不支持。如果将 Druid 数据再导入其他存储系统，不仅费时费力，而且很难保证数据的一致性。基于这些考虑，我们决定开发 Presto Druid Connector，用 Presto 对 Druid 数据提供完整的 SQL 分析，避免了数据重复，节省了存储空间，而且还可以利用 Presto&nbsp;Connector 的优势，跨平台进行 Join 操作，比如，Join Hadoop Data with Druid Data。</p><p>现在有一些用户在使用 Presto Druid Connector，大家还是比较满意的。下一步，我们会进一步提升性能，pushdown 各类子运算到 Druid。最终的愿景是争取将所有的 SQL 操作统一到 Presto 上来。</p><p><br></p><p>InfoQ：如果一个系统每天需要处理 PB 级别的系统，再增加一个 Druid 这样的存储系统，是不是很大程度上增加了存储空间的压力？原系统和 Druid，最好的融合方式是什么样的？</p><p>罗震霄：为了性能的提升，Druid 需要自己的存储。对 Twitter 而言，查询速度，和系统的易用性，较之存储空间，更为重要。</p><p>Druid 需要做自己的存储的原因是：</p><p>Druid 一个重要的设计目标是实时查询，也就是查询延迟一定要在 1 秒以下。</p><p>现有硬件的基本性能决定，从内存中顺序读取 4GB 数据的延时在 1 秒左右，实际应用场景中，我们处理的数据远远大于 4GB，所以，没有索引，仅仅靠扫描文件，是不可能达到实时查询要求的。</p><p>基于这些考虑，Druid 设计并实现了自己的存储格式，主要是列式存储，并应用字典、RLE 等方式进行优化。Druid 还设计了 bitmap 索引。在实际应用中，bitmap 索引会以 mmap 方式放在内存中。绝大多数查询可以通过 bitmap 索引直接找到结果，少数查询会通过列式存储进行有选择性的文件查询。</p><p>我们也在开发一些项目，尽量减少不必要的数据重复。比如 Presto Druid Connector，通过 Presto 实时查询 Druid 数据，这样当用户需要对 Druid 数据进行 SQL 分析时，用 Presto 就可以了，不必要拷贝数据。</p><p><br></p><p>InfoQ：Druid 和 Kylin 这样的开源软件主要差别在哪里？</p><p>罗震霄：对 Kylin 实在不太熟悉，不好妄加评论。</p><p>我们当时主要考虑的是 Druid 和 Pinot，这两个现在应用比较广泛。相对而言，Druid 更稳定一些，社区也更大一些。</p><p><br></p><p>InfoQ：目前还有哪些 OLAP 平台可供选择？Druid 相对有何优势？</p><p>罗震霄：现有的 OLAP 平台比较多，开源方面，有 Hive、 Impala、Spark、Presto、Drill、Druid、Pinot 等等。</p><p>Twitter 现在的技术布局：对实时计算，统一于 Druid，对秒级到几十分钟级的数据分析，统一于 Presto，对小时级别的 ETL，统一于 Spark。</p><p>Druid 主要的优势在性能，稳定性，扩展性，和易用性。能够达到 1 秒以下的实时引擎，只有 Druid 和 Pinot，如果考虑到扩展性和稳定性，Druid 的优势比较明显。</p><p><br></p><p>InfoQ：在 Twitter 里，您们定制了关于 Druid 的哪些开发功能？（与开源版本不同的功能）</p><p>罗震霄：主要是四个方面：</p><ul><li>对 Thrift 文件格式的支持，Twitter 内部有大量的 Thrift 文件。</li><li>Presto Druid Connector，通过 Presto 对 Druid 数据进行 SQL 分析。</li><li>Multi-tenancy Druid，Druid 支持不同的用户类型，包括数据安全，隐私保护，和数据隔离。</li><li>Native Ingestion，摆脱对 MapReduce 的依赖，直接导入 Parquet 文件。</li></ul><p>InfoQ：未来，Twitter 还计划对 Druid 开发或加强哪些功能？</p><p>罗震霄：主要有以下计划：</p><ul><li>Unified Indexing Service，为用户提供方便的一键式导入。</li><li>Secure Druid，完整的 Druid 信息安全，包括 LDAP Authentication and Authorization。</li><li>Pushdown for Presto Druid Connector，用 Presto 为 Druid 提供完整的 SQL 分析，并充分发挥 Druid 的性能优势，包括 Predicate Pushdown， Aggregation Pushdown，Limit Pushdown。</li></ul>', 0, 'Druid 是一个用于大数据实时查询和分析的高容错、高性能开源分布式系统，旨在快速处理大规模的数据，并能够实现快速查询和分析。尤其是当发生代码部署、机器故障以及其他产品系统遇到宕机等情况时，Druid', NULL, 'Twitter 如何应用 Druid 分析 ZB 级实时数据？', 16, 9, 0, '2021-02-05 18:32:03', 1, '2021-02-26 00:32:07', 'admin', 'admin', 0, 'post', 0, 1, 0, 0);
INSERT INTO `post` VALUES (36, NULL, '<p>根据外媒报道，莱斯大学的计算机科学家们已经克服了人工智能产业迅速发展的一个主要障碍，他们证明了在不依赖于图形处理单元（GPU）等专业级加速硬件的情况下，也能够实现对深度学习技术的加速。这个名为 SLIDE 的算法是第一个在 CPU 上比 GPU 更快地训练深度神经网络的算法。</p><p>在奥斯汀召开的 2020 机器学习系统会议&nbsp;MLSys&nbsp;上，来自莱斯大学的计算机科学家们，在来自英特尔公司的合作伙伴的支持下，于 3 月 2 日在奥斯汀会议中心展示了他们的最新研究成果。</p><p>当下，为了实现深度学习，许多公司正大力投资于图形处理单元（GPU）和其他专业级硬件。深度学习是一种强大的人工智能，如今亚马逊 Alexa 和苹果 Siri 等智能助理、面部识别、产品推荐系统和其他技术都有深度学习在背后作为支撑。深度学习炙手可热的程度可以举一例说明，作为一手打造该行业金字招牌&ldquo;特斯拉 V100 Tensor Core GPU&rdquo;芯片的制造商，Nvidia 公司最近的财务报告显示，其 2019 第四季度收入同比增长了 41%。</p><p>而莱斯大学的研究人员创造了一种可替代 GPU 的节省成本的算法，称为&ldquo;次线性深度学习引擎&rdquo;（sub-linear deep learning engine，简称 SLIDE），这种算法只需使用一般通用的中央处理器（CPU），而无需专业级的加速硬件。</p><p>&ldquo;我们的测试表明，SLIDE 是第一个基于 CPU 实现的深度学习智能算法，它的性能可以超越那些依照产业规模的建议采用大型全连接架构使用 GPU 硬件加速来实现数据集的方法&rdquo;，&nbsp;Anshumali Shrivastava&nbsp;这样说。这位莱斯大学布朗工程学院的助理教授与研究生&nbsp;Beidi Chen&nbsp;和&nbsp;Tharun Medini&nbsp;一起开发了该 SLIDE 算法。</p><p>SLIDE 不需要依赖于 GPU，因为这种算法从根本上采用了一种完全不同的深度学习方法。深度神经网络训练技术标准的&ldquo;反向传播&rdquo;算法需要矩阵乘法，如此繁重的计算量正是适合 GPU 发挥性能的理想场所。然而，通过 SLIDE 算法，Shrivastava、Chen 和 Medini 把神经网络训练转变成为一个可以用哈希表来解决的搜索问题。</p><p>与反向传播训练技术相比，这种 SLIDE 算法可以从根本上减少大量的计算开销。Shrivastava 举例说，如今诸如亚马逊、谷歌以及其他公司使用 GPU 打造的基于云的深度学习服务的顶级平台，一般会使用 8 块&ldquo;特斯拉 V100&rdquo;芯片，其费用约为 10 万美元。</p><p>莱斯大学计算机科学研究生 Beidi Chen 和 Tharun Medini 参与开发了 SLIDE，这是一种无需依赖图形处理单元对深度神经网络进行训练的算法。（图片来源：Jeff Fitlow/ 莱斯大学）</p><p>&ldquo;我们有一个在实验室运行的测试用例，它完全能承载一块 V100 芯片的工作负荷，也即是一个适用于 GPU 内存的，运行在大型全连接网络中有超过 1 亿个参数的计算量&rdquo;，Shrivastava 说，&ldquo;我们用最先进的谷歌的 TensorFlow 软件包来训练该算法，它只花了 3 个半小时就完成了训练。&rdquo;</p><p>&ldquo;我们随后证明，我们的新算法甚至可以在一小时内完成该训练，而且并不是运行在 GPU 上，而是运行在 44 核的 xeon-class CPU 上，&rdquo; Shrivastava 说。</p><p>深度学习网络的灵感来自生物学，其核心特征是人工神经元，这些神经元是一小段可以学习并执行特定的任务计算机代码。一个深度学习网络可能包含数百万甚至数十亿这种人工神经元，只要通过对海量数据的学习，这些神经元共同工作就有可能学习并做出与人类水平相当的专家决策。例如，如果一个深度神经网络被训练来识别照片中的物体，当识别一张猫的照片或是识别一辆校车时，它将使用不同的神经元来进行学习。</p><p>&ldquo;你不需要对每个用例的所有神经元都进行训练，&rdquo; Medini 解释说，&ldquo;我们是这样想的，&lsquo;如果我们只去挑选出相关的神经元，那这就变成了一个搜索问题。&rsquo; 因此，从算法上讲，我们的想法就是使用局部敏感哈希算法来避免矩阵乘法的复杂性。&rdquo;</p><p>哈希算法是 20 世纪 90 年代为互联网搜索发明的一种数据索引方法。它使用数字方法将大量信息，例如整个网站所有网页或一本书的所有章节，编码为一串称为哈希散列的数字。哈希表就是记录这些哈希散列值并可以实现快速搜索的列表。</p><p>&ldquo;在 TensorFlow 或 PyTorch 上实现我们的算法是毫无意义的，因为这些软件执行的第一件事就是不管三七二十一先把你正在做的事情转换成一个矩阵乘法问题，&rdquo; Chen 说。&ldquo;而这正是我们的算法想要避免的。所以我们是从零开始写我们自己的 C++ 代码的。&rdquo;</p><p>Shrivastava 说，SLIDE 相对于反向传播的最大优势在于它采用了数据并行的方式。</p><p>&ldquo;我的意思是，通过数据并行，如果我想要训练两个数据实例，比方说一个是一只猫的形象，另一个是公共汽车，他们可能会激活不同的神经元，该 SLIDE 算法可以对这两个实例分别独立地进行更新或训练，&rdquo; 他说，&ldquo;这就大大地提高了 CPU 并行性的利用率。&rdquo;</p><p>&ldquo;另一方面，与 GPU 相比，我们需要更大的存储空间，&rdquo; 他说，&ldquo;在主存储器中有一个缓存层次结构，如果你使用时不够小心，可能会遇到一个叫做内存颠簸（cache thrashing）的问题，那样就会发生大量缺页中断。&rdquo;</p><p>Shrivastava 说，他的团队第一次使用 SLIDE 进行实验时，就发生了严重的内存颠簸，但他们的训练时间仍然与 GPU 的训练时间相当，甚至更快。于是，他、Chen 和 Medini 于 2019 年 3 月在 arXiv 上发布了初步实验结果，并将他们的代码上传到 GitHub。几周后，英特尔公司主动联系了他们。</p><p>&ldquo;来自英特尔的合作伙伴注意到了我们实验中的缓存问题，&rdquo; 他说，&ldquo;他们告诉我们，他们可以与我们进行合作，让这个算法更快地完成训练，之后的事实证明他们是正确的。在他们的帮助下，我们的实验性能又提高了约 50%。&rdquo;</p><p>Shrivastava 说，SLIDE 还远远未达到其最大潜力。</p><p>&ldquo;我们只能算是初尝甜头而已，&rdquo; 他说，&ldquo;我们还可以做很多事情来对这个算法进行优化。例如，我们还没有使用矢量化，也没有在 CPU 中使用内置的加速器，比如 Intel Deep Learning Boost 技术。我们还有很多其他的技巧可以让这个算法变得更快。&rdquo;</p><p>Shrivastava 说，SLIDE 的重要性在于，它证明了还有其他方式来实现深度学习。</p><p>&ldquo;我们想要传达的整个信息是，&lsquo;我们不要被矩阵乘法和 GPU 内存这两个瓶颈所限制住，&rsquo; &rdquo; Chen 说，&ldquo;我们的算法可能是第一个击败 GPU 的算法，但我希望它不是最后一个。这个领域需要新的想法，而这正是这次 MLSys 机器学习系统会议的重要意义所在。&rdquo;</p><p>该算法的其他共同作者包括 James Farwell、Sameh Gobriel 和 Charlie Tai，他们都是来自英特尔实验室的成员。</p><p>该研究还得到了美国国家科学基金会（NSF-1652131, NSF-BIGDATA 1838177）、空军科研办公室（FA9550-18-1-0152）、亚马逊和海军研究办公室的支持。</p>', 0, '根据外媒报道，莱斯大学的计算机科学家们已经克服了人工智能产业迅速发展的一个主要障碍，他们证明了在不依赖于图形处理单元（GPU）等专业级加速硬件的情况下，也能够实现对深度学习技术的加速。这个名为 SLI', NULL, 'CPU 上运算比 GPU 还快？美国莱斯大学最新研究克服硬件障碍', 46, 9, 1, '2021-02-05 18:32:03', 2, '2021-02-26 00:32:06', 'admin', 'admin', 0, 'post', 0, 0, 0, 0);
INSERT INTO `post` VALUES (37, NULL, '<p>根据外媒报道，莱斯大学的计算机科学家们已经克服了人工智能产业迅速发展的一个主要障碍，他们证明了在不依赖于图形处理单元（GPU）等专业级加速硬件的情况下，也能够实现对深度学习技术的加速。这个名为 SLIDE 的算法是第一个在 CPU 上比 GPU 更快地训练深度神经网络的算法。</p><p>在奥斯汀召开的 2020 机器学习系统会议&nbsp;MLSys&nbsp;上，来自莱斯大学的计算机科学家们，在来自英特尔公司的合作伙伴的支持下，于 3 月 2 日在奥斯汀会议中心展示了他们的最新研究成果。</p><p>当下，为了实现深度学习，许多公司正大力投资于图形处理单元（GPU）和其他专业级硬件。深度学习是一种强大的人工智能，如今亚马逊 Alexa 和苹果 Siri 等智能助理、面部识别、产品推荐系统和其他技术都有深度学习在背后作为支撑。深度学习炙手可热的程度可以举一例说明，作为一手打造该行业金字招牌&ldquo;特斯拉 V100 Tensor Core GPU&rdquo;芯片的制造商，Nvidia 公司最近的财务报告显示，其 2019 第四季度收入同比增长了 41%。</p><p>而莱斯大学的研究人员创造了一种可替代 GPU 的节省成本的算法，称为&ldquo;次线性深度学习引擎&rdquo;（sub-linear deep learning engine，简称 SLIDE），这种算法只需使用一般通用的中央处理器（CPU），而无需专业级的加速硬件。</p><p>&ldquo;我们的测试表明，SLIDE 是第一个基于 CPU 实现的深度学习智能算法，它的性能可以超越那些依照产业规模的建议采用大型全连接架构使用 GPU 硬件加速来实现数据集的方法&rdquo;，&nbsp;Anshumali Shrivastava&nbsp;这样说。这位莱斯大学布朗工程学院的助理教授与研究生&nbsp;Beidi Chen&nbsp;和&nbsp;Tharun Medini&nbsp;一起开发了该 SLIDE 算法。</p><p>SLIDE 不需要依赖于 GPU，因为这种算法从根本上采用了一种完全不同的深度学习方法。深度神经网络训练技术标准的&ldquo;反向传播&rdquo;算法需要矩阵乘法，如此繁重的计算量正是适合 GPU 发挥性能的理想场所。然而，通过 SLIDE 算法，Shrivastava、Chen 和 Medini 把神经网络训练转变成为一个可以用哈希表来解决的搜索问题。</p><p>与反向传播训练技术相比，这种 SLIDE 算法可以从根本上减少大量的计算开销。Shrivastava 举例说，如今诸如亚马逊、谷歌以及其他公司使用 GPU 打造的基于云的深度学习服务的顶级平台，一般会使用 8 块&ldquo;特斯拉 V100&rdquo;芯片，其费用约为 10 万美元。</p><p>莱斯大学计算机科学研究生 Beidi Chen 和 Tharun Medini 参与开发了 SLIDE，这是一种无需依赖图形处理单元对深度神经网络进行训练的算法。（图片来源：Jeff Fitlow/ 莱斯大学）</p><p>&ldquo;我们有一个在实验室运行的测试用例，它完全能承载一块 V100 芯片的工作负荷，也即是一个适用于 GPU 内存的，运行在大型全连接网络中有超过 1 亿个参数的计算量&rdquo;，Shrivastava 说，&ldquo;我们用最先进的谷歌的 TensorFlow 软件包来训练该算法，它只花了 3 个半小时就完成了训练。&rdquo;</p><p>&ldquo;我们随后证明，我们的新算法甚至可以在一小时内完成该训练，而且并不是运行在 GPU 上，而是运行在 44 核的 xeon-class CPU 上，&rdquo; Shrivastava 说。</p><p>深度学习网络的灵感来自生物学，其核心特征是人工神经元，这些神经元是一小段可以学习并执行特定的任务计算机代码。一个深度学习网络可能包含数百万甚至数十亿这种人工神经元，只要通过对海量数据的学习，这些神经元共同工作就有可能学习并做出与人类水平相当的专家决策。例如，如果一个深度神经网络被训练来识别照片中的物体，当识别一张猫的照片或是识别一辆校车时，它将使用不同的神经元来进行学习。</p><p>&ldquo;你不需要对每个用例的所有神经元都进行训练，&rdquo; Medini 解释说，&ldquo;我们是这样想的，&lsquo;如果我们只去挑选出相关的神经元，那这就变成了一个搜索问题。&rsquo; 因此，从算法上讲，我们的想法就是使用局部敏感哈希算法来避免矩阵乘法的复杂性。&rdquo;</p><p>哈希算法是 20 世纪 90 年代为互联网搜索发明的一种数据索引方法。它使用数字方法将大量信息，例如整个网站所有网页或一本书的所有章节，编码为一串称为哈希散列的数字。哈希表就是记录这些哈希散列值并可以实现快速搜索的列表。</p><p>&ldquo;在 TensorFlow 或 PyTorch 上实现我们的算法是毫无意义的，因为这些软件执行的第一件事就是不管三七二十一先把你正在做的事情转换成一个矩阵乘法问题，&rdquo; Chen 说。&ldquo;而这正是我们的算法想要避免的。所以我们是从零开始写我们自己的 C++ 代码的。&rdquo;</p><p>Shrivastava 说，SLIDE 相对于反向传播的最大优势在于它采用了数据并行的方式。</p><p>&ldquo;我的意思是，通过数据并行，如果我想要训练两个数据实例，比方说一个是一只猫的形象，另一个是公共汽车，他们可能会激活不同的神经元，该 SLIDE 算法可以对这两个实例分别独立地进行更新或训练，&rdquo; 他说，&ldquo;这就大大地提高了 CPU 并行性的利用率。&rdquo;</p><p>&ldquo;另一方面，与 GPU 相比，我们需要更大的存储空间，&rdquo; 他说，&ldquo;在主存储器中有一个缓存层次结构，如果你使用时不够小心，可能会遇到一个叫做内存颠簸（cache thrashing）的问题，那样就会发生大量缺页中断。&rdquo;</p><p>Shrivastava 说，他的团队第一次使用 SLIDE 进行实验时，就发生了严重的内存颠簸，但他们的训练时间仍然与 GPU 的训练时间相当，甚至更快。于是，他、Chen 和 Medini 于 2019 年 3 月在 arXiv 上发布了初步实验结果，并将他们的代码上传到 GitHub。几周后，英特尔公司主动联系了他们。</p><p>&ldquo;来自英特尔的合作伙伴注意到了我们实验中的缓存问题，&rdquo; 他说，&ldquo;他们告诉我们，他们可以与我们进行合作，让这个算法更快地完成训练，之后的事实证明他们是正确的。在他们的帮助下，我们的实验性能又提高了约 50%。&rdquo;</p><p>Shrivastava 说，SLIDE 还远远未达到其最大潜力。</p><p>&ldquo;我们只能算是初尝甜头而已，&rdquo; 他说，&ldquo;我们还可以做很多事情来对这个算法进行优化。例如，我们还没有使用矢量化，也没有在 CPU 中使用内置的加速器，比如 Intel Deep Learning Boost 技术。我们还有很多其他的技巧可以让这个算法变得更快。&rdquo;</p><p>Shrivastava 说，SLIDE 的重要性在于，它证明了还有其他方式来实现深度学习。</p><p>&ldquo;我们想要传达的整个信息是，&lsquo;我们不要被矩阵乘法和 GPU 内存这两个瓶颈所限制住，&rsquo; &rdquo; Chen 说，&ldquo;我们的算法可能是第一个击败 GPU 的算法，但我希望它不是最后一个。这个领域需要新的想法，而这正是这次 MLSys 机器学习系统会议的重要意义所在。&rdquo;</p><p>该算法的其他共同作者包括 James Farwell、Sameh Gobriel 和 Charlie Tai，他们都是来自英特尔实验室的成员。</p><p>该研究还得到了美国国家科学基金会（NSF-1652131, NSF-BIGDATA 1838177）、空军科研办公室（FA9550-18-1-0152）、亚马逊和海军研究办公室的支持。</p>', 0, '根据外媒报道，莱斯大学的计算机科学家们已经克服了人工智能产业迅速发展的一个主要障碍，他们证明了在不依赖于图形处理单元（GPU）等专业级加速硬件的情况下，也能够实现对深度学习技术的加速。这个名为 SLI', NULL, 'CPU 上运算比 GPU 还快？美国莱斯大学最新研究克服硬件障碍', 46, 9, 1, '2021-02-05 18:32:03', 2, '2021-02-26 00:32:06', 'admin', 'admin', 0, 'post', 0, 0, 0, 0);
INSERT INTO `post` VALUES (38, NULL, '<p>根据外媒报道，莱斯大学的计算机科学家们已经克服了人工智能产业迅速发展的一个主要障碍，他们证明了在不依赖于图形处理单元（GPU）等专业级加速硬件的情况下，也能够实现对深度学习技术的加速。这个名为 SLIDE 的算法是第一个在 CPU 上比 GPU 更快地训练深度神经网络的算法。</p><p>在奥斯汀召开的 2020 机器学习系统会议&nbsp;MLSys&nbsp;上，来自莱斯大学的计算机科学家们，在来自英特尔公司的合作伙伴的支持下，于 3 月 2 日在奥斯汀会议中心展示了他们的最新研究成果。</p><p>当下，为了实现深度学习，许多公司正大力投资于图形处理单元（GPU）和其他专业级硬件。深度学习是一种强大的人工智能，如今亚马逊 Alexa 和苹果 Siri 等智能助理、面部识别、产品推荐系统和其他技术都有深度学习在背后作为支撑。深度学习炙手可热的程度可以举一例说明，作为一手打造该行业金字招牌&ldquo;特斯拉 V100 Tensor Core GPU&rdquo;芯片的制造商，Nvidia 公司最近的财务报告显示，其 2019 第四季度收入同比增长了 41%。</p><p>而莱斯大学的研究人员创造了一种可替代 GPU 的节省成本的算法，称为&ldquo;次线性深度学习引擎&rdquo;（sub-linear deep learning engine，简称 SLIDE），这种算法只需使用一般通用的中央处理器（CPU），而无需专业级的加速硬件。</p><p>&ldquo;我们的测试表明，SLIDE 是第一个基于 CPU 实现的深度学习智能算法，它的性能可以超越那些依照产业规模的建议采用大型全连接架构使用 GPU 硬件加速来实现数据集的方法&rdquo;，&nbsp;Anshumali Shrivastava&nbsp;这样说。这位莱斯大学布朗工程学院的助理教授与研究生&nbsp;Beidi Chen&nbsp;和&nbsp;Tharun Medini&nbsp;一起开发了该 SLIDE 算法。</p><p>SLIDE 不需要依赖于 GPU，因为这种算法从根本上采用了一种完全不同的深度学习方法。深度神经网络训练技术标准的&ldquo;反向传播&rdquo;算法需要矩阵乘法，如此繁重的计算量正是适合 GPU 发挥性能的理想场所。然而，通过 SLIDE 算法，Shrivastava、Chen 和 Medini 把神经网络训练转变成为一个可以用哈希表来解决的搜索问题。</p><p>与反向传播训练技术相比，这种 SLIDE 算法可以从根本上减少大量的计算开销。Shrivastava 举例说，如今诸如亚马逊、谷歌以及其他公司使用 GPU 打造的基于云的深度学习服务的顶级平台，一般会使用 8 块&ldquo;特斯拉 V100&rdquo;芯片，其费用约为 10 万美元。</p><p>莱斯大学计算机科学研究生 Beidi Chen 和 Tharun Medini 参与开发了 SLIDE，这是一种无需依赖图形处理单元对深度神经网络进行训练的算法。（图片来源：Jeff Fitlow/ 莱斯大学）</p><p>&ldquo;我们有一个在实验室运行的测试用例，它完全能承载一块 V100 芯片的工作负荷，也即是一个适用于 GPU 内存的，运行在大型全连接网络中有超过 1 亿个参数的计算量&rdquo;，Shrivastava 说，&ldquo;我们用最先进的谷歌的 TensorFlow 软件包来训练该算法，它只花了 3 个半小时就完成了训练。&rdquo;</p><p>&ldquo;我们随后证明，我们的新算法甚至可以在一小时内完成该训练，而且并不是运行在 GPU 上，而是运行在 44 核的 xeon-class CPU 上，&rdquo; Shrivastava 说。</p><p>深度学习网络的灵感来自生物学，其核心特征是人工神经元，这些神经元是一小段可以学习并执行特定的任务计算机代码。一个深度学习网络可能包含数百万甚至数十亿这种人工神经元，只要通过对海量数据的学习，这些神经元共同工作就有可能学习并做出与人类水平相当的专家决策。例如，如果一个深度神经网络被训练来识别照片中的物体，当识别一张猫的照片或是识别一辆校车时，它将使用不同的神经元来进行学习。</p><p>&ldquo;你不需要对每个用例的所有神经元都进行训练，&rdquo; Medini 解释说，&ldquo;我们是这样想的，&lsquo;如果我们只去挑选出相关的神经元，那这就变成了一个搜索问题。&rsquo; 因此，从算法上讲，我们的想法就是使用局部敏感哈希算法来避免矩阵乘法的复杂性。&rdquo;</p><p>哈希算法是 20 世纪 90 年代为互联网搜索发明的一种数据索引方法。它使用数字方法将大量信息，例如整个网站所有网页或一本书的所有章节，编码为一串称为哈希散列的数字。哈希表就是记录这些哈希散列值并可以实现快速搜索的列表。</p><p>&ldquo;在 TensorFlow 或 PyTorch 上实现我们的算法是毫无意义的，因为这些软件执行的第一件事就是不管三七二十一先把你正在做的事情转换成一个矩阵乘法问题，&rdquo; Chen 说。&ldquo;而这正是我们的算法想要避免的。所以我们是从零开始写我们自己的 C++ 代码的。&rdquo;</p><p>Shrivastava 说，SLIDE 相对于反向传播的最大优势在于它采用了数据并行的方式。</p><p>&ldquo;我的意思是，通过数据并行，如果我想要训练两个数据实例，比方说一个是一只猫的形象，另一个是公共汽车，他们可能会激活不同的神经元，该 SLIDE 算法可以对这两个实例分别独立地进行更新或训练，&rdquo; 他说，&ldquo;这就大大地提高了 CPU 并行性的利用率。&rdquo;</p><p>&ldquo;另一方面，与 GPU 相比，我们需要更大的存储空间，&rdquo; 他说，&ldquo;在主存储器中有一个缓存层次结构，如果你使用时不够小心，可能会遇到一个叫做内存颠簸（cache thrashing）的问题，那样就会发生大量缺页中断。&rdquo;</p><p>Shrivastava 说，他的团队第一次使用 SLIDE 进行实验时，就发生了严重的内存颠簸，但他们的训练时间仍然与 GPU 的训练时间相当，甚至更快。于是，他、Chen 和 Medini 于 2019 年 3 月在 arXiv 上发布了初步实验结果，并将他们的代码上传到 GitHub。几周后，英特尔公司主动联系了他们。</p><p>&ldquo;来自英特尔的合作伙伴注意到了我们实验中的缓存问题，&rdquo; 他说，&ldquo;他们告诉我们，他们可以与我们进行合作，让这个算法更快地完成训练，之后的事实证明他们是正确的。在他们的帮助下，我们的实验性能又提高了约 50%。&rdquo;</p><p>Shrivastava 说，SLIDE 还远远未达到其最大潜力。</p><p>&ldquo;我们只能算是初尝甜头而已，&rdquo; 他说，&ldquo;我们还可以做很多事情来对这个算法进行优化。例如，我们还没有使用矢量化，也没有在 CPU 中使用内置的加速器，比如 Intel Deep Learning Boost 技术。我们还有很多其他的技巧可以让这个算法变得更快。&rdquo;</p><p>Shrivastava 说，SLIDE 的重要性在于，它证明了还有其他方式来实现深度学习。</p><p>&ldquo;我们想要传达的整个信息是，&lsquo;我们不要被矩阵乘法和 GPU 内存这两个瓶颈所限制住，&rsquo; &rdquo; Chen 说，&ldquo;我们的算法可能是第一个击败 GPU 的算法，但我希望它不是最后一个。这个领域需要新的想法，而这正是这次 MLSys 机器学习系统会议的重要意义所在。&rdquo;</p><p>该算法的其他共同作者包括 James Farwell、Sameh Gobriel 和 Charlie Tai，他们都是来自英特尔实验室的成员。</p><p>该研究还得到了美国国家科学基金会（NSF-1652131, NSF-BIGDATA 1838177）、空军科研办公室（FA9550-18-1-0152）、亚马逊和海军研究办公室的支持。</p>', 0, '根据外媒报道，莱斯大学的计算机科学家们已经克服了人工智能产业迅速发展的一个主要障碍，他们证明了在不依赖于图形处理单元（GPU）等专业级加速硬件的情况下，也能够实现对深度学习技术的加速。这个名为 SLI', NULL, 'CPU 上运算比 GPU 还快？美国莱斯大学最新研究克服硬件障碍', 46, 9, 1, '2021-02-05 18:32:03', 2, '2021-02-26 00:32:05', 'admin', 'admin', 0, 'post', 0, 0, 0, 0);
INSERT INTO `post` VALUES (39, NULL, '<p>根据外媒报道，莱斯大学的计算机科学家们已经克服了人工智能产业迅速发展的一个主要障碍，他们证明了在不依赖于图形处理单元（GPU）等专业级加速硬件的情况下，也能够实现对深度学习技术的加速。这个名为 SLIDE 的算法是第一个在 CPU 上比 GPU 更快地训练深度神经网络的算法。</p><p>在奥斯汀召开的 2020 机器学习系统会议&nbsp;MLSys&nbsp;上，来自莱斯大学的计算机科学家们，在来自英特尔公司的合作伙伴的支持下，于 3 月 2 日在奥斯汀会议中心展示了他们的最新研究成果。</p><p>当下，为了实现深度学习，许多公司正大力投资于图形处理单元（GPU）和其他专业级硬件。深度学习是一种强大的人工智能，如今亚马逊 Alexa 和苹果 Siri 等智能助理、面部识别、产品推荐系统和其他技术都有深度学习在背后作为支撑。深度学习炙手可热的程度可以举一例说明，作为一手打造该行业金字招牌&ldquo;特斯拉 V100 Tensor Core GPU&rdquo;芯片的制造商，Nvidia 公司最近的财务报告显示，其 2019 第四季度收入同比增长了 41%。</p><p>而莱斯大学的研究人员创造了一种可替代 GPU 的节省成本的算法，称为&ldquo;次线性深度学习引擎&rdquo;（sub-linear deep learning engine，简称 SLIDE），这种算法只需使用一般通用的中央处理器（CPU），而无需专业级的加速硬件。</p><p>&ldquo;我们的测试表明，SLIDE 是第一个基于 CPU 实现的深度学习智能算法，它的性能可以超越那些依照产业规模的建议采用大型全连接架构使用 GPU 硬件加速来实现数据集的方法&rdquo;，&nbsp;Anshumali Shrivastava&nbsp;这样说。这位莱斯大学布朗工程学院的助理教授与研究生&nbsp;Beidi Chen&nbsp;和&nbsp;Tharun Medini&nbsp;一起开发了该 SLIDE 算法。</p><p>SLIDE 不需要依赖于 GPU，因为这种算法从根本上采用了一种完全不同的深度学习方法。深度神经网络训练技术标准的&ldquo;反向传播&rdquo;算法需要矩阵乘法，如此繁重的计算量正是适合 GPU 发挥性能的理想场所。然而，通过 SLIDE 算法，Shrivastava、Chen 和 Medini 把神经网络训练转变成为一个可以用哈希表来解决的搜索问题。</p><p>与反向传播训练技术相比，这种 SLIDE 算法可以从根本上减少大量的计算开销。Shrivastava 举例说，如今诸如亚马逊、谷歌以及其他公司使用 GPU 打造的基于云的深度学习服务的顶级平台，一般会使用 8 块&ldquo;特斯拉 V100&rdquo;芯片，其费用约为 10 万美元。</p><p>莱斯大学计算机科学研究生 Beidi Chen 和 Tharun Medini 参与开发了 SLIDE，这是一种无需依赖图形处理单元对深度神经网络进行训练的算法。（图片来源：Jeff Fitlow/ 莱斯大学）</p><p>&ldquo;我们有一个在实验室运行的测试用例，它完全能承载一块 V100 芯片的工作负荷，也即是一个适用于 GPU 内存的，运行在大型全连接网络中有超过 1 亿个参数的计算量&rdquo;，Shrivastava 说，&ldquo;我们用最先进的谷歌的 TensorFlow 软件包来训练该算法，它只花了 3 个半小时就完成了训练。&rdquo;</p><p>&ldquo;我们随后证明，我们的新算法甚至可以在一小时内完成该训练，而且并不是运行在 GPU 上，而是运行在 44 核的 xeon-class CPU 上，&rdquo; Shrivastava 说。</p><p>深度学习网络的灵感来自生物学，其核心特征是人工神经元，这些神经元是一小段可以学习并执行特定的任务计算机代码。一个深度学习网络可能包含数百万甚至数十亿这种人工神经元，只要通过对海量数据的学习，这些神经元共同工作就有可能学习并做出与人类水平相当的专家决策。例如，如果一个深度神经网络被训练来识别照片中的物体，当识别一张猫的照片或是识别一辆校车时，它将使用不同的神经元来进行学习。</p><p>&ldquo;你不需要对每个用例的所有神经元都进行训练，&rdquo; Medini 解释说，&ldquo;我们是这样想的，&lsquo;如果我们只去挑选出相关的神经元，那这就变成了一个搜索问题。&rsquo; 因此，从算法上讲，我们的想法就是使用局部敏感哈希算法来避免矩阵乘法的复杂性。&rdquo;</p><p>哈希算法是 20 世纪 90 年代为互联网搜索发明的一种数据索引方法。它使用数字方法将大量信息，例如整个网站所有网页或一本书的所有章节，编码为一串称为哈希散列的数字。哈希表就是记录这些哈希散列值并可以实现快速搜索的列表。</p><p>&ldquo;在 TensorFlow 或 PyTorch 上实现我们的算法是毫无意义的，因为这些软件执行的第一件事就是不管三七二十一先把你正在做的事情转换成一个矩阵乘法问题，&rdquo; Chen 说。&ldquo;而这正是我们的算法想要避免的。所以我们是从零开始写我们自己的 C++ 代码的。&rdquo;</p><p>Shrivastava 说，SLIDE 相对于反向传播的最大优势在于它采用了数据并行的方式。</p><p>&ldquo;我的意思是，通过数据并行，如果我想要训练两个数据实例，比方说一个是一只猫的形象，另一个是公共汽车，他们可能会激活不同的神经元，该 SLIDE 算法可以对这两个实例分别独立地进行更新或训练，&rdquo; 他说，&ldquo;这就大大地提高了 CPU 并行性的利用率。&rdquo;</p><p>&ldquo;另一方面，与 GPU 相比，我们需要更大的存储空间，&rdquo; 他说，&ldquo;在主存储器中有一个缓存层次结构，如果你使用时不够小心，可能会遇到一个叫做内存颠簸（cache thrashing）的问题，那样就会发生大量缺页中断。&rdquo;</p><p>Shrivastava 说，他的团队第一次使用 SLIDE 进行实验时，就发生了严重的内存颠簸，但他们的训练时间仍然与 GPU 的训练时间相当，甚至更快。于是，他、Chen 和 Medini 于 2019 年 3 月在 arXiv 上发布了初步实验结果，并将他们的代码上传到 GitHub。几周后，英特尔公司主动联系了他们。</p><p>&ldquo;来自英特尔的合作伙伴注意到了我们实验中的缓存问题，&rdquo; 他说，&ldquo;他们告诉我们，他们可以与我们进行合作，让这个算法更快地完成训练，之后的事实证明他们是正确的。在他们的帮助下，我们的实验性能又提高了约 50%。&rdquo;</p><p>Shrivastava 说，SLIDE 还远远未达到其最大潜力。</p><p>&ldquo;我们只能算是初尝甜头而已，&rdquo; 他说，&ldquo;我们还可以做很多事情来对这个算法进行优化。例如，我们还没有使用矢量化，也没有在 CPU 中使用内置的加速器，比如 Intel Deep Learning Boost 技术。我们还有很多其他的技巧可以让这个算法变得更快。&rdquo;</p><p>Shrivastava 说，SLIDE 的重要性在于，它证明了还有其他方式来实现深度学习。</p><p>&ldquo;我们想要传达的整个信息是，&lsquo;我们不要被矩阵乘法和 GPU 内存这两个瓶颈所限制住，&rsquo; &rdquo; Chen 说，&ldquo;我们的算法可能是第一个击败 GPU 的算法，但我希望它不是最后一个。这个领域需要新的想法，而这正是这次 MLSys 机器学习系统会议的重要意义所在。&rdquo;</p><p>该算法的其他共同作者包括 James Farwell、Sameh Gobriel 和 Charlie Tai，他们都是来自英特尔实验室的成员。</p><p>该研究还得到了美国国家科学基金会（NSF-1652131, NSF-BIGDATA 1838177）、空军科研办公室（FA9550-18-1-0152）、亚马逊和海军研究办公室的支持。</p>', 0, '根据外媒报道，莱斯大学的计算机科学家们已经克服了人工智能产业迅速发展的一个主要障碍，他们证明了在不依赖于图形处理单元（GPU）等专业级加速硬件的情况下，也能够实现对深度学习技术的加速。这个名为 SLI', NULL, 'CPU 上运算比 GPU 还快？美国莱斯大学最新研究克服硬件障碍', 46, 9, 1, '2021-02-05 18:32:03', 2, '2021-02-26 00:32:05', 'admin', 'admin', 0, 'post', 0, 0, 0, 0);
INSERT INTO `post` VALUES (40, NULL, '<p>根据外媒报道，莱斯大学的计算机科学家们已经克服了人工智能产业迅速发展的一个主要障碍，他们证明了在不依赖于图形处理单元（GPU）等专业级加速硬件的情况下，也能够实现对深度学习技术的加速。这个名为 SLIDE 的算法是第一个在 CPU 上比 GPU 更快地训练深度神经网络的算法。</p><p>在奥斯汀召开的 2020 机器学习系统会议&nbsp;MLSys&nbsp;上，来自莱斯大学的计算机科学家们，在来自英特尔公司的合作伙伴的支持下，于 3 月 2 日在奥斯汀会议中心展示了他们的最新研究成果。</p><p>当下，为了实现深度学习，许多公司正大力投资于图形处理单元（GPU）和其他专业级硬件。深度学习是一种强大的人工智能，如今亚马逊 Alexa 和苹果 Siri 等智能助理、面部识别、产品推荐系统和其他技术都有深度学习在背后作为支撑。深度学习炙手可热的程度可以举一例说明，作为一手打造该行业金字招牌&ldquo;特斯拉 V100 Tensor Core GPU&rdquo;芯片的制造商，Nvidia 公司最近的财务报告显示，其 2019 第四季度收入同比增长了 41%。</p><p>而莱斯大学的研究人员创造了一种可替代 GPU 的节省成本的算法，称为&ldquo;次线性深度学习引擎&rdquo;（sub-linear deep learning engine，简称 SLIDE），这种算法只需使用一般通用的中央处理器（CPU），而无需专业级的加速硬件。</p><p>&ldquo;我们的测试表明，SLIDE 是第一个基于 CPU 实现的深度学习智能算法，它的性能可以超越那些依照产业规模的建议采用大型全连接架构使用 GPU 硬件加速来实现数据集的方法&rdquo;，&nbsp;Anshumali Shrivastava&nbsp;这样说。这位莱斯大学布朗工程学院的助理教授与研究生&nbsp;Beidi Chen&nbsp;和&nbsp;Tharun Medini&nbsp;一起开发了该 SLIDE 算法。</p><p>SLIDE 不需要依赖于 GPU，因为这种算法从根本上采用了一种完全不同的深度学习方法。深度神经网络训练技术标准的&ldquo;反向传播&rdquo;算法需要矩阵乘法，如此繁重的计算量正是适合 GPU 发挥性能的理想场所。然而，通过 SLIDE 算法，Shrivastava、Chen 和 Medini 把神经网络训练转变成为一个可以用哈希表来解决的搜索问题。</p><p>与反向传播训练技术相比，这种 SLIDE 算法可以从根本上减少大量的计算开销。Shrivastava 举例说，如今诸如亚马逊、谷歌以及其他公司使用 GPU 打造的基于云的深度学习服务的顶级平台，一般会使用 8 块&ldquo;特斯拉 V100&rdquo;芯片，其费用约为 10 万美元。</p><p>莱斯大学计算机科学研究生 Beidi Chen 和 Tharun Medini 参与开发了 SLIDE，这是一种无需依赖图形处理单元对深度神经网络进行训练的算法。（图片来源：Jeff Fitlow/ 莱斯大学）</p><p>&ldquo;我们有一个在实验室运行的测试用例，它完全能承载一块 V100 芯片的工作负荷，也即是一个适用于 GPU 内存的，运行在大型全连接网络中有超过 1 亿个参数的计算量&rdquo;，Shrivastava 说，&ldquo;我们用最先进的谷歌的 TensorFlow 软件包来训练该算法，它只花了 3 个半小时就完成了训练。&rdquo;</p><p>&ldquo;我们随后证明，我们的新算法甚至可以在一小时内完成该训练，而且并不是运行在 GPU 上，而是运行在 44 核的 xeon-class CPU 上，&rdquo; Shrivastava 说。</p><p>深度学习网络的灵感来自生物学，其核心特征是人工神经元，这些神经元是一小段可以学习并执行特定的任务计算机代码。一个深度学习网络可能包含数百万甚至数十亿这种人工神经元，只要通过对海量数据的学习，这些神经元共同工作就有可能学习并做出与人类水平相当的专家决策。例如，如果一个深度神经网络被训练来识别照片中的物体，当识别一张猫的照片或是识别一辆校车时，它将使用不同的神经元来进行学习。</p><p>&ldquo;你不需要对每个用例的所有神经元都进行训练，&rdquo; Medini 解释说，&ldquo;我们是这样想的，&lsquo;如果我们只去挑选出相关的神经元，那这就变成了一个搜索问题。&rsquo; 因此，从算法上讲，我们的想法就是使用局部敏感哈希算法来避免矩阵乘法的复杂性。&rdquo;</p><p>哈希算法是 20 世纪 90 年代为互联网搜索发明的一种数据索引方法。它使用数字方法将大量信息，例如整个网站所有网页或一本书的所有章节，编码为一串称为哈希散列的数字。哈希表就是记录这些哈希散列值并可以实现快速搜索的列表。</p><p>&ldquo;在 TensorFlow 或 PyTorch 上实现我们的算法是毫无意义的，因为这些软件执行的第一件事就是不管三七二十一先把你正在做的事情转换成一个矩阵乘法问题，&rdquo; Chen 说。&ldquo;而这正是我们的算法想要避免的。所以我们是从零开始写我们自己的 C++ 代码的。&rdquo;</p><p>Shrivastava 说，SLIDE 相对于反向传播的最大优势在于它采用了数据并行的方式。</p><p>&ldquo;我的意思是，通过数据并行，如果我想要训练两个数据实例，比方说一个是一只猫的形象，另一个是公共汽车，他们可能会激活不同的神经元，该 SLIDE 算法可以对这两个实例分别独立地进行更新或训练，&rdquo; 他说，&ldquo;这就大大地提高了 CPU 并行性的利用率。&rdquo;</p><p>&ldquo;另一方面，与 GPU 相比，我们需要更大的存储空间，&rdquo; 他说，&ldquo;在主存储器中有一个缓存层次结构，如果你使用时不够小心，可能会遇到一个叫做内存颠簸（cache thrashing）的问题，那样就会发生大量缺页中断。&rdquo;</p><p>Shrivastava 说，他的团队第一次使用 SLIDE 进行实验时，就发生了严重的内存颠簸，但他们的训练时间仍然与 GPU 的训练时间相当，甚至更快。于是，他、Chen 和 Medini 于 2019 年 3 月在 arXiv 上发布了初步实验结果，并将他们的代码上传到 GitHub。几周后，英特尔公司主动联系了他们。</p><p>&ldquo;来自英特尔的合作伙伴注意到了我们实验中的缓存问题，&rdquo; 他说，&ldquo;他们告诉我们，他们可以与我们进行合作，让这个算法更快地完成训练，之后的事实证明他们是正确的。在他们的帮助下，我们的实验性能又提高了约 50%。&rdquo;</p><p>Shrivastava 说，SLIDE 还远远未达到其最大潜力。</p><p>&ldquo;我们只能算是初尝甜头而已，&rdquo; 他说，&ldquo;我们还可以做很多事情来对这个算法进行优化。例如，我们还没有使用矢量化，也没有在 CPU 中使用内置的加速器，比如 Intel Deep Learning Boost 技术。我们还有很多其他的技巧可以让这个算法变得更快。&rdquo;</p><p>Shrivastava 说，SLIDE 的重要性在于，它证明了还有其他方式来实现深度学习。</p><p>&ldquo;我们想要传达的整个信息是，&lsquo;我们不要被矩阵乘法和 GPU 内存这两个瓶颈所限制住，&rsquo; &rdquo; Chen 说，&ldquo;我们的算法可能是第一个击败 GPU 的算法，但我希望它不是最后一个。这个领域需要新的想法，而这正是这次 MLSys 机器学习系统会议的重要意义所在。&rdquo;</p><p>该算法的其他共同作者包括 James Farwell、Sameh Gobriel 和 Charlie Tai，他们都是来自英特尔实验室的成员。</p><p>该研究还得到了美国国家科学基金会（NSF-1652131, NSF-BIGDATA 1838177）、空军科研办公室（FA9550-18-1-0152）、亚马逊和海军研究办公室的支持。</p>', 0, '根据外媒报道，莱斯大学的计算机科学家们已经克服了人工智能产业迅速发展的一个主要障碍，他们证明了在不依赖于图形处理单元（GPU）等专业级加速硬件的情况下，也能够实现对深度学习技术的加速。这个名为 SLI', NULL, 'CPU 上运算比 GPU 还快？美国莱斯大学最新研究克服硬件障碍', 46, 9, 1, '2021-02-05 18:32:03', 2, '2021-02-26 00:32:04', 'admin', 'admin', 0, 'post', 0, 0, 0, 0);
INSERT INTO `post` VALUES (41, NULL, '', 2, '', NULL, '2222', 2, 1, 0, '2021-02-05 18:32:03', 0, '2021-02-26 00:32:04', 'admin', 'admin', 0, 'post', 0, 0, 0, 0);
INSERT INTO `post` VALUES (42, NULL, '', 2, '', NULL, '222', 0, 1, 0, '2021-02-05 18:32:03', 0, '2021-02-26 00:32:03', 'admin', 'admin', 0, 'post', 0, 0, 0, 0);
INSERT INTO `post` VALUES (43, NULL, '<!DOCTYPE html>\n<html>\n<head>\n</head>\n<body>\n<p>sss</p>\n<p><audio style=\"display: none;\" controls=\"controls\"></audio></p>\n</body>\n</html>', 2, '\n\n\n\n\nsss\n\n\n', NULL, 'ss', 1, 1, 0, '2021-02-05 18:32:03', 0, '2021-02-26 00:32:02', 'admin', 'admin', 0, 'post', 0, 0, 0, 0);
INSERT INTO `post` VALUES (44, NULL, '<!DOCTYPE html>\n<html>\n<head>\n</head>\n<body>\n<pre class=\"language-java\"><code>package com.example.forum.controller.admin;\n\nimport cn.hutool.http.HtmlUtil;\nimport com.baomidou.mybatisplus.extension.plugins.pagination.Page;\nimport com.example.forum.controller.common.BaseController;\nimport com.example.forum.dto.JsonResult;\nimport com.example.forum.dto.QueryCondition;\nimport com.example.forum.exception.MyBusinessException;\nimport com.example.forum.entity.*;\nimport com.example.forum.enums.*;\nimport com.example.forum.service.*;\nimport com.example.forum.util.PageUtil;\nimport com.example.forum.vo.SearchVo;\nimport lombok.extern.slf4j.Slf4j;\nimport org.apache.commons.lang3.StringUtils;\nimport org.springframework.beans.factory.annotation.Autowired;\nimport org.springframework.stereotype.Controller;\nimport org.springframework.ui.Model;\nimport org.springframework.web.bind.annotation.*;\n\nimport java.util.List;\nimport java.util.Objects;\n\n/**\n * &lt;pre&gt;\n *     后台文章管理控制器\n * &lt;/pre&gt;\n *\n * @author : saysky\n * @date : 2017/12/10\n */\n@Slf4j\n@Controller\n@RequestMapping(value = \"/admin/post\")\npublic class PostController extends BaseController {\n\n    @Autowired\n    private PostService postService;\n\n    @Autowired\n    private CategoryService categoryService;\n\n    @Autowired\n    private UserService userService;\n\n    @Autowired\n    private TagService tagService;\n\n\n    public static final String TITLE = \"title\";\n\n    public static final String CONTENT = \"content\";\n\n\n    /**\n     * 处理后台获取文章列表的请求\n     *\n     * @param model model\n     * @return 模板路径admin/admin_post\n     */\n    @GetMapping\n    public String posts(Model model,\n                        @RequestParam(value = \"status\", defaultValue = \"0\") Integer status,\n                        @RequestParam(value = \"keywords\", defaultValue = \"\") String keywords,\n                        @RequestParam(value = \"searchType\", defaultValue = \"\") String searchType,\n                        @RequestParam(value = \"postSource\", defaultValue = \"-1\") Integer postSource,\n                        @RequestParam(value = \"page\", defaultValue = \"1\") Integer pageNumber,\n                        @RequestParam(value = \"size\", defaultValue = \"10\") Integer pageSize,\n                        @RequestParam(value = \"sort\", defaultValue = \"isSticky desc, createTime\") String sort,\n                        @RequestParam(value = \"order\", defaultValue = \"desc\") String order,\n                        @ModelAttribute SearchVo searchVo) {\n\n        Long loginUserId = getLoginUserId();\n        Post condition = new Post();\n        if (!StringUtils.isBlank(keywords)) {\n            if (TITLE.equals(searchType)) {\n                condition.setPostTitle(keywords);\n            } else {\n                condition.setPostContent(keywords);\n            }\n        }\n        condition.setPostType(PostTypeEnum.POST_TYPE_POST.getValue());\n        condition.setPostStatus(status);\n        // 管理员可以查看所有用户的，非管理员只能看到自己的文章\n        if (!loginUserIsAdmin()) {\n            condition.setUserId(loginUserId);\n        }\n\n        Page page = PageUtil.initMpPage(pageNumber, pageSize, sort, order);\n        Page&lt;Post&gt; posts = postService.findAll(\n                page,\n                new QueryCondition&lt;&gt;(condition, searchVo));\n\n        //封装分类和标签\n        model.addAttribute(\"posts\", posts.getRecords());\n        model.addAttribute(\"pageInfo\", PageUtil.convertPageVo(page));\n        model.addAttribute(\"status\", status);\n        model.addAttribute(\"keywords\", keywords);\n        model.addAttribute(\"searchType\", searchType);\n        model.addAttribute(\"postSource\", postSource);\n        model.addAttribute(\"order\", order);\n        model.addAttribute(\"sort\", sort);\n        return \"admin/admin_post\";\n    }\n\n\n    /**\n     * 处理跳转到新建文章页面\n     *\n     * @return 模板路径admin/admin_editor\n     */\n    @GetMapping(value = \"/new\")\n    public String newPost(Model model) {\n        //所有分类\n        List&lt;Category&gt; allCategories = categoryService.findAll();\n        model.addAttribute(\"categories\", allCategories);\n        return \"admin/admin_post_new\";\n    }\n\n\n    /**\n     * 添加/更新文章\n     *\n     * @param post   Post实体\n     * @param cateId 分类ID\n     * @param tags   标签列表\n     */\n    @PostMapping(value = \"/save\")\n    @ResponseBody\n    public JsonResult pushPost(@ModelAttribute Post post,\n                               @RequestParam(\"cateId\") Long cateId,\n                               @RequestParam(\"tags\") String tags) {\n\n        // 1，检查分类和标签\n        checkTags(tags);\n\n        // 2.获得登录用户\n        User user = getLoginUser();\n        Boolean isAdmin = loginUserIsAdmin();\n        post.setUserId(getLoginUserId());\n\n        //3、非管理员只能修改自己的文章，管理员都可以修改\n        Post originPost = null;\n        if (post.getId() != null) {\n            originPost = postService.get(post.getId());\n            if (!Objects.equals(originPost.getUserId(), user.getId()) &amp;&amp; !isAdmin) {\n                return JsonResult.error(\"没有权限\");\n            }\n            //以下属性不能修改\n            post.setUserId(originPost.getUserId());\n            post.setPostViews(originPost.getPostViews());\n            post.setCommentSize(originPost.getCommentSize());\n            post.setPostLikes(originPost.getPostLikes());\n            post.setCommentSize(originPost.getCommentSize());\n            post.setDelFlag(originPost.getDelFlag());\n        }\n        // 4、提取摘要\n        int postSummaryLength = 100;\n        //文章摘要\n        String summaryText = HtmlUtil.cleanHtmlTag(post.getPostContent());\n        if (summaryText.length() &gt; postSummaryLength) {\n            summaryText = summaryText.substring(0, postSummaryLength);\n        }\n        post.setPostSummary(summaryText);\n\n\n        // 5、分类标签\n        Category category = new Category();\n        category.setId(cateId);\n        post.setCategory(category);\n        if (StringUtils.isNotEmpty(tags)) {\n            List&lt;Tag&gt; tagList = tagService.strListToTagList(StringUtils.deleteWhitespace(tags));\n            post.setTagList(tagList);\n        }\n\n        // 6.类型\n        post.setPostType(PostTypeEnum.POST_TYPE_POST.getValue());\n\n        // 7.添加/更新入库\n        postService.insertOrUpdate(post);\n        return JsonResult.success(\"发布成功\");\n    }\n\n    /**\n     * 限制一篇文章最多5个标签\n     *\n     * @param tagList\n     */\n    private void checkTags(String tagList) {\n        String[] tags = tagList.split(\",\");\n        if (tags.length &gt; 5) {\n            throw new MyBusinessException(\"每篇文章最多5个标签\");\n        }\n        for (String tag : tags) {\n            if (tag.length() &gt; 20) {\n                throw new MyBusinessException(\"每个标签长度最多为20个字符\");\n            }\n        }\n    }\n\n    /**\n     * 处理移至回收站的请求\n     *\n     * @param postId 文章编号\n     * @return 重定向到/admin/post\n     */\n    @PostMapping(value = \"/throw\")\n    @ResponseBody\n    public JsonResult moveToTrash(@RequestParam(\"id\") Long postId) {\n        Post post = postService.get(postId);\n        basicCheck(post);\n        post.setPostStatus(PostStatusEnum.RECYCLE.getCode());\n        postService.update(post);\n\n        return JsonResult.success(\"操作成功\");\n\n    }\n\n    /**\n     * 处理文章为发布的状态\n     *\n     * @param postId 文章编号\n     * @return 重定向到/admin/post\n     */\n    @PostMapping(value = \"/revert\")\n    @ResponseBody\n    public JsonResult moveToPublish(@RequestParam(\"id\") Long postId) {\n        Post post = postService.get(postId);\n        basicCheck(post);\n        post.setPostStatus(PostStatusEnum.PUBLISHED.getCode());\n        postService.update(post);\n        return JsonResult.success(\"操作成功\");\n    }\n\n\n    /**\n     * 处理删除文章的请求\n     *\n     * @param postId 文章编号\n     * @return 重定向到/admin/post\n     */\n    @DeleteMapping(value = \"/delete\")\n    @ResponseBody\n    public JsonResult removePost(@RequestParam(\"id\") Long postId) {\n        Post post = postService.get(postId);\n        basicCheck(post);\n        postService.delete(postId);\n        return JsonResult.success(\"删除成功\");\n    }\n\n    /**\n     * 批量删除\n     *\n     * @param ids 文章ID列表\n     * @return 重定向到/admin/post\n     */\n    @DeleteMapping(value = \"/batchDelete\")\n    @ResponseBody\n    public JsonResult batchDelete(@RequestParam(\"ids\") List&lt;Long&gt; ids) {\n        Long userId = getLoginUserId();\n        //批量操作\n        //1、防止恶意操作\n        if (ids == null || ids.size() == 0 || ids.size() &gt;= 100) {\n            return new JsonResult(ResultCodeEnum.FAIL.getCode(), \"参数不合法!\");\n        }\n        //2、检查用户权限\n        //文章作者才可以删除\n        List&lt;Post&gt; postList = postService.findByBatchIds(ids);\n        for (Post post : postList) {\n            if (!Objects.equals(post.getUserId(), userId) &amp;&amp; !loginUserIsAdmin()) {\n                return new JsonResult(ResultCodeEnum.FAIL.getCode(), \"没有权限\");\n            }\n        }\n        //3、如果当前状态为回收站，则删除；否则，移到回收站\n        for (Post post : postList) {\n            if (Objects.equals(post.getPostStatus(), PostStatusEnum.RECYCLE.getCode())) {\n                postService.delete(post.getId());\n            } else {\n                post.setPostStatus(PostStatusEnum.RECYCLE.getCode());\n                postService.update(post);\n            }\n        }\n        return JsonResult.success(\"删除成功\");\n    }\n\n\n    /**\n     * 检查文章是否存在和用户是否有权限控制\n     *\n     * @param post\n     */\n    private void basicCheck(Post post) {\n        if (post == null) {\n            throw new MyBusinessException(\"文章不存在\");\n        }\n        //只有创建者有权删除\n        User user = getLoginUser();\n        //管理员和文章作者可以删除\n        Boolean isAdmin = loginUserIsAdmin();\n        if (!Objects.equals(post.getUserId(), user.getId()) &amp;&amp; !isAdmin) {\n            throw new MyBusinessException(\"没有权限\");\n        }\n    }\n\n    /**\n     * 跳转到编辑文章页面\n     *\n     * @param postId 文章编号\n     * @param model  model\n     * @return 模板路径admin/admin_editor\n     */\n    @GetMapping(value = \"/edit\")\n    public String editPost(@RequestParam(\"id\") Long postId, Model model) {\n        Post post = postService.get(postId);\n        basicCheck(post);\n\n        //当前文章标签\n        List&lt;Tag&gt; tagList = tagService.findByPostId(postId);\n        String tags = tagService.tagListToStr(tagList);\n        model.addAttribute(\"tags\", tags);\n\n        //当前文章分类\n        Category category = categoryService.findByPostId(postId);\n        post.setCategory(category);\n        model.addAttribute(\"post\", post);\n\n        //所有分类\n        List&lt;Category&gt; allCategories = categoryService.findAll();\n        model.addAttribute(\"categories\", allCategories);\n        return \"admin/admin_post_edit\";\n    }\n\n\n    /**\n     * 置顶文章\n     *\n     * @param postId 文章编号\n     * @return 响应\n     */\n    @PostMapping(value = \"/stick\")\n    @ResponseBody\n    public JsonResult stick(@RequestParam(\"id\") Long postId) {\n        Post post = postService.get(postId);\n        post.setIsSticky(PostIsStickyEnum.TRUE.getValue());\n        postService.update(post);\n        return JsonResult.success(\"置顶成功\");\n    }\n\n    /**\n     * 取消置顶文章\n     *\n     * @param postId 文章编号\n     * @return 响应\n     */\n    @PostMapping(value = \"/unStick\")\n    @ResponseBody\n    public JsonResult unStick(@RequestParam(\"id\") Long postId) {\n        Post post = postService.get(postId);\n        post.setIsSticky(PostIsStickyEnum.FALSE.getValue());\n        postService.update(post);\n        return JsonResult.success(\"取消置顶成功\");\n    }\n\n    /**\n     * 推荐文章\n     *\n     * @param postId 文章编号\n     * @return 响应\n     */\n    @PostMapping(value = \"/recommend\")\n    @ResponseBody\n    public JsonResult recommend(@RequestParam(\"id\") Long postId) {\n        Post post = postService.get(postId);\n        Boolean isAdmin = loginUserIsAdmin();\n        if (!isAdmin) {\n            throw new MyBusinessException(\"没有权限\");\n        }\n        post.setIsRecommend(PostIsRecommendEnum.TRUE.getValue());\n        postService.update(post);\n        return JsonResult.success(\"推荐成功\");\n    }\n\n    /**\n     * 取消推荐文章\n     *\n     * @param postId 文章编号\n     * @return 响应\n     */\n    @PostMapping(value = \"/unRecommend\")\n    @ResponseBody\n    public JsonResult unRecommend(@RequestParam(\"id\") Long postId) {\n        Post post = postService.get(postId);\n        Boolean isAdmin = loginUserIsAdmin();\n        if (!isAdmin) {\n            throw new MyBusinessException(\"没有权限\");\n        }\n        post.setIsRecommend(PostIsRecommendEnum.FALSE.getValue());\n        postService.update(post);\n        return JsonResult.success(\"取消推荐成功\");\n    }\n}\n</code></pre>\n<p><audio style=\"display: none;\" controls=\"controls\"></audio></p>\n<p><audio style=\"display: none;\" controls=\"controls\"></audio></p>\n</body>\n</html>', 2, '\n\n\n\n\npackage com.example.forum.controller.admin;\n\nimport cn.hutool.http.HtmlUtil;\nimport com.baomido', NULL, '事实上', 26, 1, 0, '2021-02-05 18:32:03', 0, '2021-02-26 00:32:01', 'admin', 'admin', 0, 'post', 0, 0, 0, 0);
INSERT INTO `post` VALUES (45, NULL, '<!DOCTYPE html>\n<html>\n<head>\n</head>\n<body>\n<p>欢迎注册欢迎注册欢迎注册</p>\n<p>欢迎注册欢迎注册欢迎注册</p>\n<p><audio style=\"display: none;\" controls=\"controls\"></audio></p>\n<p><audio style=\"display: none;\" controls=\"controls\"></audio></p>\n</body>\n</html>', 0, NULL, NULL, '欢迎注册', 2, 1, 0, '2021-03-05 17:40:31', 0, '2021-03-06 10:07:23', 'admin', 'admin', 0, 'notice', 0, 0, 0, 0);
COMMIT;

-- ----------------------------
-- Table structure for post_category_ref
-- ----------------------------
DROP TABLE IF EXISTS `post_category_ref`;
CREATE TABLE `post_category_ref` (
  `post_id` bigint(20) NOT NULL COMMENT '文章ID',
  `cate_id` bigint(20) NOT NULL COMMENT '分类ID',
  `del_flag` int(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `create_by` varchar(20) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(20) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FKatntuqmrfdi01vecyyi24arus` (`cate_id`),
  KEY `post_id` (`post_id`),
  CONSTRAINT `post_category_ref_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `post_category_ref_ibfk_2` FOREIGN KEY (`cate_id`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of post_category_ref
-- ----------------------------
BEGIN;
INSERT INTO `post_category_ref` VALUES (14, 9, 0, NULL, '2020-03-12 18:10:56', NULL, '2020-03-12 18:10:56', 16);
INSERT INTO `post_category_ref` VALUES (15, 11, 0, NULL, '2020-03-12 18:12:21', NULL, '2020-03-12 18:12:21', 17);
INSERT INTO `post_category_ref` VALUES (17, 14, 0, NULL, '2020-03-12 18:16:24', NULL, '2020-03-12 18:16:24', 21);
INSERT INTO `post_category_ref` VALUES (22, 10, 0, NULL, '2020-03-12 18:23:16', NULL, '2020-03-12 18:23:16', 26);
INSERT INTO `post_category_ref` VALUES (23, 9, 0, NULL, '2020-04-03 23:01:00', NULL, '2020-04-03 23:01:00', 30);
INSERT INTO `post_category_ref` VALUES (18, 9, 0, NULL, '2020-04-10 21:35:50', NULL, '2020-04-10 21:35:50', 31);
INSERT INTO `post_category_ref` VALUES (25, 9, 0, NULL, '2020-08-17 22:19:15', NULL, '2020-08-17 22:19:15', 32);
INSERT INTO `post_category_ref` VALUES (26, 8, 0, NULL, '2020-08-17 22:58:47', NULL, '2020-08-17 22:58:47', 33);
INSERT INTO `post_category_ref` VALUES (27, 8, 0, NULL, '2020-08-17 23:45:19', NULL, '2020-08-17 23:45:19', 34);
INSERT INTO `post_category_ref` VALUES (24, 13, 0, NULL, '2020-10-23 14:10:24', NULL, '2020-10-23 14:10:24', 35);
INSERT INTO `post_category_ref` VALUES (25, 13, 0, NULL, '2020-10-23 14:11:46', NULL, '2020-10-23 14:11:46', 36);
INSERT INTO `post_category_ref` VALUES (28, 11, 0, NULL, '2020-10-23 14:12:25', NULL, '2020-10-23 14:13:02', 37);
INSERT INTO `post_category_ref` VALUES (29, 11, 0, NULL, '2020-10-23 14:12:26', NULL, '2020-10-23 14:13:01', 38);
INSERT INTO `post_category_ref` VALUES (30, 11, 0, NULL, '2020-10-23 14:12:27', NULL, '2020-10-23 14:13:00', 39);
INSERT INTO `post_category_ref` VALUES (31, 11, 0, NULL, '2020-10-23 14:12:28', NULL, '2020-10-23 14:13:00', 40);
INSERT INTO `post_category_ref` VALUES (32, 11, 0, NULL, '2020-10-23 14:12:29', NULL, '2020-10-23 14:12:59', 41);
INSERT INTO `post_category_ref` VALUES (33, 10, 0, NULL, '2020-10-23 14:12:30', NULL, '2020-10-23 14:12:59', 42);
INSERT INTO `post_category_ref` VALUES (34, 13, 0, NULL, '2020-10-23 14:12:31', NULL, '2020-10-23 14:12:57', 43);
INSERT INTO `post_category_ref` VALUES (35, 10, 0, NULL, '2020-10-23 14:12:32', NULL, '2020-10-23 14:12:53', 44);
INSERT INTO `post_category_ref` VALUES (36, 11, 0, NULL, '2020-10-23 14:12:33', NULL, '2020-10-23 14:12:52', 45);
INSERT INTO `post_category_ref` VALUES (37, 9, 0, NULL, '2020-10-23 14:12:34', NULL, '2020-10-23 14:12:49', 46);
INSERT INTO `post_category_ref` VALUES (38, 8, 0, NULL, '2020-10-23 14:12:35', NULL, '2020-10-23 14:12:45', 47);
INSERT INTO `post_category_ref` VALUES (39, 13, 0, NULL, '2020-10-23 14:12:36', NULL, '2020-10-23 14:12:43', 48);
INSERT INTO `post_category_ref` VALUES (40, 13, 0, NULL, '2020-10-23 14:12:42', NULL, '2020-10-23 14:12:42', 49);
INSERT INTO `post_category_ref` VALUES (41, 8, 0, NULL, '2021-01-05 18:27:36', NULL, '2021-01-05 18:27:36', 50);
INSERT INTO `post_category_ref` VALUES (42, 8, 0, NULL, '2021-01-05 18:31:14', NULL, '2021-01-05 18:31:14', 51);
INSERT INTO `post_category_ref` VALUES (43, 8, 0, NULL, '2021-01-05 18:31:43', NULL, '2021-01-05 18:31:43', 52);
INSERT INTO `post_category_ref` VALUES (44, 10, 0, NULL, '2021-01-05 20:10:56', NULL, '2021-01-05 20:10:56', 54);
COMMIT;

-- ----------------------------
-- Table structure for post_dislike_ref
-- ----------------------------
DROP TABLE IF EXISTS `post_dislike_ref`;
CREATE TABLE `post_dislike_ref` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `del_flag` int(1) NOT NULL DEFAULT '0',
  `create_by` varchar(20) DEFAULT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(20) DEFAULT NULL,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `user_id` bigint(20) NOT NULL,
  `post_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `user_id` (`user_id`),
  CONSTRAINT `post_dislike_ref_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of post_dislike_ref
-- ----------------------------
BEGIN;
INSERT INTO `post_dislike_ref` VALUES (8, 0, 'admin', '2021-04-15 15:42:30', 'admin', '2021-04-15 15:42:30', 1, 25);
COMMIT;

-- ----------------------------
-- Table structure for post_like_ref
-- ----------------------------
DROP TABLE IF EXISTS `post_like_ref`;
CREATE TABLE `post_like_ref` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `del_flag` int(1) NOT NULL DEFAULT '0',
  `create_by` varchar(20) DEFAULT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(20) DEFAULT NULL,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `user_id` bigint(20) NOT NULL,
  `post_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `user_id` (`user_id`),
  CONSTRAINT `post_like_ref_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of post_like_ref
-- ----------------------------
BEGIN;
INSERT INTO `post_like_ref` VALUES (7, 0, 'zhangsan', '2021-02-21 17:17:26', 'zhangsan', '2021-02-21 17:17:26', 3, 23);
INSERT INTO `post_like_ref` VALUES (8, 0, 'zhangsan', '2021-02-21 22:25:45', 'zhangsan', '2021-02-21 22:25:45', 3, 19);
INSERT INTO `post_like_ref` VALUES (9, 0, 'admin', '2021-02-26 14:44:07', 'admin', '2021-02-26 14:44:07', 1, 22);
INSERT INTO `post_like_ref` VALUES (10, 0, 'admin', '2021-04-15 15:41:23', 'admin', '2021-04-15 15:41:23', 1, 25);
COMMIT;

-- ----------------------------
-- Table structure for post_mark_ref
-- ----------------------------
DROP TABLE IF EXISTS `post_mark_ref`;
CREATE TABLE `post_mark_ref` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `del_flag` int(1) NOT NULL DEFAULT '0',
  `create_by` varchar(20) DEFAULT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(20) DEFAULT NULL,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `user_id` bigint(20) NOT NULL,
  `post_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `user_id` (`user_id`),
  CONSTRAINT `post_mark_ref_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of post_mark_ref
-- ----------------------------
BEGIN;
INSERT INTO `post_mark_ref` VALUES (3, 0, 'admin', '2021-04-14 23:11:41', 'admin', '2021-04-14 23:11:41', 1, 22);
INSERT INTO `post_mark_ref` VALUES (4, 0, 'admin', '2021-04-15 15:42:33', 'admin', '2021-04-15 15:42:33', 1, 25);
INSERT INTO `post_mark_ref` VALUES (5, 0, 'admin', '2021-04-16 18:28:12', 'admin', '2021-04-16 18:28:12', 1, 29);
COMMIT;

-- ----------------------------
-- Table structure for post_tag_ref
-- ----------------------------
DROP TABLE IF EXISTS `post_tag_ref`;
CREATE TABLE `post_tag_ref` (
  `post_id` bigint(20) NOT NULL COMMENT '文章ID',
  `tag_id` bigint(20) NOT NULL COMMENT '标签ID',
  `del_flag` int(1) DEFAULT '0' COMMENT '删除标记',
  `create_by` varchar(20) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(20) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FKix1v0nbpp1c84a3v9b917u9ii` (`tag_id`),
  KEY `post_id` (`post_id`),
  CONSTRAINT `post_tag_ref_ibfk_1` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `post_tag_ref_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of post_tag_ref
-- ----------------------------
BEGIN;
INSERT INTO `post_tag_ref` VALUES (14, 37, 0, NULL, '2020-03-12 18:10:56', NULL, '2020-03-12 18:10:56', 34);
INSERT INTO `post_tag_ref` VALUES (14, 38, 0, NULL, '2020-03-12 18:10:56', NULL, '2020-03-12 18:10:56', 35);
INSERT INTO `post_tag_ref` VALUES (14, 39, 0, NULL, '2020-03-12 18:10:56', NULL, '2020-03-12 18:10:56', 36);
INSERT INTO `post_tag_ref` VALUES (14, 40, 0, NULL, '2020-03-12 18:10:56', NULL, '2020-03-12 18:10:56', 37);
INSERT INTO `post_tag_ref` VALUES (15, 41, 0, NULL, '2020-03-12 18:12:21', NULL, '2020-03-12 18:12:21', 38);
INSERT INTO `post_tag_ref` VALUES (15, 42, 0, NULL, '2020-03-12 18:12:21', NULL, '2020-03-12 18:12:21', 39);
INSERT INTO `post_tag_ref` VALUES (15, 43, 0, NULL, '2020-03-12 18:12:21', NULL, '2020-03-12 18:12:21', 40);
INSERT INTO `post_tag_ref` VALUES (17, 47, 0, NULL, '2020-03-12 18:16:24', NULL, '2020-03-12 18:16:24', 48);
INSERT INTO `post_tag_ref` VALUES (22, 56, 0, NULL, '2020-03-12 18:23:16', NULL, '2020-03-12 18:23:16', 59);
INSERT INTO `post_tag_ref` VALUES (22, 50, 0, NULL, '2020-03-12 18:23:16', NULL, '2020-03-12 18:23:16', 60);
INSERT INTO `post_tag_ref` VALUES (22, 57, 0, NULL, '2020-03-12 18:23:16', NULL, '2020-03-12 18:23:16', 61);
INSERT INTO `post_tag_ref` VALUES (23, 62, 0, NULL, '2020-04-03 23:01:00', NULL, '2020-04-03 23:01:00', 66);
INSERT INTO `post_tag_ref` VALUES (23, 58, 0, NULL, '2020-04-03 23:01:00', NULL, '2020-04-03 23:01:00', 67);
INSERT INTO `post_tag_ref` VALUES (18, 48, 0, NULL, '2020-04-10 21:35:50', NULL, '2020-04-10 21:35:50', 68);
INSERT INTO `post_tag_ref` VALUES (18, 49, 0, NULL, '2020-04-10 21:35:50', NULL, '2020-04-10 21:35:50', 69);
INSERT INTO `post_tag_ref` VALUES (25, 64, 0, NULL, '2020-08-17 22:19:15', NULL, '2020-08-17 22:19:15', 70);
INSERT INTO `post_tag_ref` VALUES (24, 60, 0, NULL, '2020-10-23 14:10:24', NULL, '2020-10-23 14:10:24', 73);
INSERT INTO `post_tag_ref` VALUES (24, 61, 0, NULL, '2020-10-23 14:10:24', NULL, '2020-10-23 14:10:24', 74);
INSERT INTO `post_tag_ref` VALUES (28, 60, 0, NULL, '2020-10-23 14:13:13', NULL, '2020-10-23 14:13:48', 75);
INSERT INTO `post_tag_ref` VALUES (29, 60, 0, NULL, '2020-10-23 14:13:15', NULL, '2020-10-23 14:13:47', 76);
INSERT INTO `post_tag_ref` VALUES (30, 60, 0, NULL, '2020-10-23 14:13:16', NULL, '2020-10-23 14:13:46', 77);
INSERT INTO `post_tag_ref` VALUES (31, 60, 0, NULL, '2020-10-23 14:13:17', NULL, '2020-10-23 14:13:46', 78);
INSERT INTO `post_tag_ref` VALUES (32, 60, 0, NULL, '2020-10-23 14:13:18', NULL, '2020-10-23 14:13:44', 79);
INSERT INTO `post_tag_ref` VALUES (33, 60, 0, NULL, '2020-10-23 14:13:18', NULL, '2020-10-23 14:13:44', 80);
INSERT INTO `post_tag_ref` VALUES (34, 60, 0, NULL, '2020-10-23 14:13:19', NULL, '2020-10-23 14:13:43', 81);
INSERT INTO `post_tag_ref` VALUES (35, 60, 0, NULL, '2020-10-23 14:13:20', NULL, '2020-10-23 14:13:43', 82);
INSERT INTO `post_tag_ref` VALUES (36, 60, 0, NULL, '2020-10-23 14:13:22', NULL, '2020-10-23 14:13:42', 83);
INSERT INTO `post_tag_ref` VALUES (37, 60, 0, NULL, '2020-10-23 14:13:24', NULL, '2020-10-23 14:13:42', 84);
INSERT INTO `post_tag_ref` VALUES (38, 60, 0, NULL, '2020-10-23 14:13:25', NULL, '2020-10-23 14:13:41', 85);
INSERT INTO `post_tag_ref` VALUES (39, 60, 0, NULL, '2020-10-23 14:13:25', NULL, '2020-10-23 14:13:39', 86);
INSERT INTO `post_tag_ref` VALUES (40, 37, 0, NULL, '2020-10-23 14:13:33', NULL, '2020-10-23 14:13:33', 87);
COMMIT;

-- ----------------------------
-- Table structure for report
-- ----------------------------
DROP TABLE IF EXISTS `report`;
CREATE TABLE `report` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `del_flag` int(1) NOT NULL DEFAULT '0',
  `create_by` varchar(20) DEFAULT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(20) DEFAULT NULL,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `post_id` bigint(20) NOT NULL COMMENT '文章ID',
  `content` varchar(5000) DEFAULT NULL COMMENT '举报内容',
  `status` int(1) NOT NULL COMMENT '状态：0待处理，1已处理',
  `remark` varchar(5000) DEFAULT NULL COMMENT '处理回复',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `post_id` (`post_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `report_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `report_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of report
-- ----------------------------
BEGIN;
INSERT INTO `report` VALUES (1, 0, 'zhangsan', '2021-02-21 18:15:26', 'zhangsan', '2021-02-26 12:13:47', 23, '是是是', 1, '2222222', 3);
INSERT INTO `report` VALUES (2, 0, 'zhangsan', '2021-02-21 18:15:26', 'zhangsan', '2021-02-26 12:14:01', 23, '是是是', 1, 'swsww', 3);
INSERT INTO `report` VALUES (3, 0, 'zhangsan', '2021-02-21 18:15:26', 'zhangsan', '2021-02-26 11:04:53', 23, '是是是', 0, '', 3);
INSERT INTO `report` VALUES (16, 0, 'zhangsan', '2021-02-21 18:15:26', 'zhangsan', '2021-02-26 11:04:56', 23, '是是是', 0, '', 3);
INSERT INTO `report` VALUES (17, 0, 'mayun', '2021-02-26 14:44:18', 'mayun', '2021-04-16 18:52:53', 22, 'z222', 0, NULL, 2);
INSERT INTO `report` VALUES (18, 0, 'mayun', '2021-02-26 14:44:19', 'mayun', '2021-04-16 18:53:03', 22, 'z222', 1, 'OK！', 2);
INSERT INTO `report` VALUES (19, 0, 'mayun', '2021-02-26 14:44:22', 'mayun', '2021-04-16 18:52:52', 22, 'z222', 0, NULL, 2);
COMMIT;

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `level` int(1) NOT NULL,
  `del_flag` int(1) DEFAULT '0',
  `create_by` varchar(20) DEFAULT NULL,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(20) DEFAULT NULL,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `is_register_default` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of role
-- ----------------------------
BEGIN;
INSERT INTO `role` VALUES (1, 'admin', '管理员', 10, 0, NULL, '2020-02-05 18:54:23', NULL, '2020-03-08 13:31:39', 0);
INSERT INTO `role` VALUES (2, 'user', '用户', 5, 0, NULL, '2020-02-05 18:54:29', NULL, '2020-03-08 13:31:46', 1);
COMMIT;

-- ----------------------------
-- Table structure for role_permission_ref
-- ----------------------------
DROP TABLE IF EXISTS `role_permission_ref`;
CREATE TABLE `role_permission_ref` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `permission_id` bigint(20) NOT NULL COMMENT '权限ID',
  `del_flag` int(1) DEFAULT '0' COMMENT '删除标记',
  `create_by` varchar(20) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(20) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `role_id` (`role_id`),
  KEY `permission_id` (`permission_id`),
  CONSTRAINT `role_permission_ref_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `role_permission_ref_ibfk_2` FOREIGN KEY (`permission_id`) REFERENCES `permission` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2667 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of role_permission_ref
-- ----------------------------
BEGIN;
INSERT INTO `role_permission_ref` VALUES (1, 1, 0, NULL, '2021-04-15 23:15:13', NULL, '2021-04-15 23:15:13', 2546);
INSERT INTO `role_permission_ref` VALUES (1, 106, 0, NULL, '2021-04-15 23:15:13', NULL, '2021-04-15 23:15:13', 2547);
INSERT INTO `role_permission_ref` VALUES (1, 6, 0, NULL, '2021-04-15 23:15:13', NULL, '2021-04-15 23:15:13', 2548);
INSERT INTO `role_permission_ref` VALUES (1, 131, 0, NULL, '2021-04-15 23:15:13', NULL, '2021-04-15 23:15:13', 2549);
INSERT INTO `role_permission_ref` VALUES (1, 133, 0, NULL, '2021-04-15 23:15:13', NULL, '2021-04-15 23:15:13', 2550);
INSERT INTO `role_permission_ref` VALUES (1, 140, 0, NULL, '2021-04-15 23:15:13', NULL, '2021-04-15 23:15:13', 2551);
INSERT INTO `role_permission_ref` VALUES (1, 141, 0, NULL, '2021-04-15 23:15:13', NULL, '2021-04-15 23:15:13', 2552);
INSERT INTO `role_permission_ref` VALUES (1, 142, 0, NULL, '2021-04-15 23:15:13', NULL, '2021-04-15 23:15:13', 2553);
INSERT INTO `role_permission_ref` VALUES (1, 144, 0, NULL, '2021-04-15 23:15:13', NULL, '2021-04-15 23:15:13', 2554);
INSERT INTO `role_permission_ref` VALUES (1, 145, 0, NULL, '2021-04-15 23:15:13', NULL, '2021-04-15 23:15:13', 2555);
INSERT INTO `role_permission_ref` VALUES (1, 160, 0, NULL, '2021-04-15 23:15:13', NULL, '2021-04-15 23:15:13', 2556);
INSERT INTO `role_permission_ref` VALUES (1, 161, 0, NULL, '2021-04-15 23:15:13', NULL, '2021-04-15 23:15:13', 2557);
INSERT INTO `role_permission_ref` VALUES (1, 162, 0, NULL, '2021-04-15 23:15:13', NULL, '2021-04-15 23:15:13', 2558);
INSERT INTO `role_permission_ref` VALUES (1, 163, 0, NULL, '2021-04-15 23:15:13', NULL, '2021-04-15 23:15:13', 2559);
INSERT INTO `role_permission_ref` VALUES (1, 196, 0, NULL, '2021-04-15 23:15:13', NULL, '2021-04-15 23:15:13', 2560);
INSERT INTO `role_permission_ref` VALUES (1, 132, 0, NULL, '2021-04-15 23:15:13', NULL, '2021-04-15 23:15:13', 2561);
INSERT INTO `role_permission_ref` VALUES (1, 143, 0, NULL, '2021-04-15 23:15:13', NULL, '2021-04-15 23:15:13', 2562);
INSERT INTO `role_permission_ref` VALUES (1, 146, 0, NULL, '2021-04-15 23:15:13', NULL, '2021-04-15 23:15:13', 2563);
INSERT INTO `role_permission_ref` VALUES (1, 138, 0, NULL, '2021-04-15 23:15:13', NULL, '2021-04-15 23:15:13', 2564);
INSERT INTO `role_permission_ref` VALUES (1, 147, 0, NULL, '2021-04-15 23:15:13', NULL, '2021-04-15 23:15:13', 2565);
INSERT INTO `role_permission_ref` VALUES (1, 148, 0, NULL, '2021-04-15 23:15:13', NULL, '2021-04-15 23:15:13', 2566);
INSERT INTO `role_permission_ref` VALUES (1, 149, 0, NULL, '2021-04-15 23:15:13', NULL, '2021-04-15 23:15:13', 2567);
INSERT INTO `role_permission_ref` VALUES (1, 151, 0, NULL, '2021-04-15 23:15:13', NULL, '2021-04-15 23:15:13', 2568);
INSERT INTO `role_permission_ref` VALUES (1, 152, 0, NULL, '2021-04-15 23:15:13', NULL, '2021-04-15 23:15:13', 2569);
INSERT INTO `role_permission_ref` VALUES (1, 155, 0, NULL, '2021-04-15 23:15:13', NULL, '2021-04-15 23:15:13', 2570);
INSERT INTO `role_permission_ref` VALUES (1, 156, 0, NULL, '2021-04-15 23:15:13', NULL, '2021-04-15 23:15:13', 2571);
INSERT INTO `role_permission_ref` VALUES (1, 134, 0, NULL, '2021-04-15 23:15:13', NULL, '2021-04-15 23:15:13', 2572);
INSERT INTO `role_permission_ref` VALUES (1, 153, 0, NULL, '2021-04-15 23:15:13', NULL, '2021-04-15 23:15:13', 2573);
INSERT INTO `role_permission_ref` VALUES (1, 157, 0, NULL, '2021-04-15 23:15:13', NULL, '2021-04-15 23:15:13', 2574);
INSERT INTO `role_permission_ref` VALUES (1, 158, 0, NULL, '2021-04-15 23:15:13', NULL, '2021-04-15 23:15:13', 2575);
INSERT INTO `role_permission_ref` VALUES (1, 159, 0, NULL, '2021-04-15 23:15:13', NULL, '2021-04-15 23:15:13', 2576);
INSERT INTO `role_permission_ref` VALUES (1, 136, 0, NULL, '2021-04-15 23:15:13', NULL, '2021-04-15 23:15:13', 2577);
INSERT INTO `role_permission_ref` VALUES (1, 135, 0, NULL, '2021-04-15 23:15:13', NULL, '2021-04-15 23:15:13', 2578);
INSERT INTO `role_permission_ref` VALUES (1, 190, 0, NULL, '2021-04-15 23:15:13', NULL, '2021-04-15 23:15:13', 2579);
INSERT INTO `role_permission_ref` VALUES (1, 191, 0, NULL, '2021-04-15 23:15:13', NULL, '2021-04-15 23:15:13', 2580);
INSERT INTO `role_permission_ref` VALUES (1, 192, 0, NULL, '2021-04-15 23:15:13', NULL, '2021-04-15 23:15:13', 2581);
INSERT INTO `role_permission_ref` VALUES (1, 193, 0, NULL, '2021-04-15 23:15:13', NULL, '2021-04-15 23:15:13', 2582);
INSERT INTO `role_permission_ref` VALUES (1, 194, 0, NULL, '2021-04-15 23:15:13', NULL, '2021-04-15 23:15:13', 2583);
INSERT INTO `role_permission_ref` VALUES (1, 195, 0, NULL, '2021-04-15 23:15:13', NULL, '2021-04-15 23:15:13', 2584);
INSERT INTO `role_permission_ref` VALUES (1, 165, 0, NULL, '2021-04-15 23:15:13', NULL, '2021-04-15 23:15:13', 2585);
INSERT INTO `role_permission_ref` VALUES (1, 166, 0, NULL, '2021-04-15 23:15:13', NULL, '2021-04-15 23:15:13', 2586);
INSERT INTO `role_permission_ref` VALUES (1, 167, 0, NULL, '2021-04-15 23:15:13', NULL, '2021-04-15 23:15:13', 2587);
INSERT INTO `role_permission_ref` VALUES (1, 168, 0, NULL, '2021-04-15 23:15:13', NULL, '2021-04-15 23:15:13', 2588);
INSERT INTO `role_permission_ref` VALUES (1, 169, 0, NULL, '2021-04-15 23:15:13', NULL, '2021-04-15 23:15:13', 2589);
INSERT INTO `role_permission_ref` VALUES (1, 170, 0, NULL, '2021-04-15 23:15:13', NULL, '2021-04-15 23:15:13', 2590);
INSERT INTO `role_permission_ref` VALUES (1, 171, 0, NULL, '2021-04-15 23:15:13', NULL, '2021-04-15 23:15:13', 2591);
INSERT INTO `role_permission_ref` VALUES (1, 172, 0, NULL, '2021-04-15 23:15:13', NULL, '2021-04-15 23:15:13', 2592);
INSERT INTO `role_permission_ref` VALUES (1, 173, 0, NULL, '2021-04-15 23:15:13', NULL, '2021-04-15 23:15:13', 2593);
INSERT INTO `role_permission_ref` VALUES (1, 174, 0, NULL, '2021-04-15 23:15:13', NULL, '2021-04-15 23:15:13', 2594);
INSERT INTO `role_permission_ref` VALUES (1, 180, 0, NULL, '2021-04-15 23:15:13', NULL, '2021-04-15 23:15:13', 2600);
INSERT INTO `role_permission_ref` VALUES (1, 181, 0, NULL, '2021-04-15 23:15:13', NULL, '2021-04-15 23:15:13', 2601);
INSERT INTO `role_permission_ref` VALUES (1, 182, 0, NULL, '2021-04-15 23:15:13', NULL, '2021-04-15 23:15:13', 2602);
INSERT INTO `role_permission_ref` VALUES (1, 183, 0, NULL, '2021-04-15 23:15:13', NULL, '2021-04-15 23:15:13', 2603);
INSERT INTO `role_permission_ref` VALUES (1, 184, 0, NULL, '2021-04-15 23:15:13', NULL, '2021-04-15 23:15:13', 2604);
INSERT INTO `role_permission_ref` VALUES (1, 185, 0, NULL, '2021-04-15 23:15:13', NULL, '2021-04-15 23:15:13', 2605);
INSERT INTO `role_permission_ref` VALUES (1, 186, 0, NULL, '2021-04-15 23:15:13', NULL, '2021-04-15 23:15:13', 2606);
INSERT INTO `role_permission_ref` VALUES (1, 70, 0, NULL, '2021-04-15 23:15:13', NULL, '2021-04-15 23:15:13', 2607);
INSERT INTO `role_permission_ref` VALUES (1, 126, 0, NULL, '2021-04-15 23:15:13', NULL, '2021-04-15 23:15:13', 2608);
INSERT INTO `role_permission_ref` VALUES (1, 72, 0, NULL, '2021-04-15 23:15:13', NULL, '2021-04-15 23:15:13', 2609);
INSERT INTO `role_permission_ref` VALUES (1, 73, 0, NULL, '2021-04-15 23:15:13', NULL, '2021-04-15 23:15:13', 2610);
INSERT INTO `role_permission_ref` VALUES (1, 74, 0, NULL, '2021-04-15 23:15:13', NULL, '2021-04-15 23:15:13', 2611);
INSERT INTO `role_permission_ref` VALUES (1, 75, 0, NULL, '2021-04-15 23:15:13', NULL, '2021-04-15 23:15:13', 2612);
INSERT INTO `role_permission_ref` VALUES (1, 76, 0, NULL, '2021-04-15 23:15:13', NULL, '2021-04-15 23:15:13', 2613);
INSERT INTO `role_permission_ref` VALUES (1, 91, 0, NULL, '2021-04-15 23:15:13', NULL, '2021-04-15 23:15:13', 2614);
INSERT INTO `role_permission_ref` VALUES (1, 127, 0, NULL, '2021-04-15 23:15:13', NULL, '2021-04-15 23:15:13', 2615);
INSERT INTO `role_permission_ref` VALUES (1, 111, 0, NULL, '2021-04-15 23:15:13', NULL, '2021-04-15 23:15:13', 2616);
INSERT INTO `role_permission_ref` VALUES (1, 92, 0, NULL, '2021-04-15 23:15:13', NULL, '2021-04-15 23:15:13', 2617);
INSERT INTO `role_permission_ref` VALUES (1, 93, 0, NULL, '2021-04-15 23:15:13', NULL, '2021-04-15 23:15:13', 2618);
INSERT INTO `role_permission_ref` VALUES (1, 94, 0, NULL, '2021-04-15 23:15:13', NULL, '2021-04-15 23:15:13', 2619);
INSERT INTO `role_permission_ref` VALUES (1, 95, 0, NULL, '2021-04-15 23:15:13', NULL, '2021-04-15 23:15:13', 2620);
INSERT INTO `role_permission_ref` VALUES (1, 128, 0, NULL, '2021-04-15 23:15:13', NULL, '2021-04-15 23:15:13', 2621);
INSERT INTO `role_permission_ref` VALUES (1, 110, 0, NULL, '2021-04-15 23:15:13', NULL, '2021-04-15 23:15:13', 2622);
INSERT INTO `role_permission_ref` VALUES (1, 96, 0, NULL, '2021-04-15 23:15:13', NULL, '2021-04-15 23:15:13', 2623);
INSERT INTO `role_permission_ref` VALUES (1, 97, 0, NULL, '2021-04-15 23:15:13', NULL, '2021-04-15 23:15:13', 2624);
INSERT INTO `role_permission_ref` VALUES (1, 98, 0, NULL, '2021-04-15 23:15:13', NULL, '2021-04-15 23:15:13', 2625);
INSERT INTO `role_permission_ref` VALUES (1, 120, 0, NULL, '2021-04-15 23:15:13', NULL, '2021-04-15 23:15:13', 2626);
INSERT INTO `role_permission_ref` VALUES (1, 82, 0, NULL, '2021-04-15 23:15:13', NULL, '2021-04-15 23:15:13', 2627);
INSERT INTO `role_permission_ref` VALUES (1, 83, 0, NULL, '2021-04-15 23:15:13', NULL, '2021-04-15 23:15:13', 2628);
INSERT INTO `role_permission_ref` VALUES (2, 1, 0, NULL, '2021-04-16 16:59:49', NULL, '2021-04-16 16:59:49', 2629);
INSERT INTO `role_permission_ref` VALUES (2, 106, 0, NULL, '2021-04-16 16:59:49', NULL, '2021-04-16 16:59:49', 2630);
INSERT INTO `role_permission_ref` VALUES (2, 6, 0, NULL, '2021-04-16 16:59:49', NULL, '2021-04-16 16:59:49', 2631);
INSERT INTO `role_permission_ref` VALUES (2, 131, 0, NULL, '2021-04-16 16:59:49', NULL, '2021-04-16 16:59:49', 2632);
INSERT INTO `role_permission_ref` VALUES (2, 133, 0, NULL, '2021-04-16 16:59:49', NULL, '2021-04-16 16:59:49', 2633);
INSERT INTO `role_permission_ref` VALUES (2, 140, 0, NULL, '2021-04-16 16:59:49', NULL, '2021-04-16 16:59:49', 2634);
INSERT INTO `role_permission_ref` VALUES (2, 141, 0, NULL, '2021-04-16 16:59:49', NULL, '2021-04-16 16:59:49', 2635);
INSERT INTO `role_permission_ref` VALUES (2, 142, 0, NULL, '2021-04-16 16:59:49', NULL, '2021-04-16 16:59:49', 2636);
INSERT INTO `role_permission_ref` VALUES (2, 144, 0, NULL, '2021-04-16 16:59:49', NULL, '2021-04-16 16:59:49', 2637);
INSERT INTO `role_permission_ref` VALUES (2, 145, 0, NULL, '2021-04-16 16:59:49', NULL, '2021-04-16 16:59:49', 2638);
INSERT INTO `role_permission_ref` VALUES (2, 132, 0, NULL, '2021-04-16 16:59:49', NULL, '2021-04-16 16:59:49', 2639);
INSERT INTO `role_permission_ref` VALUES (2, 143, 0, NULL, '2021-04-16 16:59:49', NULL, '2021-04-16 16:59:49', 2640);
INSERT INTO `role_permission_ref` VALUES (2, 146, 0, NULL, '2021-04-16 16:59:49', NULL, '2021-04-16 16:59:49', 2641);
INSERT INTO `role_permission_ref` VALUES (2, 134, 0, NULL, '2021-04-16 16:59:49', NULL, '2021-04-16 16:59:49', 2642);
INSERT INTO `role_permission_ref` VALUES (2, 157, 0, NULL, '2021-04-16 16:59:49', NULL, '2021-04-16 16:59:49', 2643);
INSERT INTO `role_permission_ref` VALUES (2, 158, 0, NULL, '2021-04-16 16:59:49', NULL, '2021-04-16 16:59:49', 2644);
INSERT INTO `role_permission_ref` VALUES (2, 159, 0, NULL, '2021-04-16 16:59:49', NULL, '2021-04-16 16:59:49', 2645);
INSERT INTO `role_permission_ref` VALUES (2, 136, 0, NULL, '2021-04-16 16:59:49', NULL, '2021-04-16 16:59:49', 2646);
INSERT INTO `role_permission_ref` VALUES (2, 135, 0, NULL, '2021-04-16 16:59:49', NULL, '2021-04-16 16:59:49', 2647);
INSERT INTO `role_permission_ref` VALUES (2, 190, 0, NULL, '2021-04-16 16:59:49', NULL, '2021-04-16 16:59:49', 2648);
INSERT INTO `role_permission_ref` VALUES (2, 191, 0, NULL, '2021-04-16 16:59:49', NULL, '2021-04-16 16:59:49', 2649);
INSERT INTO `role_permission_ref` VALUES (2, 192, 0, NULL, '2021-04-16 16:59:49', NULL, '2021-04-16 16:59:49', 2650);
INSERT INTO `role_permission_ref` VALUES (2, 193, 0, NULL, '2021-04-16 16:59:49', NULL, '2021-04-16 16:59:49', 2651);
INSERT INTO `role_permission_ref` VALUES (2, 194, 0, NULL, '2021-04-16 16:59:49', NULL, '2021-04-16 16:59:49', 2652);
INSERT INTO `role_permission_ref` VALUES (2, 195, 0, NULL, '2021-04-16 16:59:49', NULL, '2021-04-16 16:59:49', 2653);
INSERT INTO `role_permission_ref` VALUES (2, 165, 0, NULL, '2021-04-16 16:59:49', NULL, '2021-04-16 16:59:49', 2654);
INSERT INTO `role_permission_ref` VALUES (2, 166, 0, NULL, '2021-04-16 16:59:49', NULL, '2021-04-16 16:59:49', 2655);
INSERT INTO `role_permission_ref` VALUES (2, 167, 0, NULL, '2021-04-16 16:59:49', NULL, '2021-04-16 16:59:49', 2656);
INSERT INTO `role_permission_ref` VALUES (2, 168, 0, NULL, '2021-04-16 16:59:49', NULL, '2021-04-16 16:59:49', 2657);
INSERT INTO `role_permission_ref` VALUES (2, 169, 0, NULL, '2021-04-16 16:59:49', NULL, '2021-04-16 16:59:49', 2658);
INSERT INTO `role_permission_ref` VALUES (2, 170, 0, NULL, '2021-04-16 16:59:49', NULL, '2021-04-16 16:59:49', 2659);
INSERT INTO `role_permission_ref` VALUES (2, 171, 0, NULL, '2021-04-16 16:59:49', NULL, '2021-04-16 16:59:49', 2660);
INSERT INTO `role_permission_ref` VALUES (2, 172, 0, NULL, '2021-04-16 16:59:49', NULL, '2021-04-16 16:59:49', 2661);
INSERT INTO `role_permission_ref` VALUES (2, 173, 0, NULL, '2021-04-16 16:59:49', NULL, '2021-04-16 16:59:49', 2662);
INSERT INTO `role_permission_ref` VALUES (2, 174, 0, NULL, '2021-04-16 16:59:49', NULL, '2021-04-16 16:59:49', 2663);
INSERT INTO `role_permission_ref` VALUES (2, 120, 0, NULL, '2021-04-16 16:59:49', NULL, '2021-04-16 16:59:49', 2664);
INSERT INTO `role_permission_ref` VALUES (2, 82, 0, NULL, '2021-04-16 16:59:49', NULL, '2021-04-16 16:59:49', 2665);
INSERT INTO `role_permission_ref` VALUES (2, 83, 0, NULL, '2021-04-16 16:59:49', NULL, '2021-04-16 16:59:49', 2666);
COMMIT;

-- ----------------------------
-- Table structure for tag
-- ----------------------------
DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `tag_name` varchar(100) NOT NULL COMMENT '标签名称',
  `del_flag` int(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `create_by` varchar(20) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(20) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of tag
-- ----------------------------
BEGIN;
INSERT INTO `tag` VALUES (36, '视频', 0, NULL, '2020-03-11 21:47:11', NULL, '2020-03-11 21:47:11');
INSERT INTO `tag` VALUES (37, 'Java', 0, NULL, '2020-03-12 18:10:56', NULL, '2020-03-12 18:10:56');
INSERT INTO `tag` VALUES (38, '安卓', 0, NULL, '2020-03-12 18:10:56', NULL, '2020-03-12 18:10:56');
INSERT INTO `tag` VALUES (39, 'Kotlin', 0, NULL, '2020-03-12 18:10:56', NULL, '2020-03-12 18:10:56');
INSERT INTO `tag` VALUES (40, '谷歌', 0, NULL, '2020-03-12 18:10:56', NULL, '2020-03-12 18:10:56');
INSERT INTO `tag` VALUES (41, 'AI', 0, NULL, '2020-03-12 18:12:20', NULL, '2020-03-12 18:12:20');
INSERT INTO `tag` VALUES (42, '人脸识别', 0, NULL, '2020-03-12 18:12:20', NULL, '2020-03-12 18:12:20');
INSERT INTO `tag` VALUES (43, '人脸搜索', 0, NULL, '2020-03-12 18:12:21', NULL, '2020-03-12 18:12:21');
INSERT INTO `tag` VALUES (44, 'Oracle', 0, NULL, '2020-03-12 18:13:52', NULL, '2020-03-12 18:13:52');
INSERT INTO `tag` VALUES (45, '金融', 0, NULL, '2020-03-12 18:13:52', NULL, '2020-03-12 18:13:52');
INSERT INTO `tag` VALUES (46, '陆金所', 0, NULL, '2020-03-12 18:13:52', NULL, '2020-03-12 18:13:52');
INSERT INTO `tag` VALUES (47, '算法', 0, NULL, '2020-03-12 18:15:41', NULL, '2020-03-12 18:15:41');
INSERT INTO `tag` VALUES (48, 'Python', 0, NULL, '2020-03-12 18:17:24', NULL, '2020-03-12 18:17:24');
INSERT INTO `tag` VALUES (49, '工具', 0, NULL, '2020-03-12 18:17:24', NULL, '2020-03-12 18:17:24');
INSERT INTO `tag` VALUES (50, '大数据', 0, NULL, '2020-03-12 18:20:02', NULL, '2020-03-12 18:20:02');
INSERT INTO `tag` VALUES (51, '高并发', 0, NULL, '2020-03-12 18:20:02', NULL, '2020-03-12 18:20:02');
INSERT INTO `tag` VALUES (52, '后端开发', 0, NULL, '2020-03-12 18:20:51', NULL, '2020-03-12 18:20:51');
INSERT INTO `tag` VALUES (53, '序列化', 0, NULL, '2020-03-12 18:20:51', NULL, '2020-03-12 18:20:51');
INSERT INTO `tag` VALUES (54, '机器学习', 0, NULL, '2020-03-12 18:21:57', NULL, '2020-03-12 18:21:57');
INSERT INTO `tag` VALUES (55, 'TensorFlow', 0, NULL, '2020-03-12 18:21:57', NULL, '2020-03-12 18:21:57');
INSERT INTO `tag` VALUES (56, '腾讯', 0, NULL, '2020-03-12 18:23:16', NULL, '2020-03-12 18:23:16');
INSERT INTO `tag` VALUES (57, '开源', 0, NULL, '2020-03-12 18:23:16', NULL, '2020-03-12 18:23:16');
INSERT INTO `tag` VALUES (58, 'Druid2', 0, NULL, '2020-03-12 18:24:02', NULL, '2020-08-17 22:34:50');
INSERT INTO `tag` VALUES (59, '推特', 0, NULL, '2020-03-12 18:24:02', NULL, '2020-03-12 18:24:02');
INSERT INTO `tag` VALUES (60, 'CPU', 0, NULL, '2020-03-12 18:25:04', NULL, '2020-03-12 18:25:04');
INSERT INTO `tag` VALUES (61, 'GPU', 0, NULL, '2020-03-12 18:25:04', NULL, '2020-03-12 18:25:04');
INSERT INTO `tag` VALUES (62, 'Twitter', 0, NULL, '2020-04-03 23:01:00', NULL, '2020-04-03 23:01:00');
INSERT INTO `tag` VALUES (63, '1', 1, NULL, '2020-04-11 21:35:42', NULL, '2020-04-11 22:47:22');
INSERT INTO `tag` VALUES (64, '测试', 0, NULL, '2020-08-17 22:19:15', NULL, '2020-08-17 22:19:15');
INSERT INTO `tag` VALUES (65, '2', 1, NULL, '2020-08-17 22:30:32', NULL, '2020-08-17 22:34:44');
INSERT INTO `tag` VALUES (66, '2', 1, NULL, '2020-08-17 22:58:47', NULL, '2021-03-05 17:17:49');
COMMIT;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `login_enable` varchar(10) DEFAULT NULL COMMENT '是否允许登录',
  `login_error` int(11) DEFAULT NULL COMMENT '登录失败错误次数',
  `login_last` datetime DEFAULT NULL COMMENT '上传登录时间',
  `user_avatar` varchar(255) DEFAULT NULL COMMENT '头像',
  `user_desc` varchar(255) DEFAULT NULL COMMENT '个人签名',
  `user_display_name` varchar(255) DEFAULT NULL COMMENT '昵称',
  `user_email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `user_name` varchar(100) DEFAULT NULL COMMENT '用户名',
  `user_pass` varchar(255) DEFAULT NULL COMMENT '密码：md5加盐多次',
  `status` int(1) DEFAULT NULL COMMENT '状态',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(255) DEFAULT 'admin' COMMENT '创建人',
  `update_by` varchar(255) DEFAULT 'admin' COMMENT '更新人',
  `del_flag` int(1) DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
INSERT INTO `user` VALUES (1, 'true', 0, '2021-04-16 19:06:04', '/static/images/avatar/1.jpeg', '人生得意须尽欢', '管理员', '847064370@qq.com', 'admin', 'a021a665f503979c06f50b8de66a4218', 0, '2019-01-24 00:07:33', '2021-02-26 00:30:30', 'admin', 'admin', 0);
INSERT INTO `user` VALUES (2, 'true', 0, '2020-08-18 23:41:48', '/static/images/avatar/2.jpeg', '11', '马云', '123@qq.com', 'mayun', 'a021a665f503979c06f50b8de66a4218', 0, '2020-02-05 17:37:43', '2021-02-26 00:30:26', 'admin', 'admin', 0);
INSERT INTO `user` VALUES (3, 'true', 0, '2021-04-16 19:08:18', '/static/images/avatar/3.jpeg', '', '张三', '121113@qq.com', 'zhangsan', 'a021a665f503979c06f50b8de66a4218', 0, '2020-02-08 13:22:22', '2021-03-05 16:48:08', 'admin', 'admin', 0);
INSERT INTO `user` VALUES (7, 'true', 0, '2020-03-08 14:21:48', '/static/images/avatar/7.jpeg', '', 'mayun2', '123456@mayun.com', 'mayun2', 'a021a665f503979c06f50b8de66a4218', 0, '2020-03-08 14:21:05', '2021-03-05 16:49:25', 'admin', 'admin', 0);
INSERT INTO `user` VALUES (8, 'true', 0, '2021-04-16 18:58:48', '/static/images/avatar/8.jpeg', NULL, 'mahuateng', '111@qq.com', 'mahuateng', 'a021a665f503979c06f50b8de66a4218', 0, '2020-03-09 13:24:42', '2021-03-05 16:49:25', 'admin', 'admin', 0);
INSERT INTO `user` VALUES (9, 'true', 0, '2021-04-16 18:44:05', '/static/images/avatar/9.jpeg', NULL, 'zhaoyun', '847064373@qq.com', 'zhaoyun', 'a021a665f503979c06f50b8de66a4218', 0, '2020-03-11 21:27:11', '2021-03-05 16:49:25', 'admin', 'admin', 0);
INSERT INTO `user` VALUES (10, 'true', 0, '2020-03-11 21:41:01', '/static/images/avatar/10.jpeg', NULL, 'wangwu', 'wangwu@qq.com', 'wangwu', 'a021a665f503979c06f50b8de66a4218', 0, '2020-03-11 21:38:51', '2021-03-05 16:49:25', 'admin', 'admin', 0);
INSERT INTO `user` VALUES (11, 'true', 0, NULL, '/static/images/avatar/11.jpeg', NULL, 'wangwu2', '1234562@mayun.com', 'wangwu2', 'a021a665f503979c06f50b8de66a4218', 0, '2020-03-11 21:40:54', '2021-03-05 16:49:25', 'admin', 'admin', 0);
INSERT INTO `user` VALUES (12, 'true', 0, '2020-09-20 21:21:14', '/static/images/avatar/12.jpeg', '', 'zhangfei', '123456@zhang.com', 'zhangfei', 'a021a665f503979c06f50b8de66a4218', 0, '2020-03-11 21:41:55', '2021-03-05 16:49:25', 'admin', 'admin', 0);
INSERT INTO `user` VALUES (21, 'true', 0, NULL, '/static/images/avatar/21.jpeg', NULL, 'admin11', '123111@qq.com', 'admin11', 'a021a665f503979c06f50b8de66a4218', 0, '2020-08-17 22:56:24', '2021-03-05 16:49:25', 'admin', 'admin', 0);
INSERT INTO `user` VALUES (22, 'true', 0, NULL, '/static/images/avatar/22.jpeg', NULL, 'admin1111', '1231121@qq.com', 'admin1111', 'a021a665f503979c06f50b8de66a4218', 0, '2020-08-17 22:57:36', '2021-03-05 16:49:25', 'admin', 'admin', 0);
INSERT INTO `user` VALUES (23, 'true', 0, '2020-08-18 23:46:02', '/static/images/avatar/23.jpeg', '', 'mayun33', 'mayun33@qq.com', 'mayun33', 'a021a665f503979c06f50b8de66a4218', 0, '2020-08-18 23:42:11', '2021-03-05 16:49:25', 'admin', 'admin', 0);
COMMIT;

-- ----------------------------
-- Table structure for user_role_ref
-- ----------------------------
DROP TABLE IF EXISTS `user_role_ref`;
CREATE TABLE `user_role_ref` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `del_flag` int(1) DEFAULT '0' COMMENT '删除标志',
  `create_by` varchar(20) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(20) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `role_id` (`role_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_role_ref_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_role_ref_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of user_role_ref
-- ----------------------------
BEGIN;
INSERT INTO `user_role_ref` VALUES (2, 2, 0, NULL, '2020-02-05 17:37:43', NULL, '2020-02-05 17:37:43', 2);
INSERT INTO `user_role_ref` VALUES (1, 1, 0, NULL, '2020-02-08 13:56:55', NULL, '2020-02-08 13:56:55', 4);
INSERT INTO `user_role_ref` VALUES (3, 2, 0, NULL, '2020-02-08 18:53:44', NULL, '2020-02-08 18:53:44', 10);
INSERT INTO `user_role_ref` VALUES (7, 2, 0, NULL, '2020-03-08 14:21:05', NULL, '2020-03-08 14:21:05', 11);
INSERT INTO `user_role_ref` VALUES (8, 2, 0, NULL, '2020-03-09 13:24:42', NULL, '2020-03-09 13:24:42', 12);
INSERT INTO `user_role_ref` VALUES (9, 2, 0, NULL, '2020-03-11 21:27:11', NULL, '2020-03-11 21:27:11', 13);
INSERT INTO `user_role_ref` VALUES (10, 2, 0, NULL, '2020-03-11 21:38:51', NULL, '2020-03-11 21:38:51', 14);
INSERT INTO `user_role_ref` VALUES (11, 2, 0, NULL, '2020-03-11 21:40:54', NULL, '2020-03-11 21:40:54', 15);
INSERT INTO `user_role_ref` VALUES (12, 2, 0, NULL, '2020-08-17 22:42:53', NULL, '2020-08-17 22:42:53', 21);
INSERT INTO `user_role_ref` VALUES (22, 2, 0, NULL, '2020-08-17 22:57:36', NULL, '2020-08-17 22:57:36', 22);
INSERT INTO `user_role_ref` VALUES (23, 2, 0, NULL, '2021-01-05 18:06:01', NULL, '2021-01-05 18:06:01', 26);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
