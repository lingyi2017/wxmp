package com.qmx.wxmp.entity.qyfw;

import java.io.Serializable;

import javax.persistence.*;

/**
 * 订单材料信息
 * 
 * @author zsmin
 *
 */
@Entity
@Table(name = "qyfw_order_material")
public class OrderMaterial implements Serializable {

	private static final long	serialVersionUID	= -3797071581257788658L;

	@Id
	private String				id;

	/** 是否上传 */
	private Boolean				isUpload;

	/** 附件路径 */
	private String				path;

	/** 材料名称 */
	private String				name;

	/** 材料顺序 */
	private Integer				rank;

	@ManyToOne
	@JoinColumn(name = "order_id")
	private Order				order;

	@OneToOne
	@JoinColumn(name = "material_id")
	private Material			material;



	public String getId() {
		return id;
	}



	public void setId(String id) {
		this.id = id;
	}



	public Boolean getIsUpload() {
		return isUpload;
	}



	public void setIsUpload(Boolean isUpload) {
		this.isUpload = isUpload;
	}



	public String getPath() {
		return path;
	}



	public void setPath(String path) {
		this.path = path;
	}



	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}



	public Integer getRank() {
		return rank;
	}



	public void setRank(Integer rank) {
		this.rank = rank;
	}



	public Order getOrder() {
		return order;
	}



	public void setOrder(Order order) {
		this.order = order;
	}



	public Material getMaterial() {
		return material;
	}



	public void setMaterial(Material material) {
		this.material = material;
	}

}
