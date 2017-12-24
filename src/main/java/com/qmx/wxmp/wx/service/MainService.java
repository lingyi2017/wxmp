package com.qmx.wxmp.wx.service;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletResponse;

import me.chanjar.weixin.common.api.WxConsts;
import me.chanjar.weixin.common.exception.WxErrorException;
import me.chanjar.weixin.mp.api.WxMpMessageRouter;
import me.chanjar.weixin.mp.api.WxMpService;
import me.chanjar.weixin.mp.bean.message.WxMpXmlMessage;
import me.chanjar.weixin.mp.bean.message.WxMpXmlOutMessage;
import me.chanjar.weixin.mp.bean.result.WxMpOAuth2AccessToken;
import me.chanjar.weixin.mp.bean.result.WxMpUser;

import org.apache.http.HttpEntity;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.util.EntityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.qmx.wxmp.wx.handler.LogHandler;
import com.qmx.wxmp.wx.handler.MsgHandler;
import com.qmx.wxmp.wx.handler.SubscribeHandler;
import com.qmx.wxmp.wx.util.ReturnModel;

/**
 * Created by FirenzesEagle on 2016/5/30 0030.
 * Email:liumingbo2008@gmail.com
 */
@Service
public class MainService {

    @Autowired
    protected WxMpService wxMpService;
    @Autowired
    protected LogHandler logHandler;
    @Autowired
    protected SubscribeHandler subscribeHandler;
    @Autowired
    protected MsgHandler msgHandler;
    protected Logger logger = LoggerFactory.getLogger(getClass());
    private WxMpMessageRouter router;

    @PostConstruct
    public void init() {
        this.refreshRouter();
    }

    /**
     * HttpGet请求
     *
     * @param urlWithParams
     * @throws Exception
     */
    public void requestGet(String urlWithParams) throws IOException {
        CloseableHttpClient httpclient = HttpClientBuilder.create().build();
        HttpGet httpget = new HttpGet(urlWithParams);
        httpget.addHeader("Content-Type", "text/html;charset=UTF-8");
        //配置请求的超时设置
        RequestConfig requestConfig = RequestConfig.custom()
            .setConnectionRequestTimeout(50)
            .setConnectTimeout(50)
            .setSocketTimeout(50).build();
        httpget.setConfig(requestConfig);

        CloseableHttpResponse response = httpclient.execute(httpget);
        System.out.println("StatusCode -> " + response.getStatusLine().getStatusCode());

        HttpEntity entity = response.getEntity();
        String jsonStr = EntityUtils.toString(entity);
        System.out.println(jsonStr);

        httpget.releaseConnection();
    }

    /**
     * HttpPost请求
     *
     * @param url
     * @param params
     * @throws ClientProtocolException
     * @throws IOException
     */
    public void requestPost(String url, List<NameValuePair> params) throws ClientProtocolException, IOException {
        CloseableHttpClient httpclient = HttpClientBuilder.create().build();

        HttpPost httppost = new HttpPost(url);
        httppost.setEntity(new UrlEncodedFormEntity(params, StandardCharsets.UTF_8));

        CloseableHttpResponse response = httpclient.execute(httppost);
        System.out.println(response.toString());

        HttpEntity entity = response.getEntity();
        String jsonStr = EntityUtils.toString(entity, "utf-8");
        System.out.println(jsonStr);

        httppost.releaseConnection();
    }

    /**
     * 刷新消息路由器
     */
    public void refreshRouter() {
        final WxMpMessageRouter newRouter = new WxMpMessageRouter(
            this.wxMpService);
        // 记录所有事件的日志
        newRouter.rule().handler(this.logHandler).next();
        // 关注事件
        newRouter.rule().async(false).msgType(WxConsts.XmlMsgType.EVENT)
            .event(WxConsts.EventType.SUBSCRIBE).handler(this.subscribeHandler)
                .end();
        // 默认,转发消息给客服人员
        newRouter.rule().async(false).handler(this.msgHandler).end();
        this.router = newRouter;
    }

    /**
     * 路由消息
     *
     * @param inMessage
     * @return
     */
    public WxMpXmlOutMessage route(WxMpXmlMessage inMessage) {
        try {
            return this.router.route(inMessage);
        } catch (Exception e) {
            this.logger.error(e.getMessage(), e);
        }

        return null;
    }

    /**
     * 通过openid获得基本用户信息
     *
     * @param openid
     * @param lang
     * @return
     */
    public WxMpUser getUserInfo(String openid, String lang) {
        WxMpUser wxMpUser = null;
        try {
            wxMpUser = this.wxMpService.getUserService().userInfo(openid, lang);
        } catch (WxErrorException e) {
            this.logger.error(e.getError().toString());
        }
        return wxMpUser;
    }
    
    public String getOpenid(String code) {
        WxMpOAuth2AccessToken accessToken;
        try {
            accessToken = this.wxMpService.oauth2getAccessToken(code);
            return accessToken.getOpenId();
        } catch (WxErrorException e) {
            this.logger.error(e.getError().toString());
        }
        return "";
    }

}
