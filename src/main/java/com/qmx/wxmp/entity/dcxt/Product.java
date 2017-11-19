package com.qmx.wxmp.entity.dcxt;

import javax.persistence.Entity;
import javax.persistence.Table;

import com.qmx.wxmp.common.persistence.BaseSimpleEntity;

/**
 * 产品
 *
 * @author longxy
 * @date 2017-11-19 15:47
 */
@Entity
@Table(name = "dcxt_product")
public class Product extends BaseSimpleEntity {

	private static final long	serialVersionUID	= -6472534784001750733L;

	// 名称
	private String				name;

	// 图片（多个图片以 ; 分隔）
	private String				image;

	// 描述
	private String				description;

	// 状态（1-下架；2-上架）
	private String				state;



	public Product() {
		super();
	}



	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}



	public String getImage() {
		return image;
	}



	public void setImage(String image) {
		this.image = image;
	}



	public String getDescription() {
		return description;
	}



	public void setDescription(String description) {
		this.description = description;
	}



	public String getState() {
		return state;
	}



	public void setState(String state) {
		this.state = state;
	}
}
