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

-- --------------------------------
-- Records of qyfw_service_category
-- --------------------------------
-- 服务分类顶级目录初始化
INSERT INTO `qyfw_service_category` VALUES ('1', '0', '0', '顶级分类', 1, 0, 1, null, 0);

-- 字典数据初始化[100, )
INSERT INTO `sys_dict` VALUES ('100', '隐藏', '0', 'service_category_is_enable', '是否显示', '20', 'admin', now(), 'admin', now(), null, '0');
INSERT INTO `sys_dict` VALUES ('101', '显示', '1', 'service_category_is_enable', '是否显示', '10', 'admin', now(), 'admin', now(), null, '0');

INSERT INTO `sys_dict` VALUES ('102', '一般显示', '0', 'service_category_is_important', '是否重点显示', '10', 'admin', now(), 'admin', now(), null, '0');
INSERT INTO `sys_dict` VALUES ('103', '重点显示', '1', 'service_category_is_important', '是否重点显示', '20', 'admin', now(), 'admin', now(), null, '0');