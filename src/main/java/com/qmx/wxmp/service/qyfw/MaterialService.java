package com.qmx.wxmp.service.qyfw;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.qmx.wxmp.common.persistence.Page;
import com.qmx.wxmp.common.utils.IdGen;
import com.qmx.wxmp.entity.qyfw.Material;
import com.qmx.wxmp.entity.qyfw.ServiceCategory;
import com.qmx.wxmp.repository.hibernate.qyfw.MaterialDao;
import com.qmx.wxmp.service.BaseService;

/**
 * 材料管理
 * todo：级联删除
 * @author itismin
 *
 */
@Service
@Transactional(readOnly = true)
public class MaterialService extends BaseService {

	@Resource
	private MaterialDao materialDao;
	
	public List<Material> findAllList(){
		return materialDao.findList();
	}
	
	public Material get(String id) {
		return materialDao.get(id);
	}
	
	@Transactional(readOnly = false)
	public void save(Material material){
		material.setId(IdGen.uuid());
		materialDao.save(material);
	}
	
	@Transactional(readOnly = false)
	public void delete(String id){
		materialDao.delById(id);
	}
	
	public Page<Material> findByPage(Page<Material> page, Material material) {
		DetachedCriteria dc = materialDao.createDetachedCriteria();
		if (StringUtils.isNotEmpty(material.getCustomerType())) {
			dc.add(Restrictions.eq("customerType", material.getCustomerType()));
		}
		if (StringUtils.isNotEmpty(material.getName())) {
			dc.add(Restrictions.like("name", "%" + material.getName() + "%"));
		}
		dc.addOrder(Order.asc("sort"));
		return materialDao.find(page, dc);
	}
}
