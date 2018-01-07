package com.qmx.wxmp.service.qyfw;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.qmx.wxmp.common.persistence.Page;
import com.qmx.wxmp.common.utils.IdGen;
import com.qmx.wxmp.common.utils.StringUtils;
import com.qmx.wxmp.entity.qyfw.BasicService;
import com.qmx.wxmp.repository.hibernate.qyfw.BasicServiceDao;
import com.qmx.wxmp.service.BaseService;

/**
 * 基础服务管理
 * @author itismin
 *
 */
@Service
@Transactional(readOnly = true)
public class BasicServiceService extends BaseService {

	@Resource
	private BasicServiceDao basicServiceDao;
	
	public BasicService get(String id) {
		return basicServiceDao.get(id);
	}
	
	@Transactional(readOnly = false)
	public void save(BasicService basicService){
		if(StringUtils.isEmpty(basicService.getId())){
			basicService.setId(IdGen.uuid());
		}
		if(basicService.getPeopleMaterialList() != null){
			String peopleMaterialIds = "";
			for(int i = 0; i < basicService.getPeopleMaterialList().size(); i++){
				if(i == basicService.getPeopleMaterialList().size() - 1){
					peopleMaterialIds += basicService.getPeopleMaterialList().get(i);
				}else{
					peopleMaterialIds += basicService.getPeopleMaterialList().get(i) + ",";
				}
			}
			basicService.setPeopleMaterialIds(peopleMaterialIds);
		}
		if(basicService.getCompanyMaterialList() != null){
			String companyMaterialIds = "";
			for(int i = 0; i < basicService.getCompanyMaterialList().size(); i++){
				if(i == basicService.getCompanyMaterialList().size() - 1){
					companyMaterialIds += basicService.getCompanyMaterialList().get(i);
				}else{
					companyMaterialIds += basicService.getCompanyMaterialList().get(i) + ",";
				}
			}
			basicService.setCompanyMaterialIds(companyMaterialIds);
		}
		basicServiceDao.save(basicService);
	}
	
	@Transactional(readOnly = false)
	public void delete(String id){
		basicServiceDao.delById(id);
	}
	
	public Page<BasicService> findByPage(Page<BasicService> page, BasicService basicService) {
		DetachedCriteria dc = basicServiceDao.createDetachedCriteria();
		if (StringUtils.isNotEmpty(basicService.getCustomerType())) {
			dc.add(Restrictions.eq("customerType", basicService.getCustomerType()));
		}
		if (StringUtils.isNotEmpty(basicService.getName())) {
			dc.add(Restrictions.like("name", "%" + basicService.getName() + "%"));
		}
		if (basicService.getServiceCategory() != null && StringUtils.isNotEmpty(basicService.getServiceCategory().getName())) {
			dc.createAlias("serviceCategory", "serviceCategory");
			dc.add(Restrictions.like("serviceCategory.name", "%" + basicService.getServiceCategory().getName() + "%"));
		}
		dc.addOrder(Order.asc("sort"));
		return basicServiceDao.find(page, dc);
	}
	
	public List<BasicService> findByServiceCategoryId(String serviceCategoryId){
		return basicServiceDao.findByServiceCategoryId(serviceCategoryId);
	}
	
	public Integer getMaxSort(){
		return basicServiceDao.getMaxSort();
	}
}
