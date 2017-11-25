package com.qmx.wxmp.entity.order;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.qmx.wxmp.common.persistence.BaseSimpleEntity;

/**
 * 收货地址
 * @author itismin
 *
 */
@Entity
@Table(name="dcxt_account_address")
public class AccountAddress extends BaseSimpleEntity {

	private static final long serialVersionUID = 1L;
	
	public AccountAddress() {
		super();
	}
	
	/** 收货人*/
	private String person;
	/** 收货电话*/
	private String phone;
	/** 详细地址*/
	private String address;
	/** 是否默认*/
	private String isDefault;
	/** 用户*/
	private Account account;

	public String getPerson() {
		return person;
	}

	public void setPerson(String person) {
		this.person = person;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getIsDefault() {
		return isDefault;
	}

	public void setIsDefault(String isDefault) {
		this.isDefault = isDefault;
	}

	@ManyToOne
	@JoinColumn(name="account_id")
	public Account getAccount() {
		return account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}
	
	
}
