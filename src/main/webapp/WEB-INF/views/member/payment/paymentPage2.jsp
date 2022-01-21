<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
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
<%--<script src="/memberAssets/libs/bootstrap-touchspin/jquery.bootstrap-touchspin.min.js"></script> --%>
<script type="text/javascript">
	console.time("paymentPageLodding");
</script>
<div class="row">
	<div class="col-lg-12" style="background-color: #fff;">
		<div class="text-center mt-5">
			<h5 class="mt-3" style="color: #00bbbb;">요금제 결제</h5>
			<h2 class="mt-1">우리 이제 함께해요!</h2>
		</div>
		
		<div class="row">
			<div class="col-lg-3">
				<div></div>
			</div>
			<!-- End col -->
	
			<div class="col-lg-6">
				<div class="mt-4">
					<h5 class="font-size-16 mt-4">함께할 이용권 내역</h5>
					<hr>
					<div class="row mb-0">
						<div class="col-lg-7 mt-2">
							<p class="font-size-16">정량제 이용권 (4,000건)</p>
						</div>
						
						<div class="col-lg-3">
							<div class="input-group bootstrap-touchspin bootstrap-touchspin-injected" >
								<span class="input-group-btn input-group-prepend">
									<button onclick="paymentWrapperObj.count_M();" class="btn btn-primary bootstrap-touchspin-down" type="button">-</button>
								</span>
								<input id="paymentCount" data-toggle="touchspin" type="text" value="1" class="form-control">
								<span class="input-group-btn input-group-append">
									<button onclick="paymentWrapperObj.count_P();" class="btn btn-primary bootstrap-touchspin-up" type="button">+</button>
								</span>
							</div>
						</div>
						
						<div class="col-lg-2 text-sm-end mt-2">
							<p id="payment_result" class="font-size-16 " style="float: right;">11,000 원</p>
						</div>
					</div>
					
					<div class="row mb-5">
						<div class="col-lg-6">
							<p class="font-size-14">&nbsp;&nbsp;└ 쿠폰넣으시면 됨(쿠폰 선택되면)</p>
						</div>
						<div class="col-lg-4">
						</div>
						<div class="col-lg-2 text-sm-end">
							<div class="flex-grow-1">
								<h5 class="mb-0">-1,000 원</h5>
							</div>
						</div>
					</div>
					<br>
					
					
					<div class="mt-5">
						<div></div>
					</div>
					<h5 class="font-size-13 mt-10">* 해당 상품은 1년 이내 사용이 가능합니다.</h5>
					<h5 class="font-size-13">* 할인쿠폰은 중복 적용이 불가합니다.</h5>
					<br>
					<hr>
					
					<div class="row">
						<div class="col-lg-6">
							<a href="javascript:paymentWrapperObj.goCouponeLayer();" class="card-link">할인쿠폰이 있으신가요?</a>
						</div>
						<div class="col-lg-4">
						</div>
						<div class="col-lg-2 text-sm-end">
							<div class="flex-grow-1">
								<h5 class="mb-0">10,000 원</h5>
								<p class="text-muted mb-2">(부가세 포함)</p>
							</div>
						</div>
					</div>
					
					<button type="button" id="isCoupon_btn" class="btn btn-primary waves-effect waves-light fade" data-bs-toggle="modal" data-bs-target="#myModal"
													onclick="couponModalOpen('couponModal', 0)">쿠폰확인</button>
																	
					<%--
					<div id="myModal" class="modal fade" ="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content" id="modal_content"></div>
						</div>
					</div>
					 --%>
					<hr>
					<br>
					<div class="row mb-2 mt-1">
						<div class="col-lg-2"></div>
						<div class="col-lg-8">
							<button type="button" class="btn btn-outline-success waves-effect waves-light" style="width:99%">이용권 결제하기</button>
						</div>
						<div class="col-lg-2"></div>
					</div>
					<div class="row mb-3 mt-1">
						<div class="col-lg-12">
							<p class="text-muted text-sm-center">
								<a href="javascript:paymentWrapperObj.goChangeProductPage();" class="card-link">다른 이용권으로 변경</a>
							</p>
						</div>
					</div>
				</div>
			</div>
			
			<div class="col-lg-3">
				<div></div>
			</div>
			<!-- End col -->
		</div>
		<!-- End row -->
	</div>
</div>
<script type="text/javascript">
	/** MethodNote :  paymentWrapperObj.goCouponeLayer*/
var paymentWrapperObj = {
			count_M : function(){
				//console.log($("#paymentCount").val());
				var cnt = $("#paymentCount").val();
				
				if(cnt>1) cnt = parseInt(cnt) - 1;
				$("#paymentCount").val(cnt);
				
				var pResult = (cnt * 11000).toLocaleString()+"원";
				$("#payment_result").html(pResult);
			},
			
			count_P : function(){
				console.log("=========count_P 실행");
				var cnt = $("#paymentCount").val();
				cnt = parseInt(cnt) + 1;
				$("#paymentCount").val(cnt);
				
				var pResult = (cnt * 11000).toLocaleString()+"원";
				$("#payment_result").html(pResult);
			},
	/**할인쿠폰열기 */
	goCouponeLayer:function(){
		//modalPopup.urlModalOpen("/member/popup/payment/couponModal",{"ddd":"3434"},function(){console.log("닫기콜백");});
		modalPopup.urlModalOpen("/member/popup/payment/couponModal",{"ddd":"3434"},this.count_P.bind(this));
	},
			
			
			
	/**다른 이용권으로 변경 */
	goChangeProductPage:function(){
		var params = {"goTarget":"payment_area"};
		$commonPage.url_request_post("/member/main", params, true);
	},
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
			"coupon"		:[{"couponKey":"xxxx","count":1},{"couponKey":"yyyyy","count":2}]
			,"product"		:[{"productKey": "112313","productName": "수량형", "count":10},{"productKey": "112313","productName": "구독형", "count":10}]
			,"raw_tot_amt"	: 1000
			,"discount_amt"	: 0
			,"paymented_amt": 1000
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
		var dataStr = {"data":JSON.stringify(obj)};
		var merchantUID =""; 
		$.ajax({
			url: "/member/payment/muid",
			type:"POST",
			dataType:"text",
			data:dataStr,
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
			var trimAddress = $.trim("<c:out value='${loginInfo.contactAddress}'/>");
			if(trimAddress == ""){
				trimAddress = $.trim("서울특별시 강남구 삼성동");
			}
			//경제 창에 표기할 상품명
			var paymentTitle = "정기결제권 외1개";
			var paymentRequestObj = {
					pg				: "<c:out value='${paymentGateWay}'/>",//'danal_tpay'
					pay_method		: obj.method,// card(신용카드), trans(실시간계좌이체), vbank(가상계좌), 또는 phone(휴대폰소액결제)
					merchant_uid	: merchantUID, //상점에서 생성한 고유 주문번호
					name			: paymentTitle,//'주문명:결제테스트'
					amount			: obj.totalAmount,
					buyer_email		: "<c:out value='${loginInfo.id}'/>",//'iamport@siot.do'
					buyer_name		: "<c:out value='${loginInfo.fullName}'/>",//'구매자이름'
					buyer_tel		: "<c:out value='${loginInfo.contactNumber1}'/>",//'010-1234-5678'
					//buyer_addr		: trimAddress,//'서울특별시 강남구 삼성동'
					//buyer_postcode	: ''//'123-456'
			};
			//결제창 요청
			console.log("-===================결제창 요청2");
			console.log(paymentRequestObj);
			console.log("-===================결제창 요청2");
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
