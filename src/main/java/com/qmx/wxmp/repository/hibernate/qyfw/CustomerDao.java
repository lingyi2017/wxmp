package com.qmx.wxmp.repository.hibernate.qyfw;

import com.qmx.wxmp.common.persistence.BaseDao;
import com.qmx.wxmp.common.persistence.Parameter;
import com.qmx.wxmp.entity.qyfw.Customer;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 客户 Dao
 *
 * @author longxy
 * @date 2017-10-23 23:34
 */
@Repository
public class CustomerDao extends BaseDao<Customer> {

	public List<Customer> findByPhoneAndCustomerType(String phone, String customerType) {
		return find("FROM Customer WHERE phone = :p1 AND customerType = :p2 AND delFlag = '0'",
				new Parameter(phone, customerType));
	}
}
