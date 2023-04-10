<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Modern Business - Start Bootstrap Template</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- CSS 스프링 안에서 연결  -->
<link
	href="${pageContext.request.contextPath }/resources/css/styles.css"
	rel="stylesheet">
<!-- 스프링 안에서 연결  -->
</head>
<body class="d-flex flex-column">
	<main class="flex-shrink-0">
		<!-- Navigation-->
		<%@ include file="/WEB-INF/views/include/topbar.jsp"%>
		<!-- Header-->

		<!-- 최신 축구 소식 & 하이라이트-->
		<section class="py-5" style="padding-bottom: 3rem; padding-top: 3rem;">
			<div class="infotable">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">내 주문내역</h5>
						<br>

						<!-- General Form Elements -->
						<c:forEach items="${orInfo }" var="orInfo">
							<div class="row mb-3">
								<label for="" class="col-sm-2 col-form-label">주문코드</label>
								<div class="col-sm-10">
									<input type="text" class="form-control"
										value="${orInfo.orcode }" disabled>
								</div>
							</div>
							<div class="row mb-3">
								<label for="" class="col-sm-2 col-form-label">아이디</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" value="${orInfo.orid }"
										disabled>
								</div>
							</div>
							<div class="row mb-3">
								<label for="" class="col-sm-2 col-form-label">주문상품</label>
								<div class="col-sm-10">
									<input type="text" class="form-control"
										value="${orInfo.orname }" disabled>
								</div>
							</div>
							<div class="row mb-3">
								<label for="" class="col-sm-2 col-form-label">주문가격</label>
								<div class="col-sm-10">
									<input type="text" class="form-control"
										value="${orInfo.orprice }" disabled>
								</div>
							</div>
							<div class="row mb-3">
								<label for="" class="col-sm-2 col-form-label">주문일시</label>
								<div class="col-sm-10">
									<input type="text" class="form-control"
										value="${orInfo.ordate }" disabled>
								</div>
							</div>
							<hr>
						</c:forEach>
					</div>
				</div>
			</div>
		</section>
	</main>
	<!-- Footer-->
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
</body>

</html>

