package com.qmx.wxmp.dto.dcxt;

import java.io.Serializable;
import java.util.List;

/**
 * 菜单明细 DTO
 *
 * @author longxy
 * @date 2017-11-29 23:48
 */
public class FoodMenuItemDto implements Serializable {

	private static final long	serialVersionUID	= -2031297308875425750L;

	private String				id;

	// 产品ID
	private String				productId;

	// 餐标ID
	private String				mealId;

	// 菜单ID
	private String				foodMenuId;

	// 菜品ID集合
	private List<String>		dishIds;



	public String getId() {
		return id;
	}



	public void setId(String id) {
		this.id = id;
	}



	public String getProductId() {
		return productId;
	}



	public void setProductId(String productId) {
		this.productId = productId;
	}



	public String getMealId() {
		return mealId;
	}



	public void setMealId(String mealId) {
		this.mealId = mealId;
	}



	public String getFoodMenuId() {
		return foodMenuId;
	}



	public void setFoodMenuId(String foodMenuId) {
		this.foodMenuId = foodMenuId;
	}



	public List<String> getDishIds() {
		return dishIds;
	}



	public void setDishIds(List<String> dishIds) {
		this.dishIds = dishIds;
	}
}
