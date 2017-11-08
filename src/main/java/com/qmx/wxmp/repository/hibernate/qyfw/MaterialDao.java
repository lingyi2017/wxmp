package com.qmx.wxmp.repository.hibernate.qyfw;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.qmx.wxmp.common.persistence.BaseDao;
import com.qmx.wxmp.common.persistence.Parameter;
import com.qmx.wxmp.entity.qyfw.BasicService;
import com.qmx.wxmp.entity.qyfw.Material;

@Repository
public class MaterialDao extends BaseDao<Material> {

	public List<Material> findByMaterialName(String name){
		return find("from Material where name = :p1", new Parameter(name));
	}
	
	public List<Material> getPeopleMaterialList(){
		return find("from Material where customerType like :p1", new Parameter("%"+BasicService.CUSTOMER_TYPE_PEOPLE+"%"));
	}
	
	public List<Material> getCompanyMaterialList(){
		return find("from Material where customerType like :p1", new Parameter("%"+BasicService.CUSTOMER_TYPE_COMPANY+"%"));
	}
}
