package com.qmx.wxmp.repository.hibernate.order;

import org.springframework.stereotype.Repository;

import com.qmx.wxmp.common.persistence.BaseDao;
import com.qmx.wxmp.common.persistence.Parameter;
import com.qmx.wxmp.entity.order.Account;

/**
 * 用户
 * @author itismin
 *
 */
@Repository
public class AccountDao extends BaseDao<Account> {

	/**
	 * 根据openid得到用户
	 * @param openId
	 * @return
	 */
	public Account getAccountByOpenId(String openId){
		return getByHql("from Account where openid = :p1", new Parameter(openId));
	}
}
