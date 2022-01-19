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
							<a href="javascript: couponCall();" class="card-link">할인쿠폰이 있으신가요?</a>
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
																	
					<div id="myModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content" id="modal_content"></div>
						</div>
					</div>
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
								<a href="/member/main" class="card-link">다른 이용권으로 변경</a>
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

	function couponModalOpen(api_url, param){
		var param;
		param = {"ddd":param};
		
		
		$.ajax({
			url: "/member/popup/payment/" + api_url,
			type:"GET",
			
			dataType:"TEXT",
			data:param,
			success:function(data){
				console.log(data);
				$("#modal_content").html("");
				$("#modal_content").html(data);
			},
			error:function(xhr, status, errorMsg){
				alert("등록 실패 되었습니다.");
				console.log(xhr)
				console.log(status)
				console.log(errorMsg)
			}
		});
	}
	
	function couponCall(){
		$("#isCoupon_btn").click();
	}
	
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
