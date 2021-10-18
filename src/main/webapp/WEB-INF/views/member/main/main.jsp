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
<!-- start page title -->
<div class="row">
	<div class="col-12">
		<div class="page-title-box d-sm-flex align-items-center justify-content-between">
			<h4 class="mb-sm-0 font-size-18">Dashboard</h4>

			<div class="page-title-right">
				<ol class="breadcrumb m-0">
					<li class="breadcrumb-item"><a href="javascript: void(0);">Dashboards</a></li>
					<li class="breadcrumb-item active">Dashboard</li>
				</ol>
			</div>

		</div>
	</div>
</div>
<!-- end page title -->

<div class="row">
	<div class="col-md-6 col-xl-3">
		<div class="card">
			<div class="card-body">
				<div class="float-end">
					<div class="avatar-sm mx-auto mb-4">
						<span class="avatar-title rounded-circle bg-light font-size-24">
							<i class="mdi mdi-cash-multiple text-primary"></i>
						</span>
					</div>
				</div>
				<div>
					<p class="text-muted text-uppercase fw-semibold">Total Revenue</p>
					<h4 class="mb-1 mt-1">$<span class="counter-value" data-target="58425">0</span></h4>
				</div>
				<p class="text-muted mt-3 mb-0"><span class="badge badge-soft-success me-1"><i class="mdi mdi-arrow-up-bold me-1"></i>2.65%</span> since last week
				</p>
			</div>
		</div>
	</div> <!-- end col-->

	<div class="col-md-6 col-xl-3">
		<div class="card">
			<div class="card-body">
				<div class="float-end">
					<div class="avatar-sm mx-auto mb-4">
						<span class="avatar-title rounded-circle bg-light font-size-24">
							<i class="mdi mdi-refresh-circle text-success"></i>
						</span>
					</div>
				</div>
				<div>
					<p class="text-muted text-uppercase fw-semibold">Total Refunds</p>
					<h4 class="mb-1 mt-1">$<span class="counter-value" data-target="2568">0</span></h4>
				</div>
				<p class="text-muted mt-3 mb-0"><span class="badge badge-soft-danger me-1"><i class="mdi mdi-arrow-down-bold me-1"></i>4.58%</span> since last week
				</p>
			</div>
		</div>
	</div> <!-- end col-->

	<div class="col-md-6 col-xl-3">
		<div class="card">
			<div class="card-body">
				<div class="float-end">
					<div class="avatar-sm mx-auto mb-4">
						<span class="avatar-title rounded-circle bg-light font-size-24">
							<i class="mdi mdi-account-group text-primary"></i>
						</span>
					</div>
				</div>
				<div>
					<p class="text-muted text-uppercase fw-semibold">Active Users</p>
					<h4 class="mb-1 mt-1"><span class="counter-value" data-target="258410">0</span></h4>
				</div>
				<p class="text-muted mt-3 mb-0"><span class="badge badge-soft-success me-1"><i class="mdi mdi-arrow-up-bold me-1"></i>14.33%</span> since last week
				</p>
			</div>
		</div>
	</div> <!-- end col-->

	<div class="col-md-6 col-xl-3">
		<div class="card">
			<div class="card-body">
				<div class="float-end">
					<div class="avatar-sm mx-auto mb-4">
						<span class="avatar-title rounded-circle bg-light font-size-24">
							<i class="mdi mdi-cart-check text-success"></i>
						</span>
					</div>
				</div>
				<div>
					<p class="text-muted text-uppercase fw-semibold">All Time Orders</p>
					<h4 class="mb-1 mt-1"><span class="counter-value" data-target="9582">0</span></h4>
				</div>
				<p class="text-muted mt-3 mb-0"><span class="badge badge-soft-warning me-1"><i class="mdi mdi-arrow-up-bold me-1"></i>0.55%</span> since last week
				</p>
			</div>
		</div>
	</div> <!-- end col-->
</div> <!-- end row-->

