package com.qmx.wxmp.wx.service;

import java.math.BigDecimal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.binarywang.wxpay.bean.notify.WxPayOrderNotifyResult;
import com.github.binarywang.wxpay.bean.order.WxPayMpOrderResult;
import com.github.binarywang.wxpay.bean.request.WxPayUnifiedOrderRequest;
import com.github.binarywang.wxpay.bean.result.WxPayBaseResult;
import com.github.binarywang.wxpay.exception.WxPayException;
import com.github.binarywang.wxpay.service.WxPayService;
import com.qmx.wxmp.common.utils.DateUtils;
import com.qmx.wxmp.common.utils.IdGen;
import com.qmx.wxmp.entity.order.OrderMain;
import com.qmx.wxmp.entity.order.OrderPayRecord;
import com.qmx.wxmp.service.order.OrderPayRecordService;
import com.qmx.wxmp.service.order.OrderService;

/**
 * 本系统需要的微信支付方法
 * @author itismin
 *
 */
@Service
public class WxOwnPayService {

	/** 微信支付：通知回调地址*/
	public static final String WX_PAY_NOTIFY_URL = "http://www.qmxqyzx.com/wx/pay/notify";

	@Autowired
	private WxPayService wxPayService;
	@Autowired
	private OrderPayRecordService orderPayRecordService;
	@Autowired
	private OrderService orderService;
	
	/**
	 * 获取页面JSAPI调用支付所需的信息(参数都为必填).在调用前应生成未支付状态的订单信息
	 * @param openid 用户标识
	 * @param outTradeNo 本系统的订单id
	 * @param totalFee 订单总金额 单位是分,传整数
	 * @param body 交易描述(如话费充值)
	 * @param tradeType 交易类型.默认请传JSAPI
	 * @param spbillCreateIp 交易终端ip.请使用request.getRemoteAddr()获取
	 * @return
	 * @throws WxPayException
	 */
    public WxPayMpOrderResult getJSSDKPayInfo(String openid, String outTradeNo, Integer totalFee, String body
    		, String tradeType, String spbillCreateIp) throws WxPayException {
		WxPayUnifiedOrderRequest prepayInfo = WxPayUnifiedOrderRequest.newBuilder()
		.openid(openid)
		.outTradeNo(outTradeNo)
		.totalFee(totalFee)
		.body(body)
		.tradeType(tradeType)
		.spbillCreateIp(spbillCreateIp)
		.notifyURL(WxOwnPayService.WX_PAY_NOTIFY_URL)
		.build();
		WxPayMpOrderResult payInfo = wxPayService.createOrder(prepayInfo);
		return payInfo;
    }

    
    @Transactional(readOnly = false)
    public void dealWxPayResult(WxPayOrderNotifyResult result){
    	String openid = result.getOpenid();
    	String bankType = result.getBankType();
    	BigDecimal totalFee = new BigDecimal(WxPayBaseResult.feeToYuan(result.getTotalFee())) ;
    	String feeType = result.getFeeType();
    	String transactionId = result.getTransactionId();
    	String outTradeNo = result.getOutTradeNo();
    	String payTime = result.getTimeEnd();
    	//更新订单状态
    	OrderMain order = orderService.findByOutTradeNo(outTradeNo);
    	order.setStatus(OrderMain.ORDER_STATUS_START);
    	//支付记录
    	OrderPayRecord payRecord = new OrderPayRecord();
    	payRecord.setId(IdGen.uuid());
    	payRecord.setOpenid(openid);
    	payRecord.setBankType(bankType);
    	payRecord.setTotalFee(totalFee);
    	payRecord.setFeeType(feeType);
    	payRecord.setTransactionId(transactionId);
    	payRecord.setOutTradeNo(outTradeNo);
    	payRecord.setPayTime(DateUtils.strToDate(payTime, "yyyyMMddHHmmss"));
    	payRecord.setOrder(order);
    	order.setOrderPayRecord(payRecord);
    	orderService.save(order);
    }

}
