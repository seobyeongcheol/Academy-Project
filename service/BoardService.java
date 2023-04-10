package com.Sport_Project001.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.Sport_Project001.dao.BoardDao;
import com.Sport_Project001.dto.BoardDto;
import com.Sport_Project001.dto.ReplyDto;
import com.google.gson.Gson;
import com.google.gson.JsonObject;

@Service
public class BoardService {

	@Autowired
	private BoardDao boardDao;

	@Autowired
	private ServletContext context;

	// BService 파일 처리 및 글 작성 기능
	public int boardWrite(BoardDto board) throws IllegalStateException, IOException {
		System.out.println("BoardService boardWrite()");
		// 1 글번호 생성
		int bnum = boardDao.selectMaxBnum() + 1;
		board.setBnum(bnum);
		// 2. 파일처리
		MultipartFile bfile = board.getBfile();
		String bfilename = "";
		if (bfile.isEmpty()) {
			System.out.println("파일 없음");
		} else {
			System.out.println("파일 있음");
			UUID uuid = UUID.randomUUID();
			bfilename = uuid.toString() + "_" + bfile.getOriginalFilename();
			String savePath = context.getRealPath("resources\\boardUpLoad");
			File file = new File(savePath, bfilename);
			bfile.transferTo(file);
		}
		board.setBfilename(bfilename);

		// 3. 글등록
		int insertResult = 0;
		try {
			// Board 테이블 insert 호출
			insertResult = boardDao.insertBoard(board);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return insertResult;
	}

	// BoardService 글목록 조회 기능
	public ArrayList<BoardDto> boardList() {
	      System.out.println("BoardService boardList()");
	      ArrayList<BoardDto> boardList = boardDao.selectBoardList();
	      return boardList;
	   }

	// 글 조회수 증가
	public BoardDto boardView(int viewBnum) {
		System.out.println("BoardService boardList()");
		// 조회수 증가
		boardDao.updateBoardHits(viewBnum);

		// 글 정보 조회
		BoardDto board = boardDao.selectBoardView(viewBnum);

		return board;
	}

	// 글 삭제 기능
	public int boardDeleteUpdate(int viewBnum) {
		System.out.println("SERVICE 글 삭제 처리");
		int updateResult = boardDao.updateBoardView(viewBnum);
		return updateResult;
	}

	// 글 수정 기능
	public int boardModify(BoardDto modBoard) {
	      System.out.println("BoardService boardModify()");
	      int updateResult = 0;
	      try {
	         updateResult = boardDao.updateBoard(modBoard);
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	      return updateResult;
	   }
	
	

	// 댓글 목록 조회 기능
	public ArrayList<ReplyDto> boardReplyList(int viewBnum, String loginId) {
		System.out.println("BoardService boardReplyList()");
		ArrayList<ReplyDto> replyList = boardDao.selectReplyList(viewBnum);
		// 0번인덱스 댓글번호, 댓글작성자, 댓글내용, 댓글 작성일 + 추천수 + 추천확인

		for (int i = 0; i < replyList.size(); i++) {
			// 댓글의 추천수 조회
			int renum = replyList.get(i).getRenum();
			int relikecount = boardDao.selectRelikeCount(renum);
			replyList.get(i).setRelikeCount(relikecount);

			// 현재 페이지를 보는 사용자의 댓글 추천 여부 조회
			if (loginId != null) {
				String relikeCheck = boardDao.selectRelikeCheck(renum, loginId);
				replyList.get(i).setRelikeCheck(relikeCheck);
			}
		}
		return replyList;
	}

	// 댓글 목록 조회 기능
	public String replyList(int rebno, String loginId) {
		System.out.println("BoardService replyList()");
		ArrayList<ReplyDto> reList = boardDao.selectReplyList(rebno);

		for (int i = 0; i < reList.size(); i++) {
			System.out.println(reList.get(i).getRenum());
			int renum = reList.get(i).getRenum();
			int relikecount = boardDao.selectRelikeCount(renum);
			reList.get(i).setRelikeCount(relikecount);

			// 현재 페이지를 보는 사용자의 댓글 추천 여부 조회
			if (loginId != null) {
				String relikeCheck = boardDao.selectRelikeCheck(renum, loginId);
				reList.get(i).setRelikeCheck(relikeCheck);
			}
		}

		System.out.println(reList);
		Gson gson = new Gson();
		String reList_json = gson.toJson(reList);
		System.out.println(reList_json);

		return reList_json;
	}

	// 댓글 등록 기능
	public int replyWrite(ReplyDto reply) {
		System.out.println("BoardService replyWrite()");
		// 1.댓글 번호 생성
		int renum = boardDao.selectMaxRenum() + 1;
		reply.setRenum(renum);
		// 2.댓글 등록
		int insertResult = 0;
		try {
			insertResult = boardDao.insertReply(reply);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return insertResult;
	}

	// 댓글 추천 기능
	public String replyLike(int rlnum, String rlmid) {
		System.out.println("BoardService replyLike()");
		Gson gson = new Gson();
		JsonObject replyLike_json = new JsonObject();
		// 1. 추천유무 확인
		String likeCheck = boardDao.selectRelikeCheck(rlnum, rlmid);

		if (likeCheck == null) {
			System.out.println("댓글 추천 입력");
			boardDao.insertReplyLike(rlnum, rlmid);
			replyLike_json.addProperty("likeResult", "1");
		} else {
			System.out.println("추천 취소");
			boardDao.deleteReplyLike(rlnum, rlmid);
			replyLike_json.addProperty("likeResult", "-1");
		}

		// 2. 추천 처리 이후 추천수 조회
		int likeCount = boardDao.selectRelikeCount(rlnum);
		replyLike_json.addProperty("likeCount", likeCount);

		System.out.println(gson.toJson(replyLike_json));
		return gson.toJson(replyLike_json);
	}

	// 댓글 삭제 기능
	public int replyDelete(int renum) {
		System.out.println("BoardService replyDelete()");

		boardDao.deleteRlnum(renum);
		int deleteResult = boardDao.deleteReply(renum);
		return deleteResult;
	}


}
