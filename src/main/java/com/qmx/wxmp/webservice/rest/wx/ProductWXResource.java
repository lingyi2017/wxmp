package com.qmx.wxmp.webservice.rest.wx;

import com.qmx.wxmp.common.mapper.BeanMapper;
import com.qmx.wxmp.common.web.MediaTypes;
import com.qmx.wxmp.controller.BaseController;
import com.qmx.wxmp.entity.dcxt.Product;
import com.qmx.wxmp.service.dcxt.ProductService;
import com.qmx.wxmp.vo.dcxt.ProductVo;
import com.qmx.wxmp.webservice.rest.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import java.util.List;

/**
 * 微信端商品 Resource
 *
 * @author longxy
 * @date 2018-01-22 0:09
 */
@Path("/wx/product")
@Component
public class ProductWXResource extends BaseController {

	@Autowired
	private ProductService thisService;



	/**
	 * 商品列表
	 * 
	 * @return
	 */
	@POST
	@Path("/list")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public Result<List<ProductVo>> productList() {

		try {
			List<Product> products = thisService.findAll();
			List<ProductVo> productVos = BeanMapper.mapList(products, ProductVo.class);
			return Result.buildSuccessResult(productVos);
		} catch (Exception e) {
			return Result.buildErrorResult();
		}

	}
}
