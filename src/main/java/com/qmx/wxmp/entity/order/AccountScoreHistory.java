package com.qmx.wxmp.entity.order;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.qmx.wxmp.common.persistence.BaseSimpleEntity;

/**
 * 用户积分历史记录
 * @author itismin
 *
 */
@Entity
@Table(name="dcxt_account_score_history")
public class AccountScoreHistory extends BaseSimpleEntity {

	private static final long serialVersionUID = 1L;
	
	/** 积分来源:支付订单增加*/
	public static final String SCORE_TYPE_ONE = "1";
	/** 积分来源:支付订单扣除*/
	public static final String SCORE_TYPE_TWO = "2";
	/** 积分来源:退款订单增加*/
	public static final String SCORE_TYPE_THREE = "3";
	
	public AccountScoreHistory() {
		super();
	}
	
	private Integer score;
	
	@ManyToOne
	@JoinColumn(name="account_id")
	private Account account;

	public Integer getScore() {
		return score;
	}

	public void setScore(Integer score) {
		this.score = score;
	}

	public Account getAccount() {
		return account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}
	
	
}
