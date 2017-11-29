package com.qmx.wxmp.dto.dcxt;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * 菜单 DTO
 *
 * @author longxy
 * @date 2017-11-29 23:46
 */
public class FoodMenuDto implements Serializable {

	private static final long		serialVersionUID	= 8823844414564503677L;

	// 编号
	protected String				id;

	// 创建日期
	protected Date					createDate;

	// 菜单明细
	private List<FoodMenuItemDto>	foodMenuItemDtos;



	public String getId() {
		return id;
	}



	public void setId(String id) {
		this.id = id;
	}



	public Date getCreateDate() {
		return createDate;
	}



	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}



	public List<FoodMenuItemDto> getFoodMenuItemDtos() {
		return foodMenuItemDtos;
	}



	public void setFoodMenuItemDtos(List<FoodMenuItemDto> foodMenuItemDtos) {
		this.foodMenuItemDtos = foodMenuItemDtos;
	}
}
