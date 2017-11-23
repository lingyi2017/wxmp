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
	/** 更新时间*/
	public Date updateTime;
	
}
