package kr.mdhelp.admin.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.mdhelp.common.model.CodeVO;
import kr.mdhelp.common.service.CommonCodeService;

@Controller
public class AdminCodeController {
	private static final Logger logger = LoggerFactory.getLogger(AdminCodeController.class);
	
	@Autowired
	CommonCodeService codeService;
	
	@RequestMapping(value = "/admin/codegroup", method = RequestMethod.GET)
	public ModelAndView codeGroupPage(HttpServletRequest request, HttpServletResponse response) {
		logger.info("=============================codeGroupPage");
		ModelAndView mav = new ModelAndView();
		List<CodeVO> codeGroupList = codeService.getCodeGroupListNotRetunToNULL(new HashMap<String, Object>());
		mav.addObject("codeGroupList", codeGroupList);
		mav.setViewName("admin/code/codeGroup");
		return mav;
	}
	@ResponseBody
	@PostMapping("/admin/codegroupinsert.ajax")
	public CodeVO insertCodeGroup(@ModelAttribute CodeVO codeGroupVO) {
		logger.info("=============================getCodeOne   A");
		logger.info("=============================getCodeOne.code   [{}]",codeGroupVO.getCode());
		logger.info("=============================getCodeOne.codename   [{}]",codeGroupVO.getCode_name());
		logger.info("=============================getCodeOne.codevalur   [{}]",codeGroupVO.getCode_value());
		logger.info("=============================getCodeOne.codecomment   [{}]",codeGroupVO.getCode_comment());
		logger.info("=============================getCodeOne.coderegdt   [{}]",codeGroupVO.getCode_regdt());
		CodeVO insertCodeGroup = codeService.insertCodeGroupRetunToNULL(codeGroupVO);
		logger.info("=============================outCodeOne   A");
		logger.info("=============================outCodeOne.code   [{}]",insertCodeGroup.getCode());
		logger.info("=============================outCodeOne.codename   [{}]",insertCodeGroup.getCode_name());
		logger.info("=============================outCodeOne.codegroup   [{}]",insertCodeGroup.getCode_group() );
		logger.info("=============================outCodeOne.codegroupname   [{}]",insertCodeGroup.getCode_group_name() );
		logger.info("=============================ouyCodeOne.codesort   [{}]",insertCodeGroup.getCode_sort());
		logger.info("=============================ouyCodeOne.codevalur   [{}]",insertCodeGroup.getCode_value());
		logger.info("=============================outCodeOne.codecomment   [{}]",insertCodeGroup.getCode_comment());
		logger.info("=============================outCodeOne.coderegdt   [{}]",insertCodeGroup.getCode_regdt());
		return insertCodeGroup;
		//return null;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping(value = "/admin/code", method = RequestMethod.GET)
	public ModelAndView codePage(HttpServletRequest request, HttpServletResponse response) {
		logger.info("=============================codePage");
		ModelAndView mav = new ModelAndView();
		List<CodeVO> codeGroupList = codeService.getCodeGroupListNotRetunToNULL(new HashMap<String, Object>());
		List<CodeVO> codeList = codeService.getCodeListNotRetunToNULL(new HashMap<String, Object>());
		mav.addObject("codeGroupList", codeGroupList);
		mav.addObject("codeList", codeList);
		mav.setViewName("admin/code/code");
		return mav;
	}
	
	/*@RequestMapping(value = "/admin/code.ajax", method = RequestMethod.POST)*/
	@ResponseBody
	@PostMapping("/admin/code.ajax")
	public List<CodeVO> getCodeList(HttpServletRequest request, HttpServletResponse response) {
		logger.info("============================= getCodeList   A");
		List<CodeVO> codeList = codeService.getCodeListNotRetunToNULL(new HashMap<String, Object>());
		return codeList;
	}
	@ResponseBody
	@PostMapping("/admin/codeOne.ajax")
	public CodeVO getCodeOne(HttpServletRequest request, HttpServletResponse response) {
		logger.info("=============================getCodeOne   A");
		List<CodeVO> codeList = codeService.getCodeListNotRetunToNULL(new HashMap<String, Object>());
		CodeVO vo = new CodeVO();
		vo = codeList.get(0);
		return vo;
	}
}
