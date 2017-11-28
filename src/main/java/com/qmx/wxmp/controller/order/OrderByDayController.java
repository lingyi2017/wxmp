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

import com.qmx.wxmp.common.persistence.Page;
import com.qmx.wxmp.controller.BaseController;
import com.qmx.wxmp.entity.order.OrderByDay;
import com.qmx.wxmp.service.order.OrderByDayService;

/**
 * 每日订单controller
 * @author itismin
 *
 */
@Controller
@RequestMapping(value = "/dcxt/orderbyday")
public class OrderByDayController extends BaseController {

	@Autowired
	private OrderByDayService byDayService;

	@ModelAttribute
	public OrderByDay get(@RequestParam(required = false) String id) {
		if (StringUtils.isNotBlank(id)) {
			return byDayService.get(id);
		} else {
			return new OrderByDay();
		}
	}

	@RequiresPermissions("dcxt:orderbyday:view")
	@RequestMapping({ "list", "" })
	public String list(OrderByDay entity, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<OrderByDay> page = byDayService.findList(new Page<OrderByDay>(request, response), entity);
		model.addAttribute("page", page);
		return "/order/orderbydayList";
	}

	

}
