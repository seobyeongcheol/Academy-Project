package com.Sport_Project001.controller;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


import com.Sport_Project001.dto.OrderDto;
import com.Sport_Project001.dto.ShopDto;
import com.Sport_Project001.service.ShopService;

@Controller
public class ShopController {

	@Autowired
	private ShopService ssvc;

	@Autowired
	private HttpSession session;

	@RequestMapping(value = "/shopForm")
	public ModelAndView memberJoinForm() {
		System.out.println("굿즈구입 메인 페이지 이동요청");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/shopPage1");
		return mav;
	}

	@RequestMapping(value = "/shopBuy")
	public ModelAndView shopBuy() {
		System.out.println("구매 페이지 이동요청");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("shop/Shopbuy");
		return mav;
	}

	@RequestMapping(value = "/shopPage1")
	public ModelAndView shopPage1() {
		System.out.println("축구화 페이지 이동요청");
		ModelAndView mav = new ModelAndView();

		ArrayList<ShopDto> shopList = ssvc.shoppage1();
		mav.setViewName("shop/ShopPage1");
		mav.addObject("shopList", shopList);
		return mav;
	}

	@RequestMapping(value = "/shopPage2")
	public ModelAndView shopPage2() {
		System.out.println("풋살화 페이지 이동요청");
		ModelAndView mav = new ModelAndView();
		ArrayList<ShopDto> shopList2 = ssvc.shoppage2();
		mav.setViewName("shop/ShopPage2");
		mav.addObject("shopList2", shopList2);
		return mav;
	}

	@RequestMapping(value = "/shopPage3")
	public ModelAndView shopPage3() {
		System.out.println("의류 페이지 이동요청");
		ModelAndView mav = new ModelAndView();
		ArrayList<ShopDto> shopList3 = ssvc.shoppage3();
		mav.setViewName("shop/ShopPage3");
		mav.addObject("shopList3", shopList3);
		return mav;
	}

	@RequestMapping(value = "/shopPage4")
	public ModelAndView shopPage4() {
		System.out.println("유니폼 페이지 이동요청");
		ModelAndView mav = new ModelAndView();
		ArrayList<ShopDto> shopList4 = ssvc.shoppage4();
		mav.setViewName("shop/ShopPage4");
		mav.addObject("shopList4", shopList4);
		return mav;
	}

	@RequestMapping(value = "/shopPage5")
	public ModelAndView shopPage5() {
		System.out.println("용품 페이지 이동요청");
		ModelAndView mav = new ModelAndView();
		ArrayList<ShopDto> shopList5 = ssvc.shoppage5();
		mav.setViewName("shop/ShopPage5");
		mav.addObject("shopList5", shopList5);
		return mav;
	}

	@RequestMapping(value = "/orderInfo")
	public ModelAndView orderInfo() {
		System.out.println("주문내역 확인");
		ModelAndView mav = new ModelAndView();
		String loginId = (String) session.getAttribute("loginId");
		System.out.println("로그인된 아이디 : " + loginId);

		
		if (loginId != null) {
			ArrayList<OrderDto> orInfo = ssvc.orderList(loginId);
			System.out.println(orInfo);
			mav.addObject("orInfo", orInfo);
			mav.setViewName("OrderInfo");
			
		} else {
			mav.setViewName("member/MemberLogin");
			
		}
		

		
		return mav;
	}

	@RequestMapping(value = "/Kakaopay_Ready")
	public @ResponseBody String Kakaopay_Ready(OrderDto orInfo) throws Exception {
		System.out.println("ajax_상품결제 준비 요청");
		// 결제 QR코드 페이지 URL
		String nextUrl = ssvc.Kakaopay_Ready(orInfo, session);

		return nextUrl;
	}

	@RequestMapping(value = "/KakaoPay_Approval")
	public ModelAndView KakaoPay_Approval(String pg_token, String orcode) throws Exception {
		System.out.println("ajax_영화예매_결제승인 요청");
		ModelAndView mav = new ModelAndView();

		System.out.println("pg_token : " + pg_token);
		String tid = (String) session.getAttribute("payTid");
		System.out.println("tid : " + tid);

		String payResult = ssvc.KakaoPay_Approval(tid, pg_token, orcode, session);

		mav.addObject("payResult", payResult); // Approval, Fail
		mav.setViewName("shop/Ticket_PayResult");
		return mav;
	}

	@RequestMapping(value = "/KakaoPay_Cancel")
	public ModelAndView reserveMovie_PayCancel(String orcode) throws Exception {
		System.out.println("ajax_영화예매_결제취소");
		ModelAndView mav = new ModelAndView();
		int deleteReserve = ssvc.deleteReserveInfo(orcode);
		mav.addObject("reserveResult", "Cancel");
		mav.setViewName("shop/Ticket_PayResult");
		return mav;
	}

	@RequestMapping(value = "/KakaoPay_Fail")
	public ModelAndView reserveMovie_PayFail(String orcode) throws Exception {
		System.out.println("ajax_영화예매_결제실패");
		ModelAndView mav = new ModelAndView();
		int deleteReserve = ssvc.deleteReserveInfo(orcode);
		mav.addObject("reserveResult", "Fail");
		mav.setViewName("shop/Ticket_PayResult");
		return mav;
	}
}