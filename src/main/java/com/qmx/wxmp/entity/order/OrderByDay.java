package com.qmx.wxmp.entity.order;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
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
	
	private String orderNumber;
	/** 配送日期*/
	private Date deliveryDate;
	/** 配送状态*/
	private String status;
	/** 收货人*/
	private String person;
	/** 收货电话*/
	private String phone;
	/** 收货地址*/
	private String address;
	/** 更新时间*/
	private Date updateTime;
	/** 主订单*/
	private OrderMain order;

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
	public String getOrderNumber() {
		return orderNumber;
	}
	public void setOrderNumber(String orderNumber) {
		this.orderNumber = orderNumber;
	}
	@ManyToOne
	@JoinColumn(name="order_id")
	public OrderMain getOrder() {
		return order;
	}
	public void setOrder(OrderMain order) {
		this.order = order;
	}
	
}
