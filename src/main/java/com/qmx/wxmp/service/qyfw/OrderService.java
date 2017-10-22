package com.qmx.wxmp.service.qyfw;

import com.qmx.wxmp.entity.qyfw.Order;
import com.qmx.wxmp.repository.hibernate.qyfw.OrderDao;
import com.qmx.wxmp.service.BaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 订单 Service
 *
 * @author longxy
 * @date 2017-10-22 21:37
 */
@Service
public class OrderService extends BaseService {

	@Autowired
	private OrderDao orderDao;



	public Order get(String id) {
		return orderDao.get(id);
	}
}
