package com.qmx.wxmp.service.dcxt;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.qmx.wxmp.common.persistence.Page;
import com.qmx.wxmp.entity.dcxt.Combo;
import com.qmx.wxmp.repository.hibernate.dcxt.ComboDao;
import com.qmx.wxmp.service.BaseService;

/**
 * 份量Service
 *
 * @author longxy
 * @date 2017-11-23 22:05
 */
@Service
@Transactional(readOnly = true)
public class ComboService extends BaseService {

	@Autowired
	private ComboDao thisDao;



	public Combo get(String id) {
		return thisDao.get(id);
	}



	@Transactional(readOnly = false)
	public void save(Combo entity) {
		thisDao.clear();
		thisDao.save(entity);
	}



	@Transactional(readOnly = false)
	public void delete(String id) {
		thisDao.deleteById(id);
	}



	public Page<Combo> findList(Page<Combo> page, Combo entity) {

		DetachedCriteria dc = thisDao.createDetachedCriteria();

		if (StringUtils.isNotBlank(entity.getName())) {
			dc.add(Restrictions.like("name", "%" + entity.getName() + "%"));
		}

		dc.add(Restrictions.eq("delFlag", Combo.DEL_FLAG_NORMAL));
		if (StringUtils.isBlank(page.getOrderBy())) {
			dc.addOrder(Order.desc("createDate"));
		}
		return thisDao.find(page, dc);

	}
}
