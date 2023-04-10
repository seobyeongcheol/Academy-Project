<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
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
		<%@ include file="/WEB-INF/views/include/topbar.jsp" %>
		<!-- Page content-->
		<section class="py-5">
			<div class="container px-5">
				<!-- Contact form-->
				<div class="bg-light rounded-3 py-5 px-4 px-md-5 mb-5">
					<div class="text-center mb-5">
						<div class="feature bg-primary bg-gradient text-white rounded-3 mb-3"><i class="bi bi-envelope"></i></div>
						<h1 class="fw-bolder">로그인</h1>
						<p class="lead fw-normal text-muted mb-0">football.com</p>
					</div>
					<div class="row gx-5 justify-content-center">
						<div class="col-lg-8 col-xl-6">
							
							
							<form action="${pageContext.request.contextPath }/memberLogin" method="post">
							   <!-- Id input-->
							<div class="form-floating mb-3">
								<input class="form-control" name="mid" type="text"
										data-sb-validations="required" /> <label for="id">아이디</label>
							</div>
							<!-- Password input-->
							<div class="form-floating mb-3">
								<input class="form-control" name="mpw" type="password"
										data-sb-validations="required" /> <label for="password">비밀번호</label>
								
							</div>
								
								<!-- Submit Button-->
								<div class="d-grid"><button type="submit" class="btn btn-primary">로그인</button></div>
							</form>
							<hr>
							<div class="text-center">
                                        
							
						</div>
					</div>
				</div>
				
			</div>
		</section>
	</main>
	
	<script type="text/javascript">
		var msg = '${loginMsg}';
		if(msg.length > 0){
			alert(msg);
		}
	</script>
	
</body>
</html>
