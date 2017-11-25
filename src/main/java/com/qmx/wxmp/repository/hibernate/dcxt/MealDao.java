package com.qmx.wxmp.repository.hibernate.dcxt;

import org.springframework.stereotype.Repository;

import com.qmx.wxmp.common.persistence.BaseDao;
import com.qmx.wxmp.common.persistence.Parameter;
import com.qmx.wxmp.entity.dcxt.Meal;

/**
 * 餐标 Dao
 *
 * @author longxy
 * @date 2017-11-21 22:57
 */
@Repository
public class MealDao extends BaseDao<Meal> {

	public int updateState(String id, String state) {
		return update("update Meal set state=:p1 where id = :p2", new Parameter(state, id));
	}
}
