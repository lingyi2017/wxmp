package com.qmx.wxmp.webservice.rest.wx;

import java.util.*;

import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;

import com.qmx.wxmp.common.mapper.JsonMapper;
import com.qmx.wxmp.common.utils.StringUtils;
import com.qmx.wxmp.entity.dcxt.FoodMenu;
import com.qmx.wxmp.entity.dcxt.FoodMenuItem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.qmx.wxmp.controller.BaseController;
import com.qmx.wxmp.service.dcxt.FoodMenuService;
import com.qmx.wxmp.vo.dcxt.WeekDayVo;
import com.qmx.wxmp.webservice.rest.Result;
import com.qmx.wxmp.wx.util.WeekDayUtils;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.RequestBody;

/**
 * 微信端菜单 Resource
 *
 * @author longxy
 * @date 2018-01-20 22:04
 */
@Path("/wx/foodMenu")
@Component
public class FoodMenuWXResource extends BaseController {

	@Autowired
	private FoodMenuService thisService;



	/**
	 * 获取每周时间
	 *
	 * @param flag（本周时间-1；下周时间-2）
	 * @return
	 */
	@POST
	@Path("/weekDays/{flag}")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public Result<List<WeekDayVo>> weekDays(@PathParam("flag") String flag) {

		try {
			if ("1".equals(flag)) {
				return Result.buildSuccessResult(WeekDayUtils.getWeekDays());
			} else if ("2".equals(flag)) {
				return Result.buildSuccessResult(WeekDayUtils.getNextWeekDays());
			}
		} catch (Exception e) {
			return Result.buildErrorResult();
		}
		return Result.buildErrorResult();

	}



	/**
	 * 获取菜单详情
	 * 
	 * @param paramMap
	 * @return
	 */
	@POST
	@Path("/detail")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public Result<List<FoodMenuItem>> getFoodMenuDetail(Map<String, String> paramMap) {

		if (CollectionUtils.isEmpty(paramMap)) {
			return Result.buildErrorResult(Result.Status.BLANK_PARAMETER);
		}

		String date = paramMap.get("date");
		String productId = paramMap.get("productId");

		// 1. 获取当天的菜单
		FoodMenu foodMenu = thisService.findByDate(date);

		// 2. 获取对应产品的明细
		if (null == foodMenu) {
			return Result.buildErrorResult(Result.Status.NOT_EXIST_ERROR);
		}
		List<FoodMenuItem> foodMenuItems = foodMenu.getFoodMenuItems();
		if (CollectionUtils.isEmpty(foodMenuItems)) {
			return Result.buildErrorResult(Result.Status.NOT_EXIST_ERROR);
		}
		List<FoodMenuItem> foodMenuItemsProduct = new ArrayList<>();
		for (FoodMenuItem foodMenuItem : foodMenuItems) {
			if (productId.equals(foodMenuItem.getProduct().getId())) {
				foodMenuItemsProduct.add(foodMenuItem);
			}
		}
		Collections.sort(foodMenuItemsProduct, new Comparator<FoodMenuItem>() {
			@Override
			public int compare(FoodMenuItem o1, FoodMenuItem o2) {
				return o1.getMeal().getSort().compareTo(o2.getMeal().getSort());
			}
		});
		return Result.buildSuccessResult(foodMenuItemsProduct);

	}

}
