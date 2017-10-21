package com.qmx.wxmp.controller.qyfw;

import com.google.common.collect.Lists;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.qmx.wxmp.controller.BaseController;
import com.qmx.wxmp.entity.qyfw.ServiceCategory;
import com.qmx.wxmp.service.qyfw.ServiceCategoryService;

import java.util.List;

/**
 * 服务分类 Controller
 *
 * @author longxy
 * @date 2017-10-21 15:45
 */
@Controller
@RequestMapping(value = "/qyfw/serviceCategory/")
public class ServiceCategoryController extends BaseController {

	@Autowired
	private ServiceCategoryService thisService;



	@ModelAttribute("serviceCategory")
	public ServiceCategory get(@RequestParam(required = false) String id) {
		if (StringUtils.isNotBlank(id)) {
			return thisService.get(id);
		} else {
			return new ServiceCategory();
		}
	}



	@RequiresPermissions("qyfw:serviceCategory:view")
	@RequestMapping(value = { "list", "" })
	public String list(ServiceCategory serviceCategory, Model model) {
		try {
			serviceCategory.setId("1");
			model.addAttribute("serviceCategory", serviceCategory);
			List<ServiceCategory> list = Lists.newArrayList();
			List<ServiceCategory> sourcelist = thisService.findAll();
			ServiceCategory.sortList(list, sourcelist, serviceCategory.getId());
			model.addAttribute("list", list);
		}catch (Exception e){
			e.printStackTrace();
		}
		return "/qyfw/serviceCategoryList";
	}



	@RequiresPermissions("qyfw:serviceCategory:view")
	@RequestMapping(value = "form")
	public String form(ServiceCategory serviceCategory, Model model) {

		return "/sys/areaForm";
	}



	@RequiresPermissions("qyfw:serviceCategory:edit")
	@RequestMapping(value = "save")
	public String save(ServiceCategory serviceCategory, Model model, RedirectAttributes redirectAttributes) {

		return "redirect:/sys/area/";
	}



	@RequiresPermissions("qyfw:serviceCategory:edit")
	@RequestMapping(value = "delete")
	public String delete(String id, RedirectAttributes redirectAttributes) {

		return "redirect:/sys/area/";
	}

}
