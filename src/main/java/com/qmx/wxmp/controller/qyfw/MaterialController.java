package com.qmx.wxmp.controller.qyfw;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.qmx.wxmp.common.persistence.Page;
import com.qmx.wxmp.controller.BaseController;
import com.qmx.wxmp.entity.qyfw.Material;
import com.qmx.wxmp.service.qyfw.MaterialService;

/**
 * 材料管理controller
 * @author itismin
 *
 */
@Controller
@RequestMapping(value = "/qyfw/material/")
@Transactional(readOnly = false)
public class MaterialController extends BaseController {
	
	@Resource
	private MaterialService materialService;
	
	@RequiresPermissions("qyfw:material:view")
	@RequestMapping(value = { "list", "" })
	public String list(Material material, HttpServletRequest request, HttpServletResponse response, Model model){
		Page<Material> page = materialService.findByPage(new Page<Material>(request, response), material);
		model.addAttribute("page", page);
		return "/qyfw/materialList";
	}
	
	@RequiresPermissions("qyfw:material:view")
	@RequestMapping(value = "form")
	public String form(Material material, Model model) {
		if(material.getId() != null){
			material = materialService.get(material.getId());
		}
		model.addAttribute("material", material);
		return "/qyfw/materialForm";

	}



	@RequiresPermissions("qyfw:material:edit")
	@RequestMapping(value = "save")
	public String save(Material material, Model model, RedirectAttributes redirectAttributes) {

		try {
			if (!beanValidator(model, material)) {
				return form(material, model);
			}
			materialService.save(material);
			addMessage(redirectAttributes, "保存材料'" + material.getName() + "'成功");
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("材料保存异常", e);
		}
		return "redirect:/qyfw/material/";

	}



	@RequiresPermissions("qyfw:material:edit")
	@RequestMapping(value = "delete")
	public String delete(String id, RedirectAttributes redirectAttributes) {
		materialService.delete(id);
		addMessage(redirectAttributes, "删除材料成功");
		return "redirect:/qyfw/material/";
	}
}
