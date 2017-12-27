package com.qmx.wxmp.repository.hibernate.qyfw;

import com.qmx.wxmp.common.persistence.BaseDao;
import com.qmx.wxmp.common.persistence.Parameter;
import com.qmx.wxmp.entity.qyfw.Order;
import org.springframework.stereotype.Repository;

/**
 * 订单 Dao
 *
 * @author longxy
 * @date 2017-10-22 21:34
 */
@Repository
public class OrderDao extends BaseDao<Order> {
	
	public Order findByPhone(String phone) {
		return getByHql("from Order where phone =:p1", new Parameter(phone));
	}
	
	public Order findByOutTradeNo(String outTradeNo) {
		return getByHql("from Order where outTradeNo =:p1", new Parameter(outTradeNo));
	}
	
	public Order findByOpenid(String openid) {
		return getByHql("from Order where openid =:p1", new Parameter(openid));
	}
}
