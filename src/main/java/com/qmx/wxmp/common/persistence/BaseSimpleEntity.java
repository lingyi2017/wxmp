package com.qmx.wxmp.common.persistence;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.*;

import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.qmx.wxmp.common.utils.IdGen;
import com.qmx.wxmp.common.utils.StringUtils;
import com.qmx.wxmp.common.utils.UserUtils;
import com.qmx.wxmp.entity.sys.User;

/**
 * 精简基类
 *
 * @author longxy
 * @date 2017-11-16 23:53
 */
@MappedSuperclass
public abstract class BaseSimpleEntity implements Serializable {

	private static final long	serialVersionUID	= 794456192656667387L;

	// 编号
	protected String			id;

	// 创建者
	protected User				createBy;

	// 创建日期
	protected Date				createDate;

	// 删除标记（0：正常；1：删除）
	protected String			delFlag;

	// 备注
	protected String			remarks;



	public BaseSimpleEntity() {
		this.delFlag = DEL_FLAG_NORMAL;
	}



	@PrePersist
	public void prePersist() {
		User user = UserUtils.getUser();
		if (null != user && StringUtils.isNotBlank(user.getId())) {
			this.createBy = user;
		}
		this.id = IdGen.uuid();
		this.createDate = new Date();
	}



	@Id
	public String getId() {
		return id;
	}



	public void setId(String id) {
		this.id = id;
	}



	@JsonIgnore
	@ManyToOne(fetch = FetchType.LAZY)
	@NotFound(action = NotFoundAction.IGNORE)
	public User getCreateBy() {
		return createBy;
	}



	public void setCreateBy(User createBy) {
		this.createBy = createBy;
	}



	@Temporal(TemporalType.TIMESTAMP)
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
	public Date getCreateDate() {
		return createDate;
	}



	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}



	public String getDelFlag() {
		return delFlag;
	}



	public void setDelFlag(String delFlag) {
		this.delFlag = delFlag;
	}



	public String getRemarks() {
		return remarks;
	}



	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	// 正常
	public static final String	DEL_FLAG_NORMAL	= "0";

	// 删除
	public static final String	DEL_FLAG_DELETE	= "1";

	// 新增
	public static final String	STATE_NEW		= "1";

	// 上架
	public static final String	STATE_ACTIVE	= "2";

	// 下架
	public static final String	STATE_LAPSE		= "3";
}
