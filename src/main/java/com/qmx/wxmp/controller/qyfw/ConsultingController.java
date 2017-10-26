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
import com.qmx.wxmp.entity.qyfw.Consulting;
import com.qmx.wxmp.entity.qyfw.Material;
import com.qmx.wxmp.service.qyfw.ConsultingService;
import com.qmx.wxmp.service.qyfw.MaterialService;

/**
 * 咨询管理controller
 * @author itismin
 *
 */
@Controller
@RequestMapping(value = "/qyfw/consulting/")
@Transactional(readOnly = false)
public class ConsultingController extends BaseController {
	
	@Resource
	private ConsultingService consultingService;
	
	@RequiresPermissions("qyfw:consulting:view")
	@RequestMapping(value = { "list", "" })
	public String list(Consulting consulting, HttpServletRequest request, HttpServletResponse response, Model model){
		Page<Consulting> page = consultingService.findByPage(new Page<Consulting>(request, response), consulting);
		model.addAttribute("page", page);
		return "/qyfw/materialList";
	}
	
	@RequiresPermissions("qyfw:consulting:view")
	@RequestMapping(value = "form")
	public String form(Consulting consulting, Model model) {
		if(consulting.getId() != null){
			consulting = consultingService.get(consulting.getId());
		}
		model.addAttribute("consulting", consulting);
		return "/qyfw/materialForm";

	}



	@RequiresPermissions("qyfw:consulting:edit")
	@RequestMapping(value = "save")
	public String save(Consulting consulting, Model model, RedirectAttributes redirectAttributes) {

		try {
			if (!beanValidator(model, consulting)) {
				return form(consulting, model);
			}
			consultingService.save(consulting);
			addMessage(redirectAttributes, "保存咨询成功");
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("材料咨询异常", e);
		}
		return "redirect:/qyfw/consulting/";

	}



	@RequiresPermissions("qyfw:consulting:edit")
	@RequestMapping(value = "delete")
	public String delete(String id, RedirectAttributes redirectAttributes) {
		consultingService.delete(id);
		addMessage(redirectAttributes, "删除咨询成功");
		return "redirect:/qyfw/consulting/";
	}
}
