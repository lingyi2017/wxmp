package com.qmx.wxmp.entity.qyfw;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

/**
 * 服务分类信息
 * @author zsmin
 *
 */
@Entity
@Table(name = "qyfw_service_class")
public class ServiceClass {

	@Id
	@GeneratedValue(generator = "system-uuid")
	@GenericGenerator(name = "system-uuid", strategy = "uuid")
	private String id;
	
	/** 服务分类名称*/
	private String name;
	
	/** 是否显示标识*/
	private Boolean isEnable;
	
	/** 排序号*/
	private Integer sort;
	
	@ManyToOne
	@JoinColumn(name="parent_id")
	private ServiceClass serviceClass;
	
	private String parentIds;
	
	private String wxMeauId;

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

	public Boolean getIsEnable() {
		return isEnable;
	}

	public void setIsEnable(Boolean isEnable) {
		this.isEnable = isEnable;
	}

	public Integer getSort() {
		return sort;
	}

	public void setSort(Integer sort) {
		this.sort = sort;
	}

	public ServiceClass getServiceClass() {
		return serviceClass;
	}

	public void setServiceClass(ServiceClass serviceClass) {
		this.serviceClass = serviceClass;
	}

	public String getParentIds() {
		return parentIds;
	}

	public void setParentIds(String parentIds) {
		this.parentIds = parentIds;
	}

	public String getWxMeauId() {
		return wxMeauId;
	}

	public void setWxMeauId(String wxMeauId) {
		this.wxMeauId = wxMeauId;
	}
	
	
}
