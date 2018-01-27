package com.qmx.wxmp.webservice.rest.dcxt;

import java.util.List;
import java.util.Map;

import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.common.collect.Lists;
import com.qmx.wxmp.controller.BaseController;
import com.qmx.wxmp.dto.dcxt.DishTdDto;
import com.qmx.wxmp.dto.dcxt.FoodMenuDto;
import com.qmx.wxmp.entity.dcxt.FoodMenu;
import com.qmx.wxmp.entity.dcxt.FoodMenuItem;
import com.qmx.wxmp.service.dcxt.FoodMenuService;
import com.qmx.wxmp.webservice.rest.Result;

/**
 * 菜单 Resource
 *
 * @author longxy
 * @date 2017-12-01 23:26
 */
@Path("/dcxt/foodMenu")
@Component
public class FoodMenuResource extends BaseController {

	@Autowired
	private FoodMenuService foodMenuService;



	@POST
	@Path("/save")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public Result<String> save(FoodMenuDto foodMenuDto) {

		Boolean result = foodMenuService.saveFoodMenu(foodMenuDto);
		if (result) {
			return Result.buildSuccessResult();
		}
		return Result.buildErrorResult();

	}



	@POST
	@Path("/dishes")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public Result<List<DishTdDto>> getDishes(Map<String, String> foodMenuMap) {

		List<DishTdDto> dishTdDtos = Lists.newArrayList();
		FoodMenu foodMenu = foodMenuService.get(foodMenuMap.get("foodMenuId"));
		if (null == foodMenu || StringUtils.isEmpty(foodMenu.getId())) {
			return Result.buildSuccessResult(dishTdDtos);
		}

		List<FoodMenuItem> foodMenuItems = foodMenu.getFoodMenuItems();
		if (!CollectionUtils.isEmpty(foodMenuItems)) {
			for (FoodMenuItem foodMenuItem : foodMenuItems) {
				if (null != foodMenuItem.getProduct() && !StringUtils.isEmpty(foodMenuItem.getProduct().getId())
						&& null != foodMenuItem.getMeal() && !StringUtils.isEmpty(foodMenuItem.getMeal().getId())) {
					String dishesTdId = foodMenuItem.getProduct().getId() + "-" + foodMenuItem.getMeal().getId();
					DishTdDto dishTdDto = new DishTdDto();
					dishTdDto.setDishesTdId(dishesTdId);
					dishTdDto.setDishes(foodMenuItem.getDishes());
					dishTdDtos.add(dishTdDto);
				}
			}
		}
		return Result.buildSuccessResult(dishTdDtos);

	}



	@POST
	@Path("/edit")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public Result<String> edit(FoodMenuDto foodMenuDto) {

		if (null == foodMenuDto || StringUtils.isEmpty(foodMenuDto.getId())) {
			return Result.buildSuccessResult();
		}

		Boolean result = foodMenuService.editFoodMenu(foodMenuDto);
		if (result) {
			return Result.buildSuccessResult();
		}
		return Result.buildErrorResult();

	}



	@POST
	@Path("/isFoodMenuExist")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public Result<Boolean> isFoodMenuExist(Map<String, String> paramMap) {

		String date = paramMap.get("date");
		FoodMenu foodMenu = foodMenuService.findByDate(date);
		if (null == foodMenu) {
			return Result.buildSuccessResult(false);
		}
		return Result.buildSuccessResult(true);

	}
}
