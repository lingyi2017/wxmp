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
import com.qmx.wxmp.entity.order.OrderMain;
import com.qmx.wxmp.repository.hibernate.order.OrderDao;
import com.qmx.wxmp.service.BaseService;

/**
 * 订单service
 * @author itismin
 *
 */
@Service
@Transactional(readOnly = true)
public class OrderService extends BaseService {

	@Autowired
	private OrderDao orderDao;

	public OrderMain get(String id) {
		return orderDao.get(id);
	}

	@Transactional(readOnly = false)
	public void save(OrderMain entity) {
		orderDao.clear();
		orderDao.save(entity);
	}

	@Transactional(readOnly = false)
	public void delete(String id) {
		orderDao.deleteById(id);
	}
	
	public void initDayOrderData(){
		
	}

	/**
	 * 订单列表
	 * @param page
	 * @param entity
	 * @return
	 */
	public Page<OrderMain> findList(Page<OrderMain> page, OrderQueryDTO entity) {
		DetachedCriteria dc = orderDao.createDetachedCriteria();
		dc.createAlias("account", "account");
		if (StringUtils.isNotBlank(entity.getAccountName())) {
			dc.add(Restrictions.like("account.name", "%" + entity.getAccountName() + "%"));
		}
		if (StringUtils.isNotBlank(entity.getAccountPhone())) {
			dc.add(Restrictions.like("account.name", "%" + entity.getAccountPhone() + "%"));
		}
		if(StringUtils.isNotBlank(entity.getBeginDate())){
			dc.add(Restrictions.ge("orderTime", entity.getBeginDate()));
		}
		if(StringUtils.isNotBlank(entity.getEndDate())){
			dc.add(Restrictions.le("orderTime", entity.getEndDate()));
		}
		if (StringUtils.isNotBlank(entity.getOrderStatus())) {
			dc.add(Restrictions.eq("orderStatus", entity.getOrderStatus()));
		}
		dc.add(Restrictions.eq("delFlag", Dish.DEL_FLAG_NORMAL));
		if (StringUtils.isBlank(page.getOrderBy())) {
			dc.addOrder(Order.desc("orderTime"));
		}
		return orderDao.find(page, dc);

	}
	
	/**
	 * 今日配送订单列表
	 * @param page
	 * @param entity
	 * @return
	 */
	public Page<OrderMain> findDayOrderList(Page<OrderMain> page, OrderQueryDTO entity) {
		DetachedCriteria dc = orderDao.createDetachedCriteria();
		dc.createAlias("account", "account");
		if (StringUtils.isNotBlank(entity.getAccountName())) {
			dc.add(Restrictions.like("account.name", "%" + entity.getAccountName() + "%"));
		}
		if (StringUtils.isNotBlank(entity.getAccountPhone())) {
			dc.add(Restrictions.like("account.name", "%" + entity.getAccountPhone() + "%"));
		}
		if(entity.getBeginDate() != null){
			dc.add(Restrictions.ge("orderTime", entity.getBeginDate()));
		}
		if(entity.getEndDate() != null){
			dc.add(Restrictions.le("orderTime", entity.getEndDate()));
		}
		if (StringUtils.isNotBlank(entity.getOrderStatus())) {
			dc.add(Restrictions.eq("orderStatus", entity.getOrderStatus()));
		}
		dc.add(Restrictions.eq("delFlag", Dish.DEL_FLAG_NORMAL));
		if (StringUtils.isBlank(page.getOrderBy())) {
			dc.addOrder(Order.desc("orderTime"));
		}
		return orderDao.find(page, dc);

	}
	
	/**
	 * 退款待处理订单列表
	 * @param page
	 * @param entity
	 * @return
	 */
	public Page<OrderMain> findRefundOrderList(Page<OrderMain> page, OrderQueryDTO entity) {
		DetachedCriteria dc = orderDao.createDetachedCriteria();
		if (StringUtils.isNotBlank(entity.getAccountName())) {
			dc.add(Restrictions.like("account.name", "%" + entity.getAccountName() + "%"));
		}
		if (StringUtils.isNotBlank(entity.getAccountPhone())) {
			dc.add(Restrictions.like("account.name", "%" + entity.getAccountPhone() + "%"));
		}
		if(entity.getBeginDate() != null){
			dc.add(Restrictions.ge("orderTime", entity.getBeginDate()));
		}
		if(entity.getEndDate() != null){
			dc.add(Restrictions.le("orderTime", entity.getEndDate()));
		}
		if (StringUtils.isNotBlank(entity.getOrderStatus())) {
			dc.add(Restrictions.eq("orderStatus", entity.getOrderStatus()));
		}
		dc.add(Restrictions.eq("delFlag", Dish.DEL_FLAG_NORMAL));
		if (StringUtils.isBlank(page.getOrderBy())) {
			dc.addOrder(Order.desc("orderTime"));
		}
		return orderDao.find(page, dc);

	}
}
