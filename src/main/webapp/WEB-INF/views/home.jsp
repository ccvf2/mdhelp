<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<html>
<head>
	<link rel="shortcut icon" href="/memberAssets/images/favicon.ico">
	<title>Home</title>
</head>
<body>
<h1>
	루트 페이지 (개발중 테스트페이지로 이용)
</h1>

<P>  The time on the server is ${serverTime}. </P>

<div>
	<sec:authentication property="principal" var="loginInfo"/>
	loginInfo:${loginInfo eq "anonymousUser" or loginInfo eq ""}<br/> 
	sessionScope :${sessionScope}<br/><br/>
	<%-- 
		USER:${loginInfo.fullName}<br/><br/>
		loginInfo:${loginInfo}<br/>
 
	<%-- 	USER:${loginInfo.fullName}<br/><br/>
	USER:${loginInfo.fullName}<br/><br/>
	principal:${loginInfo.userNumber}<br/><br/>
	sessionScope.SPRING_SECURITY_CONTEXT :${sessionScope.SPRING_SECURITY_CONTEXT}<br/><br/>
	sessionScope.SPRING_SECURITY_CONTEXT.getPrincipal :${sessionScope.SPRING_SECURITY_CONTEXT.Principal}<br/><br/>
	sessionScope :${sessionScope.UserInfo.userNumber}<br/><br/> --%>
	 
	서비스모드:${serviceMode}<br/><br/>
	상태:&nbsp;
	<c:choose>
		<c:when test='${loginName eq "" }'>
			비로그인
		</c:when>
		<c:otherwise>
			${loginName}로 로그인
			
		</c:otherwise>
	</c:choose>
	<br/>
	권한 : ${authorities}
	<br/>
	권한상세 : ${authoritiesDetail}
</div>
	<h2>공통</h2>
	<c:choose>
		<c:when test='${loginName eq "" }'>
			<a href="/member/sign/signin">공통-로그인</a><br/>
		</c:when>
		<c:otherwise>
			<a href="/member/sign/signout">공통-로그아웃</a><br/>
		</c:otherwise>
	</c:choose>
	<h2>관리자</h2>
	<a href="/admin/main">관리자-메인</a><br/>
	<!-- <a href="/admin/login">관리자-로그인</a><br/> -->
	<a href="/admin/codegroup">관리자-코드그룹</a><br/>
	<a href="/admin/code">관리자-코드</a><br/>
	<hr/>
	<h2>사용자</h2>
	<a href="/member/main">사용자-메인</a><br/>
	<a href="/member/search/naver">사용자-검색화면</a><br/>
	<a href="/member/sign/signup">사용자-회원가입</a><br/>
	<a href="/member/payment/page">결제모듈 연동</a><br/>
	<a href="/member/gomail">메일보내기</a><br/>
	<hr/>
	관리자 계정 : ccvf2@naver.com / 123456<br/>
	사용자 계정 : user@user.com / 123456<br/>
	디비 참조
	<hr/>
	<h2>공통 모달 호출 방법</h2>
	modalPopup.urlModalOpen("url","전달 파라메터","닫을떄 호출될 콜백");<br/>
	ex : modalPopup.urlModalOpen("/member/popup/payment/couponModal",{"ddd":"3434"},function(){console.log("닫기콜백");});<br/>
	참조예시: /MDHelp/src/main/webapp/WEB-INF/views/member/payment/paymentPage2.jsp<br/>
</body>
</html>
