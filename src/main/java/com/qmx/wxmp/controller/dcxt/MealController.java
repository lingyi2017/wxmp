package com.qmx.wxmp.controller.dcxt;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.qmx.wxmp.common.persistence.Page;
import com.qmx.wxmp.controller.BaseController;
import com.qmx.wxmp.entity.dcxt.Meal;
import com.qmx.wxmp.service.dcxt.MealService;

/**
 * 餐标 Controller
 *
 * @author longxy
 * @date 2017-11-21 23:02
 */
@Controller
@RequestMapping(value = "/dcxt/meal")
public class MealController extends BaseController {

	@Autowired
	private MealService thisService;



	@ModelAttribute
	public Meal get(@RequestParam(required = false) String id) {
		if (StringUtils.isNotBlank(id)) {
			return thisService.get(id);
		} else {
			return new Meal();
		}
	}



	@RequiresPermissions("dcxt:meal:view")
	@RequestMapping({ "list", "" })
	public String list(Meal entity, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<Meal> page = thisService.findList(new Page<Meal>(request, response), entity);
		model.addAttribute("page", page);

		return "/dcxt/mealList";
	}



	@RequiresPermissions("dcxt:meal:view")
	@RequestMapping("/form")
	public String form(Meal entity, Model model) {

		model.addAttribute("meal", entity);
		return "/dcxt/mealForm";
	}



	@RequiresPermissions("dcxt:meal:edit")
	@RequestMapping("/save")
	public String save(Meal entity, HttpServletRequest request, Model model, RedirectAttributes redirectAttributes) {

		if (!beanValidator(model, entity)) {
			return form(entity, model);
		}

		try {
			thisService.save(entity);
			addMessage(redirectAttributes, "保存餐标'" + entity.getType() + "'成功");

		} catch (Exception e) {
			addMessage(redirectAttributes, "保存餐标'" + entity.getType() + "'失败");
			logger.error(e.getMessage(), e);
			e.printStackTrace();
		}
		return "redirect:/dcxt/meal/?repage";

	}



	@RequiresPermissions("dcxt:meal:edit")
	@RequestMapping("/delete")
	public String delete(String id, RedirectAttributes redirectAttributes) {

		try {
			thisService.delete(id);
			addMessage(redirectAttributes, "删除餐标成功");
		} catch (Exception e) {
			addMessage(redirectAttributes, "删除餐标失败");
			e.printStackTrace();
		}
		return "redirect:/dcxt/meal/?repage";
	}
}
