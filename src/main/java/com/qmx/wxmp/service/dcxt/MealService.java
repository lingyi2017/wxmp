package com.qmx.wxmp.service.dcxt;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.qmx.wxmp.common.persistence.Page;
import com.qmx.wxmp.entity.dcxt.Meal;
import com.qmx.wxmp.repository.hibernate.dcxt.MealDao;
import com.qmx.wxmp.service.BaseService;

/**
 * 餐标 Service
 *
 * @author longxy
 * @date 2017-11-21 22:58
 */
@Service
@Transactional(readOnly = true)
public class MealService extends BaseService {

	@Autowired
	private MealDao thisDao;



	public Meal get(String id) {
		return thisDao.get(id);
	}



	@Transactional(readOnly = false)
	public void save(Meal entity) {
		thisDao.clear();
		thisDao.save(entity);
	}



	@Transactional(readOnly = false)
	public void delete(String id) {
		thisDao.deleteById(id);
	}



	public Page<Meal> findList(Page<Meal> page, Meal entity) {

		DetachedCriteria dc = thisDao.createDetachedCriteria();

		if (StringUtils.isNotBlank(entity.getType())) {
			dc.add(Restrictions.eq("type", entity.getType()));
		}
		if (StringUtils.isNotEmpty(entity.getState())) {
			dc.add(Restrictions.eq("state", entity.getState()));
		}

		dc.add(Restrictions.eq("delFlag", Meal.DEL_FLAG_NORMAL));
		if (StringUtils.isBlank(page.getOrderBy())) {
			dc.addOrder(Order.desc("createDate"));
		}
		return thisDao.find(page, dc);

	}
}