<div class="row">
	<div class="col-xl-8">
		<div class="card card-height-100">
			<div class="card-body">
				<div class="float-end">
					<div class="dropdown">
						<a class="dropdown-toggle text-reset" href="#" id="dropdownMenuButton1"
							data-bs-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false">
							<span class="fw-semibold">Sort By:</span> <span class="text-muted">Yearly<i class="mdi mdi-chevron-down ms-1"></i></span>
						</a>

						<div class="dropdown-menu dropdown-menu-end" aria-labelledby="dropdownMenuButton1">
							<a class="dropdown-item" href="#">Yearly</a>
							<a class="dropdown-item" href="#">Monthly</a>
							<a class="dropdown-item" href="#">Weekly</a>
							<a class="dropdown-item" href="#">Today</a>
						</div>
					</div>
				</div>
				<h4 class="card-title mb-4">Sales Analytics</h4>

				<div class="mt-1">
					<ul class="list-inline main-chart mb-0">
						<li class="list-inline-item chart-border-left me-0 border-0">
							<h3 class="text-primary">$<span data-plugin="counterup">2,371</span><span class="text-muted d-inline-block fw-normal font-size-15 ms-3">Income</span></h3>
						</li>
						<li class="list-inline-item chart-border-left me-0">
							<h3><span data-plugin="counterup">258</span><span class="text-muted d-inline-block fw-normal font-size-15 ms-3">Sales</span>
							</h3>
						</li>
						<li class="list-inline-item chart-border-left me-0">
							<h3><span data-plugin="counterup">3.6</span>%<span class="text-muted d-inline-block fw-normal font-size-15 ms-3">Conversation Ratio</span></h3>
						</li>
						<li class="list-inline-item chart-border-left me-0">
							<h3><span data-plugin="counterup">52</span>k<span class="text-muted d-inline-block fw-normal font-size-15 ms-3">Users</span></h3>
						</li>
					</ul>
				</div>

				<div class="mt-3">
					<div id="sales-analytics-chart" class="apex-charts" dir="ltr"></div>
				</div>
			</div> <!-- end card-body-->
		</div> <!-- end card-->
	</div> <!-- end col-->

	<div class="col-xl-4">
		<div class="card bg-pattern">
			<div class="card-body">
				<div class="row align-items-center">
					<div class="col-sm-8">
						<div class="avatar-xs mb-3">
							<span class="avatar-title rounded-circle bg-light font-size-24">
								<i class="mdi mdi-bullhorn-outline text-primary"></i>
							</span>
						</div>
						<p class="font-size-18">Enhance your <b>Campaign</b> for better outreach <i class="mdi mdi-arrow-right"></i></p>
						<div class="mt-4">
							<a href="javascript: void(0);" class="btn btn-success waves-effect waves-light">Upgrade Account!</a>
						</div>
					</div>
					<div class="col-sm-4">
						<div class="mt-4 mt-sm-0">
							<img src="/memberAssets/images/widget-img.png" class="img-fluid" alt="widget-img">
						</div>
					</div>
				</div>
			</div> <!-- end card-body-->
		</div>

		<div class="card">
			<div class="card-body">
				<div class="float-end">
					<div class="dropdown">
						<a class="dropdown-toggle text-reset" href="#" id="dropdownMenuButton2"
							data-bs-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false">
							<span class="fw-semibold">Report By:</span> <span class="text-muted">Monthly<i class="mdi mdi-chevron-down ms-1"></i></span>
						</a>

						<div class="dropdown-menu dropdown-menu-end" aria-labelledby="dropdownMenuButton2">
							<a class="dropdown-item" href="#">Yearly</a>
							<a class="dropdown-item" href="#">Monthly</a>
							<a class="dropdown-item" href="#">Weekly</a>
							<a class="dropdown-item" href="#">Today</a>
						</div>
					</div>
				</div>

				<h4 class="card-title mb-4">Earning Reports</h4>
				<div class="row">
					<div class="col-sm-6">
						<div class="row mb-3">
							<div class="col-6">
								<p class="text-muted mb-1">This Month</p>
								<h5 class="mt-0">$12,582<small class="badge badge-light-success font-13">+15%</small></h5>
							</div>

							<div class="col-6">
								<p class="text-muted mb-1">Last Month</p>
								<h5 class="mt-0">$98,741 <small class="badge badge-light-danger font-13">-5%</small></h5>
							</div>
						</div>
						<p class="text-muted"><span class="text-success me-1"> 12%<i class="mdi mdi-arrow-up"></i></span>From previous period</p>

						<div class="mt-4">
							<a href="" class="btn btn-primary waves-effect waves-light btn-sm">Generate Reports <i class="mdi mdi-arrow-right ms-1"></i></a>
						</div>
					</div>
					<div class="col-sm-6">
						<div class="mt-4 mt-sm-0">
							<div id="radialBar-chart" class="apex-charts"></div>
						</div>
					</div>
				</div>
			</div>
		</div> <!-- end card -->

	</div>
