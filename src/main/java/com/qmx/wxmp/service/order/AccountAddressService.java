package com.qmx.wxmp.service.order;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.qmx.wxmp.entity.order.AccountAddress;
import com.qmx.wxmp.repository.hibernate.order.AccountAddressDao;
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

	public AccountAddress get(String id) {
		return accountAddressDao.get(id);
	}

	@Transactional(readOnly = false)
	public void save(AccountAddress entity) {
		accountAddressDao.clear();
		accountAddressDao.save(entity);
	}

	@Transactional(readOnly = false)
	public void delete(String id) {
		accountAddressDao.deleteById(id);
	}
	
	/**
	 * 订单的收货地址
	 * @param orderId 订单id
	 * @return
	 */
	public AccountAddress getByOrderId(String orderId) {
		return accountAddressDao.findByOrder(orderId);
	}
}
