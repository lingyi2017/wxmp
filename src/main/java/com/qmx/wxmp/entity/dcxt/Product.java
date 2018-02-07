package com.qmx.wxmp.entity.dcxt;

import java.util.List;

import javax.persistence.*;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;

import com.qmx.wxmp.common.persistence.BaseSimpleEntity;

/**
 * 产品
 *
 * @author longxy
 * @date 2017-11-19 15:47
 */
@Entity
@Table(name = "dcxt_product")
public class Product extends BaseSimpleEntity {

	private static final long	serialVersionUID	= -6472534784001750733L;

	// 名称
	private String				name;

	// 图片（多个图片以 ; 分隔）
	private String				image;

	// 封面图片
	private String				mainImage;

	// 描述
	private String				description;

	// 状态（1-下架；2-上架）
	private String				state;

	// 排序（ASC）
	private Integer				sort;

	// 份量列表
	private List<Combo>			combos;



	public Product() {
		super();
	}



	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}



	public String getImage() {
		return image;
	}



	public void setImage(String image) {
		this.image = image;
	}



	public String getMainImage() {
		return mainImage;
	}



	public void setMainImage(String mainImage) {
		this.mainImage = mainImage;
	}



	public String getDescription() {
		return description;
	}



	public void setDescription(String description) {
		this.description = description;
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



	@OneToMany(mappedBy = "product", fetch = FetchType.LAZY)
	@OrderBy("price desc")
	@Fetch(FetchMode.SUBSELECT)
	@NotFound(action = NotFoundAction.IGNORE)
	public List<Combo> getCombos() {
		return combos;
	}



	public void setCombos(List<Combo> combos) {
		this.combos = combos;
	}
}
