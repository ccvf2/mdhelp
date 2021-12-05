<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
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
<div class="container-fluid">
	<nav class="navbar navbar-light navbar-expand-lg topnav-menu">

		<div class="collapse navbar-collapse" id="topnav-menu-content">
			<ul class="navbar-nav">

				<li class="nav-item">
					<a class="nav-link" href="index.html">
						<i class="bx bx-comment-dots"></i><span key="t-dashboards">&nbsp;사용방법</span>
					</a>
				</li>
				
				<li class="nav-item">
					<a class="nav-link" href="index.html">
						<i class="bx bx-cart-alt"></i><span key="t-dashboards">&nbsp;요금제</span>
					</a>
				</li>
				
				<li class="nav-item">
					<a class="nav-link" href="index.html">
						<i class="bx bx-mail-send"></i><span key="t-dashboards">&nbsp;문의하기</span>
					</a>
				</li>
				
				<li class="nav-item">
					<a class="nav-link" href="/member/search/naver">
						<i class="bx bx-search-alt"></i><span key="t-dashboards">&nbsp;상품검색</span>
					</a>
				</li>
			<!-- 	<li class="nav-item">
					<a class="nav-link" href="ui-components.html">
						<i class="bx bx-briefcase me-2"></i><span key="t-ui-elements">UI Elements</span>
					</a>
				</li>
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle arrow-none" href="#" id="topnav-advancedkit" role="button">
						<i class="bx bxs-grid me-2"></i><span key="t-advancedkit">Advanced Kit</span> <div class="arrow-down"></div>
					</a>
					<div class="dropdown-menu" aria-labelledby="topnav-advancedkit">
						<a href="advanced-sweet-alert.html" class="dropdown-item" key="t-sweet-alert">Sweet-Alert</a>
						<a href="advanced-rangeslider.html" class="dropdown-item" key="t-range-slider">Range Slider</a>
						<a href="advanced-notifications.html" class="dropdown-item" key="t-notifications">Notifications</a>
						<a href="advanced-carousel.html" class="dropdown-item" key="t-carousel">Carousel</a>
					</div>
				</li>

				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle arrow-none" href="#" id="topnav-apps" role="button">
						<i class="bx bxs-cube-alt me-2"></i><span key="t-apps">Apps</span> <div class="arrow-down"></div>
					</a>
					<div class="dropdown-menu" aria-labelledby="topnav-apps">

						<a href="apps-calendar.html" class="dropdown-item" key="t-calendar">Calendar</a>
						<a href="apps-chat.html" class="dropdown-item" key="t-chat">Chat</a>
						<div class="dropdown">
							<a class="dropdown-item dropdown-toggle arrow-none" href="#" id="topnav-email"
								role="button">
								<span key="t-email">Email</span> <div class="arrow-down"></div>
							</a>
							<div class="dropdown-menu" aria-labelledby="topnav-email">
								<a href="apps-email-inbox.html" class="dropdown-item" key="t-inbox">Inbox</a>
								<a href="apps-email-read.html" class="dropdown-item" key="t-read-email">Read Email</a>
							</div>
						</div>
					</div>
				</li>

				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle arrow-none" href="#" id="topnav-adminkit" role="button"
					>
						<i class="bx bx-layer me-2"></i><span key="t-adminkit">Admin Kit</span> <div class="arrow-down"></div>
					</a>
					<div class="dropdown-menu" aria-labelledby="topnav-adminkit">
						<a href="typography.html" class="dropdown-item" key="t-typography">Typography</a>
						<div class="dropdown">
							<a class="dropdown-item dropdown-toggle arrow-none" href="#" id="topnav-form"
								role="button">
								<span key="t-forms">Forms</span> <div class="arrow-down"></div>
							</a>
							<div class="dropdown-menu" aria-labelledby="topnav-form">
								<a href="form-elements.html" class="dropdown-item" key="t-form-elements">Form Elements</a>
								<a href="form-advanced.html" class="dropdown-item" key="t-form-advanced">Form Advanced</a>
							</div>
						</div>
						<div class="dropdown">
							<a class="dropdown-item dropdown-toggle arrow-none" href="#" id="topnav-table"
								role="button">
								<span key="t-tables">Tables</span> <div class="arrow-down"></div>
							</a>
							<div class="dropdown-menu" aria-labelledby="topnav-table">
								<a href="tables-bootstrap.html" class="dropdown-item" key="t-bootstrap-tables">Bootstrap Tables</a>
								<a href="tables-datatable.html" class="dropdown-item" key="t-data-tables">Data Tables</a>
							</div>
						</div>
						<a href="charts.html" class="dropdown-item" key="t-charts">Charts</a>
						<div class="dropdown">
							<a class="dropdown-item dropdown-toggle arrow-none" href="#" id="topnav-icons"
								role="button">
								<span key="t-icons">Icons</span> <div class="arrow-down"></div>
							</a>
							<div class="dropdown-menu" aria-labelledby="topnav-icons">
								<a href="icons-boxicons.html" class="dropdown-item" key="t-boxicons">Boxicons</a>
								<a href="icons-materialdesign.html" class="dropdown-item" key="t-material-design">Material Design</a>
								<a href="icons-dripicons.html" class="dropdown-item" key="t-dripicons">Dripicons</a>
								<a href="icons-fontawesome.html" class="dropdown-item" key="t-font-awesome">Font Awesome 5</a>
							</div>
						</div>
						<a href="maps.html" class="dropdown-item" key="t-maps">Maps</a>
					</div>
				</li>

				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle arrow-none" href="#" id="topnav-more" role="button"
					>
						<i class="bx bx-file me-2"></i><span key="t-extra-pages">Extra pages</span> <div class="arrow-down"></div>
					</a>
					<div class="dropdown-menu" aria-labelledby="topnav-more">
			
						<div class="dropdown">
							<a class="dropdown-item dropdown-toggle arrow-none" href="#" id="topnav-auth"
								role="button">
								<span key="t-authentication">Authentication</span> <div class="arrow-down"></div>
							</a>
							<div class="dropdown-menu" aria-labelledby="topnav-auth">
								<a href="auth-login.html" class="dropdown-item" key="t-login">Login</a>
								<a href="auth-register.html" class="dropdown-item" key="t-register">Register</a>
								<a href="auth-recoverpw.html" class="dropdown-item" key="t-recover-password">Recover Password</a>
								<a href="auth-lock-screen.html" class="dropdown-item" key="t-lock-screen">Lock Screen</a>
								<a href="auth-confirm-mail.html" class="dropdown-item" key="t-confirm-mail">Confirm Mail</a>
								<a href="auth-email-verification.html" class="dropdown-item" key="t-email-verification">Email Verification</a>
								<a href="auth-two-step-verification.html" class="dropdown-item" key="t-two-step-verification">Two step verification</a>
							</div>
						</div>
						<div class="dropdown">
							<a class="dropdown-item dropdown-toggle arrow-none" href="#" id="topnav-utility"
								role="button">
								<span key="t-utility">Utility</span> <div class="arrow-down"></div>
							</a>
							<div class="dropdown-menu" aria-labelledby="topnav-utility">
								<a href="pages-starter.html" class="dropdown-item" key="t-starter-page">Starter Page</a>
								<a href="pages-preloader.html" class="dropdown-item" key="t-preloader">Preloader</a>
								<a href="pages-profile.html" class="dropdown-item" key="t-profile">Profile</a>
								<a href="pages-invoice.html" class="dropdown-item" key="t-invoice">Invoice</a>
								<a href="pages-maintenance.html" class="dropdown-item" key="t-maintenance">Maintenance</a>
								<a href="pages-comingsoon.html" class="dropdown-item" key="t-coming-soon">Coming Soon</a>
								<a href="pages-timeline.html" class="dropdown-item" key="t-timeline">Timeline</a>
								<a href="pages-pricing.html" class="dropdown-item" key="t-pricing">Pricing</a>
								<a href="pages-404.html" class="dropdown-item" key="t-error-404">Error 404</a>
								<a href="pages-500.html" class="dropdown-item" key="t-error-500">Error 500</a>
							</div>
						</div>
					</div>
				</li>
 -->
			</ul>
		</div>
	</nav>
</div>