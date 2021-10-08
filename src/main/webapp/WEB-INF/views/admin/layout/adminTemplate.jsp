<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
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
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<tiles:insertAttribute name="adminHeader" />
</head>
	<body data-sidebar="dark">

	<!-- <body data-layout="horizontal" data-topbar="dark"> -->

		<!-- Begin page -->
		<div id="layout-wrapper">

			
			<header id="page-topbar">
				<tiles:insertAttribute name="adminTopbar" />
			</header>

			<!-- ========== Left Sidebar Start ========== -->
			<div class="vertical-menu">

				<div data-simplebar class="h-100">

					<!--- Sidemenu -->
					<div id="sidebar-menu">
						<tiles:insertAttribute name="adminMenuSidebar" />
					</div>
					<!-- Sidebar -->
				</div>
			</div>
			<!-- Left Sidebar End -->

			

			<!-- ============================================================== -->
			<!-- Start right Content here -->
			<!-- ============================================================== -->
			<div class="main-content">

				<div class="page-content">
					<div class="container-fluid">
						<tiles:insertAttribute name="adminBody" />
						<!-- 모달영역 
						<div class="modal fade modal-with-bg" id="subscribeModal" tabindex="-1" aria-hidden="true"></div>
						 모달영역 -->
					</div>
					<!-- container-fluid -->
				</div>
				<!-- End Page-content -->
				<tiles:insertAttribute name="adminFooter" />
			</div>
			<!-- end main content-->

		</div>
		<!-- END layout-wrapper -->

		<!-- Right Sidebar -->
		<tiles:insertAttribute name="adminThemaRightSidebar" />
		<!-- /Right-bar -->

		<!-- Right bar overlay-->
		<div class="rightbar-overlay"></div>

		<!-- JAVASCRIPT -->
		<!-- adminHeader로 이동 -->

	</body>
</html>