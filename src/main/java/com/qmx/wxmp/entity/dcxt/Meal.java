package com.qmx.wxmp.entity.dcxt;

import com.qmx.wxmp.common.persistence.BaseSimpleEntity;

import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * 餐标
 *
 * @author longxy
 * @date 2017-11-19 15:43
 */
@Entity
@Table(name = "dcxt_meal")
public class Meal extends BaseSimpleEntity {

	private static final long	serialVersionUID	= 5663148551245769143L;

	// 类型（1-早餐；2-午餐；3-晚餐）
	private String				type;

	// 描述
	private String				description;

	// 状态（1-新增；2-上架；3-下架）
	private String				state;



	public Meal() {
		super();
	}



	public String getType() {
		return type;
	}



	public void setType(String type) {
		this.type = type;
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
