<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Modern Business - Start Bootstrap Template</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon"
	href="${pageContext.request.contextPath }/assets/favicon.ico" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- CSS 스프링 안에서 연결  -->
<link
	href="${pageContext.request.contextPath }/resources/css/styles.css"
	rel="stylesheet">
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css"
	rel="stylesheet">
<!-- 스프링 안에서 연결  -->
</head>
<body>
	<div class="py-5">
		<div class="card mx-auto" style="width:auto; height: 500px;">
			<div class="card-body">
				<div class="row mb-3 p-2" id="chatcontainer">
					<div id="chatList" class="col p-4"
						style="color: black; background-color: lightblue;">

						<div class="text-center my-4"
							style="padding-bottom: 1rem; padding-top: 0.5rem">
							<span class="p-2 chatMsg" style="background-color: white;">
								채팅을 시작해보세요!</span>
						</div>
						<div class="text-left"
							style="text-align: left; padding-bottom: 1rem; padding-top: 1rem">
							<span class="p-2" style="background-color: white;"><h7
									style=" opacity: 0.5;">상대방의 채팅이 왼쪽에 표기됩니다</h7></span>

						</div>
						<div class="text-right"
							style="text-align: right; padding-bottom: 1rem; padding-top: 1rem">
							<span class="p-2" style="background-color: yellow;"><h7
									style=" opacity: 0.5;">입력한 채팅이 오른쪽에 표기됩니다</h7></span>
						</div>
					</div>
				</div>
				<!-- Content Row -->
				<div class="row" style="padding-bottom: 4px;">
					<input type="text" id="msg"
						style="border-radius: 3px;">
				</div>
				<div>
					<button class="btn btn-primary" onclick="sendMsgTest()"
						style="float: right;">메세지 보내기</button>
				</div>
			</div>
		</div>
	</div>
</body>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->

<script
	src="${pageContext.request.contextPath }/resources/js/scripts.js"></script>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<script
	src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script type="text/javascript">
	var sock = new SockJS(
			'${pageContext.request.contextPath }/chatMessageUserList');
	sock.onopen = function() {
		console.log('open');

	};

	sock.onmessage = function(e) {
		console.log()
		var sendData = JSON.parse(e.data);
		//접속중인 유저 목록, 새로운 유저의 입장 정보
		console.log("받은 데이터: " + sendData);

		var caseType = sendData.type; //처리 유형

		var chatOutput = ""; //채팅창 OUTPUT
		var userOutput = ""; //유저목록 OUTPUT

		switch (caseType) {
		case 'connectUser':
			//1. 채팅창에 입장 정보 출력
			chatOutput += "<div class=\"text-center\" style=\" text-align: center; padding-bottom: 1rem; padding-top: 1rem\">";
			chatOutput += "<span class=\"p-2 chatMsg\" style=\"background-color: white;\">"
					+ sendData.userid + sendData.sendmsg + "</span>";
			chatOutput += "</div>";
			$("#chatList").append(chatOutput);
			//2. 접속 중 목록에 추가
			userOutput += "<div class=\"p-1\" id=\"" + sendData.userid+"\"  >";
			userOutput += sendData.userid;
			userOutput += "</div>";
			$("#connectUserList").append(userOutput);
			break;

		case 'disconnectUser':
			//1. 채팅창에 퇴장 정보 추가
			chatOutput += "<div class=\"text-center\" style=\" text-align: center; padding-bottom: 1rem; padding-top: 1rem\">";
			chatOutput += "<span class=\"p-2 chatMsg\" style=\"background-color: white;\">"
					+ sendData.userid + sendData.sendmsg + "</span>";
			chatOutput += "</div>";
			$("#chatList").append(chatOutput);

			//2. 접속 중 목록에 삭제
			$("#" + sendData.userid).remove();
			break;
		/* case 'connectUserList': 
		 console.log(sendData.userList);
		 for(var userInfo of sendData.userList) {
		 console.log(userInfo.userid);
		 userOutput += "<div class=\"p-1\" id=\"" + userInfo.userid+"\"  >";
		 userOutput += userInfo.userid;
		 userOutput +="</div>";
		 }
		 $("#connectUserList").append(userOutput);
		 break; */

		case 'chatMessage': //채팅 메세지를 받은 경우
			console.log("채팅메세지")

			chatOutput += "<div class=\"text-left\" style=\"text-align: left; padding-bottom: 1rem; padding-top: 1rem\">";
			chatOutput += "<p class=\"mb-2 chatSendId\">" + sendData.userid
					+ "</p>";
			chatOutput += "<span class=\"p-2 chatMsg\" style=\"background-color: white;\">"
					+ sendData.sendmsg + "</span>";
			chatOutput += "</div>";

			$("#chatList").append(chatOutput);
			$("#chatList").scrollTop($("#chatList")[0].scrollHeight);
			document.getElementById('msg').value = "";
			break;
		}

	};
	function sendMsgTest() {
		var inputValue = document.getElementById('msg').value;
		console.log("입력한 메세지 : " + inputValue);
		sock.send(inputValue);
		var Output = "<div class=\"text-right\" style=\"text-align: right; padding-bottom: 1rem; padding-top: 1rem\" >";
		Output += "<span class=\"p-2 chatMsg\" style=\"background-color: yellow;\">"
				+ inputValue + "</span>";
		Output += "</div>";
		$("#chatList").append(Output);
		$("#chatList").scrollTop($("#chatList")[0].scrollHeight);
		document.getElementById('msg').value = "";
	}
	sock.onclose = function() {
		console.log('close');

	};
</script>
</html>