-- 菜单初始数据
INSERT INTO `sys_menu` VALUES ('100', '1', '0,1,', '订餐系统', null, null, 'user', '300', '1', '0', '', null, now(), 'admin', null, null, '0');
-- 菜单模块[101, 200)
INSERT INTO `sys_menu` VALUES ('101', '100', '0,1,100,', '菜单管理', null, null, null, '100', '1', '0', null, '1', now(), 'admin', now(), null, '0');
INSERT INTO `sys_menu` VALUES ('102', '101', '0,1,100,101,', '菜品管理', '/dcxt/dish/', null, 'th', '10', '1', '0', null, 'admin', now(), '1', now(), null, '0');
INSERT INTO `sys_menu` VALUES ('103', '102', '0,1,100,101,102,', '查看', null, null, 'lock', '10', '1', '0',  'dcxt:dish:view', 'admin', now(), '1', now(), null, '0');
INSERT INTO `sys_menu` VALUES ('104', '102', '0,1,100,101,102,', '修改', null, null, 'lock', '10', '1', '0',  'dcxt:dish:edit', 'admin', now(), '1', now(), null, '0');

INSERT INTO `sys_menu` VALUES ('105', '101', '0,1,100,101,', '餐标管理', '/dcxt/meal/', null, 'th', '20', '1', '0', null, 'admin', now(), '1', now(), null, '0');
INSERT INTO `sys_menu` VALUES ('106', '105', '0,1,100,101,105,', '查看', null, null, 'lock', '10', '1', '0',  'dcxt:meal:view', 'admin', now(), '1', now(), null, '0');
INSERT INTO `sys_menu` VALUES ('107', '105', '0,1,100,101,105,', '修改', null, null, 'lock', '10', '1', '0',  'dcxt:meal:edit', 'admin', now(), '1', now(), null, '0');

INSERT INTO `sys_menu` VALUES ('108', '101', '0,1,100,101,', '产品管理', '/dcxt/product/', null, 'th', '30', '1', '0', null, 'admin', now(), '1', now(), null, '0');
INSERT INTO `sys_menu` VALUES ('109', '108', '0,1,100,101,108,', '查看', null, null, 'lock', '10', '1', '0',  'dcxt:product:view', 'admin', now(), '1', now(), null, '0');
INSERT INTO `sys_menu` VALUES ('110', '108', '0,1,100,101,108,', '修改', null, null, 'lock', '10', '1', '0',  'dcxt:product:edit', 'admin', now(), '1', now(), null, '0');

INSERT INTO `sys_menu` VALUES ('111', '101', '0,1,100,101,', '份量管理', '/dcxt/combo/', null, 'th', '40', '1', '0', null, 'admin', now(), '1', now(), null, '0');
INSERT INTO `sys_menu` VALUES ('112', '111', '0,1,100,101,111,', '查看', null, null, 'lock', '10', '1', '0',  'dcxt:combo:view', 'admin', now(), '1', now(), null, '0');
INSERT INTO `sys_menu` VALUES ('113', '111', '0,1,100,101,111,', '修改', null, null, 'lock', '10', '1', '0',  'dcxt:combo:edit', 'admin', now(), '1', now(), null, '0');

INSERT INTO `sys_menu` VALUES ('114', '101', '0,1,100,101,', '菜单管理', '/dcxt/foodMenu/', null, 'th', '50', '1', '0', null, 'admin', now(), '1', now(), null, '0');
INSERT INTO `sys_menu` VALUES ('115', '114', '0,1,100,101,114,', '查看', null, null, 'lock', '10', '1', '0',  'dcxt:foodMenu:view', 'admin', now(), '1', now(), null, '0');
INSERT INTO `sys_menu` VALUES ('116', '114', '0,1,100,101,114,', '修改', null, null, 'lock', '10', '1', '0',  'dcxt:foodMenu:edit', 'admin', now(), '1', now(), null, '0');

-- 订单模块[200, )
INSERT INTO `sys_menu` VALUES ('200', '100', '0,1,100,', '订单管理', null, null, null, '200', '1', '0', null, '1', now(), 'admin', now(), null, '0');
INSERT INTO `sys_menu` VALUES ('201', '200', '0,1,100,200,', '订单管理', '/dcxt/order/', null, 'th', '10', '1', '0', null, 'admin', now(), '1', now(), null, '0');
INSERT INTO `sys_menu` VALUES ('202', '201', '0,1,100,200,201,', '查看', null, null, 'lock', '10', '1', '0',  'dcxt:order:view', 'admin', now(), '1', now(), null, '0');
INSERT INTO `sys_menu` VALUES ('203', '201', '0,1,100,200,201,', '修改', null, null, 'lock', '10', '1', '0',  'dcxt:order:edit', 'admin', now(), '1', now(), null, '0');

