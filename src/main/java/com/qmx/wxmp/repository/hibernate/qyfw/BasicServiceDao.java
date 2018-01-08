package com.qmx.wxmp.repository.hibernate.qyfw;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.qmx.wxmp.common.persistence.BaseDao;
import com.qmx.wxmp.common.persistence.Parameter;
import com.qmx.wxmp.entity.qyfw.BasicService;

@Repository
public class BasicServiceDao extends BaseDao<BasicService> {

	public List<BasicService> findByServiceCategoryId(String serviceCategoryId){
		return findBySql("select * from qyfw_basic_service where del_flag = '0' and service_category_id = :p1 order by sort", new Parameter(serviceCategoryId), BasicService.class);
	}
	
	public Integer getMaxSort(){
		List<Integer> result = find("select max(sort) from BasicService");
		return result.size() > 0 ? (result.get(0).intValue() + 1) : 1;
	}
}
