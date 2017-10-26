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
}
