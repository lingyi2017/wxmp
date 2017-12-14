package com.qmx.wxmp.controller.wx;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.qmx.wxmp.entity.dcxt.Product;

/**
 * 微信端产品 Controller
 *
 * @author longxy
 * @date 2017-12-10 23:02
 */
@Controller
@RequestMapping(value = "/wx/product")
public class WxProductController {

	@RequestMapping({ "list", "" })
	public String list(Product entity, HttpServletRequest request, HttpServletResponse response, Model model) {

		return "/wx/productList";
	}



	@RequestMapping("/form")
	public String form() {
		return "/wx/productForm";
	}



	@RequestMapping("/weekDishes")
	public String productWeekDishes() {
		return "/wx/productWeekDishes";
	}
}
