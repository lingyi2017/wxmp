package com.qmx.wxmp.repository.hibernate.order;

import java.util.Date;
import java.util.List;

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
	
	public List<OrderByDay> getMonthEatList(Date beginDate, Date endDate, String accountId) {
		String sql = "select a.* from dcxt_order_day a join dcxt_order b on a.order_id = b.id "
				+ " where b.account_id =:p1 and a.status=:p2 and a.delivery_date >=:p3 and delivery_date <:p4 order by a.delivery_date";
		return findBySql(sql, new Parameter(accountId,OrderByDay.ORDER_STATUS_SUCCESS,beginDate,endDate), OrderByDay.class);
	}
}
