<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<link
	href="${pageContext.request.contextPath }/resources/css/styles.css"
	rel="stylesheet" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
	crossorigin="anonymous"></script>

<style type="text/css">
</style>

</head>
<body class="pl-2">
	<%@ include file="/WEB-INF/views/include/topbar.jsp"%>

	<div class="boardview-contents" style="">
		<div class="pc_content_header_title">
			<form action="${pageContext.request.contextPath }/boardModify"
				method="post" class="user">
				<input type="hidden" name="bnum" value="${board.bnum }">

				<div class="pc_content_header_info">

					<strong class="pc_content_header_text__1foaF">(${board.btype})
						<br> <input name="btitle" readonly="readonly"
						id="inputBtitle" value="${board.btitle }" type="text"
						id="inputBtitle" class="form-control-plaintext">
					</strong>
					<div class="pc_content_header_info_user__2qB7m">
						<span class="pc_content_header_name__3mqM0"
							style="color: rgb(196, 100, 255);">${board.bwriter }</span>
					</div>
					<div class="pc_content_header_info_content__3xntT">
						<span class="pc_content_header_timestamp__tbCoq">${board.bdate }</span>
						<span class="pc_content_header_ico__3Aebb"><span
							class="blind">조회수</span></span><span
							class="pc_content_header_viewcount__2p0Ka">${board.bhits}</span>
						<span class="pc_content_header_home" style="float: right;">
							<a class="btn btn-outline-dark" style="font-size: x-small;"
							href="${pageContext.request.contextPath }/boardListForm">게시판
								돌아가기</a>
						</span> <span class="pc_content_header_delete modifyCol"
							style="float: right;"> <!-- 로그인 아이디와 작성자가 일치할 경우 --> <c:if
								test="${sessionScope.loginId == board.bwriter }">
								<button type="button" style="font-size: x-small;"
									onclick="toggleModForm('open')"
									class="btn btn-outline-primary ">글수정</button>
								<a class="btn btn-outline-danger" style="font-size: x-small;"
									href="${pageContext.request.contextPath }//boardDeleteUpdate?viewBnum=${board.bnum}">글삭제</a>
							</c:if>
						</span>
						<c:if test="${sessionScope.loginId == board.bwriter }">
							<div class="col-sm-3 mb-3 mb-sm-0 modifyCol d-none">
								<button type="submit" style="font-size: x-small;"
									class="btn btn-outline-primary ">수정</button>
								<button type="button" style="font-size: x-small;"
									onclick="toggleModForm('close')"
									class="btn btn-outline-danger ">취소</button>
							</div>
						</c:if>
					</div>
				</div>
				<hr>
				<div class="pc_content_header_bfile_info">
					<img alt="" class="form-control-user img-fluid" width="300px;"
						src="${pageContext.request.contextPath }/resources/boardUpLoad/${board.bfilename}">
				</div>
				<div class="pc_content_body_info">
					<p class="se-text-paragraph se-text-paragraph-align- " id=""
						style="line-height: 1.8;">
						<span class="se-fs-fs15 se-ff-system  se-style-unset " id=""
							style="color: rgb(67, 67, 67);"></span>
						<textarea name="bcontents" readonly="readonly" id="inputContent"
							class="form-control-plaintext" rows="10">${board.bcontents }</textarea>
					</p>
				</div>
			</form>
			<div class="pc_content_reply_info">
				<form action="${pageContext.request.contextPath }/replyWrite"
					method="post">
					<input type="hidden" name="rebno" value="${board.bnum }"> <input
						type="hidden" name="rname" value="${sessionScope.loginId}">
					<div class="comment_list_input_area__2Twke">
						<div class="input_container">
							<div class="input_wrap">
								<div class="input_content__1GHUa">
									<div class="input_guide__10asE">
										<c:choose>
											<c:when test="${sessionScope.loginId !=null }">
												<textarea placeholder="댓글을 입력하세요" class="input_textarea"
													name="rcontents" id="inputrcontents"
													style="height: 20px !important;"></textarea>
											</c:when>
											<c:otherwise>
												<a class="guide_button" type="button"
													style="width: 100%; height: 100%;"
													href="${pageContext.request.contextPath }/memberLoginForm">로그인
													후 작성하실 수 있습니다.</a>
											</c:otherwise>
										</c:choose>
									</div>
									<div class="input_attachment_area__u7mkr"></div>
								</div>
								<div class="input_bottom_area__2qmr1">
									<button type="submit"
										class="btn btn-primary btn-user btn-block"
										style="float: right;">등록</button>
								</div>
							</div>
						</div>
					</div>
				</form>
				<hr>
				<div class="pc_content_comment__qm9f2">
					<div class="header_info__2r6U4">
						<strong class="header_count__2MM61">댓글</strong>
					</div>

					<c:forEach items="${replyList }" var="reply">
						<div class="comment_list_container__1ifX0">
							<div class="header_wrap__msv8Y"></div>
							<div class="comment_list_wrap__1c4Ku">
								<div id="commentBox1" class="comment_item_wrap">
									<div class="comment_item_top_area">
										<div class="comment_item_profile">
											<c:if test="${sessionScope.loginId == reply.rname }">
												<button type="button"
													style="font-size: x-small; float: right;"
													class="text-xs btn btn-sm btn-user text-primary"
													onclick="replyDelete_ajax('${reply.renum}')">삭제</button>
											</c:if>
											<div class="comment_item_user">
												<input type="text" readonly="readonly" name="rname"
													value="${reply.rname }" disabled>

											</div>
										</div>

									</div>
									<div class="comment_item_content">
										<div class="comment_item_text__3zn-i">
											<span class="comment_item_best__2AHhd">${reply.rcontents }</span>
										</div>
										<div class="comment_item_attachment__3S261"></div>
									</div>
									<div class="comment_item_bottom_area">
										<div class="comment_item_sub">
											<span class="comment_item_time__3KesG">${reply.rdate }</span>
										</div>

										<div class="comment_item_goodbad">

											<button type="button"
												class="text-xs btn btn-sm border-primary btn-user text-primary"
												style="font-size: x-small;"
												onclick="replyLike('${reply.renum}',this)">
												추천 <span>${reply.relikeCount }</span>
											</button>

										</div>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>


	<!-- Bootstrap core JavaScript-->
	<script
		src="${pageContext.request.contextPath }/resources/vendor/jquery/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script
		src="${pageContext.request.contextPath }/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script
		src="${pageContext.request.contextPath }/resources/js/sb-admin-2.min.js"></script>
