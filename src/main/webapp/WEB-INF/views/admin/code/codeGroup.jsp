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
<h2>코그드룹</h2>
<div>
<c:forEach var="list" items="${codeGroupList}">
	${list.code}/${list.code_name}/${list.code_group}/${list.code_group_name}/${list.code_value}/${list.code_comment}/${list.code_regdt}<br/>
</c:forEach>

</div>