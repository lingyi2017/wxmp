package com.qmx.wxmp.wx.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 微信 Controller
 *
 * @author longxy
 * @date 2017-12-10 23:02
 */
@Controller
@RequestMapping(value = "/wx/page")
public class WxPageController {

	@RequestMapping(value = "/week_menu_list")
	public String weekMenuListUI() {
		return "/wx/week_menu_list";
	}



	@RequestMapping(value = "/next_week_menu_list")
	public String nextWeekMenuListUI() {
		return "/wx/next_week_menu_list";
	}



	@RequestMapping(value = "/serviceForm")
	public String serviceFormUI() {
		return "/wx/serviceForm";
	}



	@RequestMapping(value = "/serviceBuy")
	public String serviceBuyUI() {
		return "/wx/serviceBuy";
	}



	@RequestMapping(value = "/personalCenter")
	public String personalCenterUI() {
		return "/wx/personalCenter";
	}



	@RequestMapping(value = "/orderList")
	public String orderListUI() {
		return "/wx/orderList";
	}



	@RequestMapping(value = "/orderForm")
	public String orderFormUI() {
		return "/wx/orderForm";
	}



	@RequestMapping(value = "/consultList")
	public String consultListUI() {
		return "/wx/consultList";
	}



	@RequestMapping(value = "/consultForm")
	public String consultFormUI() {
		return "/wx/consultForm";
	}



	@RequestMapping(value = "/accountEdit")
	public String accountEdit() {
		return "/wx/account_edit";
	}



	@RequestMapping(value = "/areaEdit")
	public String areaEdit() {
		return "/wx/area_edit";
	}



	@RequestMapping(value = "/areaList")
	public String areaList() {
		return "/weixxin/address_list";
	}

}
