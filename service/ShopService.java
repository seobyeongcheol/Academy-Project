package com.Sport_Project001.service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Sport_Project001.dao.ShopDao;
import com.Sport_Project001.dto.MemberDto;
import com.Sport_Project001.dto.OrderDto;
import com.Sport_Project001.dto.ShopDto;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@Service
public class ShopService {

	@Autowired
	private ShopDao shdao;

	public ArrayList<ShopDto> shoppage1() {
		System.out.println("shopService shoppage1()");
		ArrayList<ShopDto> shopList = shdao.selectshop1();
		return shopList;
	}

	public ArrayList<ShopDto> shoppage2() {
		System.out.println("shopService shoppage2()");
		ArrayList<ShopDto> shopList2 = shdao.selectshop2();
		return shopList2;
	}

	public ArrayList<ShopDto> shoppage3() {
		System.out.println("shopService shoppage3()");
		ArrayList<ShopDto> shopList3 = shdao.selectshop3();
		return shopList3;
	}

	public ArrayList<ShopDto> shoppage4() {
		System.out.println("shopService shoppage4()");
		ArrayList<ShopDto> shopList4 = shdao.selectshop4();
		return shopList4;
	}

	public ArrayList<ShopDto> shoppage5() {
		System.out.println("shopService shoppage5()");
		ArrayList<ShopDto> shopList5 = shdao.selectshop5();
		return shopList5;
	}

	public String Kakaopay_Ready(OrderDto orInfo, HttpSession session) throws Exception {
		String loginId = (String)session.getAttribute("loginId");
		String orcode = generateRecode(loginId);
		orInfo.setOrcode(orcode);
		orInfo.setOrid(loginId);
		System.out.println("serive : " + orInfo);
		try {
			shdao.insertOrder(orInfo);
		} catch (Exception e) {
			System.out.println("KAKAO결제준비 요청중 예외");
			e.printStackTrace();
			return "Fail";
		}

		StringBuilder urlBuilder = new StringBuilder("https://kapi.kakao.com/v1/payment/ready"); /* URL */
		urlBuilder.append("?" + URLEncoder.encode("cid", "UTF-8") + "=TC0ONETIME"); /* cid 테스트 가맹점 코드 */
		urlBuilder.append("&" + URLEncoder.encode("partner_order_id", "UTF-8") + "="
				+ URLEncoder.encode(orcode, "UTF-8")); /* 가맹점 예매코드, 최대 100자 */
		urlBuilder.append("&" + URLEncoder.encode("partner_user_id", "UTF-8") + "="
				+ URLEncoder.encode(loginId, "UTF-8")); /* 가맹점 회원 id, 최대 100자 */
		urlBuilder.append("&" + URLEncoder.encode("item_name", "UTF-8") + "="
				+ URLEncoder.encode(orInfo.getOrname(), "UTF-8")); /* 상품명, 최대 100자 */
		urlBuilder.append("&" + URLEncoder.encode("quantity", "UTF-8") + "="
				+ URLEncoder.encode("1", "UTF-8")); /* 상품 수량 */
		urlBuilder.append("&" + URLEncoder.encode("total_amount", "UTF-8") + "="
				+ URLEncoder.encode(orInfo.getOrprice(), "UTF-8")); /* 상품 총액 */
		urlBuilder.append("&" + URLEncoder.encode("tax_free_amount", "UTF-8") + "="
				+ URLEncoder.encode("0", "UTF-8")); /* 상품 비과세 금액 */
		urlBuilder.append("&" + URLEncoder.encode("approval_url", "UTF-8") + "="
				+ URLEncoder.encode("http://localhost:8080/controller/payResult",
						"UTF-8")); /* 결제 성공 시 redirect url, 최대 255자 */
		urlBuilder.append("&" + URLEncoder.encode("cancel_url", "UTF-8") + "="
				+ URLEncoder.encode("http://localhost:8080/controller/KakaoPay_Cancel?orcode=" + orcode,
						"UTF-8")); /* 결제 취소 시 redirect url, 최대 255자 */
		urlBuilder.append("&" + URLEncoder.encode("fail_url", "UTF-8") + "="
				+ URLEncoder.encode("http://localhost:8080/controller/KakaoPay_Fail?orcode=" + orcode,
						"UTF-8")); /* 결제 실패 시 redirect url, 최대 255자 */
		URL url = new URL(urlBuilder.toString());
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("POST");
		conn.setRequestProperty("Authorization", "KakaoAK " + "764d36899da43b8954a42d7682ed89d2");
		conn.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		System.out.println("Response code: " + conn.getResponseCode());
		BufferedReader rd;
		if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
			rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		} else {
			rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		}
		StringBuilder sb = new StringBuilder();
		String line;
		while ((line = rd.readLine()) != null) {
			sb.append(line);
		}
		rd.close();
		conn.disconnect();
		System.out.println(sb.toString());
		JsonElement readyElement = JsonParser.parseString(sb.toString());
		JsonObject readyObj = readyElement.getAsJsonObject();
		String tid = readyObj.get("tid").getAsString();
		System.out.println("tid : " + tid);
		session.setAttribute("payTid", tid);

