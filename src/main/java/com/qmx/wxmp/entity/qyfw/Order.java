package com.qmx.wxmp.entity.qyfw;

import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

/**
 * 订单信息
 * @author zsmin
 *
 */
@Entity
@Table(name = "qyfw_order")
public class Order {

	@Id
	@GeneratedValue(generator = "system-uuid")
	@GenericGenerator(name = "system-uuid", strategy = "uuid")
	private String id;
	
	/** 客户名称*/
	private String customerName;
	
	/** 客户性质*/
	private String customerType;
	
	/** 购买人*/
	private String contact;
	
	/** 联系方式*/
	private String phone;
	
	/** 支出金额*/
	private Float money;
	
	/** 处理状态*/
	private String status;
	
	/** 处理反馈*/
	private String resp;
	
	@ManyToOne
	@JoinColumn(name="customer_id")
	private Customer customer;
	
	@ManyToOne
	@JoinColumn(name="basic_service_id")
	private BasicService basicService;
	
	@OneToMany(mappedBy="order")
	private Set<OrderMaterial> orderMaterials;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getCustomerType() {
		return customerType;
	}

	public void setCustomerType(String customerType) {
		this.customerType = customerType;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Float getMoney() {
		return money;
	}

	public void setMoney(Float money) {
		this.money = money;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getResp() {
		return resp;
	}

	public void setResp(String resp) {
		this.resp = resp;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public BasicService getBasicService() {
		return basicService;
	}

	public void setBasicService(BasicService basicService) {
		this.basicService = basicService;
	}

	public Set<OrderMaterial> getOrderMaterials() {
		return orderMaterials;
	}

	public void setOrderMaterials(Set<OrderMaterial> orderMaterials) {
		this.orderMaterials = orderMaterials;
	}
	
	
}
