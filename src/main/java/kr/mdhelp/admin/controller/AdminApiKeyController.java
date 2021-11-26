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

import kr.mdhelp.admin.model.ApiKeyDTO;
import kr.mdhelp.admin.service.AdminApiServiceInterface;

@Controller
public class AdminApiKeyController {
	private static final Logger logger = LoggerFactory.getLogger(AdminApiKeyController.class);
	
	@Autowired
	AdminApiServiceInterface adminApiService;
	
	
	
	@RequestMapping(value = "/admin/apikey", method = RequestMethod.GET)
	public ModelAndView apikeyPage(HttpServletRequest request, HttpServletResponse response) {
		logger.info("=============================apikeyPage get");
		ModelAndView mav = new ModelAndView();
		List<ApiKeyDTO> apiList = adminApiService.getApiList(new HashMap<String, Object>());
		mav.addObject("apiList", apiList); mav.addObject("apiList",apiList);
		mav.setViewName("admin/api/apikey");
		return mav;
	}
}
