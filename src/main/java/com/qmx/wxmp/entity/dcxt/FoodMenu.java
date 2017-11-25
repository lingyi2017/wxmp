package com.qmx.wxmp.entity.dcxt;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;

import com.qmx.wxmp.common.persistence.BaseSimpleEntity;

/**
 * 菜单
 *
 * @author longxy
 * @date 2017-11-19 16:22
 */
@Entity(name = "menuDaily")
@Table(name = "dcxt_menu")
public class Menu extends BaseSimpleEntity {

	private static final long serialVersionUID = 3246716469646057898L;



	public Menu() {
		super();
	}

	// 菜单明细
	private List<MenuItem>	menuItems;

	// 状态（1-新增；2-上架；3-下架）
	private String			state;



	@OneToMany(mappedBy = "menu", fetch = FetchType.LAZY)
	@Fetch(FetchMode.SUBSELECT)
	@NotFound(action = NotFoundAction.IGNORE)
	public List<MenuItem> getMenuItems() {
		return menuItems;
	}



	public void setMenuItems(List<MenuItem> menuItems) {
		this.menuItems = menuItems;
	}



	public String getState() {
		return state;
	}



	public void setState(String state) {
		this.state = state;
	}
}
