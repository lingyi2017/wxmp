package com.qmx.wxmp.controller.wx;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 微信 Controller
 *
 * @author longxy
 * @date 2017-12-10 23:02
 */
@Controller
@RequestMapping(value = "/wx")
public class WxController {

	@RequestMapping(value = "/weui/{page}")
	public String toWeUI(@PathVariable(value = "page") String page) {
		return "/wx/" + page;
	}

}
