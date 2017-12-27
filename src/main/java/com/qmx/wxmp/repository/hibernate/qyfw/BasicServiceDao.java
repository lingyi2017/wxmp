package com.qmx.wxmp.repository.hibernate.qyfw;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.qmx.wxmp.common.persistence.BaseDao;
import com.qmx.wxmp.common.persistence.Parameter;
import com.qmx.wxmp.entity.qyfw.BasicService;

@Repository
public class BasicServiceDao extends BaseDao<BasicService> {

	public List<BasicService> findByServiceCategoryId(String serviceCategoryId){
		return findBySql("select * from qyfw_basic_service where service_category_id = :p1 order by sort", new Parameter(serviceCategoryId), BasicService.class);
	}
}
