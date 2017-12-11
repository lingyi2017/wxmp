package com.qmx.wxmp.entity.order;

import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.fasterxml.jackson.annotation.JsonFormat;
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
	public static final String ORDER_STATUS_START = "2";
	/** 订单状态:配送完成*/
	public static final String ORDER_STATUS_SUCCESS = "3";
	/** 订单状态:配送失败*/
	public static final String ORDER_STATUS_FAIL = "4";
	/** 订单状态:退款中*/
	public static final String ORDER_STATUS_REFUNDING = "5";
	/** 订单状态:退款完成*/
	public static final String ORDER_STATUS_REFUNDED = "6";
	/** 订单状态:暂停*/
	public static final String ORDER_STATUS_PAUSE = "7";
	
	/** 日订单号*/
	private String orderNumber;
	/** 配送日期*/
	private Date deliveryDate;
	/** 订单金额*/
	private BigDecimal orderMoney;
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

	@Temporal(TemporalType.DATE)
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
	public Date getDeliveryDate() {
		return deliveryDate;
	}
	public void setDeliveryDate(Date deliveryDate) {
		this.deliveryDate = deliveryDate;
	}
	@Column(precision=8,scale=2)
	public BigDecimal getOrderMoney() {
		return orderMoney;
	}
	public void setOrderMoney(BigDecimal orderMoney) {
		this.orderMoney = orderMoney;
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
