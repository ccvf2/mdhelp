package kr.mdhelp.member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.mdhelp.common.utils.HttpUtil;

@Controller
public class SearchController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "member/search/naver", method = RequestMethod.GET)
	public ModelAndView naverSearchPage() {
		logger.info("============================= naverSearchPage get");
		
		ModelAndView mav  = new ModelAndView();
		Authentication auth =  SecurityContextHolder.getContext().getAuthentication();
		
		mav.setViewName("member/search/naver");
		return mav;
	}

	@ResponseBody
	@RequestMapping(value = "member/search/naverSearch", method=RequestMethod.POST)
	public String naverSearch(HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value="searchList[]") List<String> searchList) {
		logger.info("=============================naverSearch POST");		
		logger.info("============================= searchList : [{}]", searchList);
		
		String text = "CZ1YMR913";
		
		String clientId = "n5dVvdI7k3nRnPJ_M3Er"; // 애플리케이션 클라이언트 아이디
		String clientSecret = "8qQjOxaoNz"; // 애플리케이션 클라이언트 시크릿
		
		String apiURL = "https://openapi.naver.com/v1/search/shop.json"; // json 결과
		
		HashMap<String, Object> result = new HttpUtil()
				.header("X-Naver-Client-Id", clientId)
				.header("X-Naver-Client-Secret", clientSecret)
				.url(apiURL)
				.method("get")
				.queryString("query", text)
				.build();
		
		// GET 요청 결과
		System.out.println(result.get("status").toString());
		System.out.println(result.get("header").toString());
		System.out.println(result.get("body").toString());
		
		return null;
	}
	
}
