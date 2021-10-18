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
									<h5>Register account</h5>
									<p class="text-muted">Get your free Samply account now.</p>
								</div>
							
								<div class="mt-4 pt-3">
									<form action="index.html">
	
										<div class="mb-3">
											<label class="fw-semibold" for="useremail">Email</label>
											<input type="email" class="form-control" id="useremail" placeholder="Enter email">		
										</div>
				
										<div class="mb-3">
											<label class="fw-semibold" for="username">Username</label>
											<input type="text" class="form-control" id="username" placeholder="Enter username">
										</div>
				
										<div class="mb-3">
											<label class="fw-semibold" for="userpassword">Password</label>
											<input type="password" class="form-control" id="userpassword" placeholder="Enter password">		
										</div>
				
										<div class="mt-4 text-end">
											<button class="btn btn-primary w-md waves-effect waves-light" type="submit">Register</button>
										</div>

										<div class="mt-4 text-center">
											<p class="mb-0 text-muted">By registering you agree to the Samply <a href="#" class="text-primary fw-semibold text-decoration-underline">Terms of Use</a></p>
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
				<!-- end card -->
				<div class="mt-5 text-center">
					<p>Already have an account ? <a href="/member/signin" class="fw-semibold text-decoration-underline"> Sign In </a> </p>
					<p>© <script>document.write(new Date().getFullYear())</script> <b>Samply</b>. Crafted with <i class="mdi mdi-heart text-danger"></i> by Pichforest</p>
				</div>
			</div>
			<!-- end col -->
		</div>
		<!-- end row -->
	</div>
	<!-- end container -->
</div>
<!-- end account page -->