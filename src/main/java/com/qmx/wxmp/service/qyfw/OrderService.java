package com.qmx.wxmp.service.qyfw;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.qmx.wxmp.common.persistence.Page;
import com.qmx.wxmp.common.utils.DateUtils;
import com.qmx.wxmp.common.utils.IdGen;
import com.qmx.wxmp.dto.order.QueryOrderDto;
import com.qmx.wxmp.entity.qyfw.Order;
import com.qmx.wxmp.repository.hibernate.qyfw.CustomerDao;
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
	private OrderDao	thisDao;

	@Autowired
	private CustomerDao	customerDao;



	@Transactional(readOnly = false)
	public void save(Order order) {

		if (StringUtils.isEmpty(order.getId())) {
			order.setId(IdGen.uuid());
			order.setOutTradeNo(getOutTradeNo());
			order.setCreateDate(new Date());
		}
		thisDao.clear();
		thisDao.save(order);

	}
	
	private String getOutTradeNo(){    
		String chars = "1234567890";
		String key = "";
		for(int i=1; i<=6; i++){
			key += chars.charAt((int)(Math.random() * 10));
		}
		return DateUtils.dataToStr(new Date(), "yyyyMMddHHmmss") + key;
	}



	public Order get(String id) {
		return thisDao.get(id);
	}



	public Page<Order> find(Page<Order> page, QueryOrderDto queryDto) {

		DetachedCriteria dc = thisDao.createDetachedCriteria();

		dc.addOrder(org.hibernate.criterion.Order.desc("createDate"));
		if (null == queryDto) {
			return thisDao.find(page, dc);
		}
		dc.add(Restrictions.ne("status", "0"));
		if (StringUtils.isNotEmpty(queryDto.getBeginDate()) && StringUtils.isNotEmpty(queryDto.getEndDate())) {
			dc.add(Restrictions.between("createDate", DateUtils.parseDate(queryDto.getBeginDate() + " 00:00:00"),
					DateUtils.parseDate(queryDto.getEndDate() + " 23:59:59")));
		}
		if (StringUtils.isNotEmpty(queryDto.getContact())) {
			dc.add(Restrictions.like("contact", "%" + queryDto.getContact() + "%"));
		}
		dc.createAlias("basicService", "basicService");
		if (StringUtils.isNotEmpty(queryDto.getServiceName())) {
			dc.add(Restrictions.like("basicService.name", "%" + queryDto.getServiceName() + "%"));
		}
		if (StringUtils.isNotEmpty(queryDto.getStatus())) {
			dc.add(Restrictions.eq("status", queryDto.getStatus()));
		}

		return thisDao.find(page, dc);

	}



	public Order findByPhone(String phone) {
		return thisDao.findByPhone(phone);
	}
	
	public Order findByOutTradeNo(String outTradeNo) {
		return thisDao.findByOutTradeNo(outTradeNo);
	}
	public List<Order> findByOpenid(String openid) {
		return thisDao.findByOpenid(openid);
	}
	
	
}
