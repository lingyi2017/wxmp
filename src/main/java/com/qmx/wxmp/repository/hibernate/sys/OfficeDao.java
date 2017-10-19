/**
 * Copyright &copy; 2012-2013 <a href="https://github.com/free lance/infosys">infosys</a> All rights reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 */
package com.qmx.wxmp.repository.hibernate.sys;

import java.util.List;

import com.qmx.wxmp.common.persistence.BaseDao;
import com.qmx.wxmp.common.persistence.Parameter;
import com.qmx.wxmp.entity.sys.Office;
import org.springframework.stereotype.Repository;

/**
 * 机构DAO接口
 * 
 * @author free lance
 * @version 2013-8-23
 */
@Repository
public class OfficeDao extends BaseDao<Office> {

    public List<Office> findByParentIdsLike(String parentIds) {
        return find("from Office where parentIds like :p1", new Parameter(parentIds));
    }

    // @Query("from Office where (id=?1 or parent.id=?1 or parentIds like ?2) and delFlag='" + Office.DEL_FLAG_NORMAL +
    // "' order by code")
    // public List<Office> findAllChild(Long parentId, String likeParentIds);

}
