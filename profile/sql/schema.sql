-- ----------------------------
-- 图书表创建语句
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book`
(
    `id`          BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '图书 ID, 自增主键',
    `title`       VARCHAR(50)     NOT NULL DEFAULT '' COMMENT '图书标题',
    `author`      VARCHAR(30)     NOT NULL DEFAULT '' COMMENT '图书作者',
    `summary`     VARCHAR(1000)   NOT NULL DEFAULT '' COMMENT '图书概述',
    `image`       VARCHAR(255)    NOT NULL DEFAULT '' COMMENT '图书封面图 url',
    `create_time` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT '创建时间',
    `update_time` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '更新时间',
    `delete_time` DATETIME(3) DEFAULT NULL COMMENT '删除时间',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci
  COMMENT = '图书表';

-- ----------------------------
-- 添加图书表数据语句
-- ----------------------------
INSERT INTO `book`(`title`, `author`, `summary`, `image`) VALUES ('深入理解计算机系统', 'Randal E.Bryant', '从程序员的视角，看计算机系统！\n本书适用于那些想要写出更快、更可靠程序的程序员。通过掌握程序是如何映射到系统上，以及程序是如何执行的，读者能够更好的理解程序的行为为什么是这样的，以及效率低下是如何造成的。', 'https://img3.doubanio.com/lpic/s1470003.jpg');
INSERT INTO `book`(`title`, `author`, `summary`, `image`) VALUES ('C 程序设计语言', '(美) Brian W. Kernighan', '在计算机发展的历史上，没有哪一种程序设计语言像 C 语言这样应用广泛。本书原著即为 C 语言的设计者之一 Dennis M.Ritchie 和著名计算机科学家 Brian W.Kernighan 合著的一本介绍 C 语言的权威经典著作。', 'https://img3.doubanio.com/lpic/s1106934.jpg');

-- ----------------------------
-- 文件表
-- ----------------------------
DROP TABLE IF EXISTS `file`;
CREATE TABLE `file`
(
    `id`          BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '文件 ID, 自增主键',
    `path`        VARCHAR(500) NOT NULL COMMENT '文件路径',
    `type`        VARCHAR(10)  NOT NULL DEFAULT 'LOCAL' COMMENT '文件类型, LOCAL 表示本地, REMOTE 表示远程',
    `name`        VARCHAR(100) NOT NULL COMMENT '文件名称',
    `size`        INT(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '文件大小',
    `md5`         VARCHAR(40) NOT NULL DEFAULT '' COMMENT 'md5 值, 防止上传重复文件',
    `extension`   VARCHAR(50) NOT NULL DEFAULT '' COMMENT '扩展字段',
    `create_time` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT '创建时间',
    `update_time` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '更新时间',
    `delete_time` DATETIME(3) DEFAULT NULL COMMENT '删除时间',
    PRIMARY KEY (id),
    UNIQUE KEY md5_del_idx (md5, delete_time)
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci
  COMMENT = '文件表';