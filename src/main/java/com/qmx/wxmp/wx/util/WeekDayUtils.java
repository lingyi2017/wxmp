package com.qmx.wxmp.wx.util;

import com.qmx.wxmp.common.utils.DateUtils;
import com.qmx.wxmp.vo.dcxt.WeekDayVo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 处理每周时间工具类
 *
 * @author longxy
 * @date 2018-01-20 22:16
 */
public class WeekDayUtils {

	public static List<WeekDayVo> getWeekDays() {
		List<WeekDayVo> weekDays = new ArrayList<>();
		for (int i = 1; i <= 5; i++) {
			WeekDayVo weekDay = new WeekDayVo();
			weekDay.setChnName(getWeekDayCHNName(i));
			String date = DateUtils.getWeekDate(new Date(), i);
			weekDay.setDate(date);
			weekDay.setNum(DateUtils.getDayNum(date));
			weekDays.add(weekDay);
		}
		return weekDays;
	}



	public static List<WeekDayVo> getNextWeekDays() {

		String nextMonday = DateUtils.getNextMonday(new Date());
		Date nextMondayDate = DateUtils.parseDate(nextMonday);
		List<WeekDayVo> weekDays = new ArrayList<>();
		for (int i = 1; i <= 5; i++) {
			WeekDayVo weekDay = new WeekDayVo();
			weekDay.setChnName(getWeekDayCHNName(i));
			String date = DateUtils.getWeekDate(nextMondayDate, i);
			weekDay.setDate(date);
			weekDay.setNum(DateUtils.getDayNum(date));
			weekDays.add(weekDay);
		}
		return weekDays;
	}



	/**
	 * 一周的第几天（周一为第一天）
	 * 
	 * @param num
	 * @return
	 */
	public static String getWeekDayCHNName(Integer num) {
		switch (num) {
		case 1:
			return "周一";
		case 2:
			return "周二";
		case 3:
			return "周三";
		case 4:
			return "周四";
		case 5:
			return "周五";
		default:
			return "周一";
		}
	}
}
