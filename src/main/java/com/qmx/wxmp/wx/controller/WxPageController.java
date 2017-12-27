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

	@RequestMapping(value = "/serviceList")
	public String serviceListUI() {
		return "/wx/serviceList";
	}



	@RequestMapping(value = "/serviceForm")
	public String serviceFormUI() {
		return "/wx/serviceForm";
	}

}
