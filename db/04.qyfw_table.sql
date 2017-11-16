-- 字典数据初始化[100, )
INSERT INTO `sys_dict` VALUES ('100', '隐藏', 'false', 'service_category_is_enable', '是否显示', '20', 'admin', now(), 'admin', now(), null, '0');
INSERT INTO `sys_dict` VALUES ('101', '显示', 'true', 'service_category_is_enable', '是否显示', '10', 'admin', now(), 'admin', now(), null, '0');

INSERT INTO `sys_dict` VALUES ('102', '一般显示', 'false', 'service_category_is_important', '是否重点显示', '10', 'admin', now(), 'admin', now(), null, '0');
INSERT INTO `sys_dict` VALUES ('103', '重点显示', 'true', 'service_category_is_important', '是否重点显示', '20', 'admin', now(), 'admin', now(), null, '0');


INSERT INTO `sys_dict` VALUES ('104', '企业', '2', 'customer_type', '客户性质', '10', 'admin', now(), 'admin', now(), null, '0');
INSERT INTO `sys_dict` VALUES ('105', '个人', '1', 'customer_type', '客户性质', '20', 'admin', now(), 'admin', now(), null, '0');

INSERT INTO `sys_dict` VALUES ('106', '已购买', '1', 'order_status', '订单状态', '10', 'admin', now(), 'admin', now(), null, '0');
INSERT INTO `sys_dict` VALUES ('107', '结束', '2', 'order_status', '订单状态', '20', 'admin', now(), 'admin', now(), null, '0');

INSERT INTO `sys_dict` VALUES ('108', '是', '1', 'public_yesorno', '是否', '10', 'admin', now(), 'admin', now(), null, '0');
INSERT INTO `sys_dict` VALUES ('109', '否', '0', 'public_yesorno', '是否', '20', 'admin', now(), 'admin', now(), null, '0');

INSERT INTO `sys_dict` VALUES ('110', '未处理', '1', 'consulting_status', '咨询状态', '10', 'admin', now(), 'admin', now(), null, '0');
INSERT INTO `sys_dict` VALUES ('111', '已反馈', '2', 'consulting_status', '咨询状态', '20', 'admin', now(), 'admin', now(), null, '0');

-- 菜单初始化[100, )
INSERT INTO `sys_menu` VALUES ('100', '1', '0,1,', '企业服务', null, null, null, '300', '1', '0', null, null, null, null, null, null, '0');

INSERT INTO `sys_menu` VALUES ('101', '100', '0,1,100,', '服务管理', null, null, null, '100', '1', '0', null, null, null, null, null, null, '0');
INSERT INTO `sys_menu` VALUES ('102', '101', '0,1,100,101,', '服务分类', '/qyfw/serviceCategory/', null, 'list-alt', '10', '1', '0', null, '1', now(), '1', now(), null, '0');
INSERT INTO `sys_menu` VALUES ('103', '102', '0,1,100,101,102,', '查看', null, null, null, '10', '0', '0', 'qyfw:serviceCategory:view', '1', now(), '1', now(), null, '0');
INSERT INTO `sys_menu` VALUES ('104', '102', '0,1,100,101,102,', '修改', null, null, null, '20', '0', '0', 'qyfw:serviceCategory:edit', '1', now(), '1', now(), null, '0');

INSERT INTO `sys_menu` VALUES ('105', '101', '0,1,100,101,', '服务材料', '/qyfw/material/', null, 'list-alt', '20', '1', '0', null, '1', now(), '1', now(), null, '0');
INSERT INTO `sys_menu` VALUES ('106', '105', '0,1,100,101,105,', '查看', null, null, null, '10', '0', '0', 'qyfw:material:view', '1', now(), '1', now(), null, '0');
INSERT INTO `sys_menu` VALUES ('107', '105', '0,1,100,101,105,', '修改', null, null, null, '20', '0', '0', 'qyfw:material:edit', '1', now(), '1', now(), null, '0');

