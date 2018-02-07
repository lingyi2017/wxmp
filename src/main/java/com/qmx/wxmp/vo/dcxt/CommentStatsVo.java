package com.qmx.wxmp.vo.dcxt;

import java.io.Serializable;

/**
 * 评论统计 VO
 *
 * @author longxy
 * @date 2018-02-07 23:59
 */
public class CommentStatsVo implements Serializable {

	private static final long	serialVersionUID	= -493147668355056545L;

	// 平均分
	private Double				avgPoint;

	// 总评论数
	private Integer				total;

	// 好评
	private Integer				good;

	// 中评
	private Integer				common;

	// 差评
	private Integer				negative;



	public Double getAvgPoint() {
		return avgPoint;
	}



	public void setAvgPoint(Double avgPoint) {
		this.avgPoint = avgPoint;
	}



	public Integer getTotal() {
		return total;
	}



	public void setTotal(Integer total) {
		this.total = total;
	}



	public Integer getGood() {
		return good;
	}



	public void setGood(Integer good) {
		this.good = good;
	}



	public Integer getCommon() {
		return common;
	}



	public void setCommon(Integer common) {
		this.common = common;
	}



	public Integer getNegative() {
		return negative;
	}



	public void setNegative(Integer negative) {
		this.negative = negative;
	}
}
