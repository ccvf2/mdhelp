package kr.mdhelp.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PaymentController {
	private static final Logger logger = LoggerFactory.getLogger(PaymentController.class);
	
	@Value("${PG.default}")
	private String paymentGateWay;
	
	@RequestMapping(value = "member/payment/page", method = RequestMethod.GET)
	public ModelAndView paymentTestPage(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		
		
		logger.debug("get properties : [{}]",paymentGateWay);
		
		mav.setViewName("member/payment/paymentTest");
		return mav;
	}
}