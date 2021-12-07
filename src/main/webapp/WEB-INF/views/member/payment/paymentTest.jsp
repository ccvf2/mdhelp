<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
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
		<input type="radio" name="paymentMethod" id="p_code" value="card">
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

<script type="text/javascript">

var paymentWrapperObj = {
	IMP:{},
	code:"imp86139972",//가맹정 식별코드
	init : function(){
		console.log("결제모듈 초기화");
		this.IMP = window.IMP;
		this.IMP.init(this.code);
		console.timeEnd("paymentPageLodding");
	},
	
	inputValueHooker : function(){
		var resultObj = {};
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
		
		resultObj.amount =  amount.value;
		resultObj.method =  method;
		return resultObj;
	},
	
	
	paymentStarter : function(){
		var obj = this.inputValueHooker();
		//https://github.com/iamport/iamport-manual/blob/master/%EC%9D%B8%EC%A6%9D%EA%B2%B0%EC%A0%9C/README.md#211-param-%EC%86%8D%EC%84%B1%EA%B3%B5%ED%86%B5-%EC%86%8D%EC%84%B1
		//https://github.com/iamport/iamport-manual/blob/master/%EC%9D%B8%EC%A6%9D%EA%B2%B0%EC%A0%9C/sample/danal.md
		var paymentRequestObj = {
			    pg : 'danal_tpay',
			    pay_method : obj.method,// card(신용카드), trans(실시간계좌이체), vbank(가상계좌), 또는 phone(휴대폰소액결제)
			    merchant_uid: "order_no_0001", //상점에서 생성한 고유 주문번호
			    name : '주문명:결제테스트',
			    amount : obj.amount,
			    buyer_email : 'iamport@siot.do',
			    buyer_name : '구매자이름',
			    buyer_tel : '010-1234-5678',
			    buyer_addr : '서울특별시 강남구 삼성동',
			    buyer_postcode : '123-456'
		};
		
		
		this.IMP.request_pay(paymentRequestObj, this.cb_request_pay.bind(this));
		console.log(obj)
	},
	
	
	cb_request_pay:function(response){
		console.log(response);
		var success = response.success
		if(success){
			this.success_verify()
			this.success_after();
		}else{
			this.fail_after(response)
		}
		
	},
	
	
	success_verify:function(){
		//TO-Do : 여기서 서버Session을 생성.위변조 검증 로직. 필요
	},
	success_after:function(){
		//TO-Do : success_verify가 실행된 후 실행.
	},
	fail_after:function(response){
		//TO-Do : 결제실패 시 실행.
			alert(response.error_msg);;
	},
	
	
}






paymentWrapperObj.init();
</script>