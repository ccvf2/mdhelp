<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
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
<script src="/memberAssets/libs/bootstrap-touchspin/jquery.bootstrap-touchspin.min.js"></script>


<div class="card">
	<div class="card-body" style="background-color: #fff;">
		<div class="text-center mb-5">
			<h5 class="mb-3"
				style="color: #00bbbb; margin-bottom: -2.5rem !important;">요금제
				결제</h5>
			<h2 class="mt-5">우리 이제 함께해요!</h2>
		</div>
		<div class="row">
			<div class="col-lg-3">
				<div></div>
			</div>
			<!-- End col -->
	
			<div class="col-lg-6">
				<div class="mt-4 mt-lg-0">
					<h5 class="font-size-16">함께할 이용권 내역</h5>
					<hr>
					 
						<div style="float: left; width: 70%;">
							<p class="card-title-desc" style="margin-bottom: 0px; font-size: 16px; padding-top:5px;">정량제 이용권 (4,000건)</p>
						</div>
						<div class="input-group bootstrap-touchspin bootstrap-touchspin-injected" style="float: left; width: 18%;">
							<span class="input-group-btn input-group-prepend">
								<button onclick="paymentWrapperObj.count_M();" class="btn btn-primary bootstrap-touchspin-down" type="button">-</button>
							</span>
							<input id="paymentCount" data-toggle="touchspin" type="text" value="1" class="form-control">
							<span class="input-group-btn input-group-append">
								<button onclick="paymentWrapperObj.count_P();" class="btn btn-primary bootstrap-touchspin-up" type="button">+</button>
							</span>
						</div>
						<div style="float: right; width: 10%;">
							<p id="payment_result" class="card-title-desc" style="margin-bottom: 0px; font-size: 16px; margin-left: 10%; padding-top:5px;">11,000원</p>
						</div>
					
					<br>
					
					<div style="margin-top: 32%;">	
						<h5 class="font-size-13">* 해당 상품은 1년 이내 사용이 가능합니다.</h5>
						<h5 class="font-size-13">* 할인쿠폰은 중복 적용이 불가합니다.</h5>
						<br>
						
						<a href="javascript: void(0);" class="card-link">할인쿠폰이 있으신가요?</a>
						
						<hr>
						<br>
						<h2 class="mb-3" style="margin-top: 10px;">
							<button type="button" class="btn btn-outline-success waves-effect waves-light" style="width:48%;">이용권 변경</button>
							<button type="button" class="btn btn-outline-success waves-effect waves-light" style="width:48%;">결제하기</button>
						</h2>
					</div>
					
				</div>
			</div>
			<!-- End col -->
		</div>
		<!-- End row -->
	</div>
</div><!-- end card -->
<script type="text/javascript">
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
				var cnt = $("#paymentCount").val();
				cnt = parseInt(cnt) + 1;
				$("#paymentCount").val(cnt);
				
				var pResult = (cnt * 11000).toLocaleString()+"원";
				$("#payment_result").html(pResult);
			}	
	};

</script>
