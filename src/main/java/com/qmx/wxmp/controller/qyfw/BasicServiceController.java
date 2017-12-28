package com.qmx.wxmp.controller.qyfw;

import java.util.List;

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
import com.qmx.wxmp.entity.qyfw.BasicService;
import com.qmx.wxmp.entity.qyfw.Material;
import com.qmx.wxmp.repository.hibernate.qyfw.MaterialDao;
import com.qmx.wxmp.service.qyfw.BasicServiceService;

/**
 * 基础服务管理controller
 * @author itismin
 *
 */
@Controller
@RequestMapping(value = "/qyfw/basicService/")
@Transactional(readOnly = false)
public class BasicServiceController extends BaseController {
	
	@Resource
	private BasicServiceService basicServiceService;
	@Resource
	private MaterialDao materialDao;
	
	@RequiresPermissions("qyfw:basicService:view")
	@RequestMapping(value = { "list", "" })
	public String list(BasicService basicService, HttpServletRequest request, HttpServletResponse response, Model model){
		Page<BasicService> page = basicServiceService.findByPage(new Page<BasicService>(request, response), basicService);
		model.addAttribute("page", page);
		return "/qyfw/basicServiceList";
	}
	
	@RequiresPermissions("qyfw:basicService:view")
	@RequestMapping(value = "form")
	public String form(BasicService basicService, Model model) {
		if(basicService.getId() != null){
			basicService = basicServiceService.get(basicService.getId());
		}
		List<Material> list1 = materialDao.getPeopleMaterialList();
		List<Material> list2 = materialDao.getCompanyMaterialList();
		model.addAttribute("peopleMaterialList", list1);
		model.addAttribute("companyMaterialList", list2);
		model.addAttribute("basicService", basicService);
		return "/qyfw/basicServiceForm";

	}

	@RequiresPermissions("qyfw:basicService:edit")
	@RequestMapping(value = "save")
	public String save(BasicService basicService, Model model, RedirectAttributes redirectAttributes) {

		try {
			if (!beanValidator(model, basicService)) {
				return form(basicService, model);
			}
			basicServiceService.save(basicService);
			addMessage(redirectAttributes, "保存基础服务'" + basicService.getName() + "'成功");
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("基础服务保存异常", e);
		}
		return "redirect:/qyfw/basicService/";

	}



	@RequiresPermissions("qyfw:basicService:edit")
	@RequestMapping(value = "delete")
	public String delete(String id, RedirectAttributes redirectAttributes) {
		basicServiceService.delete(id);
		addMessage(redirectAttributes, "删除基础服务成功");
		return "redirect:/qyfw/basicService/";
	}
	
	@RequestMapping(value = "wx_service_form")
	public String wxServiceForm(String openid, String basicServiceId, Model model) {
		model.addAttribute("basicService",basicServiceService.get(basicServiceId));
		model.addAttribute("openid", openid);
		return "/wx/service_form";
	}
}
