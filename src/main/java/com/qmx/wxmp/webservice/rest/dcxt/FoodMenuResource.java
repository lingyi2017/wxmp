package com.qmx.wxmp.webservice.rest.dcxt;

import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import com.qmx.wxmp.webservice.rest.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.qmx.wxmp.controller.BaseController;
import com.qmx.wxmp.dto.dcxt.FoodMenuDto;
import com.qmx.wxmp.service.dcxt.FoodMenuService;

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
	public Result<String> saveUser(FoodMenuDto foodMenuDto) {

		Boolean result = foodMenuService.saveFoodMenu(foodMenuDto);
		if (result) {
			return Result.buildSuccessResult();
		}
		return Result.buildErrorResult();

	}
}
