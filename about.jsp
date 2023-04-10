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
		<header class="py-5">
			<div class="container px-5">
				<div class="row justify-content-center">
					<div class="col-lg-8 col-xxl-6">
						<div class="text-center my-5">
							<h1 class="fw-bolder mb-3">세계 최대, 최고의 "축구" 플랫폼!</h1>
							<p class="lead fw-normal text-muted mb-4">
								<b>football.com</b>에서 <b>축구</b>에 대한 <b>최신 뉴스 정보</b>와 <b>하이라이트
									영상</b>, <br> 인기 경기 <b>프리미어리그 경기 일정/순위/결과 확인</b>, 자유로운 분위기의 <b>커뮤니티</b>,
								국내 최대 규모의 <b>굿즈샵</b> <br> 이 모든 것들을 <b>football.com</b>에서
								한번에 경험해 보세요!


							</p>
							<a class="btn btn-primary btn-lg" href="#scroll-target">계속 보기</a>
							<img class="img-fluid rounded mb-5 mb-lg-0"
								src="resources/img/arrow.png" width="50" alt="이미지" />
						</div>
					</div>
				</div>
			</div>
		</header>
		<!-- 최신 축구 소식 & 하이라이트-->
		<section class="py-5 bg-light" id="scroll-target">
			<div class="container px-5 my-5">
				<div class="row gx-5 align-items-center">
					<div class="col-lg-6">
						<img class="img-fluid rounded mb-5 mb-lg-0"
							src="resources/img/news.jpg" width="350" alt="이미지" />
					</div>
					<div class="col-lg-6">
						<h2 class="fw-bolder">최신 축구 소식 &amp; 하이라이트</h2>
						<p class="lead fw-normal text-muted mb-0">
							어느 곳에서보다 빠르게 최신 축구 소식들을 접하고 <br> 하이라이트 영상 까지 한눈에 살펴보세요!
						</p>
						<br> <a class="btn btn-primary btn-lg"
							href="${pageContext.request.contextPath }/highlightForm">뉴스/하이라이트
							바로가기</a> <img class="img-fluid rounded mb-5 mb-lg-0"
							src="resources/img/play.png" width="50" alt="이미지" />
					</div>
				</div>
			</div>
		</section>
		<!-- 승부예측 -->
		<section class="py-5">
			<div class="container px-5 my-5">
				<div class="row gx-5 align-items-center">
					<div class="col-lg-6 order-first order-lg-last">
						<img class="img-fluid rounded mb-5 mb-lg-0"
							src="resources/img/audience.jpg" alt="이미지" />
					</div>
					<div class="col-lg-6">
						<h2 class="fw-bolder">경기정보</h2>
						<p class="lead fw-normal text-muted mb-0">
							전 세계 인기리그인 프리미어리그의<br> 경기 결과와 일정 순위까지 확인해보세요
						</p>
						<br> <a class="btn btn-primary btn-lg"
							href="${pageContext.request.contextPath }/premierRanking">프리미어리그
							경기정보 바로가기</a> <img class="img-fluid rounded mb-5 mb-lg-0"
							src="resources/img/target.png" width="50" alt="이미지" />
					</div>
				</div>
			</div>
		</section>
		<!-- 커뮤니티 -->
		<section class="py-5 bg-light" id="scroll-target">
			<div class="container px-5 my-5">
				<div class="row gx-5 align-items-center">
					<div class="col-lg-6">
						<img class="img-fluid rounded mb-5 mb-lg-0"
							src="resources/img/community.png" width="400" alt="이미지" />
					</div>
					<div class="col-lg-6">
						<h2 class="fw-bolder">커뮤니티 게시판</h2>
						<p class="lead fw-normal text-muted mb-0">
							축구를 사랑하고 좋아하는 다른 유저들과<br> 자유롭게 의견을 나누고 공유해 보세요!
						</p>
						<br> <a class="btn btn-primary btn-lg"
							href="${pageContext.request.contextPath }/boardListForm">커뮤니티
							게시판 바로가기</a> <img class="img-fluid rounded mb-5 mb-lg-0"
							src="resources/img/pencil.png" width="50" alt="이미지" />
					</div>
				</div>
			</div>
		</section>
		<!-- Team members section-->
		<section class="py-5 bg-light">
			<div class="container px-5 my-5">
				<div class="text-center">
					<h2 class="fw-bolder">Our team</h2>
					<p class="lead fw-normal text-muted mb-5">Dedicated to quality
						and your success</p>
				</div>
				<div
					class="row gx-5 row-cols-1 row-cols-sm-2 row-cols-xl-4 justify-content-center">
					<div class="col mb-5 mb-5 mb-xl-0">
						<div class="text-center">
							<h5 class="fw-bolder">Cho Hyeonbin</h5>
							<h5 class="fw-bolder">조현빈</h5>
							<div class="fst-italic text-muted">Founder &amp; CEO</div>
						</div>
					</div>
					<div class="col mb-5 mb-5 mb-xl-0">
						<div class="text-center">
							<h5 class="fw-bolder">Seo Byeongcheol</h5>
							<h5 class="fw-bolder">서병철</h5>
							<div class="fst-italic text-muted">CFO</div>
						</div>
					</div>
					<div class="col mb-5 mb-5 mb-sm-0">
						<div class="text-center">
							<h5 class="fw-bolder">Choi Jonghun</h5>
							<h5 class="fw-bolder">최종훈</h5>
							<div class="fst-italic text-muted">Operations Manager</div>
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
