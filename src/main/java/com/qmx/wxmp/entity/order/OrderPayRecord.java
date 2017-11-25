package com.qmx.wxmp.entity.order;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.qmx.wxmp.common.persistence.BaseSimpleEntity;

/**
 * 订单支付记录
 * @author itismin
 *
 */
@Entity
@Table(name="dcxt_order_pay_record")
public class OrderPayRecord extends BaseSimpleEntity {

	private static final long serialVersionUID = 1L;
	
	public OrderPayRecord() {
		super();
	}
	/** 支付类别:支付*/
	public static final String PAY_TYPE_PAY = "1";
	/** 支付类别:退款*/
	public static final String PAY_TYPE_REFUND = "2";
	/** 支付方式:微信*/
	public static final String PAY_WAY_WECHAT = "1";
	/** 支付方式:积分*/
	public static final String PAY_WAY_SCORE = "2";
	
	/** 支付类别*/
	private String payType;
	/** 支付方式*/
	private String payWay;
	/** 支付数额*/
	public Float payMoney;
	/** 支付时间*/
	public String payTime;
	/** 支付相关信息*/
	
	/** 用户*/
	private Account account;
	
	public Float getPayMoney() {
		return payMoney;
	}
	public void setPayMoney(Float payMoney) {
		this.payMoney = payMoney;
	}
	public String getPayTime() {
		return payTime;
	}
	public void setPayTime(String payTime) {
		this.payTime = payTime;
	}
	@ManyToOne
	@JoinColumn(name="account_id")
	public Account getAccount() {
		return account;
	}
	public void setAccount(Account account) {
		this.account = account;
	}
	public String getPayType() {
		return payType;
	}
	public void setPayType(String payType) {
		this.payType = payType;
	}
	public String getPayWay() {
		return payWay;
	}
	public void setPayWay(String payWay) {
		this.payWay = payWay;
	}
	
	
}
