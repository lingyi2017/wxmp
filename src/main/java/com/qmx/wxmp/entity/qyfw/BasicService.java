package com.qmx.wxmp.entity.qyfw;

import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * 基础服务信息
 * @author zsmin
 *
 */
@Entity
@Table(name = "qyfw_basic_service")
public class BasicService {
	
	/** 客户性质：个人*/
	public static final String CUSTOMER_TYPE_PEOPLE = "1";
	/** 客户性质：企业*/
	public static final String CUSTOMER_TYPE_COMPANY = "2";
	
	@Id
	private String id;
	
	/** 服务名称*/
	private String name;
	
	/** 热点服务标识*/
	private Boolean isHot;
	
	/** 是否显示标识*/
	private Boolean isEnable;
	
	/** 是否支持购买*/
	private Boolean isBuy;
	
	/** 支持性质*/
	private String customerType;

	/** 服务价格*/
	private Float price;
	
	/** 服务介绍*/
	private String desciption;
	
	/** 排序号*/
	private Integer sort;
	
	/** 点击量*/
	private Integer client;
	
	
	/** 上级服务分类*/
	@ManyToOne
	@JoinColumn(name="service_category_id")
	private ServiceCategory serviceCategory;
	
	@OneToMany(mappedBy="basicService")
	private Set<BasicServiceMaterial> basicServiceMaterials;
	
	
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Boolean getIsHot() {
		return isHot;
	}

	public void setIsHot(Boolean isHot) {
		this.isHot = isHot;
	}

	public Boolean getIsEnable() {
		return isEnable;
	}

	public void setIsEnable(Boolean isEnable) {
		this.isEnable = isEnable;
	}

	public Boolean getIsBuy() {
		return isBuy;
	}

	public void setIsBuy(Boolean isBuy) {
		this.isBuy = isBuy;
	}

	public String getCustomerType() {
		return customerType;
	}

	public void setCustomerType(String customerType) {
		this.customerType = customerType;
	}

	public Float getPrice() {
		return price;
	}

	public void setPrice(Float price) {
		this.price = price;
	}

	public String getDesciption() {
		return desciption;
	}

	public void setDesciption(String desciption) {
		this.desciption = desciption;
	}

	public Integer getSort() {
		return sort;
	}

	public void setSort(Integer sort) {
		this.sort = sort;
	}

	public Integer getClient() {
		return client;
	}

	public void setClient(Integer client) {
		this.client = client;
	}

	public ServiceCategory getServiceCategory() {
		return serviceCategory;
	}

	public void setServiceCategory(ServiceCategory serviceCategory) {
		this.serviceCategory = serviceCategory;
	}

	public Set<BasicServiceMaterial> getBasicServiceMaterials() {
		return basicServiceMaterials;
	}

	public void setBasicServiceMaterials(
			Set<BasicServiceMaterial> basicServiceMaterials) {
		this.basicServiceMaterials = basicServiceMaterials;
	}

}
