package com.qmx.wxmp.entity.qyfw;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonFormat;

/**
 * 客户信息
 * 
 * @author zsmin
 *
 */
@Entity
@Table(name = "qyfw_customer")
public class Customer implements Serializable {

	private static final long	serialVersionUID	= -9171683396559489514L;

	@Id
	private String				id;

	/** 客户名称 */
	private String				name;

	/** 客户性质（1：企业；2-个人） */
	private String				customerType;

	/** 联系人 */
	private String				contact;

	/** 联系方式 */
	private String				phone;

	/** 备注 */
	private String				mark;

	/** 创建日期 */
	@Temporal(TemporalType.TIMESTAMP)
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
	protected Date				createDate;

	/** 删除标记（0：正常；1：删除） */
	protected String			delFlag;



	public Customer() {
		this.delFlag = "0";
	}



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



	public Date getCreateDate() {
		return createDate;
	}



	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}



	public String getDelFlag() {
		return delFlag;
	}



	public void setDelFlag(String delFlag) {
		this.delFlag = delFlag;
	}

}
