package com.qmx.wxmp.dto.dcxt;

import java.io.Serializable;
import java.util.List;

import com.qmx.wxmp.entity.dcxt.Dish;

/**
 * 菜品 DTO
 *
 * @author longxy
 * @date 2017-12-02 23:29
 */
public class DishTdDto implements Serializable {

	private static final long	serialVersionUID	= -743440858815062991L;

	// 页面菜单Td对应Id
	private String				dishesTdId;

	// 菜单列表
	private List<Dish>			dishes;



	public String getDishesTdId() {
		return dishesTdId;
	}



	public void setDishesTdId(String dishesTdId) {
		this.dishesTdId = dishesTdId;
	}



	public List<Dish> getDishes() {
		return dishes;
	}



	public void setDishes(List<Dish> dishes) {
		this.dishes = dishes;
	}
}
