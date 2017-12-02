package com.qmx.wxmp.repository.hibernate.dcxt;

import com.qmx.wxmp.common.persistence.Parameter;
import com.qmx.wxmp.dto.dcxt.FoodMenuItemDto;
import org.springframework.stereotype.Repository;

import com.qmx.wxmp.common.persistence.BaseDao;
import com.qmx.wxmp.entity.dcxt.FoodMenuItem;
import org.springframework.util.CollectionUtils;

import java.util.List;

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



	public String getEntityId(String foodMenuId, String productId, String mealId) {
		String sql = "SELECT id FROM dcxt_food_menu_item WHERE food_menu_id =:food_menu_id AND "
				+ "product_id =:product_id AND meal_id =:meal_id";
		Parameter parameter = new Parameter();
		parameter.put("food_menu_id", foodMenuId);
		parameter.put("product_id", productId);
		parameter.put("meal_id", mealId);
		List<String> foodMenuItemIds = findBySql(sql, parameter);
		if (CollectionUtils.isEmpty(foodMenuItemIds)) {
			return null;
		}
		return foodMenuItemIds.get(0);
	}



	public void deleteFoodMenuItemDish(String foodMenuItemId) {
		String sql = "DELETE FROM dcxt_food_menu_item_dish WHERE food_menu_item_id = :food_menu_item_id";
		Parameter parameter = new Parameter();
		parameter.put("food_menu_item_id", foodMenuItemId);
		updateBySql(sql, parameter);
	}
}
