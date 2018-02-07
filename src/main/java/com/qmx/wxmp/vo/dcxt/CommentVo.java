package com.qmx.wxmp.vo.dcxt;

import java.io.Serializable;
import java.util.List;

/**
 * 商品评价 VO
 *
 * @author longxy
 * @date 2018-02-07 23:54
 */
public class CommentVo implements Serializable {

	private static final long	serialVersionUID	= 3816073054038978141L;

	// 用户昵称
	private String				nickName;

	// 微信图片
	private String				imageWxUrl;

	// 内容
	private String				content;

	// 图片
	private List<String>		images;

	// 评价时间
	private String				createDate;



	public String getNickName() {
		return nickName;
	}



	public void setNickName(String nickName) {
		this.nickName = nickName;
	}



	public String getImageWxUrl() {
		return imageWxUrl;
	}



	public void setImageWxUrl(String imageWxUrl) {
		this.imageWxUrl = imageWxUrl;
	}



	public String getContent() {
		return content;
	}



	public void setContent(String content) {
		this.content = content;
	}



	public List<String> getImages() {
		return images;
	}



	public void setImages(List<String> images) {
		this.images = images;
	}



	public String getCreateDate() {
		return createDate;
	}



	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
}
