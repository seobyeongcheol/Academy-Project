package com.Sport_Project001.webSockTest;

import java.util.ArrayList;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

public class ChatUserMessageHandler extends TextWebSocketHandler {

	// 채팅 페이지 접속한 클라이언트 세션 목록
	private ArrayList<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();

	// 채팅 페이지 접속
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		System.out.println("채팅페이지 접속");
		sessionList.add(session); // 새로 접속한 회원(세션)을 클라이언트 세션목록에 추가

		/// 이전에 접속중인 클라이언트에게 새로운 클라이언트가 접속 정보를 전송
		// 처리타입, 아이디, 출력메세지
		String loginId = (String) session.getAttributes().get("loginId"); // 로그인된 아이디
		JsonObject sendData = new JsonObject();
		sendData.addProperty("type", "connectUser"); // senbd.onmessage 이벤트로 처리할 타입
		sendData.addProperty("userid", loginId); // 새로 접속한 아이디
		sendData.addProperty("sendmsg", " 회원이 입장 했습니다."); // 채팅창에 출력할 메세지
		Gson gson = new Gson();
		String sendData_json = gson.toJson(sendData);

		for (WebSocketSession connectSession : sessionList) {
			if (!session.getId().equals(connectSession.getId())) {
				// 입장 정보를 전송
				connectSession.sendMessage(new TextMessage(sendData_json));

			}

		}
		// 새로 접속한 클라이언트에 이전에 접속중인 클라이언트 목록 전송
		JsonArray userList = new JsonArray(); // ArrayList<MemberDto> memberList = new ArrayList<MemberDto>();
												// memberList.add(member);
		for (WebSocketSession connectSession : sessionList) {
			JsonObject userInfo = new JsonObject();
			String userLoginId = (String) connectSession.getAttributes().get("loginId");
			userInfo.addProperty("userid", userLoginId);
			// userInfo.addProperty("userProfile", "프로필파일명");
			userList.add(userInfo); // 회원정보 목록에 추가
		}
		// userList >> 접속중인 회원 정보 목록
		JsonObject sendUserList = new JsonObject();
		sendUserList.addProperty("type", "connectUserList"); // 처리방식
		sendUserList.add("userList", userList);
		String sendUserList_json = gson.toJson(sendUserList);
		session.sendMessage(new TextMessage(sendUserList_json)); // 전송

	}

	// 채팅페이지 접속해제
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println("채팅 페이지 접속해제");
		sessionList.remove(session); // 접속 해제한 회원(세션)을 클라이언트 세션목록에서 삭제
		String loginId = (String) session.getAttributes().get("loginId"); // 로그인된 아이디
		JsonObject sendData = new JsonObject();
		sendData.addProperty("type", "disconnectUser"); // send.onmessage 이벤트로 처리할 타입
		sendData.addProperty("userid", loginId); // 새로 접속한 아이디
		sendData.addProperty("sendmsg", " 회원이 퇴장했습니다."); // 채팅창에 출력할 메세지
		Gson gson = new Gson();
		String sendData_json = gson.toJson(sendData);
		for (WebSocketSession connectSession : sessionList) {
			connectSession.sendMessage(new TextMessage(sendData_json));
		}

	}

	// 채팅페이지에서 메세지 전송
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		System.out.println("페이지에서 보낸 메세지 : " + message.getPayload());
		String loginId = (String) session.getAttributes().get("loginId");
		JsonObject jsonObj = new JsonObject();
		jsonObj.addProperty("type", "chatMessage");
		jsonObj.addProperty("userid", loginId);
		jsonObj.addProperty("sendmsg", message.getPayload());

		for (int i = 0; i < sessionList.size(); i++) {
			if (!session.getId().equals(sessionList.get(i).getId())) {
				sessionList.get(i).sendMessage(new TextMessage(new Gson().toJson(jsonObj)));

			}
		}

	}
}
