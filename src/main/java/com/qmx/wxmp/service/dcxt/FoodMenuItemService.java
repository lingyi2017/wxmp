package com.qmx.wxmp.service.dcxt;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.qmx.wxmp.common.persistence.Page;
import com.qmx.wxmp.entity.dcxt.FoodMenuItem;
import com.qmx.wxmp.repository.hibernate.dcxt.FoodMenuItemDao;
import com.qmx.wxmp.service.BaseService;

/**
 * 菜单明细 Service
 *
 * @author longxy
 * @date 2017-11-25 16:27
 */
@Service
@Transactional(readOnly = true)
public class FoodMenuItemService extends BaseService {

	@Autowired
	private FoodMenuItemDao thisDao;



	public FoodMenuItem get(String id) {
		return thisDao.get(id);
	}



	@Transactional(readOnly = false)
	public void save(FoodMenuItem entity) {
		thisDao.clear();
		thisDao.save(entity);
	}



	@Transactional(readOnly = false)
	public void delete(String id) {
		thisDao.deleteById(id);
	}



	public Page<FoodMenuItem> findList(Page<FoodMenuItem> page, FoodMenuItem entity) {

		DetachedCriteria dc = thisDao.createDetachedCriteria();

		dc.add(Restrictions.eq("delFlag", FoodMenuItem.DEL_FLAG_NORMAL));
		if (StringUtils.isBlank(page.getOrderBy())) {
			dc.addOrder(Order.desc("createDate"));
		}
		return thisDao.find(page, dc);

	}
}
