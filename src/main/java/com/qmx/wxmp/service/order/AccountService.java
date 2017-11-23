package com.qmx.wxmp.service.order;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.qmx.wxmp.common.persistence.Page;
import com.qmx.wxmp.entity.dcxt.Dish;
import com.qmx.wxmp.entity.order.Account;
import com.qmx.wxmp.repository.hibernate.order.AccountDao;
import com.qmx.wxmp.service.BaseService;

/**
 * 用户service
 * @author itismin
 *
 */
@Service
@Transactional(readOnly = true)
public class AccountService extends BaseService {

	@Autowired
	private AccountDao accountDao;



	public Account get(String id) {
		return accountDao.get(id);
	}



	@Transactional(readOnly = false)
	public void save(Account entity) {
		accountDao.clear();
		accountDao.save(entity);
	}



	@Transactional(readOnly = false)
	public void delete(String id) {
		accountDao.deleteById(id);
	}



	public Page<Account> findList(Page<Account> page, Account entity) {

		DetachedCriteria dc = accountDao.createDetachedCriteria();

		if (StringUtils.isNotBlank(entity.getName())) {
			dc.add(Restrictions.like("name", "%" + entity.getName() + "%"));
		}

		dc.add(Restrictions.eq("delFlag", Dish.DEL_FLAG_NORMAL));
		if (StringUtils.isBlank(page.getOrderBy())) {
			dc.addOrder(Order.desc("createDate"));
		}
		return accountDao.find(page, dc);

	}
}