package com.qmx.wxmp.repository.hibernate.order;

import org.springframework.stereotype.Repository;

import com.qmx.wxmp.common.persistence.BaseDao;
import com.qmx.wxmp.common.persistence.Parameter;
import com.qmx.wxmp.entity.order.OrderByDay;

/**
 * 每日订单
 * @author itismin
 *
 */
@Repository
public class OrderByDayDao extends BaseDao<OrderByDay> {

	public void updateOrderStatusByIds(String[] orderIds){
		updateBySql("update dcxt_order_day set status = :status where id in (:ids)", new Parameter(new Object[][]{{"status", OrderByDay.ORDER_STATUS_START}, {"ids", orderIds}}));
	}
}
