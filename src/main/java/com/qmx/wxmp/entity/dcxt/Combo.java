package com.qmx.wxmp.entity.dcxt;

import java.math.BigDecimal;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.qmx.wxmp.common.persistence.BaseSimpleEntity;

/**
 * 份量（套餐）
 *
 * @author longxy
 * @date 2017-11-19 15:58
 */
@Entity
@Table(name = "dcxt_combo")
public class Combo extends BaseSimpleEntity {

	private static final long serialVersionUID = -2082879255124312916L;



	public Combo() {
		super();
	}

	// 名称
	private String		name;

	// 价格
	private BigDecimal	price;

	// 购买获得积分
	private Integer		gainIntegral;

	// 兑换需要积分
	private Integer		exchangeIntegral;

	// 适用人群
	private String		applicablePeople;

	// 状态（1-下架；2-上架）
	private String		state;

	// 排序（ASC）
	private Integer		sort;

	// 所属产品
	private Product		product;



	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}



	public BigDecimal getPrice() {
		return price;
	}



	public void setPrice(BigDecimal price) {
		this.price = price;
	}



	public Integer getGainIntegral() {
		return gainIntegral;
	}



	public void setGainIntegral(Integer gainIntegral) {
		this.gainIntegral = gainIntegral;
	}



	public Integer getExchangeIntegral() {
		return exchangeIntegral;
	}



	public void setExchangeIntegral(Integer exchangeIntegral) {
		this.exchangeIntegral = exchangeIntegral;
	}



	public String getApplicablePeople() {
		return applicablePeople;
	}



	public void setApplicablePeople(String applicablePeople) {
		this.applicablePeople = applicablePeople;
	}



	public String getState() {
		return state;
	}



	public void setState(String state) {
		this.state = state;
	}



	public Integer getSort() {
		return sort;
	}



	public void setSort(Integer sort) {
		this.sort = sort;
	}



	@ManyToOne
	@JoinColumn(name = "product_id")
	@NotFound(action = NotFoundAction.IGNORE)
	@JsonIgnore
	@NotNull(message = "所属产品不能为空")
	public Product getProduct() {
		return product;
	}



	public void setProduct(Product product) {
		this.product = product;
	}
}
