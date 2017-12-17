package com.qmx.wxmp.controller.order;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qmx.wxmp.common.persistence.Page;
import com.qmx.wxmp.controller.BaseController;
import com.qmx.wxmp.entity.order.AccountScoreHistory;
import com.qmx.wxmp.entity.order.OrderMain;
import com.qmx.wxmp.service.order.AccountScoreHistoryService;

/**
 * 积分历史controller
 * @author itismin
 *
 */
@Controller
@RequestMapping(value = "/dcxt/accountscorehistory")
public class AccountScoreHistoryController extends BaseController {

	@Autowired
	private AccountScoreHistoryService scoreHistoryService;

	@RequestMapping("/scoreListViewByWeiXin")
	public String scoreListViewByWeiXin(String accountId, Model model) {
		model.addAttribute("accountId", accountId);
		return "/weixin/account_score_list";
	}
	
	@RequestMapping("/scoreListByWeiXin")
	@ResponseBody
	public List<AccountScoreHistory> scoreListByWeiXin(String accountId, String type, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<AccountScoreHistory> page = scoreHistoryService.findList(new Page<AccountScoreHistory>(request, response), accountId, type);
		return page.getList();
	}
}
