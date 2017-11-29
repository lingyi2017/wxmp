package com.qmx.wxmp.entity.order;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.qmx.wxmp.common.persistence.BaseSimpleEntity;

/**
 * 主订单信息
 * @author itismin
 *
 */
@Entity
@Table(name="dcxt_order")
public class OrderMain extends BaseSimpleEntity {

	private static final long serialVersionUID = 1L;
	
	public OrderMain() {
		super();
	}
	
	/** 订单状态:进行中*/
	public static final String ORDER_STATUS_BEGIN = "1";
	/** 订单状态:暂停*/
	public static final String ORDER_STATUS_PAUSE = "2";
	/** 订单状态:完成*/
	public static final String ORDER_STATUS_END = "3";
	/** 订单状态:退款处理中*/
	public static final String ORDER_REFUND_BEGIN = "4";
	/** 订单状态:退款同意*/
	public static final String ORDER_REFUND_AGREE = "5";
	/** 订单状态:退款拒绝*/
	public static final String ORDER_REFUND_REFUSE = "6";
	
	/** 订单号*/
	private String orderNumber;
	/** 下单时间*/
	private Date orderTime;
	/** 订单状态*/
	private String orderStatus;
	/** 订单总金额*/
	private Float orderMoney;
	/** 优惠金额*/
	private Float favourableMoney;
	/** 实付金额*/
	private Float paidMoney;
	/** 支付方式*/
	private String payWay;
	/** 购买天数*/
	private Integer days;
	/** 完成天数*/
	private Integer finishDays;

	/** 是否发生退款*/
	private String isRefund;
	/** 退款申请时间*/
	private Date refundTime;
	/** 退款原因*/
	private String refundReason;
	/** 退款回复*/
	private String refundReply;
	/** 退款金额*/
	private Float refundMoney;
	/** 客户*/
	private Account account;
	/** 收货地址*/
	private AccountAddress address;
	/** 订单评价*/
	private OrderComment comment;

	public String getOrderNumber() {
		return orderNumber;
	}

	public void setOrderNumber(String orderNumber) {
		this.orderNumber = orderNumber;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
	public Date getOrderTime() {
		return orderTime;
	}

	public void setOrderTime(Date orderTime) {
		this.orderTime = orderTime;
	}

	public String getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}

	public String getRefundReason() {
		return refundReason;
	}

	public void setRefundReason(String refundReason) {
		this.refundReason = refundReason;
	}

	public String getRefundReply() {
		return refundReply;
	}

	public void setRefundReply(String refundReply) {
		this.refundReply = refundReply;
	}

	public Float getOrderMoney() {
		return orderMoney;
	}

	public void setOrderMoney(Float orderMoney) {
		this.orderMoney = orderMoney;
	}

	public Float getFavourableMoney() {
		return favourableMoney;
	}

	public void setFavourableMoney(Float favourableMoney) {
		this.favourableMoney = favourableMoney;
	}

	public Float getPaidMoney() {
		return paidMoney;
	}

	public void setPaidMoney(Float paidMoney) {
		this.paidMoney = paidMoney;
	}

	public Integer getDays() {
		return days;
	}

	public void setDays(Integer days) {
		this.days = days;
	}

	@ManyToOne
	@JoinColumn(name = "account_id")
	public Account getAccount() {
		return account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}


	@ManyToOne
	@JoinColumn(name="address_id")
	public AccountAddress getAddress() {
		return address;
	}

	public void setAddress(AccountAddress address) {
		this.address = address;
	}

	@OneToOne(mappedBy="order")
	public OrderComment getComment() {
		return comment;
	}

	public void setComment(OrderComment comment) {
		this.comment = comment;
	}

	public Integer getFinishDays() {
		return finishDays;
	}

	public void setFinishDays(Integer finishDays) {
		this.finishDays = finishDays;
	}

	public String getPayWay() {
		return payWay;
	}

	public void setPayWay(String payWay) {
		this.payWay = payWay;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
	public Date getRefundTime() {
		return refundTime;
	}

	public void setRefundTime(Date refundTime) {
		this.refundTime = refundTime;
	}

	public Float getRefundMoney() {
		return refundMoney;
	}

	public void setRefundMoney(Float refundMoney) {
		this.refundMoney = refundMoney;
	}

	public String getIsRefund() {
		return isRefund;
	}

	public void setIsRefund(String isRefund) {
		this.isRefund = isRefund;
	}
	
	
}
