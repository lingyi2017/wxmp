package com.qmx.wxmp.repository.hibernate.dcxt;

import com.qmx.wxmp.common.persistence.Parameter;
import org.springframework.stereotype.Repository;

import com.qmx.wxmp.common.persistence.BaseDao;
import com.qmx.wxmp.entity.dcxt.Product;

/**
 * 产品 Dao
 *
 * @author longxy
 * @date 2017-11-23 21:32
 */
@Repository
public class ProductDao extends BaseDao<Product> {

	public int updateState(String id, String state) {
		return update("update Product set state=:p1 where id = :p2", new Parameter(state, id));
	}
}
