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
import com.qmx.wxmp.service.qyfw.BasicServiceService;
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
	
	@Autowired
	private BasicServiceService basicServiceService;



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
				order.setDealDate(new Date());
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
	 * 微信订单购买页面
	 * @param order
	 * @return
	 */
	@RequestMapping(value = "/wx_serivce_buy")
	public String wxServiceBuy(String serviceId,String openid, Model model
			,HttpServletResponse response, HttpServletRequest request){
		try{
			if(StringUtils.isBlank(openid) || StringUtils.isBlank(serviceId)){
				response.getWriter().write("发生了不可预知的错误,请返回公众号内重新操作");
			}
			BasicService basicService = basicServiceService.get(serviceId);
			model.addAttribute("basicService", basicService);
			model.addAttribute("openid", openid);
			return "/wx/service_buy";
		} catch(Exception e){
			return null;
		}
		
	}
	
	/**
	 * 微信端订单提交，保存后进入支付页面
	 * @param order
	 * @return
	 */
	@RequestMapping(value = "/wx_save")
	public String wxSave(String basicServiceId, String openid, String customerType, String contact, String phone, String mark, String companyName
			, Model model,HttpServletResponse response, HttpServletRequest request){
		try {
			//保存订单
			BasicService basicService = basicServiceService.get(basicServiceId);
			Order order = new Order();
			order.setBasicService(basicService);
			order.setOpenid(openid);
			order.setContact(contact);
			order.setPhone(phone);
			order.setMoney(basicService.getPrice());
			order.setCreateDate(new Date());
			order.setTradeDesc("企明星服务咨询");
			order.setStatus("0");
			order.setCustomerType(customerType);
			order.setMark(mark);
			order.setCompanyName(companyName);
			thisService.save(order);
			//获取支付页面需要的微信支付参数
			WxPayMpOrderResult payInfo = wxOwnPayService.getJSSDKPayInfo(order.getOpenid()
					, order.getOutTradeNo(), order.getMoney().multiply(new BigDecimal("100")).intValue()
					, order.getTradeDesc(), "JSAPI", request.getRemoteAddr());
			model.addAttribute("payInfo", payInfo);
			model.addAttribute("openid", openid);
			return "/wx/order_pay";
		} catch (WxPayException e) {
			e.printStackTrace();
			return "/error/500";
		} catch (Exception e) {
			e.printStackTrace();
			return "/error/500";
		}
	}
	
	@RequestMapping(value = "/wx_order_form")
	public String wxOrderForm(String orderId, Model model){
		model.addAttribute("order", thisService.get(orderId));
		return "/wx/order_form";
	}

}
