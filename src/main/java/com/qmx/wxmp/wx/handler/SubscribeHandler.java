package com.qmx.wxmp.wx.handler;

import java.util.Date;
import java.util.Map;

import me.chanjar.weixin.common.exception.WxErrorException;
import me.chanjar.weixin.common.session.WxSessionManager;
import me.chanjar.weixin.mp.api.WxMpConfigStorage;
import me.chanjar.weixin.mp.api.WxMpService;
import me.chanjar.weixin.mp.bean.message.WxMpXmlMessage;
import me.chanjar.weixin.mp.bean.message.WxMpXmlOutMessage;
import me.chanjar.weixin.mp.bean.message.WxMpXmlOutTextMessage;
import me.chanjar.weixin.mp.bean.result.WxMpUser;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.qmx.wxmp.entity.order.Account;
import com.qmx.wxmp.service.order.AccountService;
import com.qmx.wxmp.wx.service.WxOauthService;

/**
 * 用户关注公众号Handler
 * <p>
 * Created by FirenzesEagle on 2016/7/27 0027.
 * Email:liumingbo2008@gmail.com
 */
@Component
public class SubscribeHandler extends AbstractHandler {

    @Autowired
    protected WxMpConfigStorage configStorage;
    @Autowired
    protected WxMpService wxMpService;
    @Autowired
    protected WxOauthService wxOauthService;
    @Autowired
    protected AccountService accountService;

    @Override
    public WxMpXmlOutMessage handle(WxMpXmlMessage wxMessage, Map<String, Object> context, WxMpService wxMpService, WxSessionManager sessionManager) throws WxErrorException {
        WxMpUser wxMpUser = wxOauthService.getUserInfo(wxMessage.getFromUser(), "zh_CN");
        //如果系统没有此用户，进行新增
        Account account = accountService.findByOpenId(wxMpUser.getOpenId());
        if(account == null){
        	account = new Account();
        	int count = accountService.findNumByNickName(wxMpUser.getNickname());
        	account.setName(count == 0 ? wxMpUser.getNickname() : wxMpUser.getNickname() + (count+1));
        	account.setNickName(wxMpUser.getNickname());
        	account.setOpenid(wxMpUser.getOpenId());
        	account.setSex(wxMpUser.getSex());
        	account.setScore(0);
        	account.setSubscribeTime(new Date(wxMpUser.getSubscribeTime()));
        	accountService.save(account);
        }
        WxMpXmlOutTextMessage m
            = WxMpXmlOutMessage.TEXT()
            .content("尊敬的" + wxMpUser.getNickname() + "，您好！欢迎关注醒身中式健身餐")
            .fromUser(wxMessage.getToUser())
            .toUser(wxMessage.getFromUser())
            .build();
        logger.info("subscribeMessageHandler" + m.getContent());
        return m;
    }
};
