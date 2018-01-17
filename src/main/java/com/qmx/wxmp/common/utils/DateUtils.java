/**
 * Copyright &copy; 2012-2013
 * <a href="https://github.com/free lance/infosys">infosys</a> All rights
 * reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 */
package com.qmx.wxmp.common.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

import org.apache.commons.lang3.time.DateFormatUtils;

/**
 * 日期工具类, 继承org.apache.commons.lang.time.DateUtils类
 * 
 * @author free lance
 * @version 2013-3-15
 */
public class DateUtils extends org.apache.commons.lang3.time.DateUtils {

	private static String[] parsePatterns = { "yyyy-MM-dd", "yyyy-MM-dd HH:mm:ss", "yyyy-MM-dd HH:mm", "yyyy/MM/dd",
			"yyyy/MM/dd HH:mm:ss", "yyyy/MM/dd HH:mm" };



	/**
	 * 得到当前日期字符串 格式（yyyy-MM-dd）
	 */
	public static String getDate() {
		return getDate("yyyy-MM-dd");
	}



	/**
	 * 得到当前日期字符串 格式（yyyy-MM-dd） pattern可以为："yyyy-MM-dd" "HH:mm:ss" "E"
	 */
	public static String getDate(String pattern) {
		return DateFormatUtils.format(new Date(), pattern);
	}



	/**
	 * 得到日期字符串 默认格式（yyyy-MM-dd） pattern可以为："yyyy-MM-dd" "HH:mm:ss" "E"
	 */
	public static String formatDate(Date date, Object... pattern) {
		String formatDate = null;
		if (pattern != null && pattern.length > 0) {
			formatDate = DateFormatUtils.format(date, pattern[0].toString());
		} else {
			formatDate = DateFormatUtils.format(date, "yyyy-MM-dd");
		}
		return formatDate;
	}



	/**
	 * 得到日期时间字符串，转换格式（yyyy-MM-dd HH:mm:ss）
	 */
	public static String formatDateTime(Date date) {
		return formatDate(date, "yyyy-MM-dd HH:mm:ss");
	}



	/**
	 * 得到当前时间字符串 格式（HH:mm:ss）
	 */
	public static String getTime() {
		return formatDate(new Date(), "HH:mm:ss");
	}



	/**
	 * 得到当前日期和时间字符串 格式（yyyy-MM-dd HH:mm:ss）
	 */
	public static String getDateTime() {
		return formatDate(new Date(), "yyyy-MM-dd HH:mm:ss");
	}



	/**
	 * 得到当前年份字符串 格式（yyyy）
	 */
	public static String getYear() {
		return formatDate(new Date(), "yyyy");
	}



	/**
	 * 得到当前月份字符串 格式（MM）
	 */
	public static String getMonth() {
		return formatDate(new Date(), "MM");
	}



	/**
	 * 得到当天字符串 格式（dd）
	 */
	public static String getDay() {
		return formatDate(new Date(), "dd");
	}



	/**
	 * 得到当前星期字符串 格式（E）星期几
	 */
	public static String getWeek() {
		return formatDate(new Date(), "E");
	}



	/**
	 * 日期型字符串转化为日期 格式 { "yyyy-MM-dd", "yyyy-MM-dd HH:mm:ss", "yyyy-MM-dd HH:mm",
	 * "yyyy/MM/dd", "yyyy/MM/dd HH:mm:ss", "yyyy/MM/dd HH:mm" }
	 */
	public static Date parseDate(Object str) {
		if (str == null) {
			return null;
		}
		try {
			return parseDate(str.toString(), parsePatterns);
		} catch (ParseException e) {
			return null;
		}
	}



	/**
	 * 获取过去的天数
	 * 
	 * @param date
	 * @return
	 */
	public static long pastDays(Date date) {
		long t = new Date().getTime() - date.getTime();
		return t / (24 * 60 * 60 * 1000);
	}



