package com.qmx.wxmp.dto.order;

import java.io.Serializable;

/**
 * 订单查询 DTO
 *
 * @author longxy
 * @date 2017-10-26 22:01
 */
public class QueryOrderDto implements Serializable {

	private static final long	serialVersionUID	= -8855302283676935885L;

	private String				beginDate;

	private String				endDate;

	private String				contact;

	private String				serviceName;

	private String				status;

	private String				phone;
	
	private String				companyName;

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



	public String getContact() {
		return contact;
	}



	public void setContact(String contact) {
		this.contact = contact;
	}



	public String getServiceName() {
		return serviceName;
	}



	public void setServiceName(String serviceName) {
		this.serviceName = serviceName;
	}



	public String getStatus() {
		return status;
	}



	public void setStatus(String status) {
		this.status = status;
	}



	public String getPhone() {
		return phone;
	}



	public void setPhone(String phone) {
		this.phone = phone;
	}



	public String getCompanyName() {
		return companyName;
	}



	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	
}
