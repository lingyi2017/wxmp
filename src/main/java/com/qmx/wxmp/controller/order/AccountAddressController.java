package com.qmx.wxmp.controller.order;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qmx.wxmp.common.utils.StringUtils;
import com.qmx.wxmp.controller.BaseController;
import com.qmx.wxmp.entity.order.AccountAddress;
import com.qmx.wxmp.service.order.AccountAddressService;
import com.qmx.wxmp.service.order.AccountService;

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
	@Autowired
	private AccountService accountService;

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
	@RequestMapping("/wx_address_save")
	public String wxAddressSave(String accountId, Model model) {
		model.addAttribute("accountId", accountId);
		return "/wx/address_add";
	}
	
	
	/**
	 * 微信端：收货地址列表
	 * @param openId
	 * @return
	 */
	@RequestMapping("/wx_address_list")
	public String wxAddressList(Model model) {
		model.addAttribute("addressList", accountAddressService.findAddressListByAccountId("09f89a7575094781956aa65fe659b810"));
		//model.addAttribute("addressList", accountAddressService.findAddressListByAccountId(SpringWebUtil.getAccount().getId()));
		return "/wx/address_list";
	}
	
	/**
	 * 微信端：修改收货地址
	 * @param openId
	 * @return
	 */
	@RequestMapping("/wx_address_edit")
	public String wxAddressEdit(String id, Model model) {
		if(StringUtils.isNotBlank(id)){
			AccountAddress address = accountAddressService.get(id);
			model.addAttribute("address", address);
		}
		
		return "/wx/address_edit";
	}
	
	/**
	 * 微信端：保存地址
	 * @param address
	 * @return
	 */
	@RequestMapping("/wx_save")
	@ResponseBody
	public String wxSave(AccountAddress address){
		try{
			accountAddressService.saveByWeiXin(address,accountService.get("09f89a7575094781956aa65fe659b810"));
		} catch (Exception e){
			e.printStackTrace();
		}
		
		return "true";
	}
	
	
	/**
	 * 微信端：删除地址
	 * @param addressId
	 * @return
	 */
	@RequestMapping("/wx_del")
	@ResponseBody
	public String wxAddressDel(@RequestParam(value="id",required=true) String id) {
		accountAddressService.delete(id);
		return "true";
	}
}
