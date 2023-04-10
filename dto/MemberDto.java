package com.Sport_Project001.dto;

public class MemberDto {

	private String mid;
	   private String mpw;
	   private String mname;
	   private String mbirth;
	   private String maddr;
	   private String memailid;
	   private String memaildomain;
	   private String mstate;
	   
	   
	@Override
	public String toString() {
		return "MemberDto [mid=" + mid + ", mpw=" + mpw + ", mname=" + mname + ", mbirth=" + mbirth + ", maddr=" + maddr
				+ ", memailid=" + memailid + ", memaildomain=" + memaildomain + ", mstate=" + mstate + "]";
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getMpw() {
		return mpw;
	}
	public void setMpw(String mpw) {
		this.mpw = mpw;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getMbirth() {
		return mbirth;
	}
	public void setMbirth(String mbirth) {
		this.mbirth = mbirth;
	}
	public String getMaddr() {
		return maddr;
	}
	public void setMaddr(String maddr) {
		this.maddr = maddr;
	}
	public String getMemailid() {
		return memailid;
	}
	public void setMemailid(String memailid) {
		this.memailid = memailid;
	}
	public String getMemaildomain() {
		return memaildomain;
	}
	public void setMemaildomain(String memaildomain) {
		this.memaildomain = memaildomain;
	}
	public String getMstate() {
		return mstate;
	}
	public void setMstate(String mstate) {
		this.mstate = mstate;
	}
	
	
	
}
