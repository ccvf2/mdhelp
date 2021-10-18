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
<!DOCTYPE html>
<html lang="ko">
	
	<head>
		
		<meta charset="utf-8" />
		<title>Member Default Template</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta content="Premium Multipurpose Admin & Dashboard Template" name="description" />
		<meta content="Pichforest" name="author" />
		<!-- App favicon -->
		<link rel="shortcut icon" href="/memberAssets/images/favicon.ico">

		<!-- Bootstrap Css -->
		<link href="/memberAssets/css/bootstrap.min.css" id="bootstrap-style" rel="stylesheet" type="text/css" />
		<!-- Icons Css -->
		<link href="/memberAssets/css/icons.min.css" rel="stylesheet" type="text/css" />
		<!-- App Css-->
		<link href="/memberAssets/css/app.min.css" id="app-style" rel="stylesheet" type="text/css" />
		<!-- Dark Mode Css-->
		<link href="/memberAssets/css/dark-layout.min.css" id="app-style" rel="stylesheet" type="text/css" />



		<!-- JAVASCRIPT -->
		<script src="/memberAssets/libs/jquery/jquery.min.js"></script>
		<script src="/memberAssets/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
		<script src="/memberAssets/libs/metismenu/metisMenu.min.js"></script>
		<script src="/memberAssets/libs/simplebar/simplebar.min.js"></script>
		<script src="/memberAssets/libs/node-waves/waves.min.js"></script>

		<!-- apexcharts -->
		<script src="/memberAssets/libs/apexcharts/apexcharts.min.js"></script>

		<!-- dashboard init -->
		<script src="/memberAssets/js/pages/dashboard.init.js"></script>


	</head>

	<body data-topbar="dark" data-layout="horizontal">

		<!-- Begin page -->
		<div id="layout-wrapper">
			<header id="page-topbar">
				<!-- //topBar -->
				<tiles:insertAttribute name="topBar" />
			</header>
			<div class="topnav">
				<!-- //navMenu -->
				<tiles:insertAttribute name="navMenu" />
			</div>

			<!-- ============================================================== -->
			<!-- Start right Content here -->
			<!-- ============================================================== -->
			<div class="main-content">

				<div class="page-content">
					<div class="container-fluid">

						<!-- //body -->
						<tiles:insertAttribute name="body" />


<%-- 
						<!-- subscribeModal -->
						<div class="modal fade modal-with-bg" id="subscribeModal" tabindex="-1" aria-hidden="true">
							<div class="modal-dialog modal-dialog-centered">
								<div class="modal-content bg-pattern">
									<div class="modal-header border-bottom-0">
										<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body">
										<div class="text-center mb-4">
											<div class="avatar-md mx-auto mb-4">
												<div class="avatar-title bg-light rounded-circle text-primary h1">
													<i class="mdi mdi-email-open"></i>
												</div>
											</div>

											<div class="row justify-content-center">
												<div class="col-xl-10">
													<h4 class="text-primary">Subscribe !</h4>
													<p class="text-muted font-size-14 mb-4">Subscribe our newletter and get notification to stay update.</p>

													<div class="input-group bg-light rounded">
														<input type="email" class="form-control bg-transparent border-0" placeholder="Enter Email address" aria-label="Recipient's username" aria-describedby="button-addon2">
								
														<button class="btn btn-primary" type="button" id="button-addon2">
															<i class="bx bxs-paper-plane"></i>
														</button>
													</div>
							
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- end modal -->
--%>
					</div>
					<!-- container-fluid -->
				</div>
				<!-- End Page-content -->

				<footer class="footer">
					<!-- //footer -->
					<tiles:insertAttribute name="footer" />
				</footer>
			</div>
			<!-- end main content-->

		</div>
		<!-- END layout-wrapper -->
