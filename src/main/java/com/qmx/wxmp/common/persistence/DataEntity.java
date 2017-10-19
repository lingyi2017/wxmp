/**
 * Copyright &copy; 2012-2013 <a href="https://github.com/free lance/infosys">infosys</a> All rights reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 */
package com.qmx.wxmp.common.persistence;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.FetchType;
import javax.persistence.ManyToOne;
import javax.persistence.MappedSuperclass;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;
import org.hibernate.validator.constraints.Length;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.qmx.wxmp.common.utils.DateUtils;
import com.qmx.wxmp.common.utils.UserUtils;
import com.qmx.wxmp.entity.sys.User;


/**
 * 数据Entity类
 * @author free lance
 * @version 2013-05-28
 */
@MappedSuperclass
public abstract class DataEntity<T> extends BaseEntity<T> implements Serializable {

	private static final long serialVersionUID = 1L;

	protected String remarks;	// 备注
	protected User createBy;	// 创建者
	protected Date createDate;// 创建日期
	protected User updateBy;	// 更新者
	protected Date updateDate;// 更新日期
	protected String delFlag; // 删除标记（0：正常；1：删除；2：审核）

	protected Date createDateStart;
	protected Date createDateEnd;
	protected Date updateDateStart;
	protected Date updateDateEnd;
	
	public DataEntity() {
		super();
		this.delFlag = DEL_FLAG_NORMAL;
	}
	
	@PrePersist
	public void prePersist(){
		User user = UserUtils.getUser();
		if (StringUtils.isNotBlank(user.getId())){
			this.updateBy = user;
			this.createBy = user;
		}
		this.updateDate = new Date();
		this.createDate = this.updateDate;
	}
	
	@PreUpdate
	public void preUpdate(){
		User user = UserUtils.getUser();
		if (StringUtils.isNotBlank(user.getId())){
			this.updateBy = user;
		}
		this.updateDate = new Date();
	}
	
	@Length(min=0, max=255)
	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	
	@JsonIgnore
	@ManyToOne(fetch=FetchType.LAZY)
	@NotFound(action = NotFoundAction.IGNORE)
	public User getCreateBy() {
		return createBy;
	}

	public void setCreateBy(User createBy) {
		this.createBy = createBy;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone="GMT+8")
	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	@JsonIgnore
	@ManyToOne(fetch=FetchType.LAZY)
	@NotFound(action = NotFoundAction.IGNORE)
	public User getUpdateBy() {
		return updateBy;
	}

	public void setUpdateBy(User updateBy) {
		this.updateBy = updateBy;
	}

	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone="GMT+8")
	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	@Length(min=1, max=1)
	public String getDelFlag() {
		return delFlag;
	}

	public void setDelFlag(String delFlag) {
		this.delFlag = delFlag;
	}

	@Temporal(TemporalType.DATE)
	@Transient
	@JsonIgnore
	public Date getCreateDateStart() {
		return DateUtils.getDateStart(createDateStart);
	}

	public void setCreateDateStart(Date createDateStart) {
		this.createDateStart = createDateStart;
	}

	@Temporal(TemporalType.DATE)
	@Transient
	@JsonIgnore
	public Date getCreateDateEnd() {
		return DateUtils.getDateEnd(createDateEnd);
	}

	public void setCreateDateEnd(Date createDateEnd) {
		this.createDateEnd = createDateEnd;
	}

	@Temporal(TemporalType.DATE)
	@Transient
	@JsonIgnore
	public Date getUpdateDateStart() {
		return DateUtils.getDateStart(updateDateStart);
	}

	public void setUpdateDateStart(Date updateDateStart) {
		this.updateDateStart = updateDateStart;
	}

	@Temporal(TemporalType.DATE)
	@Transient
	@JsonIgnore
	public Date getUpdateDateEnd() {
		return DateUtils.getDateEnd(updateDateEnd);
	}

	public void setUpdateDateEnd(Date updateDateEnd) {
		this.updateDateEnd = updateDateEnd;
	}
}
