package com.qmx.wxmp.controller.order;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.qmx.wxmp.common.utils.SpringWebUtil;
import com.qmx.wxmp.controller.BaseController;
import com.qmx.wxmp.entity.order.AccountScoreHistory;
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

	@RequestMapping("/wx_score_list")
	public String wxScoreList(Model model) {
		List<AccountScoreHistory> list = scoreHistoryService.findList(SpringWebUtil.getAccount());
		model.addAttribute("list", list);
		model.addAttribute("account", SpringWebUtil.getAccount());
		return "/wx/score_list";
	}
	
	
}
