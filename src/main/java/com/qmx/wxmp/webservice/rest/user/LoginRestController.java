package com.qmx.wxmp.webservice.rest.user;
import javax.inject.Singleton;
import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.core.MediaType;

import com.qmx.wxmp.common.mapper.BeanMapper;
import com.qmx.wxmp.common.mapper.JsonMapper;
import com.qmx.wxmp.common.utils.UserUtils;
import com.qmx.wxmp.dto.user.UserDTO;
import com.qmx.wxmp.webservice.rest.Result;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.qmx.wxmp.entity.sys.User;
import com.qmx.wxmp.service.sys.SystemService;


/**
 *  用户登陆的Restful Controller
 * @author longxy
 *
 */
@Path("/app/user")
@Singleton
@Component
public class LoginRestController {
    private static Logger logger = LoggerFactory.getLogger(LoginRestController.class);
	
	@Autowired
	private SystemService systemService;
	
	/**
	 *  <p>POST方式登录(传userDTO对象)</p>
	 *  
	 * @param userDTO
	 * @return
	 */
	@POST
	@Path("/login")
	@Consumes({MediaType.APPLICATION_JSON})
	public String login(UserDTO userDTO){
		User user = UserUtils.getUser();
		
		JsonMapper jm = new JsonMapper();
		if(user == null){
			return jm.toJson(Result.buildErrorResult(Result.Status.ERROR, "用户名或密码错误！"));
		}
		
		// 使用Dozer转换DTO类，并补充Dozer不能自动绑定的属性
		UserDTO dto = BeanMapper.map(user, UserDTO.class);
		dto.setCompanyId("1");
		dto.setOfficeId("1");
		logger.debug("----服务端测试 Success---" + user.getName());
		return jm.toJson(Result.buildResult(Result.Status.OK, dto));
	}
	
	/**
	 *  <p>GET方式登录</p>
	 *  
	 * @param username
	 * @param password
	 * @return 
	 */
	/*@GET
	@Path("/login")
	@Consumes({ MediaType.APPLICATION_JSON})
	public String login(@QueryParam("username") String username, @QueryParam("password") String password){
		System.out.println("------GET方式成功访问服务端------" + username + "----" + password);
		return username;
	}*/

	/**
	 * <p>POST方式登录(传字符串)</p>
	 * 
	 * @param username
	 * @return
	 */
	/*@POST
	@Path("/login")
	@Consumes({ MediaType.APPLICATION_JSON})
	public String login(String username, String password){
		System.out.println("------POST方式成功访问服务端------" + username);
		System.out.println("------POST方式成功访问服务端------" + password);
		return username;
	}*/
	
	/*@POST
	@Path("/login")
	@Consumes(MediaType.APPLICATION_JSON)
	public UserDTO findUserById(String id){
		System.out.println("------POST方式成功访问服务端------" + id);
		User user = systemService.getUserById(id);
		
		if(user == null){
			String message = "用户不存在(id:" + id + ")";
			throw new RestException(HttpStatus.NOT_FOUND, message);
		}
		
		// 使用Dozer转换DTO类，并补充Dozer不能自动绑定的属性
		UserDTO dto = BeanMapper.map(user, UserDTO.class);
		dto.setCompanyId("1");
		dto.setOfficeId("1");
		dto.setRoleList(null);
		System.out.println("----转换成功-----" + dto.getName());
		return dto;
	}*/
}
