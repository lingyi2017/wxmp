package com.qmx.wxmp.repository.hibernate.order;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.qmx.wxmp.common.persistence.BaseDao;
import com.qmx.wxmp.entity.order.AccountAddress;

/**
 * 收货地址
 * @author itismin
 *
 */
@Repository
public class AccountAddressDao extends BaseDao<AccountAddress> {

	/**
	 * 查询用户收货地址列表
	 * @param openId
	 * @return
	 */
	public List<AccountAddress> getAddressListByAccountId(String accountId){
		DetachedCriteria dc = createDetachedCriteria();
		dc.createAlias("account", "account");
		dc.add(Restrictions.eq("account.id", accountId));
		dc.addOrder(Order.desc("isDefault"));
		return find(dc);
	}
	
	/**
	 * 查询用户默认收货地址
	 * @param accountId
	 * @return
	 */
	public AccountAddress getDefaultAddress(String accountId){
		DetachedCriteria dc = createDetachedCriteria();
		dc.createAlias("account", "account");
		dc.add(Restrictions.eq("account.id", accountId));
		dc.add(Restrictions.eq("isDefault",1));
		return find(dc).get(0);
	}
}
