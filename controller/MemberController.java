package com.Sport_Project001.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.Sport_Project001.dto.MemberDto;
import com.Sport_Project001.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	private HttpSession session;

	@Autowired
	private MemberService msvc;

	@RequestMapping(value = "/memberJoinForm")
	public ModelAndView memberJoinForm() {
		System.out.println("회원가입 페이지 이동요청");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/MemberJoin");
		return mav;
	}

	@RequestMapping(value = "/memberLoginForm")
	public ModelAndView memberLoginForm() {
		System.out.println("로그인 페이지 이동요청");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/MemberLogin");
		return mav;
	}

	

	// 회원가입 기능
	@RequestMapping(value = "/memberJoin")
	public ModelAndView MemberJoinForm(MemberDto member, RedirectAttributes ra) {
		System.out.println("회원가입 요청");
		System.out.println(member);
		ModelAndView mav = new ModelAndView();

		int inserResult = msvc.memberJoinForm(member);
		if (inserResult > 0) {
			// 회원가입 성공 -- Main.jsp
			mav.setViewName("redirect:/");
			ra.addFlashAttribute("joinMsg", "회원가입에 성공했습니다.");
		} else {
			// 회원가입 실패
			mav.setViewName("Fail");
			mav.addObject("joinMsg", "회원가입에 실패 했습니다.");
		}

		return mav;
	}

	// 로그인 기능
	@RequestMapping(value = "/memberLogin")
	public ModelAndView memberLoginForm(String mid, String mpw, RedirectAttributes ra) {
		System.out.println("로그인 요청");
		System.out.println("입력한 아이디 : " + mid);
		System.out.println("입력한 비밀번호 : " + mpw);
		ModelAndView mav = new ModelAndView();
		String loginId = msvc.memberLoginForm(mid, mpw);
		System.out.println("loginId : " + loginId);
		if (loginId != null) {
			// 로그인 성공
			session.setAttribute("loginId", loginId);
			ra.addFlashAttribute("loginMsg", "로그인 되었습니다.");
			mav.setViewName("redirect:/Main");
		} else {
			// 로그인 실패
			ra.addFlashAttribute("loginMsg", "아이디 또는 비밀번호가 일치하지 않습니다.");
			mav.setViewName("redirect:/MemberLogin");
		}

		return mav;
	}

	// 회원가입 아이디 중복체크
	@RequestMapping(value = "/memberIdCheck")
	public @ResponseBody String memberIdCheck(String inputId) {
		System.out.println("아이디 중복확인 요청");
		System.out.println("중복 확인 할 아이디 : " + inputId);

		// 1. 아이디 중복 확인 기능 호출
		String idCheckResult = msvc.memberIdCheck(inputId);
		// 2. 중복확인 결과값 리턴
		return idCheckResult;
	}

	// 로그아웃 기능
	@RequestMapping(value = "/memberLogout")
	public ModelAndView memberlogout() {
		System.out.println("로그아웃기능 요청");
		ModelAndView mav = new ModelAndView();
		session.invalidate();
		mav.setViewName("redirect:/Main");
		return mav;
	}

	//내정보 페이지 기능
	@RequestMapping(value = "/memberList")
	public ModelAndView memberList() {
		
		System.out.println("내정보 페이지 이동 요청");
		ModelAndView mav = new ModelAndView();

		// 1.session에 저장되어 있는 loginId 속성값 가져오기
		String loginId = (String) session.getAttribute("loginId");
		System.out.println("로그인된 아이디 : " + loginId);
		
		// 2.회원 목록 조회
		ArrayList<MemberDto> memberList = msvc.memberList(loginId);

		// 3. ModelAndView 객체에 저장
		mav.addObject("memberList", memberList);

		// 4. 이동할 페이지 지정
		mav.setViewName("member/MemberInfo");

		return mav;
	}

}