package com.qmx.wxmp.service.qyfw;

import java.util.Date;

import com.qmx.wxmp.entity.qyfw.BasicService;
import org.apache.commons.lang3.StringUtils;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.qmx.wxmp.common.persistence.Page;
import com.qmx.wxmp.common.utils.IdGen;
import com.qmx.wxmp.entity.qyfw.Order;
import com.qmx.wxmp.repository.hibernate.qyfw.OrderDao;
import com.qmx.wxmp.service.BaseService;

/**
 * 订单 Service
 *
 * @author longxy
 * @date 2017-10-22 21:37
 */
@Service
public class OrderService extends BaseService {

	@Autowired
	private OrderDao thisDao;



	@Transactional(readOnly = false)
	public void save(Order order) {

		if (StringUtils.isEmpty(order.getId())) {
			order.setId(IdGen.uuid());
			order.setCreateDate(new Date());
		}
		thisDao.clear();
		thisDao.save(order);

	}



	public Order get(String id) {
		return thisDao.get(id);
	}



	public Page<Order> find(Page<Order> page, Order order) {

		DetachedCriteria dc = thisDao.createDetachedCriteria();
		if (null != order.getCreateDate()) {
			dc.add(Restrictions.eq("createDate", order.getCreateDate()));
		}
		if (StringUtils.isNotEmpty(order.getContact())) {
			dc.add(Restrictions.like("contact", "%" + order.getContact() + "%"));
		}
		BasicService basicService = order.getBasicService();
		dc.createAlias("basicService", "basicService");
		if (null != basicService && StringUtils.isNotEmpty(basicService.getName())) {
			dc.add(Restrictions.like("basicService.name", "%" + order.getBasicService().getName() + "%"));
		}

		dc.addOrder(org.hibernate.criterion.Order.desc("createDate"));
		return thisDao.find(page, dc);

	}



	public Order findByPhone(String phone) {
		return thisDao.findByPhone(phone);
	}
}
