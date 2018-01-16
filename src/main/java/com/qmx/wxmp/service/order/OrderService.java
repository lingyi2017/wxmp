package com.qmx.wxmp.service.order;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.qmx.wxmp.common.persistence.Page;
import com.qmx.wxmp.common.persistence.Parameter;
import com.qmx.wxmp.common.utils.DateUtils;
import com.qmx.wxmp.dto.order.OrderQueryDTO;
import com.qmx.wxmp.entity.dcxt.Dish;
import com.qmx.wxmp.entity.order.OrderByDay;
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
			dc.add(Restrictions.ge("orderTime", DateUtils.parseDate(entity.getBeginDate() + " 00:00:00")));
		}
		if(StringUtils.isNotBlank(entity.getEndDate())){
			dc.add(Restrictions.le("orderTime", DateUtils.parseDate(entity.getEndDate() + " 23:59:59")));
		}
		if (StringUtils.isNotBlank(entity.getStatus())) {
			dc.add(Restrictions.eq("orderStatus", entity.getStatus()));
		}
		dc.add(Restrictions.eq("delFlag", Dish.DEL_FLAG_NORMAL));
		if (StringUtils.isBlank(page.getOrderBy())) {
			dc.addOrder(Order.desc("orderTime"));
		}
		return orderDao.find(page, dc);

	}
	
	/**
	 * 暂停订单
	 * @param id 订单id
	 * @return
	 */
	public OrderMain pause(String id){
		Date pauseTime = new Date();
		Date pauseDate = DateUtils.formatDate2(pauseTime, "yyyy-MM-dd");
		OrderMain order = get(id);
		for(OrderByDay dayOrder : order.getOrderByDays()){
			//子订单未配送，且配送日期不为暂停当天
			if(OrderByDay.ORDER_STATUS_READY.equals(dayOrder.getStatus()) 
					&& DateUtils.daysBetween(pauseDate, dayOrder.getDeliveryDate()) >= 1){
				dayOrder.setStatus(OrderByDay.ORDER_STATUS_PAUSE);
			}
		}
		order.setStatus(OrderMain.ORDER_STATUS_PAUSE);
		order.setPauseTime(pauseTime);
		save(order);
		return order;
	}
	
	/**
	 * 恢复订单
	 * @param id 订单id
	 * @return
	 */
	public OrderMain recover(String id){
		Date recoverTime = new Date();
		Date deliveryDate = DateUtils.getDayByAdd(DateUtils.formatDate2(recoverTime, "yyyy-MM-dd"), 1);//待更新的配送日期
		OrderMain order = get(id);
		for(OrderByDay dayOrder : order.getOrderByDays()){
			//子订单已暂停，更新配送时间
			if(OrderByDay.ORDER_STATUS_PAUSE.equals(dayOrder.getStatus())){
				dayOrder.setStatus(OrderByDay.ORDER_STATUS_READY);
				dayOrder.setDeliveryDate(deliveryDate);
				deliveryDate = DateUtils.getDayByAdd(DateUtils.formatDate2(deliveryDate, "yyyy-MM-dd"), 1);
			}
		}
		order.setStatus(OrderMain.ORDER_STATUS_START);
		order.setRecoverTime(recoverTime);
		save(order);
		return order;
	}
	
	public OrderMain findByOutTradeNo(String outTradeNo) {
		return orderDao.findByOutTradeNo(outTradeNo);
	}
	
	
}