-- 字典数据初始化
INSERT INTO `sys_dict` VALUES ('512', '新增', '1', 'dcxt_state', '状态', '10', 'admin', now(), 'admin', now(), null, '0');
INSERT INTO `sys_dict` VALUES ('101', '上架', '2', 'dcxt_state', '状态', '20', 'admin', now(), 'admin', now(), null, '0');
INSERT INTO `sys_dict` VALUES ('100', '下架', '3', 'dcxt_state', '状态', '30', 'admin', now(), 'admin', now(), null, '0');

INSERT INTO `sys_dict` VALUES ('102', '菜品', '1', 'dcxt_dish_type', '菜品类型', '10', 'admin', now(), 'admin', now(), null, '0');
INSERT INTO `sys_dict` VALUES ('103', '主食', '2', 'dcxt_dish_type', '菜品类型', '20', 'admin', now(), 'admin', now(), null, '0');
INSERT INTO `sys_dict` VALUES ('104', '加餐', '3', 'dcxt_dish_type', '菜品类型', '30', 'admin', now(), 'admin', now(), null, '0');

INSERT INTO `sys_dict` VALUES ('105', '早餐', '1', 'dcxt_meal_type', '餐标类型', '10', 'admin', now(), 'admin', now(), null, '0');
INSERT INTO `sys_dict` VALUES ('106', '午餐', '2', 'dcxt_meal_type', '餐标类型', '20', 'admin', now(), 'admin', now(), null, '0');
INSERT INTO `sys_dict` VALUES ('107', '晚餐', '3', 'dcxt_meal_type', '餐标类型', '30', 'admin', now(), 'admin', now(), null, '0');

INSERT INTO `sys_dict` VALUES ('108', '男', '1', 'dcxt_account_sex', '性别', '20', 'admin', now(), 'admin', now(), null, '0');
INSERT INTO `sys_dict` VALUES ('109', '女', '2', 'dcxt_account_sex', '性别', '30', 'admin', now(), 'admin', now(), null, '0');

INSERT INTO `sys_dict` VALUES ('110', '正常', '1', 'dcxt_account_status', '用户状态', '20', 'admin', now(), 'admin', now(), null, '0');
INSERT INTO `sys_dict` VALUES ('111', '冻结', '0', 'dcxt_account_status', '用户状态', '30', 'admin', now(), 'admin', now(), null, '0');

INSERT INTO `sys_dict` VALUES ('112', '全部', '0', 'order_status', '订单状态', '10', 'admin', now(), 'admin', now(), null, '0');
INSERT INTO `sys_dict` VALUES ('113', '进行中', '1', 'order_status', '订单状态', '20', 'admin', now(), 'admin', now(), null, '0');
INSERT INTO `sys_dict` VALUES ('114', '暂停', '2', 'order_status', '订单状态', '30', 'admin', now(), 'admin', now(), null, '0');
INSERT INTO `sys_dict` VALUES ('115', '完成', '3', 'order_status', '订单状态', '40', 'admin', now(), 'admin', now(), null, '0');

INSERT INTO `sys_dict` VALUES ('116', '全部', '0', 'order_refund_status', '订单退款状态', '10', 'admin', now(), 'admin', now(), null, '0');
INSERT INTO `sys_dict` VALUES ('117', '处理中', '1', 'order_refund_status', '订单退款状态', '20', 'admin', now(), 'admin', now(), null, '0');
INSERT INTO `sys_dict` VALUES ('118', '完成', '2', 'order_refund_status', '订单退款状态', '30', 'admin', now(), 'admin', now(), null, '0');
INSERT INTO `sys_dict` VALUES ('119', '拒绝', '3', 'order_refund_status', '订单退款状态', '40', 'admin', now(), 'admin', now(), null, '0');

INSERT INTO `sys_dict` VALUES ('120', '微信', '0', 'pay_way', '支付方式', '10', 'admin', now(), 'admin', now(), null, '0');
INSERT INTO `sys_dict` VALUES ('121', '积分', '1', 'pay_way', '支付方式', '20', 'admin', now(), 'admin', now(), null, '0');

INSERT INTO `sys_dict` VALUES ('122', '未配送', '0', 'order_delivery_status', '订单配送状态', '10', 'admin', now(), 'admin', now(), null, '0');
INSERT INTO `sys_dict` VALUES ('123', '配送中', '1', 'order_delivery_status', '订单配送状态', '20', 'admin', now(), 'admin', now(), null, '0');
INSERT INTO `sys_dict` VALUES ('124', '配送完成', '2', 'order_delivery_status', '订单配送状态', '30', 'admin', now(), 'admin', now(), null, '0');