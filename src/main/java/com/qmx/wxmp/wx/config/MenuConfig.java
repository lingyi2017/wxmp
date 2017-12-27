package com.qmx.wxmp.wx.config;

import me.chanjar.weixin.common.api.WxConsts.MenuButtonType;
import me.chanjar.weixin.common.bean.menu.WxMenu;
import me.chanjar.weixin.common.bean.menu.WxMenuButton;
import me.chanjar.weixin.common.exception.WxErrorException;
import me.chanjar.weixin.mp.api.WxMpConfigStorage;
import me.chanjar.weixin.mp.api.WxMpInMemoryConfigStorage;
import me.chanjar.weixin.mp.api.WxMpService;
import me.chanjar.weixin.mp.api.impl.WxMpServiceImpl;

/**
 * Created by FirenzesEagle on 2016/6/1 0001.
 * Email:liumingbo2008@gmail.com
 */
public class MenuConfig {

	/**
	 * 定义菜单结构
	 *
	 * @return
	 */
	protected static WxMenu getMenu() {

		MainConfig mainConfig = new MainConfig("wxa1dda5439feefd36", "e0c53f4007c6bd2cb7299bf0fcf48a58", "wjdcxt", "");
		WxMpService wxMpService = mainConfig.wxMpService();

		WxMenu menu = new WxMenu();
		WxMenuButton button1 = new WxMenuButton();
		button1.setName("企业服务");
		
		WxMenuButton button11 = new WxMenuButton();
		button11.setType(MenuButtonType.VIEW);
		button11.setName("开办公司");
		button11.setUrl(wxMpService.oauth2buildAuthorizationUrl("http://1u9288562a.imwork.net/wxmp/wx/oauth/oauth_notify_base?page=/wx/service_list", "snsapi_base", "kbgs"));

		button1.getSubButtons().add(button11);
		
		WxMenuButton button2 = new WxMenuButton();
		button2.setName("企业服务2");

		WxMenuButton button21 = new WxMenuButton();
		button21.setType(MenuButtonType.VIEW);
		button21.setName("开办公司");
		button21.setUrl(wxMpService.oauth2buildAuthorizationUrl("http://1u9288562a.imwork.net/wxmp/wx/oauth/oauth_notify_base?page=/wx/service_list", "snsapi_base", "kbgs"));

		button2.getSubButtons().add(button21);

		WxMenuButton button3 = new WxMenuButton();
		button3.setName("个人中心");

		WxMenuButton button31 = new WxMenuButton();
		button31.setType(MenuButtonType.VIEW);
		button31.setName("我的咨询");
		button31.setUrl(wxMpService.oauth2buildAuthorizationUrl("http://1u9288562a.imwork.net/wxmp/wx/oauth/oauth_notify_base?page=/wx/service_list", "snsapi_base", "kbgs"));

		WxMenuButton button32 = new WxMenuButton();
		button32.setType(MenuButtonType.VIEW);
		button32.setName("我的购买");
		button32.setUrl(wxMpService.oauth2buildAuthorizationUrl("http://1u9288562a.imwork.net/wxmp/wx/oauth/oauth_notify_base?page=/wx/service_list", "snsapi_base", "kbgs"));
		
		button3.getSubButtons().add(button31);
		button3.getSubButtons().add(button32);
		
		menu.getButtons().add(button1);
		menu.getButtons().add(button2);
		menu.getButtons().add(button3);

		return menu;
	}


	public static class MainConfig {

		private String appId;
		private String appSecret;
		private String token;
		private String aesKey;

		/**
		 * 为了生成自定义菜单使用的构造函数
		 *
		 * @param appId
		 * @param appSecret
		 * @param token
		 * @param aesKey
		 */
		protected MainConfig(String appId, String appSecret, String token, String aesKey) {
			this.appId = appId;
			this.appSecret = appSecret;
			this.token = token;
			this.aesKey = aesKey;
		}

		public WxMpConfigStorage wxMpConfigStorage() {
			WxMpInMemoryConfigStorage configStorage = new WxMpInMemoryConfigStorage();
			configStorage.setAppId(this.appId);
			configStorage.setSecret(this.appSecret);
			configStorage.setToken(this.token);
			configStorage.setAesKey(this.aesKey);
			return configStorage;
		}

		public WxMpService wxMpService() {
			WxMpService wxMpService = new WxMpServiceImpl();
			wxMpService.setWxMpConfigStorage(wxMpConfigStorage());
			return wxMpService;
		}

	}

	/**
	 * 运行此main函数即可生成公众号自定义菜单
	 *
	 * @param args
	 */
	public static void main(String[] args) {
		MainConfig mainConfig = new MainConfig("wxa1dda5439feefd36", "e0c53f4007c6bd2cb7299bf0fcf48a58", "wjdcxt", "mFaxY8bRcuBS80YUWM9KM7j6ls04lotEQ98lAus3uZw");
		WxMpService wxMpService = mainConfig.wxMpService();
		try {
			wxMpService.getMenuService().menuCreate(getMenu());
		} catch (WxErrorException e) {
			e.printStackTrace();
		}
	}

	public static WxMenu testMenu(){
		MainConfig mainConfig = new MainConfig("wxa1dda5439feefd36", "e0c53f4007c6bd2cb7299bf0fcf48a58", "wjdcxt", "");
		WxMpService wxMpService = mainConfig.wxMpService();

		WxMenu menu = new WxMenu();
		WxMenuButton button1 = new WxMenuButton();
		button1.setType(MenuButtonType.VIEW);
		button1.setName("测试获取openid");
		button1.setUrl("http://1u9288562a.imwork.net/wxmp/wx/page/person_center");
		WxMenuButton button2 = new WxMenuButton();
		button2.setType(MenuButtonType.VIEW);
		button2.setName("测试支付");
		button2.setUrl(wxMpService.oauth2buildAuthorizationUrl("http://1u9288562a.imwork.net/wxmp/wx/oauth/oauth_notify_base", "snsapi_base", "/wx/order_test"));
		menu.getButtons().add(button1);
		menu.getButtons().add(button2);
		return menu;
	}
}
