package kr.mdhelp.member.controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

@Controller
public class PaymentController {
	private static final Logger logger = LoggerFactory.getLogger(PaymentController.class);
	private static final String loggerPrix = "[PG결제 Moudle]------";
	@Value("${PG.default}")
	private String paymentGateWay;
	@Value("${IMP.UID}")
	private String IMP_UID;
	@Value("${IMP.API_KEY}")
	private String IMP_API_KEY;
	@Value("${IMP.API_SEC}")
	private String IMP_API_SEC;
	
	private static final String sessionKey = "PAYMENT_PROCESS";;
	
	
	
	@RequestMapping(value = "member/payment/page", method = RequestMethod.GET)
	public ModelAndView paymentTestPage(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		
		logger.debug(loggerPrix+"get properties : [{}]",paymentGateWay);
		mav.addObject("IMP_UID", IMP_UID);
		mav.setViewName("member/payment/paymentPage");
		
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value = "member/payment/muid", method = RequestMethod.POST)
	public String merchantUIDGenerating(
			HttpServletRequest request
			, HttpServletResponse response
			) {
		logger.debug(loggerPrix+"paymentMerchantUIDGenerator -  MerchantUID생성시도");
		
		String merchantUID = UUID.randomUUID().toString(); // 임의의 문자열
		merchantUID = StringUtils.remove(merchantUID, "-");
		
		HttpSession session = request.getSession();
		Map<String, Object>paymentProcessMap = (Map<String, Object>)session.getAttribute(sessionKey);
		if(paymentProcessMap == null) {
			//생성해서 넣음.
			logger.debug(loggerPrix+"Session에 객체를 생성함.");
			paymentProcessMap = new LinkedHashMap<String, Object>();
			paymentProcessMap.put(merchantUID, new Object());
		}else {
			logger.debug(loggerPrix+"Session에 객체를 삽입함.");
			paymentProcessMap.put(merchantUID, new Object());
		}
		
		logger.debug(loggerPrix+"MerchantUID 결과 : [{}]",merchantUID);
		
		return merchantUID;
	}
	@ResponseBody
	@RequestMapping(value = "member/payment/verify", method = RequestMethod.POST)
	public String paymentVerifyMethod(
			HttpServletRequest request
			, HttpServletResponse response
			, @RequestParam(required = true) String imp_uid
			, @RequestParam(required = true) String merchant_uid
			) {
		logger.debug(loggerPrix+"merchant_uid:[{}]",merchant_uid);
		logger.debug(loggerPrix+"imp_uid:[{}]",imp_uid);
		logger.debug(loggerPrix+"IMP_API_KEY:[{}]",IMP_API_KEY);
		logger.debug(loggerPrix+"IMP_API_SEC:[{}]",IMP_API_SEC);
		
		boolean balanceVerifyResult = pg_SaValid(imp_uid);
		if(balanceVerifyResult) {
			logger.debug(loggerPrix+"금액검증 성공");
		}else {
			logger.debug(loggerPrix+"금액검증 실패");
		}
		
		//TO-DO : 여기서 결제 정보를 세션에 써둔다.
		return "금액검증 성공";
	}
	
	
	private boolean pg_SaValid (String payment_uid) {
		boolean returnValue = false;
		IamportClient client = new IamportClient(IMP_API_KEY, IMP_API_SEC);
		try {
			//payment_uid로 PG사 결제 금액을 요청.
			IamportResponse<Payment> payment_response =client.paymentByImpUid(payment_uid);
			Payment paymentInfo = payment_response.getResponse();
			
			logger.debug(loggerPrix+"payment_response.getResponse.getAmount :[{}]",payment_response.getResponse().getAmount());
			
			logger.debug(loggerPrix+"paymentInfo.toString :[{}]",paymentInfo.toString());
			
			
			//PG사 반환해준 결제금액.
			BigDecimal balance = paymentInfo.getAmount();
			BigDecimal payTryAmt = new BigDecimal("1000");//실제 결제되야 할 금액.
			logger.debug(loggerPrix+"PG사 반환해준 결제금액 : [{}]",balance.toString());
			logger.debug(loggerPrix+"실제 결제되야 할 금액 : [{}]",payTryAmt.toString());
			int compareValue = balance.compareTo(payTryAmt); 
			if(compareValue == 0) {
				//비교값 같음.
				logger.debug(loggerPrix+ "비교값 같음.");
				returnValue = true;
			}else {
				//비교값 
				logger.debug(loggerPrix+ "비교값 다름.");
				//TO-DO payment_uid로 Cancel Process를 실행한다.
				returnValue = false;
			}
		} catch (IamportResponseException e) {
			logger.debug(loggerPrix+ "IamportResponseException 발생");
			logger.debug(loggerPrix+ "[{}]",e.getMessage());
			logger.debug(loggerPrix+ "[{}]",e.toString());
			switch(e.getHttpStatusCode()) {
			case 401 :
				//TODO
				break;
			case 500 :
				//TODO
				break;
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			logger.debug(loggerPrix+ "IOException 발생");
			logger.debug(loggerPrix+ "[{}]",e.getMessage());
			logger.debug(loggerPrix+ "[{}]",e.toString());
			logger.debug(loggerPrix+ "[{}]",e.getMessage());
			logger.debug(loggerPrix+ "[{}]",e.toString());
		}
		return returnValue;
	}
}