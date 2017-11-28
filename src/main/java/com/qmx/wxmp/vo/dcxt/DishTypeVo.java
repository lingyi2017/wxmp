package com.qmx.wxmp.vo.dcxt;

import java.io.Serializable;
import java.util.List;

import com.qmx.wxmp.entity.dcxt.Dish;

/**
 * 菜品类型 VO
 *
 * @author longxy
 * @date 2017-11-28 22:34
 */
public class DishTypeVo implements Serializable {

	private static final long	serialVersionUID	= 3123697454307129620L;

	private String				type;

	private List<Dish>			dishes;



	public String getType() {
		return type;
	}



	public void setType(String type) {
		this.type = type;
	}



	public List<Dish> getDishes() {
		return dishes;
	}



	public void setDishes(List<Dish> dishes) {
		this.dishes = dishes;
	}
}
