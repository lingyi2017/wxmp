package com.qmx.wxmp.controller.qyfw;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.qmx.wxmp.common.utils.IdGen;
import com.qmx.wxmp.entity.qyfw.Customer;
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
import com.qmx.wxmp.dto.order.QueryOrderDto;
import com.qmx.wxmp.entity.qyfw.Order;
import com.qmx.wxmp.service.qyfw.OrderService;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	public String list(QueryOrderDto queryDto, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<Order> page = thisService.find(new Page<Order>(request, response), queryDto);
		model.addAttribute("page", page);
		model.addAttribute("queryDto", queryDto);
		return "/qyfw/orderList";
	}



	@RequiresPermissions("qyfw:order:view")
	@RequestMapping(value = "/wait/list")
	public String waitlist(QueryOrderDto queryDto, HttpServletRequest request, HttpServletResponse response,
			Model model) {
		queryDto.setStatus("1");
		Page<Order> page = thisService.find(new Page<Order>(request, response), queryDto);
		model.addAttribute("page", page);
		model.addAttribute("queryDto", queryDto);
		return "/qyfw/orderWaitList";
	}



	@RequiresPermissions("qyfw:order:view")
	@RequestMapping(value = "/detail")
	public String detail(Order order, Model model) {
		model.addAttribute("order", order);
		return "/qyfw/orderDetail";
	}



	@RequiresPermissions("qyfw:order:view")
	@RequestMapping(value = "/deal")
	public String deal(Order order, Model model) {
		model.addAttribute("order", order);
		return "/qyfw/orderDeal";
	}



	@RequiresPermissions("qyfw:order:edit")
	@RequestMapping(value = "/save")
	public String save(Order order, Model model, RedirectAttributes redirectAttributes) {

		if (null == order) {
			addMessage(redirectAttributes, "订单不能为空");
			return "redirect:/qyfw/order/wait/list?repage";
		}

		try {
			if (!beanValidator(model, order)) {
				return deal(order, model);
			}
			if (null != order.getCustomer() && StringUtils.isEmpty(order.getCustomer().getId())) {
				Customer customer = order.getCustomer();
				customer.setId(IdGen.uuid());
				order.setCustomer(customer);
			}
			thisService.save(order);
			addMessage(redirectAttributes, "处理订单成功");
		} catch (Exception e) {
			addMessage(redirectAttributes, "处理订单失败");
			e.printStackTrace();
		}
		return "redirect:/qyfw/order/wait/list?repage";
	}

}
