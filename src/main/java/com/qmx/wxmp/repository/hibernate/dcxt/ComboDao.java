package com.qmx.wxmp.repository.hibernate.dcxt;

import com.qmx.wxmp.common.persistence.Parameter;
import org.springframework.stereotype.Repository;

import com.qmx.wxmp.common.persistence.BaseDao;
import com.qmx.wxmp.entity.dcxt.Combo;

/**
 * 份量Dao
 *
 * @author longxy
 * @date 2017-11-23 22:04
 */
@Repository
public class ComboDao extends BaseDao<Combo> {

	public int updateState(String id, String state) {
		return update("update Combo set state=:p1 where id = :p2", new Parameter(state, id));
	}
}
