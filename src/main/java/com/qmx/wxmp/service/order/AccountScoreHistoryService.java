package com.qmx.wxmp.service.order;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.qmx.wxmp.common.persistence.BaseSimpleEntity;
import com.qmx.wxmp.common.persistence.Page;
import com.qmx.wxmp.entity.dcxt.Dish;
import com.qmx.wxmp.entity.order.Account;
import com.qmx.wxmp.entity.order.AccountScoreHistory;
import com.qmx.wxmp.repository.hibernate.order.AccountScoreHistoryDao;
import com.qmx.wxmp.service.BaseService;

/**
 * 积分历史service
 * @author itismin
 *
 */
@Service
@Transactional(readOnly = true)
public class AccountScoreHistoryService extends BaseService {

	@Autowired
	private AccountScoreHistoryDao scoreHistoryDao;

	public List<AccountScoreHistory> findList(Account account) {
		DetachedCriteria dc = scoreHistoryDao.createDetachedCriteria();
		dc.createAlias("account", "account");
		dc.add(Restrictions.eq("account.id", account.getId()));
		dc.add(Restrictions.eq("delFlag", BaseSimpleEntity.DEL_FLAG_NORMAL));
		dc.addOrder(Order.desc("createDate"));
		return scoreHistoryDao.find(dc);

	}
}
