package com.qmx.wxmp.entity.qyfw;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.fasterxml.jackson.annotation.JsonFormat;

/**
 * 订单微信支付记录
 * 
 * @author zsmin
 *
 */
@Entity
@Table(name = "qyfw_order_pay_record")
public class OrderPayRecord implements Serializable {

	private static final long	serialVersionUID	= -3797071581257788658L;

	@Id
	private String id;
	
	/* 用户在公众号下的唯一标识**/
	@Column(name="openid")
	private String openid;
	/* 支付银行标识**/
	@Column(name="bank_type")
	private String bankType;
	/* 订单总金额**/
	@Column(name="total_fee",precision = 8, scale = 2)
	private BigDecimal totalFee;
	/* 货币类型**/
	@Column(name="fee_type")
	private String feeType;
	/* 微信订单号**/
	@Column(name="transaction_id")
	private String transactionId;
	/* 系统内订单号**/
	@Column(name="out_trade_no")
	private String outTradeNo;
	/* 支付完成时间**/
	@Temporal(TemporalType.TIMESTAMP)
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
	@Column(name="pay_time")
	private Date payTime;

	@OneToOne
	@JoinColumn(name = "order_id")
	private Order order;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getOpenid() {
		return openid;
	}

	public void setOpenid(String openid) {
		this.openid = openid;
	}

	public String getBankType() {
		return bankType;
	}

	public void setBankType(String bankType) {
		this.bankType = bankType;
	}

	public BigDecimal getTotalFee() {
		return totalFee;
	}

	public void setTotalFee(BigDecimal totalFee) {
		this.totalFee = totalFee;
	}

	public String getFeeType() {
		return feeType;
	}

	public void setFeeType(String feeType) {
		this.feeType = feeType;
	}

	public String getTransactionId() {
		return transactionId;
	}

	public void setTransactionId(String transactionId) {
		this.transactionId = transactionId;
	}

	public String getOutTradeNo() {
		return outTradeNo;
	}

	public void setOutTradeNo(String outTradeNo) {
		this.outTradeNo = outTradeNo;
	}

	public Date getPayTime() {
		return payTime;
	}

	public void setPayTime(Date payTime) {
		this.payTime = payTime;
	}

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	
}
