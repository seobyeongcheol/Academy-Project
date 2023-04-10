package com.Sport_Project001.dto;

public class ReplyDto {
	private int renum;
	private int rebno;
	private String rname;
	private String rcontents;
	private String rdate;
	private String rstate;
	private int relikeCount;
	private String relikeCheck;
	
	public int getRelikeCount() {
		return relikeCount;
	}

	public void setRelikeCount(int relikeCount) {
		this.relikeCount = relikeCount;
	}

	public String getRelikeCheck() {
		return relikeCheck;
	}

	public void setRelikeCheck(String relikeCheck) {
		this.relikeCheck = relikeCheck;
	}

	public int getRebno() {
		return rebno;
	}

	public void setRebno(int rebno) {
		this.rebno = rebno;
	}

	public String getRstate() {
		return rstate;
	}

	public void setRstate(String rstate) {
		this.rstate = rstate;
	}

	public int getRenum() {
		return renum;
	}

	public void setRenum(int renum) {
		this.renum = renum;
	}

	public String getRname() {
		return rname;
	}

	public void setRname(String rname) {
		this.rname = rname;
	}

	public String getRcontents() {
		return rcontents;
	}

	public void setRcontents(String rcontents) {
		this.rcontents = rcontents;
	}

	public String getRdate() {
		return rdate;
	}

	public void setRdate(String rdate) {
		this.rdate = rdate;
	}

}
