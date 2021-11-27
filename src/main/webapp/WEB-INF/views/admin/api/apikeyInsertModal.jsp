<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="modal fade" id="exampleModalScrollable" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
	<div class="modal-dialog modal-dialog-scrollable">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title mt-0" id="exampleModalScrollableTitle">API키 등록</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div class="row">
					<div class="col-12">
						<div class="card">
							<div class="card-body">
								<div class="row">
									<div class="col-lg-6">
										<div class="form-floating">
											<select class="form-select" id="floatingSelect" aria-label="Floating label select example">
												<option value="1">네이버</option>
											</select>
											<label for="floatingSelect">발급기관 선택</label>
										</div>
									</div>
									
									<div class="col-lg-6">
										<div class="form-floating mb-3">
											<input type="email" class="form-control" id="floatingInput"
												placeholder="name@example.com">
											<label for="floatingInput">등록자 이메일</label>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-lg-6">
										<div class="form-floating mb-3">
											<input type="email" class="form-control" id="floatingInput"
												placeholder="name@example.com">
											<label for="floatingInput">API-KEY</label>
										</div>
									</div>
									<div class="col-lg-6">
										<div class="form-floating mb-3">
											<input type="email" class="form-control" id="floatingInput"
												placeholder="name@example.com">
											<label for="floatingInput">API-PASSWORD</label>
										</div>
									</div>
								</div>
				
								<div class="row">
									<div class="col-lg-6">
										<div class="form-floating mb-3">
											<input type="email" class="form-control" id="floatingInput"
												placeholder="name@example.com">
											<label for="floatingInput">API-TITLE</label>
										</div>
									</div>
									<div class="col-lg-6">
										<div class="form-floating">
											<select class="form-select" id="floatingSelect" aria-label="Floating label select example">
												<c:forEach var="groupItem" items="${apiGroupStateList}" varStatus="index">
													<option value="${groupItem.code}">
														${groupItem.code_name}
													</option>
												</c:forEach>
											</select>
											<label for="floatingSelect">사용상태</label>
										</div>
									</div>
								</div>
							</div><%%>
				
						</div>
					</div> <!-- end col -->
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
				<button type="button" class="btn btn-primary">등록</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->