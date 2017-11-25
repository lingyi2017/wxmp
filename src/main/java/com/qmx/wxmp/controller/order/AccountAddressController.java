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

import com.qmx.wxmp.controller.BaseController;
import com.qmx.wxmp.entity.order.AccountAddress;
import com.qmx.wxmp.service.order.AccountAddressService;

/**
 * 收货地址
 * @author itismin
 *
 */
@Controller
@RequestMapping(value = "/dcxt/accountaddress")
public class AccountAddressController extends BaseController {

	@Autowired
	private AccountAddressService accountAddressService;

	@ModelAttribute
	public AccountAddress get(@RequestParam(required = false) String id) {
		if (StringUtils.isNotBlank(id)) {
			return accountAddressService.get(id);
		} else {
			return new AccountAddress();
		}
	}

	@RequestMapping({ "list", "" })
	public String list(AccountAddress entity, HttpServletRequest request, HttpServletResponse response, Model model) {
		//Page<AccountAddress> page = accountAddressService.findList(new Page<AccountAddress>(request, response), entity);
		//model.addAttribute("page", page);
		return "/order/accountList";
	}

	@RequestMapping("/form")
	public String form(AccountAddress entity, Model model) {

		model.addAttribute("accountaddress", entity);
		return "/order/accountaddressForm";
	}

	@RequestMapping("/save")
	public String save(AccountAddress entity, HttpServletRequest request, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, entity)) {
			return form(entity, model);
		}

		try {
			accountAddressService.save(entity);
			addMessage(redirectAttributes, "保存收货地址成功");

		} catch (Exception e) {
			addMessage(redirectAttributes, "保存收货地址失败");
			logger.error(e.getMessage(), e);
			e.printStackTrace();
		}
		return "redirect:/dcxt/order/?repage";

	}
	
	/**
	 * 修改订单收货地址
	 * @param orderId
	 * @param model
	 * @return
	 */
	@RequestMapping("/formByOrderId")
	public String formByOrderId(String orderId, Model model) {
		AccountAddress address = accountAddressService.getByOrderId(orderId);
		model.addAttribute("accountaddress", address);
		
		return "/order/accountaddressForm";
	}

}
