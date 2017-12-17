package com.qmx.wxmp.controller.order;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.qmx.wxmp.common.persistence.Page;
import com.qmx.wxmp.controller.BaseController;
import com.qmx.wxmp.entity.order.Account;
import com.qmx.wxmp.service.order.AccountService;

/**
 * 用户
 * @author itismin
 *
 */
@Controller
@RequestMapping(value = "/dcxt/account")
public class AccountController extends BaseController {

	@Autowired
	private AccountService accountService;

	@ModelAttribute
	public Account get(@RequestParam(required = false) String id) {
		if (StringUtils.isNotBlank(id)) {
			return accountService.get(id);
		} else {
			return new Account();
		}
	}

	@RequiresPermissions("dcxt:account:view")
	@RequestMapping({ "list", "" })
	public String list(Account entity, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<Account> page = accountService.findList(new Page<Account>(request, response), entity);
		model.addAttribute("page", page);
		return "/order/accountList";
	}

	@RequiresPermissions("dcxt:account:view")
	@RequestMapping("/form")
	public String form(Account entity, Model model) {

		model.addAttribute("account", entity);
		return "/order/accountForm";
	}

	@RequiresPermissions("dcxt:account:edit")
	@RequestMapping("/save")
	public String save(Account entity, HttpServletRequest request, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, entity)) {
			return form(entity, model);
		}

		try {
			accountService.save(entity);
			addMessage(redirectAttributes, "保存用户'" + entity.getName() + "'成功");

		} catch (Exception e) {
			addMessage(redirectAttributes, "保存用户'" + entity.getName() + "'失败");
			logger.error(e.getMessage(), e);
			e.printStackTrace();
		}
		return "redirect:/dcxt/account/?repage";

	}

	/**
	 * 微信端：个人中心
	 * @param accountId
	 * @return
	 */
	@RequestMapping("/personCenterByWeiXin")
	public String personCenterByWeiXin(String openId, Model model) {
		openId = "123";
		Account account = accountService.findByOpenId(openId);
		if(account == null){
			//调至注册
		}else{
			model.addAttribute("account", account);
		}
		return "/weixin/person_center";
	}
	
	/**
	 * 微信端：个人资料
	 * @param accountId
	 * @return
	 */
	@RequestMapping("/accountEditByWeiXin")
	public String accountEditByWeiXin(String accountId, Model model) {
		Account account = accountService.get(accountId);
		model.addAttribute("account", account);
		return "/weixin/account_edit";
	}
}
