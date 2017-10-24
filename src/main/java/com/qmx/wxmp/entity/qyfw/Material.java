package com.qmx.wxmp.entity.qyfw;

import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * 材料信息
 * @author zsmin
 *
 */
@Entity
@Table(name = "qyfw_material")
public class Material {

	@Id
	private String id;
	
	/** 材料名称*/
	private String name;
	
	/** 客户性质*/
	private String customerType;
	
	/** 范本路径*/
	private String path;
	
	/** 材料说明*/
	private String descption;
	
	/** 排序号*/
	private Integer sort;
	
	@OneToMany(mappedBy="material")
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

	public String getDescption() {
		return descption;
	}

	public void setDescption(String descption) {
		this.descption = descption;
	}

	public Integer getSort() {
		return sort;
	}

	public void setSort(Integer sort) {
		this.sort = sort;
	}

	public Set<BasicServiceMaterial> getBasicServiceMaterials() {
		return basicServiceMaterials;
	}

	public void setBasicServiceMaterials(
			Set<BasicServiceMaterial> basicServiceMaterials) {
		this.basicServiceMaterials = basicServiceMaterials;
	}

	
}
