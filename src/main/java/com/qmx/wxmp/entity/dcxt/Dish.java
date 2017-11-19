package com.qmx.wxmp.entity.dcxt;

import com.qmx.wxmp.common.persistence.BaseSimpleEntity;

import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * 餐品（菜品）
 *
 * @author longxy
 * @date 2017-11-17 23:41
 */
@Entity
@Table(name = "dcxt_dish")
public class Dish extends BaseSimpleEntity {

	private static final long serialVersionUID = 6060238203029654488L;



	public Dish() {
		super();
	}

	// 名称
	private String	name;

	// 类型（1-菜品；2-主食；3-加餐）
	private String	type;

	// 图片（多个图片以 ; 分隔）
	private String	image;

	// 介绍
	private String	introduce;

	// 状态（1-下架；2-上架）
	private String	state;



	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}



	public String getType() {
		return type;
	}



	public void setType(String type) {
		this.type = type;
	}



	public String getImage() {
		return image;
	}



	public void setImage(String image) {
		this.image = image;
	}



	public String getIntroduce() {
		return introduce;
	}



	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}



	public String getState() {
		return state;
	}



	public void setState(String state) {
		this.state = state;
	}
}
