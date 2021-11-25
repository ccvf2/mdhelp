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
<div class="navbar-header">
	<div class="d-flex">
		<!-- LOGO -->
		<div class="navbar-brand-box">
			<a href="index.html" class="logo logo-dark">
				<span class="logo-sm">
					<img src="/memberAssets/images/logo-sm.png" alt="logo-sm" height="22">
				</span>
				<span class="logo-lg">
					<img src="/memberAssets/images/logo-dark.png" alt="logo-dark" height="23">
				</span>
			</a>

			<a href="index.html" class="logo logo-light">
				<span class="logo-sm">
					<img src="/memberAssets/images/logo-sm-light.png" alt="logo-sm-light" height="22">
				</span>
				<span class="logo-lg">
					<img src="/memberAssets/images/logo-light.png" alt="logo-light" height="23">
				</span>
			</a>
		</div>

		<button type="button" class="btn btn-sm px-3 font-size-16 vertinav-toggle header-item waves-effect" id="vertical-menu-btn">
			<i class="fa fa-fw fa-bars"></i>
		</button>

		<button type="button" class="btn btn-sm px-3 font-size-16 horinav-toggle header-item waves-effect waves-light" data-bs-toggle="collapse" data-bs-target="#topnav-menu-content">
			<i class="fa fa-fw fa-bars"></i>
		</button>

		<!-- App Search-->
		<form class="app-search d-none d-lg-block">
			<div class="position-relative">
				<input type="text" class="form-control" placeholder="Search...">
				<span class="mdi mdi-magnify"></span>
			</div>
		</form>
	</div>

	<div class="d-flex">

		<div class="dropdown d-inline-block d-lg-none ms-2">
			<button type="button" class="btn header-item noti-icon waves-effect" id="page-header-search-dropdown"
			data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				<i class="mdi mdi-magnify"></i>
			</button>
			<div class="dropdown-menu dropdown-menu-lg dropdown-menu-end p-0"
				aria-labelledby="page-header-search-dropdown">

				<form class="p-3">
					<div class="form-group m-0">
						<div class="input-group">
							<input type="text" class="form-control" placeholder="Search ..." aria-label="Recipient's username">
							<div class="input-group-append">
								<button class="btn btn-primary" type="submit"><i class="mdi mdi-magnify"></i></button>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>

		<div class="dropdown d-inline-block">
			<button type="button" class="btn header-item waves-effect"
			data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				<img id="header-lang-img" src="/memberAssets/images/flags/us.jpg" alt="Header Language" height="16" class="d-block">
			</button>
			<div class="dropdown-menu dropdown-menu-end">

				<!-- item-->
				<a href="javascript:void(0);" class="dropdown-item notify-item language" data-lang="en">
					<img src="/memberAssets/images/flags/us.jpg" alt="user-image" class="me-1" height="12"> <span class="align-middle">English</span>
				</a>
				<!-- item-->
				<a href="javascript:void(0);" class="dropdown-item notify-item language" data-lang="sp">
					<img src="/memberAssets/images/flags/spain.jpg" alt="user-image" class="me-1" height="12"> <span class="align-middle">Spanish</span>
				</a>

				<!-- item-->
				<a href="javascript:void(0);" class="dropdown-item notify-item language" data-lang="gr">
					<img src="/memberAssets/images/flags/germany.jpg" alt="user-image" class="me-1" height="12"> <span class="align-middle">German</span>
				</a>

				<!-- item-->
				<a href="javascript:void(0);" class="dropdown-item notify-item language" data-lang="it">
					<img src="/memberAssets/images/flags/italy.jpg" alt="user-image" class="me-1" height="12"> <span class="align-middle">Italian</span>
				</a>

				<!-- item-->
				<a href="javascript:void(0);" class="dropdown-item notify-item language" data-lang="ru">
					<img src="/memberAssets/images/flags/russia.jpg" alt="user-image" class="me-1" height="12"> <span class="align-middle">Russian</span>
				</a>
			</div>
		</div>

		<div class="dropdown d-none d-lg-inline-block ms-1">
			<button type="button" class="btn header-item noti-icon waves-effect" data-toggle="fullscreen">
				<i class="mdi mdi-fullscreen"></i>
			</button>
		</div>

		<div class="dropdown d-inline-block">
			<button type="button" class="btn header-item noti-icon waves-effect" id="page-header-notifications-dropdown"
			data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				<i class="mdi mdi-bell"></i>
				<span class="badge bg-danger rounded-pill">3</span>
			</button>
			<div class="dropdown-menu dropdown-menu-lg dropdown-menu-end p-0"
				aria-labelledby="page-header-notifications-dropdown">
				<div class="p-3">
					<div class="row align-items-center">
						<div class="col">
							<h6 class="m-0"> Notifications </h6>
						</div>
						<div class="col-auto">
							<a href="#" class="small" key="t-view-all"> View All</a>
						</div>
					</div>
				</div>
				<div data-simplebar style="max-height: 230px;">
					<a href="" class="text-reset notification-item d-block active">
						<div class="d-flex">
							<div class="flex-shrink-0 me-3">
								<div class="avatar-xs">
									<span class="avatar-title bg-primary rounded-circle font-size-16">
										<i class="bx bx-cart"></i>
									</span>
								</div>
							</div>
							<div class="flex-grow-1">
								<h6 class="mt-0 mb-1" key="t-your-order">Your order is placed</h6>
								<div class="font-size-13 text-muted">
									<p class="mb-1" key="t-grammer">If several languages coalesce the grammar</p>
									<p class="mb-0 font-size-12"><i class="mdi mdi-clock-outline"></i> <span key="t-min-ago">3 min ago</span></p>
								</div>
							</div>
						</div>
					</a>
					<a href="" class="text-reset notification-item d-block ">
						<div class="d-flex">
							<div class="flex-shrink-0 me-3">
								<img src="/memberAssets/images/users/avatar-3.jpg" class="rounded-circle avatar-xs" alt="user-pic">
							</div>
				
							<div class="flex-grow-1">
								<h6 class="mt-0 mb-1">James Lemire</h6>
								<div class="font-size-13 text-muted">
									<p class="mb-1" key="t-simplified">It will seem like simplified English.</p>
									<p class="mb-0 font-size-12"><i class="mdi mdi-clock-outline"></i> <span key="t-hours-ago">1 hour ago</span></p>
								</div>
							</div>
						</div>
					</a>
					<a href="" class="text-reset notification-item d-block ">
						<div class="d-flex">
							<div class="flex-shrink-0 me-3">
								<div class="avatar-xs">
									<span class="avatar-title bg-success rounded-circle font-size-16">
										<i class="bx bx-badge-check"></i>
									</span>
								</div>
							</div>
				
							<div class="flex-grow-1">
								<h6 class="mt-0 mb-1" key="t-shipped">Your item is shipped</h6>
								<div class="font-size-13 text-muted">
									<p class="mb-1" key="t-grammer">If several languages coalesce the grammar</p>
									<p class="mb-0 font-size-12"><i class="mdi mdi-clock-outline"></i> <span key="t-min-ago">3 hours ago</span></p>
								</div>
							</div>
						</div>
					</a>

					<a href="" class="text-reset notification-item d-block ">
						<div class="d-flex">
							<div class="flex-shrink-0 me-3">
								<img src="/memberAssets/images/users/avatar-4.jpg" class="rounded-circle avatar-xs" alt="user-pic">
							</div>
				
							<div class="flex-grow-1">
								<h6 class="mt-0 mb-1">Salena Layfield</h6>
								<div class="font-size-13 text-muted">
									<p class="mb-1" key="t-occidental">As a skeptical Cambridge friend of mine occidental.</p>
									<p class="mb-0 font-size-12"><i class="mdi mdi-clock-outline"></i> <span key="t-hours-ago">10 hours ago</span></p>
								</div>
							</div>
						</div>
					</a>
				</div>
				<div class="p-2 border-top d-grid">
					<a class="btn btn-sm btn-link font-size-14 text-center" href="javascript:void(0)">
						<i class="mdi mdi-arrow-right-circle me-1"></i> <span>View More..</span> 
					</a>
				</div>
			</div>
		</div>

		<div class="dropdown d-inline-block">
			<button type="button" class="btn header-item waves-effect" id="page-header-user-dropdown"
			data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				<img class="rounded-circle header-profile-user" src="/memberAssets/images/users/avatar-1.jpg"
					alt="Header Avatar">
				<span class="d-none d-xl-inline-block ms-1">Peter</span>
				<i class="mdi mdi-chevron-down d-none d-xl-inline-block"></i>
			</button>
			<div class="dropdown-menu dropdown-menu-end">
				<!-- item-->
				<h6 class="dropdown-header">Welcome Peter!</h6>
				<a class="dropdown-item" href="#"><i class="mdi mdi-account-circle text-muted font-size-16 align-middle me-1"></i> <span class="align-middle" key="t-profile">Profile</span></a>
				<a class="dropdown-item" href="#"><i class="mdi mdi-message-text-outline text-muted font-size-16 align-middle me-1"></i> <span class="align-middle" key="t-messages">Messages</span></a>
				<a class="dropdown-item" href="#"><i class="mdi mdi-calendar-check-outline text-muted font-size-16 align-middle me-1"></i> <span class="align-middle" key="t-taskboard">Taskboard</span></a>
				<a class="dropdown-item" href="#"><i class="mdi mdi-lifebuoy text-muted font-size-16 align-middle me-1"></i> <span class="align-middle" key="t-help">Help</span></a>
				<div class="dropdown-divider"></div>
				<a class="dropdown-item" href="#"><i class="mdi mdi-wallet text-muted font-size-16 align-middle me-1"></i> <span class="align-middle" key="t-balance">Balance : <b>$1901.67</b></span></a>
				<a class="dropdown-item" href="#"><span class="badge bg-success bg-soft text-success mt-1 float-end">New</span><i class="mdi mdi-cog-outline text-muted font-size-16 align-middle me-1"></i> <span class="align-middle" key="t-settings">Settings</span></a>
				<a class="dropdown-item" href="#"><i class="mdi mdi-lock text-muted font-size-16 align-middle me-1"></i> <span class="align-middle" key="t-lock-screen">Lock screen</span></a>
				<a class="dropdown-item" href="/member/sign/signout"><i class="mdi mdi-logout text-muted font-size-16 align-middle me-1"></i> <span class="align-middle" key="t-logout">Logout</span></a>
			</div>
		</div>

		<div class="dropdown d-inline-block">
			<button type="button" class="btn header-item noti-icon right-bar-toggle waves-effect">
				<i class="bx bx-cog bx-spin"></i>
			</button>
		</div>

	</div>
</div>