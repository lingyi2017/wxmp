package com.qmx.wxmp.repository.hibernate.dcxt;

import com.qmx.wxmp.common.persistence.BaseDao;
import com.qmx.wxmp.common.persistence.Parameter;
import com.qmx.wxmp.entity.dcxt.Dish;
import org.springframework.stereotype.Repository;

/**
 * 菜品 Dao
 *
 * @author longxy
 * @date 2017-11-17 23:56
 */
@Repository
public class DishDao extends BaseDao<Dish> {

	public int updateState(String id, String state) {
		return update("update Dish set state=:p1 where id = :p2", new Parameter(state, id));
	}
}
