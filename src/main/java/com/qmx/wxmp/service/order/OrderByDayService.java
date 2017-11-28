package com.qmx.wxmp.service.order;

import java.util.Date;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.qmx.wxmp.common.persistence.Page;
import com.qmx.wxmp.entity.dcxt.Dish;
import com.qmx.wxmp.entity.order.OrderByDay;
import com.qmx.wxmp.repository.hibernate.order.OrderByDayDao;
import com.qmx.wxmp.service.BaseService;

/**
 * 每日订单service
 * @author itismin
 *
 */
@Service
@Transactional(readOnly = true)
public class OrderByDayService extends BaseService {

	@Autowired
	private OrderByDayDao byDayDao;

	public OrderByDay get(String id) {
		return byDayDao.get(id);
	}

	@Transactional(readOnly = false)
	public void save(OrderByDay entity) {
		byDayDao.clear();
		byDayDao.save(entity);
	}

	@Transactional(readOnly = false)
	public void delete(String id) {
		byDayDao.deleteById(id);
	}

	/**
	 * 每日订单列表
	 * @param page
	 * @param entity
	 * @return
	 */
	public Page<OrderByDay> findList(Page<OrderByDay> page, OrderByDay entity) {
		DetachedCriteria dc = byDayDao.createDetachedCriteria();
		if (StringUtils.isNotBlank(entity.getPerson())) {
			dc.add(Restrictions.like("person", "%" + entity.getPerson() + "%"));
		}
		if (StringUtils.isNotBlank(entity.getPhone())) {
			dc.add(Restrictions.like("phone", "%" + entity.getPhone() + "%"));
		}
		if(entity.getDeliveryDate() != null){
			dc.add(Restrictions.ge("deliveryDate", entity.getDeliveryDate()));
		}else{
			dc.add(Restrictions.ge("deliveryDate", new Date()));
		}
		if (StringUtils.isNotBlank(entity.getStatus())) {
			dc.add(Restrictions.eq("status", entity.getStatus()));
		}
		dc.add(Restrictions.eq("delFlag", Dish.DEL_FLAG_NORMAL));
		return byDayDao.find(page, dc);

	}
	
	
}
