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
		style="padding-left: 3rem; padding-right: 3rem; position: absolute; width: 1300px; top: 40%; left: 50%; transform: translate(-50%, -50%);">
		<main>
			<div class="container-fluid col-mb-3 px-4 py-4">
				<h1 class="mt-4">공지사항</h1>
				<ol class="breadcrumb mb-4">
					<li class="breadcrumb-item"><a href="index.html">글쓰기</a></li>
					<li class="breadcrumb-item active">게시판</li>
				</ol>

				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-table me-1"></i> 공지사항
					</div>
					<div class="card-body">
						<table id="datatablesSimple">
							<thead>
								<tr>
									<th>글번호</th>
									<th>작성자</th>
									<th>작성일</th>
									<th>조회수</th>
									<th>추천수</th>
								</tr>
							</thead>
							<tfoot>
								<tr>
									<th>Name</th>
									<th>Position</th>
									<th>Office</th>
									<th>Age</th>
									<th>Start date</th>
								</tr>
							</tfoot>
							<tbody>

								<!-- 공지사항 테이블생성후 데이터 넣기(board X) -->
								<c:forEach items="${boardList }" var="board">
									<tr>
										<td>${board.bnum }</td>
										<td>
										<a href="${pageContext.request.contextPath }/boardView?viewBnum=${board.bnum }"> ${board.btitle } </a></td>
										<td>${board.bwriter }</td>
										<td>${board.bdate }</td>
										<td>${board.bhits }</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
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
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="resources/js2/scripts.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
		crossorigin="anonymous"></script>
	<script src="resources/js2/datatables-simple-demo.js"></script>
</body>
</html>
