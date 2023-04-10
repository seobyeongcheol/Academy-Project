package com.Sport_Project001.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Sport_Project001.dao.MatchDao;
import com.Sport_Project001.dto.ResultDto;


@Service
public class HomeService {

	@Autowired
	private MatchDao Mdao;
	public ArrayList<ResultDto> MatchList() {
		System.out.println("MatchList");
		ArrayList<ResultDto> MatchInfo = Mdao.selectMatchList();
		return MatchInfo;
	}

}
