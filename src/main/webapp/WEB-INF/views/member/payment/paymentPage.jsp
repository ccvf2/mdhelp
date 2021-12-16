<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- 
 @author	: ccvf2.dev
 @since		: 2021. 12. 7.
 @partType	: (ex: admin | user | common | etx)
 @catgory	: (ex: 관리자 메인)
 @see		: (ex: 기타내용 기술)
 @comment	: (ex: 해당페이지에서는 자바스크립트를 최소화 하도록 합니다.-개발자 및 소스 수정자에게 전달내용)
 @desc		: 
 ***************************************
 **개정이력**
 ***************************************
 * no	수정일			수정자		수정이력
 * 1.	2021. 12. 7.	ccvf2.dev		최초작성
 ***************************************
 --%>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script type="text/javascript">
	console.time("paymentPageLodding");
</script>
<div class="row">
	<div class="col-md-12">
		<label for="p_code">신용카드:</label>
		<input type="radio" name="paymentMethod" id="p_code" value="card" checked="checked">
		<br>
		<label for="p_trans">실시간계좌이체:</label>
		<input type="radio" name="paymentMethod" id="p_trans" value="trans">
		<br>
		<label for="p_vbank">가상계좌:</label>
		<input type="radio" name="paymentMethod" id="p_vbank" value="vbank">
		<br>
		<label for="p_phone">휴대폰소액결제:</label>
		<input type="radio" name="paymentMethod" id="p_phone" value="phone">
		<br>
		<label for="paymentAmount"> 결제금액:</label>
		<input type="tel" name="paymentAmount" id="paymentAmount" value="1000">
		<br>
		<button onclick="paymentWrapperObj.paymentStarter();"> 결제시작</button>
	</div>
</div>
<div class="row">
	<div class="col-md-12">
	
		<h1>&nbsp;</h1>
		<h3>※실제 결제가 일어납니다.※</h3>
		<h3>&nbsp;</h3>
		<h4>결제취소는 <a href="https://admin.iamport.kr/" target="_blank">아임포트관리자콘솔</a> 에서 취소가능</h4>
		<span>id/pass는</span>   <span> <a href="https://supergo.kr/" target="_blank">https://supergo.kr</a></span><br>
		<span><h5>v1_devgroup\네이버&아임포트계정.txt</h5>를 참조</span>
	</div>
</div>

<script type="text/javascript">

	/** MethodNote :  */
