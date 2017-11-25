package com.qmx.wxmp.repository.hibernate.order;

import org.springframework.stereotype.Repository;

import com.qmx.wxmp.common.persistence.BaseDao;
import com.qmx.wxmp.common.persistence.Parameter;
import com.qmx.wxmp.entity.order.AccountAddress;

/**
 * 收货地址
 * @author itismin
 *
 */
@Repository
public class AccountAddressDao extends BaseDao<AccountAddress> {

	/**
	 * 指定订单的收货地址
	 * @param orderId 订单id
	 * @return
	 */
	public AccountAddress findByOrder(String orderId){
		return (AccountAddress) findBySql("select * from dcxt_account_address where id = (select address_id from dcxt_order where id = :p1)", new Parameter(orderId), AccountAddress.class).get(0);
	}
}
