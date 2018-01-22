package com.qmx.wxmp.entity.order;

import javax.persistence.Column;
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
	/** 地址:省*/
	private String provence;
	/** 地址:城市*/
	private String city;
	/** 地址:区县*/
	private String county;
	/** 详细地址*/
	private String address;
	/** 是否默认*/
	private Integer isDefault;
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

	@Column(name="is_default")
	public Integer getIsDefault() {
		return isDefault;
	}

	public void setIsDefault(Integer isDefault) {
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

	public String getProvence() {
		return provence;
	}

	public void setProvence(String provence) {
		this.provence = provence;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getCounty() {
		return county;
	}

	public void setCounty(String county) {
		this.county = county;
	}

}
