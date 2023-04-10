<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<nav class="navbar navbar-expand-lg navbar-dark bg-white">
	<div class="container pl-5">
		<div class="collapse navbar-collapse">
			<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
				<c:choose>
					<c:when test="${sessionScope.loginId == null }">
						<li class="nav-item"><a class="nav-link"
							style="color: black;"
							href="${pageContext.request.contextPath }/memberJoinForm">회원가입</a></li>
						<li class="nav-item"><a class="nav-link"
							style="color: black;"
							href="${pageContext.request.contextPath }/memberLoginForm">로그인</a></li>
					</c:when>
					<c:otherwise>
						<li class="nav-item"><a class="nav-link"
							style="color: black;"
							href="${pageContext.request.contextPath }/memberList">회원 ID:
								${sessionScope.loginId} 님</a></li>
						<li class="nav-item"><a class="nav-link"
							style="color: black;"
							href="${pageContext.request.contextPath }/memberLogout">로그아웃</a></li>
						<li class="nav-item"><a class="nav-link"
							style="color: black;"
							href="${pageContext.request.contextPath}/memberList">내정보확인</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
	</div>
</nav>
<nav class="navbar navbar-expand-lg navbar-dark "
	style="background-color: black;">
	<div class="container px-5">
		<a class="navbar-brand"
			href="${pageContext.request.contextPath }/Main">football.com</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link"
					href="${pageContext.request.contextPath }/Main">메인페이지</a></li>
				<li class="nav-item"><a class="nav-link"
					href="${pageContext.request.contextPath }/aboutForm">소개</a></li>
				<li class="nav-item"><a class="nav-link"
					href="${pageContext.request.contextPath }/test01">경기정보</a></li>

				<li class="nav-item"><a class="nav-link"
					href="${pageContext.request.contextPath }/newsForm">뉴스</a></li>
				<li class="nav-item"><a class="nav-link"
					href="${pageContext.request.contextPath }/highlightForm">하이라이트</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" id="navbarDropdownBlog" href="#"
					role="button" data-bs-toggle="dropdown" aria-expanded="false">
						굿즈</a>
					<ul class="dropdown-menu dropdown-menu-end"
						aria-labelledby="navbarDropdownBlog">
						<li><a class="dropdown-item"
							href="${pageContext.request.contextPath }/shopPage1">굿즈 구매 </a></li>

						<li><a class="dropdown-item"
							href="${pageContext.request.contextPath }/orderInfo">주문내역</a></li>
					</ul></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" id="navbarDropdownBlog" href="#"
					role="button" data-bs-toggle="dropdown" aria-expanded="false">게시판</a>
					<ul class="dropdown-menu dropdown-menu-end"
						aria-labelledby="navbarDropdownBlog">
						<li><a class="dropdown-item"
							href="${pageContext.request.contextPath }/boardListForm">게시판
								목록</a></li>
						<li><a class="dropdown-item"
							href="${pageContext.request.contextPath }/boardWriteForm">글
								작성</a></li>
					</ul></li>
			</ul>
		</div>
	</div>
</nav>