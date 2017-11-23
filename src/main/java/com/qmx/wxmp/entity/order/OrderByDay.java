package com.qmx.wxmp.entity.order;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Table;

import com.qmx.wxmp.common.persistence.BaseSimpleEntity;

/**
 * 每日订单
 * @author itismin
 *
 */
@Entity
@Table(name="dcxt_order_day")
public class OrderByDay extends BaseSimpleEntity {

	private static final long serialVersionUID = 1L;
	
	public OrderByDay() {
		super();
	}
	/** 订单状态:未配送*/
	public static final String ORDER_STATUS_READY = "1";
	/** 订单状态:配送中*/
	public static final String ORDER_STATUS_BEGIN = "2";
	/** 订单状态:配送完成*/
	public static final String ORDER_STATUS_END = "3";
	
	/** 配送日期*/
	public Date deliveryDate;
	/** 配送状态*/
	public String status;
	/** 收货人*/
	public String person;
	/** 收货电话*/
	public String phone;
	/** 收货地址*/
	public String address;
	/** 更新时间*/
	public Date updateTime;

	public Date getDeliveryDate() {
		return deliveryDate;
	}
	public void setDeliveryDate(Date deliveryDate) {
		this.deliveryDate = deliveryDate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Date getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
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
	
}
