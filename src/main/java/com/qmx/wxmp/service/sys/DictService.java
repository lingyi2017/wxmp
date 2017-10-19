/**
 * Copyright &copy; 2012-2013 <a href="https://github.com/free lance/infosys">infosys</a> All rights reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 */
package com.qmx.wxmp.service.sys;

import java.util.List;

import com.qmx.wxmp.common.persistence.Page;
import com.qmx.wxmp.common.utils.CacheUtils;
import com.qmx.wxmp.common.utils.DictUtils;
import com.qmx.wxmp.repository.hibernate.sys.DictDao;
import com.qmx.wxmp.service.BaseService;
import org.apache.commons.lang3.StringUtils;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.qmx.wxmp.entity.sys.Dict;

/**
 * 字典Service
 * 
 * @author free lance
 * @version 2013-5-29
 */
@Service
@Transactional(readOnly = true)
public class DictService extends BaseService {

    @Autowired
    private DictDao dictDao;

    public Dict get(String id) {
        // Hibernate 查询
        return dictDao.get(id);
    }

    public Page<Dict> find(Page<Dict> page, Dict dict) {
        // MyBatis 查询
        // dict.setPage(page);
        // page.setList(myBatisDictDao.find(dict));
        // return page;
        
        // Hibernate 查询
        DetachedCriteria dc = dictDao.createDetachedCriteria();
        if (StringUtils.isNotEmpty(dict.getType())) {
            dc.add(Restrictions.eq("type", dict.getType()));
        }
        if (StringUtils.isNotEmpty(dict.getDescription())) {
            dc.add(Restrictions.like("description", "%" + dict.getDescription() + "%"));
        }
        dc.add(Restrictions.eq(Dict.FIELD_DEL_FLAG, Dict.DEL_FLAG_NORMAL));
        dc.addOrder(Order.asc("type")).addOrder(Order.asc("sort")).addOrder(Order.desc("id"));
        return dictDao.find(page, dc);
    }

    public List<String> findTypeList() {
        return dictDao.findTypeList();
    }

    @Transactional(readOnly = false)
    public void save(Dict dict) {
        dictDao.save(dict);
        CacheUtils.remove(DictUtils.CACHE_DICT_MAP);
    }

    @Transactional(readOnly = false)
    public void delete(String id) {
        dictDao.deleteById(id);
        CacheUtils.remove(DictUtils.CACHE_DICT_MAP);
    }

}
