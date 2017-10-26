package com.qmx.wxmp.service.qyfw;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.qmx.wxmp.common.persistence.Page;
import com.qmx.wxmp.common.utils.IdGen;
import com.qmx.wxmp.entity.qyfw.Consulting;
import com.qmx.wxmp.entity.qyfw.Material;
import com.qmx.wxmp.repository.hibernate.qyfw.ConsultingDao;
import com.qmx.wxmp.service.BaseService;

/**
 * 咨询管理
 * @author itismin
 *
 */
@Service
@Transactional(readOnly = true)
public class ConsultingService extends BaseService {

	@Resource
	private ConsultingDao consultingDao;
	
	public Consulting get(String id) {
		return consultingDao.get(id);
	}
	
	@Transactional(readOnly = false)
	public void save(Consulting consulting){
		consulting.setId(IdGen.uuid());
		consultingDao.save(consulting);
	}
	
	@Transactional(readOnly = false)
	public void delete(String id){
		consultingDao.delById(id);
	}
	
	public Page<Consulting> findByPage(Page<Consulting> page, Consulting consulting) {
		DetachedCriteria dc = consultingDao.createDetachedCriteria();
		if (StringUtils.isNotEmpty(consulting.getCustomerType())) {
			dc.add(Restrictions.eq("customerType", consulting.getCustomerType()));
		}
		if (StringUtils.isNotEmpty(consulting.getPerson())) {
			dc.add(Restrictions.like("person", "%" + consulting.getPerson() + "%"));
		}
		if (StringUtils.isNotEmpty(consulting.getPhone())) {
			dc.add(Restrictions.like("phone", "%" + consulting.getPhone() + "%"));
		}
		dc.addOrder(Order.desc("time"));
		return consultingDao.find(page, dc);
	}
}
