package com.qmx.wxmp.wx.controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import me.chanjar.weixin.mp.api.WxMpService;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.github.binarywang.wxpay.bean.notify.WxPayNotifyResponse;
import com.github.binarywang.wxpay.bean.notify.WxPayOrderNotifyResult;
import com.github.binarywang.wxpay.bean.request.WxPayUnifiedOrderRequest;
import com.github.binarywang.wxpay.bean.result.WxPayBaseResult;
import com.github.binarywang.wxpay.bean.result.WxPayOrderQueryResult;
import com.github.binarywang.wxpay.bean.result.WxPayUnifiedOrderResult;
import com.github.binarywang.wxpay.exception.WxPayException;
import com.github.binarywang.wxpay.service.WxPayService;
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

	protected Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private MainService mainService;
	@Autowired
    protected WxMpService wxMpService;
	@Autowired
	private WxPayService payService;
	
	@RequestMapping(value = "/person_center")
	public String toWeUI(String code, Model model) {
		String openId = mainService.getOpenid(code);
		model.addAttribute("openId", openId);
		return "/wx/person_center";
	}
	
	@RequestMapping(value = "/ordertest_1")
	public String ordertest1(Model model, String code) {
		//进入订单页面
		return "/wx/order_test";
	}
	
	@RequestMapping(value = "/ordertest_2")
	public String ordertest2(HttpServletResponse response,
            HttpServletRequest request) {
		try {
			String orderId = "201712251001";
			String totalFee = request.getParameter("totalFee");
			
			//向微信发送授权
			String url = wxMpService.oauth2buildAuthorizationUrl("http://1u9288562a.imwork.net/wxmp/wx/page/ordertest_3?orderId="+orderId+"&totalFee="+totalFee, "snsapi_base", "");
			System.out.println("url:" + url);
			response.sendRedirect(url);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	@RequestMapping(value = "/ordertest_3")
	public String ordertest3(HttpServletResponse response,
            HttpServletRequest request, Model model) {
		String orderId = request.getParameter("orderId");
		System.out.println("in toPay,orderId:" + orderId);
		String totalFeeStr = request.getParameter("totalFee");
		orderId = "201712251001"+ new Date().getTime();
		
		//网页授权后获取传递的参数
		String code = request.getParameter("code");
		//获取openid
		String openid = mainService.getOpenid(code);
		System.out.println("openid:"+openid);
		//统一下单，获取微信预支付id
	    WxPayUnifiedOrderRequest prepayInfo = WxPayUnifiedOrderRequest.newBuilder()
	      .openid(openid)
	      .outTradeNo(orderId)
	      .totalFee(Integer.valueOf("1"))
	      .body("0.01元测试支付")
	      .tradeType("JSAPI")
	      .spbillCreateIp(request.getRemoteAddr())
	      .notifyURL("http://1u9288562a.imwork.net/wxmp/wx/page/order_notify")//TODO(user) 填写通知回调地址
	      .build();

	    try {
	    	WxPayUnifiedOrderResult payInfo = this.payService.unifiedOrder(prepayInfo);
	    	model.addAttribute("payInfo", payInfo);
	    	model.addAttribute("timeStamp", new Date().getTime());
	    	model.addAttribute("orderId", orderId);
			return "/wx/pay_test";
	    } catch (WxPayException e) {
	    	e.printStackTrace();
			return "/error/500";
	    }
	}
	
	@RequestMapping(value = "/order_notify")
	public String notify(HttpServletResponse response,
            HttpServletRequest request) {
		System.out.println("微信访问了异步回调请求");
		  try {
		    String xmlResult = IOUtils.toString(request.getInputStream(), request.getCharacterEncoding());
		    WxPayOrderNotifyResult result = payService.parseOrderNotifyResult(xmlResult);
		    // 结果正确
		    String orderId = result.getOutTradeNo();
		    String totalFee = WxPayBaseResult.feeToYuan(result.getTotalFee());
		    String transactionId = result.getTransactionId();
		    //自己处理订单的业务逻辑，需要判断订单是否已经支付过，否则可能会重复调用
		    WxPayOrderQueryResult queryResult = payService.queryOrder(transactionId, "");
		    if("SUCCESS".equals(queryResult.getTradeState())){
		    	//订单状态为支付成功
		    	//保存本系统支付记录，订单状态
		    	System.out.println("微信支付回调:支付成功.微信订单号:"+transactionId +",金额:"+totalFee);
		    }
		    return WxPayNotifyResponse.success("处理成功!");
		  } catch (Exception e) {
		    logger.error("微信回调结果异常,异常原因{}", e.getMessage());
		    return WxPayNotifyResponse.fail(e.getMessage());
		  }
	}
	
	@RequestMapping(value = "/ordertest_4")
	public String ordertest4(HttpServletResponse response,
            HttpServletRequest request, Model model) {
		System.out.println("返回了支付结果页面");
		String orderId = request.getParameter("orderId");
		System.out.println("toWXPaySuccess, orderId: " + orderId);
		return "/wx/pay_result_test";
	}
	
	@RequestMapping(value = "/ordertest_9")
	public String ordertest9(HttpServletResponse response,
            HttpServletRequest request, Model model) {
		return "/wx/pay_test";
	}
	
	
	@RequestMapping(value = "/orderApply")
	public String orderApply(HttpServletResponse response,
            HttpServletRequest request, Model model) {
		return "/wx/order_apply";
	}

}
