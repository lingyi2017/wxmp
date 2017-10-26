package com.qmx.wxmp.entity.qyfw;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;


/**
 * 咨询信息
 * @author zsmin
 *
 */
@Entity
@Table(name = "qyfw_consulting")
public class Consulting {

	/** 处理状态：未处理*/
	public static final String DEAL_NO = "1";
	/** 处理状态：已处理*/
	public static final String DEAL_YES = "2";
	
	@Id
	private String id;
	
	/** 咨询人*/
	private String person;
	
	/** 联系方式*/
	private String phone;
	
	/** 客户性质*/
	private String customerType;
	
	/** 咨询内容*/
	private String content;
	
	/** 咨询时间*/
	private Date time;
	
	/** 处理状态*/
	private String dealStatus;
	
	/** 处理反馈*/
	private String dealBack;
	
	/** 处理时间*/
	private Date dealTime;
	
	@ManyToOne
	@JoinColumn(name="customer_id")
	private Customer customer;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

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

	public String getCustomerType() {
		return customerType;
	}

	public void setCustomerType(String customerType) {
		this.customerType = customerType;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	public String getDealStatus() {
		return dealStatus;
	}

	public void setDealStatus(String dealStatus) {
		this.dealStatus = dealStatus;
	}

	public String getDealBack() {
		return dealBack;
	}

	public void setDealBack(String dealBack) {
		this.dealBack = dealBack;
	}

	public Date getDealTime() {
		return dealTime;
	}

	public void setDealTime(Date dealTime) {
		this.dealTime = dealTime;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	
	
}
