package com.qmx.wxmp.entity.dcxt;

import java.util.Date;
import java.util.List;

import javax.persistence.*;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.qmx.wxmp.common.persistence.BaseSimpleEntity;

/**
 * 菜单
 *
 * @author longxy
 * @date 2017-11-19 16:22
 */
@Entity
@Table(name = "dcxt_food_menu")
public class FoodMenu extends BaseSimpleEntity {

	private static final long serialVersionUID = 3246716469646057898L;



	public FoodMenu() {
		super();
	}

	// 菜单明细
	private List<FoodMenuItem>	foodMenuItems;

	// 状态（1-新增；2-上架；3-下架）
	private String				state;

	// 添加日期
	private Date				addDate;

	// 开始日期（用于查询）
	@Transient
	private String				beginDate;

	// 结束日期（用于查询）
	@Transient
	private String				endDate;



	@OneToMany(mappedBy = "foodMenu", fetch = FetchType.LAZY)
	@Fetch(FetchMode.SUBSELECT)
	@NotFound(action = NotFoundAction.IGNORE)
	public List<FoodMenuItem> getFoodMenuItems() {
		return foodMenuItems;
	}



	public void setFoodMenuItems(List<FoodMenuItem> foodMenuItems) {
		this.foodMenuItems = foodMenuItems;
	}



	public String getState() {
		return state;
	}



	public void setState(String state) {
		this.state = state;
	}



	@Temporal(TemporalType.DATE)
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
	public Date getAddDate() {
		return addDate;
	}



	public void setAddDate(Date addDate) {
		this.addDate = addDate;
	}



	public String getBeginDate() {
		return beginDate;
	}



	public void setBeginDate(String beginDate) {
		this.beginDate = beginDate;
	}



	public String getEndDate() {
		return endDate;
	}



	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
}
