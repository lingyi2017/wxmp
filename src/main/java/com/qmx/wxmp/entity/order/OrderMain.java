package com.qmx.wxmp.entity.order;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.NotFound;

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
	/** 退款状态:处理中*/
	public static final String REFUND_BEGIN = "1";
	/** 退款状态:完成*/
	public static final String REFUND_END = "2";
	/** 退款状态:拒绝*/
	public static final String REFUND_REFUSE = "3";

	/** 订单号*/
	public String orderNumber;
	/** 下单时间*/
	public String orderTime;
	/** 订单备注*/
	public String orderMark;
	/** 订单状态*/
	public String orderStatus;
	/** 退款备注*/
	public String refundMark;
	/** 退款回复*/
	public String refundReply;
	
	/** 订单总金额*/
	public Float orderMoney;
	/** 优惠金额*/
	public Float favourableMoney;
	/** 实付金额*/
	public Float paidMoney;
	/** 购买天数*/
	public Integer days;
	
	/** 客户*/
	@ManyToOne
	@JoinColumn(name="account_id")
	@NotFound
	public Account account;
	
	/** 收货地址*/
	@ManyToOne
	@JoinColumn(name="address_id")
	public AccountAddress address;
	
	/** 订单评价*/
	@OneToOne(mappedBy="order")
	public OrderComment comment;

	public String getOrderNumber() {
		return orderNumber;
	}

	public void setOrderNumber(String orderNumber) {
		this.orderNumber = orderNumber;
	}

	public String getOrderTime() {
		return orderTime;
	}

	public void setOrderTime(String orderTime) {
		this.orderTime = orderTime;
	}

	public String getOrderMark() {
		return orderMark;
	}

	public void setOrderMark(String orderMark) {
		this.orderMark = orderMark;
	}

	public String getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}

	public String getRefundMark() {
		return refundMark;
	}

	public void setRefundMark(String refundMark) {
		this.refundMark = refundMark;
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

	public Account getAccount() {
		return account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}

	public AccountAddress getAddress() {
		return address;
	}

	public void setAddress(AccountAddress address) {
		this.address = address;
	}

	public OrderComment getComment() {
		return comment;
	}

	public void setComment(OrderComment comment) {
		this.comment = comment;
	}
	
	
	
}