var paymentWrapperObj = {
	IMP:{},
	code:"<c:out value='${IMP_UID}'/>",//가맹점 식별코드
	/** MethodNote :  결제모듈 초기화 */
	init : function(){
		console.log("결제모듈 초기화");
		this.IMP = window.IMP;
		this.IMP.init(this.code);
		console.timeEnd("paymentPageLodding");
	},
	/** MethodNote : 화면에 있는 input 정보를 긁어와 object화 하여 반환한다.*/
	inputValueHooker : function(){
		var resultObj = {
			product:[{"productKey": "112313","productName": "수량형", "count":10},{"productKey": "112313","productName": "구독형", "count":10}]
			,totalAmount : 0
		};
		var amount = document.getElementById("paymentAmount");
		var methodList = document.getElementsByName("paymentMethod");
		var method ="";
		methodList.forEach(function(item,index){
			console.log(index);
			console.log(item.checked);
			if(item.checked){
				method = item.value;
			}
			console.log("==================");
		});
		
		resultObj.totalAmount =  amount.value;
		resultObj.method =  method;
		return resultObj;
	},
	/** MethodNote : 화면에 사용자가 선택 한 값이 정상인지 판별. */
	inputValueValueValidation : function(obj){
		//수량이 0이 아닌지.
		//값이 조작되어 결제 금액이 0이 아닌지.
		//등등등..
		return true;
	},
	
	
	/** MethodNote : 상품과 수량, 쿠폰 서버로 보내고 merchant_uid를 서버로 부터 얻어온다. */
	paymentMerchantUIDGenerator : function(obj){
		var merchantUID =""; 
		$.ajax({
			url: "/member/payment/muid",
			type:"POST",
			dataType:"text",
			data:obj,
			async : false,
			success:function(data){
				console.log(data)
				merchantUID = data;
			},
			error:function(xhr, status, errorMsg){
				console.log(xhr)
				console.log(status)
				console.log(errorMsg)
			}
		});
		
		return merchantUID;
	},
	
	
	/** MethodNote : 결제 프로세서 시작.
		//https://github.com/iamport/iamport-manual/blob/master/%EC%9D%B8%EC%A6%9D%EA%B2%B0%EC%A0%9C/README.md#211-param-%EC%86%8D%EC%84%B1%EA%B3%B5%ED%86%B5-%EC%86%8D%EC%84%B1
		//https://github.com/iamport/iamport-manual/blob/master/%EC%9D%B8%EC%A6%9D%EA%B2%B0%EC%A0%9C/sample/danal.md
	*/
	paymentStarter : function(){
		//Step1. 화면값을 기준으로 유저가결제할 상품과 수량, 쿠폰을 가져온다.
		var obj = this.inputValueHooker();
		//Step2. 상품수량 쿠폰등이 정상인지 Local확인.
		var valid = this.inputValueValueValidation(obj);
		if(valid){
			//Step3. 상품과 수량, 쿠폰 서버로 보내고 merchant_uid를 서버로 부터 얻어온다.
			console.log("-===================merchantUID 생성요청");
			var merchantUID = this.paymentMerchantUIDGenerator(obj);
			console.log("-===================merchantUID 결과: " + merchantUID);
			var paymentRequestObj = {
					pg				: 'danal_tpay',
					pay_method		: obj.method,// card(신용카드), trans(실시간계좌이체), vbank(가상계좌), 또는 phone(휴대폰소액결제)
					merchant_uid	: merchantUID, //상점에서 생성한 고유 주문번호
					name			: '주문명:결제테스트',
					amount			: obj.totalAmount,
					buyer_email		: 'iamport@siot.do',
					buyer_name		: '구매자이름',
					buyer_tel		: '010-1234-5678',
					buyer_addr		: '서울특별시 강남구 삼성동',
					buyer_postcode	: '123-456'
			};
			//결제창 요청
			console.log("-===================결제창 요청");
			console.log(paymentRequestObj);
			console.log("-===================결제창 요청");
			this.IMP.request_pay(paymentRequestObj, this.cb_request_pay.bind(this));
		}else{
			//화면값 검증 실패
			console.error("화면값 검증 실패");
		}
		
	},
	
	
	/** MethodNote : 결제결과 */
	cb_request_pay:function(response){
		console.log("-===================결제결과");
		console.log(response);
		console.log("-===================결제결과");
		/** response 결과 예시.
			{apply_num: "09189987",
			bank_name: null,
			buyer_addr: "서울특별시 강남구 삼성동",
			buyer_email: "iamport@siot.do",
			buyer_name: "구매자이름",
			buyer_postcode: "123-456",
			buyer_tel: "010-1234-5678",
			card_name: "하나카드",
			card_number: "411904******1585",
			card_quota: 0,
			currency: "KRW",
			custom_data: null,
			imp_uid: "imp_376123982190",
			merchant_uid: "order_no_0001",
			name: "주문명:결제테스트",
			paid_amount: 1000,
			paid_at: 1639636231,
			pay_method: "card",
			pg_provider: "danal_tpay",
			pg_tid: "202112161528440511314400",
			pg_type: "payment",
			receipt_url: "https://www.danalpay.com/receipt/creditcard/view.aspx?dataType=receipt&cpid=9810030929&data=jKo7qUxqL%2Bt1PFoNDkarRzU79R9V307Fn9gRLvIP83jCE4Ro9YEqH7WHqa2zkANZ",
			status: "paid",
			success: true}
		*/
		
		var success = response.success
		if(success){
			console.log("-=================== PG사 결제 성공");
			this.payment_verify(response);
		}else{
			console.log("-=================== PG사 결제 실패");
			this.fail_process(response)
		}
		
	},
	
	
	/** MethodNote : 결제검증*/
	payment_verify:function(response){
			console.log("-=================== 결제검증 시작");
		//TO-Do : 여기서 서버Session을 생성.위변조 검증 로직. 필요
		$.ajax({
			url: "/member/payment/verify",
			type:"POST",
			dataType:"text",
			data:response,
			async : true,
			success:function(data){
				console.log("-=================== 결제검증 성공");
				console.log(data)
				console.log("-=================== 결제검증 성공");
				this.success_after(data);
			}.bind(this),
			error:function(xhr, status, errorMsg){
				console.log("-=================== 결제검증 실패");
				console.log(xhr)
				console.log(status)
				console.log(errorMsg)
				console.log("-=================== 결제검증 실패");
			}.bind(this)
		});
	},
	/** MethodNote : 결제검증성공 후 실행.*/
	success_after:function(response){
		console.log("-=================== 결제검증성공 후 실행.");
		console.log(response);
		console.log("-=================== 결제검증성공 후 실행.");
		//TO-Do : success_verify가 실행된 후 실행.
			alert("결제가 완료");
	},
	/** MethodNote : 결제검증실패시 실행.*/
	fail_process:function(response){
			console.log("-=================== 결제검증실패시 실행!!!!!!!!.");
			console.log(response);
			console.log("-=================== 결제검증실패시 실행!!!!!!!!.");
		//TO-Do : 결제실패 시 실행.
			alert(response.error_msg);;
	},
	
	
}






paymentWrapperObj.init();
</script>