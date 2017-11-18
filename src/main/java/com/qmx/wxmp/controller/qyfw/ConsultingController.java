package com.qmx.wxmp.controller.qyfw;

import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.qmx.wxmp.common.persistence.Page;
import com.qmx.wxmp.common.utils.IdGen;
import com.qmx.wxmp.controller.BaseController;
import com.qmx.wxmp.dto.order.QueryOrderDto;
import com.qmx.wxmp.entity.qyfw.Consulting;
import com.qmx.wxmp.entity.qyfw.Customer;
import com.qmx.wxmp.entity.qyfw.Material;
import com.qmx.wxmp.entity.qyfw.Order;
import com.qmx.wxmp.service.qyfw.ConsultingService;
import com.qmx.wxmp.service.qyfw.CustomerService;
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
	@Resource
	private CustomerService customerService;
	
	@RequiresPermissions("qyfw:consulting:view")
	@RequestMapping(value = { "/list", "" })
	public String list(QueryOrderDto queryDto, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<Consulting> page = consultingService.findByPage(new Page<Consulting>(request, response), queryDto);
		model.addAttribute("page", page);
		model.addAttribute("queryDto", queryDto);
		return "/qyfw/consultingList";
	}

	@RequiresPermissions("qyfw:consulting:view")
	@RequestMapping(value = "/wait/list")
	public String waitlist(QueryOrderDto queryDto, HttpServletRequest request, HttpServletResponse response,
			Model model) {
		queryDto.setStatus(Consulting.DEAL_NO);
		Page<Consulting> page = consultingService.findByPage(new Page<Consulting>(request, response), queryDto);
		model.addAttribute("page", page);
		model.addAttribute("queryDto", queryDto);
		return "/qyfw/consultingWaitList";
	}
	
	@RequiresPermissions("qyfw:consulting:view")
	@RequestMapping(value = "/detail")
	public String detail(Consulting consulting, Model model) {
		model.addAttribute("consulting", consulting);
		return "/qyfw/consultingDetail";
	}
	
	@RequiresPermissions("qyfw:consulting:view")
	@RequestMapping(value = "/deal")
	public String deal(Consulting consulting, Model model) {
		model.addAttribute("consulting", consulting);
		return "/qyfw/orderDeal";
	}

	@RequiresPermissions("qyfw:consulting:edit")
	@RequestMapping(value = "/deal/save")
	public String dealSave(Consulting consulting, Model model, RedirectAttributes redirectAttributes) {
		if (null == consulting) {
			addMessage(redirectAttributes, "咨询不能为空");
			return "redirect:/qyfw/consulting/wait/list?repage";
		}
		try {

			if (!beanValidator(model, consulting)) {
				return deal(consulting, model);
			}

			// 保存客户信息
			Customer customer = consulting.getCustomer();
			if (null != customer && StringUtils.isEmpty(customer.getId())) {
				customer.setId(IdGen.uuid());
				customer.setCreateDate(new Date());
				customerService.save(customer);
				consulting.setCustomer(customer);
			}

			consultingService.save(consulting);
			addMessage(redirectAttributes, "处理咨询成功");
		} catch (Exception e) {
			addMessage(redirectAttributes, "处理咨询失败");
			e.printStackTrace();
		}
		return "redirect:/qyfw/consulting/wait/list?repage";
	}
}