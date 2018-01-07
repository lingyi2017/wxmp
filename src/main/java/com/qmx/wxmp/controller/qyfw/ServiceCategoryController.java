package com.qmx.wxmp.controller.qyfw;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.authz.annotation.RequiresUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.qmx.wxmp.controller.BaseController;
import com.qmx.wxmp.dto.ajax.AjaxResult;
import com.qmx.wxmp.dto.category.BasicServiceDTO;
import com.qmx.wxmp.dto.category.ServiceCategoryDTO;
import com.qmx.wxmp.entity.qyfw.BasicService;
import com.qmx.wxmp.entity.qyfw.ServiceCategory;
import com.qmx.wxmp.service.qyfw.BasicServiceService;
import com.qmx.wxmp.service.qyfw.ServiceCategoryService;

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
	@Autowired
	private BasicServiceService basicService;


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
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("服务分类列表查询异常", e);
		}
		return "/qyfw/serviceCategoryList";

	}



	@RequiresPermissions("qyfw:serviceCategory:view")
	@RequestMapping(value = "form")
	public String form(ServiceCategory serviceCategory, Model model) {

		try {
			if (serviceCategory.getParent() == null || serviceCategory.getParent().getId() == null) {
				serviceCategory.setParent(thisService.get("1"));
			} else {
				serviceCategory.setParent(thisService.get(serviceCategory.getParent().getId()));
			}
			model.addAttribute("serviceCategory", serviceCategory);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("服务分类查看异常", e);
		}

		return "/qyfw/serviceCategoryForm";

	}



	@RequiresPermissions("qyfw:serviceCategory:edit")
	@RequestMapping(value = "save")
	public String save(ServiceCategory serviceCategory, Model model, RedirectAttributes redirectAttributes) {

		try {
			if (!beanValidator(model, serviceCategory)) {
				return form(serviceCategory, model);
			}
			thisService.save(serviceCategory);
			addMessage(redirectAttributes, "保存服务分类'" + serviceCategory.getName() + "'成功");
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("服务分类保存异常", e);
		}
		return "redirect:/qyfw/serviceCategory/";

	}



	@RequiresPermissions("qyfw:serviceCategory:edit")
	@RequestMapping(value = "delete")
	public String delete(String id, RedirectAttributes redirectAttributes) {

		if (ServiceCategory.isAdmin(id)) {
			addMessage(redirectAttributes, "删除服务分类失败, 不允许删除顶级服务分类或编号为空");
		} else {
			thisService.delete(id);
			addMessage(redirectAttributes, "删除服务分类成功");
		}
		return "redirect:/qyfw/serviceCategory/";
	}



	@RequiresUser
	@ResponseBody
	@RequestMapping(value = "treeData")
	public List<Map<String, Object>> treeData(@RequestParam(required = false) String extId,
			HttpServletResponse response) {

		response.setContentType("application/json; charset=UTF-8");
		List<Map<String, Object>> mapList = Lists.newArrayList();
		List<ServiceCategory> list = thisService.findAll();
		for (int i = 0; i < list.size(); i++) {
			ServiceCategory e = list.get(i);
			if (extId == null || (extId != null && !extId.equals(e.getId())
					&& e.getParentIds().indexOf("," + extId + ",") == -1)) {
				Map<String, Object> map = Maps.newHashMap();
				map.put("id", e.getId());
				map.put("pId", e.getParent() != null ? e.getParent().getId() : 0);
				map.put("name", e.getName());
				mapList.add(map);
			}
		}
		return mapList;

	}

	/**
	 * 微信端，展示的服务列表页面
	 * @param wxid 微信菜单ID
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "wx_service_list")
	public AjaxResult wxServiceList(@RequestParam(required = true) String wxMenuId){
		AjaxResult result = new AjaxResult();
		try{
			List<ServiceCategoryDTO> categoryDTOs = new ArrayList<ServiceCategoryDTO>();
			List<ServiceCategory> categories = thisService.findAllChildByWxMenuId(wxMenuId);
			for(ServiceCategory category : categories){
				ServiceCategoryDTO categoryDTO = new ServiceCategoryDTO();
				categoryDTO.setServiceCategoryId(category.getId());
				categoryDTO.setServiceCategoryName(category.getName());
				List<BasicServiceDTO> serviceDTOs = new ArrayList<BasicServiceDTO>();
				List<BasicService> basicServices = basicService.findByServiceCategoryId(category.getId());
				for(BasicService basicService : basicServices){
					BasicServiceDTO serviceDTO = new BasicServiceDTO();
					serviceDTO.setBasicServiceId(basicService.getId());
					serviceDTO.setBasicServiceName(basicService.getName());
					serviceDTO.setIsHot(basicService.getIsHot());
					serviceDTOs.add(serviceDTO);
				}
				categoryDTO.setBasicServiceDTOs(serviceDTOs);
				categoryDTOs.add(categoryDTO);
			} 
			result.setResult(true);
			result.setObj(categoryDTOs);
		} catch(Exception e){
			result.setResult(false);
			e.printStackTrace();
		}
		return result;
	}
	
	@RequestMapping(value = "wx_service_list_view")
	public String wxServiceListView() {

		return "/wx/service_list";

	}
	
	@RequestMapping(value = "getMaxSort")
	@ResponseBody
	public Integer getMaxSort() {
		Integer sort = thisService.getMaxSort();
		return sort;
	}
}