INSERT INTO `sys_menu` VALUES ('127', '101', '0,1,100,101,', '服务管理', '/qyfw/basicService/', null, 'list-alt', '30', '1', '0', null, '1', now(), '1', now(), null, '0');
INSERT INTO `sys_menu` VALUES ('128', '127', '0,1,100,101,127,', '查看', null, null, null, '10', '0', '0', 'qyfw:basicService:view', '1', now(), '1', now(), null, '0');
INSERT INTO `sys_menu` VALUES ('129', '127', '0,1,100,101,127,', '修改', null, null, null, '20', '0', '0', 'qyfw:basicService:edit', '1', now(), '1', now(), null, '0');

INSERT INTO `sys_menu` VALUES ('108', '100', '0,1,100,', '订单管理', null, null, null, '200', '1', '0', null, null, null, null, null, null, '0');
INSERT INTO `sys_menu` VALUES ('109', '108', '0,1,100,108,', '订单管理', '/qyfw/order/', null, 'list-alt', '10', '1', '0', null, '1', now(), '1', now(), null, '0');
INSERT INTO `sys_menu` VALUES ('110', '109', '0,1,100,108,109,', '查看', null, null, null, '10', '0', '0', 'qyfw:order:view', '1', now(), '1', now(), null, '0');
INSERT INTO `sys_menu` VALUES ('111', '109', '0,1,100,108,109,', '修改', null, null, null, '20', '0', '0', 'qyfw:order:edit', '1', now(), '1', now(), null, '0');
INSERT INTO `sys_menu` VALUES ('115', '108', '0,1,100,108,', '待办订单', '/qyfw/order/wait/list', null, 'list-alt', '30', '1', '0', null, '1', now(), '1', now(), null, '0');

INSERT INTO `sys_menu` VALUES ('117', '100', '0,1,100,', '咨询管理', null, null, null, '300', '1', '0', null, null, null, null, null, null, '0');
INSERT INTO `sys_menu` VALUES ('118', '117', '0,1,100,117,', '咨询管理', '/qyfw/consulting/', null, 'list-alt', '10', '1', '0', null, '1', now(), '1', now(), null, '0');
INSERT INTO `sys_menu` VALUES ('119', '118', '0,1,100,117,118,', '查看', null, null, null, '10', '0', '0', 'qyfw:consulting:view', '1', now(), '1', now(), null, '0');
INSERT INTO `sys_menu` VALUES ('120', '118', '0,1,100,117,118,', '修改', null, null, null, '20', '0', '0', 'qyfw:consulting:edit', '1', now(), '1', now(), null, '0');
INSERT INTO `sys_menu` VALUES ('121', '117', '0,1,100,117,', '待办咨询', '/qyfw/consulting/wait', null, 'list-alt', '20', '1', '0', null, '1', now(), '1', now(), null, '0');

INSERT INTO `sys_menu` VALUES ('123', '100', '0,1,100,', '客户管理', null, null, null, '400', '1', '0', null, null, null, null, null, null, '0');
INSERT INTO `sys_menu` VALUES ('124', '123', '0,1,100,123,', '客户管理', '/qyfw/customer/', null, 'list-alt', '10', '1', '0', null, '1', now(), '1', now(), null, '0');
INSERT INTO `sys_menu` VALUES ('125', '124', '0,1,100,123,124,', '查看', null, null, null, '10', '0', '0', 'qyfw:customer:view', '1', now(), '1', now(), null, '0');
INSERT INTO `sys_menu` VALUES ('126', '124', '0,1,100,123,124,', '修改', null, null, null, '20', '0', '0', 'qyfw:customer:edit', '1', now(), '1', now(), null, '0');

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
-- 服务分类顶级目录初始化
INSERT INTO `qyfw_service_category` VALUES ('1', '0', '0,', '顶级分类', 1, 0, 1, null, 0);

DROP TABLE IF EXISTS qyfw_order;
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
) COMMENT = '订单表';

