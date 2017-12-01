package com.qmx.wxmp.repository.hibernate.dcxt;

import com.qmx.wxmp.common.persistence.Parameter;
import com.qmx.wxmp.dto.dcxt.FoodMenuItemDto;
import org.springframework.stereotype.Repository;

import com.qmx.wxmp.common.persistence.BaseDao;
import com.qmx.wxmp.entity.dcxt.FoodMenuItem;

/**
 * 菜单明细 Dao
 *
 * @author longxy
 * @date 2017-11-25 16:24
 */
@Repository
public class FoodMenuItemDao extends BaseDao<FoodMenuItem> {

	public void saveBySql(FoodMenuItemDto foodMenuItemDto) {

		String sql = "INSERT INTO dcxt_food_menu_item(id, food_menu_id, product_id, meal_id) "
				+ "VALUES(:id, :food_menu_id, :product_id, :meal_id)";
		Parameter parameter = new Parameter();
		parameter.put("id", foodMenuItemDto.getId());
		parameter.put("food_menu_id", foodMenuItemDto.getFoodMenuId());
		parameter.put("product_id", foodMenuItemDto.getProductId());
		parameter.put("meal_id", foodMenuItemDto.getMealId());
		updateBySql(sql, parameter);

	}



	public void saveFoodMenuItemDish(String foodMenuItemId, String dishId) {

		String sql = "INSERT INTO dcxt_food_menu_item_dish(food_menu_item_id, dish_id) "
				+ "VALUES(:food_menu_item_id, :dish_id)";
		Parameter parameter = new Parameter();
		parameter.put("food_menu_item_id", foodMenuItemId);
		parameter.put("dish_id", dishId);
		updateBySql(sql, parameter);
	}
}
