package com.qmx.wxmp.webservice.rest.wx;

import com.qmx.wxmp.controller.BaseController;
import com.qmx.wxmp.vo.dcxt.WeekDayVo;
import com.qmx.wxmp.webservice.rest.Result;
import com.qmx.wxmp.wx.util.WeekDayUtils;
import org.springframework.stereotype.Component;

import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import java.util.List;

/**
 * 微信端菜单 Resource
 *
 * @author longxy
 * @date 2018-01-20 22:04
 */
@Path("/wx/foodMenu")
@Component
public class FoodMenuWXResource extends BaseController {

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

}
