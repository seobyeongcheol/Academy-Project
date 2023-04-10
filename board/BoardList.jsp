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

	<div id="layoutSidenav-content">
		<main>
			<div class="container-fluid px-4">
				<h1 class="mt-4">게시판 목록</h1>
				<div
					style="max-width: calc(85% - 180px - 357px - 60px); margin: 0 auto;">
					<ol class="breadcrumb mb-4">
						<li class="breadcrumb-item"><a
							href="${pageContext.request.contextPath }/boardWriteForm">글쓰기</a></li>
						<li class="breadcrumb-item active">게시판</li>
					</ol>
					<div class="card mb-4">
						<div class="card-header">
							<div class="listtable-dropdown"></div>
						</div>
						<div class="card-body">
							<table id="datatablesSimple">
								<thead>
									<tr>
										<th>글번호</th>
										<th>글제목</th>
										<th>게시판</th>
										<th>작성자</th>
										<th>작성일</th>
										<th>추천수</th>
									</tr>
								</thead>
								<tfoot>
									<tr>
										<th>Number</th>
										<th>Title</th>
										<th>Type</th>
										<th>Writer</th>
										<th>Date</th>
										<th>Hits</th>
									</tr>
								</tfoot>
								<tbody>
									<c:forEach items="${boardList }" var="board">
										<tr>
											<td>${board.bnum }</td>
											<td><a
												href="${pageContext.request.contextPath }/boardView?viewBnum=${board.bnum }">
													${board.btitle } </a></td>
											<td>${board.btype }</td>
											<td>${board.bwriter }</td>
											<td>${board.bdate }</td>
											<td>${board.bhits }</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				<%@ include file="/WEB-INF/views/include/footer.jsp"%>
				</div>
			</div>
		</main>

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
