package com.Sport_Project001.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.Sport_Project001.dto.BoardDto;
import com.Sport_Project001.dto.ReplyDto;

public interface BoardDao {

	@Select("SELECT NVL( MAX(BNUM),0 ) FROM BOARDS")
	public int selectMaxBnum();

	@Insert("INSERT INTO BOARDS(BNUM, BTYPE, BTITLE, BWRITER, BCONTENTS, BDATE, BFILENAME, BHITS, BSTATE ) "
			+ "VALUES(#{bnum},#{btype}, #{btitle}, #{bwriter}, #{bcontents}, SYSDATE, #{bfilename}, #{bhits}, '0')")
	public int insertBoard(BoardDto board);

	@Select("SELECT * FROM BOARDS WHERE BSTATE = '0' ORDER BY BDATE DESC")
	public ArrayList<BoardDto> selectBoardList();
	
	@Update("UPDATE BOARDS " + "SET BHITS = BHITS + 1 " + "WHERE BNUM = #{viewBnum}")
	public void updateBoardHits(int viewBnum);

	@Select("SELECT * FROM BOARDS " + "WHERE BNUM = #{viewBnum}")
	public BoardDto selectBoardView(int viewBnum);

	@Update("UPDATE BOARDS " + "SET BSTATE ='1' " + "WHERE BNUM =#{viewBnum}")
	public int updateBoardView(int viewBnum);

	@Select("SELECT RE.*, M.MSTATE " + "FROM REPLYS RE, MEMBERS M " + "WHERE ( RE.RNAME = M.MID ) AND REBNO = #{rebno} "
			+ "ORDER BY RENUM ")
	public ArrayList<ReplyDto> selectReplyList(int rebno);

	@Select("SELECT COUNT(*) FROM REPLYLIKE " + "WHERE RLNUM = #{renum}")
	public int selectRelikeCount(int renum);

	@Select("SELECT RLMID FROM REPLYLIKE " + "WHERE RLNUM = #{renum} AND RLMID = #{loginId}")
	public String selectRelikeCheck(@Param("renum") int renum, @Param("loginId") String loginId);

	@Update("UPDATE BOARDS " + "SET BTITLE = #{btitle}, BCONTENTS = #{bcontents} " + "WHERE BNUM = #{bnum}")
	public int updateBoard(BoardDto modBoard);

	@Select("SELECT NVL( MAX(RENUM),0 ) FROM REPLYS ")
	public int selectMaxRenum();

	@Insert("INSERT INTO REPLYS(RENUM, REBNO, RNAME, RCONTENTS, RDATE, RSTATE ) "
			+ "VALUES( #{renum}, #{rebno}, #{rname}, #{rcontents}, SYSDATE, '1' )")
	public int insertReply(ReplyDto reply);

	@Insert("INSERT INTO REPLYLIKE(RLNUM, RLMID) " + "VALUES( #{rlnum}, #{rlmid} )")
	void insertReplyLike(@Param("rlnum") int rlnum, @Param("rlmid") String rlmid);

	@Delete("DELETE FROM REPLYLIKE " + "WHERE RLNUM = #{rlnum} AND RLMID = #{rlmid}")
	void deleteReplyLike(@Param("rlnum") int rlnum, @Param("rlmid") String rlmid);

	@Delete("DELETE FROM REPLYS WHERE RENUM = #{renum}")
	public int deleteReply(int renum);

	@Delete("DELETE FROM REPLYLIKE " + "WHERE RLNUM = #{renum}")
	public void deleteRlnum(int renum);


}
