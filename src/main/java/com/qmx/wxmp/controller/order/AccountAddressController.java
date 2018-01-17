package com.qmx.wxmp.controller.order;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qmx.wxmp.common.utils.SpringWebUtil;
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

	@RequestMapping({ "list", "" })
	public String list(AccountAddress entity, HttpServletRequest request, HttpServletResponse response, Model model) {
		//Page<AccountAddress> page = accountAddressService.findList(new Page<AccountAddress>(request, response), entity);
		//model.addAttribute("page", page);
		return "/order/accountList";
	}

	/**
	 * 修改订单收货地址
	 * @param orderId
	 * @param model
	 * @return
	 *//*
	@RequestMapping("/formByOrderId")
	public String formByOrderId(String orderId, Model model) {
		AccountAddress address = accountAddressService.getByOrderId(orderId);
		model.addAttribute("accountaddress", address);
		
		return "/order/accountaddressForm";
	}*/
	
	/**
	 * 微信端：增加收货地址
	 * @param openId
	 * @return
	 */
	@RequestMapping("/addressAddByWeiXin")
	public String addressAddByWeiXin(String accountId, Model model) {
		model.addAttribute("accountId", accountId);
		return "/wx/address_add";
	}
	
	/**
	 * 微信端：修改收货地址
	 * @param openId
	 * @return
	 */
	@RequestMapping("/addressEditByWeiXin")
	public String addressEditByWeiXin(String id, Model model) {
		AccountAddress address = accountAddressService.get(id);
		model.addAttribute("address", address);
		return "/wx/address_edit";
	}
	
	/**
	 * 微信端：收货地址列表
	 * @param openId
	 * @return
	 */
	@RequestMapping("/wxAddressList")
	public String wxAddressList(Model model) {
		model.addAttribute("addressList", accountAddressService.findAddressListByAccountId(SpringWebUtil.getAccount().getId()));
		return "/wx/address_list";
	}
	
	/**
	 * 微信端：保存地址
	 * @param address
	 * @return
	 */
	@RequestMapping("/wxSave")
	@ResponseBody
	public String wxSave(AccountAddress address, HttpServletRequest request
			, HttpServletResponse response){
		accountAddressService.saveByWeiXin(address,null);
		return "true";
	}
	/**
	 * 微信端：修改地址默认属性
	 * @param openId
	 * @return
	 */
	@RequestMapping("/addressDefaultByWeiXin")
	@ResponseBody
	public String addressDefaultByWeiXin(String accountId, String addressId) {
		accountAddressService.updateDefaultAddress(accountId, addressId);
		return "true";
	}
	
	/**
	 * 微信端：删除地址
	 * @param addressId
	 * @return
	 */
	@RequestMapping("/addressDelByWeiXin")
	@ResponseBody
	public String addressDelByWeiXin(String addressId) {
		accountAddressService.delete(addressId);
		return "true";
	}
}
