package com.qmx.wxmp.entity.order;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
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
	
	/** 订单状态:未支付*/
	public static final String ORDER_STATUS_NOPAY= "1";
	/** 订单状态:进行中*/
	public static final String ORDER_STATUS_START = "2";
	/** 订单状态:暂停*/
	public static final String ORDER_STATUS_PAUSE = "3";
	/** 订单状态:退款中*/
	public static final String ORDER_STATUS_REFUND = "4";
	/** 订单状态:完成*/
	public static final String ORDER_REFUND_END = "5";
	
	/** 订单号*/
	private String orderNumber;
	/** 下单时间*/
	private Date orderTime;
	/** 暂停时间*/
	private Date pauseTime;
	/** 恢复时间*/
	private Date recoverTime;
	/** 订单状态*/
	private String status;
	/** 订单总金额*/
	private BigDecimal orderMoney;
	/** 优惠金额*/
	private BigDecimal favourableMoney;
	/** 实付金额*/
	private BigDecimal paidMoney;
	/** 支付方式*/
	private String payWay;
	/** 购买天数*/
	private Integer days;
	/** 完成天数*/
	private Integer finishDays;
	/** 客户*/
	private Account account;
	/** 订单评价*/
	private OrderComment comment;
	/** 子订单*/
	private List<OrderByDay> orderByDays;

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

	@Temporal(TemporalType.TIMESTAMP)
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
	public Date getPauseTime() {
		return pauseTime;
	}

	public void setPauseTime(Date pauseTime) {
		this.pauseTime = pauseTime;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
	public Date getRecoverTime() {
		return recoverTime;
	}

	public void setRecoverTime(Date recoverTime) {
		this.recoverTime = recoverTime;
	}
	
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Column(precision=8,scale=2)
	public BigDecimal getOrderMoney() {
		return orderMoney;
	}

	public void setOrderMoney(BigDecimal orderMoney) {
		this.orderMoney = orderMoney;
	}

	@Column(precision=8,scale=2)
	public BigDecimal getFavourableMoney() {
		return favourableMoney;
	}

	public void setFavourableMoney(BigDecimal favourableMoney) {
		this.favourableMoney = favourableMoney;
	}

	@Column(precision=8,scale=2)
	public BigDecimal getPaidMoney() {
		return paidMoney;
	}

	public void setPaidMoney(BigDecimal paidMoney) {
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

	@OneToMany(mappedBy="order",cascade={CascadeType.ALL})
	public List<OrderByDay> getOrderByDays() {
		return orderByDays;
	}

	public void setOrderByDays(List<OrderByDay> orderByDays) {
		this.orderByDays = orderByDays;
	}
	
}
