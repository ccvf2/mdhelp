<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<div class="modal fade" id="exampleModalScrollable" tabindex="-1" role="dialog" aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
	<div class="modal-dialog modal-dialog-scrollable">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title mt-0" id="exampleModalScrollableTitle">API키 수정</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<form action="/admin/apikeyUpdate" method="post" name="updateApi" id="updateApi">
				<input type="hidden" id="api_seq" name="api_seq" value="${apiKeyDTO.api_seq}" />
				<div class="modal-body">
					<div class="row">
						<div class="col-12">
							<div class="card">
								<div class="card-body">
									<div class="row">
										<div class="col-lg-6">
											<div class="form-floating mb-3">
												<select class="form-select" id="api_org" name="api_org" aria-label="Floating label select example">
													<c:forEach var="groupItem" items="${apiGroupList}" varStatus="index">
														<c:choose>
															<c:when test="${groupItem.code eq apiKeyDTO.org_id}">
																<option value="${groupItem.code}" selected="selected">
																	${groupItem.code_name}
																</option>
															</c:when>
															<c:otherwise>
																<option value="${groupItem.code}">
																	${groupItem.code_name}
																</option>
															</c:otherwise>
														</c:choose>
													</c:forEach>
												</select>
												<label for="floatingSelect">발급기관 선택</label>
											</div>
										</div>
										
										<div class="col-lg-6">
											<div class="form-floating mb-3">
												<input type="text" class="form-control" id="org_id" name="org_id"
													placeholder="name@example.com" value="${apiKeyDTO.org_id}">
												<label for="floatingInput">발급기관 아이디</label>
											</div>
										</div>
									</div>
									
									<div class="row">
										<div class="col-lg-6">
											<div class="form-floating mb-3">
												<input type="text" class="form-control" id="api_key" name="api_key"
												placeholder="API-KEY" value="${apiKeyDTO.api_key}" >
												<label for="floatingInput">API-KEY</label>
											</div>
										</div>
										<div class="col-lg-6">
											<div class="form-floating mb-3">
												<input type="text" class="form-control" id="api_value" name="api_value"
												placeholder="API-PASSWORD" value="${apiKeyDTO.api_value}">
												<label for="floatingInput">API-PASSWORD</label>
											</div>
										</div>
									</div>
					
									<div class="row">
										<div class="col-lg-6">
											<div class="form-floating mb-3">
												<input type="text" class="form-control" id="api_title" name="api_title"
													placeholder="API-TITLE" value="${apiKeyDTO.api_title}">
												<label for="floatingInput">API-TITLE</label>
											</div>
										</div>
										<div class="col-lg-6">
											<div class="form-floating">
												<select class="form-select" id="api_status" name="api_status" aria-label="Floating label select example">
													<c:forEach var="groupItem" items="${apiGroupStateList}" varStatus="index">
														<c:choose>
															<c:when test="${groupItem.code eq apiKeyDTO.api_status}">
																<option value="${groupItem.code}" selected="selected">
																	${groupItem.code_name}
																</option>
															</c:when>
															<c:otherwise>
																<option value="${groupItem.code}">
																	${groupItem.code_name}
																</option>
															</c:otherwise>
														</c:choose>
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
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-primary" onclick='updateAPI()'>수정</button>
				</div>
			</form>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<script type="text/javascript">
function updateAPI(){
	document.getElementById("updateApi").submit();
}
</script>
