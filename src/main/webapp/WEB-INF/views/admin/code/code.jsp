<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%-- 
 @author	: ccvf2.dev
 @since		: 2021. 10. 9.
 @partType	: (ex: admin | user | common | etx)
 @catgory	: (ex: 관리자 메인)
 @see		: (ex: 기타내용 기술)
 @comment	: (ex: 해당페이지에서는 자바스크립트를 최소화 하도록 합니다.-개발자 및 소스 수정자에게 전달내용)
 @desc		: 
 ***************************************
 **개정이력**
 ***************************************
 * no	수정일			수정자		수정이력
 * 1.	2021. 10. 9.	ccvf2.dev		최초작성
 ***************************************
 --%>
<%-- start page title --%>
<div class="row">
	<div class="col-12">
		<div class="page-title-box d-sm-flex align-items-center justify-content-between">
			<h4 class="mb-sm-0 font-size-18">코드관리</h4>

			<div class="page-title-right">
				<ol class="breadcrumb m-0">
					<li class="breadcrumb-item"><a href="javascript: void(0);">전역관리</a></li>
					<li class="breadcrumb-item"><a href="javascript: void(0);">공통코드</a></li>
					<li class="breadcrumb-item active">코드관리</li>
				</ol>
			</div>

		</div>
	</div>
</div>

<div class="row">
	<div class="col-lg-12">
		<div class="card">
			<div class="card-body">
				<h4 class="card-title">검색조건</h4>
				<p class="card-title-desc">검색주의</p>
				searchCondition1	: ${searchMap.searchCondition1}<br/>
				searchCondition2	: ${searchMap.searchCondition2}<br/>
				searchWord			: ${searchMap.searchWord}/code_comment<br/>
			</div>
		</div>
	</div>
</div>


<form action="/admin/code" method="post" name="searchCode" id="searchCode">
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
							<select class="form-select" onchange="code.selectCodeGroup(this.value);" name="searchCondition1" >
								<option value="">전체</option>
								<c:forEach var="groupItem" items="${codeGroupList}" varStatus="index">
									<c:choose>
										<c:when test="${groupItem.code eq searchMap.searchCondition1}">
											<option value="${groupItem.code}" selected="selected">
												${groupItem.code_group_name}(${groupItem.code_group})
											</option>
										</c:when>
										<c:otherwise>
											<option value="${groupItem.code}">
												${groupItem.code_group_name}(${groupItem.code_group})
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
								<option value="code_name|code_value|code_comment" <c:if test='${searchMap.searchCondition2 eq "code_name|code_value|code_comment"}'>selected="selected"</c:if>>코드명+코드값+코드설명</option>
								<option value="code" <c:if test='${searchMap.searchCondition2 eq "code"}'>selected="selected"</c:if>>코드</option>
								<option value="code_name" <c:if test='${searchMap.searchCondition2 eq "code_name"}'>selected="selected"</c:if>>코드명</option>
								<option value="code_value" <c:if test='${searchMap.searchCondition2 eq "code_value"}'>selected="selected"</c:if>>코드값</option>
								<option value="code_comment" <c:if test='${searchMap.searchCondition2 eq "code_comment"}'>selected="selected"</c:if>>코드설명</option>
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
								<th>코드</th>
								<th>코드명</th>
								<th>코드그룹명</th>
								<th>코드값</th>
								<th>코드정렬값</th>
								<th>코드설명</th>
								<th>등록일</th>
								<th>삭제</th>
							</tr>
						</thead>
						<tbody>
							<%-- <tr>
								<th scope="row">1</th>
								<td>Table cell</td>
								<td>Table cell</td>
								<td>Table cell</td>
								<td>Table cell</td>
								<td>Table cell</td>
							</tr> --%>
						<c:forEach var="item" items="${codeList}" varStatus="index">
							<c:choose>
								<c:when test='${item.code_sort eq "0"}'>
							<tr class="boldFont">
								</c:when>
								<c:otherwise>
							<tr>
								</c:otherwise>
							</c:choose>
							
								<th scope="row">${index.count}</th>
								<c:choose>
									<c:when test='${searchMap.searchCondition2 eq "code" || searchMap.searchCondition2 eq "code_name|code_value|code_comment"}'>
										<td><c:out value="${fn:replace(item.code, searchMap.searchWord, replaceWord)}" escapeXml="false"/></td>
									</c:when>
									<c:otherwise>
										<td>${item.code}</td>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test='${searchMap.searchCondition2 eq "code_name" || searchMap.searchCondition2 eq "code_name|code_value|code_comment"}'>
										<td><c:out value="${fn:replace(item.code_name, searchMap.searchWord, replaceWord)}" escapeXml="false"/></td>
									</c:when>
									<c:otherwise>
										<td>${item.code_name}</td>
									</c:otherwise>
								</c:choose>
								<td>${item.code_group_name}(${item.code_group})</td>
								<%-- <td>${item.code_group}</td> 코드그룹==코드 --%>
								<c:choose>
									<c:when test='${searchMap.searchCondition2 eq "code_value" || searchMap.searchCondition2 eq "code_name|code_value|code_comment"}'>
										<td><c:out value="${fn:replace(item.code_value, searchMap.searchWord, replaceWord)}" escapeXml="false"/></td>
									</c:when>
									<c:otherwise>
										<td>${item.code_value}</td>
									</c:otherwise>
								</c:choose>
								<td>${item.code_sort}</td>
								<c:choose>
									<c:when test='${searchMap.searchCondition2 eq "code_comment" || searchMap.searchCondition2 eq "code_name|code_value|code_comment"}'>
										<td><c:out value="${fn:replace(item.code_comment, searchMap.searchWord, replaceWord)}" escapeXml="false"/></td>
									</c:when>
									<c:otherwise>
										<td>${item.code_comment}</td>
									</c:otherwise>
								</c:choose>
								<td><fmt:formatDate pattern="yyyy-MM-dd hh:mm" value="${item.code_regdt}"/></td>
								<%-- <td>${item.code_regdt}</td> --%>
								<td>
									<c:choose>
										<c:when test='${item.code_sort eq "0"}'>
											<button type="button" class="btn btn-secondary btn-sm waves-effect waves-light" disabled="disabled">
												코드삭제&nbsp;<i class="fas fa-trash-alt"></i>
											</button>
										</c:when>
										<c:otherwise>
											<button type="button" class="btn btn-danger btn-sm waves-effect waves-light">
												코드삭제&nbsp;<i class="fas fa-trash-alt"></i>
											</button>
										</c:otherwise>
									</c:choose>
									
								</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">

var code = {
	selectCodeGroup : function (obj){
		var form = document.getElementById("searchCode");
		form.submit(); 
	},
};
</script>
