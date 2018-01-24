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
	/** 微信订单号*/
	private String outTradeNo;
	/** 下单时间*/
	private Date orderTime;
	/** 暂停时间*/
	private Date pauseTime;
	/** 恢复时间*/
	private Date recoverTime;
	/** 产品名称*/
	private String productName;;
	/** 订单状态*/
	private String status;
	/** 订单总金额*/
	private BigDecimal totalMoney;
	/** 优惠金额*/
	private BigDecimal favourableMoney;
	/** 实付金额*/
	private BigDecimal payMoney;
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
	/** 微信支付记录*/
	private OrderPayRecord orderPayRecord;
	/** 子订单*/
	private List<OrderByDay> orderByDays;

	@Column(name="order_number")
	public String getOrderNumber() {
		return orderNumber;
	}

	public void setOrderNumber(String orderNumber) {
		this.orderNumber = orderNumber;
	}

	@Column(name="order_time")
	@Temporal(TemporalType.TIMESTAMP)
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
	public Date getOrderTime() {
		return orderTime;
	}

	public void setOrderTime(Date orderTime) {
		this.orderTime = orderTime;
	}

	@Column(name="pause_time")
	@Temporal(TemporalType.TIMESTAMP)
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
	public Date getPauseTime() {
		return pauseTime;
	}

	public void setPauseTime(Date pauseTime) {
		this.pauseTime = pauseTime;
	}

	@Column(name="recover_time")
	@Temporal(TemporalType.TIMESTAMP)
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
	public Date getRecoverTime() {
		return recoverTime;
	}

	public void setRecoverTime(Date recoverTime) {
		this.recoverTime = recoverTime;
	}
	
	@Column(name="status")
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Column(name="total_money",precision=8,scale=2)
	public BigDecimal getTotalMoney() {
		return totalMoney;
	}

	public void setTotalMoney(BigDecimal totalMoney) {
		this.totalMoney = totalMoney;
	}

	@Column(name="pay_money",precision=8,scale=2)
	public BigDecimal getPayMoney() {
		return payMoney;
	}

	public void setPayMoney(BigDecimal payMoney) {
		this.payMoney = payMoney;
	}

	@Column(name="favourable_money",precision=8,scale=2)
	public BigDecimal getFavourableMoney() {
		return favourableMoney;
	}

	public void setFavourableMoney(BigDecimal favourableMoney) {
		this.favourableMoney = favourableMoney;
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

	public String getOutTradeNo() {
		return outTradeNo;
	}

	public void setOutTradeNo(String outTradeNo) {
		this.outTradeNo = outTradeNo;
	}

	@OneToOne(mappedBy="order")
	public OrderPayRecord getOrderPayRecord() {
		return orderPayRecord;
	}

	public void setOrderPayRecord(OrderPayRecord orderPayRecord) {
		this.orderPayRecord = orderPayRecord;
	}

	@Column(name="product_name")
	public String getproductName() {
		return productName;
	}

	public void setproductName(String productName) {
		this.productName = productName;
	}
	
}
