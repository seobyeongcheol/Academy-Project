package com.Sport_Project001.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.Sport_Project001.dto.MemberDto;

public interface MemberDao {

	
	//회원가입 insert
		@Insert("INSERT INTO MEMBERS(MID, MPW, MNAME, MBIRTH, MADDR, MEMAILID, MEMAILDOMAIN, MSTATE) "
				+ "VALUES( #{mid}, #{mpw}, #{mname}, TO_DATE(#{mbirth},'YYYY-MM-DD'), #{maddr}, #{memailid}, #{memaildomain}, '0' )")
		public int insertMember(MemberDto member);

	//로그인 select
		@Select("SELECT MID "
				+ "FROM MEMBERS "
				+ "WHERE MID = #{mid} AND MPW = #{mpw}")
		public String selectMemberLogin(@Param("mid") String mid, @Param("mpw") String mpw);

	//아이디 중복확인
		@Select("SELECT MID "
				  + "FROM MEMBERS "
				  + "WHERE MID = #{inputId}")
		public String selectMemberInfo(String inputId);

		
		@Select("SELECT * FROM MEMBERS WHERE MID = #{loginId} ")
		public ArrayList<MemberDto> selectMemberList(String loginId);

		
	
	
}
