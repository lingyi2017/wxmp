package com.qmx.wxmp.entity.qyfw;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.qmx.wxmp.common.utils.StringUtils;

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
	@Column(precision = 8, scale = 2)
	private BigDecimal price;
	
	/** 服务介绍*/
	@Column(columnDefinition="text")
	private String desciption;
	
	/** 排序号*/
	private Integer sort;
	
	/** 点击量*/
	private Integer client;
	
	/** 删除标记（0：正常；1：删除） */
	protected String delFlag;
	
	
	/** 上级服务分类*/
	@ManyToOne
	@JoinColumn(name="service_category_id")
	private ServiceCategory serviceCategory;
	
	/** 个人材料ids*/
	private String peopleMaterialIds;
	
	/** 企业材料ids*/
	private String companyMaterialIds;
	
	@Transient
	public List<String> peopleMaterialList;
	
	@Transient
	public List<String> companyMaterialList;
	
	public BasicService() {
		this.delFlag = "0";
	}

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

	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
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

	public String getPeopleMaterialIds() {
		return peopleMaterialIds;
	}

	public void setPeopleMaterialIds(String peopleMaterialIds) {
		this.peopleMaterialIds = peopleMaterialIds;
	}

	public String getCompanyMaterialIds() {
		return companyMaterialIds;
	}

	public void setCompanyMaterialIds(String companyMaterialIds) {
		this.companyMaterialIds = companyMaterialIds;
	}

	public List<String> getPeopleMaterialList() {  
	    if (StringUtils.isNotBlank(getPeopleMaterialIds())){  
			List<String> list = new ArrayList<String>();
	        for (String s : StringUtils.split(getPeopleMaterialIds(), ",")) {  
	            list.add(s);  
	        }  
		    return list; 
	    } else{
	    	return peopleMaterialList;
	    }
	}

	public void setPeopleMaterialList(List<String> peopleMaterialList) {
		this.peopleMaterialList = peopleMaterialList;
	}

	public List<String> getCompanyMaterialList() {
	    if (StringUtils.isNotBlank(getCompanyMaterialIds())){  
			List<String> list = new ArrayList<String>();  
	        for (String s : StringUtils.split(getCompanyMaterialIds(), ",")) {  
	            list.add(s);  
	        }  
	        return list;
	    } else{
	    	return companyMaterialList;
	    }
	}

	public void setCompanyMaterialList(List<String> companyMaterialList) {
		this.companyMaterialList = companyMaterialList;
	}

}
