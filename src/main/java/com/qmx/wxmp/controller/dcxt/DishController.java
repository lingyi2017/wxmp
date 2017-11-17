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
import com.qmx.wxmp.entity.dcxt.Dish;
import com.qmx.wxmp.service.dcxt.DishService;

/**
 * 菜品 Controller
 *
 * @author longxy
 * @date 2017-11-18 0:06
 */
@Controller
@RequestMapping(value = "/dcxt/dish")
public class DishController extends BaseController {

	@Autowired
	private DishService thisService;



	@ModelAttribute
	public Dish get(@RequestParam(required = false) String id) {
		if (StringUtils.isNotBlank(id)) {
			return thisService.get(id);
		} else {
			return new Dish();
		}
	}



	@RequiresPermissions("dcxt:dish:view")
	@RequestMapping({ "list", "" })
	public String list(Dish entity, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<Dish> page = thisService.findList(new Page<Dish>(request, response), entity);
		model.addAttribute("page", page);

		return "/dcxt/dishList";
	}



	@RequiresPermissions("dcxt:dish:view")
	@RequestMapping("/form")
	public String form(Dish entity, Model model) {

		model.addAttribute("dish", entity);
		return "/dcxt/dishForm";
	}



	@RequiresPermissions("dcxt:dish:edit")
	@RequestMapping("/save")
	public String save(Dish entity, HttpServletRequest request, Model model, RedirectAttributes redirectAttributes) {

		if (!beanValidator(model, entity)) {
			return form(entity, model);
		}

		try {
			thisService.save(entity);
			addMessage(redirectAttributes, "保存菜品'" + entity.getName() + "'成功");

		} catch (Exception e) {
			addMessage(redirectAttributes, "保存菜品'" + entity.getName() + "'失败");
			logger.error(e.getMessage(), e);
			e.printStackTrace();
		}
		return "redirect:/dcxt/dish/?repage";

	}



	@RequiresPermissions("dcxt:dish:edit")
	@RequestMapping("/delete")
	public String delete(String id, RedirectAttributes redirectAttributes) {

		try {
			thisService.delete(id);
			addMessage(redirectAttributes, "删除菜品成功");
		} catch (Exception e) {
			addMessage(redirectAttributes, "删除菜品失败");
			e.printStackTrace();
		}
		return "redirect:/dcxt/dish/?repage";
	}
}
