-- 菜单初始数据[100, )
INSERT INTO `sys_menu` VALUES ('100', '1', '0,1,', '订餐系统', null, null, 'user', '300', '1', '0', '', null, now(), 'admin', null, null, '0');

INSERT INTO `sys_menu` VALUES ('101', '100', '0,1,100,', '菜单管理', null, null, null, '100', '1', '0', null, '1', now(), 'admin', now(), null, '0');
INSERT INTO `sys_menu` VALUES ('102', '101', '0,1,100,101,', '菜品管理', '/dcxt/dish/', null, 'user', '10', '1', '0', null, 'admin', now(), '1', now(), null, '0');
INSERT INTO `sys_menu` VALUES ('103', '102', '0,1,100,101,102,', '查看', null, null, 'lock', '10', '1', '0',  'dcxt:dish:view', 'admin', now(), '1', now(), null, '0');
INSERT INTO `sys_menu` VALUES ('104', '102', '0,1,100,101,102,', '修改', null, null, 'lock', '10', '1', '0',  'dcxt:dish:edit', 'admin', now(), '1', now(), null, '0');