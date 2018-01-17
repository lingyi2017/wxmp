package com.qmx.wxmp.controller.dcxt;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.qmx.wxmp.common.utils.DateUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.qmx.wxmp.common.persistence.Page;
import com.qmx.wxmp.common.utils.StringUtils;
import com.qmx.wxmp.controller.BaseController;
import com.qmx.wxmp.entity.dcxt.*;
import com.qmx.wxmp.service.dcxt.*;
import com.qmx.wxmp.vo.dcxt.DishTypeVo;

/**
 * 菜单Controller
 *
 * @author longxy
 * @date 2017-11-25 15:50
 */
@Controller
@RequestMapping("/dcxt/foodMenu")
public class FoodMenuController extends BaseController {

	@Autowired
	private FoodMenuService	thisService;

	@Autowired
	private ProductService	productService;

	@Autowired
	private MealService		mealService;

	@Autowired
	private DishService		dishService;



	@RequiresPermissions("dcxt:foodMenu:view")
	@RequestMapping({ "list", "" })
	public String list(FoodMenu entity, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<FoodMenu> page = thisService.findList(new Page<FoodMenu>(request, response), entity);
		model.addAttribute("page", page);

		return "/dcxt/foodMenuList";
	}



	@RequiresPermissions("dcxt:foodMenu:view")
	@RequestMapping("/addForm")
	public String addForm(Model model) {

		List<Product> products = productService.findAll();
		List<Meal> meals = mealService.findAll();
		List<Dish> dishes = dishService.findAll();

		int mealsSize = meals.size() < 1 ? 1 : meals.size();
		int mealTdWidth = 100 / mealsSize;

		model.addAttribute("products", products);
		model.addAttribute("meals", meals);
		model.addAttribute("dishTypeVos", buildDishTypeVo(dishes));
		model.addAttribute("mealTdWidth", mealTdWidth);
		model.addAttribute("addDate", DateUtils.getNextMonday(new Date()));
		return "/dcxt/addFoodMenuForm";

	}



	@RequiresPermissions("dcxt:foodMenu:view")
	@RequestMapping("/editForm")
	public String editForm(String id, RedirectAttributes redirectAttributes, Model model) {

		FoodMenu foodMenu = thisService.get(id);
		if (null == foodMenu || StringUtils.isEmpty(foodMenu.getId())) {
			addMessage(redirectAttributes, "获取菜单信息失败");
			return "redirect:/dcxt/foodMenu/?repage";
		}

		List<FoodMenuItem> foodMenuItems = foodMenu.getFoodMenuItems();
		if (!CollectionUtils.isEmpty(foodMenuItems)) {
			Map<String, Product> productMap = Maps.newLinkedHashMap();
			Map<String, Meal> mealMap = Maps.newLinkedHashMap();
			for (FoodMenuItem foodMenuItem : foodMenuItems) {
				Product product = foodMenuItem.getProduct();
				Meal meal = foodMenuItem.getMeal();
				if (null != product && StringUtils.isNotBlank(product.getId())) {
					if (!productMap.containsKey(product.getId())) {
						productMap.put(product.getId(), product);
					}
				}
				if (null != meal && StringUtils.isNotBlank(meal.getId())) {
					if (!mealMap.containsKey(meal.getId())) {
						mealMap.put(meal.getId(), meal);
					}
				}
			}

			if (!CollectionUtils.isEmpty(productMap)) {
				List<Product> products = Lists.newArrayList();
				Set<String> productSet = productMap.keySet();
				for (String productId : productSet) {
					products.add(productMap.get(productId));
				}

				Collections.sort(products, new Comparator<Product>() {
					@Override
					public int compare(Product o1, Product o2) {
						return o1.getSort().compareTo(o2.getSort());
					}
				});
				model.addAttribute("products", products);
			}
			if (!CollectionUtils.isEmpty(mealMap)) {
				List<Meal> meals = Lists.newArrayList();
				Set<String> mealSet = mealMap.keySet();
				for (String mealId : mealSet) {
					meals.add(mealMap.get(mealId));
				}
				int mealsSize = meals.size() < 1 ? 1 : meals.size();
				int mealTdWidth = 100 / mealsSize;

				Collections.sort(meals, new Comparator<Meal>() {
					@Override
					public int compare(Meal o1, Meal o2) {
						return o1.getSort().compareTo(o2.getSort());
					}
				});
				model.addAttribute("meals", meals);
				model.addAttribute("mealTdWidth", mealTdWidth);
			}
		}

		List<Dish> dishes = dishService.findAll();
		model.addAttribute("dishTypeVos", buildDishTypeVo(dishes));
		model.addAttribute("foodMenu", foodMenu);
		return "/dcxt/editFoodMenuForm";

	}



