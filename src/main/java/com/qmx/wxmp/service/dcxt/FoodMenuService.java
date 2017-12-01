package com.qmx.wxmp.service.dcxt;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

import com.qmx.wxmp.common.persistence.Page;
import com.qmx.wxmp.common.utils.IdGen;
import com.qmx.wxmp.dto.dcxt.FoodMenuDto;
import com.qmx.wxmp.dto.dcxt.FoodMenuItemDto;
import com.qmx.wxmp.entity.dcxt.FoodMenu;
import com.qmx.wxmp.repository.hibernate.dcxt.FoodMenuDao;
import com.qmx.wxmp.repository.hibernate.dcxt.FoodMenuItemDao;
import com.qmx.wxmp.service.BaseService;

/**
 * 菜单 Service
 *
 * @author longxy
 * @date 2017-11-25 16:30
 */
@Service
public class FoodMenuService extends BaseService {

	@Autowired
	private FoodMenuDao		thisDao;

	@Autowired
	private FoodMenuItemDao	foodMenuItemDao;



	public FoodMenu get(String id) {
		return thisDao.get(id);
	}



	@Transactional
	public Boolean saveFoodMenu(FoodMenuDto foodMenuDto) {

		try {
			String foodMenuId = IdGen.uuid();
			foodMenuDto.setId(foodMenuId);
			thisDao.saveBySql(foodMenuDto);

			List<FoodMenuItemDto> foodMenuItemDtos = foodMenuDto.getFoodMenuItemDtos();
			if (!CollectionUtils.isEmpty(foodMenuItemDtos)) {
				for (FoodMenuItemDto foodMenuItemDto : foodMenuItemDtos) {
					String foodMenuItemId = IdGen.uuid();
					foodMenuItemDto.setId(foodMenuItemId);
					foodMenuItemDto.setFoodMenuId(foodMenuId);
					foodMenuItemDao.saveBySql(foodMenuItemDto);

					List<String> dishIds = foodMenuItemDto.getDishIds();
					if (!CollectionUtils.isEmpty(dishIds)) {
						for (String dishId : dishIds) {
							foodMenuItemDao.saveFoodMenuItemDish(foodMenuItemId, dishId);
						}
					}
				}
			}
			return true;
		} catch (Exception e) {
			logger.error("==== 保存菜单失败：", e);
			e.printStackTrace();
			return false;
		}

	}



	@Transactional(readOnly = false)
	public void save(FoodMenu entity) {
		thisDao.clear();
		thisDao.save(entity);
	}



	@Transactional(readOnly = false)
	public void delete(String id) {
		thisDao.deleteById(id);
	}



	@Transactional(readOnly = false)
	public void updateState(String id, String state) {
		thisDao.updateState(id, state);
	}



	public Page<FoodMenu> findList(Page<FoodMenu> page, FoodMenu entity) {

		DetachedCriteria dc = thisDao.createDetachedCriteria();

		if (StringUtils.isNotEmpty(entity.getState())) {
			dc.add(Restrictions.eq("state", entity.getState()));
		}

		dc.add(Restrictions.eq("delFlag", FoodMenu.DEL_FLAG_NORMAL));
		if (StringUtils.isBlank(page.getOrderBy())) {
			dc.addOrder(Order.desc("createDate"));
		}
		return thisDao.find(page, dc);

	}
}
