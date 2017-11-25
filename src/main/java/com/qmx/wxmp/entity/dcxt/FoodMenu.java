package com.qmx.wxmp.entity.dcxt;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;

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
}
