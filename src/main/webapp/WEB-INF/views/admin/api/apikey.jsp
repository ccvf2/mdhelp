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

<form action="/admin/apikey" method="post" name="searchCode" id="searchCode">
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
							<label class="form-label">코드그룹</label>
							<select class="form-select" onchange="codeOBJECT.selectApiGroup(this.value);" name="searchCondition1" >
								<option value="">전체</option>
								<c:forEach var="groupItem" items="${apiList}" varStatus="index">
									<c:choose>
										<c:when test="${groupItem.API_ORG eq searchMap.searchCondition1}">
											<option value="${groupItem.API_ORG}" selected="selected">
												${groupItem.CODE_NAME}(${groupItem.API_ORG})
											</option>
										</c:when>
										<c:otherwise>
											<option value="${groupItem.API_ORG}">
												${groupItem.CODE_NAME}(${groupItem.API_ORG})
											</option>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</select>
						</div>
					</div>
					
					<div class="col-lg-4">
						<div class="mb-3">
							<label class="form-label">검색조건</label>
							<select class="form-select" name="searchCondition2" >
								
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
				</div>
			</div>
		</div>
	</div>
</div>
</form>



<c:set value="<mark>${searchMap.searchWord}</mark>" var="replaceWord" />

<script type="text/javascript">

var codeOBJECT = {
	selectApiGroup : function (obj){
		var form = document.getElementById("searchApiCode");
		form.submit(); 
	}
	
/*,
	
	targetCodeGroupChange : function(obj){
		var spArr = obj.split("/");
		document.getElementById("code_group").value = spArr[0];
		document.getElementById("code_group_name").value = spArr[1];
	},
	insert : function (){
		var valide = this.dataValidetion();
		if(valide){
			var form = document.getElementById("insertCodeForm");
			form.action="/admin/codeinsert";
			form.submit(); 
		}
	}*/
	
};
</script>