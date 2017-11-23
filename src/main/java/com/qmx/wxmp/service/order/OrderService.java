package com.qmx.wxmp.service.order;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.qmx.wxmp.common.persistence.Page;
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



	public Page<OrderMain> findList(Page<OrderMain> page, OrderMain entity) {

		DetachedCriteria dc = orderDao.createDetachedCriteria();

		if (StringUtils.isNotBlank(entity.getAccount().getName())) {
			dc.add(Restrictions.like("account.name", "%" + entity.getAccount().getName() + "%"));
		}
		if (StringUtils.isNotBlank(entity.getAccount().getPhone())) {
			dc.add(Restrictions.like("account.name", "%" + entity.getAccount().getName() + "%"));
		}
		
		dc.add(Restrictions.eq("delFlag", Dish.DEL_FLAG_NORMAL));
		if (StringUtils.isBlank(page.getOrderBy())) {
			dc.addOrder(Order.desc("createDate"));
		}
		return orderDao.find(page, dc);

	}
}
