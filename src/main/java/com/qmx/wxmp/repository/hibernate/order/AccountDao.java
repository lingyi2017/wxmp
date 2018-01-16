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
	
	/**
	 * 根据nickName得到用户数
	 * @param nickName
	 * @return
	 */
	public Integer getNumByNickName(String nickName){
		return Integer.parseInt(findBySql("select count(1) num from dcxt_account where nick_name = :p1",new Parameter(nickName)).get(0).toString());
	}
}
