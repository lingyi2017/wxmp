package com.qmx.wxmp.service.order;

import org.hibernate.criterion.DetachedCriteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.qmx.wxmp.common.persistence.Page;
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

	public Page<AccountScoreHistory> findList(Page<AccountScoreHistory> page, String accountId, String type) {
		DetachedCriteria dc = scoreHistoryDao.createDetachedCriteria();
		
		
		return scoreHistoryDao.find(page, dc);

	}
}
