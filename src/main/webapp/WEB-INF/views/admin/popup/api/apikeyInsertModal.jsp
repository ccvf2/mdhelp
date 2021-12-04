<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<form action="/admin/apikeyInsert" method="post" name="insertApi" id="insertApi">
	<div class="row">
		<div class="col-12">
			<div class="card">
				<div class="card-body">
					<h4 class="card-title">API 등록</h4>
					<p class="card-title-desc"></p>
					<div class="row">
						<div class="col-lg-6">
							<div class="form-floating mb-3">
								<select class="form-select" id="api_org" name="api_org" aria-label="Floating label select example">
									<c:forEach var="groupItem1" items="${apiGroupList}" varStatus="index">
										<option value="${groupItem1.code}">
											${groupItem1.code_name}
										</option>
									</c:forEach>
								</select>
								<label for="floatingSelect">발급기관 선택</label>
							</div>
						</div>
						
						<div class="col-lg-6">
							<div class="form-floating mb-3">
								<input type="text" class="form-control" id="org_id" name="org_id"
									placeholder="name@example.com">
								<label for="floatingInput">발급기관 아이디</label>
							</div>
						</div>
					</div>
					
					<div class="row">
						<div class="col-lg-6">
							<div class="form-floating mb-3">
								<input type="text" class="form-control" id="api_key" name="api_key"
								placeholder="API-KEY">
								<label for="floatingInput">API-KEY</label>
							</div>
						</div>
						<div class="col-lg-6">
							<div class="form-floating mb-3">
								<input type="text" class="form-control" id="api_value" name="api_value"
								placeholder="API-PASSWORD">
								<label for="floatingInput">API-PASSWORD</label>
							</div>
						</div>
					</div>
	
					<div class="row">
						<div class="col-lg-6">
							<div class="form-floating mb-3">
								<input type="text" class="form-control" id="api_title" name="api_title"
									placeholder="API-TITLE">
								<label for="floatingInput">API-TITLE</label>
							</div>
						</div>
						<div class="col-lg-6">
							<div class="form-floating">
								<select class="form-select" id="api_status" name="api_status" aria-label="Floating label select example">
									<c:forEach var="groupItem2" items="${apiGroupStateList}" varStatus="index">
										<option value="${groupItem2.code}">
											${groupItem2.code_name}
										</option>
									</c:forEach>
								</select>
								<label for="floatingSelect">사용상태</label>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div> <!-- end col -->
	</div>
					
	<div class="modal-footer">
		<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
		<button type="submit" class="btn btn-primary">등록</button>
	</div>
</form>