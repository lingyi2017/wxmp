package com.qmx.wxmp.repository.hibernate.dcxt;

import com.qmx.wxmp.common.persistence.Parameter;
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
}
