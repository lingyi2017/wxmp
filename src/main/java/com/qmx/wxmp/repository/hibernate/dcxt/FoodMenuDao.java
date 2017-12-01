package com.qmx.wxmp.repository.hibernate.dcxt;

import com.qmx.wxmp.common.persistence.Parameter;
import com.qmx.wxmp.dto.dcxt.FoodMenuDto;
import org.springframework.stereotype.Repository;

import com.qmx.wxmp.common.persistence.BaseDao;
import com.qmx.wxmp.entity.dcxt.FoodMenu;

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

		String sql = "INSERT INTO dcxt_food_menu(id, create_date, state, del_flag) VALUES(:id, :create_date, :state, :del_flag)";
		Parameter parameter = new Parameter();
		parameter.put("id", foodMenuDto.getId());
		parameter.put("create_date", foodMenuDto.getCreateDate());
		parameter.put("state", FoodMenu.STATE_NEW);
		parameter.put("del_flag", FoodMenu.DEL_FLAG_NORMAL);
		updateBySql(sql, parameter);

	}
}
