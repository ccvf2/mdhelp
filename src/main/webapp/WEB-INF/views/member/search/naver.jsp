<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%-- 
 @author	: tjdrhkd
 @since		: 2021. 12. 5.
 @partType	: (ex: admin | user | common | etx)
 @catgory	: (ex: 관리자 메인)
 @see		: (ex: 기타내용 기술)
 @comment	: (ex: 해당페이지에서는 자바스크립트를 최소화 하도록 합니다.-개발자 및 소스 수정자에게 전달내용)
 @desc		: 
 ***************************************
 **개정이력**
 ***************************************
 * no	수정일			수정자		수정이력
 * 1.	2021. 12. 5.	tjdrhkd		최초작성
 ***************************************
 --%>
<!-- ============================================================== -->
<!-- Start right Content here -->
<!-- ============================================================== -->

<link rel="stylesheet" type="text/css"	href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css"	rel="stylesheet">
<!-- 
<style>

navv {
	background: #00bbbb;
	position: absolute;
	top: 120px;
	bottom: 0;
	height: 80%;
	left: 0;
	width: 70px;
	overflow: hidden;
	-webkit-transition: width .2s linear;
	transition: width .2s linear;
}

.side_bar {
	position: relative;
	text-decoration: none;
	color: white;
	font-size: 13px;
	display: table;
	width: 250px;
	border-top: 1px solid #03A2A2;
}

.fa {
	position: relative;
	width: 70px;
	height: 36px;
	text-align: center;
	top: 12px;
	font-size: 20px;
}

navv .nav-text {
	position: relative;
	top: 12px;
}

@media screen and (min-width: 992px) { 
	navv { 
		display: block; 
	} 
}

@media screen and (max-width: 993px) { 
	navv { 
		display: none; 
	} 
}

</style>


<navv>
	<div class="label"></div>
	<div class="scrollbar" id="style-1">
		<a class="side_bar" href="/member/main">
			<i class="fa fa-home fa-lg"></i> <span class="nav-text">Home</span>
		</a> 
		<a class="side_bar" href=" ">
			<i class="fa fa-user fa-lg"></i> <span class="nav-text">Profile</span>
		</a> 
		<a class="side_bar" href=" ">
			<i class="fa fa-envelope-o fa-lg"></i> <span class="nav-text">E-mail</span>
		</a>

		<div class="mid-block">
			<a class="side_bar" href=" ">
				<i class="fa fa-html5 fa-lg"></i> <span class="nav-text">HTML5</span>
			</a>
			<a class="side_bar" href=" ">
				<i class="fa fa-css3 fa-lg"></i> <span class="nav-text">CSS3</span>
			</a> 
			<a class="side_bar" href=" "> 
				<i class="fa fa-flask fa-lg"></i><span class="nav-text">Web Tools</span>
			</a> 
			<a class="side_bar" href=" "> 
				<i class="fa fa-picture-o fa-lg"></i><span class="nav-text">Art & Design</span>
			</a>
			<a class="side_bar" href=" ">
				<i class="fa fa-gamepad fa-lg"></i> <span class="nav-text">Games</span>
			</a>
		</div>
		<a class="side_bar" href=" ">
			<i class="fa fa-book fa-lg"></i> <span class="nav-text">Documentation</span>
		</a> 
		<a class="side_bar" href=" ">
			<i class="fa fa-cog fa-lg"></i><span class="nav-text">Setting</span>
		</a> 
		<a class="side_bar" href=" ">
			<i class="fa fa-question-circle fa-lg"></i><span class="nav-text">Help</span>
		</a>
	</div>
</navv>

 -->

<!-- start page title -->
<div class="row">
	<div class="col-12">
		<div class="page-title-box d-sm-flex align-items-center justify-content-between">
			<h4 class="mb-sm-0 font-size-18">최저가 상품 검색</h4>

			<div class="page-title-right">
				<ol class="breadcrumb m-0">
					<li class="breadcrumb-item active">상품검색</li>
					<li class="breadcrumb-item"><a href="javascript: void(0);">네이버 최저가</a></li>
				</ol>
			</div>
		</div>
	</div>
</div>
<!-- end page title -->

