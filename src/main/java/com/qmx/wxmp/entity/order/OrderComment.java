package com.qmx.wxmp.entity.order;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.qmx.wxmp.common.persistence.BaseSimpleEntity;

/**
 * 订单评价
 * @author itismin
 *
 */
@Entity
@Table(name="dcxt_order_comment")
public class OrderComment extends BaseSimpleEntity {

	private static final long serialVersionUID = 1L;
	
	public OrderComment() {
		super();
	}
	/** 评价:好评*/
	public static final String COMMENT_POSITIVE = "1";
	/** 评价:中评*/
	public static final String COMMENT_MODERATE = "2";
	/** 评价:差评*/
	public static final String COMMENT_NEGATIVE = "3";
	
	/** 评价*/
	private String comment;
	/** 评价内容*/
	private String commentMark;
	/** 追加评价内容*/
	private String commentAddMark;
	/** 评价回复*/
	private String commentReply;
	/** 评价时间*/
	private Date commentMarkTime;
	/** 追加评价时间*/
	private Date commentAddMarkTime;
	/** 评价回复时间*/
	private Date commentReplyTime;
	/** 主订单*/
	private OrderMain order;

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getCommentMark() {
		return commentMark;
	}

	public void setCommentMark(String commentMark) {
		this.commentMark = commentMark;
	}

	public String getCommentAddMark() {
		return commentAddMark;
	}

	public void setCommentAddMark(String commentAddMark) {
		this.commentAddMark = commentAddMark;
	}

	public String getCommentReply() {
		return commentReply;
	}

	public void setCommentReply(String commentReply) {
		this.commentReply = commentReply;
	}

	public Date getCommentMarkTime() {
		return commentMarkTime;
	}

	public void setCommentMarkTime(Date commentMarkTime) {
		this.commentMarkTime = commentMarkTime;
	}

	public Date getCommentAddMarkTime() {
		return commentAddMarkTime;
	}

	public void setCommentAddMarkTime(Date commentAddMarkTime) {
		this.commentAddMarkTime = commentAddMarkTime;
	}

	public Date getCommentReplyTime() {
		return commentReplyTime;
	}

	public void setCommentReplyTime(Date commentReplyTime) {
		this.commentReplyTime = commentReplyTime;
	}

	@ManyToOne
	@JoinColumn(name="order_id")
	public OrderMain getOrder() {
		return order;
	}

	public void setOrder(OrderMain order) {
		this.order = order;
	}
	
	
}