<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	<script type="text/javascript">
		var titleVal = "";
		var contentVal = "";

		function toggleModForm(btnType) {
			console.log("눌리긴함")
			console.log(titleVal.value)
			console.log(contentVal.value)

			$(".modifyCol").toggleClass("d-none");

			if (btnType == 'open') {
				titleVal = $("#inputBtitle").val();
				contentVal = $("#inputContent").val();
				$("#inputBtitle").removeAttr("readonly");
				$("#inputContent").removeAttr("readonly");
			} else {
				$("#inputBtitle").val(titleVal);
				$("#inputContent").val(contentVal);
				$("#inputBtitle").attr("readonly", "readonly");
				$("#inputContent").attr("readonly", "readonly");
			}

		}

		function replyLike(renum, likeBtn) {
			var loginId = '${sessionScope.loginId}';

			if (loginId.length > 0) {
				$.ajax({
					type : "get",
					url : "${pageContext.request.contextPath }/replyLike",
					data : {
						"rlnum" : renum,
						"rlmid" : loginId
					},
					dataType : "json",
					async : false,
					success : function(result) {
						$(likeBtn).html('추천 ' + result.likeCount);
					}
				});
			} else {
				alert('로그인 후 추천 가능합니다.');
				location
						.replace("${pageContext.request.contextPath }/memberLoginForm");
			}
		}

		function replyDelete_ajax(renum, rlnum) {
			console.log("삭제할 댓글 번호 : " + renum);
			console.log("삭제할 추천댓글 번호 : " + renum);
			$.ajax({
				type : "get",
				url : "${pageContext.request.contextPath }/replyDelete_ajax",
				data : {
					"renum" : renum
				},
				async : false,
				success : function(checkResult) {
					console.log(checkResult);
					if (checkResult != '1') {
						alert("댓글 삭제 성공");
						location.reload();
						replyList(viewBno);
					} else {
						alert("댓글 삭제 실패");
					}
				}
			});
		}
	</script>

</body>
</html>