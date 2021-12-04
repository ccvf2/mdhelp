<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%-- 
 @author	: tjdrhkd.dev
 @since		: 2021. 10. 24.
 @partType	: (ex: admin | user | common | etx)
 @catgory	: (ex: 관리자 메인)
 @see		: (ex: 기타내용 기술)
 @comment	: (ex: 해당페이지에서는 자바스크립트를 최소화 하도록 합니다.-개발자 및 소스 수정자에게 전달내용)
 @desc		: 
 ***************************************
 **개정이력**
 ***************************************
 * no	수정일			수정자			수정이력
 * 1.	2021. 10. 24.	tjdrhkd.dev		최초작성
 ***************************************
 --%>
<%-- start page title --%>
<div class="row">
	<div class="col-12">
		<div class="page-title-box d-sm-flex align-items-center justify-content-between">
			<h4 class="mb-sm-0 font-size-18">API-KEY 코드관리</h4>

			<div class="page-title-right">
				<ol class="breadcrumb m-0">
					<li class="breadcrumb-item"><a href="javascript: void(0);">전역관리</a></li>
					<li class="breadcrumb-item"><a href="javascript: void(0);">공통코드</a></li>
					<li class="breadcrumb-item active">API-KEY 코드관리</li>
				</ol>
			</div>

		</div>
	</div>
</div>


<form action="/admin/searchApiList" method="post" name="searchApiCode" id="searchApiCode">
<input type="hidden"  name="${_csrf.parameterName}" value="${_csrf.token}" />
<div class="row">
	<div class="col-lg-12">
		<div class="card">
			<div class="card-body">
				<h4 class="card-title">검색조건</h4>
				<p class="card-title-desc">검색주의</p>
				<div class="row">
					<div class="col-lg-2">
						<div class="mb-3">
							<label class="form-label">API키 발급기관</label>
							<select class="form-select" onchange="codeOBJECT.selectApiGroup(this.value);" name="searchCondition1" >
								<option value="">전체</option>
								<c:forEach var="groupItem" items="${apiGroupList}" varStatus="index">
									<c:choose>
										<c:when test="${groupItem.code eq searchMap.searchCondition1}">
											<option value="${groupItem.code}" selected="selected">
												${groupItem.code}(${groupItem.code_name})
											</option>
										</c:when>
										<c:otherwise>
											<option value="${groupItem.code}">
												${groupItem.code}(${groupItem.code_name})
											</option>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</select>
						</div>
					</div>
					
					<div class="col-lg-2">
						<div class="mb-3">
							<label class="form-label">사용유무</label>
							<select class="form-select" onchange="codeOBJECT.selectApiGroupState(this.value);" name="searchCondition2" >
								<option value="">전체</option>
								<c:forEach var="groupItem" items="${apiGroupStateList}" varStatus="index">
									<c:choose>
										<c:when test="${groupItem.code eq searchMap.searchCondition2}">
											<option value="${groupItem.code}" selected="selected">
												${groupItem.code}(${groupItem.code_name})
											</option>
										</c:when>
										<c:otherwise>
											<option value="${groupItem.code}">
												${groupItem.code}(${groupItem.code_name})
											</option>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</select>
						</div>
					</div>
					
					
					<div class="col-lg-2">
						<div class="mb-3">
							<label class="form-label">검색조건</label>
							<select class="form-select" name="searchCondition3" >
								<option value="all" <c:if test='${searchMap.searchCondition2 eq "code_name|code_value|code_comment"}'>selected="selected"</c:if>>등록자 + 타이틀 + API_Key</option>
								<option value="org_id" <c:if test='${searchMap.searchCondition3 eq "org_id"}'>selected="selected"</c:if>>등록자</option>
								<option value="api_title" <c:if test='${searchMap.searchCondition3 eq "code_name"}'>selected="selected"</c:if>>타이틀</option>
								<option value="api_key" <c:if test='${searchMap.searchCondition3 eq "code_value"}'>selected="selected"</c:if>>API_Key</option>
							</select>
						</div>
					</div>
					
					
					<div class="col-lg-6">
						<div class="mb-3">
							<label for="example-search-input" class="form-label">검색어</label>
							<div class="input-group">
							<input class="form-control" type="search" value="${searchMap.searchWord}" id="" name="searchWord">
							<button type="submit" class="btn btn-primary waves-effect waves-light"><i class="fas fa-search"></i>&nbsp;검색</button>
							</div>
						</div>
					</div>
					
					<div class="col-lg-12">
						<div class="card overflow-hidden" id="placeholder">
							<div class="card" id="modals">
								<div class="card-body">
									<h4 class="card-title mb-4">API키 등록</h4>
									<button type="button" id="apikeyInsertModal_btn" class="btn btn-primary waves-effect waves-light" data-bs-toggle="modal" data-bs-target="#myModal"
												onclick="apiModalOpen('apikeyInsertModal', 0)">API키 등록</button>
												
									<button type="button" id="apikeyUpdatetModal_btn" class="btn btn-primary waves-effect waves-light" data-bs-toggle="modal" data-bs-target="#myModal"
												data-bs-toggle="modal" data-bs-target="#exampleModalScrollable">API키 수정</button>
																
									 <div id="myModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
										<div class="modal-dialog">
											<div class="modal-content" id="modal_content"></div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					
					
					
				</div>
			</div>
		</div>
	</div>
