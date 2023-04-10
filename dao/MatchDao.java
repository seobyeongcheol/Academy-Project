package com.Sport_Project001.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Select;

import com.Sport_Project001.dto.ResultDto;


public interface MatchDao {

	@Select("SELECT * FROM MATCH")
	ArrayList<ResultDto> selectMatchList();

}