	@RequiresPermissions("dcxt:foodMenu:view")
	@RequestMapping("/viewForm")
	public String viewForm(String id, RedirectAttributes redirectAttributes, Model model) {

		FoodMenu foodMenu = thisService.get(id);
		if (null == foodMenu || StringUtils.isEmpty(foodMenu.getId())) {
			addMessage(redirectAttributes, "获取菜单信息失败");
			return "redirect:/dcxt/foodMenu/?repage";
		}

		List<FoodMenuItem> foodMenuItems = foodMenu.getFoodMenuItems();
		if (!CollectionUtils.isEmpty(foodMenuItems)) {
			Map<String, Product> productMap = Maps.newLinkedHashMap();
			Map<String, Meal> mealMap = Maps.newLinkedHashMap();
			for (FoodMenuItem foodMenuItem : foodMenuItems) {
				Product product = foodMenuItem.getProduct();
				Meal meal = foodMenuItem.getMeal();
				if (null != product && StringUtils.isNotBlank(product.getId())) {
					if (!productMap.containsKey(product.getId())) {
						productMap.put(product.getId(), product);
					}
				}
				if (null != meal && StringUtils.isNotBlank(meal.getId())) {
					if (!mealMap.containsKey(meal.getId())) {
						mealMap.put(meal.getId(), meal);
					}
				}
			}

			if (!CollectionUtils.isEmpty(productMap)) {
				List<Product> products = Lists.newArrayList();
				Set<String> productSet = productMap.keySet();
				for (String productId : productSet) {
					products.add(productMap.get(productId));
				}

				Collections.sort(products, new Comparator<Product>() {
					@Override
					public int compare(Product o1, Product o2) {
						return o1.getSort().compareTo(o2.getSort());
					}
				});
				model.addAttribute("products", products);
			}
			if (!CollectionUtils.isEmpty(mealMap)) {
				List<Meal> meals = Lists.newArrayList();
				Set<String> mealSet = mealMap.keySet();
				for (String mealId : mealSet) {
					meals.add(mealMap.get(mealId));
				}
				int mealsSize = meals.size() < 1 ? 1 : meals.size();
				int mealTdWidth = 100 / mealsSize;

				Collections.sort(meals, new Comparator<Meal>() {
					@Override
					public int compare(Meal o1, Meal o2) {
						return o1.getSort().compareTo(o2.getSort());
					}
				});
				model.addAttribute("meals", meals);
				model.addAttribute("mealTdWidth", mealTdWidth);
			}
		}

		List<Dish> dishes = dishService.findAll();
		model.addAttribute("dishTypeVos", buildDishTypeVo(dishes));
		model.addAttribute("foodMenu", foodMenu);
		return "/dcxt/viewFoodMenuForm";

	}



	@RequiresPermissions("dcxt:foodMenu:edit")
	@RequestMapping("/delete")
	public String delete(String id, RedirectAttributes redirectAttributes) {

		try {
			thisService.delete(id);
			addMessage(redirectAttributes, "删除菜单成功");
		} catch (Exception e) {
			addMessage(redirectAttributes, "删除菜单失败");
			e.printStackTrace();
		}
		return "redirect:/dcxt/foodMenu/?repage";
	}



	@RequiresPermissions("dcxt:foodMenu:edit")
	@RequestMapping("/updateState")
	public String updateState(String id, String state, RedirectAttributes redirectAttributes) {

		try {
			thisService.updateState(id, state);
			addMessage(redirectAttributes, "操作成功");
		} catch (Exception e) {
			addMessage(redirectAttributes, "操作失败");
			e.printStackTrace();
		}
		return "redirect:/dcxt/foodMenu/?repage";
	}



	private List<DishTypeVo> buildDishTypeVo(List<Dish> dishes) {
		Map<String, List<Dish>> dishMap = Maps.newHashMap();
		for (Dish dish : dishes) {
			List<Dish> dishList = Lists.newArrayList();
			if (dishMap.containsKey(dish.getType())) {
				dishList = dishMap.get(dish.getType());
				dishList.add(dish);
			} else {
				dishList.add(dish);
			}
			dishMap.put(dish.getType(), dishList);
		}

		List<DishTypeVo> dishTypeVos = Lists.newArrayList();
		for (Map.Entry<String, List<Dish>> entry : dishMap.entrySet()) {
			DishTypeVo dishTypeVo = new DishTypeVo();
			dishTypeVo.setType(entry.getKey());
			dishTypeVo.setDishes(entry.getValue());
			dishTypeVos.add(dishTypeVo);
		}
		return dishTypeVos;
	}

}
