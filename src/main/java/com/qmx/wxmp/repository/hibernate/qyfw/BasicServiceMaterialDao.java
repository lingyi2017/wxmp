package com.qmx.wxmp.repository.hibernate.qyfw;

import org.springframework.stereotype.Repository;

import com.qmx.wxmp.common.persistence.BaseDao;
import com.qmx.wxmp.common.persistence.Parameter;
import com.qmx.wxmp.entity.qyfw.BasicServiceMaterial;

/**
 * 基础服务材料dao
 * @author itismin
 *
 */
@Repository
public class BasicServiceMaterialDao extends BaseDao<BasicServiceMaterial> {

	/**
	 * 删除对应材料id的数据
	 * @param materialId
	 */
	public void deleteByMaterial(String materialId){
		update("delete from BasicServiceMaterial where material.id = :p1", new Parameter(materialId));
	}
	
	/**
	 * 删除对应基础服务id的数据
	 * @param basicServiceId
	 */
	public void deleteByBasicservice(String basicServiceId){
		update("delete from BasicServiceMaterial where basicServiceId :p1", new Parameter(basicServiceId));
	}
}
