<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>
	<h2>관리자</h2>
	<a href="/admin/main">관리자-메인</a><br/>
	<a href="/admin/login">관리자-로그인</a><br/>
	<a href="/admin/codegroup">관리자-코드그룹</a><br/>
	<a href="/admin/code">관리자-코드</a><br/>
	<hr/>
	<h2>사용자</h2>
	<a href="/member/main">사용자-메인</a><br/>
	<a href="/member/signup">사용자-회원가입</a><br/>
	<a href="/member/signin">사용자-로그인</a><br/>
</body>
</html>
