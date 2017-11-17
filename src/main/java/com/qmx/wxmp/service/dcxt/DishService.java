package com.qmx.wxmp.service.dcxt;

import com.qmx.wxmp.common.persistence.Page;
import com.qmx.wxmp.entity.dcxt.Dish;
import com.qmx.wxmp.repository.hibernate.dcxt.DishDao;
import com.qmx.wxmp.service.BaseService;
import org.apache.commons.lang3.StringUtils;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 订餐 Service
 *
 * @author longxy
 * @date 2017-11-17 23:57
 */
@Service
@Transactional(readOnly = true)
public class DishService extends BaseService {

	@Autowired
	private DishDao thisDao;



	public Dish get(String id) {
		return thisDao.get(id);
	}



	@Transactional(readOnly = false)
	public void save(Dish entity) {
		thisDao.clear();
		thisDao.save(entity);
	}



	@Transactional(readOnly = false)
	public void delete(String id) {
		thisDao.deleteById(id);
	}



	public Page<Dish> findList(Page<Dish> page, Dish entity) {

		DetachedCriteria dc = thisDao.createDetachedCriteria();

		if (StringUtils.isNotBlank(entity.getName())) {
			dc.add(Restrictions.like("name", "%" + entity.getName() + "%"));
		}

		dc.add(Restrictions.eq("delFlag", Dish.DEL_FLAG_NORMAL));
		if (StringUtils.isBlank(page.getOrderBy())) {
			dc.addOrder(Order.desc("createDate"));
		}
		return thisDao.find(page, dc);

	}
}
