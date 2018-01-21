
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

INSERT INTO `sys_dict` VALUES ('250', '全部', '0', 'order_status', '订单状态', '10', 'admin', now(), 'admin', now(), null, '0');
INSERT INTO `sys_dict` VALUES ('251', '未支付', '1', 'order_status', '订单状态', '20', 'admin', now(), 'admin', now(), null, '0');
INSERT INTO `sys_dict` VALUES ('252', '进行中', '2', 'order_status', '订单状态', '30', 'admin', now(), 'admin', now(), null, '0');
INSERT INTO `sys_dict` VALUES ('253', '暂停', '3', 'order_status', '订单状态', '40', 'admin', now(), 'admin', now(), null, '0');
INSERT INTO `sys_dict` VALUES ('254', '退款中', '4', 'order_status', '订单状态', '40', 'admin', now(), 'admin', now(), null, '0');
INSERT INTO `sys_dict` VALUES ('255', '完成', '5', 'order_status', '订单状态', '40', 'admin', now(), 'admin', now(), null, '0');


INSERT INTO `sys_dict` VALUES ('256', '微信', '0', 'pay_way', '支付方式', '10', 'admin', now(), 'admin', now(), null, '0');
INSERT INTO `sys_dict` VALUES ('257', '积分', '1', 'pay_way', '支付方式', '20', 'admin', now(), 'admin', now(), null, '0');

INSERT INTO `sys_dict` VALUES ('260', '未配送', '1', 'order_delivery_status', '订单配送状态', '10', 'admin', now(), 'admin', now(), null, '0');
INSERT INTO `sys_dict` VALUES ('261', '配送中', '2', 'order_delivery_status', '订单配送状态', '20', 'admin', now(), 'admin', now(), null, '0');
INSERT INTO `sys_dict` VALUES ('262', '配送完成', '3', 'order_delivery_status', '订单配送状态', '30', 'admin', now(), 'admin', now(), null, '0');
INSERT INTO `sys_dict` VALUES ('263', '配送失败', '4', 'order_delivery_status', '订单配送状态', '30', 'admin', now(), 'admin', now(), null, '0');
INSERT INTO `sys_dict` VALUES ('264', '退款中', '5', 'order_delivery_status', '订单配送状态', '30', 'admin', now(), 'admin', now(), null, '0');
INSERT INTO `sys_dict` VALUES ('265', '退款完成', '6', 'order_delivery_status', '订单配送状态', '30', 'admin', now(), 'admin', now(), null, '0');
INSERT INTO `sys_dict` VALUES ('266', '暂停', '7', 'order_delivery_status', '订单配送状态', '30', 'admin', now(), 'admin', now(), null, '0');

INSERT INTO `sys_dict` VALUES ('267', '处理中', '1', 'order_refund_status', '订单退款状态', '10', 'admin', now(), 'admin', now(), null, '0');
INSERT INTO `sys_dict` VALUES ('268', '失败', '2', 'order_refund_status', '订单退款状态', '20', 'admin', now(), 'admin', now(), null, '0');
INSERT INTO `sys_dict` VALUES ('269', '成功', '3', 'order_refund_status', '订单退款状态', '30', 'admin', now(), 'admin', now(), null, '0');

INSERT INTO `sys_dict` VALUES ('270', '好评', '1', 'order_comment', '订单评价', '10', 'admin', now(), 'admin', now(), null, '0');
INSERT INTO `sys_dict` VALUES ('271', '中评', '2', 'order_comment', '订单评价', '20', 'admin', now(), 'admin', now(), null, '0');
INSERT INTO `sys_dict` VALUES ('272', '差评', '3', 'order_comment', '订单评价', '30', 'admin', now(), 'admin', now(), null, '0');

INSERT INTO `sys_dict` VALUES ('128', '新增', '1', 'dcxt_meal_state', '餐标状态', '10', 'admin', now(), 'admin', now(), null, '0');
INSERT INTO `sys_dict` VALUES ('129', '启用', '2', 'dcxt_meal_state', '餐标状态', '20', 'admin', now(), 'admin', now(), null, '0');
INSERT INTO `sys_dict` VALUES ('130', '不启用', '3', 'dcxt_meal_state', '餐标状态', '30', 'admin', now(), 'admin', now(), null, '0');

INSERT INTO `sys_dict` VALUES ('131', '订餐', '1', 'dcxt_score_type', '积分变动类型', '10', 'admin', now(), 'admin', now(), null, '0');
INSERT INTO `sys_dict` VALUES ('132', '评论', '2', 'dcxt_score_type', '积分变动类型', '20', 'admin', now(), 'admin', now(), null, '0');
INSERT INTO `sys_dict` VALUES ('133', '退款', '3', 'dcxt_score_type', '积分变动类型', '30', 'admin', now(), 'admin', now(), null, '0');
