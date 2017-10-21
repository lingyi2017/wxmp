package com.qmx.wxmp.entity.qyfw;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

/**
 * 客户信息
 * @author zsmin
 *
 */
@Entity
@Table(name = "qyfw_customer")
public class Customer {

	/** 客户性质：个人*/
	public static final String CUSTOMER_TYPE_PERSON = "1";
	/** 客户性质：企业*/
	public static final String CUSTOMER_TYPE_BUSINESS = "2";
	
	@Id
	@GeneratedValue(generator = "system-uuid")
	@GenericGenerator(name = "system-uuid", strategy = "uuid")
	private String id;
	
	/** 客户名称*/
	private String name;
	
	/** 客户性质*/
	private String customerType;
	
	/** 联系人*/
	private String contact;

	/** 联系方式*/
	private String phone;
	
	/** 备注*/
	private String mark;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCustomerType() {
		return customerType;
	}

	public void setCustomerType(String customerType) {
		this.customerType = customerType;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getMark() {
		return mark;
	}

	public void setMark(String mark) {
		this.mark = mark;
	}
	
	
}
