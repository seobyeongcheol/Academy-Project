package com.Sport_Project001.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.Sport_Project001.dto.AssistDto;
import com.Sport_Project001.dto.RankDto;
import com.Sport_Project001.dto.ResultDto;
import com.Sport_Project001.dto.ScheduleDto;
import com.Sport_Project001.dto.ScoreRankDto;
import com.Sport_Project001.service.HomeService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("웹사이트 접속", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);

		return "Main";
	}

	@Autowired
	private HomeService hsvc;

	@RequestMapping(value = "/test01", method = RequestMethod.GET)
	public ModelAndView test01() throws Exception {
		ModelAndView mav = new ModelAndView();
		// 1.프리미어리그 순위URL
		String premierUrl = "https://www.zentoto.com/sports/soccer/epl/results";

		// #site-wrapper > section.contents > div.container.league-main > div >
		// div.col-8 > div > div.content-bdy.mt-10 > div > table

		// #site-wrapper > section.contents > div.container.league-main > div >
		// div.col-8 > div > div.content-bdy.lg-result.mt-10 > div > div:nth-child(3)
		// 2. Jsoup URL 접속
		Document doc = Jsoup.connect(premierUrl).get();
		Elements leagueGame = doc.select("div.league-game");
		System.out.println(leagueGame.size());

		ArrayList<ResultDto> leagueGameList = new ArrayList<ResultDto>();

		for (int i = 0; i < leagueGame.size(); i++) {
			ResultDto score = new ResultDto();
			// #site-wrapper > section.contents > div.container.league-main > div >
			// div.col-8 > div > div.content-bdy.lg-result.mt-10 > div > div:nth-child(2) >
			// div > div:nth-child(1) > p

			// #site-wrapper > section.contents > div.container.league-main > div >
			// div.col-8 > div > div.content-bdy.lg-result.mt-10 > div > div:nth-child(5) >
			// div > div:nth-child(1)

			// #site-wrapper > section.contents > div.container.league-main > div >
			// div.col-8 > div > div.content-bdy.lg-result.mt-10 > div > div:nth-child(2) >
			// div > div:nth-child(2) > div > div.col-2.logo-sp > img

			// #site-wrapper > section.contents > div.container.league-main > div >
			// div.col-8 > div > div.content-bdy.lg-result.mt-10 > div > div:nth-child(3) >
			// div > div:nth-child(2) > div > div.col-2.logo-sp > img
			String homeimg = "https://www.zentoto.com"
					+ leagueGame.get(i).select("div > div:nth-child(2) > div > div.col-2.logo-sp > img").attr("src");
			System.out.print("홈엠블럼 : " + homeimg);
			score.setHomeimg(homeimg);

			// #site-wrapper > section.contents > div.container.league-main > div >
			// div.col-8 > div > div.content-bdy.lg-result.mt-10 > div > div:nth-child(2) >
			// div > div:nth-child(4) > div > div.col-2.logo-sp > img

			// #site-wrapper > section.contents > div.container.league-main > div >
			// div.col-8 > div > div.content-bdy.lg-result.mt-10 > div > div:nth-child(3) >
			// div > div:nth-child(4) > div > div.col-2.logo-sp > img
			String awayimg = "https://www.zentoto.com"
					+ leagueGame.get(i).select("div > div:nth-child(4) > div > div.col-2.logo-sp > img").attr("src");
			System.out.print("원정엠블럼 : " + awayimg);
			score.setAwayimg(awayimg);

			String matchDate = leagueGame.get(i).select("div> div:nth-child(1) > p").text();
			String matchDateArr[] = matchDate.split(" ");
			matchDate = matchDateArr[0] + " " + matchDateArr[1];
			System.out.print("경기일 : " + matchDate);
			score.setMdate(matchDate);

			// #site-wrapper > section.contents > div.container.league-main > div >
			// div.col-8 > div > div.content-bdy.lg-result.mt-10 > div > div:nth-child(2) >
			// div > div:nth-child(2) > div > div.col-10.text-right > a

			// #site-wrapper > section.contents > div.container.league-main > div >
			// div.col-8 > div > div.content-bdy.lg-result.mt-10 > div > div:nth-child(13) >
			// div > div:nth-child(2) > div > div.col-10.text-right > a
			String homeTeam = leagueGame.get(i).select("div > div:nth-child(2) > div > div.col-10.text-right > a")
					.text();
			System.out.print(", 홈팀 : " + homeTeam);
			score.setHometeam(homeTeam);

			// #site-wrapper > section.contents > div.container.league-main > div >
			// div.col-8 > div > div.content-bdy.lg-result.mt-10 > div > div:nth-child(2) >
			// div > div:nth-child(3) > div > div.col-5.text-right.bold
			String homeScore = leagueGame.get(i).select("div > div:nth-child(3) > div > div.col-5.text-right.bold")
					.text();
			System.out.print(" " + homeScore);
			score.setHomescore(homeScore);

			// #site-wrapper > section.contents > div.container.league-main > div >
			// div.col-8 > div > div.content-bdy.lg-result.mt-10 > div > div:nth-child(2) >
			// div > div:nth-child(3) > div > div.col-5.text-left.bold
			String awayScore = leagueGame.get(i).select(" div > div:nth-child(3) > div > div.col-5.text-left.bold")
					.text();
			System.out.print(" : " + awayScore);
			score.setAwayscore(awayScore);

			// #site-wrapper > section.contents > div.container.league-main > div >
			// div.col-8 > div > div.content-bdy.lg-result.mt-10 > div > div:nth-child(2) >
			// div > div:nth-child(4) > div > div.col-10.text-left
			String awayTeam = leagueGame.get(i).select("div > div:nth-child(4) > div > div.col-10.text-left").text();
			System.out.print(awayTeam + "원정팀");
			score.setAwayteam(awayTeam);

			leagueGameList.add(score);
		}

		mav.addObject("MatchList", leagueGameList);

		mav.setViewName("score/score");

		return mav;
	}

	@RequestMapping(value = "/premierRanking", method = RequestMethod.GET)
	public ModelAndView ranking() throws Exception {
		ModelAndView mav = new ModelAndView();
		// 1.프리미어리그 순위URL
		String premierRank = "https://www.zentoto.com/sports/soccer/epl";

		// 2. Jsoup URL 접속
		Document doc = Jsoup.connect(premierRank).get();
		Elements preRank = doc.select("tr");
		System.out.println(preRank.size());

		ArrayList<RankDto> RankGameList = new ArrayList<RankDto>();
		int preRankSize = preRank.size();
		if (preRankSize > 21) {
			preRankSize = 21;
		}

		for (int i = 1; i < preRankSize; i++) {
			RankDto Rank = new RankDto();

			// #site-wrapper > section.contents > div.container.league-main > div >
			// div.col-8 > div > div.content-bdy.mt-10 > div > table > tbody >
			// tr:nth-child(1) > td.state_bar1

			// #site-wrapper > section.contents > div.container.league-main > div >
			// div.col-8 > div > div.content-bdy.mt-10 > div > table > tbody >
			// tr:nth-child(18) > td.state_bar7

			// #site-wrapper > section.contents > div.container.league-main > div >
			// div.col-8 > div > div.content-bdy.mt-10 > div > table > tbody >
			// tr:nth-child(7) > td:nth-child(1)

			String clubimg = "https://www.zentoto.com" + preRank.get(i).select("td:nth-child(2) > img").attr("src");
			System.out.print("클럽엠블럼 : " + clubimg);
			Rank.setClubimg(clubimg);

			String rank = preRank.get(i).select(" td:nth-child(1)").text();
			System.out.print(" 순위 : " + rank);
			Rank.setRank(rank);

			// #site-wrapper > section.contents > div.container.league-main > div >
			// div.col-8 > div > div.content-bdy.mt-10 > div > table > tbody >
			// tr:nth-child(1) > td:nth-child(2) > a

			// #site-wrapper > section.contents > div.container.league-main > div >
			// div.col-8 > div > div.content-bdy.mt-10 > div > table > tbody >
			// tr:nth-child(2) > td:nth-child(2) > a
			String club = preRank.get(i).select("td:nth-child(2) > a").text();
			System.out.print(", 클럽명 : " + club);
			Rank.setClub(club);

			// #site-wrapper > section.contents > div.container.league-main > div >
			// div.col-8 > div > div.content-bdy.mt-10 > div > table > tbody >
			// tr:nth-child(1) > td:nth-child(3)

			// #site-wrapper > section.contents > div.container.league-main > div >
			// div.col-8 > div > div.content-bdy.mt-10 > div > table > tbody >
			// tr:nth-child(17) > td:nth-child(3)
			String played = preRank.get(i).select("td:nth-child(3)").text();
			System.out.print(" , 경기수" + played);
			Rank.setPlayed(played);

			// #site-wrapper > section.contents > div.container.league-main > div >
			// div.col-8 > div > div.content-bdy.mt-10 > div > table > tbody >
			// tr:nth-child(1) > td:nth-child(4)

			// #site-wrapper > section.contents > div.container.league-main > div >
			// div.col-8 > div > div.content-bdy.mt-10 > div > table > tbody >
			// tr:nth-child(17) > td:nth-child(4)
			String points = preRank.get(i).select("td:nth-child(4)").text();
			System.out.print(" , 승점 " + points);
			Rank.setPoints(points);

			// #site-wrapper > section.contents > div.container.league-main > div >
			// div.col-8 > div > div.content-bdy.mt-10 > div > table > tbody >
			// tr:nth-child(1) > td:nth-child(8)

			// #site-wrapper > section.contents > div.container.league-main > div >
			// div.col-8 > div > div.content-bdy.mt-10 > div > table > tbody >
			// tr:nth-child(17) > td:nth-child(8)
			String goaldif = preRank.get(i).select("td:nth-child(8)").text();
			System.out.print(", 골득실" + goaldif);
			Rank.setGoaldif(goaldif);

			// #site-wrapper > section.contents > div.container.league-main > div >
			// div.col-8 > div > div.content-bdy.mt-10 > div > table > tbody >
			// tr:nth-child(1) > td:nth-child(9)

			// #site-wrapper > section.contents > div.container.league-main > div >
			// div.col-8 > div > div.content-bdy.mt-10 > div > table > tbody >
			// tr:nth-child(17) > td:nth-child(9)
			String goalscore = preRank.get(i).select("td:nth-child(9)").text();
			System.out.print(", 득점" + goalscore);
			Rank.setGoalscore(goalscore);

			// #site-wrapper > section.contents > div.container.league-main > div >
			// div.col-8 > div > div.content-bdy.mt-10 > div > table > tbody >
			// tr:nth-child(1) > td:nth-child(10)
			String goallose = preRank.get(i).select("td:nth-child(10)").text();
			System.out.print(", 실점" + goallose);
			Rank.setGoallose(goallose);

			// #site-wrapper > section.contents > div.container.league-main > div >
			// div.col-8 > div > div.content-bdy.mt-10 > div > table > tbody >
			// tr:nth-child(1) > td:nth-child(5)

			String win = preRank.get(i).select("td:nth-child(5)").text();
			System.out.print(", 승리" + win);
			Rank.setWin(win);

			// #site-wrapper > section.contents > div.container.league-main > div >
			// div.col-8 > div > div.content-bdy.mt-10 > div > table > tbody >
			// tr:nth-child(1) > td:nth-child(6)

			// #site-wrapper > section.contents > div.container.league-main > div >
			// div.col-8 > div > div.content-bdy.mt-10 > div > table > tbody >
			// tr:nth-child(17) > td:nth-child(6)
			String draw = preRank.get(i).select("td:nth-child(6)").text();
			System.out.print(", 무승부" + draw);
			Rank.setDraw(draw);

			// #site-wrapper > section.contents > div.container.league-main > div >
			// div.col-8 > div > div.content-bdy.mt-10 > div > table > tbody >
			// tr:nth-child(1) > td:nth-child(7)
			String lose = preRank.get(i).select("td:nth-child(7)").text();
			System.out.println(", 패배" + lose + "  ");
			Rank.setLose(lose);

			RankGameList.add(Rank);
		}

		mav.addObject("RankList", RankGameList);

		mav.setViewName("score/premierRanking");

		return mav;
	}

	@RequestMapping(value = "/Main", method = RequestMethod.GET)
	public ModelAndView Main() throws Exception {
		ModelAndView mav = new ModelAndView();
		// 1.프리미어리그 순위URL
		String premierRank = "https://www.zentoto.com/sports/soccer/epl";

		// 2. Jsoup URL 접속
		Document doc = Jsoup.connect(premierRank).get();
		Elements preRank = doc.select("tr");
		System.out.println(preRank.size());

		ArrayList<RankDto> RankGameList = new ArrayList<RankDto>();
		int preRankSize = preRank.size();
		if (preRankSize > 21) {
			preRankSize = 21;
		}

		for (int i = 1; i < preRankSize; i++) {
			RankDto Rank = new RankDto();

			// #site-wrapper > section.contents > div.container.league-main > div >
			// div.col-8 > div > div.content-bdy.mt-10 > div > table > tbody >
			// tr:nth-child(1) > td:nth-child(2) > img

			// #site-wrapper > section.contents > div.container.league-main > div >
			// div.col-8 > div > div.content-bdy.mt-10 > div > table > tbody >
			// tr:nth-child(2) > td:nth-child(2) > img
			String clubimg = preRank.get(i).select("td:nth-child(2) > img").attr("src");
			System.out.print("클럽엠블럼 : " + clubimg);
			Rank.setClubimg(clubimg);

			String rank = preRank.get(i).select(" td:nth-child(1)").text();
			System.out.print(" 순위 : " + rank);
			Rank.setRank(rank);

			// #site-wrapper > section.contents > div.container.league-main > div >
			// div.col-8 > div > div.content-bdy.mt-10 > div > table > tbody >
			// tr:nth-child(1) > td:nth-child(2) > a

			// #site-wrapper > section.contents > div.container.league-main > div >
			// div.col-8 > div > div.content-bdy.mt-10 > div > table > tbody >
			// tr:nth-child(2) > td:nth-child(2) > a
			String club = preRank.get(i).select("td:nth-child(2) > a").text();
			System.out.print(", 클럽명 : " + club);
			Rank.setClub(club);

			// #site-wrapper > section.contents > div.container.league-main > div >
			// div.col-8 > div > div.content-bdy.mt-10 > div > table > tbody >
			// tr:nth-child(1) > td:nth-child(3)

			// #site-wrapper > section.contents > div.container.league-main > div >
			// div.col-8 > div > div.content-bdy.mt-10 > div > table > tbody >
			// tr:nth-child(17) > td:nth-child(3)
			String played = preRank.get(i).select("td:nth-child(3)").text();
			System.out.print(" , 경기수" + played);
			Rank.setPlayed(played);

			// #site-wrapper > section.contents > div.container.league-main > div >
			// div.col-8 > div > div.content-bdy.mt-10 > div > table > tbody >
			// tr:nth-child(1) > td:nth-child(4)

			// #site-wrapper > section.contents > div.container.league-main > div >
			// div.col-8 > div > div.content-bdy.mt-10 > div > table > tbody >
			// tr:nth-child(17) > td:nth-child(4)
			String points = preRank.get(i).select("td:nth-child(4)").text();
			System.out.print(" , 승점 " + points);
			Rank.setPoints(points);

			// #site-wrapper > section.contents > div.container.league-main > div >
			// div.col-8 > div > div.content-bdy.mt-10 > div > table > tbody >
			// tr:nth-child(1) > td:nth-child(8)

			// #site-wrapper > section.contents > div.container.league-main > div >
			// div.col-8 > div > div.content-bdy.mt-10 > div > table > tbody >
			// tr:nth-child(17) > td:nth-child(8)
			String goaldif = preRank.get(i).select("td:nth-child(8)").text();
			System.out.print(", 골득실" + goaldif);
			Rank.setGoaldif(goaldif);

			// #site-wrapper > section.contents > div.container.league-main > div >
			// div.col-8 > div > div.content-bdy.mt-10 > div > table > tbody >
			// tr:nth-child(1) > td:nth-child(9)

			// #site-wrapper > section.contents > div.container.league-main > div >
			// div.col-8 > div > div.content-bdy.mt-10 > div > table > tbody >
			// tr:nth-child(17) > td:nth-child(9)
			String goalscore = preRank.get(i).select("td:nth-child(9)").text();
			System.out.print(", 득점" + goalscore);
			Rank.setGoalscore(goalscore);

			// #site-wrapper > section.contents > div.container.league-main > div >
			// div.col-8 > div > div.content-bdy.mt-10 > div > table > tbody >
			// tr:nth-child(1) > td:nth-child(10)
			String goallose = preRank.get(i).select("td:nth-child(10)").text();
			System.out.print(", 실점" + goallose);
			Rank.setGoallose(goallose);

			// #site-wrapper > section.contents > div.container.league-main > div >
			// div.col-8 > div > div.content-bdy.mt-10 > div > table > tbody >
			// tr:nth-child(1) > td:nth-child(5)

			String win = preRank.get(i).select("td:nth-child(5)").text();
			System.out.print(", 승리" + win);
			Rank.setWin(win);

			// #site-wrapper > section.contents > div.container.league-main > div >
			// div.col-8 > div > div.content-bdy.mt-10 > div > table > tbody >
			// tr:nth-child(1) > td:nth-child(6)

			// #site-wrapper > section.contents > div.container.league-main > div >
			// div.col-8 > div > div.content-bdy.mt-10 > div > table > tbody >
			// tr:nth-child(17) > td:nth-child(6)
			String draw = preRank.get(i).select("td:nth-child(6)").text();
			System.out.print(", 무승부" + draw);
			Rank.setDraw(draw);

			// #site-wrapper > section.contents > div.container.league-main > div >
			// div.col-8 > div > div.content-bdy.mt-10 > div > table > tbody >
			// tr:nth-child(1) > td:nth-child(7)
			String lose = preRank.get(i).select("td:nth-child(7)").text();
			System.out.println(", 패배" + lose + "  ");
			Rank.setLose(lose);

			RankGameList.add(Rank);
		}

		mav.addObject("RankList", RankGameList);

		mav.setViewName("Main");

		// 1.프리미어리그 선수득점 순위URL
		String scoreRank = "https://www.zentoto.com/sports/soccer/epl";
		Document scoredoc = Jsoup.connect(scoreRank).get();
		Elements sRank = scoredoc.select(" div.content-bdy.mt-20 > div > table > tbody > tr");

		System.out.println(sRank.size());

		ArrayList<ScoreRankDto> ScoreRankList = new ArrayList<ScoreRankDto>();

		for (int i = 0; i < sRank.size(); i++) {
			ScoreRankDto score = new ScoreRankDto();

			// #site-wrapper > section.contents > div.container.league-main > div >
			// div.col-8 > div > div.content-bdy.mt-20 > div > table > tbody >
			// tr:nth-child(2) > td.text-center.bold

			// #site-wrapper > section.contents > div.container.league-main > div >
			// div.col-8 > div > div.content-bdy.mt-20 > div > table > tbody >
			// tr:nth-child(1)
			String scorerank = sRank.get(i).select("td.text-center.bold").text();
			System.out.print("순위 : " + scorerank);
			score.setScorerank(scorerank);

			// #site-wrapper > section.contents > div.container.league-main > div >
			// div.col-8 > div > div.content-bdy.mt-10 > div > table > tbody >
			// tr:nth-child(1) > td:nth-child(2) > a

			// #site-wrapper > section.contents > div.container.league-main > div >
			// div.col-8 > div > div.content-bdy.mt-10 > div > table > tbody >
			// tr:nth-child(2) > td:nth-child(2) > a

			// #site-wrapper > section.contents > div.container.league-main > div >
			// div.col-8 > div > div.content-bdy.mt-20 > div > table > tbody >
			// tr:nth-child(1) > td.text-left

			String player = sRank.get(i).select(" td.text-left").text();
			System.out.print(" 선수명 : " + player);
			score.setPlayer(player);

			// #site-wrapper > section.contents > div.container.league-main > div >
			// div.col-8 > div > div.content-bdy.mt-10 > div > table > tbody >
			// tr:nth-child(1) > td:nth-child(3)

			// #site-wrapper > section.contents > div.container.league-main > div >
			// div.col-8 > div > div.content-bdy.mt-10 > div > table > tbody >
			// tr:nth-child(17) > td:nth-child(3)

			// #site-wrapper > section.contents > div.container.league-main > div >
			// div.col-8 > div > div.content-bdy.mt-20 > div > table > tbody >
			// tr:nth-child(1) > td:nth-child(3)

			String team = sRank.get(i).select(" td:nth-child(3)").text();
			System.out.print(" 소속팀 : " + team);
			score.setTeam(team);

			// #site-wrapper > section.contents > div.container.league-main > div >
			// div.col-8 > div > div.content-bdy.mt-10 > div > table > tbody >
			// tr:nth-child(1) > td:nth-child(4)

			// #site-wrapper > section.contents > div.container.league-main > div >
			// div.col-8 > div > div.content-bdy.mt-10 > div > table > tbody >
			// tr:nth-child(17) > td:nth-child(4)

			// #site-wrapper > section.contents > div.container.league-main > div >
			// div.col-8 > div > div.content-bdy.mt-20 > div > table > tbody >
			// tr:nth-child(2) > td:nth-child(4)
			String game = sRank.get(i).select(" td:nth-child(4)").text();
			System.out.print(" 경기수 : " + game);
			score.setGame(game);

			// #site-wrapper > section.contents > div.container.league-main > div >
			// div.col-8 > div > div.content-bdy.mt-10 > div > table > tbody >
			// tr:nth-child(1) > td:nth-child(8)

			// #site-wrapper > section.contents > div.container.league-main > div >
			// div.col-8 > div > div.content-bdy.mt-10 > div > table > tbody >
			// tr:nth-child(17) > td:nth-child(8)

			// #site-wrapper > section.contents > div.container.league-main > div >
			// div.col-8 > div > div.content-bdy.mt-20 > div > table > tbody >
			// tr:nth-child(2) > td:nth-child(5)
			String totalscore = sRank.get(i).select(" td:nth-child(5)").text();
			System.out.print(" 득점(PK) : " + totalscore);
			score.setTotalscore(totalscore);

			// #site-wrapper > section.contents > div.container.league-main > div >
			// div.col-8 > div > div.content-bdy.mt-10 > div > table > tbody >
			// tr:nth-child(1) > td:nth-child(9)

			// #site-wrapper > section.contents > div.container.league-main > div >
			// div.col-8 > div > div.content-bdy.mt-10 > div > table > tbody >
			// tr:nth-child(17) > td:nth-child(9)

			// #site-wrapper > section.contents > div.container.league-main > div >
			// div.col-8 > div > div.content-bdy.mt-20 > div > table > tbody >
			// tr:nth-child(2) > td:nth-child(6)
			String avgscore = sRank.get(i).select(" td:nth-child(6)").text();
			System.out.print(" 경기당 골 : " + avgscore);
			score.setAvgscore(avgscore);

			// #site-wrapper > section.contents > div.container.league-main > div >
			// div.col-8 > div > div.content-bdy.mt-10 > div > table > tbody >
			// tr:nth-child(1) > td:nth-child(10)

			// #site-wrapper > section.contents > div.container.league-main > div >
			// div.col-8 > div > div.content-bdy.mt-20 > div > table > tbody >
			// tr:nth-child(2) > td:nth-child(7)
			String country = sRank.get(i).select(" td:nth-child(7)").text();
			System.out.println(" 국적 : " + country);
			score.setCountry(country);

			ScoreRankList.add(score);
		}
		mav.addObject("ScoreRank", ScoreRankList);

		mav.setViewName("Main");

		String AssistRank = "https://sports.news.naver.com/wfootball/record/index?category=epl&league=100&tab=player";

		// #site-wrapper > section.contents > div.container.league-main > div >
		// div.col-8 > div > div.content-bdy.mt-10 > div > table

		// #site-wrapper > section.contents > div.container.league-main > div >
		// div.col-8 > div > div.content-bdy.lg-result.mt-10 > div > div:nth-child(3)
		// 2. Jsoup URL 접속
		Document assistdoc = Jsoup.connect(AssistRank).get();
		Elements aRank = assistdoc.select("div.list");

		System.out.println(aRank);
		System.out.println(aRank.size());

		ArrayList<AssistDto> assistList = new ArrayList<AssistDto>();

		Elements lead_Title = aRank.get(1).select("div.text");
		for (int i = 0; i < lead_Title.size(); i++) {
			AssistDto assist = new AssistDto();

			String playerName = lead_Title.get(i).select("span.name").text();
			System.out.print("선수이름 : " + playerName);
			String ateam = lead_Title.get(i).select("span.team").text();
			System.out.print("팀이름 : " + ateam);

			String aassist = lead_Title.get(i).select("div.stat > span").text();

			System.out.println("도움개수 : " + aassist);

			assist.setArank((i + 1) + "");
			assist.setAplayer(playerName);
			assist.setAteam(ateam);
			assist.setAassist(aassist);
			assistList.add(assist);
		}

		mav.addObject("AssistList", assistList);

		mav.setViewName("Main");

		return mav;

	}

	@RequestMapping(value = "/MatchSchedule", method = RequestMethod.GET)
	public ModelAndView schedule() throws Exception {
		ModelAndView mav = new ModelAndView();
		// 1.프리미어리그 순위URL
		String leagueSchedule = "https://www.zentoto.com/sports/soccer/epl/fixtures";

		// 2. Jsoup URL 접속
		Document doc = Jsoup.connect(leagueSchedule).get();
		Elements premierSchedule = doc.select("div.league-game");
		System.out.println(premierSchedule.size());

		ArrayList<ScheduleDto> premierScheduleList = new ArrayList<ScheduleDto>();

		for (int i = 1; i < premierSchedule.size(); i++) {
			ScheduleDto ScheduleDto = new ScheduleDto();

			// #site-wrapper > section.contents > div.container.league-main > div >
			// div.col-8 > div > div.content-bdy.lg-fixture.mt-10 > div > div:nth-child(2) >
			// div > div:nth-child(2) > div > div.col-2.logo-sp > img

			// #site-wrapper > section.contents > div.container.league-main > div >
			// div.col-8 > div > div.content-bdy.lg-fixture.mt-10 > div > div:nth-child(3) >
			// div > div:nth-child(2) > div > div.col-2.logo-sp > img
			String homeimg = "https://www.zentoto.com" + premierSchedule.get(i)
					.select("div > div:nth-child(2) > div > div.col-2.logo-sp > img").attr("src");
			System.out.print("홈엠블럼 : " + homeimg);
			ScheduleDto.setHomeimg(homeimg);

			// #site-wrapper > section.contents > div.container.league-main > div >
			// div.col-8 > div > div.content-bdy.lg-fixture.mt-10 > div > div:nth-child(2) >
			// div > div:nth-child(4) > div > div.col-2.logo-sp > img

			// #site-wrapper > section.contents > div.container.league-main > div >
			// div.col-8 > div > div.content-bdy.lg-fixture.mt-10 > div > div:nth-child(3) >
			// div > div:nth-child(4) > div > div.col-2.logo-sp > img
			String awayimg = "https://www.zentoto.com" + premierSchedule.get(i)
					.select("div > div:nth-child(4) > div > div.col-2.logo-sp > img").attr("src");
			System.out.print("원정엠블럼 : " + awayimg);
			ScheduleDto.setAwayimg(awayimg);

			String sdate = premierSchedule.get(i).select(" div.w15 > p").text();
			System.out.print("일정 : " + sdate);
			ScheduleDto.setSdate(sdate);

			// #site-wrapper > section.contents > div.container.league-main > div >
			// div.col-8 > div > div.content-bdy.mt-10 > div > table > tbody >
			// tr:nth-child(1) > td:nth-child(2) > a

			// #site-wrapper > section.contents > div.container.league-main > div >
			// div.col-8 > div > div.content-bdy.mt-10 > div > table > tbody >
			// tr:nth-child(2) > td:nth-child(2) > a

			// #site-wrapper > section.contents > div.container.league-main > div >
			// div.col-8 > div > div.content-bdy.lg-fixture.mt-10 > div > div:nth-child(2) >
			// div > div:nth-child(2) > div > div.col-10.text-right > a
			String shome = premierSchedule.get(i).select("div.col-10.text-right > a").text();
			System.out.print(", 홈팀 " + shome);
			ScheduleDto.setShome(shome);

			// #site-wrapper > section.contents > div.container.league-main > div >
			// div.col-8 > div > div.content-bdy.mt-10 > div > table > tbody >
			// tr:nth-child(1) > td:nth-child(3)

			// #site-wrapper > section.contents > div.container.league-main > div >
			// div.col-8 > div > div.content-bdy.mt-10 > div > table > tbody >
			// tr:nth-child(17) > td:nth-child(3)

			// #site-wrapper > section.contents > div.container.league-main > div >
			// div.col-8 > div > div.content-bdy.lg-fixture.mt-10 > div > div:nth-child(2) >
			// div > div:nth-child(4) > div > div.col-10.text-left > a
			String saway = premierSchedule.get(i).select("div.col-10.text-left > a").text();
			System.out.println(" , 원정팀 " + saway);
			ScheduleDto.setSaway(saway);

			premierScheduleList.add(ScheduleDto);
		}

		mav.addObject("ScheduleList", premierScheduleList);

		mav.setViewName("score/schedule");

		return mav;
	}

	@RequestMapping(value = "/assist", method = RequestMethod.GET)
	public ModelAndView assist() throws Exception {
		ModelAndView mav = new ModelAndView();
		// 1.프리미어리그 순위URL
		String AssistRank = "https://sports.news.naver.com/wfootball/record/index?category=epl&league=100&tab=player";

		// #site-wrapper > section.contents > div.container.league-main > div >
		// div.col-8 > div > div.content-bdy.mt-10 > div > table

		// #site-wrapper > section.contents > div.container.league-main > div >
		// div.col-8 > div > div.content-bdy.lg-result.mt-10 > div > div:nth-child(3)
		// 2. Jsoup URL 접속
		Document doc = Jsoup.connect(AssistRank).get();
		Elements assist = doc.select("div.lead_area");

		System.out.println(assist);
		System.out.println(assist.size());

		ArrayList<ResultDto> assistList = new ArrayList<ResultDto>();

		for (int i = 0; i < assist.size(); i++) {
			ResultDto score = new ResultDto();
			// #site-wrapper > section.contents > div.container.league-main > div >
			// div.col-8 > div > div.content-bdy.lg-result.mt-10 > div > div:nth-child(2) >
			// div > div:nth-child(1) > p

			// #site-wrapper > section.contents > div.container.league-main > div >
			// div.col-8 > div > div.content-bdy.lg-result.mt-10 > div > div:nth-child(5) >
			// div > div:nth-child(1)

			// #site-wrapper > section.contents > div.container.league-main > div >
			// div.col-8 > div > div.content-bdy.lg-result.mt-10 > div > div:nth-child(2) >
			// div > div:nth-child(2) > div > div.col-2.logo-sp > img

			// #site-wrapper > section.contents > div.container.league-main > div >
			// div.col-8 > div > div.content-bdy.lg-result.mt-10 > div > div:nth-child(3) >
			// div > div:nth-child(2) > div > div.col-2.logo-sp > img
			String homeimg = "https://www.zentoto.com"
					+ assist.get(i).select("div > div:nth-child(2) > div > div.col-2.logo-sp > img").attr("src");
			System.out.print("순위 : " + homeimg);
			score.setHomeimg(homeimg);

			// #site-wrapper > section.contents > div.container.league-main > div >
			// div.col-8 > div > div.content-bdy.lg-result.mt-10 > div > div:nth-child(2) >
			// div > div:nth-child(4) > div > div.col-2.logo-sp > img

			// #site-wrapper > section.contents > div.container.league-main > div >
			// div.col-8 > div > div.content-bdy.lg-result.mt-10 > div > div:nth-child(3) >
			// div > div:nth-child(4) > div > div.col-2.logo-sp > img
			String awayimg = "https://www.zentoto.com"
					+ assist.get(i).select("div > div:nth-child(4) > div > div.col-2.logo-sp > img").attr("src");
			System.out.print("원정엠블럼 : " + awayimg);
			score.setAwayimg(awayimg);

			String matchDate = assist.get(i).select("div> div:nth-child(1) > p").text();
			String matchDateArr[] = matchDate.split(" ");
			matchDate = matchDateArr[0] + " " + matchDateArr[1];
			System.out.print("경기일 : " + matchDate);
			score.setMdate(matchDate);

			// #site-wrapper > section.contents > div.container.league-main > div >
			// div.col-8 > div > div.content-bdy.lg-result.mt-10 > div > div:nth-child(2) >
			// div > div:nth-child(2) > div > div.col-10.text-right > a

			// #site-wrapper > section.contents > div.container.league-main > div >
			// div.col-8 > div > div.content-bdy.lg-result.mt-10 > div > div:nth-child(13) >
			// div > div:nth-child(2) > div > div.col-10.text-right > a
			String homeTeam = assist.get(i).select("div > div:nth-child(2) > div > div.col-10.text-right > a").text();
			System.out.print(", 홈팀 : " + homeTeam);
			score.setHometeam(homeTeam);

			// #site-wrapper > section.contents > div.container.league-main > div >
			// div.col-8 > div > div.content-bdy.lg-result.mt-10 > div > div:nth-child(2) >
			// div > div:nth-child(3) > div > div.col-5.text-right.bold
			String homeScore = assist.get(i).select("div > div:nth-child(3) > div > div.col-5.text-right.bold").text();
			System.out.print(" " + homeScore);
			score.setHomescore(homeScore);

			// #site-wrapper > section.contents > div.container.league-main > div >
			// div.col-8 > div > div.content-bdy.lg-result.mt-10 > div > div:nth-child(2) >
			// div > div:nth-child(3) > div > div.col-5.text-left.bold
			String awayScore = assist.get(i).select(" div > div:nth-child(3) > div > div.col-5.text-left.bold").text();
			System.out.print(" : " + awayScore);
			score.setAwayscore(awayScore);

			// #site-wrapper > section.contents > div.container.league-main > div >
			// div.col-8 > div > div.content-bdy.lg-result.mt-10 > div > div:nth-child(2) >
			// div > div:nth-child(4) > div > div.col-10.text-left
			String awayTeam = assist.get(i).select("div > div:nth-child(4) > div > div.col-10.text-left").text();
			System.out.print(awayTeam + "원정팀");
			score.setAwayteam(awayTeam);

			assistList.add(score);

		}

		mav.addObject("AssistList", assistList);

		mav.setViewName("score/score");

		return mav;
	}

	@RequestMapping(value = "/opentalkForm")
	public ModelAndView opentalkForm() {
		System.out.println("오픈톡 페이지 이동요청");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("Opentalk");
		return mav;
	}

	@RequestMapping(value = "/highlightForm")
	public ModelAndView highlightForm() {
		System.out.println("하이라이트 페이지 이동요청");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("highlight");
		return mav;
	}

	@RequestMapping(value = "/aboutForm")
	public ModelAndView aboutForm() {
		System.out.println("홈페이지 소개페이지 이동요청");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("about");
		return mav;
	}

	@RequestMapping(value = "/betting")
	public ModelAndView bettingForm() {
		System.out.println("승부예측 이동");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("betting");
		return mav;
	}

	@RequestMapping(value = "/infoForm")
	public ModelAndView infoForm() {
		System.out.println("공지사항 페이지 이동요청");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("info");
		return mav;
	}

	@RequestMapping(value = "/payResult")
	public ModelAndView payResult() {
		System.out.println("결제완료 페이지 이동요청");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("shop/Ticket_PayResult");
		return mav;
	}

	@RequestMapping(value = "/newsForm")
	public ModelAndView newsForm() {
		System.out.println("뉴스 페이지 이동요청");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("News");
		return mav;
	}
}
