package com.qmx.wxmp.wx.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.qmx.wxmp.wx.service.MainService;

/**
 * 微信 Controller
 *
 * @author longxy
 * @date 2017-12-10 23:02
 */
@Controller
@RequestMapping(value = "/wx/page")
public class WxPageController {

	@Autowired
	private MainService mainService;
	
	@RequestMapping(value = "/person_center")
	public String toWeUI(String code, Model model) {
		System.out.println("code"+code);
		String openId = mainService.getOpenid(code);
		System.out.println("openid"+openId);
		model.addAttribute("openId", openId);
		return "/wx/person_center";
	}
	
	
}
