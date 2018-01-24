package com.qmx.wxmp.controller.order;

import java.util.List;

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
import com.qmx.wxmp.common.utils.DateUtils;
import com.qmx.wxmp.controller.BaseController;
import com.qmx.wxmp.dto.order.OrderQueryDTO;
import com.qmx.wxmp.entity.order.OrderMain;
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

	/**
	 * 订单列表
	 * @param entity
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequiresPermissions("dcxt:order:view")
	@RequestMapping({ "list", "" })
	public String list(OrderQueryDTO entity, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<OrderMain> page = orderService.findList(new Page<OrderMain>(request, response), entity);
		model.addAttribute("orderQueryDTO", entity);
		model.addAttribute("page", page);
		return "/order/orderList";
	}
	
	@RequiresPermissions("dcxt:order:view")
	@RequestMapping("/form")
	public String form(OrderMain entity, Model model) {

		model.addAttribute("order", entity);
		return "/order/orderForm";
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

	/**
	 * 暂停订单
	 * @param id
	 * @param redirectAttributes
	 * @return
	 */
	@RequestMapping("/pause")
	public String pause(String id, RedirectAttributes redirectAttributes) {
		
		try {
			OrderMain order = orderService.pause(id);
			addMessage(redirectAttributes, "暂停订单成功," + DateUtils.dataToStr(order.getPauseTime(), "yyyy-MM-dd") + "后的订单将不在配送");

		} catch (Exception e) {
			addMessage(redirectAttributes, "暂停订单失败");
			logger.error(e.getMessage(), e);
			e.printStackTrace();
		}
		return "redirect:/dcxt/order/?repage";

	}
	
	/**
	 * 暂停订单
	 * @param id
	 * @param redirectAttributes
	 * @return
	 */
	@RequestMapping("/recover")
	public String recover(String id, RedirectAttributes redirectAttributes) {
		
		try {
			OrderMain order = orderService.recover(id);
			addMessage(redirectAttributes, "恢复订单成功,订单将于" + DateUtils.dataToStr(DateUtils.getDayByAdd(order.getRecoverTime(), 1), "yyyy-MM-dd") + "开始配送");

		} catch (Exception e) {
			addMessage(redirectAttributes, "恢复订单失败");
			logger.error(e.getMessage(), e);
			e.printStackTrace();
		}
		return "redirect:/dcxt/order/?repage";

	}
	
	/**
	 * 微信订单列表
	 * @param entity
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping("wx_order_list")
	public String wxOrderList(Model model) {
		List<OrderMain> orderList = orderService.findOrderListByAccount("09f89a7575094781956aa65fe659b810");
		model.addAttribute("orderList", orderList);
		return "/wx/order_list";
	}
}
