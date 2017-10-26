package com.qmx.wxmp.controller.qyfw;

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

import com.qmx.wxmp.common.persistence.Page;
import com.qmx.wxmp.controller.BaseController;
import com.qmx.wxmp.entity.qyfw.Order;
import com.qmx.wxmp.service.qyfw.OrderService;

/**
 * 订单 Controller
 *
 * @author longxy
 * @date 2017-10-26 15:19
 */
@Controller
@RequestMapping(value = "/qyfw/order/")
public class OrderController extends BaseController {

	@Autowired
	private OrderService thisService;



	@ModelAttribute
	public Order get(@RequestParam(required = false) String id) {
		if (StringUtils.isNotBlank(id)) {
			return thisService.get(id);
		} else {
			return new Order();
		}
	}



	@RequiresPermissions("qyfw:order:view")
	@RequestMapping(value = { "/list", "" })
	public String list(Order order, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<Order> page = thisService.find(new Page<Order>(request, response), order);
		model.addAttribute("page", page);
		return "/qyfw/orderList";
	}



	@RequiresPermissions("qyfw:order:view")
	@RequestMapping(value = "/form")
	public String form(Order order, Model model) {
		model.addAttribute("order", order);
		return "/qyfw/orderForm";
	}

}
