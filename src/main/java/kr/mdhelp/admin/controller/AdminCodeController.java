package kr.mdhelp.admin.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.mdhelp.common.model.CodeVO;
import kr.mdhelp.common.service.CommonCodeService;

@Controller
public class AdminCodeController {
	private static final Logger logger = LoggerFactory.getLogger(AdminCodeController.class);
	
	@Autowired
	CommonCodeService codeService;
	
	@RequestMapping(value = "admin/codegroup", method = RequestMethod.GET)
	public ModelAndView codeGroupPage(HttpServletRequest request, HttpServletResponse response) {
		logger.info("=============================codeGroupPage");
		ModelAndView mav = new ModelAndView();
		List<CodeVO> codeGroupList = codeService.getCodeGroupListNotRetunToNULL(new HashMap<String, Object>());
		mav.addObject("codeGroupList", codeGroupList);
		mav.setViewName("admin/code/codeGroup");
		return mav;
	}
}
