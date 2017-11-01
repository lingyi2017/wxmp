DROP TABLE IF EXISTS qyfw_service_category;
CREATE TABLE qyfw_service_category
(
  id varchar(64) NOT NULL COMMENT '编号',
  parent_id varchar(64) NOT NULL COMMENT '父级编号',
  parent_ids varchar(2000) NOT NULL COMMENT '所有父级编号',
  name varchar(255) NOT NULL COMMENT '分类名称',
  is_enable bit(1) DEFAULT 1 COMMENT '是否显示（0：不显示；1：显示）',
  is_important bit(1) DEFAULT 0 COMMENT '是否重点显示（0：否；1：是）',
  sort int(11) DEFAULT 1 COMMENT '排序号',
  wx_menu_id varchar(255) COMMENT '微信菜单ID',
  del_flag char(1) DEFAULT '0' NOT NULL COMMENT '删除标记（0：正常；1：删除）',
  PRIMARY KEY (id)
) COMMENT = '服务分类';

/*DROP TABLE IF EXISTS qyfw_order;
CREATE TABLE `qyfw_order` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `contact` varchar(64) DEFAULT NULL COMMENT '联系人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `money` decimal(19,2) DEFAULT NULL COMMENT '支付金额',
  `phone` varchar(255) DEFAULT NULL COMMENT '联系方式',
  `resp` varchar(255) DEFAULT NULL COMMENT '处理反馈',
  `status` varchar(1) DEFAULT '1' COMMENT '订单状态',
  `basic_service_id` varchar(64) NOT NULL COMMENT '所属服务',
  `customer_id` varchar(64) DEFAULT NULL COMMENT '所属客户',
  PRIMARY KEY (`id`)
) COMMENT = '订单表';*/

-- 服务分类顶级目录初始化
INSERT INTO `qyfw_service_category` VALUES ('1', '0', '0,', '顶级分类', 1, 0, 1, null, 0);

-- 字典数据初始化[100, )
INSERT INTO `sys_dict` VALUES ('100', '隐藏', 'false', 'service_category_is_enable', '是否显示', '20', 'admin', now(), 'admin', now(), null, '0');
INSERT INTO `sys_dict` VALUES ('101', '显示', 'true', 'service_category_is_enable', '是否显示', '10', 'admin', now(), 'admin', now(), null, '0');

INSERT INTO `sys_dict` VALUES ('102', '一般显示', 'false', 'service_category_is_important', '是否重点显示', '10', 'admin', now(), 'admin', now(), null, '0');
INSERT INTO `sys_dict` VALUES ('103', '重点显示', 'true', 'service_category_is_important', '是否重点显示', '20', 'admin', now(), 'admin', now(), null, '0');


INSERT INTO `sys_dict` VALUES ('104', '企业', '1', 'customer_type', '客户性质', '10', 'admin', now(), 'admin', now(), null, '0');
INSERT INTO `sys_dict` VALUES ('105', '个人', '2', 'customer_type', '客户性质', '20', 'admin', now(), 'admin', now(), null, '0');

INSERT INTO `sys_dict` VALUES ('106', '已购买', '1', 'order_status', '订单状态', '10', 'admin', now(), 'admin', now(), null, '0');
INSERT INTO `sys_dict` VALUES ('107', '结束', '2', 'order_status', '订单状态', '20', 'admin', now(), 'admin', now(), null, '0');

INSERT INTO `sys_dict` VALUES ('108', '是', '1', 'public_yesorno', '是否', '10', 'admin', now(), 'admin', now(), null, '0');
INSERT INTO `sys_dict` VALUES ('109', '否', '0', 'public_yesorno', '是否', '20', 'admin', now(), 'admin', now(), null, '0');