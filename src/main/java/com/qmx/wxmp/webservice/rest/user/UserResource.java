package com.qmx.wxmp.webservice.rest.user;

import java.util.List;

import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.WebApplicationException;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import com.qmx.wxmp.common.mapper.BeanMapper;
import com.qmx.wxmp.entity.sys.Role;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.google.common.collect.Lists;
import com.qmx.wxmp.common.persistence.Page;
import com.qmx.wxmp.common.utils.UserUtils;
import com.qmx.wxmp.controller.BaseController;
import com.qmx.wxmp.dto.user.UserDTO;
import com.qmx.wxmp.entity.sys.Office;
import com.qmx.wxmp.entity.sys.User;
import com.qmx.wxmp.service.sys.SystemService;
import com.qmx.wxmp.webservice.rest.Result;

@Path("/user")
@Component
public class UserResource extends BaseController {
    private static Logger logger = LoggerFactory.getLogger(UserResource.class);

	@Autowired
	private SystemService systemService;

	/**
	 * 根据id取数据，id为GET请求中的查询参数
	 * http://localhost:8080/mserver/rs/user/getById?id=1
	 * 
	 * @return 一条记录
	 */

	@GET
	@Path("/getById")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces("application/json")
	public User getLogById(@QueryParam(value = "id") String id) {

		User user = null;
		try {
			user = systemService.getUser(id);
		} catch (Exception e) {
			throw new WebApplicationException();
		}
		return user;
	}

	/**
	 * 根据loginName来查询数 据库,loginName是否存在
	 * 
	 * @param oldLoginName
	 * @param loginName
	 * @return
	 */
	@GET
	@Path("/checkByLoginName")
	@Produces("application/json")
	public boolean checkLoginName(@QueryParam("loginName") String loginName) {

		if (loginName != null
				&& systemService.getUserByLoginName(loginName) == null) {
			return true;
		}
		logger.debug("loginName: " + loginName);
		return false;
	}

	/**
	 * 根据当前页pageNo查询所有用户
	 * 
	 * @param pageNo
	 * @return
	 */
	@GET
	@Path("/getAlls")
	@Produces(MediaType.APPLICATION_JSON)
	public List<User> getAlls(@QueryParam("pageNo") String pageNo,
			@QueryParam("id") String id) {

	    logger.debug("============");
		Page<User> page = new Page<>();
		
		if (pageNo != null && !"".equals(pageNo)) {
			page.setPageNo(Integer.parseInt(pageNo));
		}
		List<User> list = null;
		try {
			// ==========================================
			User user = systemService.getUserById(id);// 是注入id? 还是注入user?
			if (user == null) {
				// =======================================
				throw new RuntimeException("请传入当前用户id");
			}
			list = systemService.findUser(page, user).getList();
		} catch (Exception e) {
			//e.printStackTrace();
			logger.error(e.getMessage(), e);
		}
		logger.debug("list: " + list);
		return list;
	}

	/**
	 * 根据id删除 指定用户
	 * 
	 * @param id
	 * @return
	 */
	@GET
	@Path("/delete")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public Result<User> deleteUser(@QueryParam(value = "id") String id) {

	    logger.debug("id: " + id);

		if (User.isAdmin(id)) {
			return Result.buildErrorResult("删除用户失败, 不允许删除超级管理员用户");
		} else {
			systemService.deleteUser(id);
			

			return Result.buildSuccessOkResult("删除成功");
		}
	}

	/**
	 * 新建或者修改用户信息
	 * 
	 * @param name
	 * @param loginName
	 *            登陆名;
	 * @param password
	 * @param id
	 *            用户id ,有id就修改,没id就新增
	 * @param officeId
	 *            部门id;
	 * @param companyId
	 *            公司id;
	 * @return
	 */
	@POST
	@Path("/save")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public Response saveUser(UserDTO dto) {
	    logger.debug("==dto: " + dto);

		User user = BeanMapper.map(dto, User.class);
		logger.debug("==user: " + user);
		try {
			if (user == null) {

				String message = "user 是空的";
				throw new RuntimeException(message);

			}
			Office co = new Office();
			co.setId(dto.getCompanyId());
			user.setCompany(co);
			logger.debug("officeId" + dto.getOfficeId());
			Office of = new Office();
			of.setId(dto.getOfficeId());
			user.setOffice(of);
			// 角色数据有效性验证，过滤不在授权内的角色
			List<Role> roleList = Lists.newArrayList();
			List<String> roleIdList = user.getRoleIdList();
			for (Role r : systemService.findAllRole()) {
				if (roleIdList.contains(r.getId())) {
					roleList.add(r);
				}
			}
			user.setRoleList(roleList);// 给当前用户设置角 ???
			// 保存用户信息

			systemService.saveUser(user);
			// 清除当前用户缓存
			if (user.getLoginName().equals(UserUtils.getUser().getLoginName())) {
				UserUtils.getCacheMap().clear();
			}
			return Response.ok().build();
		} catch (WebApplicationException e) {
			// ============================================================
			//e.printStackTrace();
			logger.info(e.getMessage(), e);
			throw new WebApplicationException();
		}
	}

}
