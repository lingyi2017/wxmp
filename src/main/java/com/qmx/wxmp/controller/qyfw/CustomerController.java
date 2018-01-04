package com.qmx.wxmp.controller.qyfw;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.qmx.wxmp.common.persistence.Page;
import com.qmx.wxmp.controller.BaseController;
import com.qmx.wxmp.entity.qyfw.Consulting;
import com.qmx.wxmp.entity.qyfw.Customer;
import com.qmx.wxmp.entity.qyfw.Order;
import com.qmx.wxmp.service.qyfw.ConsultingService;
import com.qmx.wxmp.service.qyfw.CustomerService;
import com.qmx.wxmp.service.qyfw.OrderService;

/**
 * 客户 Controller
 *
 * @author longxy
 * @date 2017-10-23 23:50
 */
@Controller
@RequestMapping(value = "/qyfw/customer/")
public class CustomerController extends BaseController {

	@Autowired
	private CustomerService thisService;
	@Autowired
	private OrderService orderService;
	@Autowired
	private ConsultingService consultingService;


	@ModelAttribute
	public Customer get(@RequestParam(required = false) String id) {
		if (StringUtils.isNotBlank(id)) {
			return thisService.get(id);
		} else {
			return new Customer();
		}
	}



	@RequiresPermissions("qyfw:customer:view")
	@RequestMapping(value = { "/list", "" })
	public String list(Customer customer, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<Customer> page = thisService.find(new Page<Customer>(request, response), customer);
		model.addAttribute("page", page);
		return "/qyfw/customerList";
	}



	@RequiresPermissions("qyfw:customer:view")
	@RequestMapping(value = "dialogList")
	public String dialogList(Customer customer, HttpServletRequest request, HttpServletResponse response, Model model) throws UnsupportedEncodingException {
		customer.setName(URLDecoder.decode(customer.getName(), "utf-8"));
		customer.setContact((URLDecoder.decode(customer.getContact(), "utf-8")));
		customer.setPhone((URLDecoder.decode(customer.getPhone(), "utf-8")));
		Page<Customer> queryPage = new Page<>(request, response);
		queryPage.setPageSize(10);
		Page<Customer> page = thisService.find(queryPage, customer);
		model.addAttribute("page", page);
		return "/qyfw/customerDialogList";
	}



	@RequiresPermissions("qyfw:customer:view")
	@RequestMapping(value = "/form")
	public String form(Customer customer, Model model) {
		model.addAttribute("customer", customer);
		return "/qyfw/customerForm";
	}



	@RequiresPermissions("qyfw:customer:edit")
	@RequestMapping(value = "/save")
	public String save(Customer customer, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, customer)) {
			return form(customer, model);
		}
		thisService.save(customer);
		addMessage(redirectAttributes, "保存客户'" + customer.getName() + "'成功");
		return "redirect:/qyfw/customer/?repage";
	}



	@RequiresPermissions("qyfw:customer:edit")
	@RequestMapping(value = "/delete")
	public String delete(String id, RedirectAttributes redirectAttributes) {
		thisService.delete(id);
		addMessage(redirectAttributes, "删除客户成功");
		return "redirect:/qyfw/customer/?repage";
	}



	@RequiresPermissions("qyfw:customer:view")
	@RequestMapping(value = "/detail")
	public String detail(Customer customer, Model model) {
		model.addAttribute("customer", customer);
		return "/qyfw/customerDetail";
	}



	/**
	 * 客户电话号码唯一性校验(未删除客户)
	 * 
	 * @param id
	 *            客户ID
	 * @param customerType
	 *            客户性质
	 * @param phone
	 *            电话号码
	 */
	@ResponseBody
	@RequestMapping(value = "checkCustomerPhone", method = RequestMethod.POST, produces = "text/html;charset=UTF-8")
	public String checkCustomerPhone(String id, String customerType, String phone) {

		Customer entity = null;
		if (StringUtils.isNotBlank(id)) {
			entity = thisService.get(id);
		}

		Customer customer = thisService.findByPhoneAndCustomerType(phone, customerType);
		if (entity == null) { // 新增
			if (customer == null) {
				return "true"; // 校验通过
			} else {
				return "false"; // 校验失败
			}
		} else { // 修改
			if (!phone.equals(entity.getPhone())) { // 客户电话号码被修改了
				if (customer == null) {
					return "true";
				} else {
					return "false";
				}
			} else {
				return "true";
			}
		}

	}

	@RequestMapping(value = "/wx_order_list")
	public String wxOrderList(String openid, Model model) {
		List<Order> list = orderService.findByOpenid(openid);
		model.addAttribute("orderList", list);
		return "/wx/order_list";
	}
	
	@RequestMapping(value = "/wx_consulting_list")
	public String wxConsultingList(String openid, Model model) {
		List<Consulting> list = consultingService.findByOpenid(openid);
		model.addAttribute("consultingList", list);
		return "/wx/consulting_list";
	}
	
	@RequestMapping(value = "/wx_personal_center")
	public String wxPersonalCenter(String openid, Model model) {
		return "/wx/personal_center";
	}
}