		String nextPcUrl = readyObj.get("next_redirect_pc_url").getAsString();
		System.out.println(nextPcUrl);

		return nextPcUrl;

	}

	private String generateRecode(String loginId) {
		int OrderCount = shdao.selectOrCount(loginId) + 1;
		String orcode = "T" + String.format("%05d", OrderCount);
		return orcode;
	}

	public String KakaoPay_Approval(String tid, String pg_token, String orcode, HttpSession session) throws Exception {
		String loginId = (String) session.getAttribute("loginId");
		StringBuilder urlBuilder = new StringBuilder("https://kapi.kakao.com/v1/payment/approve");
		urlBuilder.append("?" + URLEncoder.encode("cid", "UTF-8") + "=" + URLEncoder.encode("TC0ONETIME", "UTF-8"));
		urlBuilder.append("&" + URLEncoder.encode("tid", "UTF-8") + "=" + URLEncoder.encode(tid, "UTF-8"));
		urlBuilder.append(
				"&" + URLEncoder.encode("partner_order_id", "UTF-8") + "=" + URLEncoder.encode(orcode, "UTF-8"));
		urlBuilder.append(
				"&" + URLEncoder.encode("partner_user_id", "UTF-8") + "=" + URLEncoder.encode(loginId, "UTF-8"));
		urlBuilder.append("&" + URLEncoder.encode("pg_token", "UTF-8") + "=" + URLEncoder.encode(pg_token, "UTF-8"));
		URL url = new URL(urlBuilder.toString());
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("POST");
		conn.setRequestProperty("Authorization", "KakaoAK " + "764d36899da43b8954a42d7682ed89d2");
		conn.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		System.out.println("Response code: " + conn.getResponseCode());
		String result = "Fail";
		BufferedReader rd;
		if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
			rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			result = "Approval";
		} else {
			rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
			shdao.deleteReservation(orcode);
		}
		StringBuilder sb = new StringBuilder();
		String line;
		while ((line = rd.readLine()) != null) {
			sb.append(line);
		}
		rd.close();
		conn.disconnect();
		System.out.println(sb.toString());
		if (result.equals("Approval")) {
			String total = JsonParser.parseString(sb.toString()).getAsJsonObject().get("amount").getAsJsonObject()
					.get("total").getAsString();
			System.out.println("total : " + total);
			shdao.insertPayInfo(orcode, tid, loginId, total);
		}

		return result;
	}

	public int deleteReserveInfo(String orcode) {
		int deleteResult = shdao.deleteReservation(orcode);
		return deleteResult;
	}

	public ArrayList<OrderDto> orderList(String loginId) {
		System.out.println("Shopservice orderList() 호출");

		ArrayList<OrderDto> orderList = shdao.selectOrderList(loginId);
		System.out.println(orderList);
		return orderList;
	}

}
