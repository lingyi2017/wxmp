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
import com.qmx.wxmp.entity.dcxt.FoodMenu;
import com.qmx.wxmp.service.dcxt.FoodMenuService;

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
	private FoodMenuService thisService;



	@ModelAttribute
	public FoodMenu get(@RequestParam(required = false) String id) {
		if (StringUtils.isNotBlank(id)) {
			return thisService.get(id);
		} else {
			return new FoodMenu();
		}
	}



	@RequiresPermissions("dcxt:foodMenu:view")
	@RequestMapping({ "list", "" })
	public String list(FoodMenu entity, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<FoodMenu> page = thisService.findList(new Page<FoodMenu>(request, response), entity);
		model.addAttribute("page", page);

		return "/dcxt/foodMenuList";
	}



	@RequiresPermissions("dcxt:foodMenu:view")
	@RequestMapping("/form")
	public String form(FoodMenu entity, Model model) {

		model.addAttribute("foodMenu", entity);
		return "/dcxt/foodMenuForm";
	}



	@RequiresPermissions("dcxt:foodMenu:edit")
	@RequestMapping("/save")
	public String save(FoodMenu entity, HttpServletRequest request, Model model,
			RedirectAttributes redirectAttributes) {

		if (!beanValidator(model, entity)) {
			return form(entity, model);
		}

		try {
			thisService.save(entity);
			addMessage(redirectAttributes, "保存菜单成功");

		} catch (Exception e) {
			addMessage(redirectAttributes, "保存菜单失败");
			logger.error(e.getMessage(), e);
			e.printStackTrace();
		}
		return "redirect:/dcxt/foodMenu/?repage";

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

}
