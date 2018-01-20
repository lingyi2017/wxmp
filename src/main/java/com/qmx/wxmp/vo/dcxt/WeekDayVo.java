package com.qmx.wxmp.vo.dcxt;

import java.io.Serializable;

/**
 * 每周的某一天
 *
 * @author longxy
 * @date 2018-01-20 22:11
 */
public class WeekDayVo implements Serializable {

	private static final long	serialVersionUID	= -2723798046235250016L;

	// 中文名称（如：周一）
	private String				chnName;

	// 号数（18）
	private Integer				num;

	// 时间（yyyy-MM-dd）
	private String				date;



	public String getChnName() {
		return chnName;
	}



	public void setChnName(String chnName) {
		this.chnName = chnName;
	}



	public Integer getNum() {
		return num;
	}



	public void setNum(Integer num) {
		this.num = num;
	}



	public String getDate() {
		return date;
	}



	public void setDate(String date) {
		this.date = date;
	}
}
