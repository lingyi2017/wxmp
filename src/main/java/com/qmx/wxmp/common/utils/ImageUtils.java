package com.qmx.wxmp.common.utils;

/**
 * 图片工具类
 *
 * @author longxy
 * @date 2017-11-20 23:48
 */
public class ImageUtils {

	public static String getUrl(String urls) {

		if (StringUtils.isEmpty(urls)) {
			return null;
		}
		String[] urlArray = urls.split(";");
		if (urlArray.length < 1) {
			return null;
		}
		return urlArray[0];
	}
}
