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

<!-- 
CZ1YMR913
CY1WE0855
CY1YM3812
CY1YMP383
CY2YM3822
CY2YM3833
CZ2AE0698
CZ2YM3922
CY1YL3803
CY1YL3812
CY1YLG320
CZ1RR1017
CZ1WR0200
CZ1YL1901
CZ1YL3904
CZ1YLM300
CZ1YLM600
CY2AR1118
CY2YL3822
CY2YL3832
CY2YL3833
CZ2YL3921
CZ2KR1018
CZ2YL1921
CZ2YL3931
CZ2YL3932
CZ2YLM320
CY2YM6822
CZ2YMR912
CZ1YM6911

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

<div class="row">
	<div class="col-lg-2">
		<div class="card">
			<form id="naverSearch" name="naverSearch" action="#">
				<div class="border rounded">
					
						<div class="px-2 py-1 bg-light">
							<div class="btn-group" role="group">
								총 검색 (0건)
							</div>
						</div>
						<textarea rows="3" id="searchArea" name="searchArea" class="form-control border-0 resize-none" style="height: 700px;" placeholder="검색코드 입력.."></textarea>
				</div>
				<div style="text-align: center; margin-bottom: 16px;">
					<button type="button" id="searchBtn" onclick="MemberOBJECT.naverSearch()" class="btn btn-outline-success w-lg waves-effect waves-light">검색시작</button>
				</div>
			</form>
		</div>
	</div>

	<div class="col-lg-10">
		<div class="row mt-0">
			<div class="col-lg-12">
				<div class="mt-0">
					<!-- Nav tabs -->
					<ul class="nav nav-tabs nav-tabs-custom nav-justified" role="tablist">
						<li class="nav-item">
							<a class="nav-link active" data-bs-toggle="tab" href="#search" role="tab" aria-selected="true">
								<i class="mdi mdi-account-circle-outline font-size-20"></i> 
								<span class="d-none d-sm-block">검색</span>
							</a>
						</li>
						
						<li class="nav-item">
							<a class="nav-link" data-bs-toggle="tab" href="#history" role="tab" aria-selected="false">
								<i class="mdi mdi-email-outline font-size-20"></i>
								<span class="d-none d-sm-block">검색이력(이전검색)</span>
							</a>
						</li>
					</ul>
					
					<!-- Tab panes -->
					<div class="tab-content p-3 text-muted">
						<div class="tab-pane active" id="search" role="tabpanel">
							<h5 class="font-size-16 mb-4">검색결과</h5>
							
							<div class="d-flex flex-wrap gap-1 mb-3">
								<button type="button" class="btn btn-outline-success waves-effect waves-light">검색초기화</button>
								<button type="button" class="btn btn-outline-success waves-effect waves-light">엑셀다운로드</button>
							</div>
							
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
									</tbody>
								</table>
							</div>
						</div>
						<div class="tab-pane" id="history" role="tabpanel">
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
				</div>
			</div><!-- End col -->
		</div>
	</div>
</div>
<!-- end main content-->

<script type="text/javascript">
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

