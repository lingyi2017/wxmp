package com.qmx.wxmp.controller.dcxt;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.qmx.wxmp.dto.dcxt.FoodMenuDto;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.qmx.wxmp.common.persistence.Page;
import com.qmx.wxmp.controller.BaseController;
import com.qmx.wxmp.entity.dcxt.Dish;
import com.qmx.wxmp.entity.dcxt.FoodMenu;
import com.qmx.wxmp.entity.dcxt.Meal;
import com.qmx.wxmp.entity.dcxt.Product;
import com.qmx.wxmp.service.dcxt.DishService;
import com.qmx.wxmp.service.dcxt.FoodMenuService;
import com.qmx.wxmp.service.dcxt.MealService;
import com.qmx.wxmp.service.dcxt.ProductService;
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
	public String addForm(FoodMenu entity, Model model) {

		List<Product> products = productService.findAll();
		List<Meal> meals = mealService.findAll();
		List<Dish> dishes = dishService.findAll();
		model.addAttribute("products", products);
		model.addAttribute("meals", meals);

		model.addAttribute("dishTypeVos", buildDishTypeVo(dishes));
		return "/dcxt/addFoodMenuForm";

	}



	@RequiresPermissions("dcxt:foodMenu:edit")
	@RequestMapping("/save")
	@ResponseBody
	public String save(FoodMenuDto foodMenuDto, HttpServletRequest request, Model model,
			RedirectAttributes redirectAttributes) {

		try {

		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			e.printStackTrace();
		}
		return "true";

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