<div class="row mb-4">
	<div class="col-xl-4" style="width:18.33333%;">
		<div class="card">
			<form id="naverSearch" name="naverSearch" action="#">
				<div style="-webkit-box-flex: 1;padding: 1.25rem 1.25rem;" id="searchDiv">
					<div class="border rounded" style="margin-top: -0.5rem">
						
							<div class="px-2 py-1 bg-light">
								<div class="btn-group" role="group">
									총 검색 (0건)
								</div>
							</div>
							<textarea rows="3" id="searchArea" name="searchArea" class="form-control border-0 resize-none" style="height: 700px;" placeholder="검색코드 입력.."></textarea>
					</div>
				</div>
				<div style="text-align: center; margin-bottom: 16px;">
					<button type="button" id="searchBtn" onclick="MemberOBJECT.naverSearch()" class="btn btn-success w-lg waves-effect waves-light" style="background-color: #00bbbb;">검색시작</button>
				</div>
			</form>
		</div>
	</div>

	<div class="col-xl-8" style="width:81.66667%;">
		<div class="card mb-0">
			<!-- Nav tabs -->
			<ul class="nav nav-tabs nav-tabs-custom nav-justified" role="tablist">
				<li class="nav-item"><a class="nav-link active"
					data-bs-toggle="tab" href="#about" role="tab"> <i
						class="mdi mdi-account-circle-outline font-size-20"></i> <span
						class="d-none d-sm-block">검색</span>
				</a></li>
				
				<li class="nav-item"><a class="nav-link" data-bs-toggle="tab"
					href="#messages" role="tab"> <i
						class="mdi mdi-email-outline font-size-20"></i> <span
						class="d-none d-sm-block">검색이력(이전검색)</span>
				</a></li>
			</ul>
			<!-- Tab content -->
			<div class="tab-content p-4">
				<div class="tab-pane active" id="about" role="tabpanel">
					<div>
						<div>
							<h5 class="font-size-16 mb-4">검색결과</h5>
							
							<div class="d-flex flex-wrap gap-1">
								<button type="button" class="btn btn-outline-dark waves-effect waves-light">검색초기화</button>
								<button type="button" class="btn btn-outline-dark waves-effect waves-light">엑셀다운로드</button>
							</div>
							<hr/>
							

							<div class="table-responsive">
								<table class="table table-nowrap table-hover mb-0">
									<thead>
										<tr>
											<th scope="col">#</th>
											<th scope="col">검색코드</th>
											<th scope="col">판매처</th>
											<th scope="col">브랜드</th>
											<th scope="col">타이틀</th>
											<th scope="col">최저가</th>
											<th scope="col">상세링크</th>
											<th scope="col">네이버리스트(상품목록)</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td scope="row" colspan="8" align="center" style="text-align: center;">검색 결과가 없습니다.</td>
										</tr>
										<!-- 
										<tr>
											<td>18 Jan, 2021</td>
											<td>18 Jan, 2021</td>
											<td>18 Jan, 2021</td>
											<td>18 Jan, 2021</td>
											<td>18 Jan, 2021</td>
											<td><a href="#" class="text-dark">Brand Logo Design</a></td>
											<td>18 Jan, 2021</td>
										</tr>
										<tr>
											<th scope="row">02</th>
											<td>18 Jan, 2021</td>
											<td>18 Jan, 2021</td>
											<td>18 Jan, 2021</td>
											<td>18 Jan, 2021</td>
											<td>18 Jan, 2021</td>
											<td><a href="#" class="text-dark">Brand Logo Design</a></td>
											<td>18 Jan, 2021</td>
										</tr>
										<tr>
											<th scope="row">03</th>
											<td>18 Jan, 2021</td>
											<td>18 Jan, 2021</td>
											<td>18 Jan, 2021</td>
											<td>18 Jan, 2021</td>
											<td>18 Jan, 2021</td>
											<td><a href="#" class="text-dark">Brand Logo Design</a></td>
											<td>18 Jan, 2021</td>
										</tr>
										<tr>
											<th scope="row">04</th>
											<td>18 Jan, 2021</td>
											<td>18 Jan, 2021</td>
											<td>18 Jan, 2021</td>
											<td>18 Jan, 2021</td>
											<td>18 Jan, 2021</td>
											<td><a href="#" class="text-dark">Brand Logo Design</a></td>
											<td>18 Jan, 2021</td>
										</tr>
										<tr>
											<th scope="row">05</th>
											<td>18 Jan, 2021</td>
											<td>18 Jan, 2021</td>
											<td>18 Jan, 2021</td>
											<td>18 Jan, 2021</td>
											<td>18 Jan, 2021</td>
											<td><a href="#" class="text-dark">Brand Logo Design</a></td>
											<td>18 Jan, 2021</td>
										</tr>
										<tr>
											<th scope="row">05</th>
											<td>18 Jan, 2021</td>
											<td>18 Jan, 2021</td>
											<td>18 Jan, 2021</td>
											<td>18 Jan, 2021</td>
											<td>18 Jan, 2021</td>
											<td><a href="#" class="text-dark">Brand Logo Design</a></td>
											<td>18 Jan, 2021</td>
										</tr>
										<tr>
											<th scope="row">05</th>
											<td>18 Jan, 2021</td>
											<td>18 Jan, 2021</td>
											<td>18 Jan, 2021</td>
											<td>18 Jan, 2021</td>
											<td>18 Jan, 2021</td>
											<td><a href="#" class="text-dark">Brand Logo Design</a></td>
											<td>18 Jan, 2021</td>
										</tr>
										<tr>
											<th scope="row">05</th>
											<td>18 Jan, 2021</td>
											<td>18 Jan, 2021</td>
											<td>18 Jan, 2021</td>
											<td>18 Jan, 2021</td>
											<td>18 Jan, 2021</td>
											<td><a href="#" class="text-dark">Brand Logo Design</a></td>
											<td>18 Jan, 2021</td>
										</tr>
										<tr>
											<th scope="row">05</th>
											<td>18 Jan, 2021</td>
											<td>18 Jan, 2021</td>
											<td>18 Jan, 2021</td>
											<td>18 Jan, 2021</td>
											<td>18 Jan, 2021</td>
											<td><a href="#" class="text-dark">Brand Logo Design</a></td>
											<td>18 Jan, 2021</td>
										</tr>
										<tr>
											<th scope="row">05</th>
											<td>18 Jan, 2021</td>
											<td>18 Jan, 2021</td>
											<td>18 Jan, 2021</td>
											<td>18 Jan, 2021</td>
											<td>18 Jan, 2021</td>
											<td><a href="#" class="text-dark">Brand Logo Design</a></td>
											<td>18 Jan, 2021</td>
										</tr>
										<tr>
											<th scope="row">05</th>
											<td>18 Jan, 2021</td>
											<td>18 Jan, 2021</td>
											<td>18 Jan, 2021</td>
											<td>18 Jan, 2021</td>
											<td>18 Jan, 2021</td>
											<td><a href="#" class="text-dark">Brand Logo Design</a></td>
											<td>18 Jan, 2021</td>
										</tr>
										<tr>
											<th scope="row">05</th>
											<td>18 Jan, 2021</td>
											<td>18 Jan, 2021</td>
											<td>18 Jan, 2021</td>
											<td>18 Jan, 2021</td>
											<td>18 Jan, 2021</td>
											<td><a href="#" class="text-dark">Brand Logo Design</a></td>
											<td>18 Jan, 2021</td>
										</tr>
										<tr>
											<th scope="row">05</th>
											<td>18 Jan, 2021</td>
											<td>18 Jan, 2021</td>
											<td>18 Jan, 2021</td>
											<td>18 Jan, 2021</td>
											<td>18 Jan, 2021</td>
											<td><a href="#" class="text-dark">Brand Logo Design</a></td>
											<td>18 Jan, 2021</td>
										</tr>
										<tr>
											<th scope="row">05</th>
											<td>18 Jan, 2021</td>
											<td>18 Jan, 2021</td>
											<td>18 Jan, 2021</td>
											<td>18 Jan, 2021</td>
											<td>18 Jan, 2021</td>
											<td><a href="#" class="text-dark">Brand Logo Design</a></td>
											<td>18 Jan, 2021</td>
										</tr>
										<tr>
											<th scope="row">05</th>
											<td>18 Jan, 2021</td>
											<td>18 Jan, 2021</td>
											<td>18 Jan, 2021</td>
											<td>18 Jan, 2021</td>
											<td>18 Jan, 2021</td>
											<td><a href="#" class="text-dark">Brand Logo Design</a></td>
											<td>18 Jan, 2021</td>
										</tr>
										<tr>
											<th scope="row">05</th>
											<td>18 Jan, 2021</td>
											<td>18 Jan, 2021</td>
											<td>18 Jan, 2021</td>
											<td>18 Jan, 2021</td>
											<td>18 Jan, 2021</td>
											<td><a href="#" class="text-dark">Brand Logo Design</a></td>
											<td>18 Jan, 2021</td>
										</tr>
										<tr>
											<th scope="row">05</th>
											<td>18 Jan, 2021</td>
											<td>18 Jan, 2021</td>
											<td>18 Jan, 2021</td>
											<td>18 Jan, 2021</td>
											<td>18 Jan, 2021</td>
											<td><a href="#" class="text-dark">Brand Logo Design</a></td>
											<td>18 Jan, 2021</td>
										</tr>
										<tr>
											<th scope="row">05</th>
											<td>18 Jan, 2021</td>
											<td>18 Jan, 2021</td>
											<td>18 Jan, 2021</td>
											<td>18 Jan, 2021</td>
											<td>18 Jan, 2021</td>
											<td><a href="#" class="text-dark">Brand Logo Design</a></td>
											<td>18 Jan, 2021</td>
										</tr>
										<tr>
											<th scope="row">05</th>
											<td>18 Jan, 2021</td>
											<td>18 Jan, 2021</td>
											<td>18 Jan, 2021</td>
											<td>18 Jan, 2021</td>
											<td>18 Jan, 2021</td>
											<td><a href="#" class="text-dark">Brand Logo Design</a></td>
											<td>18 Jan, 2021</td>
										</tr>
										<tr>
											<th scope="row">05</th>
											<td>18 Jan, 2021</td>
											<td>18 Jan, 2021</td>
											<td>18 Jan, 2021</td>
											<td>18 Jan, 2021</td>
											<td>18 Jan, 2021</td>
											<td><a href="#" class="text-dark">Brand Logo Design</a></td>
											<td>18 Jan, 2021</td>
										</tr>
										<tr>
											<th scope="row">05</th>
											<td>18 Jan, 2021</td>
											<td>18 Jan, 2021</td>
											<td>18 Jan, 2021</td>
											<td>18 Jan, 2021</td>
											<td>18 Jan, 2021</td>
											<td><a href="#" class="text-dark">Brand Logo Design</a></td>
											<td>18 Jan, 2021</td>
										</tr>
										<tr>
											<th scope="row">05</th>
											<td>18 Jan, 2021</td>
											<td>18 Jan, 2021</td>
											<td>18 Jan, 2021</td>
											<td>18 Jan, 2021</td>
											<td>18 Jan, 2021</td>
											<td><a href="#" class="text-dark">Brand Logo Design</a></td>
											<td>18 Jan, 2021</td>
										</tr>
										<tr>
											<th scope="row">05</th>
											<td>18 Jan, 2021</td>
											<td>18 Jan, 2021</td>
											<td>18 Jan, 2021</td>
											<td>18 Jan, 2021</td>
											<td>18 Jan, 2021</td>
											<td><a href="#" class="text-dark">Brand Logo Design</a></td>
											<td>18 Jan, 2021</td>
										</tr>
										<tr>
											<th scope="row">05</th>
											<td>18 Jan, 2021</td>
											<td>18 Jan, 2021</td>
											<td>18 Jan, 2021</td>
											<td>18 Jan, 2021</td>
											<td>18 Jan, 2021</td>
											<td><a href="#" class="text-dark">Brand Logo Design</a></td>
											<td>18 Jan, 2021</td>
										</tr> -->
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
				
				
				
				<div class="tab-pane" id="messages" role="tabpanel">
					<div>
						<div data-simplebar style="max-height: 700px;">
							<div class="me-3">
								<div class="d-flex align-items-start border-bottom py-4">
									<div class="flex-grow-1">
										<h5 class="font-size-15 mt-0 mb-1">
											2021.12.03 - 11:40:00 검색 (총 <font color="red">552</font>건) <small class="text-muted float-end">3시간전</small>
											<a href="javascript: void(0);" class="text-muted font-13 d-inline-block"><i class="mdi mdi-book-clock-outline"></i> 목록 확인</a>
										</h5>
										
										
									</div>
								</div>
								
								<div class="d-flex align-items-start border-bottom py-4">
									<div class="flex-grow-1">
										<h5 class="font-size-15 mt-0 mb-1">
											2021.12.03 - 10:20:11 검색 (총 <font color="red">580</font>건)<small class="text-muted float-end">6시간전</small>
											<a href="javascript: void(0);" class="text-muted font-13 d-inline-block"><i class="mdi mdi-book-clock-outline"></i> 목록 확인</a>
										</h5>
									</div>
								</div>
								
								<div class="d-flex align-items-start border-bottom py-4">
									<div class="flex-grow-1">
										<h5 class="font-size-15 mt-0 mb-1">
											2021.12.02 - 18:30:00 검색 (총 <font color="red">1819</font>건)<small class="text-muted float-end">1일전</small>
											<a href="javascript: void(0);" class="text-muted font-13 d-inline-block"><i class="mdi mdi-book-clock-outline"></i> 목록 확인</a>
										</h5>
									</div>
								</div>
								
								<div class="d-flex align-items-start border-bottom py-4">
									<div class="flex-grow-1">
										<h5 class="font-size-15 mt-0 mb-1">
											2021.12.02 - 15:28:29검색 (총 <font color="red">322</font>건)<small class="text-muted float-end">1일전</small>
											<a href="javascript: void(0);" class="text-muted font-13 d-inline-block"><i class="mdi mdi-book-clock-outline"></i> 목록 확인</a>
										</h5>
									</div>
								</div>
								
								<div class="d-flex align-items-start border-bottom py-4">
									<div class="flex-grow-1">
										<h5 class="font-size-15 mt-0 mb-1">
											2021.12.01 - 13:30:29 검색 (총 <font color="red">105</font>건)<small class="text-muted float-end">2일전</small>
											<a href="javascript: void(0);" class="text-muted font-13 d-inline-block"><i class="mdi mdi-book-clock-outline"></i> 목록 확인</a>
										</h5>
									</div>
								</div>
								
							</div>
						</div>
						<!-- end .border-->
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- end main content-->

