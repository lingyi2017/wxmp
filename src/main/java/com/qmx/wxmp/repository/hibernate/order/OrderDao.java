package com.qmx.wxmp.repository.hibernate.order;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.qmx.wxmp.common.persistence.BaseDao;
import com.qmx.wxmp.common.persistence.Parameter;
import com.qmx.wxmp.entity.order.OrderMain;

/**
 * 订单
 * @author itismin
 *
 */
@Repository
public class OrderDao extends BaseDao<OrderMain> {

	public OrderMain findByOutTradeNo(String outTradeNo) {
		return getByHql("from OrderMain where outTradeNo =:p1", new Parameter(outTradeNo));
	}
	
	public List<OrderMain> findByOpenid(String openid) {
		return find("from OrderMain where openid =:p1 and status<>'0' order by createDate desc", new Parameter(openid));
	}
}
