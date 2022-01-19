<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<sec:authentication property="principal" var="loginInfo"/>
<%-- user
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
 
 <style>
 /* .btn-outline-success:hover {
    color: #00bbbb;
    background-color: #00bbbb;
    border-color: #00bbbb;
} */

.btn-outline-success {
  color: #fff;
  border-color: #00bbbb;
  background-color: #00bbbb;
}

.btn-outline-success:hover {
    color: #fff;
    background-color: #00a2a2;
    border-color: #00a2a2;
}

.a_login {
  color: #495057;
  text-decoration: none;
  margin-right: 20px; 
  font-size: 53%; 
  font-weight: normal; 
}
.a_login:hover {
  color: #00bbbb;
  text-decoration: underline;
  margin-right: 20px; 
  font-size: 53%; 
  font-weight: normal; 
}

.s_name {
  color: #495057;
  text-decoration: none;
  font-weight: normal; 
}
.s_name:hover {
  color: #00bbbb;
  text-decoration: underline;
  font-weight: normal; 
}
 </style>
 
 <script>
 	$(function () {
	  	$('[data-toggle="tooltip"]').tooltip();
	});
 </script>
 
<div class="navbar-header">
	<div class="d-flex">
		<!-- LOGO -->
		<div class="navbar-brand-box">
			<a href="/member/main" class="logo logo-dark">
				<span class="logo-sm">
					<img src="/memberAssets/images/logo-sm.png" alt="logo-sm" height="22">
				</span>
				<span class="logo-lg">
					<img src="/memberAssets/images/logo-dark.png" alt="logo-dark" height="23">
				</span>
			</a>

			<a href="/member/main" class="logo logo-light">
				<span class="logo-sm">
					<img src="/memberAssets/images/logo-sm-light.png" alt="logo-sm-light" height="22">
				</span>
				<span class="logo-lg">
					<img src="/memberAssets/images/logo.png" alt="logo-light" height="23">
				</span>
			</a>
		</div>

		<button type="button" class="btn btn-sm px-3 font-size-16 vertinav-toggle header-item waves-effect" id="vertical-menu-btn">
			<i class="fa fa-fw fa-bars"></i>
		</button>

 		<button type="button" class="btn btn-sm px-3 font-size-16 horinav-toggle header-item waves-effect waves-light" data-bs-toggle="collapse" data-bs-target="#topnav-menu-content">
			<i class="fa fa-fw fa-bars"></i>
		</button>
	</div>

	<div class="d-flex">
		<div class="dropdown d-inline-block">
			
		</div>


<!-- 로그인전 상단 노출 -->
<c:choose>
	<c:when test='${loginName eq "" }'>
		<div class="dropdown d-none d-lg-inline-block ms-1">
			<h2 class="mb-3" style="margin-top: 10px;">
				<a href="/member/sign/signin" class="a_login">로그인</a><!-- <font style="color: #495057; margin-right: 20px; font-size: 67%; font-weight: normal;">로그인</font> -->
				<button type="button" class="btn btn-outline-success waves-effect waves-light" data-toggle="tooltip" data-placement="bottom" title="여기 눌러">지금시작하기</button>
			</h2>
		</div>
</c:when>
	<c:otherwise>
		<%-- ${loginName}로 로그인 --%>
		<!-- 알림  -->
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
				</div>
				<div class="p-2 border-top d-grid">
					<a class="btn btn-sm btn-link font-size-14 text-center" href="javascript:void(0)">
						<i class="mdi mdi-arrow-right-circle me-1"></i> <span>View More..</span> 
					</a>
				</div>
			</div>
		</div>
		
		<%-- 프로필 창  --%>
		<div class="dropdown d-inline-block">
			<button type="button" class="btn header-item waves-effect" id="page-header-user-dropdown"
			data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				<img class="rounded-circle header-profile-user" src="/memberAssets/images/users/avatar-1.jpg"
					alt="Header Avatar">
	 				<span class="d-none d-xl-inline-block ms-1 s_name">${loginInfo.fullName}</span>
				<i class="mdi mdi-chevron-down d-none d-xl-inline-block"></i>
			</button>
			<div class="dropdown-menu dropdown-menu-end">
				<!-- item-->
				<h6 class="dropdown-header">${loginName}</h6>
				<a class="dropdown-item" href="#"><i class="mdi mdi-wallet text-muted font-size-16 align-middle me-1"></i> <span class="align-middle" key="t-balance">이용권 : <b>무료</b></span></a>
				<a class="dropdown-item" href="#"><i class="mdi mdi-wallet text-muted font-size-16 align-middle me-1"></i> <span class="align-middle" key="t-balance">잔여건수 : <b>800 건</b></span></a>
				<a class="dropdown-item" href="#"><span class="align-middle" style="color: #2883f3;">업그레이드 하기></span></a>
				
				<!-- 
				<a class="dropdown-item" href="#"><i class="mdi mdi-account-circle text-muted font-size-16 align-middle me-1"></i> <span class="align-middle" key="t-profile">Profileq</span></a>
				<a class="dropdown-item" href="#"><i class="mdi mdi-message-text-outline text-muted font-size-16 align-middle me-1"></i> <span class="align-middle" key="t-messages">Messages</span></a>
				<a class="dropdown-item" href="#"><i class="mdi mdi-calendar-check-outline text-muted font-size-16 align-middle me-1"></i> <span class="align-middle" key="t-taskboard">Taskboard</span></a>
				<a class="dropdown-item" href="#"><i class="mdi mdi-lifebuoy text-muted font-size-16 align-middle me-1"></i> <span class="align-middle" key="t-help">Help</span></a>
				 -->
				<div class="dropdown-divider"></div>
				<a class="dropdown-item" href="#"><i class="mdi mdi-account-circle text-muted font-size-16 align-middle me-1"></i> <span class="align-middle" key="t-profile">내 정보</span></a>
				<a class="dropdown-item" href="#"><i class="mdi mdi-account-circle text-muted font-size-16 align-middle me-1"></i> <span class="align-middle" key="t-profile">계정 및 결제정보</span></a>
				<a class="dropdown-item" href="#"><i class="mdi mdi-account-circle text-muted font-size-16 align-middle me-1"></i> <span class="align-middle" key="t-profile">1:1 문의</span></a>
				<c:if test='${loginInfo.member_level eq "USERLEV2"}'>
				<a class="dropdown-item" href="/admin/main">
					<i class="mdi mdi-lock text-muted font-size-16 align-middle me-1"></i>
					<span class="align-middle" key="t-lock-screen">관리자화면으로이동</span>
				</a>
				</c:if>
				<a class="dropdown-item" href="/member/sign/signout"><i class="mdi mdi-logout text-muted font-size-16 align-middle me-1"></i> <span class="align-middle" key="t-logout">Logout</span></a>
			</div>
		</div>
	</c:otherwise>
</c:choose>		



	</div>
</div>