<script type="text/javascript">

$( document ).ready(function() {
	$("#searchDiv").removeClass("flex");
});


var MemberOBJECT = {
	naverSearch : function (){
		var form = document.getElementById("naverSearch");
		//form.submit();
		//alert("검색버튼 클릭");
		
		var searchArea = document.getElementById("searchArea");
		
		console.log(searchArea.value);
		
		var searchAreaTxt = searchArea.value;
		searchAreaTxt = searchAreaTxt.replace(/(?:\r\n|\r|\n)/g, '<br>');

		var searchArr = searchAreaTxt.split('<br>');
		//console.log(searchArr);
		
		/////////////////////////////// 여기서 현재 자신의 검색 잔여량 체크 한번하고 건수 넘기면 짤린다고 경고 문구나 다시 입력하도록 유도(컨펌창 띄우면 될듯)
		//console.log(searchList.length);// 검색 요청 건수
		
		var searchList = [];
		for(var i=0; i<searchArr.length; i+=9) searchList.push(searchArr.slice(i, i+9));
		console.log(searchList)
		
		
		
		for(var i=0; i<searchList.length; i++){
			var param = {"searchList":searchList[i]};
			
			$.ajax({
				url : "/member/search/naverSearch",
				type : "POST",
				dataType : "TEXT",
				data : param,
				async : false,
				success:function(data){
					console.log("success:function [i = " + i + "]");
					console.log(data);
					//var form = document.getElementById("searchCode");
					//form.submit();
				},
				error:function(xhr, status, errorMsg){
					alert("등록 실패 되었습니다.");
					console.log(xhr)
					console.log(status)
					console.log(errorMsg)
				}
			});
		}
	}
}
</script>