</div>
<!-- end row -->

<div class="row">
	<div class="col-xl-6">
		<div class="card">
			<div class="card-body">
				<div class="float-end">
					<div class="dropdown">
						<a class="dropdown-toggle text-reset" href="#" id="dropdownMenuButton3"
							data-bs-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false">
							<span class="fw-semibold">Sort By:</span> <span class="text-muted">Recent<i class="mdi mdi-chevron-down ms-1"></i></span>
						</a>

						<div class="dropdown-menu dropdown-menu-end" aria-labelledby="dropdownMenuButton3">
							<a class="dropdown-item" href="#">Maximum</a>
							<a class="dropdown-item" href="#">Recent</a>
							<a class="dropdown-item" href="#">Minimum</a>
						</div>
					</div>
				</div>

				<h4 class="card-title mb-4">Latest Transactions</h4>

				<div class="table-responsive">
					<table class="table align-middle table-striped table-nowrap mb-0">

						<tbody>
							<tr>
								<td>
									<img src="/memberAssets/images/users/avatar-2.jpg" alt="user-image"
										class="avatar-xs rounded-circle me-2">
									Herbert C. Patton
								</td>
								<td><i class="mdi mdi-checkbox-blank-circle text-success"></i> Confirm
								</td>
								<td>
									$14,584
								</td>
								<td>
									5/12/2016
								</td>
								<td>
									<button type="button" class="btn btn-light btn-sm waves-effect"> <i class='mdi mdi-square-edit-outline me-1'></i> Edit</button>
								</td>
							</tr>

							<tr>
								<td>
									<img src="/memberAssets/images/users/avatar-3.jpg" alt="user-image"
										class="avatar-xs rounded-circle me-2">
									Mathias N. Klausen
								</td>
								<td><i class="mdi mdi-checkbox-blank-circle text-warning"></i> Waiting
									payment</td>
								<td>
									$8,541
								</td>
								<td>
									10/11/2016
								</td>
								<td>
									<button type="button" class="btn btn-light btn-sm waves-effect"> <i class='mdi mdi-square-edit-outline me-1'></i> Edit</button>
								</td>
							</tr>

							<tr>
								<td>
									<img src="/memberAssets/images/users/avatar-4.jpg" alt="user-image"
										class="avatar-xs rounded-circle me-2">
									Nikolaj S. Henriksen
								</td>
								<td><i class="mdi mdi-checkbox-blank-circle text-success"></i> Confirm
								</td>
								<td>
									$954
								</td>
								<td>
									8/11/2016
								</td>
								<td>
									<button type="button" class="btn btn-light btn-sm waves-effect"> <i class='mdi mdi-square-edit-outline me-1'></i> Edit</button>
								</td>
							</tr>

							<tr>
								<td>
									<img src="/memberAssets/images/users/avatar-5.jpg" alt="user-image"
										class="avatar-xs rounded-circle me-2">
									Lasse C. Overgaard
								</td>
								<td><i class="mdi mdi-checkbox-blank-circle text-danger"></i> Payment
									expired</td>
								<td>
									$44,584
								</td>
								<td>
									7/11/2016
								</td>
								<td>
									<button type="button" class="btn btn-light btn-sm waves-effect"> <i class='mdi mdi-square-edit-outline me-1'></i> Edit</button>
								</td>
							</tr>

							<tr>
								<td>
									<img src="/memberAssets/images/users/avatar-6.jpg" alt="user-image"
										class="avatar-xs rounded-circle me-2">
									Kasper S. Jessen
								</td>
								<td><i class="mdi mdi-checkbox-blank-circle text-success"></i> Confirm
								</td>
								<td>
									$8,844
								</td>
								<td>
									1/11/2016
								</td>
								<td>
									<button type="button" class="btn btn-light btn-sm waves-effect"> <i class='mdi mdi-square-edit-outline me-1'></i> Edit</button>
								</td>
							</tr>

						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>

	<div class="col-xl-6">
		<div class="card">
			<div class="card-body">
				<div class="float-end">
					<div class="dropdown">
						<a class="dropdown-toggle text-reset" href="#" id="dropdownMenuButton4"
							data-bs-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false">
							<span class="text-muted">Status:</span> <span class="fw-semibold">All<i class="mdi mdi-chevron-down ms-1"></i></span>
						</a>

						<div class="dropdown-menu dropdown-menu-end" aria-labelledby="dropdownMenuButton4">
							<a class="dropdown-item" href="#">All</a>
							<a class="dropdown-item" href="#">Delivered</a>
							<a class="dropdown-item" href="#">Shipped</a>
							<a class="dropdown-item" href="#">Cancelled</a>
						</div>
					</div>
				</div>

				<h4 class="card-title mb-4">Latest Orders</h4>

				<div class="table-responsive">
					<table class="table align-middle table-striped table-nowrap mb-0">

						<tbody>
							<tr>
								<td>#12354781</td>
								<td>
									<img src="/memberAssets/images/products/img-1.png" alt="user-image" style="height: 32px;" class="rounded me-2">
									Riverston Glass Chair
								</td>
								<td><span class="badge rounded-pill bg-success bg-soft text-success">Delivered</span></td>
								<td>
									$185
								</td>
								<td>
									5/12/2016
								</td>
								<td>
									<button type="button" class="btn btn-light btn-sm waves-effect"> <i class='mdi mdi-square-edit-outline me-1'></i> Edit</button>
								</td>
							</tr>

							<tr>
								<td>#52140300</td>
								<td>
									<img src="/memberAssets/images/products/img-2.png" alt="user-image" style="height: 32px;" class="rounded me-2">
									Shine Company Catalina
								</td>
								<td><span class="badge rounded-pill bg-success bg-soft text-success">Delivered</span></td>
								<td>
									$1,024
								</td>
								<td>
									5/12/2016
								</td>
								<td>
									<button type="button" class="btn btn-light btn-sm waves-effect"> <i class='mdi mdi-square-edit-outline me-1'></i> Edit</button>
								</td>
							</tr>

							<tr>
								<td>#96254137</td>
								<td>
									<img src="/memberAssets/images/products/img-3.png" alt="user-image" style="height: 32px;" class="rounded me-2">
									Trex Outdoor Furniture Cape
								</td>
								<td><span class="badge rounded-pill bg-danger bg-soft text-danger">Cancel</span></td>
								<td>
									$657
								</td>
								<td>
									5/12/2016
								</td>
								<td>
									<button type="button" class="btn btn-light btn-sm waves-effect"> <i class='mdi mdi-square-edit-outline me-1'></i> Edit</button>
								</td>
							</tr>

							<tr>
								<td>#12365474</td>
								<td>
									<img src="/memberAssets/images/products/img-4.png" alt="user-image" style="height: 32px;" class="rounded me-2">
									Oasis Bathroom Teak Corner
								</td>
								<td><span class="badge bg-warning bg-soft text-warning rounded-pill">Shipped</span></td>
								<td>
									$8451
								</td>
								<td>
									5/12/2016
								</td>
								<td>
									<button type="button" class="btn btn-light btn-sm waves-effect"> <i class='mdi mdi-square-edit-outline me-1'></i> Edit</button>
								</td>
							</tr>

							<tr>
								<td>#85214796</td>
								<td>
									<img src="/memberAssets/images/products/img-5.png" alt="user-image" style="height: 32px;" class="rounded me-2">
									BeoPlay Speaker
								</td>
								<td><span class="badge bg-success bg-soft text-success rounded-pill">Delivered</span></td>
								<td>
									$584
								</td>
								<td>
									5/12/2016
								</td>
								<td>
									<button type="button" class="btn btn-light btn-sm waves-effect"> <i class='mdi mdi-square-edit-outline me-1'></i> Edit</button>
								</td>
							</tr>

						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- end row -->

