package com.qmx.wxmp.entity.qyfw;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import java.util.Set;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;

import com.fasterxml.jackson.annotation.JsonFormat;

/**
 * 订单信息
 * 
 * @author zsmin
 *
 */
@Entity
@Table(name = "qyfw_order")
@DynamicInsert
@DynamicUpdate
public class Order implements Serializable {

	private static final long	serialVersionUID	= 2361924873525292159L;

	@Id
	private String				id;

	/** 联系人 */
	private String				contact;

	/** 联系方式 */
	private String				phone;

	/** 支付金额 */
	private BigDecimal			money;

	/** 订单状态（1-已购买；2-结束） */
	private String				status;

	/** 处理反馈 */
	private String				resp;

	@ManyToOne
	@NotFound(action = NotFoundAction.IGNORE)
	@JoinColumn(name = "customer_id")
	private Customer			customer;

	@ManyToOne
	@NotFound(action = NotFoundAction.IGNORE)
	@NotNull
	@JoinColumn(name = "basic_service_id")
	private BasicService		basicService;

	@OneToMany(mappedBy = "order")
	private Set<OrderMaterial>	orderMaterials;

	/** 创建日期 */
	@Temporal(TemporalType.TIMESTAMP)
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
	protected Date				createDate;



	public String getId() {
		return id;
	}



	public void setId(String id) {
		this.id = id;
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



	public BigDecimal getMoney() {
		return money;
	}



	public void setMoney(BigDecimal money) {
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



	public Date getCreateDate() {
		return createDate;
	}



	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
}
