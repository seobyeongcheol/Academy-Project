package com.Sport_Project001.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Sport_Project001.dao.MemberDao;
import com.Sport_Project001.dto.MemberDto;

@Service
public class MemberService {

	@Autowired
	private MemberDao mdao;

	// 회원가입 기능 서비스
	public int memberJoinForm(MemberDto member) {
		System.out.println("MemberService MemberJoin() 호출");
		System.out.println("회원가입 기능 호출");

		// dao - insert
		int insertResult = mdao.insertMember(member);
		System.out.println("insertResult : " + insertResult);
		return insertResult;
	}

	// 아이디 중복 확인 기능

	public String memberIdCheck(String inputId) {
		String idCheckResult = "NO";
		// 아이디 확인 - SELECT
		String memberId = mdao.selectMemberInfo(inputId);

		System.out.println("memberId : " + memberId);

		if (memberId == null) {
			idCheckResult = "OK";
		}
		return idCheckResult;
	}

	// 로그인 기능 서비스
	public String memberLoginForm(String mid, String mpw) {
		System.out.println("MemberService memberLogin()");
		String logid = mdao.selectMemberLogin(mid, mpw);
		return logid;
	}


	public ArrayList<MemberDto> memberList(String loginId) {
		System.out.println("Mservice memberList() 호출");

		ArrayList<MemberDto> memberList = mdao.selectMemberList(loginId);
		System.out.println(memberList);
		return memberList;
	}

}