<div class="row">
	<div class="col-lg-12">
		<div class="card">
			<div class="card-body">
				<div class="float-end">
					<ul class="list-inline mb-0">
						<li class="list-inline-item me-2">
							<div class="dropdown">
								<a class="dropdown-toggle text-reset" href="#"
									data-bs-toggle="dropdown" aria-haspopup="true"
									aria-expanded="false">
									<span class="text-muted">Status:</span> <span class="fw-semibold">Active<i class="mdi mdi-chevron-down ms-1"></i></span>
								</a>

								<div class="dropdown-menu dropdown-menu-end">
									<a class="dropdown-item" href="#">Active</a>
									<a class="dropdown-item" href="#">Blocked</a>
								</div>
							</div>
						</li>
						<li class="list-inline-item">
							<div class="dropdown ms-3">
								<a class="dropdown-toggle text-reset" href="#"
									data-bs-toggle="dropdown" aria-haspopup="true"
									aria-expanded="false">
									<span class="text-muted">Sort By:</span> <span class="fw-semibold">Name<i class="mdi mdi-chevron-down ms-1"></i></span>
								</a>

								<div class="dropdown-menu dropdown-menu-end">
									<a class="dropdown-item" href="#">ID</a>
									<a class="dropdown-item" href="#">Job title</a>
									<a class="dropdown-item" href="#">Name</a>
									<a class="dropdown-item" href="#">Location</a>
									<a class="dropdown-item" href="#">Email</a>
									<a class="dropdown-item" href="#">Phone</a>
								</div>
							</div>
						</li>
					</ul>
				</div>

				<h4 class="card-title mb-4">Recent Users</h4>
				<div class="table-responsive">
					<table class="table table-hover table-borderless align-middle table-centered table-nowrap mb-0">
						<thead class="table-light">
							<tr>
								<th>ID</th>
								<th>Name</th>
								<th>Job title</th>
								<th>Email</th>
								<th>Phone</th>
								<th>Status</th>
								<th colspan="2">Location</th>
							</tr>
						</thead>
						<tbody>

							<tr>
								<td>
									#SD001
								</td>
								<td>
									<img src="/memberAssets/images/users/avatar-1.jpg" alt="user" class="rounded-circle h-auto avatar-xs me-2">
									<span> Anna Ciantar</span>
								</td>
								<td>
									Designer
								</td>
								<td>
									annac@hotmai.us
								</td>
								<td>
									(216) 76 298 896
								</td>
								<td>
									<span class="badge bg-success bg-soft text-success">Active</span>
								</td>
								<td>
									Philippines
								</td>
								<td>
									<div class="dropdown">
										<a class="text-muted dropdown-toggle font-size-16" role="button"
											data-bs-toggle="dropdown" aria-haspopup="true">
											<i class="mdi mdi-dots-vertical"></i>
										</a>
										<div class="dropdown-menu dropdown-menu-end">
											<a class="dropdown-item" href="#">Action</a>
											<a class="dropdown-item" href="#">Another action</a>
											<a class="dropdown-item" href="#">Something else here</a>
										</div>
									</div>
								</td>
							</tr>
							<!-- end /tr -->

							<tr>
								<td>
									#SD002
								</td>
								<td>
									<img src="/memberAssets/images/users/avatar-2.jpg" alt="user" class="rounded-circle h-auto avatar-xs me-2">
									<span>Paul J. Friend</span>
								</td>
								<td>
									Developer
								</td>
								<td>
									pauljfrnd@jourrapide.com
								</td>
								<td>
									937-330-1634
								</td>
								<td>
									<span class="badge bg-success bg-soft text-success">Active</span>
								</td>
								<td>
									New York
								</td>
								<td>
									<div class="dropdown">
										<a class="text-muted dropdown-toggle font-size-16" role="button"
											data-bs-toggle="dropdown" aria-haspopup="true">
											<i class="mdi mdi-dots-vertical"></i>
										</a>
										<div class="dropdown-menu dropdown-menu-end">
											<a class="dropdown-item" href="#">Action</a>
											<a class="dropdown-item" href="#">Another action</a>
											<a class="dropdown-item" href="#">Something else here</a>
										</div>
									</div>
								</td>
							</tr>
							<!-- end /tr -->

							<tr>
								<td>
									#SD003
								</td>
								<td>
									<img src="/memberAssets/images/users/avatar-3.jpg" alt="user" class="rounded-circle h-auto avatar-xs me-2">
									<span>Kathryn S. Collier</span>
								</td>
								<td>
									Owner
								</td>
								<td>
									annac@hotmai.us
								</td>
								<td>
									(216) 76 298 896
								</td>
								<td>
									<span class="badge bg-success bg-soft text-success">Active</span>
								</td>
								<td>
									Philippines
								</td>
								<td>
									<div class="dropdown">
										<a class="text-muted dropdown-toggle font-size-16" role="button"
											data-bs-toggle="dropdown" aria-haspopup="true">
											<i class="mdi mdi-dots-vertical"></i>
										</a>
										<div class="dropdown-menu dropdown-menu-end">
											<a class="dropdown-item" href="#">Action</a>
											<a class="dropdown-item" href="#">Another action</a>
											<a class="dropdown-item" href="#">Something else here</a>
										</div>
									</div>
								</td>
							</tr>
							<!-- end /tr -->

							<tr>
								<td>
									#SD004
								</td>
								<td>
									<img src="/memberAssets/images/users/avatar-4.jpg" alt="user" class="rounded-circle h-auto avatar-xs me-2">
									<span>Labeeb Ghali</span>
								</td>
								<td>
									Designer
								</td>
								<td>
									labebswad@teleworm.us
								</td>
								<td>
									050 414 8778
								</td>
								<td>
									<span class="badge bg-danger bg-soft text-danger">Blocked</span>
								</td>
								<td>
									United Kingdom
								</td>
								<td>
									<div class="dropdown">
										<a class="text-muted dropdown-toggle font-size-16" role="button"
											data-bs-toggle="dropdown" aria-haspopup="true">
											<i class="mdi mdi-dots-vertical"></i>
										</a>
										<div class="dropdown-menu dropdown-menu-end">
											<a class="dropdown-item" href="#">Action</a>
											<a class="dropdown-item" href="#">Another action</a>
											<a class="dropdown-item" href="#">Something else here</a>
										</div>
									</div>
								</td>
							</tr>
							<!-- end /tr -->

							<tr>
								<td>
									#SD005
								</td>
								<td>
									<img src="/memberAssets/images/users/avatar-5.jpg" alt="user" class="rounded-circle h-auto avatar-xs me-2">
									<span>Timothy Kauper</span>
								</td>
								<td>
									Founder
								</td>
								<td>
									thykauper@rhyta.com
								</td>
								<td>
									(216) 75 612 706
								</td>
								<td>
									<span class="badge bg-success bg-soft text-success">Active</span>
								</td>
								<td>
									Denmark
								</td>
								<td>
									<div class="dropdown">
										<a class="text-muted dropdown-toggle font-size-16" role="button"
											data-bs-toggle="dropdown" aria-haspopup="true">
											<i class="mdi mdi-dots-vertical"></i>
										</a>
										<div class="dropdown-menu dropdown-menu-end">
											<a class="dropdown-item" href="#">Action</a>
											<a class="dropdown-item" href="#">Another action</a>
											<a class="dropdown-item" href="#">Something else here</a>
										</div>
									</div>
								</td>
							</tr>
							<!-- end /tr -->
						</tbody>
					</table>
					<!-- end table -->

				</div>
				<!--end table-responsive-->
			</div>
		</div>
	</div>
</div>
<!-- end row -->