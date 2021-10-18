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
<form method="post" name="insertCodeForm" id="insertCodeForm" onsubmit="return false">
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
<input type="hidden" id="code_group" name="code_group" value="" />
<input type="hidden" id="code_group_name" name="code_group_name" value="" />
<div class="row">
	<div class="col-lg-12">
		<div class="card">
			<div class="card-body">
				<h4 class="card-title">코드등록</h4>
				<p class="card-title-desc">코드등록에 주의 하세요.</p>
				<div class="row">
					<div class="col-lg-2">
						<div class="mb-3">
							<label for="example-text-input" class="form-label">코드그룹</label>
							<select class="form-select" name="" onchange="codeOBJECT.targetCodeGroupChange(this.value);">
									<option value="/">선택하세요.</option>
								<c:forEach var="groupItem" items="${codeGroupList}" varStatus="index">
									<option value="${groupItem.code_group}/${groupItem.code_group_name}" title="${groupItem.code_group_name}">
										${groupItem.code_group_name}(${groupItem.code_group})
									</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="col-lg-2">
						<div class="mb-3">
							<label for="example-text-input" class="form-label">코드</label>
							<input class="form-control" type="text" name="code" value="" id="example-text-input" maxlength="8">
						</div>
					</div>
					<div class="col-lg-2">
						<div class="mb-3">
							<label for="example-text-input" class="form-label">코드명</label>
							<input class="form-control" type="text" name="code_name" value="" id="example-text-input">
						</div>
					</div>
					<div class="col-lg-2">
						<div class="mb-3">
							<label for="example-text-input" class="form-label">코드값</label>
							<input class="form-control" type="text" name="code_value" value="" id="example-text-input">
						</div>
					</div>
					<div class="col-lg-2">
						<div class="mb-3">
							<label for="example-text-input" class="form-label">코드정렬</label>
							<input class="form-control" type="text" name="code_sort" value="" id="example-text-input">
						</div>
					</div>
					<div class="col-lg-2">
						<div class="mb-3">
							<label for="example-text-input" class="form-label">코드설명</label>
							<input class="form-control" type="text" name="code_comment" value="" id="example-text-input">
						</div>
					</div>
					<div class="col-lg-12">
						<div class="mb-3">
							<button type="button" class="btn btn-primary waves-effect waves-light" onclick="codeOBJECT.insert();">등록/수정</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</form>

<form action="/admin/code" method="post" name="searchCode" id="searchCode">
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
							<select class="form-select" onchange="codeOBJECT.selectCodeGroup(this.value);" name="searchCondition1" >
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
											<button type="button" class="btn btn-secondary btn-sm waves-effect waves-light" onclick="codeOBJECT.codeDeleteDisable();">
												코드삭제&nbsp;<i class="fas fa-trash-alt"></i>
											</button>
										</c:when>
										<c:otherwise>
											<button type="button" class="btn btn-danger btn-sm waves-effect waves-light" onclick="codeOBJECT.codeDelete('${item.code_name}','${item.code}')">
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

var codeOBJECT = {
	selectCodeGroup : function (obj){
		var form = document.getElementById("searchCode");
		form.submit(); 
	},
	
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
	},
	
	
	
	dataValidetion : function (){
		var validResult = true;
		
		var code_group = $('[name="code_group"]').val();
		if( (validResult == true)&&(code_group == "") ){
			validResult = false;
			alert("코드그룹 미선택");
		}
		
		var code = $('[name="code"]').val();
		if( (validResult == true)&&(code == "") ){
			validResult = false;
			alert("코드미입력");
		}
		if( (validResult == true)&&(code.length>8) ){
			validResult = false;
			alert("코드는 8자리 까지 생성");
		}
		var code_name = $('[name="code_name"]').val();
		if( (validResult == true)&&(code_name == "") ){
			validResult = false;
			alert("코드명미입력");
		}
		var code_value = $('[name="code_value"]').val();
		if( (validResult == true)&&(code_value == "") ){
			validResult = false;
			alert("코드값미입력");
		}
		var code_sort = $('[name="code_sort"]').val();
		if( (validResult == true)&&(code_sort == "") ){
			validResult = false;
			alert("코드정렬 미입력");
		}
		if( (validResult == true)&&(isNaN(Number(code_sort))) ){
			validResult = false;
			alert("코드정렬 숫자만 입력");
		}
		if( (validResult == true)&&(Number(code_sort) <= 0) ){
			validResult = false;
			alert("코드정렬 은 1이상 정수로 입력");
		}
		return validResult;
	},
	
	codeDeleteDisable : function(){
		alert("해당코드는 코드그룹에서 수정 가능합니다.");
	},
	codeDelete : function(codeName,code){
		var confirmYN = confirm("정말로\""+code+"("+codeName+")"+"\"코드를 삭제 하시겠습니까? 삭제된 코드는 복구 될 수 없으며, 참조값이 존재하는 경우 삭제 될 수 없습니다.");
		if(confirmYN){
			var param ={"code":code};
			param["${_csrf.parameterName}"] ="${_csrf.token}";
			
			$.ajax({
				url: "/admin/codedelete",
				type:"POST",
				dataType:"TEXT",
				data:param,
				success:function(data){
					var form = document.getElementById("searchCode");
					form.submit();
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
	
};
</script>