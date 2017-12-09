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

	// 新增日期
	protected String				addDate;

	// 菜单明细
	private List<FoodMenuItemDto>	foodMenuItemDtos;



	public String getId() {
		return id;
	}



	public void setId(String id) {
		this.id = id;
	}



	public String getAddDate() {
		return addDate;
	}



	public void setAddDate(String addDate) {
		this.addDate = addDate;
	}



	public List<FoodMenuItemDto> getFoodMenuItemDtos() {
		return foodMenuItemDtos;
	}



	public void setFoodMenuItemDtos(List<FoodMenuItemDto> foodMenuItemDtos) {
		this.foodMenuItemDtos = foodMenuItemDtos;
	}
}
