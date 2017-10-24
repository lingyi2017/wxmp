package com.qmx.wxmp.repository.hibernate.qyfw;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.qmx.wxmp.common.persistence.BaseDao;
import com.qmx.wxmp.entity.qyfw.Material;

@Repository
public class MaterialDao extends BaseDao<Material> {

	public List<Material> findList(){
		return find("from Material where 1=1");
	}
	
}
