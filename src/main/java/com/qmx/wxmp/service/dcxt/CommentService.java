package com.qmx.wxmp.service.dcxt;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.qmx.wxmp.entity.dcxt.Comment;
import com.qmx.wxmp.repository.hibernate.dcxt.CommentDao;
import com.qmx.wxmp.service.BaseService;

/**
 * 商品评价 Service
 *
 * @author longxy
 * @date 2018-02-08 0:09
 */
@Service
@Transactional(readOnly = true)
public class CommentService extends BaseService {

	@Autowired
	private CommentDao thisDao;



	public Comment get(String id) {
		return thisDao.get(id);
	}



	@Transactional(readOnly = false)
	public void save(Comment entity) {
		thisDao.clear();
		thisDao.save(entity);
	}
}
