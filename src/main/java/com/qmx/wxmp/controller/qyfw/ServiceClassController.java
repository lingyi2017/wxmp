package com.qmx.wxmp.controller.qyfw;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.qmx.wxmp.controller.BaseController;
import com.qmx.wxmp.entity.qyfw.ServiceClass;
import com.qmx.wxmp.service.qyfw.ServiceClassService;

/**
 * 服务分类 Controller
 *
 * @author longxy
 * @date 2017-10-21 15:45
 */
@Controller
@RequestMapping(value = "/qyfw/serviceClass/")
public class ServiceClassController extends BaseController {

	@Autowired
	private ServiceClassService serviceClassService;



	@ModelAttribute("serviceClass")
	public ServiceClass get(@RequestParam(required = false) String id) {
		return null;
	}



	@RequiresPermissions("qyfw:serviceClass:view")
	@RequestMapping(value = { "list", "" })
	public String list(ServiceClass serviceClass, Model model) {

		return "/sys/areaList";
	}



	@RequiresPermissions("qyfw:serviceClass:view")
	@RequestMapping(value = "form")
	public String form(ServiceClass serviceClass, Model model) {

		return "/sys/areaForm";
	}



	@RequiresPermissions("qyfw:serviceClass:edit")
	@RequestMapping(value = "save")
	public String save(ServiceClass serviceClass, Model model, RedirectAttributes redirectAttributes) {

		return "redirect:/sys/area/";
	}



	@RequiresPermissions("qyfw:serviceClass:edit")
	@RequestMapping(value = "delete")
	public String delete(String id, RedirectAttributes redirectAttributes) {

		return "redirect:/sys/area/";
	}

}
