package com.qmx.wxmp.entity.dcxt;

import java.util.List;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.qmx.wxmp.common.persistence.BaseSimpleEntity;

/**
 * 菜单明细
 *
 * @author longxy
 * @date 2017-11-19 17:09
 */
@Entity
@Table(name = "dcxt_menu_item")
public class MenuItem extends BaseSimpleEntity {

	private static final long serialVersionUID = 8498091460492191982L;



	public MenuItem() {
		super();
	}

	// 菜单
	private Menu		menu;

	// 产品
	private Product		product;

	// 餐标
	private Meal		meal;

	// 菜品集合
	private List<Dish>	dishes;



	@ManyToOne
	@JoinColumn(name = "menu_id")
	@NotFound(action = NotFoundAction.IGNORE)
	@JsonIgnore
	@NotNull(message = "菜单不能为空")
	public Menu getMenu() {
		return menu;
	}



	public void setMenu(Menu menu) {
		this.menu = menu;
	}



	@ManyToOne
	@JoinColumn(name = "product_id")
	@NotFound(action = NotFoundAction.IGNORE)
	@JsonIgnore
	@NotNull(message = "产品不能为空")
	public Product getProduct() {
		return product;
	}



	public void setProduct(Product product) {
		this.product = product;
	}



	@ManyToOne
	@JoinColumn(name = "meal_id")
	@NotFound(action = NotFoundAction.IGNORE)
	@JsonIgnore
	@NotNull(message = "餐标不能为空")
	public Meal getMeal() {
		return meal;
	}



	public void setMeal(Meal meal) {
		this.meal = meal;
	}



	@ManyToMany(fetch = FetchType.EAGER)
	@JoinTable(name = "dcxt_menu_item_dish", joinColumns = {
			@JoinColumn(name = "menu_item_id") }, inverseJoinColumns = { @JoinColumn(name = "dish_id") })
	@OrderBy("id")
	@Fetch(FetchMode.SUBSELECT)
	@NotFound(action = NotFoundAction.IGNORE)
	@JsonIgnore
	public List<Dish> getDishes() {
		return dishes;
	}



	public void setDishes(List<Dish> dishes) {
		this.dishes = dishes;
	}

}
