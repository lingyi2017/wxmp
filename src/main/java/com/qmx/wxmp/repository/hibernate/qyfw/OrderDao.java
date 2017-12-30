package com.qmx.wxmp.repository.hibernate.qyfw;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.qmx.wxmp.common.persistence.BaseDao;
import com.qmx.wxmp.common.persistence.Parameter;
import com.qmx.wxmp.entity.qyfw.Order;

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
	
	public List<Order> findByOpenid(String openid) {
		return find("from Order where openid =:p1 and status<>'0' order by createDate desc", new Parameter(openid));
	}
}
