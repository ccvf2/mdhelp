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
					<div class="col-lg-12">
						<div class="mb-3">
							<button type="button" class="btn btn-primary waves-effect waves-light" onclick="codeGroup.CG_insert();">등록하기</button>
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
				<h4 class="card-title">검색결과</h4>
				<p class="card-title-desc">검색결과입니다.</p>
				<div class="table-responsive">
					<table class="table table-hover mb-0">
						<thead class="table-light">
							<tr>
								<th>no</th>
								<th>코드그룹</th>
								<!-- <th>코드명</th> -->
								<th>코드그룹명</th>
								<th>코드그룹값</th>
								<th>코드그룹설명</th>
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
								<%-- <td>${list.code_name}</td> --%>
								<td>${list.code_group_name}</td>
								<%-- <td>${list.code_group}</td> 코드그룹==코드 --%>
								<td>${list.code_value}</td>
								<td>${list.code_comment}</td>
								<td><fmt:formatDate pattern="yyyy-MM-dd hh:mm" value="${list.code_regdt}"/></td>
								<%-- <td>${list.code_regdt}</td> --%>
								<td>
									<button type="button" class="btn btn-danger btn-sm waves-effect waves-light" onclick="codeGroup.CG_delete('${list.code}');">그룹삭제</button>
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
	getInputValue : function(){
		var obj = {
			"code"			: document.getElementById("code_group").value
			, "code_name"	: document.getElementById("code_group_name").value
			, "code_value"	: document.getElementById("code_group_value").value
			, "code_comment": document.getElementById("code_group_comment").value
		};
		//TO-DO  trim 처리 필요
		return obj
	},
	valueDataValidation : function(obj){
		var resultValue = true;
		if(obj.code == ""){
			resultValue = false;;
			alert("코드가 입력되지 않았습니다.");
		}
		else if(obj.code.length <= 4){
			resultValue = false;;
			alert("코드가 너무 잛습니다. 5자 이상으로 작성하세요.");
		}
		
		else if(obj.code_name == ""){
			resultValue = false;;
			alert("코드명이 입력되지 않았습니다.");
		}
		else if(obj.code_value == ""){
			resultValue = false;;
			alert("코드값이 입력되지 않았습니다.");
		}
		else if(obj.code_value == ""){
			resultValue = false;;
			alert("코드코멘트가 입력되지 않았습니다.");
		}
		
		return resultValue;
	},
	CG_insert : function(){
		var param = this.getInputValue();
		var valid = this.valueDataValidation(param);
		if(valid){
			$.ajax({
				url: "/admin/codegroupinsert.ajax",
				type:"POST",
				dataType:"TEXT",
				data:param,
				success:function(data){
					alert("등록되었습니다.새로고침 하세요.");
				},
				error:function(xhr, status, errorMsg){
					alert("등록 실패 되었습니다.");
					console.log(xhr)
					console.log(status)
					console.log(errorMsg)
				}
			});
		}
	},
	CG_delete : function(code){
		//TO-DO  code trim 처리 필요
		alert(code);
		var param = {"code" : code};
		$.ajax({
			url: "/admin/codegroupdelete.ajax",
			type:"POST",
			dataType:"TEXT",
			data:param,
			success:function(data){
				alert("삭제되었습니다.새로고침 하세요.");
			},
			error:function(xhr, status, errorMsg){
				alert("삭제되지 않았습니아.!");
				console.log(xhr)
				console.log(status)
				console.log(errorMsg)
			}
		});
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
