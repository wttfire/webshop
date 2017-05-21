/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : shop

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2017-05-17 15:08:33
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id`          smallint(8)  NOT NULL AUTO_INCREMENT COMMENT '管理员编号',
  `name`        char(25)     NOT NULL  COMMENT '管理员名称',
  `pwd`         char(32)     NOT NULL  COMMENT '密码',
  `salt`        char(32)     NOT NULL  COMMENT '加密后缀',
  `sex`         tinyint(1)   DEFAULT 1  COMMENT '性别 0未知1男2女',
  `mobile`      char(11)     DEFAULT ''  COMMENT '手机',
  `login_count` smallint(8)  DEFAULT 0  COMMENT '登陆次数',
  `last_time`   datetime     DEFAULT '0000-00-00 00:00:00'  COMMENT '最后一次登录时间',
  `last_ip`     char(15)     DEFAULT ''  COMMENT '最后一次登录ip',
  `is_use`      tinyint(1)   DEFAULT 1  COMMENT '是否启用',
  `ad_time`     datetime     DEFAULT '0000-00-00 00:00:00'  COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管理员表';

-- ----------------------------
-- Records of admin
-- ----------------------------

-- ----------------------------
-- Table structure for `banner`
-- ----------------------------
DROP TABLE IF EXISTS `banner`;
CREATE TABLE `banner` (
  `ban_id`      smallint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT 'banner编号',
  `type`        smallint(8)  DEFAULT ''  COMMENT '类型 1首页banner 2首页楼层banner 3其他banner',
  `title`       smallint(8)  DEFAULT ''  COMMENT '标题',
  `img_url`     smallint(8)  DEFAULT ''  COMMENT '图片地址',
  `sort`        smallint(8)  DEFAULT ''  COMMENT '排序',
  `link_url`    smallint(8)  DEFAULT ''  COMMENT '链接地址',
  PRIMARY KEY (`ban_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='banner表';

-- ----------------------------
-- Records of banner
-- ----------------------------

