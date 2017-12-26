package com.qmx.wxmp.wx.handler;

import java.util.Map;

import me.chanjar.weixin.common.exception.WxErrorException;
import me.chanjar.weixin.common.session.WxSessionManager;
import me.chanjar.weixin.mp.api.WxMpService;
import me.chanjar.weixin.mp.bean.message.WxMpXmlMessage;
import me.chanjar.weixin.mp.bean.message.WxMpXmlOutMessage;
import me.chanjar.weixin.mp.bean.message.WxMpXmlOutTextMessage;

import org.springframework.stereotype.Component;

/**
 * 转发客户消息给客服Handler
 *
 * Created by FirenzesEagle on 2016/7/27 0027.
 * Email:liumingbo2008@gmail.com
 */
@Component
public class MsgHandler extends AbstractHandler {
    @Override
    public WxMpXmlOutMessage handle(WxMpXmlMessage wxMessage, Map<String, Object> context, WxMpService wxMpService, WxSessionManager sessionManager) throws WxErrorException {
       /* return WxMpXmlOutMessage
                .TRANSFER_CUSTOMER_SERVICE().fromUser(wxMessage.getToUser())
                .toUser(wxMessage.getFromUser()).build();*/
    	WxMpXmlOutTextMessage m
        = WxMpXmlOutMessage.TEXT()
        .content("已收到您的消息")
        .fromUser(wxMessage.getToUser())
        .toUser(wxMessage.getFromUser())
        .build();
    	return m;
    }
}
