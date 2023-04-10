package com.Sport_Project001.dto;

import org.springframework.web.multipart.MultipartFile;

public class BoardDto {

	private int bnum;
	private String btype;
	private String btitle;
	private String bwriter;
	private String bcontents;
	private String bdate;
	private MultipartFile bfile;
	private String bfilename;
	private int bhits;
	private int bstate;

	public int getBnum() {
		return bnum;
	}

	public void setBnum(int bnum) {
		this.bnum = bnum;
	}

	public String getBtype() {
		return btype;
	}

	public void setBtype(String btype) {
		this.btype = btype;
	}

	public String getBtitle() {
		return btitle;
	}

	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}

	public String getBwriter() {
		return bwriter;
	}

	public void setBwriter(String bwriter) {
		this.bwriter = bwriter;
	}

	public String getBcontents() {
		return bcontents;
	}

	public void setBcontents(String bcontents) {
		this.bcontents = bcontents;
	}

	public String getBdate() {
		return bdate;
	}

	public void setBdate(String bdate) {
		this.bdate = bdate;
	}

	public MultipartFile getBfile() {
		return bfile;
	}

	public void setBfile(MultipartFile bfile) {
		this.bfile = bfile;
	}

	public String getBfilename() {
		return bfilename;
	}

	public void setBfilename(String bfilename) {
		this.bfilename = bfilename;
	}

	

	public int getBstate() {
		return bstate;
	}

	public void setBstate(int bstate) {
		this.bstate = bstate;
	}

	public int getBhits() {
		return bhits;
	}

	public void setBhits(int bhits) {
		this.bhits = bhits;
	}

	@Override
	public String toString() {
		return "BoardDto [bnum=" + bnum + ", btype=" + btype + ", btitle=" + btitle + ", bwriter=" + bwriter
				+ ", bcontents=" + bcontents + ", bdate=" + bdate + ", bfile=" + bfile + ", bfilename=" + bfilename
				+ ", bhits=" + bhits + ", bstate=" + bstate + "]";
	}

	

	
}
