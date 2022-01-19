<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<sec:authentication property="principal" var="loginInfo"/>
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
 
 <script>
	function movePage(pageNum){
		console.log(window.location.pathname);
		var pathname = window.location.pathname;
		if(pathname == "/member/main"){
			if(pageNum==1){
				var offset = $("#guid_area").offset();
				$("html, body").animate({scrollTop: offset.top},100);
			}
			if(pageNum==2){
				var offset = $("#payment_area").offset();
				$("html, body").animate({scrollTop: offset.top},100);
			}
		}else{
			location.href="/member/main";
		}
	}
</script>

<div class="container-fluid"> <!--  style="background-color:#f2f2f5;" -->
	<nav class="navbar navbar-light navbar-expand-lg topnav-menu">

		<div class="collapse navbar-collapse" id="topnav-menu-content">
			<ul class="navbar-nav">
				<c:choose>
					<c:when test='${loginName eq "" }'>
						<li class="nav-item">
							<a class="nav-link" href="#">
								<i class="mdi mdi-border-color"></i><span onclick="movePage(1)" key="t-dashboards">&nbsp;상품안내</span>
							</a>
						</li>
						
						<li class="nav-item">
							<a class="nav-link" href="#">
								<i class="bx bx-cart-alt"></i><span onclick="movePage(2)" key="t-dashboards">&nbsp;이용권</span>
							</a>
						</li>
						
						<li class="nav-item">
							<a class="nav-link" href="#">
								<i class="bx bx-mail-send"></i><span key="t-dashboards">&nbsp;문의하기</span>
							</a>
						</li>
					</c:when>
					<c:otherwise>
						<li class="nav-item">
							<a class="nav-link" href="#">
								<i class="mdi mdi-border-color"></i><span onclick="movePage(1)" key="t-dashboards">&nbsp;상품안내</span>
							</a>
						</li>
						
						<li class="nav-item">
							<a class="nav-link" href="#">
								<i class="bx bx-cart-alt"></i><span onclick="movePage(2)" key="t-dashboards">&nbsp;이용권</span>
							</a>
						</li>
						<!-- 로그인 했을때만 노출 -->
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
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
	</nav>
</div>