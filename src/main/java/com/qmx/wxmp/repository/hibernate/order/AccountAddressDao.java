package com.qmx.wxmp.repository.hibernate.order;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.qmx.wxmp.common.persistence.BaseDao;
import com.qmx.wxmp.common.persistence.Parameter;
import com.qmx.wxmp.dto.dcxt.FoodMenuDto;
import com.qmx.wxmp.entity.dcxt.FoodMenu;
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
		dc.addOrder(Order.desc("createDate"));
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
	
	/**
	 * 修改默认地址属性
	 * @param accountId
	 */
	public void editDefaultAddress(String accountId) {

		String sql = "update dcxt_account_address set is_default = :is_default WHERE account_id = :account_id";
		Parameter parameter = new Parameter();
		parameter.put("is_default", 0);
		parameter.put("account_id", accountId);
		updateBySql(sql, parameter);

	}
	
	/**
	 * 微信端保存地址
	 * @param address
	 */
	public void saveBySql(AccountAddress address) {

		String sql = "insert into dcxt_account_address(id, person, phone, provence, city, county , address,is_default,account_id,create_date,del_flag) "
				+ "VALUES(:id, :person, :phone,:provence,:city,:county,:address,:is_default,:account_id,:create_date, :del_flag)";
		Parameter parameter = new Parameter();
		parameter.put("id", address.getId());
		parameter.put("person", address.getPerson());
		parameter.put("phone", address.getPhone());
		parameter.put("provence", address.getProvence());
		parameter.put("city", address.getCity());
		parameter.put("county", address.getCounty());
		parameter.put("address", address.getAddress());
		parameter.put("is_default", address.getIsDefault());
		parameter.put("account_id", address.getAccount().getId());
		parameter.put("create_date", address.getCreateDate());
		parameter.put("del_flag", AccountAddress.DEL_FLAG_NORMAL);
		updateBySql(sql, parameter);

	}
	
	/**
	 * 微信端修改地址
	 * @param address
	 */
	public void editBySql(AccountAddress address) {

		String sql = "update dcxt_account_address set person=:person,phone=:phone,provence=:provence,city=:city,"
				+ "county=:county,address=:address,is_default=:is_default where id=:id";
		Parameter parameter = new Parameter();
		parameter.put("id", address.getId());
		parameter.put("person", address.getPerson());
		parameter.put("phone", address.getPhone());
		parameter.put("provence", address.getProvence());
		parameter.put("city", address.getCity());
		parameter.put("county", address.getCounty());
		parameter.put("address", address.getAddress());
		parameter.put("is_default", address.getIsDefault());
		parameter.put("id", address.getId());
		updateBySql(sql, parameter);

	}
}
