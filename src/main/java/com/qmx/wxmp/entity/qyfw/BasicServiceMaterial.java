package com.qmx.wxmp.entity.qyfw;

import javax.persistence.*;

import org.hibernate.annotations.GenericGenerator;

/**
 * 基础服务信息材料
 * @author zsmin
 *
 */
@Entity
@Table(name = "qyfw_basic_service_material")
public class BasicServiceMaterial {

	@Id
	@GeneratedValue(generator = "system-uuid")
	@GenericGenerator(name = "system-uuid", strategy = "uuid")
	private String id;
	
	@ManyToOne
	@JoinColumn(name="basic_service_id")
	private BasicService basicService;
	
	@ManyToOne
	@JoinColumn(name="material_id")
	private Material material;;
	
	private Integer sort;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public BasicService getBasicService() {
		return basicService;
	}

	public void setBasicService(BasicService basicService) {
		this.basicService = basicService;
	}

	public Material getMaterial() {
		return material;
	}

	public void setMaterial(Material material) {
		this.material = material;
	}

	public Integer getSort() {
		return sort;
	}

	public void setSort(Integer sort) {
		this.sort = sort;
	}
	
}
