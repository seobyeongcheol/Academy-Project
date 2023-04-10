package com.Sport_Project001.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.Sport_Project001.dto.BoardDto;
import com.Sport_Project001.dto.ReplyDto;
import com.Sport_Project001.service.BoardService;

@Controller
public class BoardController {

	@Autowired
	private HttpSession session;

	@Autowired
	private BoardService bsvc;

	@RequestMapping(value = "/boardListForm")
	public ModelAndView boardForm() {
		System.out.println("게시판 페이지 이동요청");
		ModelAndView mav = new ModelAndView();

		ArrayList<BoardDto> boardList = bsvc.boardList();
		mav.addObject("boardList", boardList);

		mav.setViewName("board/BoardList");
		return mav;
	}

	@RequestMapping(value = "/boardView")
	public ModelAndView boardView(int viewBnum) {
		System.out.println("상세보기 페이지 이동 요청");
		ModelAndView mav = new ModelAndView();
		System.out.println("상세보기 글번호 : " + viewBnum);

		// 1. 글 상세 정보 조회
		BoardDto board = bsvc.boardView(viewBnum);
		System.out.println(board);
		mav.addObject("board", board);

		String loginId = (String) session.getAttribute("loginId");

		// 2. 댓글 목록 조회
		ArrayList<ReplyDto> replyList = bsvc.boardReplyList(viewBnum, loginId);
		mav.addObject("replyList", replyList);

		// 3. 글 상세보기 페이지 이동
		mav.setViewName("board/BoardView");
		return mav;
	}

	@RequestMapping(value = "/boardWriteForm")
	public ModelAndView boardWriteForm() {
		System.out.println("글작성 페이지 호출");
		ModelAndView mav = new ModelAndView();

		if (session.getAttribute("loginId") != null) {
			// 로그인이 되어 있을 경우 >> 글작성 페이지로
			mav.setViewName("board/BoardWrite");
		} else {
			// 로그인이 되어 있지 않을 경우 >> 로그인 페이지로
			mav.setViewName("member/MemberLogin");
		}

		return mav;
	}

	@RequestMapping(value = "/boardWrite")
	public ModelAndView boardWrite(BoardDto board) throws IllegalStateException, IOException {
		System.out.println("글작성 요청");
		ModelAndView mav = new ModelAndView();

		// 로그인이 되어 있지 않을 경우 >> 로그인 페이지로
		if (session.getAttribute("loginId") == null) {
			mav.setViewName("member/MemberLogin");
			return mav;
		}
		String loginId = (String) session.getAttribute("loginId");

		// 2.board.bwriter(작성자)에 저장
		board.setBwriter(loginId);

		System.out.println(board);

		int writeResult = bsvc.boardWrite(board);
		if (writeResult > 0) { // 글 등록에 성공 했을 경우
			// 글목록 페이지 이동요청
			mav.setViewName("redirect:/boardListForm");
		} else { // 글 등록에 실패 했을 경우
			// 글작성 페이지 이동요청
			mav.setViewName("board/BoardWrite");
		}
		return mav;
	}

	@RequestMapping(value = "/boardModify")
	public ModelAndView boardModify(BoardDto modBoard, RedirectAttributes ra) {
		System.out.println("글수정 요청");
		ModelAndView mav = new ModelAndView();
		System.out.println(modBoard);
		// 1. 글 수정 기능 호출
		int modifyResult = bsvc.boardModify(modBoard);
		if (modifyResult > 0) {
			ra.addFlashAttribute("boardMsg", "글이 수정 되었습니다.");
		} else {
			ra.addFlashAttribute("boardMsg", "글이 수정에 실패하였습니다.");
		}

		mav.setViewName("redirect:/boardView?viewBnum=" + modBoard.getBnum());
		return mav;
	}

	@RequestMapping(value = "/boardDeleteUpdate")
	public ModelAndView boardDeleteUpdate(int viewBnum) {
		System.out.println("글 삭제처리 요청");
		ModelAndView mav = new ModelAndView();
		System.out.println("삭제처리할 글번호: " + viewBnum);
		// 1. 글삭제 처리 서비스 호출
		int result = bsvc.boardDeleteUpdate(viewBnum);

		// 2. 이동할 페이지 설정 >> 글목록페이지
		mav.setViewName("redirect:/boardListForm");

		return mav;
	}

	@RequestMapping(value = "/replyWrite")
	public @ResponseBody ModelAndView replyWrite(ReplyDto reply) {
		ModelAndView mav = new ModelAndView();
		System.out.println("댓글 등록 요청");
		System.out.println(reply);
		String loginId = (String) session.getAttribute("loginId");

		// 2.reply.Rname(작성자)에 저장
		reply.setRname(loginId);
		int insertResult = bsvc.replyWrite(reply);
		mav.setViewName("redirect:/boardView?viewBnum=" + reply.getRebno());
		return mav;
	}

	@RequestMapping(value = "/replyList")
	public @ResponseBody String replyList(int rebno) {
		System.out.println("댓글 목록 조회 요청");
		System.out.println("댓글을 조회할 글번호 : " + rebno);

		String loginId = (String) session.getAttribute("loginId");
		String replyList = bsvc.replyList(rebno, loginId);

		return replyList;
	}

	@RequestMapping(value = "/replyLike")
	public @ResponseBody String replyLike(int rlnum, String rlmid) {
		System.out.println("댓글 추천 등록 요청");
		System.out.println("추천할 댓글번호 : " + rlnum);
		String likeResult = bsvc.replyLike(rlnum, rlmid);

		return likeResult;
	}

	@RequestMapping(value = "/replyDelete_ajax")
	public @ResponseBody ModelAndView replyDelete_ajax(int renum) {
		ModelAndView mav = new ModelAndView();
		System.out.println("댓글 삭제 요청");
		System.out.println("삭제할 댓글 번호 : " + renum);
		int deleteResult = bsvc.replyDelete(renum);
		mav.setViewName("redirect:/boardView?viewBnum=" + deleteResult);
		return mav;
	}

}