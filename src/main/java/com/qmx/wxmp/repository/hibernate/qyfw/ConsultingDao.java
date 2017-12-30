package com.qmx.wxmp.repository.hibernate.qyfw;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.qmx.wxmp.common.persistence.BaseDao;
import com.qmx.wxmp.common.persistence.Parameter;
import com.qmx.wxmp.entity.qyfw.Consulting;

@Repository
public class ConsultingDao extends BaseDao<Consulting> {

	public List<Consulting> findByOpenid(String openid) {
		return find("from Consulting where openid =:p1 order by time desc", new Parameter(openid));
	}
}
