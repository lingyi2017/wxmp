package com.qmx.wxmp.wx.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import me.chanjar.weixin.mp.api.WxMpService;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.github.binarywang.wxpay.bean.notify.WxPayNotifyResponse;
import com.github.binarywang.wxpay.bean.notify.WxPayOrderNotifyResult;
import com.github.binarywang.wxpay.bean.result.WxPayBaseResult;
import com.github.binarywang.wxpay.bean.result.WxPayOrderQueryResult;
import com.github.binarywang.wxpay.exception.WxPayException;
import com.github.binarywang.wxpay.service.WxPayService;
import com.qmx.wxmp.wx.service.WxMainService;
import com.qmx.wxmp.wx.service.WxOwnPayService;

/**
 * 微信支付服务 Controller
 * @author itismin
 *
 */
@Controller
@RequestMapping(value = "/wx/pay")
public class WxPayController {

	protected Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private WxMainService mainService;
	@Autowired
    protected WxMpService wxMpService;
	@Autowired
	private WxPayService payService;
	@Autowired
	private WxOwnPayService wxOwnPayService;
	
	@RequestMapping(value = "/notify")
	public void notify(HttpServletResponse response,
            HttpServletRequest request) {
		System.out.println("微信访问了异步回调请求");
		try {
			String xmlResult = IOUtils.toString(request.getInputStream(), request.getCharacterEncoding());
			WxPayOrderNotifyResult result = payService.parseOrderNotifyResult(xmlResult);
		    // 结果正确
			if("SUCCESS".equals(result.getResultCode())){//交易成功
				//处理本系统业务
				wxOwnPayService.dealWxPayResult(result);
			}
		    //回传微信处理结果，避免重复通知
		    response.getWriter().write(WxPayNotifyResponse.success("处理成功!"));
		  } catch (Exception e) {
		    logger.error("微信回调结果异常,异常原因{}", e.getMessage());
		  }
	}
	
	@RequestMapping(value = "/result_view")
	public String resultView(HttpServletResponse response,
            HttpServletRequest request) {
		/*String transactionId = "";
		WxPayOrderQueryResult queryResult;
		try {
			queryResult = payService.queryOrder(transactionId, "");
		    if("SUCCESS".equals(queryResult.getTradeState())){
		    	//订单状态为支付成功
		    	//保存本系统支付记录，订单状态
		    	System.out.println("微信支付回调:支付成功.微信订单号:"+transactionId);
		    }
		    
		} catch (WxPayException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
		return null;
	}
}
