package com.qmx.wxmp.dto.order;

import java.util.List;

/**
 * 用餐查询(一个月)
 * @author itismin
 *
 */
public class MonthEatDTO {

	/** 年份*/
	private String year;
	/** 月份*/
	private String month;
	/** 一个月的每日用餐*/
	private List<DayEatDTO> dayEatDTOs;
	
	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public List<DayEatDTO> getDayEatDTOs() {
		return dayEatDTOs;
	}

	public void setDayEatDTOs(List<DayEatDTO> dayEatDTOs) {
		this.dayEatDTOs = dayEatDTOs;
	}

	public class DayEatDTO{
		/** 产品名称*/
		private String productName;
		/** 分量名称*/
		private String mealName;
		/** 日期(天)*/
		private String day;
		/** 一天的菜品*/
		private List<DishDTO> dishDTOs;
		public String getProductName() {
			return productName;
		}
		public void setProductName(String productName) {
			this.productName = productName;
		}
		public String getMealName() {
			return mealName;
		}
		public void setMealName(String mealName) {
			this.mealName = mealName;
		}
		public List<DishDTO> getDishDTOs() {
			return dishDTOs;
		}
		public void setDishDTOs(List<DishDTO> dishDTOs) {
			this.dishDTOs = dishDTOs;
		}
		public String getDay() {
			return day;
		}
		public void setDay(String day) {
			this.day = day;
		}
		
	}
	
	public class DishDTO{
		/** 菜品类型*/
		private String dishType;
		/** 菜品名称*/
		private String dishName;
		/** 菜品图片*/
		private String dishImage;
		public String getDishType() {
			return dishType;
		}
		public void setDishType(String dishType) {
			this.dishType = dishType;
		}
		public String getDishName() {
			return dishName;
		}
		public void setDishName(String dishName) {
			this.dishName = dishName;
		}
		public String getDishImage() {
			return dishImage;
		}
		public void setDishImage(String dishImage) {
			this.dishImage = dishImage;
		}
		
	}
}
