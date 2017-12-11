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
import com.qmx.wxmp.entity.order.OrderRefund;
import com.qmx.wxmp.repository.hibernate.order.OrderRefundDao;
import com.qmx.wxmp.service.BaseService;

/**
 * 退款单service
 * @author itismin
 *
 */
@Service
@Transactional(readOnly = true)
public class OrderRefundService extends BaseService {

	@Autowired
	private OrderRefundDao refundDao;

	public OrderRefund get(String id) {
		return refundDao.get(id);
	}

	@Transactional(readOnly = false)
	public void save(OrderRefund entity) {
		refundDao.clear();
		refundDao.save(entity);
	}

	@Transactional(readOnly = false)
	public void delete(String id) {
		refundDao.deleteById(id);
	}
	

	/**
	 * 订单列表
	 * @param page
	 * @param entity
	 * @return
	 */
	public Page<OrderRefund> findList(Page<OrderRefund> page, OrderQueryDTO entity) {
		DetachedCriteria dc = refundDao.createDetachedCriteria();
		dc.createAlias("order", "order");
		if (StringUtils.isNotBlank(entity.getOrderNumber())) {
			dc.add(Restrictions.like("order.orderNumber", "%" + entity.getOrderNumber() + "%"));
		}
		if(StringUtils.isNotBlank(entity.getBeginDate())){
			dc.add(Restrictions.ge("refundTime", DateUtils.parseDate(entity.getBeginDate() + " 00:00:00")));
		}
		if(StringUtils.isNotBlank(entity.getEndDate())){
			dc.add(Restrictions.le("refundTime", DateUtils.parseDate(entity.getEndDate() + " 23:59:59")));
		}
		if (StringUtils.isNotBlank(entity.getStatus())) {
			dc.add(Restrictions.eq("status", entity.getStatus()));
		}else{
			dc.add(Restrictions.eq("status", OrderRefund.ORDER_REFUND_DEAL));
		}
		dc.add(Restrictions.eq("delFlag", Dish.DEL_FLAG_NORMAL));
		if (StringUtils.isBlank(page.getOrderBy())) {
			dc.addOrder(Order.desc("refundTime"));
		}
		return refundDao.find(page, dc);

	}
	
	
}
