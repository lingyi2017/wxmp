package com.qmx.wxmp.entity.dcxt;

import com.qmx.wxmp.common.persistence.BaseSimpleEntity;

import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * 商品评论
 *
 * @author longxy
 * @date 2018-02-07 23:34
 */
@Entity
@Table(name = "dcxt_comment")
public class Comment extends BaseSimpleEntity {

	private static final long	serialVersionUID	= -1525961124491453480L;

	// 星级
	private Integer				starNum;

	// 内容
	private String				content;

	// 图片（多个图片以 ; 分隔）
	private String				image;

	// 商品ID
	private String				productId;



	public Integer getStarNum() {
		return starNum;
	}



	public void setStarNum(Integer starNum) {
		this.starNum = starNum;
	}



	public String getContent() {
		return content;
	}



	public void setContent(String content) {
		this.content = content;
	}



	public String getImage() {
		return image;
	}



	public void setImage(String image) {
		this.image = image;
	}



	public String getProductId() {
		return productId;
	}



	public void setProductId(String productId) {
		this.productId = productId;
	}
}
