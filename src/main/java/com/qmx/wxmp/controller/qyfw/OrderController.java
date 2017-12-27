package com.qmx.wxmp.controller.qyfw;

import java.math.BigDecimal;
import java.util.Date;

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

import com.github.binarywang.wxpay.bean.order.WxPayMpOrderResult;
import com.github.binarywang.wxpay.exception.WxPayException;
import com.qmx.wxmp.common.persistence.Page;
import com.qmx.wxmp.common.utils.IdGen;
import com.qmx.wxmp.controller.BaseController;
import com.qmx.wxmp.dto.order.QueryOrderDto;
import com.qmx.wxmp.entity.qyfw.BasicService;
import com.qmx.wxmp.entity.qyfw.Customer;
import com.qmx.wxmp.entity.qyfw.Order;
import com.qmx.wxmp.service.qyfw.CustomerService;
import com.qmx.wxmp.service.qyfw.OrderService;
import com.qmx.wxmp.wx.service.WxOwnPayService;

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
	private OrderService	thisService;

	@Autowired
	private CustomerService	customerService;
	
	@Autowired
	private WxOwnPayService wxOwnPayService;



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
	@RequestMapping(value = "/deal/save")
	public String dealSave(Order order, Model model, RedirectAttributes redirectAttributes) {

		if (null == order) {
			addMessage(redirectAttributes, "订单不能为空");
			return "redirect:/qyfw/order/wait/list?repage";
		}

		try {

			if (!beanValidator(model, order)) {
				return deal(order, model);
			}

			// 保存客户信息
			Customer customer = order.getCustomer();
			if (null != customer && StringUtils.isEmpty(customer.getId())) {
				customer.setId(IdGen.uuid());
				customer.setCreateDate(new Date());
				customerService.save(customer);
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
	
	
	/**
	 * 微信端订单提交，保存后进入支付页面
	 * @param order
	 * @return
	 */
	@RequestMapping(value = "/save")
	public String save(Order order,String openid, Model model
			,HttpServletResponse response, HttpServletRequest request){
		try {
			//保存订单
			BasicService test = new BasicService();
			test.setId("3bff6d9c29f548a4bbc80c391b45e904");
			order.setBasicService(test);
			order.setOpenid(openid);
			order.setContact("18782929924");
			order.setMoney(new BigDecimal("0.01"));
			order.setTradeDesc("启明星服务-个人贷款");
			thisService.save(order);
			//获取支付页面需要的微信支付参数
			WxPayMpOrderResult payInfo = wxOwnPayService.getJSSDKPayInfo(order.getOpenid()
					, order.getOutTradeNo(), order.getMoney().multiply(new BigDecimal("100")).intValue()
					, order.getTradeDesc(), "JSAPI", request.getRemoteAddr());
			model.addAttribute("payInfo", payInfo);
			return "/wx/pay_test";
		} catch (WxPayException e) {
			e.printStackTrace();
			return "/error/500";
		}
	}
	
	/**
	 * 微信端订单提交，保存后进入支付页面
	 * @param order
	 * @return
	 */
	@RequestMapping(value = "/savetest")
	public String savetest(Order order,String openid, Model model
			,HttpServletResponse response, HttpServletRequest request){
			//保存订单
			BasicService test = new BasicService();
			test.setId("3bff6d9c29f548a4bbc80c391b45e904");
			order.setBasicService(test);
			order.setOpenid(openid);
			order.setContact("18782929924");
			order.setMoney(new BigDecimal("0.01"));
			order.setTradeDesc("启明星服务-个人贷款");
			thisService.save(order);
			
			return "/error/500t";
	}

}
