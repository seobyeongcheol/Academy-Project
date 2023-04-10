<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Modern Business - Start Bootstrap Template</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon"
	href="${pageContext.request.contextPath }/assets/favicon.ico" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- CSS 스프링 안에서 연결  -->
<link
	href="${pageContext.request.contextPath }/resources/css/styles.css"
	rel="stylesheet">
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css"
	rel="stylesheet">
<!-- 스프링 안에서 연결  -->
</head>
<body class="d-flex flex-column h-120">
	<main class="flex-shrink-0">
		<!-- Navigation-->
		<%@ include file="/WEB-INF/views/include/topbar.jsp"%>
		<!-- Header-->

		<div id="wrapper" style="width: 1070px; height: 400px;">
			<div id="slider-wrap" style="width: 1070px; height: 400px;">
				<ul id="slider"
					style="width: 1070px; height: auto; padding-left: 1px">
					<li style="width: 1070px; height: auto;">
						<div></div> <img
						src="${pageContext.request.contextPath }/resources/img/banner1.jpg"
						style="width: 1070px; height: auto;">
					</li>

					<li style="width: 1070px; height: auto;">
						<div></div> <img
						src="${pageContext.request.contextPath }/resources/img/banner2.jpg"
						style="width: 1070px; height: auto;">
					</li>
				</ul>

				<!--controls-->
				<div class="btns" id="next">
					<i class="fa fa-arrow-right"></i>
				</div>
				<div class="btns" id="previous">
					<i class="fa fa-arrow-left"></i>
				</div>
				<div id="counter"></div>

				<div id="pagination-wrap">
					<ul>
					</ul>
				</div>
			</div>
		</div>
		<br>

		<div class="f-wrap"
			style="width: 85.7142857143rem; margin: 0 auto; max-width: 100%;">
			<div class="aside left"
				style="float: left; position: relative; z-index: 3;">
				<div class="ranking" style="margin-bottom: 4rem;">
					<h2 class="campton">팀 순위</h2>
					<div class="box">
						<ul class="tab-btns low" style="padding-right: 2rem;">
							<li class="eplbtn"><a class="eplbtn"> <img
									src="${pageContext.request.contextPath }/resources/img/premier league.jpg"
									style="height: 40px; width: 180px;" alt="EPL">
							</a></li>
						</ul>
						<div class="tab-con-wrap">
							<div class="cont1">
								<table class="roboto center" id="rank-league1"
									style="color: #222222; - -swiper-theme-color: #007aff; - -swiper-navigation-size: 44px; visibility: visible; margin: 0; padding: 0; border: 0; font: inherit; vertical-align: baseline; border-collapse: collapse; border-spacing: 0; width: 100%; text-align: center; font-family: 'Roboto', 'NotoSansKR', sans-serif; margin-top: 1.4285714286rem; margin-bottom: 0.4rem; font-size: 0.8571428571rem; font-weight: 500;">
									<thead>
										<tr style="font-size: 0.7rem;">
											<th>순위</th>
											<th>클럽</th>
											<th>경기</th>
											<th>승점</th>
											<th>승</th>
											<th>무</th>
											<th>패</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${RankList }" var="Rank">
											<tr>
												<td>${Rank.rank }</td>
												<td>${Rank.club }</td>
												<td>${Rank.played }</td>
												<td>${Rank.points }</td>
												<td>${Rank.win }</td>
												<td>${Rank.draw }</td>
												<td>${Rank.lose }</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
							<div class="cont2">
								<table class="roboto" id="rank-league2">
									<thead>
										<tr style="font-size: 0.7rem;">
											<th>순위</th>
											<th>클럽명</th>
											<th>경기수</th>
											<th>승점</th>
											<th>승리</th>
											<th>무승부</th>
											<th>패배</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${RankList }" var="Rank">
											<tr>
												<td>${Rank.rank }</td>
												<td>${Rank.club }</td>
												<td>${Rank.played }</td>
												<td>${Rank.points }</td>
												<td>${Rank.win }</td>
												<td>${Rank.draw }</td>
												<td>${Rank.lose }</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<a href="${pageContext.request.contextPath }/premierRanking"
						class="btn-more size2 side-more" style="float: right;">더보기<span
						class="icon"></span></a>
				</div>
				<div class="score" style="margin-bottom: 4rem;">
					<h2 id="small-title"
						style="-swiper-theme-color: #007aff; - -swiper-navigation-size: 44px; margin: 0; border: 0; font: inherit; vertical-align: baseline; font-size: 1.2rem; font-weight: 800; padding: 0 0 1.2142857143rem; color: #222222;">
						시즌 득점 <span class="campton">TOP5</span>
					</h2>
					<div class="box"
						style="color: #222222; - -swiper-theme-color: #007aff; - -swiper-navigation-size: 44px; margin: 0; border: 0; font: inherit; vertical-align: baseline; background: #fff; width: 20rem; box-sizing: border-box; padding: 1.0714285714rem 1.4285714286rem 1.1428571429rem; text-align: center; box-shadow: 0px 0.1428571429rem 1.4285714286rem 0 rgba(15, 16, 16, 0.15);">
						<ul class="tab-btns low" style="padding-right: 2rem;">
							<li class="eplbtn"><a class="eplbtn"> <img
									src="${pageContext.request.contextPath }/resources/img/premier league.jpg"
									style="height: 40px; width: 180px;" alt="EPL">
							</a></li>
						</ul>
						<div class="tab-con-wrap">
							<div class="cont active">
								<table class="roboto center" id="rank-league1"
									style="color: #222222; - -swiper-theme-color: #007aff; - -swiper-navigation-size: 44px; visibility: visible; margin: 0; padding: 0; border: 0; font: inherit; vertical-align: baseline; border-collapse: collapse; border-spacing: 0; width: 100%; text-align: center; font-family: 'Roboto', 'NotoSansKR', sans-serif; margin-top: 1.4285714286rem; margin-bottom: 0.4rem; font-size: 0.8571428571rem; font-weight: 500;">
									<thead>
										<tr style="font-size: 0.7rem;">
											<th>순위</th>
											<th>선수</th>
											<th>소속</th>
											<th>경기</th>
											<th>득점(PK)</th>
											<th>평균골</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${ScoreRank }" var="score">
											<tr>
												<td>${score.scorerank }</td>
												<td>${score.player }</td>
												<td>${score.team }</td>
												<td>${score.game }</td>
												<td>${score.totalscore }</td>
												<td>${score.avgscore }</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
							<div class="cont"></div>
						</div>
					</div>
				</div>
				<div class="score" style="margin-bottom: 4rem;">
					<h2 id="small-title"
						style="-swiper-theme-color: #007aff; - -swiper-navigation-size: 44px; margin: 0; border: 0; font: inherit; vertical-align: baseline; font-size: 1.2rem; font-weight: 800; padding: 0 0 1.2142857143rem; color: #222222;"">
						시즌 무실점 <span class="campton">TOP5</span>
					</h2>
					<div class="box" style="">
						<ul class="tab-btns low" style="padding-right: 2rem;">
							<li class="eplbtn"><a class="eplbtn"> <img
									src="${pageContext.request.contextPath }/resources/img/premier league.jpg"
									style="height: 40px; width: 180px;" alt="EPL">
							</a></li>
						</ul>
						<div class="tab-con-wrap">
							<div class="cont active">
								<table class="roboto" id="rank-league2">
									<thead>
										<tr style="font-size: 0.7rem;">
											<th>순위</th>
											<th>선수</th>
											<th>팀명</th>
											<th>도움수</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${AssistList }" var="Assist"
											varStatus="status">
											<tr>
												<td>${status.index + 1 }</td>
												<td>${Assist.aplayer }</td>
												<td>${Assist.ateam }</td>
												<td>${Assist.aassist }</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
				<div class="opentalk" style="margin-bottom: 4rem;">
					<div class="open_talk_section">
						<a type="button" onclick="openWindowPop()" target="_blank"><img
							alt="오픈톡"
							src="${pageContext.request.contextPath }/resources/img/opentalk.jpg "
							style="width: 300px; height: 180px; border-radius: 10px;"></a>
					</div>
				</div>
			</div>
			<div class="contents-wrap right"
				style="float: right; position: relative; z-index: 2; width: 61.4285714286rem;">
				<div class="news" style="margin-bottom: 4rem;">
					<h2 class="tit">뉴스</h2>
					<div class="box">
						<div class="newsmenu">
							<div class="mb-4" style="padding-bottom: 10px;">
								<strong
									style="font-size: 1.2857142857rem; font-weight: 900; float: left;">해외
									축구</strong> <a href="${pageContext.request.contextPath }/newsForm"
									class="btn-more size2" style="float: right;">뉴스 더보기 <span
									class="icon"></span>
								</a>
							</div>
							<hr>
						</div>
						<div class="tab-con-wrap row">
							<div class="cont active">
								<ul class="gall f-wrap" id="news-all">
									<li class="l-box"><a
										href="https://sports.news.naver.com/news?oid=311&aid=0001565802"
										class="f-wrap"><div class="img-box" style="float: left;">
												<img
													src="https://imgnews.pstatic.net/image/311/2023/03/08/0001565802_001_20230308065103494.jpg?type=w647"
													width="530px;" height="auto;">
											</div>
											<div class="txt-box" style="float: left;">
												<span class="sort">NEWS <br></span><strong class="name">김민재,
													연봉 더 못 올려 '이적 불가피'…"35억 이상은 줄 수 없다"</strong><span class="s-txt">(엑스포츠뉴스
													김현기 기자) 김민재의 소속팀인 이탈리아 나폴리가 간판 스트라이커 빅터 오시멘을 잡기 위해 연봉 상한선을
													깨트리면서까지 그를 붙잡을 생각이다....</span>
											</div></a></li>
									<li><a
										href="https://sports.news.naver.com/news?oid=076&aid=0003978520"><div
												class="img-box">
												<img
													src="https://imgnews.pstatic.net/image/076/2023/03/07/2023030801000470200047303_20230307081102041.jpg?type=w647"
													width="280px;" height="auto;"><span class="sort">NEWS</span><strong
													class="name">또 4개월 결장 '시한폭탄' 네이마르의 오른 발목</strong>
											</div></a></li>
									<li><a
										href="https://sports.news.naver.com/news?oid=477&aid=0000414692"><div
												class="img-box">
												<img
													src="https://imgnews.pstatic.net/image/477/2023/03/07/0000414692_001_20230307093003006.jpg?type=w647"
													width="280px;" height="80%"><span class="sort">NEWS</span><strong
													class="name">토트넘 '짝사랑' 결실 맺나…바르셀로나 이적 허용</strong>
											</div></a></li>
									<li class="last"><a
										href="https://sports.news.naver.com/news?oid=088&aid=0000802040"><div
												class="img-box">
												<img
													src="https://imgnews.pstatic.net/image/088/2023/03/07/0000802040_001_20230307092901200.jpg?type=w647"
													width="280px;" height="60%;"><span class="sort">NEWS</span><strong
													class="name">모드리치, 크로아티아 우승 마침표 찍으러 간다</strong>
											</div></a></li>
								</ul>
							</div>
						</div>

						<div class="cont"></div>

						<div class="cont"></div>

						<div class="cont"></div>

						<div class="cont"></div>

						<div class="cont"></div>
					</div>
				</div>

				<!-- video -->
				<div class="video" style="margin-bottom: 4rem;">
					<h2 class="tit">영상</h2>
					<div class="tab-con-wrap">
						<div class="cont active">
							<div class="box" style="margin-bottom: 4rem; height: 520px;">
								<div class="mb-4" style="padding-bottom: 10px;">
									<strong
										style="font-size: 1.2857142857rem; font-weight: 900; float: left;">하이라이트</strong>
									<a href="${pageContext.request.contextPath }/highlightForm"
										class="btn-more size2" style="float: right;">영상 더보기 <span
										class="icon"></span>
									</a>
								</div>
								<hr>
								<div class="f-wrap gall style2" id="highlightK1Main">
									<ul class="right f-wrap" id="highlightK1Sub">
										<li><a href="https://www.youtube.com/watch?v=lIR5HyC-C0M">
												<div class="img-box">
													<img alt="[22/23 UCL] 토트넘 vs 프랑크푸르트 손흥민 활약상"
														src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQHrJuQBKBaRWS8o3Yqow3yjHutRzYwVjIbVg&usqp=CAU">
												</div>
												<div class="txt-box">
													<strong class="name">[22/23 UCL] 토트넘 vs 프랑크푸르트 손흥민
														활약상</strong>
													<div class="sort2">
														<span>2022.10.29 </span><span>조회수 413만회</span>
													</div>
												</div>
										</a></li>
										<li><a href="https://www.youtube.com/watch?v=hakHChindAE">
												<div class="img-box">
													<img alt="[22/23 세리에A 18R] 나폴리 vs 유벤투스 김민재 주요장면"
														src="data:image/jpeg;base64,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">
												</div>
												<div class="txt-box">
													<strong class="name"> [22/23 세리에A 18R] 나폴리 vs 유벤투스
														김민재 주요장면</strong>
													<div class="sort2">
														<span>2022.10.26 </span><span>조회수 155만회</span>
													</div>
												</div>
										</a></li>
										<li><a href="https://www.youtube.com/watch?v=2_nEJd6JkOk">
												<div class="img-box">
													<img alt="[22/23 라리가 16R] 마요르카 vs 바야돌리드 이강인 주요장면"
														src="data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBxISEhUSEhAVFRUVFRcWFRYVFRYVFRUWFRUWFhcVFRUYHSggGBolGxUXITEhJSkrLi4uFx8zODMsNygtLisBCgoKDg0OGhAQGislHyYtLS0tLS0tKy0tLy0tLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLf/AABEIAKgBLAMBIgACEQEDEQH/xAAcAAABBQEBAQAAAAAAAAAAAAADAAIEBQYBBwj/xABDEAACAQIDBAgDBQUHAwUAAAABAgADEQQSIQUxQVEGEyIyYXGBkUKhsRQjUoLBYnLR4fAHFTOSstLxFlOiJDRDg+L/xAAbAQACAwEBAQAAAAAAAAAAAAAAAQMEBQIGB//EADcRAAEDAgQEBAUCBQUBAAAAAAEAAhEDBBIhMUEFUWFxIpGh8BMygbHRQsEjkqLh8RQVM2JyBv/aAAwDAQACEQMRAD8A8ZAjrTgjpwpgmWjHEex0Mutk4GhVWlnBzEVGqZaoBFNLAMEym7klgqDiATpeNcuIWdacmi2ds3DmkHqlgesQMSVXsOtIhUAJJa7sd3dUneMshYjC0vtDIjFqSm2ZbsNF1ytluVzaA2uRYzoFRgE5BVgEeBLOthcOo79S5zWupG7cT2fl9IGhRotXVQ5FJqlNS7WBRW77Hhpr7TvEEGQYII7iFFAjrSwxGFpCuKYcCmWohmzrUyB1U1B1i9lspLC407M7icLRFcoHbq8qG6MtYqzUwzJnQZXsxIuBwjxp4lXEQZE0H9yKLKyYkO+Uopovdxc3yjJr2bHwJ4yJU2dTFdaTtUpLdg5qKUZbC4vmAtc/WMuhGJQ6DALu3n5CQi92ud15pDsvCAf+8J72409wfKDYkHVbG3ny1pqOGplMzVQrWJC2JuRuB5X/AFkWpSJXDQIFreU0uxuhz1FFR7AHXzEH0ZoUBjaAd+uTORbKGW9jkLLrcXtpbxno2zURMVi8JTUrSoii1Ome6rVQzVTT00Ukrp4G1pXrOLZA1iVNQp4oJ0mFmf8Apmmo0WRNpbDVKZqD4SL+4E32Lw2gHMzO9IktTFMatVdVA/aJsB7ymyq4kK4+kwA5Lzh8KMpJ5fPMT9BIOGo6EkaWH+oX+U0W3aHV161EDQBbeml/nKlCFQKR3gfQEgD5y+18qg5kBOandVHEaAjeeI89PneNFtAeIN9AR4GdWuo7B/KeIt/MQDYkAjMu7Q/xna4R6eHBPOGXCXGmnnxkFMWFGXfyP0v9I044m/8AWkUIU+rUUWS3atv8Rw+UDSxYawK7tD4i4+crmzMdLm3GPwqlqg53ufSMhCtgovuhUA5SODrDoY1GihRyEdYch7RCdAghNyjkJ3KOQ9o+cghMKDkPaNNMchLno5RovVZawUg0m6sVGenT6265BUdNUU6i50uRNLiNgYfqar/ZGp2XFavVbPRelTU0ksHKvdiddbi3OCF5+aY5QbU/Cb7amx8KlVFXDgD7a2GYGpVOZAlJg3f0a7ndp4TO4nCp9nWuKeXP1agAtZWzYjrLXJO6lT3k9+CFnzT8Izq/CSykGUghVIMWaDJiESsBOLQTCFg2jSJTDEJ2cEajTo5TGToM6CEQN4zu/frGiEURymlkHITmQco+06FilCAVljs8KEYlQbsBqL8JFywqEhGtwIP6Tl2YQF6P/ZAtBGq164GRdAGAte1xa/HUTVrWRmLBVBbflsL6k8N/nM70T2QBgEao1gVDgAC7NUOY3/LYekinZ5pt2HYa8+EoVQHHVXqJc0aeq1qqxcGxta/GZzG02+3Ui4ulJi51t2guYD0sJf7D2kw75vpa8j7XqoKnWasTckDmVAHmNJA0FpgKZ2YkrHbSwjV8VUrBSoKsEB4k90ePCU2M2Mxp1jbWhQp6/tmoGYei3PpN1iNt0SFC0WUrxPEkWN/ORzgmqXKMO3/iK3/yA6kNw8Bp4SdjnNUDwxwXlm001QjcaaH5f8e8iMSbX1nrVDoCGpgltFJA0GYAdwFha9geUpekXRLq1zJY21OljJhcNnCoTQdErz4Uzykuhgr6n2hFS58jaSqJy6eF/wCvYyxKrypOHwygEDiNfVR/GQqlDI5bmunmYelUsb8/0FozHcxEEIdMyShkSmZKpmdFRqQseIxYRYk0p0CdighStnY9qDMyqjZ0amy1FDqyMQSCp/dENtba9XE263Lo7uMqgWLhQfTsLIEUEK3x3SOvVZGYUwUq9d2aYXNUIUFn/EbKB6SrbEuaS0SewjMyjxcKDr+Qe55xkYYISMHaOMZEhS9qdHkYZ6RseXA+nCZirSZDlYWP9bptWqEaiR8dhErDUa/MeUzqN0Rk/wA17PiXBGul9uIPLYrHGNMlY3BtTNju4HnI80gQcwvJOa5pwuEEIZERjiI1o1wuAzt4yKNCKskKJHSSKcCUBEAjwsaIQCcrpMywlNDZwBclbC3MkWjgJd9CsKKuOw1M7mr0yfEKwcg+HZnJdAlOF6Pt+i2Eo0kyMwVVAVeIAA0lRsbby4guhw7AoLkqwcAaakWDceXA8p6Tt7Ef+oDAD7nRQd1xxIH9aCYXAYPqnc0wFLntEe9vDfM/wiQdVoNDyBGSFgheoFG5jYeu6Ttq4Jl3jQSTh8FqlQLZQSEt8bDvN5aj1ly33gKsv9b5A50FThkiVgKe08IlTq6tXK+m5GexNgL5Qbbx7y9wuJp/AyvbfaxI8GXevqJV4norSOIDFWuHz+BObN2jbXU8901J2LSrNmqoCw7py2tfxGslJbEgmVEGunQQjbNxI1AUG+hEZtPZwYE20O8GWGA2Kq2CuwsQSb8BvFzfSSMWwFxfyEgcVI0L596Q4LqsQ6geI9f+JDVWaxVSedh46D6+01HTynlxStz38dB/zLno7gadPDpnKqXOYubDsknIBfwPzmiK2GkHFZ/wcVUt2WSHRytlDvUpU2ZbpSdrVHF9bC1rnW3OU+0Tqo/ZufWeo4nBrUosSwLIykEEEjUAG/gbTzXpMoXFVVXcrkD629L2hb1jUJBXV3bCmwOb29JUGlJlOQ6cl05bVBSkhFgqcKsSadHRRQQlFFFBCaZwx8ZBCYYyEMHEhWYaMY2MbmnQZigQvqUolVFqLZhe8zeN2YyE5QWXwFyPaX6m0c1dlOhk9Gq6mY2WXf8ADaVyMWjuayFoxhNDtGmKra6NbhpeR63R+qFDqUcHgrdrTeMp4+F5oMqtcvKXFhVpOIieoVIROWhWUg2IIPI6H2jSJMFQIXEkmkIBBDpEUkdRCARqGEE4KkAStLzoTVyY7Dtyc++RrfOUtpIwGI6urTqfgdW9FYE/K85cJBC7Agyvc8dW6xi3OQaqJdQ5IUsM5G8JfW3ja8Y2Isd+m8QFXaaoc9RM4GuXW17ixYDUjwmXElapybktliCrV7KAEpKFUcBYXI97D0kbCZbkMdbzPJ0qoU0LVGtvzkta5Y7z6n1g6W2sPXUvQr5rbxyPjE6SSUmAAYQdlo8TgQ+o0I0BHKEw2ECAkkk79TzHygMBjroCY3FY/S19JyCugCVOTFBQQOMq8ZiTb3kFcQbwFeoTpecFBgLE9MqXWOLC51/4mqOy6Jw+GospJWmEcjQBlUAN4G7GAGBHWK7fCb28tf685Z4WqC93uoAJs3dBtvt8XrJnP8IAULGeIuO6zVK1CninOqJT9GYE2A8Tp7ieV1Kxdi7G7MSxPMk3M1fTnpCtQth6LFkuC76WYg3CqOCg6+JtymPWaFrTwtJO6o3tbGQ0aD7qVSMl05DpSVSlkqkpdOFSCpwqxJosU5OwQlFFFBC5GmPjTBCYYyEjYIUgGdBglaPmRovpjXZIt4xpy8cus50UkoVShfUbxCNTzrmU5b7/AAYQlKoAbHiJExNQ0KmndYX9ZNTlxga7LNu3UqQc9wluQdG3Ioy7azjqsXRSpl0BIsw8mGsFX2LhamiVmoudy1e1TPk41HreHxOCFVA696R8BVBBo1h5X4cZYa/LE36hY1a3AqClXgg/I/n0cRv157FVe09h18PY1EBU7nRg6H1G71tIiTRB3wzZHJNM7jv9ISsKKgs2GD5tbo5Vv8u4+0k+NzHaN/PRU3cNdmWnT5gdW9cplvUD6axQLCqZcYfB4aoC6nN+zc08g5bzc+Nx5Tn2GjfuOPzGcG4aDBlTM4LcPYKjS2DpmdPJVWaImFq4cgAnyIvrfw8JHJkwO6zSwglpEEajdetbMrdZhqL7yaa3PiBY/MGEWiXOUC5bQD635C2vpKfoDig2FZCdabEejdofrJO18eadNyDluuW45Ei/uNPWZzmw+OqvNMsCscNs6jmUvqQQNL2y8bjj6y8pdH8O9nVMoG8L2Vv4gTyfAbXqdsDPYaghSQfaajot0vZX6tySCLXysLeBzCN9J4Slp01W7rUQu7dIGIW+kk9fmFxuga0qbqYFQ2FtAIMaQ1TSRC+saEPFuw7gu36Tz3pd0jru9SiX+7QhTl0ztbtAn8I108Jv8TWyq7ncoJ9heeLY2rmYnmST4ljcn3l6zYHEkjRULqoWtAG6jsxJuY9I0LHiaSzij0pKpyJTkynEkpNOGWBpwqxIRI6MEdBNKdjY6CFycMdGmCE2cjpyJCYhhgZER5IRpmOC+hUqghGvOpB33CPQziFaDpKFtTRMw4H5SVUVaqKfGBq9pSsi7ExFr0zw3ekkbJZI1Cz6rmsusLxLagg9x+Qp2zGyMaTb96HnH7Zwl7VFGo3+UHtRSVDL3lOaTNl44VBr3viHOAcQfit+q5qUqbmmwqHIiWH3u37dlFwVZaq9TU9DAgNSPVtry/aH8Y/aWzjTOde79P5R6V0rALUNmHdaWHMaW4m/KfQrMo16tKoKNbw1W5B2zm8ifsT2O6D/AHcp7dN2Un8I7PqIDZ2Fqhi1R2AXQDNfP4/uwu2HCOVpX6w6sF7S25kc5Gw+KxSd6lm/e3yEB5ZqM+cT6q+51sy5EteC0knBiLJ6gb7kAdCrCsXF8jMpGlwSLjkbStbCljpbNxBIAPqdAZaUqlZt9FR51Rf6GRMRhq+uWkF/+wOPkJzScWmJHmPyp7uhTuG4wx+f/RwPqB66q36IVPs7NmqIRUAGVGzEWvqSNBv5zVolJr9YMyjUieY0KzowZlA17Vtx8fObzAYoOgYHhrCtIdiWIWNDRhBEazMz9eatMHXoooVGp5BeyuitbW/Ec48LRqHKtiToSqoot5AQOG2Nh6mrDX2lxhdm0qY+7AEjNXkuCegUqkAihRuA0gnxETLbfIGJxIEg1XAyT69aRusuco3n5SFXxlzpJOBS3mZ3GWaRMqH0yring3tvayD8xA+l55OyTf8A9omI/wAKkOJZz6AKL+7e0xDJNSzbFOeZWZdumpHJRcs6qwxScyy0qqcgkinAJJNOclNSKcKIKnCiJNPnRGCPEEJRRRRITo2OjY0Lk5OzkSFBVo9Kkj00zKGB1G8QlFWa9uAvKhbJhesZXwgOOhzCl4drkt6QzJcWvaAwost/xH6Q+bjK7tclrUTLBi3/AHXQZWY5Cjhh8UshI+0daZ0nVF0PCg4lSFW3cd2+IHqFaUmzKDzWQcZTNKorjQH6zuxq10A5GWWJpZ6ZHHevnEw/DqQdNFzcM/1lk2o35oDgeo/OYVnQIdRxBlTU2MM57dk4W1Plbh5xmw6lQKTbQ9z+PlC1dqUkJFyx45f90JfTcWU80yLW5t6dxeAN5SY/uQdY7KQuEVRZFC/r4s3GBq0biRG29c6Ivlck+8f9urN3MMPzafW05db1RmfUhT0uL2ThhpSQNmscfQBPpvl0YaQ5YrqDcRYehUYfeIoPDK1z+a07isNVw7ZailbgHKdDY7sw3r5GxkLm5rTZWGEEyJ0kQcuhVdisKpBZfUcr8oPZm0Gw7c0O8cobaNRUXODp+HjeUtXaefQIB4nX5SzSY540kLC4pUtqRh5h3IZ69luqG3FtoZPwvSJBvNvOeZ0apAtVHZ4MPhktcA72C1d+4sbD3jfQDcnLFHjaX0sxvzHccuunZb7GdKk3KbyqXaLVWsAT4DX3kDZOwCGHWjN5ns/zm1w2HNIZVCqOQsJCcDdM1GJco2B2e1gze0sqVO3pHJTY7zO4tgik8LbzIi6VIGwvOOl9YviX5KFUeVr/AFYykKzTbT2X1qmsh7RuWU6AhbjTxt9DM4RNm3c11MAbZLP4jaVLesQ8a5jshFYMrJJEGwkyooaiGSDj0nJQpNOFEDThhEmux0aJ0RoTrzonJwGJCJGmIRQQuTkUUSFn8NXKHSS6O0spzBdfl7StjoiwEyrNO6qU24AcuREhWf8AfNzqPaSXxikaSjM6tQiROoNOYWhQ4xVAwvOSsq2MyC6/ikyhXWounE92Z6rUzSz2fhiFvu+LXwnFSk0NndXLS+q1K5aBLY0RthvZiv8AWkt8VtFaQsdW/D/ulFWrimxK6ufZb/UxmAwr1TfhxY/1qYnUmvON2QSo3lW3pi1oDFUkxvAnyn0G6l9dVrtl1N/hGg/rzlxg9lpTIL2c/wDgvp8XrH4WktJbINPiPxN5yRiHAFywFxcZmlapcE+FggLZsuEtYfj3Zx1OubR2nI99OQ3UxNNwC+S2iZtbEymp7eS3ZUnxJywNXbFRtwUel/nOW2tU5x5qarx2xp5B8/8AkE/28l7J/ZVsqgwauwBqqwCg65BYHMBzvxmS6W9G8VSrVGqIXVmJFQBnU5mJuzDcdeMyOxulleg+ZDktvKkr9J6Hg/7RMYACeqqggHtJYkHxUyR7Q1gbUEciP36qhb16lW5qVrRweCBLXS0gbRlET/cLyTbeCZG60ajiOXgZV5FPbF/FR/Ge4YnpXgq+mK2eFb/uUSEYfx9bzN7U6M7Or3fDYoKd4WuppN5dYoKn1tJ6dw0NAmfQ+R/KpXfC3vqOqhpYTmQ4Ymz0cyf6gB1Xn9HaiKNKCH94lpO2fjy97Lcb7IuiDnlG4Q2N2AlI3yE8bZsynxDqbESRs+vkIyABeQvI6tSmWnCCe5/yrdha3bKrS+q0AbNAgj6BoVls/FiwUm3I8PXl5zR4Ko/Gx9ZmcRhB31Gh4cjOq9cCwqZbbrEiUjBV654TjOKnkdxt76LeLW03gTP9ItpBvu1a5O+3Acpmq9Wt8TsfzafWR1r8EOZjpcC+vK3xNOmUi7RVm2tK0cKlw7TQRmTsANSegRdtYg5RTU2tqxG8E62HKw/1CQcDnr/dkAsNFqGw/K7cfC+smLgCSes4juhrsSdSGI/QyRTKqAPhXcOEt/HbRbhZmeeyi/2qvxCubi58Ddm/qgaDPIc515RkVQVkKkqwIINiDoQRwIgGMucbVqVKuWpTzLuSotsyrwBf4gOTehEj4zYtVBmW1ROad4eD0z2h5i48ZcbWa6MxJ6rztfh1amXwxxa0xOEj2OqrIRIOdWSKhClKYZTIyGHUxLlPjhGgzsE0o6NnYIXQYpwGKCEo6MnYkLMxRsUa6hPnLxsUEoVhsjDrUqBWG8XA521tNL9jO8+3AeAmSwVfJUR+TA/Ob+pY6yhdkgheq4FhdScIzB9NvLNY9cDmruDuBu36CXtJQNALAcIq9MBj4yHj8YUsiaueWuX0/FIy51Yho99Vp0adDh9N9Z+5k8zJyaPwO6kYzaSqCqi78+C/7jM8Kha9zdr3h+ryHKTrx8PAnnJVLZRBFRhZfw8WH6CW2Np0WyPPmvN3D7ziVc03DT9Oze/Ubk57DkI2Aw7s1lGh4nQe8v6OwtO1U/yr+ptC1QBYqLLwtuHhJ+Hc24+0qVLx5+XIL0Vr/wDPWtMfxfGe5A8gR6yoa7FojXKSfFrf6ZYg6coCvjaab3H1PykDHbXAFqd7/iOgH7o4mRhtWqdz3Vx9fh9g10YG9BEn6DX3ojbQ2jTQ5Wux4gaW8zKurtYDVEPq/wD+Y7Z+zOsBdyQDu4luZueEs8NhKdMECmpB4t2j7mTEUaeRklZtOpxO7AqAtpsOmQJjbb8dBuqSrtYt3aa346lr/SUxqVWewJBJ3DQf8TR7S2J8dLTw4HyPwyDh6vV5i1LtEW7Wht4SzTNMtmmM+Syb1t6yqG3lQhk/MBl/SNdoPqmYDCOT2mA15ZiPSWe2aVVFD9axp7ictmU/tW4eMq6uNS9+0D5fwl3sraQcW0Ita2/zBkFV1QEOcMhtC0rK3s3sfSoPIc79QcdtJEjyhZ6kzObKc5J3X/mB7zTbMwjURcoWc6XutgOQAjKmyQp+7AAPw8R4c5CxLGlpmue6FU2fNz8JzUqmr4WKaz4ayxP+ouTiI3nIeeZP22AVq6uNeq+YkSntItcJh3qW3m9h75dZF6iu5++Nl/7anvfvtJ5p1WCoj9Wlu0y94fsIOH70gDWN1gnvl6a+81rPqXNWSwOY3s3GfoRDQObs+g3rcXi2Y5b9Ww3oOyT58TG06D1TuLkcSd3qd0tqWG6hG4oQc5OpK+PvFsiu4Rs+cU833YqHVVt8XIeEsi4a1pwt039/lYD+E16tZrbms44pJAMxExOjY6hoGLQRmgPsXMn3htV+E79LCwcjvefDxlFXoMjZXFiPn4g8RLzF7Xu2WiRbd3bkk8rW0/nJT7OD0yjPdiAQTZ8r3F8raELw4+U7bVfTg1CIO3JQ17G2uwWWbXFzBBdkWu5CZkk8wPoRCzKmGUwdakUYow1U2MSmXF5hzS0wRmpAM7eCBj7wXKdeOBgrzt4IRLxpaMzxpeCEYGdvABp28ELPzk5eK8a7SivFGwRCcZvuvso53+s8/myoPcp4onzUSneCQPqvRcAdBqDt+6JtqqaSK/xNoP4yCqfZkzHWq/P4bb/bjzMvtpYYHqmPwXt5m2szZH2ivb4QP/ED9T9ZDQILY21P7D91fvw9jw9ubzDKY5T8z++07J2zcEQRVqW33APxeJ8JocUuYel5Hrrp5x2Dq3W3FfpIKtQ1DiK2LCzp2jPhN31PM9feSrqjVX+5p6ZVzk/6VEDhtlVWAJddeZLSxrdlgw84V8SlM9psobUc/HSSNrPbkwDyzVS54fb1C59y8wOboaBtyHfnqhUthnjVHol/1k/DbMpJr3jzbh5Luj6bQ4MjfcVXZEqa24TZ0XB9OmJ2Jl33n89VxzB1El1sbo7icT/h0WK/jbsp/mO/5y8f+zjGcDSP5z/tiZRe4SApri+t6bsL6jQeU5rD0mtod0HiaNtQCQeG+aHa3Q/G0QS1Aso3lbMB5lbke0zhxGQHrOyvjG5jmmCCnSrU3tLg4FvMEEfjzUGts2hUHcyn9j+G6VNbYrUzmSof8tvezSxq44Ak0qdRl/ZG6/PlDU1rOLk06Y5ZQ7evCTh1VmRMDr+FmVaNhc+KmzEebBA/mlrfXsqjCZwcuVr67rn2Ik3D7KqA3q3y7xzY7/SPOHak1w7Hkez7WWXez8QKi2J1/WdVLl0eHzVe04HQbVmrORnCYiesa+5lBV3Y2FO5PAA3+UfUDICWpkAC54gAcTyHjJmyizOQELbwQN5Fje1vAE+k1X92KtNrsEath1RevQ0+VilZb5ez6gjlMupVbTjENe/12OgzWtf39a3eGsEyOp+2mXffksHQ6Q0NwYn9oA29jK/aO0mrnJTQlQeItc/iJ4DkJf8ASLo2Kjm7EdWVXQ/4wya1LX7P3inUbww4gylcNhhlBW3/AGxcs3jL1F9OA6mJd129/wCVlfFuL2iX13BlGcyBBPT5j4fU8tkXZ9OlTG4M/wAR/D4DwkTFbfpBstNCzfiGqj0+KdOJar2XpimnxafeP4W4CaHYezqbBhRVEAIBGtyWNhdtSYzGKX+I8tvNXZLaXw7cilTH6iPEZyyac9dXOzJ0EZrJYhCxqszXcFTutdDpf0unzkUGbPa2yXdkVcg72oVyALrTILKpA1a5HAC+6U3/AEzVJ7LU2Gt7N3QFVjmFtDZt3h4i+hRcXNkiF4/iVJlOuWsdi6858WfM5xO8TqVUAx15Z1OjtYfgIOWxzWBLlVUa8czgfytd9Po5XKluyLK5FzYtk3gX3Hz9ba2kWcqkmNLS3HRutrmKKAVW+a4LM4QDQaan0trHDoxW11Tc+XXvFASR4ai14JwqW8YTLpujOIsdFvcC19+ZSb7tNw0Oovc2GsFtDYNSkj1GKlVIFxfUlgLDl3gdYJwqsNO5oK87eCUKliiijXaUUUUELk1eENur8FT9IopVuvlC3OB/8j/p9yrrpNVyUEtva49xr8pW7GwuRMx7z2PkOA/WKKU5i3EblbtFoqcQc536GDD0xanvt2VlaQs2R7ncd/lFFIWZmFrV8m4hsoG09pXUrT4fH4eA4TvR7BEdt941UEa+Zvwiil+uBRpwzdeW4W93Ebs1bjPDmBsM+XvrOS0AaekdAehgZVxOJW6nWnTO5hwdxyPAcd5iile2Y1zjOwWjx27q0LcfDMYjBO8Rsdla9Nemf2U/Z8OFNUAZmtdKQtooXi1tbbhpv3TzSv0xrnMamNqFuKioxPkFUgL8hOxTo/xapa45SqeGnY2Ta1NgLiJJcJ/CZsj+0LaFOoOrL1EBGZGJqXHme6Z6F086GYbaGG+1rTyVhTFS66dYtsxV+BNtzb4opZacDixuQhZFVmKlTuXZlzoIgYcs9AAvK6TrSXISFQHju+cr22jSRjluynkLfWKKV6FFrwXOn36re4rxOraPbRpARntp2zj0Q8VtNbW6trHmwHrKvD7Zam+bLpyXfFFLbaFONFh1eK3ZqA49Og/C2vRTb/3yvT7LMri5a9iVtu4G2vp4zX0nF++Qc5FgD2sun3rk3bMWU6gjSKKY3E7djXNgbfv17+81ocMuKlz8R9Q5yBoNIA7e+pVN0h2E1U1KtOtltlz0wLLlAytVRVNvwEgadrNxsKGnhaVEg3UNwZ2AY84opDY3FSpT+GTkI8i1p+uu60LGlTYX1MIJGGJkxltJy+kH6QoG0sRSN8gzn2X0PGV1HGVSwVQFud/e8ePgDFFNs0GMpzEmN1j0+KXVxdhhdhBeGw2BliA1zO/NRtpVH6y3wpp6m2b56ekFWSy02/He35SP4zkUkZ4WtA95Khdfxq9d79Rp/O1v2MJoM7FFJlmLs4Z2KJSBNMGzRRRJrmadvORTpIr/2Q==">
												</div>
												<div class="txt-box">
													<strong class="name">[22/23 라리가 16R] 마요르카 vs 바야돌리드
														이강인 주요장면</strong>
													<div class="sort2">
														<span>2022.10.26 </span><span>조회수 161만회</span>
													</div>
												</div>
										</a></li>
										<li><a href="https://www.youtube.com/watch?v=eHLoGpklFtY">
												<div class="img-box">
													<img alt="역천괴가 프리미어리그를 찢는 법｜엘링 홀란드 22/23 시즌 활약상"
														src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQF05PHhCx7p33V9iuGHNWh6pR3IDINvn8Qkg&usqp=CAU">
												</div>
												<div class="txt-box">
													<strong class="name">엘링 홀란드 22/23 시즌 활약상</strong>
													<div class="sort2">
														<span>2022.10.23 </span><span>조회수 215만회</span>
													</div>
												</div>
										</a></li>
									</ul>
									<a href="https://www.youtube.com/watch?v=popyj9Wg7bE"
										class="l-box left">
										<div class="img-box">
											<img
												alt="바르셀로나에 다시 월드클래스 공격수가 생겼습니다｜로베르트 레반도프스키 22-23 라리가 활약상"
												src="${pageContext.request.contextPath }/resources/img/thumbnail1.jpg"
												style="height: 250px; width: 500px;">
										</div> <br>
										<div class="txt-box">
											<strong class="name" style="font-size: x-large;">로베르트
												레반도프스키 22-23<br> 라리가 활약상
											</strong>
											<div class="sort2">
												<span>2022.11.02 </span><span>조회수 83만회</span>
											</div>
										</div>
									</a>
								</div>

							</div>
							<div class="box" id="box" style="margin-bottom: 4rem;">
								<div class="mb-4" style="padding-bottom: 10px;">
									<strong
										style="font-size: 1.2857142857rem; font-weight: 900; float: left;">골</strong>
									<a href="${pageContext.request.contextPath }/highlightForm"
										class="btn-more size2" style="float: right;">영상 더보기 <span
										class="icon"></span>
									</a>
								</div>
								<hr>
								<ul class="gall style2 ea3 f-wrap" id="goalK1"
									style="height: 470px;">
									<li style="padding-left: 2.2rem;"><a
										href="https://www.youtube.com/watch?v=qf97zip1T9U">
											<div class="img-box2">
												<img
													src="data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBxMSEhUTExMWFRUWFxgYFxgXFx0YGBgYFxgXFxgYFxcYHyggGB0lHRgYIjEhJSorLi8uFx8zODMtNygtLisBCgoKDg0OGxAQGy0lICUtLS0tLS0tLS0tLS0vLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLf/AABEIAKgBLAMBIgACEQEDEQH/xAAcAAACAgMBAQAAAAAAAAAAAAAFBgAEAgMHAQj/xABMEAACAQIDBAUGCgcHAwQDAAABAgMAEQQSIQUGMUETIlFhcRVTgZGh0QcUIzJCUlSxwdIWcpKTo9PwJDNigqLh8UNVwiVjlLIXNET/xAAaAQACAwEBAAAAAAAAAAAAAAAAAgEDBAUG/8QAPxEAAQMCAwMGDAUFAAMBAAAAAQACEQMhBBIxQVFhBSJxgZGxExQWMlJykqHB0dLwBlNisvEjJDRC4TNDgxX/2gAMAwEAAhEDEQA/AFpASSASBespIwNf61rQH6x/rlVy+lM4WC9JhOVH4bHVPCuJYXOBkkxzjBE6RuGzZYLQFHZWTobaGowrJDfTny9PKoXpOV8JUxFDNQcQ4XGUkZhusb/p48CVSct9b2CsFzs1gx566aVvlavVYLp9Ln6OVBgLyXJNPE42vDqr8gu453dQ11PdO1bCgvpWrFSBFzW1+iO01mso8Ko4u7m54fR7vfUSF6rlnlJuEoxT891hw3u6tnGNkqrh8RIeLn1Cr8LseJ9lVoorVdhWmzBeCGKxP5r/AG3fNbwD2mtchYc625q1SPSyn8axH5r/AGnfND8TO44N91D5cdKP+ofUPdV/E0KmFOErsXifzX+275rP4/L5w+oe6p8fm84fUPdWoCvRUwl8cxP5r/bd81tXHS+cPqHuqzDjJObn1CqJq1hRepACXx3E/mv9t3zRfC4k6X1o5hnQ8V9lBMLHwq/KwRCxFwBwHH/aoICnxzEfmP8Aad81Y2rGAuZerl42HcTVZZLKGkIHDXLbiL/iKotte/VIIzC/G4tzHo7fGh+NxiMlhdgNASdBa+gFr6X7eYrO4yrxiq41qO9p3zVfaO03BbJJoOGlra1STas5F85HoFVXuCSpuDe9x21sgwea1rk9gF7/AO9OFUcZiSf/ACP9p3zVhNqTWuZDfXSw4j0VI9ryj5znXhoK3Lu1imN1if0j+rVZG6eLNvkTrzuPb2emlL2DaE4xOL2VH+075rWdpvYdex9HIXNavLT8C2vLSptrdrEYcZ2W6HmNQD2HsoOjdvEVLSHCQg4vFNMGo/2nfNMmy9osWAZs3Ea29FrcTwpkiIIBt7KR8JiddNNePC3b/wAUagxjArY/rd9zx463o2qfG6/5jvad80ee1CsbiCOBtUnx1xQnETE04al8cxH5jvad81kcZKTZWYnsAv8AcKkU+IJIu5txGTh46aUY3C2j8XnnciYIcLKkkkH95h0Z4r4gDmEYLe2tmvyroS4rERrK82NhiK4nAlpw0kazQCK+osxzunFTpe+tSlOMxJ/9r/ad81zjBvIwv1iBxOTQW462olFG1rlWt2ldO37qetm7VLNhhFIehnk2w9gSFkUSzMhI58bi/bQTY+KdkwSO7FX6aMgsSLSExDQnkHphG5R43iPzX+075oVHl5j2VonjF9FoptpcsuTzaRx+lEUN/qzUIl41DmiF2eQsRWfiiHPceadSTtbvKoBuu39cqtiShU01nbx/CvfjFQVy8W6MRU9d37iiuYHT1VhQ5paOY3BlMmZ1zsgcgEaBiRqOXA0pIBA2n4L1P4f5VBb4vVOnmk7t3Vs4W2XF7TcqOkHD6XdyvQv41TGuDLaWuD4mrOzPg/QosjYk6G7RGIq1geHSZrEHTUD1VXUcGiSrse6nhDnpRDiSQI847evv6VV2Ns0umdhx+aO7t9NWZ9md1OceBFrWtasZsCOymXjsRiX16hqPP/BuSE2BtWLREUzY3Cd1CZ4akKiUJkeq7yVjtB8pqoZ71ICmQsp3odJxq05rXanCrcZWgCsgK2lKwy0yRY2q9gVqpV3BNTIRvDR1dsLEHUWofC9X1bS9KUBK+07QuGVBlsQM2o148eGg4dtDtnQPNMkcds0jWA5C97k9wGvorft2fMx1JP8Aubd19KO/BZhgcRJIeKR2H+ZrE+oEemsz3ZWFyvazM8NXRNh/B7hWUZos2UC5b6Tdtr6Ci+E3fw8J+TiQd4A4ePOi+zQTH2A69n/NWIk0Oa/s/Cua4lwuVuADSbIZNhl41XAFbcdjoItZJFAOnWI49mviPXQt95cGGAEqHwP41QKbjoFfnbtK0bz4JThnuOI9ttL1wWZcrsLcCR4V9F7UhGIiIUixGjDXXXhblXCN6NnyQztnAudQV4Gt+DdEhYsUDYoXC+vaKMQ4lVOlrW19woMNVzDhp3d1bMJq3r4+GlbCsoKLym9zy5VVeiaxlgOwCqs0Fqu1Cgr3Y+2ZsJIZIGCsyNG11VwUYqSpVwQRdV9VGtn7Ymx8kkWJlzK69LkConSSQRkRoCALdW4AFtbE6A3WGjrLC4mWIkxuyEixZDla3GwYajgOB5VCVdZ2Pgp48+Fw2L+RW4ivDGwXpzIXCStq98rXta3Sxm51FaYNhKOjUYtQIyMhyj6Qzlwc2nXFspvbTXW1c92XjZVcuJHDFSpbMcxU2upN7kGw9VFoUA5VCYCUzbxYZVcOJM5kzFuF82mZzYm2Ykm1gBa1AJazSpQTZdrkC2LPqnvalfHP8q/j+ArBZK82gPln8fwFYCmC5eM/yavrv/cVvElPmwNrtMFEmBjxGUBc+WzAC9gXse06X9VZ7l7lRZExGNBbPZooLkXXlJMRrlPJefPjaukjF4eAIOjW2gsAAFXXVV4WFuHHWufisVTBygSRxIjsgqGUnROzqv2oFgtnwCMsYSrZgQgY3Aubi+ota1XZpEZcqwrH2m9yfE2Fbcdj0cMRF9Lqtl0ydp7/AH1o6Vo8r5AUOtj2ejhp2e2sTcRFqgkHi495IVopA3ZY9XwWcUVSeGr4VGUPH808QdSt+/mOOvdbiK04hdK6zHteJaVlIIMFLuOhoBjYrXppxwpb2i3GrAlSNtw60KR70U24eNCIKcKJVis0jNWsHhM1HMNgF7L0KNUuGM9lVpNKdTs5SOFDMdsm3CgFQlrNW+CS1WJsBaq3xcinlSieFn1FFgcwtS/hwQaMRSWFKUBL+2YQmlrXudO0/eKvbg7QaOd1Ckl47AX+kHQ6304Zj6KuY6JZRZhw4UK2JgmXGonAPnUEcesrWHrtWeq0ZCNiupuOYFNe1d89oRuBmVEUcFykc9Wtf+hTnurtl9oROQwDIAGN+Ba9j6bGkjZm6xw8wbESo5YEmEakXBC5m4qRe9xbUcaf9ytgrh4pmW5EjIbnsXOR42udTc61hqljhbXgt9Njm66TtXNt8cK8DFJ7uQSQRcZje1/ur3YbOcP0yYKFo8xQ5WzShhY6qy3Y2IOlzrXXcXsWLEr1wDa9swuRxqhs3dkxNZWdVvoFyWPpyZh66G1ObcT1qXUxmsY32BntQrdWJ1zEBlUi7Rutirdw5d4pW+FPDl5IrL8/QeI5V1+HC2GrXsPX6qT9sYdZsdg4yeEjG3PSNyDfxFJTcRUzHj3JagaWlq5/FuEUw3SueszAMbkCEMLq2X6Wti1+QNgDrQNNl3Z1bqsjlSAeBBsQe8EWPeDXaBhZv7RFMQ8TZzEQAABGLgXGt7rqD2m1cpxyX2hiWB0V8hHLMoCt46gn0mteFqOe4gpMTRYym0t/n+CCFvihAFq1YjD6Xtp299W1QnRRdjoo7SdAB6a6Nvy0eGwE8ESKoyNZVX6QW4c6ciAxY/VuTpWmtVFOJGqzUqRqEgbBK5XsTYZxc4hVlS4LFm4KBztzN7C3fyq1vduq2ClABLxMBkkIsCbdZTbgwtfwPcaMbkbPgkeRppWiIComUgXMgbVrjUDLwHOmlcG+LglwU5yyp8xj9ddUYHmp7uIJqiriPB1cp0+JV1PDZ6BqDX4cOux6lyvDQ2opFWDYZo2ZHXK6EqwPJgbEVkqkVcVS2wVlaxrDWsVoXb5BH90fVPe1AMcPlX8fwFF9y9j/ABrGRRFcwvmZfrBdbG/I6X7r0NxSXkfx/AU//A+iDESsSoZUGUsco1zBhftsR6jRUMMP3rZcjFD+6qeu/wDcU+NsqdiWaNszeGg5Lx5D23oc8GIZmjERLJY8syhuBvfS9vZTNIYjqTDcn7Qw4+FDYYUGJZkZiVRGEcMjPmsSCHYkcOroTbWuX4pTFwT2/wDAn8M7Qj77VhhNllcvStKkjGym2gaxIW/M2Bons7CsM0bHpVy81N1bha54g6+qvYp5WkVzDKhLAOGOdAo+koB0bQDQczx41jhZlaSVGkVlLk9Gbh1IIPAfR4aeNOKDRBBJ6Y3dCqLnFDIsHJGzoqk6FwOzhceB+9R31UGNDqGB0IppMwVyzkKoQjW6qACLAlrXJufVXPcfjlEjBQFBs2UCwXMLlQOwVdhqYpuyg6/CFFVxeJI+ys8fiaWNp4njVvFYq9A8fEzA6VsVKW9qS3NUcKNaJ4zZzdhqph8MQadIUz7Lg0FMGGw4oZsuPQUxYSCoUheLhhVfFYLQ0ajwZrDEQEDhUShJGKw3dQvEYemzGYfWhGJw9TKIQWOLWrVqsrBXjwUEqQqbvVzdyW2Lw54/Kr7dPxqrLAa0ROY3Vx9Fg37JB/CldcEJ26yu+dFHKAGVR6BdvE0r7b35iwuIbClSpBHzhYG4FivIggeiiGE21D0QcuMt7E9nE2NudIfwh72Q4pciquml7AuBa5F+QvbTxrm0ml1jZdAuDL68Ez4XebFPiAq4CRY+Lyk2Wx0GRVuCT2U0YjElAGOg5ns7zXFN394ZwxEYkkJKlsoLNYJltYXv3UXx+9e0IVDvDMqDRmZGW4OmoYDv1seNM6gZsVPhgRJH8LqE+LAS7EZTqCKQduY8JjYZw1lVksexXuhbXua/oNBJNrO8MVmYDpzk5AIyq7Aj5oytmty5VvOMXEYjDxBcw6RFbTkjlyO0i5I15ClZSLbnikc8EwOCfd4dpYfDYYzNKMqjRQReXmI1vwzHkLaE1xzAu2rORmcl272clmPrNUdrwgYvEXFyuInAvytK/DsqRSmt+Go5BM6rLXrF5A2BdD+D3ZpmxSuR1IbOxPDNe0a/ta/5avfCJjxFM9j8yKSwPBjJdEU9ty1G/g2wgTCoDxlPSv6QOjHqyH01Q2vJD5RljkAZJECtc36pAuAeRudOw8KxYmoH1L6A9y34FjmzGpaT7lz2CI5RY6gD+jXSt3cQ2LhUhgMTDopvo6j6LePsPpqvJurhXvBDI0c8QGbOb9KCLiQjS1/8OndcVVfDNhClgyOmgI+bIOLHh1tSbHs41OMqUqgDhroehV4KnVYSw2ESNt7doI14diFb5KTi+kK5TLGrMOYdCUe/oCUJK0y78RF/i2I4BjInpdVkX/6PS6wrVh+dTBKy1ubUIVdjWEXCvZRXkXCri2AuvyA6cWfVPe1CsSflG/rkKafg3xeTGKM2UyKVU/47XUHxsV8WFKOLb5R/H8BWeHmIIYEggggjQgg3BHeDrUvp52Zd65OKdGKqH9b/ANxXa5N4J0kZTKSFOmigleIvpxt7azj3g/tD4gRmxQJbNw4c7d1Atl7QTaKZlITFqLyR/XtxkjH0geajUHtv1vGLKuUqRr6PXzrgvdWpOyvPxWlradRstHSmCLeKJSGEElxwviHI9Ia4PprThd5Cskh6PqytewbKwv8A4gNaDwwM/AevT76u4TZb5vmkkcANbnt7h40HEO1lQKTQmcbR6qqqktL1QGkZ7C12YgjkO/sHOuYYqYNNKUN1zWU9oXqg+m1/TTBvBtEYdGhRg2IkGV2U3WGM8UU83PM8vVS5gcPawroYVlQ8+p1BZKpb5rVmkVWBgiaIYbC91FIsOK1qlKk+zdOFBMRs3K3CuhS4a9BdpYSmBUIfsheAptwcYApc2XFZqZ8OtQUAK6q1pmSrCcK1yihSl7aMNqCzx0x7TXSgU61KhDTFXpiq2I62CGlJTBDDh71ofB91Hlw9ethqSVYEhDFvH0sBa2oYd5RHUW7Lq979qimHZGHhw+FRkiilncXaSUB8p1JCK/V0XTv41W3o2IZB0ifPUWI+svZ4il+KWVQVLWMbWKH5wOt9DysCKVzZ0TtdGqdtl7cxQc3bIrKDYIFW+YkEEW1sDpzFWttbxI8ZikbNe972OhsNT3HW9tL0heXXICljYXBHMm3L7/X3VlhcUoS5IzEHU8rhhw58VpDTm5T+FtAXsomliAtdF9JBBtc29FMXwf4TPizINVjvY/42vw8BelnBTO4CJftJ14m/V01/5NdO3I2SIIgbAEjXtzXN/dSV3ZWkKaLczguabzR5cbih/wC/If2mzfjWjZWCeeVIU+fIwRewFtLnuHE9wNWd53zY3En/AN5x6rD8Kavgj2bnxEk54QpYfryXGnflDD/MK1h+SkHcB3BZy3NUy8Sur4PBdHlCWEaKB6ALC/8AlArlm0sbJJtPEWt89VjBFuEaH/UbkeI7a7JgFHR34lr6+Bt6uNcR3iJTaWKIzAiVChIserHHYi/GxHHurDRpB5IO0HtkLY7EOpEPbsI6xeR99OqeJNgjGGOcl4ZYVy9IhAJABORr6GxNxppcjnp5g94WLHB4tQWAvmt1XXtXmrd3/NN2ExKy4eIqAc6LbsAYA+uk3eLZg+MowJzAk3XitgoGtj2njpWd0jbw/wCf8WppDyYEXkfPrW7fqMLs0MgNlkhIuNdZFT12Y+i9IpNdI3uR3wMi2BzQsV5XZBnAPK/VrmKSXAPbXRwZGQgbD8AufiBzp+9VJBWqIaV7KaxiOlaHaLqfh/8Ayz6h72pfxrfKv4/gKwR6m0P71/H8BVerwLLkYz/Jq+u/9xRbDT2YFSVYG6spsVPaCNQafdlb4YkAdIEn0+cwyufFl0PpBrmMUtqYtlYq/CqqtFlQQ4Ss7XFui6LFvq3LCID+sP5dVsbvDipgVBESniIxYnxbj6rUvQytVs4mwrO3C0mXDe/4qw1HHavBAFrfgrZqFzYzWt2CxOtXFqr1TnhoqvRRUHwGLuBRaGalhSs5I6FY6IGi8jUMxIqEIZhYbNRqGKhKHWi+Fl0oQr0SV5Igr2OSvJWoQg20koHKtMWKXjQKYa+NSgCSANStCx1vjStd7ca2LMBz/A+oUhTMa4vyAHNugz2areFrEiqbbTQHUOR3WX7729Iq1DvJGoAWEqwcMWvdsoBGXXvI1FuFrVVnZvXSHJOOMEUj2tt0jNm9y2xbLLuQeqEsZNL5b8AeQY8lOvPhrQ7ffdRJ3MsbdFKQASODgfWUWvyF/vpg2HtVMmRbOlyXW1mDsbsfEnmeNbNtlWylLkE69q+IrI+s6QRb72rQ7BeBJaRbf0dkfeuq4NtDZEkTlWABH9aVrweAZ5FUn5xAFP8AvNhOl4KSeRAvbu8KAYTY86nPlKldR49otVwxBLVT4swmE97p7uiJcpUDmSfnEkWBvx5n104rhMkZoNutj2lQZ9CLX5a+FMmLb5OwrC55cbp8mWwXEN4NgzrPPIYmKNNI2ZRmADtmGa3zT1hxtx0vXWPg12F0WBQnQzDpDyPX+bf/ACZfbQ543lmjjjupMhDMpI+SBNgSOF+R79K6QYAqqt7ADhW51UvYGxpHdZUYjDNw7wQ6S68RdvSdvDbETqqyyKLIosFAA8BXGd9dsdJIIybuJ5ct+KxDMCP1S2Qj09prrMjdGGYnXWuM4pcNJjpmlzK8lrWIVVOUaC40F7+uq6DwH5nGI96sZhX1mup0wCYm53EacUzbo7eBjWBj1kJy3PFCb+wk+i1Fp5w7NYjqLfxzE39ij11zzG7HmRjlVnC63Vble+y3BHeNLdlb4d4SEBJs+XKx5G3zT3afjRiaBnwjLg+4pqTnU5oVRD2jtG8bDYjTUXXVdj4hZ8OEJuQf9reokemuNwgoAhOqXQ9t1OU39VdB+D6bM1y1yeQ4UF+ETYTYbEtKB8nMc47Ax1cevrek9lWYN1yCseI3oAgvWQS2lTAm5FWMWnW9FbiV0OQT/dn1T3tSftD+9fx/AV0b4P8A4NocXAMViJHCMWColl0U2uWN+NuVc52j/ev4/gKedzdg43aSxoXePCRaZvokA6iNOGY3N2q105QsjmMdiq2cxznXif8AYzrbtI2xJgJn3r+CnCph3lwzSI0alyrtnVlUZmGuoNgedUtzPgyMscc88xVGUMEQdax4XY6D1GmbfnbkeGw4wMJu7IIiL36OKwU5j9YroB2G/js+DaSeQSNLIzqiJGi8FW3Yo0vYLrx1qnMdJUGkG0fCOgO1EtiWyBMARcmxPHgUpb77MiwUyRRM5vHnbOQxF2IUDKBbgfZQuAZhTpMMHPtDFNjWjCx5Y4w7ldVFmIsRfUe2iK4XYw4SRDwnf89RJTV8MObzT5omG2kiToRe8G2oSbu9uoMZKys5RUUMxAuTc2AF9BwOvdTl/wDjrCZPk3lDcmzKwv3iw9lqUWglxE80ODLdEzkWVjlyLcKzsTcrqTrfjoKco2h2NgyGfO5JYC+ryEAaDkosuvId5qQdqKmGyQxl3mIbkBJ2kyZNtNIG+xQHdfYbyyTRs+XoGyMQL3a7Dq30Hzb69optO7S5bxzOTyzZCpPflUH1GuV7CTFY53SItkkkMkhBKpduJcjj3A37uddIxGLi2ThBEGzSm+VebO3FrckB+63GpPFTUoNzBtC5OgyzbacxvG4xERcwgoxoKknS1ww7CpIYeymPDbtxmJGkkkDFVLaoAGIFwLrprSNsQZzHGTdpHAb/ADnrey9dL29sZcVF0TMyDMrHLbXLwGvL3VBCzxTa8gEZS4iYzc0aQOIPWIQDbG7CxxvLG7HIpch7EFVFzlIAsbX43/GsfJirgTiC8gfoTIBdLAsLotiveoq1vFjI8Ph0wSENJIqQIt7sEe0ZZuzq3t2mst+36PCLGDbPJHGPAdb/AMBUK+jTBLJA5ztco80RJiIvJ42gmyE4KcsisRYkAkDvF6t4WHppFS5A6xYi18qjlcEfOK1QhYcqI7HkAkdjKEKqFF1zXzHM3/1WhYqTc7yQNhMRMbrX0JGxXcTsOBTYvPe19FzD1rGRVDEbq4KT5zYo27FkUf6YwKOfHh9pX93VXaW08kUjDEgkIxACAEkA2A7ybD00pAIut1EVGuGSztJAjX/5oFu7uzg50LLJJcO9grgFVzsI8wA0bKBW7au42FcFFdunKFkzSWYC4Ga6jNYE8tNbc6L9Fi0hjjw0cKZVQXkYnRQBbKq8e+9WXkxTdGejRSHu4WTMGXK3VBKAi7ZT6KgMbpCvrY3EGoajatpMAvBI2ieB3dvFZ3h3OgCRIhctJKsYLkNlBDEm9s1gAdL8bVcTcPCJlS+IJ7b3GnawWy1u204kxUMUqyLkRpFEJLNnzKqMSo0ACvx01o38cGXLln4WzdE2bx+ba/oqMjJNgmdisa2lTyudJkmOJIFxM6ab9bpZwm5EC4psryZRGjcRcMzMLE5bEWTgR+FBtuMsOJeBmIUBWVmsT1lF82Uada/Km3AYhMOJ3dMRYvnLvG7sVCKLk2uBo2nADurk+29qSTTSTmzBz823ADqi3YdBVdZrWsXR5OFfEVnOqEloaBPG2nGxnXdF5R6QMADo68mU/wBXrcohkWzXVu0j3Us4eX6UTEHsBIJ9XHw491ENkSYudsqIGF7FnWyjxcDXwFzWHICtuJwdFrc7yAN/m+64PCOpE9mAQMdeqeelMUUzYlQuHBC2sZH6qjvW2rnstpWWzd2owM07Z3GuUaKD+rxPp9lHJlGW18q20AGvcNeXGgU26rgVq9KYpA9J06h8+xaMKiQARxj5o1Pae1jz/wCKo7b2oI4Sc5Z+QGpHfb8O+vN4Nsx4eIueNrKO06j+vCuYvt2Ql5MwGhseQJH4DhyvTmToqaFKpWqBrBLjf5kn4q9JvhKQelXUXAUc/wDEb8B7daAbSxYliubW7ha/be3GpNhmZMxOYjXS549t9R4mgcUtukT62qeI4r/XZStaBovWYfC08K2JzF1p02aAbN2/RNmE2k+SFr9ZDluRrlJ01r2bDYZ4pGICSMMpRdFNmBztpYMNdVy8Tca0DwmIyvEpOjxgenU/7VZhOTOW7S3boOH3e2nDyJG9XVMJRrgB40Ou60++etFdxlETZSeuTxzX4HlbQU/47Zr4vDtDLZrHNE3MNYj8SPA1y7DI+FnyMLZlSRSNQUkAZSD7PEGurbExiSIFLdYj3Dhz1PtpXSHSvFvAu0xay5dhMK8UmSRSrKbEHt/Ed/Ot+0U6/oFPe+WwBIBNFdpFGva6rYEafSF7i3EC3ZSBi5MxB7hXRbUDxK1chsy4s+qe9qWY+j+ODpf7rpEz6X6gIzac9L13PD/CTs2NQil1VRYAR2AA5ACuB7Q/vX8fwFVwK1FkgdC5+IqsbXqte2ee86x/seB6t1967NvrvnhcVCI4M2YyKzEpl6oB589SPVVzdDe7CYWDJJnzlyxypccAo1v2Cue4bY0ESoZpZVkZFdlSNSFzjMqks4N8pUnTnWO18IkaRyRu7q5kFnUKQY8n1WN75x6qzOMGVqdSeKIc6kRTixnffWNLblMftHO7MeLsznnq3WP31WOJojidjYaNzG88wdNGyRoVzD5wBMl9DceirmL3fw8Ko7yTZZRmQCFc1gA12u9tbi1uw0hBTvw+KqPzZCM5txtNr6QnTdXfHAYbDIlnD2BkKx8XPHXn2eirO2vhCwTQyBQ5kMbqmaLTMVIFzyF655EmDX/qz/u0/mVsg2ZhJ5MizSgm+vRpYAXJJtJwABPoqxp3qypgqzf6rqDrXPO3dX2LJ33e362bhsPHEucZVXMRF85rDMxtxJPOs94N+8HNh5VizmR0KKTHa2bQnMeGhNc2TY+DYgCackkADoo+J0H/AFKGY7DmGWSMNmCOyhrWuFJF7a2varAAdCstdj8O8VK1Egkzd2pB6OhO26O1IocQskzEKgJuFLHNlyjhrzPqq9vtvMuJlj6CR+jSM3IzJd2bUWNr2GXXvNK4wcSZRLLKrlEZgsakAuivluXBJGax04g1Ojwnnp/3SfzKDllWUcJjAwPbRdJBhwIFnXmN99ZHQim7eMhixMcknzUbMSAWNwCRoP8AFauiSb67PfRiWtwzRE/eK5Wgwg/6s/7tP5lE9ixQSyCOOSTMQSC6KFFuF7OTqbD01BI+5Q/CYsNL69J5iTmzxbscezhayZdrbVhnlhGGXKqhy5CdHe+Ww4C40Psq9gttSYcMqwCQM2bN0gX6IW2o5ZfbSsm38MugaY9+RBfv+fW4b1YX6037KfnpfvanfgcaXD+gYiIJnbMyC06/ZTrhd48RJquDuAbE9KNNAeFuwn1UO23vZhsQscKM7F5I2YBGv0SuGY2tcjQevspaO9mH4B5cjCzqY0OcASgKTn4Xk1HMC1F/g/xGHCyGMuZHe808oAZ7hmtmVjkACk3uAL9pAqDuCPFalBpr1aBGWCMpIvOpkv06tduoY8VvPhWHWMwHHqh0OnelifCqn6W4CFrmWYEj6ZlYWvyDkjiKHbS3kEqu0DMkMa3fEWOZwAFywK3MswGduBY2uaVZtq4CQ3m+MSN2yFXPr6SqzVP+onir8Jyc2o05mvDdoBk9fNAHRrvATNhN/wDBjFzO7nKUjWN7fRUFmHG46xJ7/RRGTffAk3+NSi/IDT0XWud41dlSKQqTIeTKE9oLWNU8Ph8CoCmSZlHLo0FjyIIk0P4UuepHmrof/k0HOzFlQWA2bAB6JvAvs4BdF2xv7hugeOBnmkZWQXUjUgi5JAva/ACkDZWyZsQeotwNCfojhxb8Bc91Ou7e7uEZFkVc9xdhKBbj1equhuNdSeIoptracGBWMuH6xYKsdgAFtfQkAAXHDtqio5z3ZYus2HxIwznUMHTOZxvmgmROwQBAk9qDbJ3DRTnlPScyouFB7xxb2Dupvw0UcagIAoFgFAt4ADkPdSwPhFwo4JKP2T/5VXk39wpW2WUa3JAS5/1VHgX7Qs9XB4+s7NUa49P8ptM2ZgOHG/bbTh6aE7d2wsY4+FuPDXTlx40GO/WGsABKCBbNlQ/+dBt44kznp5Sq5mCqFDOcpZWNiwCrcEcdcpsLalTTqblUOT6+drCwidJG7XSTboQTbGNOKcsSSo0Ucrd3Ye+vcBsd8QejTKLKWZnOVVUWvdjw/wBjViNsGNQ8/wC6T8Hq7snaWEhk6S87gXumVAG5gNZ9QDY252p/BPkWsvS0aAwlBzaDXFxGpabnujcNBqZMkkNl7oFTJ0/VKEqMrXveJrsPAlG9YPOkHG4NZFzqcri9zwB7w3Aa9tvGurw7zxYpZEhWQzFJSoYC7X1yixOo1NtL61zWGD56Ec7WI1vwN+zwqKrQyIVGAOJrOq+M2PNhu6x0F7Hf77IDtpsojJIvlBFiGF79ouKJSYgHMTp832AH2HX0Ghe1CpMSnRVBN7a3JdRfu0qNKBI5eQZVbQA6G1h94pctgrfCuZVdpBjukko/jGaWJPrRg5b8chN7ehiSP1mozuttFj846jT0/wBXFAtk4oOxIDHU8tBe9j2cbUUwChJLjQNqfHupCbQVyOWKLW1hUZo4T1zf4E8Suq4HGqNNfmg9wNu2ubb64VY8W4AtcBiOQLC5t2C+tu+mbZ2L6ti1hcEW5WN7eml7fiQnFEn6q/jT0DdLyUP65P6T3hc12g3yr+P4CmTYsKQ4aKXoleaQuys4z5FViikITlvmSQ3Knl2Up7Vk+Wk8fwFdS2JHMmFwmXBJP/Z0Odo5HHXLSAABwvBxy43rqvfDQseEp038p1PCNDgHVDBIAPOtM22z0hBvJ08qvOwZtSxJOra3ZgDq+p61uF9atbtPnkjgkVHizZyGFwoUBnZbEFeoDwNjYXvaiOKw08sqTNs9s6aIwbFqVGuihZbKLEiw5E1njcbNFeV9nRJ1WQtklQEOpVgflALkEi/HWqJXpH1nYhr6L2tII5sOYTMWtOw6ERtgaJVxDtNKxOrOxOnNi1/vNM+N2KvRwxyMyOkeoDQCxcu3WEmIRgchX6P0RWnYGOjknRVwkQYEsGBm0Mal9LykcV5ihO8E2fESZScuYhfAaL9wpjuWqoalSsKTOZlGbRp/SBqRGq3bV2TFFHmWUsxOXKehJy2JJvDK9tbDW3HurLd4hFxM1tUgZVPfIREf9LufRWg7Cm4Exg6aNNGpFxfUF7j01cxOH6DBkErmmmHzGVlAiQk3KkgX6VdD9UVB0hTna5gp+EDySB/rpMkQ39Mqtux/+3GdNGzLchQSLlUudNSAPTQ2PCGSVUPznkCHuLNlJ9Zonu4uR/jLlVSAgksbXfKWjAHMsU4dxqnunI0mJBGrKkr24m6o2W3acxU+igugri8v0/DPAzaD3mfgR1X3rPbM4kxEjDgztb9Ulio9VqKYfdcMqt8awwzKDZpgCLgGzC2hHA+FUm3dxVz8hLx+o3uoXc8LmmjcvQFoc0Mo1AItaHW0CJba2SMOVAmilzA/3bZrW7SNBf8ACie6N44sRN9WOwP+Jrsn+pE9dDf0fxfmJP2W91MuBwOJhweWOOQTNJdgqkkJlsLi1xdk51B0usmKqtNAU87XFxAmQLTN4mLCJ+KSQOt80nXhbj3aUW8qwfYIfXN/Ool/6r9Sb9hqmba31Zv2GoJlXOrZ7ks6qpHc0Ib5Vg+wQ+ub+dRxcWFwarHEImxL9HZC2XK5Bdmzsx4QSA8BZz21VDbV+rN+w1adqbXb4wsEhu0cUZfMOtmfVgT3LIV9JpH2aVzeUakU2xFnA2qOdYbw4Re38JynfCR4cDEsEWZciKQ5GVSjC/Ri/HKdSPvpP2vjcBGwWGCGYZbliZxrc6BTIDYC3tontN+mSAvhZZvkywZCQBd3GnUa5soPqod8QT/t2I/eH+TSU2hoGqjk4A0xVc58mSQHtDdwtmDtI1KsbHm2bIt50ihYMeqPjDXWy2PVcgG5bny4UHfZuHLXXF4fVjYZZzYchfoNauTwwoCz7PnVRxLSWA5akx1jspsJLKkfxZ1BYXPTA2Uak26LWwBPoqzolbmSzNUBqR6zHARe0k95XRNkziKIICNLC45hVVBx1+aq3B1Gt6SfhKx3SSRJcWSO+naxcj/SErTiN5bAlfnElu7MxJPtNat4dkYmXESMsUjKCFBCtYhAEBHcct/TVFJs1C77uuHyQWHFl7yLA62k6dxVDZGwhOhYzwR2NrSSBSdAbqDy19hrftHd1YYmf4zh34dVJQ7G5A0UDvv4A0IxeFkibLIHQ2BsRY2PDSt+E2TiJVzRxu63tdQzC44i9ar716R2ac/hQG9DYjdPHfqtm7kWfExgrmCsGYf4E6x/0g0X3h2NipZRIsMrKyRkEKxswjUMGAXQhgb9vHUG9b909lyQSNNMpjCRsVLqwGaw7r8Mx01sDQ5sDHc/+oQ/x/5NKTeVmNXNiS6mRDWgeaXAySTBbpoPfZW8Fh8XEgT4gGtfV8MWJub6ll1rzaGGxcqlfiAS9tUwxU6dhC1T+Ix/9wh/j/yanxGP/uEP8f8Ak0sfcFNkGbNadfMqfNXtk7Glw6vJMkkZZWROqc1n0ZypAtZc4AuCSVtoDYftqRlnkZypZyzGxUjNm61wt8pvxBrPaOKGDwpInExmkCgr0lska5nBLKh1LR8OyljGbdMguwW/G4UBieZ05nutxNUVhmKxnEubiC4kEaaEWtsNxBBBmZO65AzajBpw19Bp6r++tGzcIZG7rlnPZcn21W6W5BozsU/Jqo+c33k2F+4e+gyGwFgFSnUrF79JLj7kybLW5CpZVH9X7zW3FShGKjkdL9nI6d1DukEQCg+ntPM1WxuNvrz51R4OFjxvKBxTpiGjQfPiR2d7ZgtodUjncf7UP2vis8mbNyH40Ch2l32vV2DEZhfNT0qcOV/IrgcQR+k97Um7SiaTFNEmrO6Ivi1lHtNPe3XDYh8l8isVj/VQ5F9iiuf7UnaPFO6MVZXVlYGxVlsQQeRBFEBv5tD7Qf3cf5K6BWfC8oNwWMrvc0mXOAgxHOJPbbsTpDHhsozPNmtrZVIvztduFbDFg/rz/sJ+akcb+7Q+0fw4vyVl+nmP+0H93F+Slhbj+ImHY/2h9K6ju4kMYmmi6Rii6Z1AGYAzDW54iNl/zUmMDcmx40vvvztA2/tLDnoqKDoR1gqgNxPG9efp7tD7R/Dj/JQAlpfiBlN7nFjjMbRsHRxTm23MSdS7k9pFz66t7zyNkw6klmEQdv15GZxf/I0Y9FIQ392h9o/hxfkrI7+7Q+0k+KRnuHFKIUDlzDB7XsoxE6ZQdI1jiUwbyzdFgYUvYzTs7DtWFAFPhmkkHoqboTMmHnmUkM0kcSMvztFZ5LHlq0NJ219uT4plaeQyFBlW4UWBN7AKAOOtbNl7y4rDKUhmKKTmK2VhmIAJswNjZQNOwVEXlYn8pNfiRWc2WzMHbw26GNlwItKfvL2L89J+0aF2PYfVQH9PNofaP4cX5Kn6e7Q+0fw4vyUy6bPxFQp+bRjoIHcE5nb+LPGaT9pqKb3MwiwykszNGJGbmTJwv2kWI9Fq5x+nu0PtH8OL8lQb97Q1/tLG5J6yo3Ek6ZlNhcnQUQs7uXMP4Rj20oyk6ZbyCN2ySmjDYx0DLZWV7XEiLIDlNxo2mhrL483mcP8A/Gh/l0qfp7tD7R/Di/JU/T3aH2j+HF+ShO/l3CVHZn0ATvOUntIlO+yJjNNFGYoAHZQf7NDoGcKT/d9lJE2MAxEzILK0khRRyBbMqi3AWAFvCsjv7tDUfGTqCNEjB10OoS4pdimKkEEgg3FQRK5uNx9CuQaVMM13DuievSLaldY23NJHMYlZgIgIrAta8QEZ07ypPprLDTRlR0mJxCtzCRBgPAtMCfUKRv082h9pJ7ykZPpJS5r39Psf9oP7uL8lRC6FPl2iym2n4MiABbLsEbWlPkgwzCxxWKI7DApHq6evEEEEWInieVmjhcAPEsYvKUiJuJW1HSXtbl3UiDf3H/aD+7i/JWjaW92LnjMcs5ZCQSuVFBI1F8igm1RB393yRV5eY6mWNa4Txb8GjvCP7q4npMUl9QgeUjuiRpALd7BR6aMnb2JubSycfrGubbP2rNBJ0kMjI9iLjsPEEHQjuPZRkb+bQP8A/T/Di/JUtbCwcncoUcMHeEp5iYjS0TvBTHi55JGLyFmY2uWNzoLD2AVYw21sRGoRJHVRewDGwvx0pWffzHW0xJ/dxfkrV+nu0PtH8OL8lMuqfxFh3NymjbdIjsiF03CYyU4KeWVmdiwSO5uQStmt2XRvZSxhSoYGRGZfpKpsx8CQbeo0tHfzaF7/ABlvDKmXxy5bX77V5+nu0PtH8OL8lQq6PLtGmXxTPOM2IGwCLbo13kp5+N4L7LP/APIT+TQzE5WYmNGVeS3uw8Sqi/qFLP6e7Q+0fw4vyVP092h9o/hxfkoAhWt/EVJpkU3dbye+UZ35xHRnCwWvlgzsP8UrMw8DkyUrSS2HHiK1bT2pLiJDLK5d2tdjYXAFgLDQAAWqiZKXLK4lfHF9Rz95VoSVawG0CpHcT/X30Kz15epySszsQYgJrk2jmHGqUmM0oNHiCK9aa9LkVXhEUTF0xbDkvED3n76SOlpy3Wb+zj9Zvvpg2F2vw+ZxR9U97UD2vsuZ55GWNiC2h07B31S8iYjzTez31KlNK61XkDD1HueXOkknUbT6qnkTEeab2e+p5ExHmm9nvqVKJSeTmG9J3a36VPImI803s99TyJiPNN7PfUqUSjycw3pO7W/Sp5ExHmm9nvqeRMR5pvZ76lSiUeTmG9J3a36VPImI803s99TyJiPNN7PfUqUSjycw3pO7W/Sp5ExHmm9nvqeRMR5pvZ76lSiUeTmG9J3a36VPImI803s99TyJiPNN7PfUqUSjycw3pO7W/Sp5ExHmm9nvqeRMR5pvZ76lSiUeTmG9J3a36VPImI803s99TyJiPNN7PfUqUSjycw3pO7W/Sp5ExHmm9nvqeRMR5pvZ76lSiUeTmG9J3a36VPImI803s99TyJiPNN7PfUqUSjycw3pO7W/Sp5ExHmm9nvqeRMR5pvZ76lSiUeTmG9J3a36VPImI803s99TyJiPNN7PfUqUSjycw3pO7W/Sp5ExHmm9nvqeRMR5pvZ76lSiUeTmG9J3a36VPImI803s99TyJiPNN7PfUqUSjycw3pO7W/Sp5ExHmm9nvqeRMR5pvZ76lSiUeTmG9J3a36VPImI803s99TyJiPNN7PfUqUSjycw3pO7W/Sp5ExHmm9nvqeRMR5pvZ76lSiUeTmG9J3a36VPImI803s99Ne7cLJCFZbEM2h8alShbcByPRw1XOxziYIvG8cAv/2Q=="
													width="100%" alt="폼은 일시적이지만 살라는 영원하다｜21-22 PL 살라 모든 골 모음">
											</div>
											<div class="txt-box2">
												<strong class="name">21-22 PL 살라 모든 골 모음</strong>
												<div class="sort2">
													<span>2022.07.30 </span><span>조회수 11만회</span>
												</div>
											</div>
									</a></li>
									<li style="padding-left: 2.2rem;"><a
										href="https://www.youtube.com/watch?v=HXA7TkH1vEs">
											<div class="img-box2">
												<img
													src="data:image/jpeg;base64,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"
													width="100%" alt="몇 개고? 원더골 말이다｜⭐해외축구 재개 기념⭐ 주간모음집 특별편">
											</div>
											<div class="txt-box2">
												<strong class="name">22-23 PL 원더골 모음 특별편</strong>
												<div class="sort2">
													<span>2022.12.25 </span><span>조회수 55만회</span>
												</div>
											</div>
									</a></li>
									<li style="padding-left: 2.2rem;"><a
										href="https://www.youtube.com/watch?v=WOww2jMyUjU">
											<div class="img-box2">
												<img
													src="data:image/jpeg;base64,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"
													width="100%"
													alt="https://www.youtube.com/watch?v=WOww2jMyUjU">
											</div>
											<div class="txt-box2">
												<strong class="name">21-22 PL 손흥민 모든 골 모음</strong>
												<div class="sort2">
													<span>2022.07.31 </span><span>조회수 384만회</span>
												</div>
											</div>
									</a></li>
									<li style="padding-left: 2.2rem;"><a
										href="https://www.youtube.com/watch?v=bf3inlApvsY">
											<div class="img-box2">
												<img
													src="https://img.youtube.com/vi/bf3inlApvsY/mqdefault.jpg"
													width="100%"
													alt="우리를 짜릿하게 만든 프리미어리그의 극적인 결승골들!! 🏆프리미어리그 21-22시즌 스포일러 어워즈🏆">
											</div>
											<div class="txt-box2">
												<strong class="name">21-22 PL 극적인 결승골들 모음</strong>
												<div class="sort2">
													<span>2022.06.13 </span><span>조회수 24만회</span>
												</div>
											</div>
									</a></li>
								</ul>
							</div>
						</div>
						<div class="cont">
							<div class="box" id="box" style="margin-bottom: 4rem;">
								<div class="mb-4" style="padding-bottom: 10px;">
									<strong
										style="font-size: 1.2857142857rem; font-weight: 900; float: left;">골</strong>
									<a href="${pageContext.request.contextPath }/highlightForm"
										class="btn-more size2" style="float: right;">영상 더보기 <span
										class="icon"></span>
									</a>
								</div>
								<hr>
								<div class="f-wrap gall style2" id="highlightK2Main">
									<ul class="right f-wrap" id="highlightK2Sub">
										<li><a href="">
												<div class="img-box">
													<img src="" width="100%" alt="">
												</div>
												<div class="txt-box">
													<strong class="name">[하나원큐 K리그2] 준플레이오프 부천 vs 경남
														하이라이트 (2022-10-19)</strong>
													<div class="sort">
														<span>2022.10.19</span><span>조회수 4</span>
													</div>
												</div>
										</a></li>
										<li><a href="">
												<div class="img-box">
													<img src="" width="100%" alt="">
												</div>
												<div class="txt-box">
													<strong class="name">[하나원큐 K리그2] R44 부천 vs 전남
														하이라이트 (2022-10-15)</strong>
													<div class="sort">
														<span>2022.10.15</span><span>조회수 0</span>
													</div>
												</div>
										</a></li>
										<li><a href="">
												<div class="img-box">
													<img src="" width="100%" alt="">
												</div>
												<div class="txt-box">
													<strong class="name">[하나원큐 K리그2] R44 경남 vs 안양
														하이라이트 (2022-10-15)</strong>
													<div class="sort">
														<span>2022.10.15</span><span>조회수 0</span>
													</div>
												</div>
										</a></li>
										<li><a href="">
												<div class="img-box">
													<img src="" width="100%" alt="">
												</div>
												<div class="txt-box">
													<strong class="name">[하나원큐 K리그2] R44 서울E vs 부산
														하이라이트 (2022-10-15)</strong>
													<div class="sort">
														<span>2022.10.15</span><span>조회수 0</span>
													</div>
												</div>
										</a></li>
									</ul>
									<a href="" class="l-box left">
										<div class="img-box">
											<img src="" width="100%" alt="">
										</div>
										<div class="txt-box">
											<strong class="name">[하나원큐 K리그2] 플레이오프 안양 vs 경남
												하이라이트 (2022-10-23)</strong>
											<div class="sort">
												<span>2022.10.23</span><span>조회수 6</span>
											</div>
										</div>
									</a>
								</div>
							</div>
							<div class="box" id="box" style="margin-bottom: 4rem;">
								<div class="mb-4" style="padding-bottom: 10px;">
									<strong
										style="font-size: 1.2857142857rem; font-weight: 900; float: left;">골</strong>
									<a href="${pageContext.request.contextPath }/highlightForm"
										class="btn-more size2" style="float: right;">영상 더보기 <span
										class="icon"></span>
									</a>
								</div>
								<hr>
								<ul class="gall style2 ea3 f-wrap" id="goalK2">
									<li><a href="">
											<div class="img-box">
												<img src="" width="100%" alt="">
											</div>
											<div class="txt-box">
												<strong class="name">R44 부천 vs 전남 90+3분 윤지혁 골</strong>
												<div class="sort">
													<span>2022.10.15</span><span>조회수 0</span>
												</div>
											</div>
									</a></li>
									<li><a href="">
											<div class="img-box">
												<img src="" width="100%" alt="">
											</div>
											<div class="txt-box">
												<strong class="name">R44 부천 vs 전남 77분 고태원 골</strong>
												<div class="sort">
													<span>2022.10.15</span><span>조회수 1</span>
												</div>
											</div>
									</a></li>
									<li><a href="">
											<div class="img-box">
												<img src="" width="100%" alt="">
											</div>
											<div class="txt-box">
												<strong class="name">R44 부천 vs 전남 70분 플라나 골</strong>
												<div class="sort">
													<span>2022.10.15</span><span>조회수 1</span>
												</div>
											</div>
									</a></li>
									<li><a href="">
											<div class="img-box">
												<img src="" width="100%" alt="">
											</div>
											<div class="txt-box">
												<strong class="name">R44 부천 vs 전남 64분 이시헌 골</strong>
												<div class="sort">
													<span>2022.10.15</span><span>조회수 1</span>
												</div>
											</div>
									</a></li>
									<li><a href="">
											<div class="img-box">
												<img src="" width="100%" alt="">
											</div>
											<div class="txt-box">
												<strong class="name">R44 경남 vs 안양 75분 이광진 골</strong>
												<div class="sort">
													<span>2022.10.15</span><span>조회수 2</span>
												</div>
											</div>
									</a></li>
									<li><a href="">
											<div class="img-box">
												<img src="" width="100%" alt="">
											</div>
											<div class="txt-box">
												<strong class="name">R44 안산 vs 대전 59분 권영호 골</strong>
												<div class="sort">
													<span>2022.10.15</span><span>조회수 1</span>
												</div>
											</div>
									</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>
	<!-- Footer-->
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	<script type="text/javascript">
		//current position
		var pos = 0;
		//number of slides
		var totalSlides = $('#slider-wrap ul li').length;
		//get the slide width
		var sliderWidth = $('#slider-wrap').width();

		$(document).ready(function() {
			$('.cont1').show(); //페이지를 로드할 때 표시할 요소
			$('.cont2').hide(); //페이지를 로드할 때 숨길 요소
			$('.eplbtn').click(function() {
				$('.cont1').show(); //클릭 시 첫 번째 요소 숨김
				$('.cont2').hide(); //클릭 시 두 번째 요소 표시
				$('.laligabtn').click(function() {
					$('.cont1').hide(); //클릭 시 첫 번째 요소 숨김
					$('.cont2').show(); //클릭 시 두 번째 요소 표시
					return false;
				});
			});
		});

		$(document).ready(function() {

			/*****************
			 BUILD THE SLIDER
			 *****************/
			//set width to be 'x' times the number of slides
			$('#slider-wrap ul#slider').width(sliderWidth * totalSlides);

			//next slide  
			$('#next').click(function() {
				slideRight();
			});

			//previous slide
			$('#previous').click(function() {
				slideLeft();
			});

			/*************************
			 //*> OPTIONAL SETTINGS
			 ************************/
			//automatic slider
			var autoSlider = setInterval(slideRight, 4000);

			//for each slide 
			$.each($('#slider-wrap ul li'), function() {

				//create a pagination
				var li = document.createElement('li');
				$('#pagination-wrap ul').append(li);
			});

			//counter
			countSlides();

			//pagination
			pagination();

			//hide/show controls/btns when hover
			//pause automatic slide when hover
			$('#slider-wrap').hover(function() {
				$(this).addClass('active');
				clearInterval(autoSlider);
			}, function() {
				$(this).removeClass('active');
				autoSlider = setInterval(slideRight, 4000);
			});

		});//DOCUMENT READY

		/***********
		 SLIDE LEFT
		 ************/
		function slideLeft() {
			pos--;
			if (pos == -1) {
				pos = totalSlides - 1;
			}
			$('#slider-wrap ul#slider').css('left', -(sliderWidth * pos));

			//*> optional
			countSlides();
			pagination();
		}

		/************
		 SLIDE RIGHT
		 *************/
		function slideRight() {
			pos++;
			if (pos == totalSlides) {
				pos = 0;
			}
			$('#slider-wrap ul#slider').css('left', -(sliderWidth * pos));

			//*> optional 
			countSlides();
			pagination();
		}

		/************************
		 //*> OPTIONAL SETTINGS
		 ************************/
		function countSlides() {
			$('#counter').html(pos + 1 + ' / ' + totalSlides);
		}

		function pagination() {
			$('#pagination-wrap ul li').removeClass('active');
			$('#pagination-wrap ul li:eq(' + pos + ')').addClass('active');
		}

		function btnContainer() {
			$('.tab-btns > li').click(
					function() {
						$(this).addClass('active').siblings().removeClass(
								'active');
						var index = $(this).index();
						$('.con-wrap').eq(index).addClass('active').siblings()
								.removeClass('active');
					});
		}
		function openWindowPop() {
			var options = 'top=10, left=10, width=500, height=600, status=no, menubar=no, toolbar=no, resizable=no';
			window.open("${pageContext.request.contextPath }/opentalkForm",
					"오픈톡팝업", options);
		}
	</script>
</body>
</html>
