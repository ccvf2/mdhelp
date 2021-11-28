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
//import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.mdhelp.admin.model.ApiKeyDTO;
import kr.mdhelp.admin.service.AdminApiServiceInterface;
import kr.mdhelp.common.model.CodeDTO;
import kr.mdhelp.common.utils.LoginInfomaitionUtils;

@Controller
public class AdminApiKeyController {
	private static final Logger logger = LoggerFactory.getLogger(AdminApiKeyController.class);
	
	@Autowired
	AdminApiServiceInterface adminApiService;
	
	
	
	@RequestMapping(value = "/admin/apikey", method = RequestMethod.GET)
	public ModelAndView apikeyPage(HttpServletRequest request, HttpServletResponse response, @RequestParam Map<String,Object> searchMap) {
		logger.info("=============================apikeyPage get");
		ModelAndView mav = new ModelAndView();
		List<CodeDTO> apiGroupList = adminApiService.getApiGroupList(new HashMap<String, Object>());
		List<CodeDTO> apiGroupStateList = adminApiService.getApiGroupStateList(new HashMap<String, Object>());
		List<ApiKeyDTO> apiList = adminApiService.getApiList(searchMap);
		
		mav.addObject("apiGroupList",apiGroupList);
		mav.addObject("apiGroupStateList", apiGroupStateList); 
		mav.addObject("apiList", apiList);
		mav.setViewName("admin/api/apikey");
		return mav;
	}
	
	@RequestMapping(value = "/admin/searchApiList", method = RequestMethod.POST)
	public ModelAndView searchApiCode(HttpServletRequest request, HttpServletResponse response,
			@RequestParam Map<String,Object> searchMap) {
		logger.info("=============================apikeyPage POST");		
		logger.info("============================= searchMap : [{}]", searchMap.toString());
		
		ModelAndView mav = new ModelAndView();
		List<CodeDTO> apiGroupList = adminApiService.getApiGroupList(new HashMap<String, Object>());
		List<CodeDTO> apiGroupStateList = adminApiService.getApiGroupStateList(new HashMap<String, Object>());
		List<ApiKeyDTO> apiList = adminApiService.getApiList(searchMap);
		
		mav.addObject("searchMap", searchMap);
		mav.addObject("apiGroupList",apiGroupList);
		mav.addObject("apiGroupStateList", apiGroupStateList);
		mav.addObject("apiList", apiList);
		
		mav.setViewName("admin/api/apikey");
		return mav;
	}
	
	@RequestMapping(value = "/admin/popup/apikeyInsertModal", method = RequestMethod.GET)
	public ModelAndView apikeyInsertModal(HttpServletRequest request, HttpServletResponse response) {
		logger.info("=============================apikeyInsertModal GET");
		List<CodeDTO> apiGroupList = adminApiService.getApiGroupList(new HashMap<String, Object>());
		List<CodeDTO> apiGroupStateList = adminApiService.getApiGroupStateList(new HashMap<String, Object>());
		
		ModelAndView mav = new ModelAndView();

		mav.addObject("apiGroupList",apiGroupList);
		mav.addObject("apiGroupStateList", apiGroupStateList);
		mav.setViewName("admin/popup/api/apikeyInsertModal");
		return mav;
	}
	
	
	@RequestMapping(value = "/admin/apikeyInsert", method = RequestMethod.POST)
	public ModelAndView apikeyInsert(HttpServletRequest request, HttpServletResponse response,
			@RequestParam Map<String,Object> searchMap, @ModelAttribute ApiKeyDTO apiKeyDTO) {
		logger.info("=============================apikeyInsert");
		logger.info("============================= searchMap : [{}]", searchMap.toString());
		logger.info("============================= apiKeyDTO : [{}]", apiKeyDTO.toString());
		
		
		String userID = LoginInfomaitionUtils.getUserNameToNotNull();
		
		apiKeyDTO.setOwner(userID);
		
		int result = adminApiService.insertApikeyRetunToNULL(apiKeyDTO);
		
		
		ModelAndView mav = new ModelAndView();
		
		List<CodeDTO> apiGroupList = adminApiService.getApiGroupList(new HashMap<String, Object>());
		List<CodeDTO> apiGroupStateList = adminApiService.getApiGroupStateList(new HashMap<String, Object>());
		List<ApiKeyDTO> apiList = adminApiService.getApiList(searchMap);
		
		mav.addObject("apiGroupList",apiGroupList);
		mav.addObject("apiGroupStateList", apiGroupStateList); 
		mav.addObject("apiList", apiList);
		
		
		mav.setViewName("admin/api/apikey");
		return mav;
	}
	
	@RequestMapping(value = "/admin/popup/apikeyUpdateModal", method = RequestMethod.GET)
	public ModelAndView apikeyUpdateView(HttpServletRequest request, HttpServletResponse response,
			@RequestParam Map<String,Object> searchMap) {
		logger.info("=============================apikeyUpdateView GET");
		logger.info("============================= searchMap : [{}]", searchMap.toString());
		
		
		ApiKeyDTO apiKeyDTO = adminApiService.getApikeyRetunToNULL(searchMap);
		
		String userID = LoginInfomaitionUtils.getUserNameToNotNull();
		apiKeyDTO.setOwner(userID);
		
		 
		
		List<CodeDTO> apiGroupList = adminApiService.getApiGroupList(new HashMap<String, Object>()); 
		List<CodeDTO> apiGroupStateList = adminApiService.getApiGroupStateList(new HashMap<String, Object>());
		
		
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("apiGroupList",apiGroupList);
		mav.addObject("apiGroupStateList", apiGroupStateList);
		mav.addObject("apiKeyDTO", apiKeyDTO);		
		
		mav.setViewName("admin/popup/api/apikeyUpdateModal");
		return mav;
	}
	
	@RequestMapping(value = "/admin/apikeyUpdate", method = RequestMethod.POST)
	public ModelAndView apikeyUpdate(HttpServletRequest request, HttpServletResponse response,
			@RequestParam Map<String,Object> searchMap, @ModelAttribute ApiKeyDTO apiKeyDTO) {
		logger.info("=============================apikeyUpdate");
		logger.info("============================= searchMap : [{}]", searchMap.toString());
		logger.info("============================= apiKeyDTO : [{}]", apiKeyDTO.toString());
		
		
		String userID = LoginInfomaitionUtils.getUserNameToNotNull();
		apiKeyDTO.setOwner(userID);
		
		int result = adminApiService.updateApikeyRetunToNULL(apiKeyDTO);
		
		
		ModelAndView mav = new ModelAndView();
		
		List<CodeDTO> apiGroupList = adminApiService.getApiGroupList(new HashMap<String, Object>());
		List<CodeDTO> apiGroupStateList = adminApiService.getApiGroupStateList(new HashMap<String, Object>());
		List<ApiKeyDTO> apiList = adminApiService.getApiList(searchMap);
		
		mav.addObject("apiGroupList",apiGroupList);
		mav.addObject("apiGroupStateList", apiGroupStateList); 
		mav.addObject("apiList", apiList);
		
		
		mav.setViewName("admin/api/apikey");
		return mav;
	}
}