<%-- 
		<!-- Right Sidebar -->
		<div class="right-bar">
			<div data-simplebar class="h-100">
				<div class="rightbar-title d-flex align-items-center bg-dark p-3">

					<h5 class="m-0 me-2 text-white">Theme Customizer</h5>

					<a href="javascript:void(0);" class="right-bar-toggle ms-auto">
						<i class="mdi mdi-close noti-icon"></i>
					</a>
				</div>

				<!-- Settings -->
				<hr class="m-0" />

				<div class="p-4">
					<h6 class="mb-3">Layout</h6>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="layout"
							id="layout-vertical" value="vertical">
						<label class="form-check-label" for="layout-vertical">Vertical</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="layout"
							id="layout-horizontal" value="horizontal">
						<label class="form-check-label" for="layout-horizontal">Horizontal</label>
					</div>

					<h6 class="mt-4 mb-3">Layout Mode</h6>

					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="layout-mode"
							id="layout-mode-light" value="light">
						<label class="form-check-label" for="layout-mode-light">Light</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="layout-mode"
							id="layout-mode-dark" value="dark">
						<label class="form-check-label" for="layout-mode-dark">Dark</label>
					</div>

					<h6 class="mt-4 mb-3">Layout Width</h6>

					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="layout-width"
							id="layout-width-fuild" value="fuild" onchange="document.body.setAttribute('data-layout-size', 'fluid')">
						<label class="form-check-label" for="layout-width-fuild">Fluid</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="layout-width"
							id="layout-width-boxed" value="boxed" onchange="document.body.setAttribute('data-layout-size', 'boxed')">
						<label class="form-check-label" for="layout-width-boxed">Boxed</label>
					</div>

					<h6 class="mt-4 mb-3">Layout Position</h6>

					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="layout-position"
							id="layout-position-fixed" value="fixed" onchange="document.body.setAttribute('data-layout-scrollable', 'false')">
						<label class="form-check-label" for="layout-position-fixed">Fixed</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="layout-position"
							id="layout-position-scrollable" value="scrollable" onchange="document.body.setAttribute('data-layout-scrollable', 'true')">
						<label class="form-check-label" for="layout-position-scrollable">Scrollable</label>
					</div>

					<h6 class="mt-4 mb-3">Topbar Color</h6>

					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="topbar-color"
							id="topbar-color-light" value="light" onchange="document.body.setAttribute('data-topbar', 'light')">
						<label class="form-check-label" for="topbar-color-light">Light</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="topbar-color"
							id="topbar-color-dark" value="dark" onchange="document.body.setAttribute('data-topbar', 'dark')">
						<label class="form-check-label" for="topbar-color-dark">Dark</label>
					</div>

					<h6 class="mt-4 mb-3 sidebar-setting">Sidebar Size</h6>

					<div class="form-check sidebar-setting">
						<input class="form-check-input" type="radio" name="sidebar-size"
							id="sidebar-size-default" value="default" onchange="document.body.setAttribute('data-sidebar-size', 'lg')">
						<label class="form-check-label" for="sidebar-size-default">Default</label>
					</div>
					<div class="form-check sidebar-setting">
						<input class="form-check-input" type="radio" name="sidebar-size"
							id="sidebar-size-compact" value="compact" onchange="document.body.setAttribute('data-sidebar-size', 'md')">
						<label class="form-check-label" for="sidebar-size-compact">Compact</label>
					</div>
					<div class="form-check sidebar-setting">
						<input class="form-check-input" type="radio" name="sidebar-size"
							id="sidebar-size-small" value="small" onchange="document.body.setAttribute('data-sidebar-size', 'sm')">
						<label class="form-check-label" for="sidebar-size-small">Small (Icon View)</label>
					</div>

					<h6 class="mt-4 mb-3 sidebar-setting">Sidebar Color</h6>

					<div class="form-check sidebar-setting">
						<input class="form-check-input" type="radio" name="sidebar-color"
							id="sidebar-color-light" value="light" onchange="document.body.setAttribute('data-sidebar', 'light')">
						<label class="form-check-label" for="sidebar-color-light">Light</label>
					</div>
					<div class="form-check sidebar-setting">
						<input class="form-check-input" type="radio" name="sidebar-color"
							id="sidebar-color-dark" value="dark" onchange="document.body.setAttribute('data-sidebar', 'dark')">
						<label class="form-check-label" for="sidebar-color-dark">Dark</label>
					</div>
					<div class="form-check sidebar-setting">
						<input class="form-check-input" type="radio" name="sidebar-color"
							id="sidebar-color-brand" value="brand" onchange="document.body.setAttribute('data-sidebar', 'brand')">
						<label class="form-check-label" for="sidebar-color-brand">Brand</label>
					</div>

					<h6 class="mt-4 mb-3">Direction</h6>

					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="layout-direction"
							id="layout-direction-ltr" value="ltr">
						<label class="form-check-label" for="layout-direction-ltr">LTR</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="layout-direction"
							id="layout-direction-rtl" value="rtl">
						<label class="form-check-label" for="layout-direction-rtl">RTL</label>
					</div>

				</div>

			</div> <!-- end slimscroll-menu-->
		</div>
		<!-- /Right-bar -->

		<!-- Right bar overlay-->
		<div class="rightbar-overlay"></div>
--%>

		<!-- App js -->
		<script src="/memberAssets/js/app.js"></script>
	</body>

</html>