package com.qmx.wxmp.service.qyfw;

import javax.annotation.Resource;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.qmx.wxmp.common.persistence.Page;
import com.qmx.wxmp.common.utils.IdGen;
import com.qmx.wxmp.common.utils.StringUtils;
import com.qmx.wxmp.entity.qyfw.BasicService;
import com.qmx.wxmp.repository.hibernate.qyfw.BasicServiceDao;
import com.qmx.wxmp.service.BaseService;

/**
 * 材料管理
 * @author itismin
 *
 */
@Service
@Transactional(readOnly = true)
public class BasicServiceService extends BaseService {

	@Resource
	private BasicServiceDao basicServiceDao;
	
	public BasicService get(String id) {
		return basicServiceDao.get(id);
	}
	
	@Transactional(readOnly = false)
	public void save(BasicService basicService){
		if(StringUtils.isEmpty(basicService.getId())){
			basicService.setId(IdGen.uuid());
		}
		basicServiceDao.save(basicService);
	}
	
	@Transactional(readOnly = false)
	public void delete(String id){
		basicServiceDao.delById(id);
	}
	
	public Page<BasicService> findByPage(Page<BasicService> page, BasicService basicService) {
		DetachedCriteria dc = basicServiceDao.createDetachedCriteria();
		if (StringUtils.isNotEmpty(basicService.getCustomerType())) {
			dc.add(Restrictions.eq("customerType", basicService.getCustomerType()));
		}
		if (StringUtils.isNotEmpty(basicService.getName())) {
			dc.add(Restrictions.like("name", "%" + basicService.getName() + "%"));
		}
		dc.addOrder(Order.asc("sort"));
		return basicServiceDao.find(page, dc);
	}
	
	
}
