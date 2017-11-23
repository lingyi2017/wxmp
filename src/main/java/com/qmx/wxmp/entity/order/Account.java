package com.qmx.wxmp.entity.order;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.Table;

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
	
	public Account() {
		super();
	}
	
	/** 微信标识id*/
	public String openid;
	/** 姓名*/
	public String name;
	/** 性别*/
	public String sex;
	/** 年龄*/
	public String age;
	/** 电话*/
	public String phone;
	/** 身高*/
	public String height;
	/** 体重*/
	public String weight;
	/** 意向需求*/
	public String intention;
	/** 是否可用*/
	public String visible;
	
	public String getOpenid() {
		return openid;
	}
	public void setOpenid(String openid) {
		this.openid = openid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	public String getVisible() {
		return visible;
	}
	public void setVisible(String visible) {
		this.visible = visible;
	}
	
}
