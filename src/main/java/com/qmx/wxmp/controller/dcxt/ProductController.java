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
import com.qmx.wxmp.entity.dcxt.Product;
import com.qmx.wxmp.service.dcxt.ProductService;

/**
 * 商品 Controller
 *
 * @author longxy
 * @date 2017-11-23 21:36
 */
@Controller
@RequestMapping(value = "/dcxt/product")
public class ProductController extends BaseController {

	@Autowired
	private ProductService thisService;



	@ModelAttribute
	public Product get(@RequestParam(required = false) String id) {
		if (StringUtils.isNotBlank(id)) {
			return thisService.get(id);
		} else {
			return new Product();
		}
	}



	@RequiresPermissions("dcxt:product:view")
	@RequestMapping({ "list", "" })
	public String list(Product entity, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<Product> page = thisService.findList(new Page<Product>(request, response), entity);
		model.addAttribute("page", page);

		return "/dcxt/productList";
	}



	@RequiresPermissions("dcxt:product:view")
	@RequestMapping("/form")
	public String form(Product entity, Model model) {

		model.addAttribute("product", entity);
		return "/dcxt/productForm";
	}



	@RequiresPermissions("dcxt:product:edit")
	@RequestMapping("/save")
	public String save(Product entity, HttpServletRequest request, Model model, RedirectAttributes redirectAttributes) {

		if (!beanValidator(model, entity)) {
			return form(entity, model);
		}

		try {
			thisService.save(entity);
			addMessage(redirectAttributes, "保存产品'" + entity.getName() + "'成功");

		} catch (Exception e) {
			addMessage(redirectAttributes, "保存产品'" + entity.getName() + "'失败");
			logger.error(e.getMessage(), e);
			e.printStackTrace();
		}
		return "redirect:/dcxt/product/?repage";

	}



	@RequiresPermissions("dcxt:product:edit")
	@RequestMapping("/delete")
	public String delete(String id, RedirectAttributes redirectAttributes) {

		try {
			thisService.delete(id);
			addMessage(redirectAttributes, "删除产品成功");
		} catch (Exception e) {
			addMessage(redirectAttributes, "删除产品失败");
			e.printStackTrace();
		}
		return "redirect:/dcxt/product/?repage";
	}
}
