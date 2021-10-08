<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%-- 
 @author	: ccvf2.dev
 @since		: 2021. 10. 7.
 @partType	: (ex: admin | user | common | etx)
 @catgory	: (ex: 관리자 메인)
 @see		: (ex: 기타내용 기술)
 @comment	: (ex: 해당페이지에서는 자바스크립트를 최소화 하도록 합니다.-개발자 및 소스 수정자에게 전달내용)
 @desc		: 
 ***************************************
 **개정이력**
 ***************************************
 * no	수정일			수정자		수정이력
 * 1.	2021. 10. 7.	ccvf2.dev		최초작성
 ***************************************
 --%>
<%-- start page title --%>
<div class="row">
	<div class="col-12">
		<div class="page-title-box d-sm-flex align-items-center justify-content-between">
			<h4 class="mb-sm-0 font-size-18">코드그룹관리</h4>

			<div class="page-title-right">
				<ol class="breadcrumb m-0">
					<li class="breadcrumb-item"><a href="javascript: void(0);">전역관리</a></li>
					<li class="breadcrumb-item"><a href="javascript: void(0);">공통코드</a></li>
					<li class="breadcrumb-item active">코드그룹관리</li>
				</ol>
			</div>

		</div>
	</div>
</div>

<div class="row">
	<div class="col-lg-12">
		<div class="card">
			<div class="card-body">
				<h4 class="card-title">코드 그룹등록</h4>
				<p class="card-title-desc">여기서 등록</p>
				<div class="row">
					<!-- <div class="col-12"> -->
						<div class="col-lg-6">
							<div class="mb-3">
								<label for="example-text-input" class="form-label">코드그룹</label>
								<input class="form-control" type="text" id="code_group" placeholder="넘버링을 통해 고유한 코드그룹을 만드세요.">
							</div>
						</div>
						<div class="col-lg-6">
							<div class="mb-3">
								<label for="example-text-input" class="form-label">코드그룹명</label>
								<input class="form-control" type="text" id="code_group_name" placeholder="코드그룹명을 만드세요.">
							</div>
						</div>
					<!-- </div> -->
					<div class="col-lg-6">
						<div class="mb-3">
							<label for="example-text-input" class="form-label">코드그룹값</label>
							<input class="form-control" type="text" id="code_group_value" placeholder="화면에 표시될때 해당 값이 사용될 수 있음">
						</div>
					</div>
					<div class="col-lg-6">
						<div class="mb-3">
							<label for="example-text-input" class="form-label">코드그룹설명</label>
							<input class="form-control" type="text" id="code_group_comment" placeholder="해당 코드그룹에대한 상세 메세지를 적으세요.">
						</div>
					</div>
				</div>
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
				
				
			</div>
		</div>
	</div>
</div>
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
						<c:forEach var="list" items="${codeGroupList}" varStatus="index">
							<tr>
								<th scope="row">${index.count}</th>
								<td>${list.code}</td>
								<td>${list.code_name}</td>
								<td>${list.code_group_name}</td>
								<%-- <td>${list.code_group}</td> 코드그룹==코드 --%>
								<td>${list.code_value}</td>
								<td>${list.code_comment}</td>
								<td><fmt:formatDate pattern="yyyy-MM-dd hh:mm" value="${list.code_regdt}"/></td>
								<%-- <td>${list.code_regdt}</td> --%>
								<td>
									<button type="button" class="btn btn-danger btn-sm waves-effect waves-light">그룹삭제</button>
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
$(document).ready(function(){
})


var codeGroup = {
	CG_insert : function(){
		var param = {
			"code"			: ""
			, "code_name"	: ""
			, "code_value"	: ""
			, "code_comment": ""
			
		}
		param.code			= document.getElementById("code_group").value;
		param.code_name		= document.getElementById("code_group_name").value;
		param.code_value	= document.getElementById("code_group_value").value;
		param.code_comment	= document.getElementById("code_group_comment").value;
		$.ajax({
			url: "/admin/codegroupinsert.ajax",
			type:"POST",
			dataType:"TEXT",
			data:param,
			success:function(data){
				console.log(data);
			},
			error:function(xhr, status, errorMsg){
				console.log(xhr)
				console.log(status)
				console.log(errorMsg)
			}
		});
		
	},
	CG_delete : function(){
		
	}
}






var testData;
function test(){
	$.ajax({
		url: "/admin/code.ajax",
		type:"POST",
		dataType:"TEXT",
		success:function(data){
			var jsondata = JSON.parse(data);
			console.log(jsondata);
			testData=jsondata;
		},
		error:function(xhr, status, errorMsg){
			console.log(xhr)
			console.log(status)
			console.log(errorMsg)
		}
	});
}
function test2(){
	$.ajax({
		url: "/admin/codeOne.ajax",
		type:"POST",
		dataType:"TEXT",
		success:function(data){
			var jsondata = JSON.parse(data);
			console.log(data);
			console.log(jsondata);
			//testData=jsondata;
		},
		error:function(xhr, status, errorMsg){
			console.log(xhr)
			console.log(status)
			console.log(errorMsg)
		}
	});
}
</script>
