package com.qmx.wxmp.wx.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import me.chanjar.weixin.common.exception.WxErrorException;
import me.chanjar.weixin.mp.api.WxMpService;
import me.chanjar.weixin.mp.bean.result.WxMpUser;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.qmx.wxmp.wx.service.WxOauthService;

/**
 * 微信授权服务 Controller
 * @author itismin
 *
 */
@Controller
@RequestMapping(value = "/wx/oauth")
public class WxOauthController {

	protected Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
    protected WxOauthService wxOauthService;
	@Autowired
    protected WxMpService wxMpService;
	
	/**
	 * 用户静默授权回调地址
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/oauth_notify_base")
	public String oauthNotifyBase(HttpServletResponse response,
            HttpServletRequest request, Model model) {
		String code = request.getParameter("code");//微信授权code
		String page = request.getParameter("page");//要跳转的页面
		String state = request.getParameter("state");
		String openid = "";
		try {
			openid = wxOauthService.getOpenid(code);
		} catch (WxErrorException e) {
			logger.info("获取openid失败");
			e.printStackTrace();
		}
		model.addAttribute("state",state);
		model.addAttribute("openid",openid);
		System.out.println(openid);
		return page;
	}
	
	/**
	 * 用户信息授权回调地址
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/oauth_notify_user")
	public String oauthNotifyUser(HttpServletResponse response,
            HttpServletRequest request, Model model) {
		String code = request.getParameter("code");//微信授权code
		String page = request.getParameter("page");//要跳转的页面
		String state = request.getParameter("state");
		WxMpUser wxUser = new WxMpUser();
		try {
			String openid = wxOauthService.getOpenid(code);
			wxUser = wxOauthService.getUserInfo(openid, null);
			model.addAttribute("openid",openid);
			model.addAttribute("wxUser",wxUser);
		} catch (WxErrorException e) {
			e.printStackTrace();
		}
		return page;
	}
}