	/**
	 * 
	 * 
	 * @param date
	 * @return
	 */
	public static Date getDateStart(Date date) {
		if (date == null) {
			return null;
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try {
			date = sdf.parse(formatDate(date, "yyyy-MM-dd") + " 00:00:00");
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return date;
	}



	/**
	 * 
	 * 
	 * @param date
	 * @return
	 */
	public static Date getDateEnd(Date date) {
		if (date == null) {
			return null;
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try {
			date = sdf.parse(formatDate(date, "yyyy-MM-dd") + " 23:59:59");
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return date;
	}



	/**
	 * 计算两个日期之间相差的天数
	 * 
	 * @param date1
	 * @param date2
	 * @return
	 */
	public static int daysBetween(Date date1, Date date2) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date1);
		long time1 = cal.getTimeInMillis();
		cal.setTime(date2);
		long time2 = cal.getTimeInMillis();
		long between_days = (time2 - time1) / (1000 * 3600 * 24);

		return Integer.parseInt(String.valueOf(between_days));
	}



	/**
	 * 
	 * 将字符串按指定的格式转换为日期类型
	 * 
	 * @param str
	 *            日期字符串
	 * 
	 * @param format
	 *            指定格式
	 * 
	 * @return 格式化后的日期对象
	 */

	public static Date strToDate(String str, String format) {
		SimpleDateFormat dtFormat = null;
		try {

			dtFormat = new SimpleDateFormat(format);
			return dtFormat.parse(str);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}



	/**
	 * 
	 * 将日期格式化为<字符串类型>
	 * 
	 * 
	 * @param dateFormat
	 *            日期格式
	 * 
	 * @return 当前日期<字符串类型>
	 */

	public static String dataToStr(Date date, String dateFormat) {
		SimpleDateFormat sdf = new SimpleDateFormat(dateFormat);
		return sdf.format(date);
	}



	/**
	 * 
	 * 对格式为20080101类型的字符串进行日期格式化
	 * 
	 * @param dateStr
	 *            要格式化的字符串
	 * 
	 * @param formatChar
	 *            连接字符
	 * 
	 * @param dateFormat
	 *            日期格式
	 * 
	 * @return 格式后的日期对象
	 */

	public static Date formatDate(String dateStr, String formatChar, String dateFormat) {
		try {
			dateStr = dateStr.substring(0, 4) + formatChar + dateStr.substring(4, 6) + formatChar
					+ dateStr.substring(6, 8);
			return strToDate(dateStr, dateFormat);

		} catch (Exception e) {
			return null;
		}
	}



	/**
	 * 
	 * 将一个日期转换为指定格式的日期类型
	 * 
	 * @param date
	 *            要转换的日期
	 * @param dateFormat
	 *            日期格式
	 * @return 转换后的日期对象
	 */

	public static Date formatDate2(Date date, String dateFormat) {
		SimpleDateFormat sdf = new SimpleDateFormat(dateFormat);
		return strToDate(sdf.format(date), dateFormat);
	}



	/**
	 * 
	 * 获得某一个月份的第一天
	 * 
	 * @param date
	 * 
	 * @return
	 */
	public static Date getFirstDayByMonth(Date date) {
		GregorianCalendar gc = (GregorianCalendar) Calendar.getInstance();
		gc.setTime(date);
		gc.set(Calendar.DAY_OF_MONTH, 1);

		return formatDate2(gc.getTime(), "yyyy-MM-dd");
	}



	/**
	 * 
	 * 获得某一个月份的最后一天
	 * 
	 * @param date
	 * 
	 * @return
	 */
	public static Date getLastDayByMonth(Date date) {

		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.set(Calendar.DATE, 1);// 设为当前月的1号
		cal.add(Calendar.MONTH, 1);// 加一个月，变为下月的1号
		cal.add(Calendar.DATE, -1);// 减去一天，变为当月最后一天

		return formatDate2(cal.getTime(), "yyyy-MM-dd");
	}



	/**
	 * 日期加减天数
	 * 
	 * @param date
	 * @param days
	 * @return
	 */
	public static Date getDayByAdd(Date date, int days) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.add(Calendar.DATE, days);
		return formatDate2(cal.getTime(), "yyyy-MM-dd");
	}



	/**
	 * 获取指定日期的下周一
	 *
	 * @param date
	 *            指定日期
	 * @return
	 */
	public static String getNextMonday(Date date) {

		// 1. 获得当前日期与本周日相差的天数
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		// 获得今天是一周的第几天，星期一是第一天，星期二是第二天...
		int dayOfWeek = calendar.get(Calendar.DAY_OF_WEEK) - 1; // 因为按中国礼拜一作为第一天所以减一
		if (dayOfWeek == 0) { // 周日为第七天
			dayOfWeek = 7;
		}

		// 2. 获取下周星期一的日期
		calendar.add(GregorianCalendar.DATE, 7 - dayOfWeek + 1);
		Date monday = calendar.getTime();
		return formatDate(monday);
	}



	/**
	 * @param args
	 * @throws ParseException
	 */
	public static void main(String[] args) throws ParseException {

		System.out.println(formatDate(parseDate("2010/3/6")));
		System.out.println(getDate("yyyy年MM月dd日 E"));
		long time = new Date().getTime() - parseDate("2012-11-19").getTime();
		System.out.println(time / (24 * 60 * 60 * 1000));

		Date date = new Date();

		System.out.println("pastDays=" + pastDays(date));
		System.out.println("getDateStart=" + formatDate(getDateStart(date), parsePatterns[1]));
		System.out.println("getDateEnd=" + formatDate(getDateEnd(date), parsePatterns[1]));

	}
}
