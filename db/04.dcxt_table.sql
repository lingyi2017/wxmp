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
INSERT INTO `sys_menu` VALUES ('109', '108', '0,1,100,101,108,', '查看', null, null, 'lock', '10', '1', '0',  'dcxt:meal:view', 'admin', now(), '1', now(), null, '0');
INSERT INTO `sys_menu` VALUES ('110', '108', '0,1,100,101,108,', '修改', null, null, 'lock', '10', '1', '0',  'dcxt:meal:edit', 'admin', now(), '1', now(), null, '0');

INSERT INTO `sys_menu` VALUES ('111', '101', '0,1,100,101,', '份量管理', '/dcxt/package/', null, 'th', '40', '1', '0', null, 'admin', now(), '1', now(), null, '0');
INSERT INTO `sys_menu` VALUES ('112', '111', '0,1,100,101,111,', '查看', null, null, 'lock', '10', '1', '0',  'dcxt:package:view', 'admin', now(), '1', now(), null, '0');
INSERT INTO `sys_menu` VALUES ('113', '111', '0,1,100,101,111,', '修改', null, null, 'lock', '10', '1', '0',  'dcxt:package:edit', 'admin', now(), '1', now(), null, '0');

INSERT INTO `sys_menu` VALUES ('114', '101', '0,1,100,101,', '菜单管理', '/dcxt/menu/', null, 'th', '50', '1', '0', null, 'admin', now(), '1', now(), null, '0');
INSERT INTO `sys_menu` VALUES ('115', '114', '0,1,100,101,114,', '查看', null, null, 'lock', '10', '1', '0',  'dcxt:menu:view', 'admin', now(), '1', now(), null, '0');
INSERT INTO `sys_menu` VALUES ('116', '114', '0,1,100,101,114,', '修改', null, null, 'lock', '10', '1', '0',  'dcxt:menu:edit', 'admin', now(), '1', now(), null, '0');

-- 订单模块[200, )
INSERT INTO `sys_menu` VALUES ('200', '100', '0,1,100,', '订单管理', null, null, null, '200', '1', '0', null, '1', now(), 'admin', now(), null, '0');
INSERT INTO `sys_menu` VALUES ('201', '200', '0,1,100,200,', '订单管理', '/dcxt/order/', null, 'th', '10', '1', '0', null, 'admin', now(), '1', now(), null, '0');
INSERT INTO `sys_menu` VALUES ('202', '201', '0,1,100,200,201,', '查看', null, null, 'lock', '10', '1', '0',  'dcxt:order:view', 'admin', now(), '1', now(), null, '0');
INSERT INTO `sys_menu` VALUES ('203', '201', '0,1,100,200,201,', '修改', null, null, 'lock', '10', '1', '0',  'dcxt:order:edit', 'admin', now(), '1', now(), null, '0');

-- 字典数据初始化
INSERT INTO `sys_dict` VALUES ('100', '下架', '1', 'dcxt_state', '状态', '10', 'admin', now(), 'admin', now(), null, '0');
INSERT INTO `sys_dict` VALUES ('101', '上架', '2', 'dcxt_state', '状态', '20', 'admin', now(), 'admin', now(), null, '0');

INSERT INTO `sys_dict` VALUES ('102', '菜品', '1', 'dcxt_dish_type', '菜品类型', '10', 'admin', now(), 'admin', now(), null, '0');
INSERT INTO `sys_dict` VALUES ('103', '主食', '2', 'dcxt_dish_type', '菜品类型', '20', 'admin', now(), 'admin', now(), null, '0');
INSERT INTO `sys_dict` VALUES ('104', '加餐', '3', 'dcxt_dish_type', '菜品类型', '30', 'admin', now(), 'admin', now(), null, '0');