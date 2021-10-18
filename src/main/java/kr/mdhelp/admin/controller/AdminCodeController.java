package kr.mdhelp.admin.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.mdhelp.admin.service.AdminCodeServiceInterface;
import kr.mdhelp.common.model.CodeDTO;
import kr.mdhelp.common.service.CommonCodeServiceInterface;

@Controller
public class AdminCodeController {
	private static final Logger logger = LoggerFactory.getLogger(AdminCodeController.class);
	
	@Autowired
	CommonCodeServiceInterface codeService;
	@Autowired
	AdminCodeServiceInterface adminCodeService;
	
	@RequestMapping(value = "/admin/codegroup", method = RequestMethod.GET)
	public ModelAndView codeGroupPage(HttpServletRequest request, HttpServletResponse response) {
		logger.info("=============================codeGroupPage");
		ModelAndView mav = new ModelAndView();
		List<CodeDTO> codeGroupList = codeService.getCodeGroupListNotRetunToNULL(new HashMap<String, Object>());
		mav.addObject("codeGroupList", codeGroupList);
		mav.setViewName("admin/code/codeGroup");
		return mav;
	}
	
	@ResponseBody
	@PostMapping("/admin/codegroupinsert.ajax")
	public CodeDTO insertCodeGroup(@ModelAttribute CodeDTO codeGroupDTO) {
		logger.info("=============================getCodeOne   A");
		logger.info("=============================getCodeOne.code   [{}]",codeGroupDTO.getCode());
		logger.info("=============================getCodeOne.codename   [{}]",codeGroupDTO.getCode_name());
		logger.info("=============================getCodeOne.codevalur   [{}]",codeGroupDTO.getCode_value());
		logger.info("=============================getCodeOne.codecomment   [{}]",codeGroupDTO.getCode_comment());
		logger.info("=============================getCodeOne.coderegdt   [{}]",codeGroupDTO.getCode_regdt());
		CodeDTO insertCodeGroup = adminCodeService.insertCodeGroupRetunToNULL(codeGroupDTO);
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
	@ResponseBody
	@PostMapping("/admin/codegroupdelete.ajax")
	public CodeDTO deleteCodeGroup(@ModelAttribute CodeDTO codeGroupDTO) {
		codeGroupDTO.setCode_sort(0);
		logger.info("============================= deleteCodeGroup   B");
		logger.info("=============================getCodeOne.code   [{}]",codeGroupDTO.getCode());
		logger.info("=============================getCodeOne.codevalur   [{}]",codeGroupDTO.getCode_value());
		CodeDTO deleteCodeGroup = adminCodeService.deleteCodeGroupRetunToNULL(codeGroupDTO);
		return deleteCodeGroup;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping(value = "/admin/code", method = RequestMethod.GET)
	public ModelAndView codePage(HttpServletRequest request, HttpServletResponse response) {
		logger.info("=============================codePage get");
		ModelAndView mav = new ModelAndView();
		List<CodeDTO> codeGroupList = codeService.getCodeGroupListNotRetunToNULL(new HashMap<String, Object>());
		List<CodeDTO> codeList = codeService.getCodeListNotRetunToNULL(new HashMap<String, Object>());
		mav.addObject("codeGroupList", codeGroupList);
		mav.addObject("codeList", codeList);
		mav.setViewName("admin/code/code");
		return mav;
	}
	@RequestMapping(value = "/admin/code", method = RequestMethod.POST)
	public ModelAndView codePagePost(HttpServletRequest request, HttpServletResponse response,
			@RequestParam Map<String,Object> searchMap) {
		logger.info("=============================codePage post");
		ModelAndView mav = new ModelAndView();
		
		logger.info("============================= searchMap : [{}]", searchMap.toString());
		
		
		
		List<CodeDTO> codeGroupList = codeService.getCodeGroupListNotRetunToNULL(new HashMap<String, Object>());
		mav.addObject("codeGroupList", codeGroupList);
		mav.addObject("searchMap", searchMap);

		List<CodeDTO> codeList = codeService.getCodeListNotRetunToNULL(searchMap);
		mav.addObject("codeList", codeList);
		mav.setViewName("admin/code/code");
		return mav;
	}
	@RequestMapping(value = "/admin/codeinsert", method = RequestMethod.POST)
	public ModelAndView codeInsert(HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute CodeDTO codeDTO) {
		logger.info("=============================codeInsert");
		ModelAndView mav = new ModelAndView();
		
		CodeDTO resultCodeDTO = adminCodeService.insertCodeRetunToNULL(codeDTO);
		mav.addObject("insertResult", resultCodeDTO);
		
		HashMap<String, Object> searchMap= new HashMap<String, Object>();
		logger.info("============================= searchMap : [{}]", searchMap.toString());
		
		List<CodeDTO> codeGroupList = codeService.getCodeGroupListNotRetunToNULL(new HashMap<String, Object>());
		mav.addObject("codeGroupList", codeGroupList);
		mav.addObject("searchMap", searchMap);
		
		List<CodeDTO> codeList = codeService.getCodeListNotRetunToNULL(searchMap);
		mav.addObject("codeList", codeList);
		mav.setViewName("admin/code/code");
		return mav;
	}
	@RequestMapping(value = "/admin/codedelete", method = RequestMethod.POST)
	public ModelAndView codeDelete(HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute CodeDTO codeDTO) {
		logger.info("=============================codeInsert");
		ModelAndView mav = new ModelAndView();
		
		int result = adminCodeService.deleteCodeRetunToNULL(codeDTO.getCode());
		
		logger.info("============================= result : [{}]", result);
		
		HashMap<String, Object> searchMap= new HashMap<String, Object>();
		logger.info("============================= searchMap : [{}]", searchMap.toString());
		
		List<CodeDTO> codeGroupList = codeService.getCodeGroupListNotRetunToNULL(new HashMap<String, Object>());
		mav.addObject("codeGroupList", codeGroupList);
		mav.addObject("searchMap", searchMap);
		
		List<CodeDTO> codeList = codeService.getCodeListNotRetunToNULL(searchMap);
		mav.addObject("codeList", codeList);
		mav.setViewName("admin/code/code");
		return mav;
	}
	
	/*@RequestMapping(value = "/admin/code.ajax", method = RequestMethod.POST)*/
	@ResponseBody
	@PostMapping("/admin/code.ajax")
	public List<CodeDTO> getCodeList(HttpServletRequest request, HttpServletResponse response) {
		logger.info("============================= getCodeList   A");
		List<CodeDTO> codeList = codeService.getCodeListNotRetunToNULL(new HashMap<String, Object>());
		return codeList;
	}
	@ResponseBody
	@PostMapping("/admin/codeOne.ajax")
	public CodeDTO getCodeOne(HttpServletRequest request, HttpServletResponse response) {
		logger.info("=============================getCodeOne   A");
		List<CodeDTO> codeList = codeService.getCodeListNotRetunToNULL(new HashMap<String, Object>());
		CodeDTO dto = new CodeDTO();
		dto = codeList.get(0);
		return dto;
	}
}
