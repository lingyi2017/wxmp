package com.qmx.wxmp.service.qyfw;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.qmx.wxmp.common.utils.UserUtils;
import com.qmx.wxmp.entity.qyfw.ServiceCategory;
import com.qmx.wxmp.repository.hibernate.qyfw.ServiceCategoryDao;
import com.qmx.wxmp.service.BaseService;

/**
 * 服务分类 Service
 *
 * @author longxy
 * @date 2017-10-21 15:47
 */
@Service
@Transactional(readOnly = true)
public class ServiceCategoryService extends BaseService {

	@Autowired
	private ServiceCategoryDao thisDao;



	public ServiceCategory get(String id) {
		return thisDao.get(id);
	}



	public List<ServiceCategory> findAll() {
		return UserUtils.getServiceCategoryList();
	}



	@Transactional(readOnly = false)
	public void save(ServiceCategory serviceCategory) {
		serviceCategory.setParent(this.get(serviceCategory.getParent().getId()));
		String oldParentIds = serviceCategory.getParentIds(); // 获取修改前的parentIds，用于更新子节点的parentIds
		serviceCategory
				.setParentIds(serviceCategory.getParent().getParentIds() + serviceCategory.getParent().getId() + ",");
		thisDao.clear();
		thisDao.save(serviceCategory);

		// 更新子节点 parentIds
		List<ServiceCategory> list = thisDao.findByParentIdsLike("%," + serviceCategory.getId() + ",%");
		for (ServiceCategory e : list) {
			e.setParentIds(e.getParentIds().replace(oldParentIds, serviceCategory.getParentIds()));
		}
		thisDao.save(list);
		UserUtils.removeCache(UserUtils.CACHE_SERVICE_CATEGORY_LIST);
	}



	@Transactional(readOnly = false)
	public void delete(String id) {
		thisDao.deleteById(id, "%," + id + ",%");
		UserUtils.removeCache(UserUtils.CACHE_SERVICE_CATEGORY_LIST);
	}

}
