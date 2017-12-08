package com.qmx.wxmp.controller.dcxt;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.qmx.wxmp.entity.dcxt.Product;
import com.qmx.wxmp.service.dcxt.ProductService;
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
import com.qmx.wxmp.entity.dcxt.Combo;
import com.qmx.wxmp.service.dcxt.ComboService;

import java.util.List;

/**
 * 份量Controller
 *
 * @author longxy
 * @date 2017-11-23 22:07
 */
@Controller
@RequestMapping(value = "/dcxt/combo")
public class ComboController extends BaseController {

	@Autowired
	private ComboService	thisService;

	@Autowired
	private ProductService	productService;



	@ModelAttribute
	public Combo get(@RequestParam(required = false) String id) {
		if (StringUtils.isNotBlank(id)) {
			return thisService.get(id);
		} else {
			return new Combo();
		}
	}



	@RequiresPermissions("dcxt:combo:view")
	@RequestMapping({ "list", "" })
	public String list(Combo entity, HttpServletRequest request, HttpServletResponse response, Model model) {

		Page<Combo> page = thisService.findList(new Page<Combo>(request, response), entity);
		List<Product> products = productService.findAll();
		model.addAttribute("products", products);
		model.addAttribute("page", page);

		return "/dcxt/comboList";
	}



	@RequiresPermissions("dcxt:combo:view")
	@RequestMapping("/form")
	public String form(Combo entity, Model model) {
		List<Product> products = productService.findAll();
		model.addAttribute("products", products);
		model.addAttribute("combo", entity);
		return "/dcxt/comboForm";
	}



	@RequiresPermissions("dcxt:combo:edit")
	@RequestMapping("/save")
	public String save(Combo entity, HttpServletRequest request, Model model, RedirectAttributes redirectAttributes) {

		if (!beanValidator(model, entity)) {
			return form(entity, model);
		}

		try {
			thisService.save(entity);
			addMessage(redirectAttributes, "保存份量'" + entity.getName() + "'成功");

		} catch (Exception e) {
			addMessage(redirectAttributes, "保存份量'" + entity.getName() + "'失败");
			logger.error(e.getMessage(), e);
			e.printStackTrace();
		}
		return "redirect:/dcxt/combo/?repage";

	}



	@RequiresPermissions("dcxt:combo:edit")
	@RequestMapping("/delete")
	public String delete(String id, RedirectAttributes redirectAttributes) {

		try {
			thisService.delete(id);
			addMessage(redirectAttributes, "删除份量成功");
		} catch (Exception e) {
			addMessage(redirectAttributes, "删除份量失败");
			e.printStackTrace();
		}
		return "redirect:/dcxt/combo/?repage";
	}



	@RequiresPermissions("dcxt:combo:edit")
	@RequestMapping("/updateState")
	public String updateState(String id, String state, RedirectAttributes redirectAttributes) {

		try {
			thisService.updateState(id, state);
			addMessage(redirectAttributes, "操作成功");
		} catch (Exception e) {
			addMessage(redirectAttributes, "操作失败");
			e.printStackTrace();
		}
		return "redirect:/dcxt/combo/?repage";
	}
}
