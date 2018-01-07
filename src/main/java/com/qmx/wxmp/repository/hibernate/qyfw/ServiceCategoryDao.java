package com.qmx.wxmp.repository.hibernate.qyfw;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.qmx.wxmp.common.persistence.BaseDao;
import com.qmx.wxmp.common.persistence.Parameter;
import com.qmx.wxmp.entity.qyfw.ServiceCategory;

/**
 * 企业服务 Dao
 *
 * @author longxy
 * @date 2017-10-21 15:50
 */
@Repository
public class ServiceCategoryDao extends BaseDao<ServiceCategory> {

	public List<ServiceCategory> findByParentIdsLike(String parentIds) {
		return find("from ServiceCategory where parentIds like :p1", new Parameter(parentIds));
	}



	public List<ServiceCategory> findAllList() {
		return find("from ServiceCategory where delFlag=:p1 order by sort asc", new Parameter("0"));
	}



	public List<ServiceCategory> findAllChild(String parentId, String likeParentIds) {
		return find(
				"from ServiceCategory where delFlag=:p1 and (id=:p2 or parent.id=:p2 or parentIds like :p3) order by sort asc",
				new Parameter("0", parentId, likeParentIds));
	}
	
	public List<ServiceCategory> findAllChildByWxMenuId(String wxMenuId){
		return findBySql("select * from qyfw_service_category where del_flag = '0' and parent_id = (select id from qyfw_service_category where wx_menu_id = :p1)", new Parameter(wxMenuId), ServiceCategory.class);
	}
	
	public Integer getMaxSort(){
		List<Integer> result = find("select max(sort) from ServiceCategory");
		return result.size() > 0 ? (result.get(0).intValue() + 1) : 1;
	}
}
