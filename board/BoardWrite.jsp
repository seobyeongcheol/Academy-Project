<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>게시판</title>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet" />
<link href="resources/css/styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js"
	crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed">
	<!-- 상단바 -->
	<%@ include file="/WEB-INF/views/include/topbar.jsp"%>

	<div id="layoutSidenav-content"
		style="padding-left: 3rem; padding-right: 3rem; position: absolute; width: 1300px; top: 45%; left: 50%; transform: translate(-50%, -50%);">
		<main>
			<div class="container-fluid">
				<h1 class="mt-4">게시판 글쓰기</h1>
				<ol class="breadcrumb mb-4">
					<li class="breadcrumb-item"><a
						href="${pageContext.request.contextPath }/boardListForm">전체글보기</a></li>
					<li class="breadcrumb-item active"><a
						href="${pageContext.request.contextPath }/boardListForm">게시판 </a></li>
				</ol>
				<hr>
				<section class="page-section" id="contact">
					<div class="container">
						<div class="row gx-4 gx-lg-5 justify-content-center">
							<div class="col-lg-8 col-xl-6 text-center">
								<h4 class="mt-0"></h4>
							</div>
						</div>
						<div class="row justify-content-center">
							<div class="col-sm-10">
								<form id="contactForm" data-sb-form-api-token="API_TOKEN"
									action="${pageContext.request.contextPath }/boardWrite"
									method="post" enctype="multipart/form-data">
									<!-- Name input-->
									<div class="form-floating mb-3">
										<select class="form-select" id="inputBtype" name="btype">
											<option selected>게시판을 선택해주세요.</option>
											<option value="자유게시판">자유게시판</option>
											<option value="건의/질의">건의/질의</option>
											<option value="기타">기타</option>
											<option value="공지사항">공지사항</option>
										</select>
									</div>
									<!-- Email address input-->
									<div class="form-floating mb-3 col-sm-12">
										<input class="form-control" id="inputTitle" type="text" name="btitle"
											placeholder="name@example.com"
											data-sb-validations="required,title">
											 <label for="title">제목을 입력해주세요.</label>
										<div class="invalid-feedback"
											data-sb-feedback="title:required">제목을 입력해주세요.</div>

									</div>

									<!-- Message input-->
									<div class="form-floating mb-3">
										<textarea class="form-control" id="inputContents" name="bcontents"
											placeholder="Enter your message here..."
											style="height: 10rem" data-sb-validations="required"></textarea>
										<label for="message">내용을 입력해주세요.</label>
										<div class="invalid-feedback"
											data-sb-feedback="message:required">내용을 입력해주세요.</div>
									</div>

									<div class="form-group">
										<label for="inputFile" class="font-weight-bold "></label> <input
											type="file" name="bfile" id="inputFile"
											class="form-control form-control-user"
											style="padding-top: 11px; height: 48px;">
									</div>
									<!-- Submit success message-->
									<!---->
									<!-- This is what your users will see when the form-->
									<!-- has successfully submitted-->
									<div class="d-none" id="submitSuccessMessage">
										<div class="text-center mb-3">
											<div class="fw-bolder">글등록을 완료했습니다.</div>
											<br /> <a
												href="${pageContext.request.contextPath }/boardListForm">내가
												작성한 글 보러가기</a>
										</div>
									</div>
									<!-- Submit error message-->
									<!---->
									<!-- This is what your users will see when there is-->
									<!-- an error submitting the form-->
									<div class="d-none" id="submitErrorMessage">
										<div class="text-center text-danger mb-3">Error sending
											message!</div>
									</div>

									<!-- Submit Button, 파일첨부 버튼 -->
									<div class="d-grid col-lg-2" style="padding-bottom: 20px;">
										<input class="btn btn-primary " type="submit"
											id="submitButton" value="등록">
									</div>
								</form>
							</div>
						</div>

					</div>
				</section>

			</div>
		</main>
		<footer class="py-4 bg-light mt-auto">
			<div class="container-fluid px-4">
				<div class="d-flex align-items-center justify-content-between small">
					<div class="text-muted">Copyright &copy; Your Website 2022</div>
					<div>
						<a href="#">Privacy Policy</a> &middot; <a href="#">Terms
							&amp; Conditions</a>
					</div>
				</div>
			</div>
		</footer>
	</div>
	</div>



	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- SimpleLightbox plugin JS-->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/SimpleLightbox/2.1.0/simpleLightbox.min.js"></script>
	<!-- Core theme JS-->
	<script src="resources/js/scripts.js"></script>
	<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
</body>
</html>
