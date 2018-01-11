package com.qmx.wxmp.wx.service;

import me.chanjar.weixin.common.exception.WxErrorException;
import me.chanjar.weixin.mp.api.WxMpService;
import me.chanjar.weixin.mp.bean.result.WxMpOAuth2AccessToken;
import me.chanjar.weixin.mp.bean.result.WxMpUser;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 微信授权服务
 * @author itismin
 *
 */
@Service
public class WxOauthService {

	/** 微信授权:静默*/
	public static final String OAUTH2_NOTIFY_BASE_URL = "http://www.qmxqyzx.com/wx/oauth/oauth_notify_base";
	/** 微信授权:用户信息*/
	public static final String OAUTH2_NOTIFY_USER_URL = "http://www.qmxqyzx.com/wx/oauth/oauth_notify_user";
	
    @Autowired
    protected WxMpService wxMpService;
    
    /**
     * 通过授权code获取openid
     * @param code
     * @return
     * @throws WxErrorException
     */
    public String getOpenid(String code) throws WxErrorException {
        WxMpOAuth2AccessToken accessToken;
        accessToken = this.wxMpService.oauth2getAccessToken(code);
        return accessToken.getOpenId();
    }

    /**
     * 通过openid获得基本用户信息
     *
     * @param openid
     * @param lang lang 语言，zh_CN 简体(默认)，zh_TW 繁体，en 英语
     * @return
     * @throws WxErrorException 
     */
    public WxMpUser getUserInfo(String openid, String lang) throws WxErrorException {
        WxMpUser wxMpUser = null;
        wxMpUser = this.wxMpService.getUserService().userInfo(openid, lang);
        return wxMpUser;
    }
}
