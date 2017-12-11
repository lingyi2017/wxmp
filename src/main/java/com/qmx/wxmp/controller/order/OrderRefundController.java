package com.qmx.wxmp.controller.order;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.qmx.wxmp.common.persistence.Page;
import com.qmx.wxmp.controller.BaseController;
import com.qmx.wxmp.dto.order.OrderQueryDTO;
import com.qmx.wxmp.entity.order.OrderRefund;
import com.qmx.wxmp.service.order.OrderRefundService;

/**
 * 订单
 * @author itismin
 *
 */
@Controller
@RequestMapping(value = "/dcxt/orderrefund")
public class OrderRefundController extends BaseController {

	@Autowired
	private OrderRefundService refundService;

	@ModelAttribute
	public OrderRefund get(@RequestParam(required = false) String id) {
		if (StringUtils.isNotBlank(id)) {
			return refundService.get(id);
		} else {
			return new OrderRefund();
		}
	}

	/**
	 * 退款单列表
	 * @param entity
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping({ "list", "" })
	public String list(OrderQueryDTO entity, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<OrderRefund> page = refundService.findList(new Page<OrderRefund>(request, response), entity);
		model.addAttribute("orderQueryDTO", entity);
		model.addAttribute("page", page);
		return "/order/orderRefundList";
	}
	
	@RequestMapping("/form")
	public String form(OrderRefund entity, Model model) {

		model.addAttribute("order", entity);
		return "/order/orderRefundForm";
	}

	@RequestMapping("/save")
	public String save(OrderRefund entity, HttpServletRequest request, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, entity)) {
			return form(entity, model);
		}

		try {
			refundService.save(entity);
			addMessage(redirectAttributes, "申请退款成功");

		} catch (Exception e) {
			addMessage(redirectAttributes, "申请退款失败");
			logger.error(e.getMessage(), e);
			e.printStackTrace();
		}
		return "redirect:/dcxt/order/?repage";

	}
	
	/**
	 * 后台退款订单处理
	 * @param entity
	 * @param request
	 * @param model
	 * @param redirectAttributes
	 * @return
	 */
	@RequestMapping("/deal")
	public String deal(OrderRefund entity, HttpServletRequest request, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, entity)) {
			return form(entity, model);
		}

		try {
			refundService.save(entity);
			addMessage(redirectAttributes, "退款处理成功");

		} catch (Exception e) {
			addMessage(redirectAttributes, "退款处理失败");
			logger.error(e.getMessage(), e);
			e.printStackTrace();
		}
		return "redirect:/dcxt/orderrefund/?repage";

	}

	
}
