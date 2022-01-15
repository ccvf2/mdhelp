<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<form>
	<div class="row">
		<div class="col-12">
			<div class="card">
				<div class="card-body">
				    <h4 class="card-title">사용 가능한 쿠폰</h4>
				    <hr>
				    
			        <div class="table-responsive">
			            <table class="table table-hover mb-0">
			                <thead>
			                    <tr>
			                        <th>#</th>
			                        <th>쿠폰 이름</th>
			                        <th>할인률</th>
			                    </tr>
			                </thead>
			                <tbody>
			                    <tr>
			                        <th scope="row">1</th>
			                        <td>ㅇㅇ 쿠폰</td>
			                        <td>5%</td>
			                    </tr>
			                    <tr>
			                        <th scope="row">2</th>
			                        <td>ㄴㄴ 쿠폰</td>
			                        <td>11%</td>
			                    </tr>
			                    <tr>
			                        <th scope="row">3</th>
			                        <td>ㄹㄹ 쿠폰</td>
			                        <td>15%</td>
			                    </tr>
			                </tbody>
			            </table>
			        </div>
			    </div>
			</div>
		</div> <!-- end col -->
	</div>
					
	<div class="modal-footer">
		<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
		<button type="submit" class="btn btn-primary">적용</button>
	</div>
</form>

