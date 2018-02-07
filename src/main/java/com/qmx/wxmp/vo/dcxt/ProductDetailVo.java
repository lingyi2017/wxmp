package com.qmx.wxmp.vo.dcxt;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.List;

/**
 * 商品详情 VO
 *
 * @author longxy
 * @date 2018-02-07 23:15
 */
public class ProductDetailVo implements Serializable {

	private static final long	serialVersionUID	= 2043481504660313385L;

	// 编号
	private String				id;

	// 名称
	private String				name;

	// 图片
	private List<String>		images;

	// 价格
	private BigDecimal			price;

	// 购买获得积分
	private Integer				gainIntegral;

	// 兑换需要积分
	private Integer				exchangeIntegral;

	// 月销量
	private Integer				sales;

	// 描述（详情）
	private String				description;



	public String getId() {
		return id;
	}



	public void setId(String id) {
		this.id = id;
	}



	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}



	public List<String> getImages() {
		return images;
	}



	public void setImages(List<String> images) {
		this.images = images;
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



	public Integer getSales() {
		return sales;
	}



	public void setSales(Integer sales) {
		this.sales = sales;
	}



	public String getDescription() {
		return description;
	}



	public void setDescription(String description) {
		this.description = description;
	}
}
