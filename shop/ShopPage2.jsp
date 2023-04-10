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
	<section class="shopsection px-5">
		<div class="shopmenu">
			<a href="${pageContext.request.contextPath }/shopPage1">축구화</a>
		</div>
		<div class="shopmenu">
			<a href="${pageContext.request.contextPath }/shopPage2">풋살화</a>
		</div>
		<div class="shopmenu">
			<a href="${pageContext.request.contextPath }/shopPage3">의류</a>
		</div>
		<div class="shopmenu">
			<a href="${pageContext.request.contextPath }/shopPage4">유니폼</a>
		</div>
		<div class="shopmenu">
			<a href="${pageContext.request.contextPath }/shopPage5">용품</a>
		</div>
	</section>
	<hr>
	<section class="py-5">
		<div class="container px-4 px-lg-5 mt-5">
			<div
				class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
				<c:forEach items="${shopList2 }" var="shop2">
					<div class="col mb-5">
						<div class="card h-100">
							<!-- Product image-->

							<img class="card-img-top" src="${shop2.shopimg }" alt="..." />
							<!-- Product details-->
							<div class="card-body p-4">
								<div class="text-center">
									<!-- Product name-->
									<input name="shopname" id="shopname" readonly="readonly"
										value="${shop2.shopname }" type="text"
										class="form-control-plaintext" disabled>
									<!-- Product price-->
									<input name="shopprice" id="shopprice" readonly="readonly"
										value="${shop2.shopprice } 원 " type="text"
										class="form-control-plaintext" disabled>
								</div>
							</div>
							<!-- Product actions-->
							<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
								<div class="text-center">

									<button id="" class="btn btn-outline-dark mt-auto"
										onclick="Kakaopay_Ready('${shop2.shopname }', '${shop2.shopprice }')">구매하기</button>

								</div>
							</div>
						</div>
					</div>
				</c:forEach>



			</div>
		</div>
	</section>
	<!-- Footer-->
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script
		src="${pageContext.request.contextPath }/resources/js/scripts.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	<script type="text/javascript">
		function Kakaopay_Ready(SelectOrname, SelectOrprice) {
			console.log("Kakaopay_Ready() 호출 : " + SelectOrname + " :: "
					+ SelectOrprice);
			//SelectOrname
			//SelectOrprice
			// 선택 정보가 모두 확인 되면 CONTROLLER에 KAKAOPAY_결제준비 요청
			$.ajax({
				type : "get",
				url : "${pageContext.request.contextPath }/Kakaopay_Ready",
				data : {
					"orname" : SelectOrname,
					"orprice" : SelectOrprice
				},
				async : false,
				success : function(popUpUrl) { // 결제QR코드 페이지 URL
					console.log(popUpUrl);
					if (popUpUrl != 'Fail') {
						window.open(popUpUrl, "payPopUp",
								"width=400, height=800, top=10, left=100");
					}
				}
			});
		}

		function pay_Result(payResult) {
			console.log(payResult);
			switch (payResult) {
			case 'Approval':
				alert("예매 되었습니다.");
				//예매정보 insert 기능 실행
				location.href = "${pageContext.request.contextPath }/";
				break;
			case 'Cancel':
				alert('예매처리중 결제가 취소 되었습니다.');
				break;
			case 'Fail':
				alert('예매처리중 결제를 실패 하였습니다.')
				break;
			}

		}
	</script>
</body>
</html>
