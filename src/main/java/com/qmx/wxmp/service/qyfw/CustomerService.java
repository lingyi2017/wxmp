package com.qmx.wxmp.service.qyfw;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.qmx.wxmp.common.persistence.Page;
import com.qmx.wxmp.common.utils.IdGen;
import com.qmx.wxmp.entity.qyfw.Customer;
import com.qmx.wxmp.repository.hibernate.qyfw.CustomerDao;
import com.qmx.wxmp.service.BaseService;
import org.springframework.util.CollectionUtils;

/**
 * 客户 Service
 *
 * @author longxy
 * @date 2017-10-23 23:35
 */
@Service
public class CustomerService extends BaseService {

	@Autowired
	private CustomerDao thisDao;



	public Customer get(String id) {
		return thisDao.get(id);
	}



	@Transactional(readOnly = false)
	public void save(Customer customer) {

		if (StringUtils.isEmpty(customer.getId())) {
			customer.setId(IdGen.uuid());
			customer.setCreateDate(new Date());
		}
		thisDao.clear();
		thisDao.save(customer);

	}



	@Transactional(readOnly = false)
	public void delete(String id) {
		thisDao.deleteById(id);
	}



	public Page<Customer> find(Page<Customer> page, Customer customer) {
		DetachedCriteria dc = thisDao.createDetachedCriteria();
		if (StringUtils.isNotEmpty(customer.getCustomerType())) {
			dc.add(Restrictions.eq("customerType", customer.getCustomerType()));
		}
		if (StringUtils.isNotEmpty(customer.getName())) {
			dc.add(Restrictions.like("name", "%" + customer.getName() + "%"));
		}
		dc.add(Restrictions.eq("delFlag", "0"));
		dc.addOrder(Order.desc("createDate"));
		return thisDao.find(page, dc);
	}



	public Customer findByPhoneAndCustomerType(String phone, String customerType) {
		List<Customer> customers = thisDao.findByPhoneAndCustomerType(phone, customerType);
		if (CollectionUtils.isEmpty(customers)) {
			return null;
		}
		return customers.get(0);
	}

}
