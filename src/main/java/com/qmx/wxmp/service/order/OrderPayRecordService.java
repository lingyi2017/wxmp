package com.qmx.wxmp.service.order;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.qmx.wxmp.common.utils.IdGen;
import com.qmx.wxmp.entity.order.OrderPayRecord;
import com.qmx.wxmp.repository.hibernate.order.OrderPayRecordDao;
import com.qmx.wxmp.service.BaseService;


/**
 * 支付记录
 * @author itismin
 *
 */
@Service
public class OrderPayRecordService extends BaseService {

	@Autowired
	private OrderPayRecordDao thisDao;

	@Transactional(readOnly = false)
	public void save(OrderPayRecord record) {

		if (StringUtils.isEmpty(record.getId())) {
			record.setId(IdGen.uuid());
		}
		thisDao.clear();
		thisDao.save(record);

	}


}
