package com.qmx.wxmp.service.dcxt;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.qmx.wxmp.common.persistence.Page;
import com.qmx.wxmp.entity.dcxt.Product;
import com.qmx.wxmp.repository.hibernate.dcxt.ProductDao;
import com.qmx.wxmp.service.BaseService;

import java.util.List;

/**
 * 产品 Service
 *
 * @author longxy
 * @date 2017-11-23 21:34
 */
@Service
@Transactional(readOnly = true)
public class ProductService extends BaseService {

	@Autowired
	private ProductDao thisDao;



	public Product get(String id) {
		return thisDao.get(id);
	}



	@Transactional(readOnly = false)
	public void save(Product entity) {
		thisDao.clear();
		thisDao.save(entity);
	}



	@Transactional(readOnly = false)
	public void delete(String id) {
		thisDao.deleteById(id);
	}



	@Transactional(readOnly = false)
	public void updateState(String id, String state) {
		thisDao.updateState(id, state);
	}



	public Page<Product> findList(Page<Product> page, Product entity) {

		DetachedCriteria dc = thisDao.createDetachedCriteria();

		if (StringUtils.isNotBlank(entity.getName())) {
			dc.add(Restrictions.like("name", "%" + entity.getName() + "%"));
		}
		if (StringUtils.isNotEmpty(entity.getState())) {
			dc.add(Restrictions.eq("state", entity.getState()));
		}

		dc.add(Restrictions.eq("delFlag", Product.DEL_FLAG_NORMAL));
		if (StringUtils.isBlank(page.getOrderBy())) {
			dc.addOrder(Order.desc("createDate"));
		}
		return thisDao.find(page, dc);

	}



	public List<Product> findAll() {

		DetachedCriteria dc = thisDao.createDetachedCriteria();
		dc.add(Restrictions.eq("delFlag", Product.DEL_FLAG_NORMAL));
		dc.add(Restrictions.eq("state", Product.STATE_ACTIVE));
		dc.addOrder(Order.desc("createDate"));
		return thisDao.find(dc);

	}
}
