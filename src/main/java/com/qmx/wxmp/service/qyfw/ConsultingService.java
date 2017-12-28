package com.qmx.wxmp.service.qyfw;

import java.util.Date;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.qmx.wxmp.common.persistence.Page;
import com.qmx.wxmp.common.utils.DateUtils;
import com.qmx.wxmp.common.utils.IdGen;
import com.qmx.wxmp.dto.order.QueryOrderDto;
import com.qmx.wxmp.entity.qyfw.Consulting;
import com.qmx.wxmp.entity.qyfw.Material;
import com.qmx.wxmp.repository.hibernate.qyfw.ConsultingDao;
import com.qmx.wxmp.service.BaseService;

/**
 * 咨询管理
 * @author itismin
 *
 */
@Service
@Transactional(readOnly = true)
public class ConsultingService extends BaseService {

	@Resource
	private ConsultingDao consultingDao;
	
	public Consulting get(String id) {
		return consultingDao.get(id);
	}
	
	@Transactional(readOnly = false)
	public void save(Consulting consulting){
		if (StringUtils.isEmpty(consulting.getId())) {
			consulting.setId(IdGen.uuid());
		}
		consultingDao.save(consulting);
	}
	
	@Transactional(readOnly = false)
	public void wxSave(Consulting consulting){
		if (StringUtils.isEmpty(consulting.getId())) {
			consulting.setId(IdGen.uuid());
		}
		consultingDao.save(consulting);
	}
	
	@Transactional(readOnly = false)
	public void delete(String id){
		consultingDao.delById(id);
	}
	
	public Page<Consulting> findByPage(Page<Consulting> page, QueryOrderDto queryDto) {
		DetachedCriteria dc = consultingDao.createDetachedCriteria();
		dc.addOrder(org.hibernate.criterion.Order.desc("time"));
		if (null == queryDto) {
			return consultingDao.find(page, dc);
		}
		if (StringUtils.isNotEmpty(queryDto.getBeginDate()) && StringUtils.isNotEmpty(queryDto.getEndDate())) {
			dc.add(Restrictions.between("time", DateUtils.parseDate(queryDto.getBeginDate() + " 00:00:00"),
					DateUtils.parseDate(queryDto.getEndDate() + " 23:59:59")));
		}
		if (StringUtils.isNotEmpty(queryDto.getContact())) {
			dc.add(Restrictions.like("phone", "%" + queryDto.getContact() + "%"));
		}
		dc.createAlias("basicService", "basicService");
		if (StringUtils.isNotEmpty(queryDto.getServiceName())) {
			dc.add(Restrictions.like("basicService.name", "%" + queryDto.getServiceName() + "%"));
		}
		if (StringUtils.isNotEmpty(queryDto.getStatus())) {
			dc.add(Restrictions.eq("dealStatus", queryDto.getStatus()));
		}
		return consultingDao.find(page, dc);
	}
}
