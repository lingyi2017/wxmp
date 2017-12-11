package com.qmx.wxmp.dto.order;


/**
 * 查询DTO
 * @author itismin
 *
 */
public class OrderQueryDTO {

	private String accountName;
	
	private String accountPhone;
	
	private String status;
	
	private String beginDate;
	
	private String endDate;
	
	private String deliveryDate;
	
	private String orderNumber;

	public String getAccountName() {
		return accountName;
	}

	public void setAccountName(String accountName) {
		this.accountName = accountName;
	}

	public String getAccountPhone() {
		return accountPhone;
	}

	public void setAccountPhone(String accountPhone) {
		this.accountPhone = accountPhone;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getBeginDate() {
		return beginDate;
	}

	public void setBeginDate(String beginDate) {
		this.beginDate = beginDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getDeliveryDate() {
		return deliveryDate;
	}

	public void setDeliveryDate(String deliveryDate) {
		this.deliveryDate = deliveryDate;
	}

	public String getOrderNumber() {
		return orderNumber;
	}

	public void setOrderNumber(String orderNumber) {
		this.orderNumber = orderNumber;
	}

	
	
}
