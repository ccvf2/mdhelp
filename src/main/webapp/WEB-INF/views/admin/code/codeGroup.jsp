<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<!-- start page title -->
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
								<th>코드그룹명(코드그룹)</th>
								<th>코드값</th>
								<th>코드설명</th>
								<th>등록일</th>
							</tr>
						</thead>
						<tbody>
							<!-- <tr>
								<th scope="row">1</th>
								<td>Table cell</td>
								<td>Table cell</td>
								<td>Table cell</td>
								<td>Table cell</td>
								<td>Table cell</td>
							</tr> -->
						<c:forEach var="list" items="${codeGroupList}">
							<tr>
								<th scope="row">1</th>
								<td>${list.code}</td>
								<td>${list.code_name}</td>
								<td>${list.code_group_name}(${list.code_group})</td>
								<td>${list.code_value}</td>
								<td>${list.code_comment}</td>
								<td>${list.code_regdt}</td>
							</tr>
						</c:forEach>

						</tbody>
					</table>
				</div>

			</div>
		</div>
	</div>
</div>
<!-- end row -->


<!-- end page title -->
<%-- <div class="row">
<c:forEach var="list" items="${codeGroupList}">
	${list.code}/${list.code_name}/${list.code_group}/${list.code_group_name}/${list.code_value}/${list.code_comment}/${list.code_regdt}<br/>
</c:forEach>
</div> <!-- end row-->
 --%>
