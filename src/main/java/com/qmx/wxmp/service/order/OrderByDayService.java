package com.qmx.wxmp.service.order;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.qmx.wxmp.common.persistence.Page;
import com.qmx.wxmp.common.utils.DateUtils;
import com.qmx.wxmp.dto.order.OrderQueryDTO;
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
	 * 子订单列表
	 * @param page
	 * @param entity
	 * @return
	 */
	public Page<OrderByDay> findList(Page<OrderByDay> page, OrderQueryDTO entity) {
		DetachedCriteria dc = byDayDao.createDetachedCriteria();
		if (StringUtils.isNotBlank(entity.getAccountName())) {
			dc.add(Restrictions.like("person", "%" + entity.getAccountName() + "%"));
		}
		if (StringUtils.isNotBlank(entity.getAccountPhone())) {
			dc.add(Restrictions.like("phone", "%" + entity.getAccountPhone() + "%"));
		}
		if(entity.getDeliveryDate() != null){
			dc.add(Restrictions.ge("deliveryDate", DateUtils.parseDate(entity.getDeliveryDate() + " 00:00:00")));
		}else{
			dc.add(Restrictions.eq("deliveryDate", DateUtils.parseDate(DateUtils.getDate() + " 00:00:00")));
		}
		if (StringUtils.isNotBlank(entity.getStatus())) {
			dc.add(Restrictions.eq("status", entity.getStatus()));
		}else{
			dc.add(Restrictions.eq("status", OrderByDay.ORDER_STATUS_READY));
		}
		dc.add(Restrictions.eq("delFlag", Dish.DEL_FLAG_NORMAL));
		if (StringUtils.isBlank(page.getOrderBy())) {
			dc.addOrder(Order.desc("deliveryDate"));
		}
		return byDayDao.find(page, dc);

	}
	
	/**
	 * 每日订单列表
	 * @param page
	 * @param entity
	 * @return
	 */
	public Page<OrderByDay> findTodayList(Page<OrderByDay> page, OrderQueryDTO entity) {
		DetachedCriteria dc = byDayDao.createDetachedCriteria();
		dc.add(Restrictions.eq("deliveryDate", DateUtils.parseDate(DateUtils.getDate() + " 00:00:00")));
		dc.add(Restrictions.eq("status", OrderByDay.ORDER_STATUS_READY));
		dc.add(Restrictions.eq("delFlag", Dish.DEL_FLAG_NORMAL));
		return byDayDao.find(page, dc);

	}
	
	/**
	 * 出餐
	 * @param orderIds
	 */
	@Transactional(readOnly = false)
	public void deliveryByDay(String[] orderIds){
		byDayDao.updateOrderStatusByIds(orderIds);
	}
}