-- ----------------------------
-- Table structure for `collect`
-- ----------------------------
DROP TABLE IF EXISTS `collect`;
CREATE TABLE `collect` (
  `collect_id`  smallint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '收藏编号',
  `user_id`     smallint(8)  NOT NULL  COMMENT '用户编号',
  `pro_id`      smallint(8)  NOT NULL  COMMENT '商品编号',
  `is_use`      tinyint(1)   DEFAULT 1  COMMENT '是否收藏 1收藏 0取消',
  `ad_time`     datetime     NOT NULL  COMMENT '添加时间',
  PRIMARY KEY (`collect_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品收藏表';

-- ----------------------------
-- Records of collect
-- ----------------------------

-- ----------------------------
-- Table structure for `column`
-- ----------------------------
DROP TABLE IF EXISTS `column`;
CREATE TABLE `column` (
  `column_id` smallint(4) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类编号',
  `parent_id` smallint(4) DEFAULT 0 COMMENT '父级分类',
  `name`      char(25)    NOT NULL COMMENT '分类名称',
  `sort`      smallint(2) NOT NULL COMMENT '分类排序',
  `is_use`    tinyint(1)  DEFAULT 1 COMMENT '是否启用',
  `is_hot`    tinyint(1)  DEFAULT 0 COMMENT '是否热搜',
  PRIMARY KEY (`column_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品分类表';

-- ----------------------------
-- Records of column
-- ----------------------------

-- ----------------------------
-- Table structure for `config`
-- ----------------------------
DROP TABLE IF EXISTS `config`;
CREATE TABLE `config` (
  `con_id`    smallint(2) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置项',
  `title`     smallint(2)  NOT NULL COMMENT '配置说明',
  `content`   varchar(255) NOT NULL COMMENT '配置内容',
  `adtime`    datetime     NOT NULL COMMENT '修改时间',
  -- `doadmin` smallint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '域名',
  -- `keyword` smallint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '关键字',
  -- `title` smallint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '标题',
  -- `footer` smallint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '网站底部说明',
  PRIMARY KEY (`con_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='网站配置表';

-- ----------------------------
-- Records of config
-- ----------------------------

-- ----------------------------
-- Table structure for `consume_log`
-- ----------------------------
DROP TABLE IF EXISTS `consume_log`;
CREATE TABLE `consume_log` (
  `log_id`    smallint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '日志id',
  `order_no`  char(20)  DEFAULT '' COMMENT '订单',
  `user_id`   char(20)  NOT NULL COMMENT '用户',
  `type`      char(20)  NOT NULL COMMENT '消费类型 1购买2充值',
  `money`     float(20) DEFAULT 0 COMMENT '金额',
  `adtime`    datetime  NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户消费记录表';

-- ----------------------------
-- Records of consume_log
-- ----------------------------

-- ----------------------------
-- Table structure for `feedback`
-- ----------------------------
DROP TABLE IF EXISTS `feedback`;
CREATE TABLE `feedback` (
  `feed_id`   smallint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '留言id',
  `title`     varchar(255) NOT NULL COMMENT '标题',
  `content`   varchar(255) NOT NULL COMMENT '内容',
  `adtime`    datetime     NOT NULL COMMENT '内容',
  PRIMARY KEY (`feed_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='留言表';

-- ----------------------------
-- Records of feedback
-- ----------------------------

-- ----------------------------
-- Table structure for `index_column`
-- ----------------------------
DROP TABLE IF EXISTS `index_column`;
CREATE TABLE `index_column` (
  `col_id`    smallint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '首页分类编号',
  `title`     varchar(20)          NOT NULL  COMMENT '标题',
  PRIMARY KEY (`col_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='首页分类表';

-- ----------------------------
-- Records of index_column
-- ----------------------------

-- ----------------------------
-- Table structure for `news`
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `new_id`    smallint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '新闻id',
  `title`     smallint(8) NOT NULL COMMENT '标题',
  `content`   smallint(8) NOT NULL COMMENT '内容',
  `ad_time`   datetime    NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`new_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='新闻表';

-- ----------------------------
-- Records of news
-- ----------------------------

-- ----------------------------
-- Table structure for `product`
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `pro_id`      smallint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品编号',
  `title`       varchar(255)  DEFAULT ''  COMMENT '商品标题',
  `desc`        text          DEFAULT ''  COMMENT '商品简介',
  `price`       float(20)     DEFAULT ''  COMMENT '价格',
  `count`       smallint(8)   DEFAULT 0  COMMENT '库存',
  `sell_count`  smallint(8)   DEFAULT 0  COMMENT '已售数量',
  `is_hot`      tinyint(1)    DEFAULT 0  COMMENT '是否热卖',
  `is_favor`    tinyint(1)    DEFAULT 0  COMMENT '是否优惠',
  `is_discount` tinyint(1)    DEFAULT 0  COMMENT '是否特价',
  `discount_price` float(8)   NOT NULL  COMMENT '特价价格',
  `discount_btime` datetime   NOT NULL  COMMENT '特价开始时间',
  `discount_etime` datetime   NOT NULL  COMMENT '特价截止时间',
  `discount`    float(5)      DEFAULT 10  COMMENT '特价折扣',
  `is_up`       tinyint(1)    DEFAULT 1  COMMENT '是否上架',
  `pro_img`     varchar(255)  DEFAULT ''  COMMENT '展示图片',
  `ad_time`     datetime      DEFAULT '0000-00-00 00:00:00'  COMMENT '添加时间',
  PRIMARY KEY (`pro_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品表';

-- ----------------------------
-- Records of product
-- ----------------------------

-- ----------------------------
-- Table structure for `pro_desc_img`
-- ----------------------------
DROP TABLE IF EXISTS `pro_desc_img`;
CREATE TABLE `pro_desc_img` (
  `img_id`      smallint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '图片编号',
  `pro_id`      smallint(8)  NOT NULL COMMENT '商品编号',
  `img_url`     varchar(255) NOT NULL COMMENT '商品图片地址',
  `is_use`      tinyint(1)   DEFAULT 1 COMMENT '是否启用',
  PRIMARY KEY (`img_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品描述表';

-- ----------------------------
-- Records of pro_desc_img
-- ----------------------------

-- ----------------------------
-- Table structure for `pro_model`
-- ----------------------------
DROP TABLE IF EXISTS `pro_model`;
CREATE TABLE `pro_model` (
  `model_id`    smallint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '型号编号',
  PRIMARY KEY (`model_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品型号表';

-- ----------------------------
-- Records of pro_model
-- ----------------------------

-- ----------------------------
-- Table structure for `pro_order`
-- ----------------------------
DROP TABLE IF EXISTS `pro_order`;
CREATE TABLE `pro_order` (
  `order_id`    smallint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '订单编号',
  `order_no`    char(25)     NOT NULL COMMENT '订单单号',
  `user_id`     char(25)     NOT NULL COMMENT '用户编号',
  `pro_id`      char(25)     NOT NULL COMMENT '商品编号',
  `money`       float(20)    DEFAULT 0 COMMENT '总金额',
  `ad_time`     datetime     DEFAULT '0000-00-00 00:00:00' COMMENT '下单时间',
  `is_pay`      tinyint(1)   DEFAULT 0 COMMENT '是否支付',
  `order_status` tinyint(1)  DEFAULT 0 COMMENT '订单状态',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单表';

-- ----------------------------
-- Records of pro_order
-- ----------------------------

-- ----------------------------
-- Table structure for `repair`
-- ----------------------------
DROP TABLE IF EXISTS `repair`;
CREATE TABLE `repair` (
  `rep_id`      smallint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '维修编号',
  `user_id`     smallint(8)  NOT NULL COMMENT '用户编号',
  `pro_id`      smallint(8)  NOT NULL COMMENT '商品编号',
  `ad_time`     datetime     DEFAULT '0000-00-00 00:00:00' COMMENT '申请时间',
  `rep_status`  tinyint(1)   DEFAULT 0 COMMENT '维修状态',
  PRIMARY KEY (`rep_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='维修表';

-- ----------------------------
-- Records of repair
-- ----------------------------

-- ----------------------------
-- Table structure for `shipping_address`
-- ----------------------------
DROP TABLE IF EXISTS `shipping_address`;
CREATE TABLE `shipping_address` (
  `add_id`      smallint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '收货地址编号',
  `user_id`     smallint(8)  NOT NULL COMMENT '用户id',
  `name`        char(25)     NOT NULL COMMENT '姓名',
  `mobile`      smallint(8)  NOT NULL COMMENT '电话',
  `province`    int(4)       DEFAULT '' COMMENT '省',
  `city`        int(4)       DEFAULT '' COMMENT '市',
  `district`    int(4)       DEFAULT '' COMMENT '区',
  `address`     varchar(255) DEFAULT '' COMMENT '地址',
  `zipcode`     smallint(8)  DEFAULT '' COMMENT '邮编',
  PRIMARY KEY (`add_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='收货地址表';

-- ----------------------------
-- Records of shipping_address
-- ----------------------------

-- ----------------------------
-- Table structure for `shopping_cart`
-- ----------------------------
DROP TABLE IF EXISTS `shopping_cart`;
CREATE TABLE `shopping_cart` (
  `cart_id`     smallint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '购物车编号',
  `user_id`     smallint(8) NOT NULL COMMENT '用户id',
  `pro_id`      smallint(8) NOT NULL COMMENT '商品id',
  `count`       smallint(8) DEFAULT 1 COMMENT '商品数量',
  PRIMARY KEY (`cart_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='购物车表';

-- ----------------------------
-- Records of shopping_cart
-- ----------------------------

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id`     smallint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `nike`        char(20)     NOT NULL COMMENT '昵称',
  `mobile`      char(11)     DEFAULT '' COMMENT '手机号',
  `pwd`         char(32)     DEFAULT '' COMMENT '密码',
  `pay_pwd`     char(32)     DEFAULT '' COMMENT '支付密码',
  `salt`        smallint(4)  DEFAULT '' COMMENT '加密后缀',
  `sex`         tinyint(1)   DEFAULT 0 COMMENT '性别 1男2女0未知',
  `province`    int(4)       DEFAULT '' COMMENT '省',
  `city`        int(4)       DEFAULT '' COMMENT '市',
  `district`    int(4)       DEFAULT '' COMMENT '区',
  `address`     varchar(255) DEFAULT '' COMMENT '地址',
  `user_img`    varchar(255) DEFAULT '' COMMENT '头像',
  `level`       char(20)     DEFAULT 1 COMMENT '会员等级',
  `money`       float(20)    DEFAULT 0 COMMENT '余额',
  `integral`    smallint(8)  DEFAULT 0 COMMENT '积分',
  `ad_time`     datetime     DEFAULT '0000-00-00 00:00:00' COMMENT '注册时间',
  `last_time`   datetime     DEFAULT '0000-00-00 00:00:00' COMMENT '最后登录时间',
  `last_ip`     char(15)     DEFAULT '' COMMENT '最后登录ip',

  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of user
-- ----------------------------
