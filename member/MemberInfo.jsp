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
			<div class="container px-5"
				style="padding: 3rem; margin: 3rem;">
				<div class="bg-light rounded-3 py-5 px-4 px-md-5 mb-5"
					style="padding-right: 3rem; padding-left: 3rem; border-radius: 0.3rem; position: absolute; width:800px; top: 50%; left: 50%; transform: translate(-50%, -50%);">

					<div class="card">
						<div class="card-body">
							<h5 class="card-title">회원정보 출력</h5>
							<br>

							<!-- General Form Elements -->
							<c:forEach items="${memberList }" var="member">
								<form>
									<div class="row mb-3">
										<label for="inputMid" class="col-sm-2 col-form-label">아이디</label>
										<div class="col-sm-10">
											<input type="text" class="form-control"
												value="${member.mid }" disabled>
										</div>
									</div>
									<div class="row mb-3">
										<label for="inputMpw" class="col-sm-2 col-form-label">비밀번호</label>
										<div class="col-sm-10">
											<input type="password" class="form-control"
												value="${member.mpw }" disabled>
										</div>
									</div>
									<div class="row mb-3">
										<label for="inputMemailid" class="col-sm-2 col-form-label">이메일</label>
										<div class="col-sm-10">
											<input type="text" class="form-control"
												value="${member.memailid }@${member.memaildomain }" disabled>
										</div>
									</div>
									<div class="row mb-3">
										<label for="inputMbirth" class="col-sm-2 col-form-label">생년월일</label>
										<div class="col-sm-10">
											<input type="text" class="form-control"
												value="${member.mbirth }" disabled>
										</div>
									</div>

									<div class="row mb-3">
										<label for="inputMname" class="col-sm-2 col-form-label">이름</label>
										<div class="col-sm-10">
											<input type="text" class="form-control"
												value="${member.mname }" disabled>
										</div>
									</div>
									<div class="row mb-3">
										<label for="inputMaddr" class="col-sm-2 col-form-label">주소</label>
										<div class="col-sm-10">
											<input type="text" class="form-control"
												value="${member.maddr }" disabled>
										</div>
									</div>
									<div class="col-12 ">
										<div class="col-sm-5 col-form-label">
											<a href="/controller/memberLogout" type="button">로그아웃</a>
										</div>
									</div>
								</form>
								<!-- End General Form Elements -->
							</c:forEach>
						</div>
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

