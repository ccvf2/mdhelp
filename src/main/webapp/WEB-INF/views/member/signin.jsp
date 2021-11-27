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
<div class="account-pages my-5 pt-sm-5">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-md-10">
				<div class="text-center mb-5">
					<a href="index.html" class="auth-logo">
						<img src="/memberAssets/images/logo-dark.png" alt="Logo Dark" height="28" class="auth-logo-dark">
						<img src="/memberAssets/images/logo-light.png" alt="Logo Light" height="28" class="auth-logo-light">
					</a>
					<p class="font-size-15 text-muted mt-3">Responsive <b>Bootstrap 5</b> Admin Dashboard</p>
				</div>
				<div class="card overflow-hidden">
					<div class="row g-0">
						<div class="col-lg-6">
							<div class="p-lg-5 p-4">

								<div>
									<h5>Welcome Back !</h5>
									<p class="text-muted">Sign in to continue to Samply.</p>
								</div>
							
								<div class="mt-4 pt-3">
									<form action="index.html" id="signInForm">
	
										<div class="mb-3">
											<label for="email" class="fw-semibold">Username</label>
											<input type="text" class="form-control" id="email" name="email" placeholder="Enter username" value="ccvf2@naver.com">
										</div>
				
										<div class="mb-3 mb-4">
											<label for="pwd" class="fw-semibold">Password</label>
											<input type="password" class="form-control" id="pwd" name="pwd" placeholder="Enter password">
										</div>

										<div class="row align-items-center">
											<div class="col-6">
												<div class="form-check">	
													<input type="checkbox" class="form-check-input font-size-16" id="remember-check">
													<label class="form-check-label" for="remember-check">Remember me</label>
												</div>
											</div>  
											<div class="col-6">
												<div class="text-end">
													<button class="btn btn-primary w-md waves-effect waves-light" type="button" onclick="loginProcessObject.trySignIn();">Log In</button>
												</div>
											</div>
										</div>
				
										<div class="mt-4">
											<a href="auth-recoverpw.html" class="text-muted"><i class="mdi mdi-lock me-1"></i> Forgot your password?</a>
										</div>
									</form>
								</div>
			
							</div>
						</div>

						<div class="col-lg-6">
							<div class="p-lg-5 p-4 bg-auth h-100 d-none d-lg-block">
								<div class="bg-overlay"></div>
							</div>
						</div>
						
					</div>
				</div>
				<%-- end card --%>
				<div class="mt-5 text-center">
					<p>Don't have an account ? <a href="/member/sign/signup" class="fw-semibold text-decoration-underline text-primary"> Sign up </a> </p>
					<p>© <script>document.write(new Date().getFullYear())</script> <b>Samply</b>. Crafted with <i class="mdi mdi-heart text-danger"></i> by Pichforest</p>
				</div>
			</div>
			<%-- end col --%>
		</div>
		<%-- end row --%>
	</div>
	<%-- end container --%>
</div>
<%-- end account page --%>
<script type="text/javascript">
<%-- 
var loginProcessObject = {
	getInputValue : function(){
		var returnObj ={};
		returnObj["email"]			=	$("#email").val(); 
		returnObj["pwd"]				=	$("#pwd").val();
		returnObj["${_csrf.parameterName}"]	=	"${_csrf.token}"; 
		return returnObj;
	},
	valueDataValidation : function(obj){
		return true;
	},
	
	trySignIn : function(){
		var data = this.getInputValue();
		var valid = this.valueDataValidation(data);
		if(valid){
			$.ajax({
				url: "/member/signInProcess.ajax",
				type:"POST",
				dataType:"TEXT",
				data:data,
				success:function(data){
					console.log(data)
					alert("통신성공.새로고침 하세요.");
				},
				error:function(xhr, status, errorMsg){
					alert("등록 실패 되었습니다.");
					console.log(xhr)
					console.log(status)
					console.log(errorMsg)
				}
			});
		}
	},
}
 --%>
var loginProcessObject = {
	getInputValue : function(){
		var returnObj ={};
		returnObj["email"]			=	$("#email").val(); 
		returnObj["pwd"]				=	$("#pwd").val();
		returnObj["${_csrf.parameterName}"]	=	"${_csrf.token}"; 
		return returnObj;
	},
	valueDataValidation : function(obj){
		return true;
	},
	
	trySignIn : function(){
		var form = document.getElementById("signInForm");
		form.action="/member/sign/signInProcess.ajax";
		form.method = "POST";
		form.submit(); 
	},
}
</script>