</div>
</form>

<div class="row">
	<div class="col-lg-12">
		<div class="card">
			<div class="card-body">
				<h4 class="card-title">검색결과</h4>
				<p class="card-title-desc">검색결과입니다.</p>
				<div class="table-responsive">
					<table class="table table-hover mb-0">
						<thead class="table-light">
							<tr>
								<th>no</th>
								<th>발급기관</th>
								<th>등록자</th>
								<th>API_TITLE</th>
								<th>API_KEY</th>
								<th>API_PASSWORD</th>
								<th>사용상태</th>
								<th>등록일</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach var="item" items="${apiList}" varStatus="index">
							<tr onclick="apiModalOpen('apikeyUpdateModal', ${item.api_seq})">
								<th scope="row">${index.count}</th>
								<td>${item.api_org}</td>
								<td>${item.org_id}</td>
								<td>${item.api_title}</td>
								<td>${item.api_key}</td>
								<td>${item.api_value}</td>
								<td>${item.api_status}</td>
								<td><fmt:formatDate pattern="yyyy-MM-dd hh:mm" value="${item.api_regdt}"/></td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>

<c:set value="<mark>${searchMap.searchWord}</mark>" var="replaceWord" />

<script type="text/javascript">

$( document ).ready(function() {
    $("#apikeyUpdatetModal_btn").hide();
});


function apiModalOpen(api_url, param){
	var param;
	if(api_url=="apikeyInsertModal"){
		param = {"api_seq":param};
	}else if(api_url=="apikeyUpdateModal"){
		param = {"api_seq":param};
	}
	console.log(param);
	
	$.ajax({
		url: "/admin/popup/" + api_url,
		type:"GET",
		
		dataType:"TEXT",
		data:param,
		success:function(data){
			console.log(data);
			$("#modal_content").html("");
			$("#modal_content").html(data);
			
			if(api_url=="apikeyUpdateModal"){
				$("#apikeyUpdatetModal_btn").click();
			}
		},
		error:function(xhr, status, errorMsg){
			alert("등록 실패 되었습니다.");
			console.log(xhr)
			console.log(status)
			console.log(errorMsg)
		}
	});
}

var codeOBJECT = {
	selectApiGroup : function (obj){
		var form = document.getElementById("searchApiCode");
		form.submit(); 
	},
	selectApiGroupState : function (obj){
		var form = document.getElementById("searchApiCode");
		form.submit();	
	}
};

</script>