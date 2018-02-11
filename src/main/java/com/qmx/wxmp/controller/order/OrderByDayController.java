package com.qmx.wxmp.controller.order;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qmx.wxmp.common.persistence.Page;
import com.qmx.wxmp.common.utils.DateUtils;
import com.qmx.wxmp.controller.BaseController;
import com.qmx.wxmp.dto.order.AjaxResult;
import com.qmx.wxmp.dto.order.MonthEatDTO;
import com.qmx.wxmp.dto.order.MonthEatDTO.DayEatDTO;
import com.qmx.wxmp.dto.order.MonthEatDTO.DishDTO;
import com.qmx.wxmp.dto.order.OrderQueryDTO;
import com.qmx.wxmp.entity.dcxt.Dish;
import com.qmx.wxmp.entity.order.OrderByDay;
import com.qmx.wxmp.service.order.OrderByDayService;

/**
 * 每日订单controller
 * @author itismin
 *
 */
@Controller
@RequestMapping(value = "/dcxt/orderbyday")
public class OrderByDayController extends BaseController {

	@Autowired
	private OrderByDayService byDayService;

	@ModelAttribute
	public OrderByDay get(@RequestParam(required = false) String id) {
		if (StringUtils.isNotBlank(id)) {
			return byDayService.get(id);
		} else {
			return new OrderByDay();
		}
	}

	@RequiresPermissions("dcxt:orderbyday:view")
	@RequestMapping({ "list", "" })
	public String list(OrderQueryDTO entity, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<OrderByDay> page = byDayService.findList(new Page<OrderByDay>(request, response), entity);
		model.addAttribute("page", page);
		return "/order/orderbydayList";
	}
	
	/**
	 * 今日配送列表
	 * @param entity
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequiresPermissions("dcxt:orderbyday:view")
	@RequestMapping("todayList")
	public String todayList(OrderQueryDTO entity, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<OrderByDay> page = byDayService.findTodayList(new Page<OrderByDay>(request, response), entity);
		model.addAttribute("page", page);
		return "/order/orderbytodayList";
	}

	/**
	 * 每日出餐
	 * @param orderIds
	 * @return
	 */
	@RequestMapping("deliveryByDay")
	@ResponseBody
	public String deliveryByDay(@RequestParam(value = "orderIds[]") String[] orderIds) {
		try {
			byDayService.deliveryByDay(orderIds);
			return "true";
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			e.printStackTrace();
			return "false";
		}
	}
	
	/**
	 * 用餐查询
	 * @param orderIds
	 * @return
	 */
	@RequestMapping("wx_eat_history")
	public String eatHistory(Model model) {
		model.addAttribute("year", DateUtils.getYear());
		model.addAttribute("month", DateUtils.getMonth());
		return "/wx/eat_history";
	}
	
	/**
	 * 用餐查询
	 * @param orderIds
	 * @return
	 */
	@RequestMapping("wx_eat_history_date_data")
	@ResponseBody
	public AjaxResult eatHistoryDateData(String year, String month) {
		AjaxResult result = new AjaxResult();
		MonthEatDTO eatDTO = new MonthEatDTO();
		try{
			List<OrderByDay> list = byDayService.findMonthEatList(year, month, "09f89a7575094781956aa65fe659b810");
			Set<>
			return result;
		} catch(Exception e){
			e.printStackTrace();
			result.setResult(false);
			return result;
		} 
	}
	
	/**
	 * 用餐查询
	 * @param orderIds
	 * @return
	 */
	@RequestMapping("wx_eat_history_data")
	@ResponseBody
	public AjaxResult eatHistoryData(String year, String month) {
		AjaxResult result = new AjaxResult();
		MonthEatDTO eatDTO = new MonthEatDTO();
		try{
			List<OrderByDay> list = byDayService.findMonthEatList(year, month, "09f89a7575094781956aa65fe659b810");
			List<DayEatDTO> dayEatDTOs = new ArrayList<MonthEatDTO.DayEatDTO>();
			for(OrderByDay day : list){
				DayEatDTO dayEatDTO = new MonthEatDTO().new DayEatDTO();
				//dayEatDTO.setProductName(day.getFoodMenuItem().getProduct().getName());
				//dayEatDTO.setMealName(day.getFoodMenuItem().getMeal().getType());
				dayEatDTO.setDay(DateUtils.getDay(day.getDeliveryDate()));
				List<DishDTO> dishDTOs = new ArrayList<MonthEatDTO.DishDTO>();
				/*for(Dish dish : day.getFoodMenuItem().getDishes()){
					DishDTO dishDTO = new MonthEatDTO().new DishDTO();
					dishDTO.setDishName(dish.getName());
					dishDTO.setDishType(dish.getType());
					dishDTO.setDishImage(dish.getImage());
					dishDTOs.add(dishDTO);
				}*/
				dayEatDTO.setDishDTOs(dishDTOs);
				dayEatDTOs.add(dayEatDTO);
			}
			eatDTO.setDayEatDTOs(dayEatDTOs);
			eatDTO.setYear(year);
			eatDTO.setMonth(month);
			result.setResult(true);
			result.setObj(eatDTO);
			return result;
		} catch(Exception e){
			e.printStackTrace();
			result.setResult(false);
			return result;
		} 
	}
}
