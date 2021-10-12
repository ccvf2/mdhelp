<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
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
						<!-- Left Menu Start -->
						<ul class="metismenu list-unstyled" id="side-menu">
							<li class="menu-title" key="t-menu">Menu</li>
				
							<li>
								<a href="/admin" class="waves-effect">
									<i class='bx bxs-dashboard'></i>
									<span key="t-dashboard">Dashboard</span>
								</a>
							</li>

							<li class="menu-title mt-3" key="t-more">전역관리</li>

							<li>
								<a href="javascript: void(0);" class="has-arrow waves-effect">
									<i class='bx bxs-grid'></i>
									<span key="t-apps">공통코드</span>
								</a>
								<ul class="sub-menu" aria-expanded="false">
									<li><a href="/admin/codegroup"><span key="t-calendar">코드그룹관리</span></a></li>
									<li><a href="/admin/code"><span key="t-chat">코드관리</span></a></li>
									<!-- <li>
										<a href="javascript: void(0);" class="has-arrow"><span key="t-email">Email</span></a>
										<ul class="sub-menu" aria-expanded="true">
											<li><a href="apps-email-inbox.html" key="t-inbox">Inbox</a></li>
											<li><a href="apps-email-read.html" key="t-read-email">Read Email</a></li>
										</ul>
									</li> -->
								</ul>
							</li>
<%--
							<li>
								<a href="javascript: void(0);" class="waves-effect">
									<span class="badge rounded-pill bg-success float-end">9</span>
									<i class='bx bx-user-circle' ></i>
									<span key="t-authentication">Authentication</span>
								</a>
								<ul class="sub-menu" aria-expanded="false">
									<li><a href="auth-login.html" key="t-login">Login</a></li>
									<li><a href="auth-register.html" key="t-register">Register</a></li>
									<li><a href="auth-recoverpw.html" key="t-recover-password">Recover Password</a></li>
									<li><a href="auth-lock-screen.html" key="t-lock-screen">Lock Screen</a></li>
									<li><a href="auth-confirm-mail.html" key="t-confirm-mail">Confirm Mail</a></li>
									<li><a href="auth-email-verification.html" key="t-email-verification">Email Verification</a></li>
									<li><a href="auth-two-step-verification.html" key="t-two-step-verification">Two Step Verification</a></li>
								</ul>
							</li>

							<li>
								<a href="javascript: void(0);" class="has-arrow waves-effect">
									<i class='bx bx-file'></i>
									<span key="t-pages">Pages</span>
								</a>
								<ul class="sub-menu" aria-expanded="false">
									<li><a href="pages-starter.html" key="t-starter-page">Starter Page</a></li>
									<li><a href="pages-preloader.html" key="t-preloader">Preloader</a></li>
									<li><a href="pages-profile.html" key="t-profile">Profile</a></li>
									<li><a href="pages-invoice.html" key="t-invoice">Invoice</a></li>
									<li><a href="pages-maintenance.html" key="t-maintenance">Maintenance</a></li>
									<li><a href="pages-comingsoon.html" key="t-coming-soon">Coming Soon</a></li>
									<li><a href="pages-timeline.html" key="t-timeline">Timeline</a></li>
									<li><a href="pages-pricing.html" key="t-pricing">Pricing</a></li>
									<li><a href="pages-404.html" key="t-error-404">Error 404</a></li>
									<li><a href="pages-500.html" key="t-error-500">Error 500</a></li>
								</ul>
							</li>

							<li class="menu-title mt-3" key="t-adminkit">Admin Kit</li>

							<li>
								<a href="ui-components.html" class="waves-effect">
									<i class='bx bx-briefcase'></i>
									<span key="t-ui-elements">UI Elements</span>
								</a>
							</li>

							<li>
								<a href="javascript: void(0);" class="has-arrow waves-effect">
									<i class='bx bxs-cube-alt'></i>
									<span key="t-advancedkit">Advanced Kit</span>
								</a>
								<ul class="sub-menu" aria-expanded="false">
									<li><a href="advanced-sweet-alert.html" key="t-sweet-alert">Sweet-Alert</a></li>
									<li><a href="advanced-rangeslider.html" key="t-range-slider">Range Slider</a></li>
									<li><a href="advanced-notifications.html" key="t-notifications">Notifications</a></li>
									<li><a href="advanced-carousel.html" key="t-carousel">Carousel</a></li>
								</ul>
							</li>

							<li>
								<a href="typography.html" class="waves-effect">
									<i class='bx bx-text'></i>
									<span key="t-typography">Typography</span>
								</a>
							</li>

							<li>
								<a href="javascript: void(0);" class="waves-effect">
									<i class='bx bxs-magic-wand' ></i>
									<span class="badge rounded-pill bg-danger float-end">2</span>
									<span key="t-forms">Forms</span>
								</a>
								<ul class="sub-menu" aria-expanded="false">
									<li><a href="form-elements.html" key="t-form-elements">Form Elements</a></li>
									<li><a href="form-advanced.html" key="t-form-advanced">Form Advanced</a></li>
								</ul>
							</li>

							<li>
								<a href="javascript: void(0);" class="has-arrow waves-effect">
									<i class='bx bx-table' ></i>
									<span key="t-tables">Tables</span>
								</a>
								<ul class="sub-menu" aria-expanded="false">
									<li><a href="tables-bootstrap.html" key="t-bootstrap-tables">Bootstrap Tables</a></li>
									<li><a href="tables-datatable.html" key="t-data-tables">Data Tables</a></li>
								</ul>
							</li>

							<li>
								<a href="charts.html" class="waves-effect">
									<i class='bx bx-doughnut-chart' ></i>
									<span key="t-charts">Charts</span>
								</a>
							</li>

							<li>
								<a href="javascript: void(0);" class="has-arrow waves-effect">
									<i class='bx bx-layer' ></i>
									<span key="t-icons">Icons</span>
								</a>
								<ul class="sub-menu" aria-expanded="false">
									<li><a href="icons-boxicons.html" key="t-boxicons">Boxicons</a></li>
									<li><a href="icons-materialdesign.html" key="t-material-design">Material Design</a></li>
									<li><a href="icons-dripicons.html" key="t-dripicons">Dripicons</a></li>
									<li><a href="icons-fontawesome.html" key="t-font-awesome">Font Awesome 5</a></li>
								</ul>
							</li>

							<li>
								<a href="maps.html" class="waves-effect">
									<i class='bx bx-map'></i>
									<span key="t-maps">Maps</span>
								</a>
							</li>

							<li>
								<a href="javascript: void(0);" class="has-arrow waves-effect">
									<i class='bx bx-share-alt' ></i>
									<span key="t-multi-level">Multi Level</span>
								</a>
								<ul class="sub-menu" aria-expanded="true">
									<li><a href="javascript: void(0);" key="t-level-1-1">Level 1.1</a></li>
									<li>
										<a href="javascript: void(0);" class="has-arrow" key="t-level-1-2">Level 1.2</a>
										<ul class="sub-menu" aria-expanded="true">
											<li><a href="javascript: void(0);" key="t-level-2-1">Level 2.1</a></li>
											<li><a href="javascript: void(0);" key="t-level-2-2">Level 2.2</a></li>
										</ul>
									</li>
								</ul>
							</li>
--%>
						</ul>