<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content />
<meta name="author" content />
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
		<!-- Page content-->
		<section class="py-5">
			<div class="container px-5">
				<!-- Contact form-->
				<div class="bg-light rounded-3 py-5 px-4 px-md-5 mb-5">
					<div class="text-center mb-5">
						<div
							class="feature bg-primary bg-gradient text-white rounded-3 mb-3">
							<i class="bi bi-envelope"></i>
						</div>
						<h1 class="fw-bolder">회원가입</h1>
						<p class="lead fw-normal text-muted mb-0">soccer.com</p>
					</div>
					<div class="row gx-5 justify-content-center">
						<div class="col-lg-8 col-xl-6">
							<form class="row g-3"
								action="${pageContext.request.contextPath }/memberJoin"
								method="post" enctype="multipart/form-data" onsubmit="return joinFormCheck(this)">
								
								<!-- Id input-->
								<div class="form-floating mb-3">
									<input type="text" name="mid" class="form-control form-control-user"
										placeholder="아이디" onkeyup="joinIdCheck(this.value)" /> <label for="id">아이디</label>
									<p class="pl-3 m-0 text-xs" id="idCheckMsg"></p>
									
								</div>
								<!-- Password input-->
								<div class="form-floating mb-3">
									<input type="password" name="mpw" class="form-control form-control-user"
										placeholder="비밀번호" required /> <label for="password">비밀번호</label>
							
								</div>
								<!-- Name input-->
								<div class="form-floating mb-3">
									<input type="text" name="mname" class="form-control form-control-user"
										placeholder="이름" required /> <label for="name">이름</label>
									
								</div>
								<!-- Birth input-->
								<div class="form-floating mb-3">
									<input type="date" name="mbirth" class="form-control form-control-user"
										placeholder="생년월일" required /> <label for="birth">생년월일</label>
									
								</div>
								<!-- Address input-->
								<div class="form-floating mb-3">
									<input type="text" name="maddr" class="form-control form-control-user"
										placeholder="주소" required /> <label for="address">주소</label>
									
								</div>
								<!-- Emailid input-->
								<div class="form-floating mb-3">
									<input type="text" name="memailid" class="form-control form-control-user"
										placeholder="이메일아이디" required></textarea>
									<label for="emailid">이메일아이디</label>
									
								</div>
								<div>
									<label for="inputSelectDomain" class="form-label" >도메인 선택</label>
									<select id="inputSelectDomain" class="form-select"
										name="memaildomain" >
										<option value="회원가입불가">도메인 선택</option>
										<option value="naver.com">naver.com</option>
										<option value="daum.net">daum.net</option>
										<option value="google.com">gmail.com</option>
									</select>
									
								</div>
								
								<!-- 회원가입 버튼-->
								<div class="d-grid">
									<button type="submit" class="btn btn-primary">회원가입</button>
								</div>
							</form>

						</div>
					</div>
				</div>

			</div>
		</section>
		
		
	</main>
	
	 <!-- Bootstrap core JavaScript-->
    <script src="${pageContext.request.contextPath }/resources/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="${pageContext.request.contextPath }/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="${pageContext.request.contextPath }/resources/js/sb-admin-2.min.js"></script>
	
	
	<script type="text/javascript">
	
		var msg = '${joinMsg}';
		if(msg.length > 0){
			alert(msg);
		}
		</script>
		
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>	
		<script type="text/javascript">
		function joinIdCheck(idVal){
			console.log("입력한 아이디 : " + idVal);
			if(idVal.length == 0){
				/* $("#idCheckMsg").text('아이디를 입력 해주세요!').css("color","red"); */
		        document.getElementById('idCheckMsg').style.color = 'red';
		        document.getElementById('idCheckMsg').innerText = '아이디를 입력 해주세요!';
			} else {
				
				$.ajax( { 
					type : "get",
					url : "${pageContext.request.contextPath }/memberIdCheck",
					data : { "inputId" : idVal },
					success : function(idCheckResult){
						console.log("idCheckResult : " + idCheckResult);
						if(idCheckResult == 'OK'){
							/* 아이디 사용 가능 */
							$("#idCheckMsg").text('사용가능한 아이디!').css("color","green"); 
							
						} else {
							/* 중복된 아이디 */
							$("#idCheckMsg").text('중복된 아이디!').css("color","red");
						}
					}
				} );
				
			}
		}
		
		
	</script>

</body>
</html>
