package com.qmx.wxmp.vo.dcxt;

import java.io.Serializable;

/**
 * 商品 VO
 *
 * @author longxy
 * @date 2018-01-22 0:14
 */
public class ProductVo implements Serializable {

	private static final long	serialVersionUID	= 8272867361217477221L;

	// 编号
	private String				id;

	// 名称
	private String				name;



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
}
