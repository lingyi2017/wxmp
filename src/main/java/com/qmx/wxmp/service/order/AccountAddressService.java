package com.qmx.wxmp.service.order;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.qmx.wxmp.common.utils.IdGen;
import com.qmx.wxmp.common.utils.StringUtils;
import com.qmx.wxmp.entity.order.Account;
import com.qmx.wxmp.entity.order.AccountAddress;
import com.qmx.wxmp.repository.hibernate.order.AccountAddressDao;
import com.qmx.wxmp.repository.hibernate.order.AccountDao;
import com.qmx.wxmp.service.BaseService;

/**
 * 收货地址service
 * @author itismin
 *
 */
@Service
@Transactional(readOnly = true)
public class AccountAddressService extends BaseService {

	@Autowired
	private AccountAddressDao accountAddressDao;
	@Autowired
	private AccountDao accountDao;

	public AccountAddress get(String id) {
		return accountAddressDao.get(id);
	}

	@Transactional(readOnly = false)
	public void saveByWeiXin(AccountAddress entity, Account account) {
		accountAddressDao.clear();
		//如果为默认地址，修改旧默认地址
		if(entity.getIsDefault() == 1){
			accountAddressDao.editDefaultAddress(account.getId());
		}
		if(StringUtils.isNotBlank(entity.getId())){//修改
			accountAddressDao.editBySql(entity);
		}else{//新增
			entity.setId(IdGen.uuid());
			entity.setAccount(account);
			entity.setCreateDate(new Date());
			accountAddressDao.saveBySql(entity);
		}
	}
	
	@Transactional(readOnly = false)
	public void save(AccountAddress entity) {
		accountAddressDao.clear();
		accountAddressDao.save(entity);
	}

	@Transactional(readOnly = false)
	public void delete(String id) {
		accountAddressDao.delById(id);
	}
	
	/**
	 * 根据accountId查询用户收货地址列表
	 * @param openId
	 * @return
	 */
	public List<AccountAddress> findAddressListByAccountId(String accountId){
		return accountAddressDao.getAddressListByAccountId(accountId);
	}
	
	/**
	 * 更新默认收货地址
	 * @param addressId 选择的默认地址
	 * * @param accountId 用户ID
	 */
	@Transactional(readOnly = false)
	public void updateDefaultAddress(String accountId, String addressId){
		AccountAddress oldDefaultAddress = accountAddressDao.getDefaultAddress(accountId);
		AccountAddress newDefaultAddress = accountAddressDao.get(addressId);
		newDefaultAddress.setIsDefault(1);
		save(newDefaultAddress);
		oldDefaultAddress.setIsDefault(0);
		save(oldDefaultAddress);
	}
	
}
