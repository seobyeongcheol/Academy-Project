<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />

<title>Shop Homepage - Start Bootstrap Template</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<style type="text/css">
.reserveArea {
	height: 150px;
	overflow: scroll;
}

.selObj {
	background-color: blue;
	color: white;
}

.listTitle {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	width: 100%;
	display: inline-block;
}
</style>
<!-- CSS 스프링 안에서 연결  -->
<link
	href="${pageContext.request.contextPath }/resources/css/styles.css"
	rel="stylesheet">

<!-- 스프링 안에서 연결  -->
</head>
<body>
	<!-- Header-->
	<header>
		<!-- Navigation-->
		<%@ include file="/WEB-INF/views/include/topbar.jsp"%>
	</header>

	<br>
	<br>
	<br>
	<!-- Section-->
	<section>

		<div
			style="border: 1px solid gray; font-size: 25px; text-align: center; background-color: white; float: left; height: 50px; width: 20%;">
			<a href="${pageContext.request.contextPath }/shosPage1">축구화</a>
		</div>
		<div
			style="border: 1px solid gray; font-size: 25px; text-align: center; background-color: white; float: left; height: 50px; width: 20%;">
			<a href="${pageContext.request.contextPath }/shopPage2">풋살화</a>
		</div>
		<div
			style="border: 1px solid gray; font-size: 25px; text-align: center; background-color: white; float: left; height: 50px; width: 20%;">
			<a href="${pageContext.request.contextPath }/shopPage3">의류</a>
		</div>
		<div
			style="border: 1px solid gray; font-size: 25px; text-align: center; background-color: white; float: left; height: 50px; width: 20%;">
			<a href="${pageContext.request.contextPath }/shopPage4">유니폼</a>
		</div>
		<div
			style="border: 1px solid gray; font-size: 25px; text-align: center; background-color: white; float: left; height: 50px; width: 20%;">
			<a href="${pageContext.request.contextPath }/shopPage5">용품</a>
		</div>

		<br>
		<br>
		<br>
		<br>

		<div
			style="border: 1px solid gray; font-size: 25px; text-align: center; background-color: black; color: white; float: left; height: 50px; width: 100%;">인기상품</div>

	</section>
	<section class="py-5">
		<div class="container px-4 px-lg-5 mt-5">
			<div
				class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
				<div class="col mb-5">
					<div class="card h-100">
						<!-- Product image-->
						<c:forEach items="${shopList }" var="shop">
							<img class="card-img-top" src="${shop.shopimg }"
								alt="..." />
							<!-- Product details-->
							<div class="card-body p-4">
								<div class="text-center">
									<!-- Product name-->
									<h5 class="fw-bolder">
										나이키 줌 머큐리얼 <br>슈퍼플라이 9 엘리트 FG
									</h5>
									<!-- Product price-->
									329,000원${shop. }
								</div>
							</div>
							<!-- Product actions-->
							<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
								<div class="text-center">
									<form action="${pageContext.request.contextPath }/product1"
										method="get">
										<a class="btn btn-outline-dark mt-auto"
											href="${pageContext.request.contextPath }/shopBuy">구매하기</a>
									</form>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
				<div class="col mb-5">
					<div class="card h-100">
						<!-- Product image-->
						<img class="card-img-top" src="resources/img/itemb-1.jpg"
							alt="..." />
						<!-- Product details-->
						<div class="card-body p-4">
							<div class="text-center">
								<!-- Product name-->
								<h5 class="fw-bolder">
									아디다스 프레데터<br>엣지.3 L TF
								</h5>
								<!-- Product price-->
								83,000원
							</div>
						</div>
						<!-- Product actions-->
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							<div class="text-center">
								<a class="btn btn-outline-dark mt-auto"
									href="${pageContext.request.contextPath }/shopBuy">구매하기</a>
							</div>
						</div>
					</div>
				</div>
				<div class="col mb-5">
					<div class="card h-100">
						<!-- Product image-->
						<img class="card-img-top" src="resources/img/itemc-1.jpg"
							alt="..." />
						<!-- Product details-->
						<div class="card-body p-4">
							<div class="text-center">
								<!-- Product name-->
								<h5 class="fw-bolder">
									나이키 AS 드라이<br>스트라이크 드릴탑
								</h5>
								<!-- Product price-->
								65,000원
							</div>
						</div>
						<!-- Product actions-->
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							<div class="text-center">
								<a class="btn btn-outline-dark mt-auto"
									href="${pageContext.request.contextPath }/shopBuy">구매하기</a>
							</div>
						</div>
					</div>
				</div>
				<div class="col mb-5">
					<div class="card h-100">
						<!-- Product image-->
						<img class="card-img-top" src="resources/img/itemd-1.jpg"
							alt="..." />
						<!-- Product details-->
						<div class="card-body p-4">
							<div class="text-center">
								<!-- Product name-->
								<h5 class="fw-bolder">
									나이키 토트넘 홈<br>브리드스타디움 저지 s/s
								</h5>
								<!-- Product price-->
								82,000원
							</div>
						</div>
						<!-- Product actions-->
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							<div class="text-center">
								<a class="btn btn-outline-dark mt-auto"
									href="${pageContext.request.contextPath }/shopBuy">구매하기</a>
							</div>
						</div>
					</div>
				</div>
				<div class="col mb-5">
					<div class="card h-100">
						<!-- Product image-->
						<img class="card-img-top" src="resources/img/iteme-1.jpg"
							alt="..." />
						<!-- Product details-->
						<div class="card-body p-4">
							<div class="text-center">
								<!-- Product name-->
								<h5 class="fw-bolder">
									나이키 GK 팬텀 쉐도우<br>GK장갑 백색
								</h5>
								<!-- Product price-->
								79,000원
							</div>
						</div>
						<!-- Product actions-->
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							<div class="text-center">
								<a class="btn btn-outline-dark mt-auto"
									href="${pageContext.request.contextPath }/shopBuy">구매하기</a>
							</div>
						</div>
					</div>
				</div>
				<div class="col mb-5">
					<div class="card h-100">
						<!-- Product image-->
						<img class="card-img-top" src="resources/img/iteme-2.jpg"
							alt="..." />
						<!-- Product details-->
						<div class="card-body p-4">
							<div class="text-center">
								<!-- Product name-->
								<h5 class="fw-bolder">
									아디다스 커넥스트 21<br>프로 매치볼 축구공
								</h5>
								<!-- Product price-->
								109,000원
							</div>
						</div>
						<!-- Product actions-->
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							<div class="text-center">
								<a class="btn btn-outline-dark mt-auto"
									href="${pageContext.request.contextPath }/shopBuy">구매하기</a>
							</div>
						</div>
					</div>
				</div>
				<div class="col mb-5">
					<div class="card h-100">
						<!-- Product image-->
						<img class="card-img-top" src="resources/img/itemc-2.jpg"
							alt="..." />
						<!-- Product details-->
						<div class="card-body p-4">
							<div class="text-center">
								<!-- Product name-->
								<h5 class="fw-bolder">
									아디다스 티로트레이닝<br>에센셜 저지 검정
								</h5>
								<!-- Product price-->
								22,000원
							</div>
						</div>
						<!-- Product actions-->
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							<div class="text-center">
								<a class="btn btn-outline-dark mt-auto"
									href="${pageContext.request.contextPath }/shopBuy">구매하기</a>
							</div>
						</div>
					</div>
				</div>
				<div class="col mb-5">
					<div class="card h-100">
						<!-- Product image-->
						<img class="card-img-top" src="resources/img/itemd-2.jpg"
							alt="..." />
						<!-- Product details-->
						<div class="card-body p-4">
							<div class="text-center">
								<!-- Product name-->
								<h5 class="fw-bolder">
									나이키 바르셀로나<br>21-22 매치 홈 저지 s/s
								</h5>
								<!-- Product price-->
								139,000원
							</div>
						</div>
						<!-- Product actions-->
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							<div class="text-center">
								<a class="btn btn-outline-dark mt-auto"
									href="${pageContext.request.contextPath }/shopBuy">구매하기</a>
							</div>
						</div>
					</div>
				</div>
	</section>
	<!-- Footer-->
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
</body>
</html>
