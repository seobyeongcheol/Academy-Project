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
	<div id="layoutSidenav_content">
		<main>
			<div class="container-fluid px-4">
				<h1 class="mt-4">프리미어리그</h1>
				<div style="max-width: calc(85% - 180px - 357px - 60px); margin: 0 auto;">
				<ol class="breadcrumb mb-4">
					<li class="breadcrumb-item active"><a
						href="${pageContext.request.contextPath }/MatchSchedule">경기일정</a></li>
					<li class="breadcrumb-item active"><a
						href="${pageContext.request.contextPath }/test01">경기결과</a></li>
					<li class="breadcrumb-item"><a
						href="${pageContext.request.contextPath }/premierRanking">순위</a></li>
				</ol>
				<div class="card mb-4" >
					<div class="card-header">
						<i class="fas fa-table me-1"></i> 2022/2023 프리미어리그 순위
					</div>
					<div class="card-body">
						<table id="datatablesSimple">
							<thead>
								<tr>
									<th>순위</th>
									<th>클럽명</th>
									<th>경기수</th>
									<th>승점</th>
									<th>승리</th>
									<th>무승부</th>
									<th>패배</th>
									<th>골득실</th>
									<th>득점</th>
									<th>실점</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${RankList }" var="Rank">
									<tr>
										<td>${Rank.rank }</td>
										<td> <img alt="" src="${Rank.clubimg}"> &nbsp;  ${Rank.club }</td>
										<td>${Rank.played }</td>
										<td>${Rank.points }</td>
										<td>${Rank.win }</td>
										<td>${Rank.draw }</td>
										<td>${Rank.lose }</td>
										<td>${Rank.goaldif }</td>
										<td>${Rank.goalscore }</td>
										<td>${Rank.goallose }</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<div></div>
					</div>
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
