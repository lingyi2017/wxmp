package com.qmx.wxmp.controller.order;

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
import com.qmx.wxmp.entity.order.Account;
import com.qmx.wxmp.entity.order.OrderMain;
import com.qmx.wxmp.service.order.AccountService;
import com.qmx.wxmp.service.order.OrderService;

/**
 * 订单
 * @author itismin
 *
 */
@Controller
@RequestMapping(value = "/dcxt/order")
public class OrderController extends BaseController {

	@Autowired
	private OrderService orderService;

	@ModelAttribute
	public OrderMain get(@RequestParam(required = false) String id) {
		if (StringUtils.isNotBlank(id)) {
			return orderService.get(id);
		} else {
			return new OrderMain();
		}
	}

	@RequiresPermissions("dcxt:order:view")
	@RequestMapping({ "list", "" })
	public String list(OrderMain entity, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<OrderMain> page = orderService.findList(new Page<OrderMain>(request, response), entity);
		model.addAttribute("page", page);
		return "/order/orderList";
	}

	@RequiresPermissions("dcxt:order:view")
	@RequestMapping("/form")
	public String form(OrderMain entity, Model model) {

		model.addAttribute("account", entity);
		return "/order/accountForm";
	}

	@RequiresPermissions("dcxt:order:edit")
	@RequestMapping("/save")
	public String save(OrderMain entity, HttpServletRequest request, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, entity)) {
			return form(entity, model);
		}

		try {
			orderService.save(entity);
			addMessage(redirectAttributes, "保存订单成功");

		} catch (Exception e) {
			addMessage(redirectAttributes, "保存订单成功");
			logger.error(e.getMessage(), e);
			e.printStackTrace();
		}
		return "redirect:/dcxt/order/?repage";

	}

}
