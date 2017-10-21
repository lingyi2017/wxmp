package com.qmx.wxmp.entity.qyfw;

import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

/**
 * 材料信息
 * @author zsmin
 *
 */
@Entity
@Table(name = "qyfw_material")
public class Material {

	@Id
	@GeneratedValue(generator = "system-uuid")
	@GenericGenerator(name = "system-uuid", strategy = "uuid")
	private String id;
	
	/** 材料名称*/
	private String name;
	
	/** 客户性质*/
	private String customerType;
	
	/** 范本路径*/
	private String path;
	
	/** 材料说明*/
	private String dec;
	
	/** 排序号*/
	private Integer sort;
	
	@ManyToMany(mappedBy="materials")
	private Set<BasicService> basicservices;

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

	public String getCustomerType() {
		return customerType;
	}

	public void setCustomerType(String customerType) {
		this.customerType = customerType;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String getDec() {
		return dec;
	}

	public void setDec(String dec) {
		this.dec = dec;
	}

	public Integer getSort() {
		return sort;
	}

	public void setSort(Integer sort) {
		this.sort = sort;
	}

	public Set<BasicService> getBasicservices() {
		return basicservices;
	}

	public void setBasicservices(Set<BasicService> basicservices) {
		this.basicservices = basicservices;
	}
	
}
