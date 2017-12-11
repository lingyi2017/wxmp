package com.qmx.wxmp.entity.order;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.qmx.wxmp.common.persistence.BaseSimpleEntity;

/**
 * 订单退款信息
 * @author itismin
 *
 */
@Entity
@Table(name="dcxt_order_refund")
public class OrderRefund extends BaseSimpleEntity {

private static final long serialVersionUID = 1L;
	
	public OrderRefund() {
		super();
	}
	
	/** 订单退款状态:处理中*/
	public static final String ORDER_REFUND_DEAL = "1";
	/** 订单退款状态:失败*/
	public static final String ORDER_REFUND_FAIL = "2";
	/** 订单退款状态:成功*/
	public static final String ORDER_REFUND_SUSCESS = "3";
	
	/** 退款原因*/
	private String refundReason;
	/** 退款申请时间*/
	private Date refundTime;
	/** 退款金额*/
	private BigDecimal refundMoney;
	/** 拒绝原因*/
	private String refuseReason;
	/** 拒绝时间*/
	private Date refuseTime;
	/** 退款状态*/
	private String status;
	
	/** 主订单*/
	private OrderMain order;

	public String getRefundReason() {
		return refundReason;
	}
	public void setRefundReason(String refundReason) {
		this.refundReason = refundReason;
	}
	@Temporal(TemporalType.TIMESTAMP)
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
	public Date getRefundTime() {
		return refundTime;
	}
	public void setRefundTime(Date refundTime) {
		this.refundTime = refundTime;
	}
	public String getRefuseReason() {
		return refuseReason;
	}
	public void setRefuseReason(String refuseReason) {
		this.refuseReason = refuseReason;
	}
	@Temporal(TemporalType.TIMESTAMP)
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
	public Date getRefuseTime() {
		return refuseTime;
	}
	public void setRefuseTime(Date refuseTime) {
		this.refuseTime = refuseTime;
	}
	@ManyToOne
	@JoinColumn(name="order_id")
	public OrderMain getOrder() {
		return order;
	}
	public void setOrder(OrderMain order) {
		this.order = order;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Column(precision=8,scale=2)
	public BigDecimal getRefundMoney() {
		return refundMoney;
	}
	public void setRefundMoney(BigDecimal refundMoney) {
		this.refundMoney = refundMoney;
	}
	
	
}
