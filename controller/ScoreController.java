package com.Sport_Project001.controller;

import org.springframework.stereotype.Controller;

import org.springframework.web.servlet.ModelAndView;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
@Controller
public class ScoreController {
	
		public static void main(String[] args) throws Exception {
			ModelAndView mav = new ModelAndView();
			//1.CGV 영화 페이지 URL
			String premierUrl = "https://www.zentoto.com/sports/soccer/epl/results";
			
			//2. Jsoup URL 접속
			Document doc = Jsoup.connect(premierUrl).get();
			//System.out.println(doc);
			
			
			Elements matchDate = doc.select("#site-wrapper > section.contents > div.container.league-main > div > div.col-8 > div > div.content-bdy.lg-result.mt-10 > div > div:nth-child(2) > div > div:nth-child(1) > p");
			Elements homeTeam = doc.select("#site-wrapper > section.contents > div.container.league-main > div > div.col-8 > div > div.content-bdy.lg-result.mt-10 > div > div:nth-child(2) > div > div:nth-child(2) > div > div.col-10.text-right > a");
			Elements awayScore = doc.select("#site-wrapper > section.contents > div.container.league-main > div > div.col-8 > div > div.content-bdy.lg-result.mt-10 > div > div:nth-child(2) > div > div:nth-child(3) > div > div.col-5.text-left.bold");
			Elements homeScore = doc.select("#site-wrapper > section.contents > div.container.league-main > div > div.col-8 > div > div.content-bdy.lg-result.mt-10 > div > div:nth-child(2) > div > div:nth-child(3) > div > div.col-5.text-right.bold");
			Elements awayTeam = doc.select("#site-wrapper > section.contents > div.container.league-main > div > div.col-8 > div > div.content-bdy.lg-result.mt-10 > div > div:nth-child(2) > div > div:nth-child(4) > div > div.col-10.text-left > a");
			
			//4.1 ~ 19위 <li>태그 선택
			//Elements movLi = chartDiv.select("li");
			String date = matchDate.text();
			String hteam = homeTeam.text();
			String hscore = homeScore.text();
			String ascore = awayScore.text();
			String ateam = awayTeam.text();
			System.out.println(date);
			System.out.println(hteam +"vs"+ ateam);
			System.out.println(hscore+" : "+ascore);
			
			  mav.addObject("date", matchDate);

			

	
			/*
			 * String URL = "https://www.zentoto.com/sports/soccer/epl/results"; Document
			 * doc = Jsoup.connect(URL).get(); Elements elem =
			 * doc.select(".tbl_weather tbody>tr:nth-child(1)"); String[] str =
			 * elem.text().split(" "); Elements
			 * elem2=doc.select(".tbl_weather tbody>tr:nth-child(1) img");
			 */
	
 


}
}
