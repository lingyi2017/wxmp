package com.qmx.wxmp.entity.order;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.qmx.wxmp.common.persistence.BaseSimpleEntity;

/**
 * 用户
 * @author itismin
 *
 */
@Entity
@Table(name="dcxt_account")
public class Account extends BaseSimpleEntity {

	private static final long serialVersionUID = 1L;
	/** 用户状态:正常*/
	public static final String ACCOUNT_STATUS_NORMAL = "1";
	/** 用户状态:冻结*/
	public static final String ACCOUNT_STATUS_FREEZE = "0";
	
	public Account() {
		super();
	}
	
	/** 微信标识id*/
	private String openid;
	/** 用户名*/
	private String name;
	/** 昵称*/
	private String nickName;
	/** 性别*/
	private String sex;
	/** 年龄*/
	private String age;
	/** 电话*/
	private String phone;
	/** 身高*/
	private String height;
	/** 体重*/
	private String weight;
	/** 意向需求*/
	private String intention;
	/** 积分*/
	private Integer score;
	/** 用户状态*/
	private String status;
	/** 用户关注时间*/
	private Date subscribeTime;
	/** 备注*/
	private String mark;
	/** 图片*/
	private String imageBase64;

	public String getOpenid() {
		return openid;
	}
	public void setOpenid(String openid) {
		this.openid = openid;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getHeight() {
		return height;
	}
	public void setHeight(String height) {
		this.height = height;
	}
	public String getWeight() {
		return weight;
	}
	public void setWeight(String weight) {
		this.weight = weight;
	}
	public String getIntention() {
		return intention;
	}
	public void setIntention(String intention) {
		this.intention = intention;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getMark() {
		return mark;
	}
	public void setMark(String mark) {
		this.mark = mark;
	}
	public Integer getScore() {
		return score;
	}
	public void setScore(Integer score) {
		this.score = score;
	}
	@Column(name="nick_name")
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	@Column(name="subscribe_time")
	@Temporal(TemporalType.TIMESTAMP)
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
	public Date getSubscribeTime() {
		return subscribeTime;
	}
	public void setSubscribeTime(Date subscribeTime) {
		this.subscribeTime = subscribeTime;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Column(columnDefinition="text")
	public String getImageBase64() {
		return imageBase64;
	}
	public void setImageBase64(String imageBase64) {
		this.imageBase64 = imageBase64;
	}
	
	
}
