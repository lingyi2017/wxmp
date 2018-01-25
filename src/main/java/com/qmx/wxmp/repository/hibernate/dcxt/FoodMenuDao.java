package com.qmx.wxmp.repository.hibernate.dcxt;

import com.qmx.wxmp.common.persistence.Parameter;
import com.qmx.wxmp.dto.dcxt.FoodMenuDto;
import org.springframework.stereotype.Repository;

import com.qmx.wxmp.common.persistence.BaseDao;
import com.qmx.wxmp.entity.dcxt.FoodMenu;
import org.springframework.util.CollectionUtils;

import java.util.Collections;
import java.util.List;

/**
 * 菜单 Dao
 *
 * @author longxy
 * @date 2017-11-25 16:23
 */
@Repository
public class FoodMenuDao extends BaseDao<FoodMenu> {

	public int updateState(String id, String state) {
		return update("update FoodMenu set state=:p1 where id = :p2", new Parameter(state, id));
	}



	public void saveBySql(FoodMenuDto foodMenuDto) {

		String sql = "INSERT INTO dcxt_food_menu(id, add_date, state, del_flag) VALUES(:id, :add_date, :state, :del_flag)";
		Parameter parameter = new Parameter();
		parameter.put("id", foodMenuDto.getId());
		parameter.put("add_date", foodMenuDto.getAddDate());
		parameter.put("state", FoodMenu.STATE_NEW);
		parameter.put("del_flag", FoodMenu.DEL_FLAG_NORMAL);
		updateBySql(sql, parameter);

	}



	public void editBySql(FoodMenuDto foodMenuDto) {

		String sql = "UPDATE dcxt_food_menu SET add_date = :add_date WHERE id = :id";
		Parameter parameter = new Parameter();
		parameter.put("add_date", foodMenuDto.getAddDate());
		parameter.put("id", foodMenuDto.getId());
		updateBySql(sql, parameter);

	}



	public FoodMenu findByDate(String date) {

		String sql = "SELECT * FROM dcxt_food_menu WHERE add_date = :add_date AND state = 2 LIMIT 1";
		Parameter parameter = new Parameter();
		parameter.put("add_date", date);
		List<FoodMenu> foodMenus = findBySql(sql, parameter, FoodMenu.class);
		if (!CollectionUtils.isEmpty(foodMenus)) {
			return foodMenus.get(0);
		}
		return null;

	}
}
