package kr.mdhelp.member.controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.json.JSONArray;
import org.json.JSONObject;
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

import kr.mdhelp.common.model.CodeDTO;

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
	
	//private static final String sessionKey = "PAYMENT_PROCESS";
	
	
	@RequestMapping(value = "/member/popup/payment/couponModal", method = RequestMethod.GET)
	public ModelAndView apikeyInsertModal(HttpServletRequest request, HttpServletResponse response) {
		logger.info("=============================apikeyInsertModal GET");
		
		ModelAndView mav = new ModelAndView();

		mav.setViewName("member/popup/payment/couponModal");
		return mav;
	}
	
	
	@RequestMapping(value = "member/payment/page", method = RequestMethod.GET)
	public ModelAndView paymentPage1(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		
		logger.debug(loggerPrix+"get properties : [{}]",paymentGateWay);
		mav.addObject("paymentGateWay", paymentGateWay);
		mav.addObject("IMP_UID", IMP_UID);
		mav.setViewName("member/payment/paymentPage2");
		return mav;
	}
	@RequestMapping(value = "member/payment/page", method = RequestMethod.POST)
	public ModelAndView paymentPage2(HttpServletRequest request
			, HttpServletResponse response
			, @RequestParam(value="productKey") List<String> productList
			, @RequestParam(value="productCount") List<String> productCountList) {
		ModelAndView mav = new ModelAndView();
		logger.debug(loggerPrix+"get properties : [{}]",paymentGateWay);
		mav.addObject("paymentGateWay", paymentGateWay);
		mav.addObject("IMP_UID", IMP_UID);
		mav.setViewName("member/payment/paymentPage2");
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value = "member/payment/muid", method = RequestMethod.POST)
	public String merchantUIDGenerating(
			HttpServletRequest request
			, HttpServletResponse response
			,@RequestParam(value="data") String dataStr
			) {
		logger.debug(loggerPrix+"paymentMerchantUIDGenerator -  MerchantUID생성시도");
		logger.debug(loggerPrix+"%_%dataStr : [{}]",dataStr);
		
		String merchantUID = UUID.randomUUID().toString(); // 임의의 문자열 결제고유번호로 사용될 키
		merchantUID = StringUtils.remove(merchantUID, "-");
		HttpSession session = request.getSession();
		Map<String, Object>paymentProcessMap = new LinkedHashMap<String, Object>();
		
		/**session
		 * PAYMENT_PROCESS:{"data":{
										"coupon"		:[
															{"couponKey":"xxxx","count":1}
															,{"couponKey":"yyyyy","count":2}
														 ]
										,"product"		:[
															{"productKey": "112313","productName": "수량형", "count":10}
															,{"productKey": "112313","productName": "구독형", "count":10}
														 ]
										,"raw_tot_amt"	: 1000
										,"discount_amt"	: 0
										,"paymented_amt": 1000
									}
							}
		 **/
		//JSON
		JSONObject totData = new JSONObject(dataStr);
		BigDecimal raw_tot_amt = totData.getBigDecimal("raw_tot_amt");
		BigDecimal discount_amt = totData.getBigDecimal("discount_amt");
		BigDecimal paymented_amt = totData.getBigDecimal("paymented_amt");
		JSONArray  couponJsonArr = totData.getJSONArray("coupon");
		JSONArray  productJsonArr = totData.getJSONArray("product");
		logger.debug(loggerPrix+"[parmata] raw_tot_amt : [{}]",raw_tot_amt);
		logger.debug(loggerPrix+"[parmata] discount_amt : [{}]",discount_amt);
		logger.debug(loggerPrix+"[parmata] paymented_amt : [{}]",paymented_amt);
		paymentProcessMap.put("raw_tot_amt", raw_tot_amt);
		paymentProcessMap.put("discount_amt", discount_amt);
		paymentProcessMap.put("paymented_amt", paymented_amt);
		
		List<Map<String, Object>> couponList = new LinkedList<Map<String,Object>>();
		List<Map<String, Object>> productList = new LinkedList<Map<String,Object>>();
		//쿠폰정보를 자바 컬랙션타입으로 형변환
		logger.debug(loggerPrix+"쿠폰정보를 자바 컬랙션타입으로 형변환");
		Iterator<Object> couponIt = couponJsonArr.iterator();
		while (couponIt.hasNext()) {
			logger.debug(loggerPrix+"쿠폰정보 찾음");
			Object couponObj = couponIt.next();
			logger.debug(loggerPrix+"쿠폰정보 : [{}]",couponObj.toString());
			logger.debug(loggerPrix+"쿠폰정보 JSONObject 형변환 시도");
			JSONObject convCouponObj =(JSONObject)couponObj;
			logger.debug(loggerPrix+"쿠폰정보 JSONObject 형변환 성공");
			Map<String, Object> couponItem = convCouponObj.toMap();
			couponList.add(couponItem);
		}
		//상품정보를 자바 컬랙션타입으로 형변환 
		logger.debug(loggerPrix+"상품정보를 자바 컬랙션타입으로 형변환 ");
		Iterator<Object> productIt = productJsonArr.iterator();
		while (productIt.hasNext()) {
			logger.debug(loggerPrix+"상품정보 찾음");
			Object productObj = productIt.next();
			logger.debug(loggerPrix+"상품정보 : [{}]",productObj.toString());
			logger.debug(loggerPrix+"상품정보 JSONObject 형변환 시도");
			JSONObject convProductItObj =(JSONObject)productObj;
			logger.debug(loggerPrix+"쿠폰정보 JSONObject 형변환 성공");
			Map<String, Object> productInfoItem = convProductItObj.toMap();
			productList.add(productInfoItem);
		}
		logger.debug(loggerPrix+"쿠폰정보 session Map PUT");
		paymentProcessMap.put("couponInfo", couponList);
		logger.debug(loggerPrix+"상품정보 session Map PUT");
		paymentProcessMap.put("productList", productList);
		
		//Map<String, Object>paymentProcessMap = (Map<String, Object>)session.getAttribute(merchantUID);
		logger.debug(loggerPrix+"session Map PUT key : [{}]",merchantUID);
		session.setAttribute(merchantUID, paymentProcessMap);

		logger.debug(loggerPrix+"MerchantUID 결과 : [{}]",merchantUID);
		
		return merchantUID;
	}
	@SuppressWarnings("unchecked")
	@ResponseBody
	@RequestMapping(value = "member/payment/verify", method = RequestMethod.POST)
	public String paymentVerifyMethod(
			HttpServletRequest request
			, HttpServletResponse response
			, @RequestParam(required = true, name = "imp_uid") String imp_uid
			, @RequestParam(required = true, name ="merchant_uid" ) String merchantUID
			) {
		HttpSession session = request.getSession();
		Map<String, Object>paymentProcessMap = (Map<String, Object>)session.getAttribute(merchantUID);//session에 있는 내용중 merchant_uid로 정보 불러오기.
		logger.debug(loggerPrix+"merchant_uid:[{}]",merchantUID);
		logger.debug(loggerPrix+"imp_uid:[{}]",imp_uid);
		logger.debug(loggerPrix+"IMP_API_KEY:[{}]",IMP_API_KEY);
		logger.debug(loggerPrix+"IMP_API_SEC:[{}]",IMP_API_SEC);
		
		Payment paymentInfo = paymentInfoRequestReturnToNull(imp_uid);// "imp_uid"-> PG사로 호출하여 결제정보를 가져온다.
		if(paymentProcessMap != null) {
			BigDecimal balance = paymentInfo.getAmount(); //PG사 반환해준 결제금액
			BigDecimal payTryAmt = new BigDecimal(0);
			if(paymentProcessMap.get("paymented_amt")!=null) {
				BigDecimal payTryAmt_session = (BigDecimal)paymentProcessMap.get("paymented_amt");//세션에사 반환해준 결제금액
				payTryAmt=payTryAmt.add(payTryAmt_session);
			}else {
				logger.error(loggerPrix+"결제금액정보를 세션에서 찾을 수 없습니다.");
			}
			logger.debug(loggerPrix+"PG사 반환해준 결제금액 : [{}]",balance.toString());
			logger.debug(loggerPrix+"실제 결제되야 할 금액 : [{}]",payTryAmt.toString());
			int compareValue = balance.compareTo(payTryAmt); 
			if(compareValue == 0) {
				//비교값 같음.
				logger.debug(loggerPrix+ "비교값 같음.");
				logger.debug(loggerPrix+"금액검증 성공");
				//우리DB에 Insert or Update를 실행함.
			}else {
				//비교값 
				logger.debug(loggerPrix+ "비교값 다름.");
				logger.debug(loggerPrix+"금액검증 실패");
				//TO-DO payment_uid로 Cancel Process를 실행한다.
			}
		}else {
			logger.error(loggerPrix+"merchant_uid 생성정보를 세션에서 찾을 수 없습니다.");
		}
		
		//TO-DO : 여기서 결제 정보를 세션에 써둔다.
		return "금액검증 성공";
	}
	
	
	private Payment paymentInfoRequestReturnToNull (String payment_uid) {
		IamportClient client = new IamportClient(IMP_API_KEY, IMP_API_SEC);
		Payment paymentInfo = null;
		try {
			//payment_uid로 PG사 결제 금액을 요청.
			IamportResponse<Payment> payment_response =client.paymentByImpUid(payment_uid);
			paymentInfo = payment_response.getResponse();
			
			logger.debug(loggerPrix+"getApplyNum			:[{}]" , payment_response.getResponse().getApplyNum()			);    //카드사영수증에 표기되는 승인번호
			logger.debug(loggerPrix+"getBankCode			:[{}]" , payment_response.getResponse().getBankCode()			);    //은행코드(yes Null)-은행마다지정된3자리 코드
			logger.debug(loggerPrix+"getBankName			:[{}]" , payment_response.getResponse().getBankName()			);    //은행명(yes Null)
			logger.debug(loggerPrix+"getBuyerAddr			:[{}]" , payment_response.getResponse().getBuyerAddr()			);    //구매자명(결제 요청시 입력한 파라메터)
			logger.debug(loggerPrix+"getBuyerEmail			:[{}]" , payment_response.getResponse().getBuyerEmail()			);    //구매자이메일주소(결제 요청시 입력한 파라메터)
			logger.debug(loggerPrix+"getBuyerPostcode		:[{}]" , payment_response.getResponse().getBuyerPostcode()		);    //구매자우편번호(결제 요청시 입력한 파라메터)
			logger.debug(loggerPrix+"getBuyerTel			:[{}]" , payment_response.getResponse().getBuyerTel()			);    //구매자 연락처(결제 요청시 입력한 파라메터)
			logger.debug(loggerPrix+"getCancelAmount		:[{}]" , payment_response.getResponse().getCancelAmount()		);    //취소된금액[0]
			//logger.debug(loggerPrix+"getCancelHistory		:[{}]" , payment_response.getResponse().getCancelHistory());       //?
			logger.debug(loggerPrix+"getCancelledAt			:[{}]" , payment_response.getResponse().getCancelledAt()		);    //취소일자[Thu Jan 01 09:00:00 KST 1970]-gabaegeData
			logger.debug(loggerPrix+"getCancelReason		:[{}]" , payment_response.getResponse().getCancelReason()		);    //취소사유(yes Null)
			logger.debug(loggerPrix+"getCardCode			:[{}]" , payment_response.getResponse().getCardCode()			);    //카드코드-카드사마다 지정된 3자리 코드
			logger.debug(loggerPrix+"getCardName			:[{}]" , payment_response.getResponse().getCardName()			);    //결제카드사명
			logger.debug(loggerPrix+"getCardNumber			:[{}]" , payment_response.getResponse().getCardNumber()			);    //결제카드번호(일부마스킹처리)
			logger.debug(loggerPrix+"getCardQuota			:[{}]" , payment_response.getResponse().getCardQuota()			);    //카드할부개월[0]
			logger.debug(loggerPrix+"getCardType			:[{}]" , payment_response.getResponse().getCardType()			);    //?0
			logger.debug(loggerPrix+"getChannel				:[{}]" , payment_response.getResponse().getChannel()			);    //?[pc]
			logger.debug(loggerPrix+"getCurrency			:[{}]" , payment_response.getResponse().getCurrency()			);    //원화[KRW]
			logger.debug(loggerPrix+"getCustomData			:[{}]" , payment_response.getResponse().getCustomData()			);    //?(yes Null)
			logger.debug(loggerPrix+"getCustomerUid			:[{}]" , payment_response.getResponse().getCustomerUid()		);    //?(yes Null)
			logger.debug(loggerPrix+"getCustomerUidUsage	:[{}]" , payment_response.getResponse().getCustomerUidUsage()	);    //?(yes Null)
			logger.debug(loggerPrix+"getEmbPgProvider		:[{}]" , payment_response.getResponse().getEmbPgProvider()		);    //?(yes Null)
			logger.debug(loggerPrix+"getFailedAt			:[{}]" , payment_response.getResponse().getFailedAt()			);    //실패시간[Thu Jan 01 09:00:00 KST 1970]-gabaegeData
			logger.debug(loggerPrix+"getFailReason			:[{}]" , payment_response.getResponse().getFailReason()			);    //실패사유(yes Null)
			logger.debug(loggerPrix+"getImpUid				:[{}]" , payment_response.getResponse().getImpUid()				);    //아임포트결제고유번호
			logger.debug(loggerPrix+"getMerchantUid			:[{}]" , payment_response.getResponse().getMerchantUid()		);    //엠디헬프에서 결제전 자체적으로 생성한UID(결제 요청시 입력한 파라메터)
			logger.debug(loggerPrix+"getName				:[{}]" , payment_response.getResponse().getName()				);    //결제명(결제 요청시 입력한 파라메터)[상품명 외 2게]
			logger.debug(loggerPrix+"getPaidAt				:[{}]" , payment_response.getResponse().getPaidAt()				);    //결제일[Fri Dec 17 14:25:12 KST 2021]
			logger.debug(loggerPrix+"getPayMethod			:[{}]" , payment_response.getResponse().getPayMethod()			);    //결제방법[card]
			logger.debug(loggerPrix+"getPgProvider			:[{}]" , payment_response.getResponse().getPgProvider()			);    //PG사구분코드[danal_tpay]
			logger.debug(loggerPrix+"getPgTid				:[{}]" , payment_response.getResponse().getPgTid()				);    //카드사승인번호(PG사 승인번호)
			logger.debug(loggerPrix+"getReceiptUrl			:[{}]" , payment_response.getResponse().getReceiptUrl()			);    //영수증URL
			logger.debug(loggerPrix+"getStartedAt			:[{}]" , payment_response.getResponse().getStartedAt()			);    //?[1639718635]
			logger.debug(loggerPrix+"getStatus				:[{}]" , payment_response.getResponse().getStatus()				);    //결제상태[paid]
			logger.debug(loggerPrix+"getVbankCode			:[{}]" , payment_response.getResponse().getVbankCode()			);    //가상계좌은행코드(yes Null)
			logger.debug(loggerPrix+"getVbankDate			:[{}]" , payment_response.getResponse().getVbankDate()			);    //?[Thu Jan 01 09:00:00 KST 1970]-gabaegeData
			logger.debug(loggerPrix+"getVbankHolder			:[{}]" , payment_response.getResponse().getVbankHolder()		);    //?[Thu Jan 01 09:00:00 KST 1970]-gabaegeData
			logger.debug(loggerPrix+"getVbankIssuedAt		:[{}]" , payment_response.getResponse().getVbankIssuedAt()		);    //?[0]
			logger.debug(loggerPrix+"getVbankName			:[{}]" , payment_response.getResponse().getVbankName()			);    //가상계좌은행명(yes Null)
			logger.debug(loggerPrix+"getVbankNum			:[{}]" , payment_response.getResponse().getVbankNum()			);    //가상계좌은행코드(yes Null)
			logger.debug(loggerPrix+"getAmount				:[{}]" , payment_response.getResponse().getAmount()				);    //결제액(실제결제요청된금액)
			
			//PG사 반환해준 결제금액.
			/**
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
			 * */
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
		return paymentInfo;
	}
}