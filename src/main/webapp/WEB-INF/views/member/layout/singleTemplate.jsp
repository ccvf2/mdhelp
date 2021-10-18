<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%-- 
 @author	: ccvf2.dev
 @since		: 2021. 10. 18.
 @partType	: (ex: admin | user | common | etx)
 @catgory	: (ex: 관리자 메인)
 @see		: (ex: 기타내용 기술)
 @comment	: (ex: 해당페이지에서는 자바스크립트를 최소화 하도록 합니다.-개발자 및 소스 수정자에게 전달내용)
 @desc		: 
 ***************************************
 **개정이력**
 ***************************************
 * no	수정일			수정자		수정이력
 * 1.	2021. 10. 18.	ccvf2.dev		최초작성
 ***************************************
 --%>
 <!doctype html>
<html lang="ko">
	<head>
		
		<meta charset="utf-8" />
		<title>Login</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta content="Premium Multipurpose Admin & Dashboard Template" name="description" />
		<meta content="Pichforest" name="author" />
		<!-- App favicon -->
		<link rel="shortcut icon" href="/adminAssets/images/favicon.ico">

		<!-- Bootstrap Css -->
		<link href="/adminAssets/css/bootstrap.min.css" id="bootstrap-style" rel="stylesheet" type="text/css" />
		<!-- Icons Css -->
		<link href="/adminAssets/css/icons.min.css" rel="stylesheet" type="text/css" />
		<!-- App Css-->
		<link href="/adminAssets/css/app.min.css" id="app-style" rel="stylesheet" type="text/css" />
		<!-- Dark Mode Css-->
		<link href="/adminAssets/css/dark-layout.min.css" id="app-style" rel="stylesheet" type="text/css" />

	</head>

	<body data-sidebar="dark">

		<!-- JAVASCRIPT -->
		<script src="/adminAssets/libs/jquery/jquery.min.js"></script>
		<script src="/adminAssets/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
		<script src="/adminAssets/libs/metismenu/metisMenu.min.js"></script>
		<script src="/adminAssets/libs/simplebar/simplebar.min.js"></script>
		<script src="/adminAssets/libs/node-waves/waves.min.js"></script>

		<script src="/adminAssets/js/app.js"></script>
	
		<tiles:insertAttribute name="singleBody" />
	</body>
</html>