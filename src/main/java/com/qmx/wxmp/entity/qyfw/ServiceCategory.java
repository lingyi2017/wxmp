package com.qmx.wxmp.entity.qyfw;

import java.io.Serializable;
import java.util.List;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;

/**
 * 服务分类信息
 * 
 * @author zsmin
 *
 */
@Entity
@Table(name = "qyfw_service_category")
public class ServiceCategory implements Serializable {

	private static final long	serialVersionUID	= 2993220797738015911L;

	@Id
	@GeneratedValue(generator = "system-uuid")
	@GenericGenerator(name = "system-uuid", strategy = "uuid")
	private String				id;

	/** 父级编号 */
	@ManyToOne
	@JoinColumn(name = "parent_id")
	@NotFound(action = NotFoundAction.IGNORE)
	@NotNull
	private ServiceCategory		parent;

	/** 所有父级编号 */
	private String				parentIds;

	/** 服务分类名称 */
	private String				name;

	/** 是否显示（false：不显示；true：显示） */
	private Boolean				isEnable;

	/** 是否重点显示（false：否；true：是） */
	private Boolean				isImportant;

	/** 排序号 */
	private Integer				sort;

	/** 微信菜单ID */
	private String				wxMenuId;



	public String getId() {
		return id;
	}



	public void setId(String id) {
		this.id = id;
	}



	public ServiceCategory getParent() {
		return parent;
	}



	public void setParent(ServiceCategory parent) {
		this.parent = parent;
	}



	public String getParentIds() {
		return parentIds;
	}



	public void setParentIds(String parentIds) {
		this.parentIds = parentIds;
	}



	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}



	public Boolean getEnable() {
		return isEnable;
	}



	public void setEnable(Boolean enable) {
		isEnable = enable;
	}



	public Boolean getImportant() {
		return isImportant;
	}



	public void setImportant(Boolean important) {
		isImportant = important;
	}



	public Integer getSort() {
		return sort;
	}



	public void setSort(Integer sort) {
		this.sort = sort;
	}



	public String getWxMenuId() {
		return wxMenuId;
	}



	public void setWxMenuId(String wxMenuId) {
		this.wxMenuId = wxMenuId;
	}



	@Transient
	public static void sortList(List<ServiceCategory> list, List<ServiceCategory> sourcelist, String parentId) {
		for (int i = 0; i < sourcelist.size(); i++) {
			ServiceCategory e = sourcelist.get(i);
			if (e.getParent() != null && e.getParent().getId() != null && e.getParent().getId().equals(parentId)) {
				list.add(e);
				// 判断是否还有子节点, 有则继续获取子节点
				for (int j = 0; j < sourcelist.size(); j++) {
					ServiceCategory childe = sourcelist.get(j);
					if (childe.getParent() != null && childe.getParent().getId() != null
							&& childe.getParent().getId().equals(e.getId())) {
						sortList(list, sourcelist, e.getId());
						break;
					}
				}
			}
		}
	}
}
