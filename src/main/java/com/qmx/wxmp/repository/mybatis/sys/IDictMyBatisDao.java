package com.qmx.wxmp.repository.mybatis.sys;

import java.util.List;

import com.qmx.wxmp.common.persistence.annotation.MyBatisRepository;
import com.qmx.wxmp.entity.sys.Dict;

/**
 * MyBatis字典DAO接口
 * @author L.J
 * @version 2013-8-23
 */
@MyBatisRepository
public interface IDictMyBatisDao {
	
    Dict get(String id);
    
    List<Dict> find(Dict dict);
    
}
