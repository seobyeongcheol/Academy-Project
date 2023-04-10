<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>뉴스</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- CSS 스프링 안에서 연결  -->
<link
	href="${pageContext.request.contextPath }/resources/css/styles.css"
	rel="stylesheet">

<!-- 스프링 안에서 연결  -->
</head>
<body>
	<!-- Responsive navbar-->
	<%@ include file="/WEB-INF/views/include/topbar.jsp"%>
	<!-- Header-->
	<header class=""> </header>
	<!-- Page Content-->
	<section class="pt-4">
		<div id="container" role="main">
			<div id="spot">
				<div class="home_spot"></div>
			</div>
			<div id="content">
				<div class="main_wrap">
					<div class="today_section type_no_da">
						<h3 class="blind">오늘의 스포츠</h3>
						<ul class="today_list">

							<li class="today_item"><div class="box2">
									<a
										href="https://sports.news.naver.com/news?oid=311&aid=0001565802"
										class="link_today"
										title="김민재, 연봉 더 못 올려 '이적 불가피'…35억 이상은 줄 수 없다"
										onclick="clickcr(this, 'rnk*r.list', '076_0003978533', '1', event);"
										data-not-edited="Y">
										<div class="image_area">
											<img
												src="https://imgnews.pstatic.net/image/311/2023/03/08/0001565802_001_20230308065103494.jpg?type=w647"
												onerror="imageOnError(this);" width="160" height="95" alt="">
										</div>
										<div class="text_area">
											<strong class="title">김민재, 연봉 더 못 올려 '이적 불가피'…"35억 이상은 줄 수 없다"</strong>
											<p class="news">(엑스포츠뉴스 김현기 기자) 김민재의 소속팀인 이탈리아 나폴리가 간판 스트라이커 빅터 오시멘을 잡기 위해 연봉 상한선을 깨트리면서까지 그를 붙잡을 생각이다....</p>
											<div class="information">
												<span>엑스포츠뉴스</span>
											</div>
										</div>
									</a>
								</div></li>
							<li class="today_item"><div class="box2">
									<a
										href="https://sports.news.naver.com/news?oid=076&aid=0003978520"
										class="link_today"
										title="또 4개월 결장 '시한폭탄' 네이마르의 오른 발목, 보다못한 PSG 이번엔 수술 결정 내렸다"
										onclick="clickcr(this, 'rnk*r.list', '076_0003978520', '2', event);"
										data-not-edited="Y">
										<div class="image_area">
											<img
												src="https://imgnews.pstatic.net/image/076/2023/03/07/2023030801000470200047303_20230307081102041.jpg?type=w647"
												onerror="imageOnError(this);" width="160" height="95" alt="">
										</div>
										<div class="text_area">
											<strong class="title">또 4개월 결장 '시한폭탄' 네이마르의 오른 발목,
												보다못한 PSG 이번엔 수술 결정 내렸다</strong>
											<p class="news">로이터연합뉴스로이터연합뉴스[스포츠조선 노주환 기자]브라질 출신 축구 스타
												네이마르(31·파리생제르맹)가 오른 발목 수술을 받기로 했다. 따라서 최소 3개월,..."</p>
											<div class="information">
												<span>스포츠조선</span>
											</div>
										</div>
									</a>
								</div></li>
							<li class="today_item"><div class="box2">
									<a
										href="https://sports.news.naver.com/news?oid=477&aid=0000414692"
										class="link_today" title="토트넘 '짝사랑' 결실 맺나…바르셀로나 이적 허용"
										onclick="clickcr(this, 'rnk*r.list', '001_0013796254', '3', event);"
										data-not-edited="Y">
										<div class="image_area">
											<img
												src="https://imgnews.pstatic.net/image/477/2023/03/07/0000414692_001_20230307093003006.jpg?type=w647"
												onerror="imageOnError(this);" width="160" height="95" alt="">
										</div>
										<div class="text_area">
											<strong class="title"> 토트넘 '짝사랑' 결실 맺나…바르셀로나 이적 허용</strong>
											<p class="news">▲ FC바르셀로나 미드필더 프랑크 케시에(오른쪽)를 향한 토트넘 홋스퍼의
												관심이 뜨겁다. ⓒ연합뉴스/AP/EPA[스포티비뉴스=김건일 기자] 잉글랜드 프리미어...</p>
											<div class="information">
												<span>스포티비뉴스</span>
											</div>
										</div>
									</a>
								</div></li>
							<li class="today_item"><div class="box2">
									<a
										href="https://sports.news.naver.com/news?oid=088&aid=0000802040"
										class="link_today"
										title="'메날두 시대' 마침표 찍었던 모드리치, 크로아티아 우승 마침표 찍으러 간다"
										onclick="clickcr(this, 'rnk*r.list', '468_0000926181', '4', event);"
										data-not-edited="Y">
										<div class="image_area">
											<img
												src="https://imgnews.pstatic.net/image/088/2023/03/07/0000802040_001_20230307092901200.jpg?type=w647"
												onerror="imageOnError(this);" width="160" height="95" alt="">
										</div>
										<div class="text_area">
											<strong class="title">'메날두 시대' 마침표 찍었던 모드리치, 크로아티아
												우승 마침표 찍으러 간다 </strong>
											<p class="news">크로아티아 루카 모드리치. 연합뉴스지난해 11월 27일(현지시간) 카타르
												도하의 칼리파 인터내셔널 스타디움에서 열린 2022 카타르 월드컵 조별리그 F조 크...</p>
											<div class="information">
												<span>매일신문</span>
											</div>
										</div>
									</a>
								</div></li>
							<li class="today_item"><div class="box2">
									<a
										href="https://sports.news.naver.com/news?oid=477&aid=0000414672"
										class="link_today"
										title="'0골' 1,386억 공격수, 올여름 떠날 듯…미래에 대한 대화 나눌 예정"
										onclick="clickcr(this, 'rnk*r.list', '410_0000925522', '5', event);"
										data-not-edited="Y">
										<div class="image_area">
											<img
												src="https://imgnews.pstatic.net/image/477/2023/03/07/0000414672_001_20230307064101752.jpg?type=w647"
												onerror="imageOnError(this);" width="160" height="95" alt="">
										</div>
										<div class="text_area">
											<strong class="title">'0골' 1,386억 공격수, 올여름 떠날 듯…"미래에
												대한 대화 나눌 예정"</strong>
											<p class="news">▲ 에덴 아자르 ⓒ레알 마드리드[스포티비뉴스=이민재 기자] 레알 마드리드의
												에덴 아자르(32)가 팀을 떠나게 될까.이적 시장 전문가 파브리지오 로마노 기자는...</p>
											<div class="information">
												<span>스포티비뉴스</span>
											</div>
										</div>
									</a>
								</div></li>
							<li class="today_item"><div class="box2">
									<a
										href="https://sports.news.naver.com/news?oid=081&aid=0003344184"
										class="link_today" title="골·골·골·골·골·골·골… 128년 만의 대승 맛본 리버풀"
										onclick="clickcr(this, 'rnk*r.list', '018_0005437390', '6', event);"
										data-not-edited="Y">
										<div class="image_area">
											<img
												src="https://imgnews.pstatic.net/image/081/2023/03/07/0003344184_001_20230307050453139.jpg?type=w647"
												onerror="imageOnError(this);" width="160" height="95" alt="">
										</div>
										<div class="text_area">
											<strong class="title">골·골·골·골·골·골·골… 128년 만의 대승 맛본
												리버풀</strong>
											<p class="news">5일(현지시간) 영국 리버풀 안필드에서 열린 2022~23시즌 잉글랜드
												프로축구 프리미어리그(EPL) 26라운드 맨체스터 유나이티드와의 경기에서 무함마드 살...</p>
											<div class="information">
												<span>서울신문</span>
											</div>
										</div>
									</a>
								</div></li>
							<li class="today_item"><div class="box2">
									<a
										href="https://sports.news.naver.com/news?oid=117&aid=0003703919"
										class="link_today"
										title="'리버풀전 참패→심판에게 신경질' 브페, '5경기 출전 금지가 적절'"
										onclick="clickcr(this, 'rnk*r.list', '076_0003978520', '2', event);"
										data-not-edited="Y">
										<div class="image_area">
											<img
												src="https://imgnews.pstatic.net/image/117/2023/03/07/202303070733339513_1_20230307075501848.jpg?type=w647"
												onerror="imageOnError(this);" width="160" height="95" alt="">
										</div>
										<div class="text_area">
											<strong class="title">'리버풀전 참패→심판에게 신경질' 브페, '5경기 출전
												금지가 적절'</strong>
											<p class="news">[마이데일리 = 김종국 기자] 맨체스터 유나이티드(이하 맨유)가 리버풀에
												역사적인 참패를 당한 가운데 주장으로 출전했던 브루노 페르난데스에 대한 비난이 집중...</p>
											<div class="information">
												<span>마이데일리</span>
											</div>
										</div>
									</a>
								</div></li>
							<li class="today_item"><div class="box2">
									<a
										href="https://sports.news.naver.com/news?oid=139&aid=0002180590"
										class="link_today"
										title="‘재계약 난항’ 콘테 붙잡을 유일한 방법…“100% 지원해야 돼”"
										onclick="clickcr(this, 'rnk*r.list', '001_0013796254', '3', event);"
										data-not-edited="Y">
										<div class="image_area">
											<img
												src="https://imgnews.pstatic.net/image/139/2023/03/07/0002180590_001_20230307070002088.jpg?type=w647"
												onerror="imageOnError(this);" width="160" height="95" alt="">
										</div>
										<div class="text_area">
											<strong class="title"> ‘재계약 난항’ 콘테 붙잡을 유일한 방법…“100%
												지원해야 돼”</strong>
											<p class="news">[스포탈코리아] 김민철 기자= 토트넘 훗스퍼와 안토니오 콘테 감독이
												재계약에서 좀처럼 합의점을 찾지 못하고 있다.영국 ‘커트오프사이드’의 6일(한국시간) 보...</p>
											<div class="information">
												<span>스포탈코리아</span>
											</div>
										</div>
									</a>
								</div></li>
							<li class="today_item"><div class="box2">
									<a
										href="https://sports.news.naver.com/news?oid=109&aid=0004802019"
										class="link_today"
										title="토트넘, 계약 1년 남은 케인 가격표 책정...1526억 밑으론 안 팔아요"
										onclick="clickcr(this, 'rnk*r.list', '468_0000926181', '4', event);"
										data-not-edited="Y">
										<div class="image_area">
											<img
												src="https://imgnews.pstatic.net/image/109/2023/03/07/0004802019_001_20230307062302434.jpg?type=w647"
												onerror="imageOnError(this);" width="160" height="95" alt="">
										</div>
										<div class="text_area">
											<strong class="title">토트넘, 계약 1년 남은 케인 가격표
												책정..."1526억 밑으론 안 팔아요" </strong>
											<p class="news">[OSEN=이인환 기자] 1년 남은 선수치곤 비싼데 이름값 치곤 싼 것
												같다.영국 '토크 스포츠'는 7일(한국시간) "토트넘은 계약 기간이 1년 남은 해리 ...</p>
											<div class="information">
												<span>OSEN</span>
											</div>
										</div>
									</a>
								</div></li>
							<li class="today_item"><div class="box2">
									<a
										href="https://sports.news.naver.com/news?oid=413&aid=0000155805"
										class="link_today" title="'선발→팀 패배'...돌아온 콘테, 챔스에서 손흥민 교체로 뺄까"
										onclick="clickcr(this, 'rnk*r.list', '410_0000925522', '5', event);"
										data-not-edited="Y">
										<div class="image_area">
											<img
												src="https://imgnews.pstatic.net/image/413/2023/03/07/0000155805_001_20230307062101394.jpg?type=w647"
												onerror="imageOnError(this);" width="160" height="95" alt="">
										</div>
										<div class="text_area">
											<strong class="title">'선발→팀 패배'...돌아온 콘테, 챔스에서 손흥민
												교체로 뺄까</strong>
											<p class="news">돌아온 안토니오 콘테 감독은 손흥민을 선발로 쓸까.토트넘 훗스퍼는 9일
												오전 5시(한국시간) 영국 런던에 위치한 토트넘 훗스퍼 스타디움에서 AC밀란과 202...</p>
											<div class="information">
												<span>인터풋볼</span>
											</div>
										</div>
									</a>
								</div></li>
							<li class="today_item"><div class="box2">
									<a
										href="https://sports.news.naver.com/news?oid=117&aid=0003703879"
										class="link_today"
										title="‘경기장 난입’ 리버풀 10대 팬, 평생 직관 못 한다
								onclick="
										clickcr(this, 'rnk*r.list', '018_0005437390', '6', event);"
								data-not-edited="Y">
										<div class="image_area">
											<img
												src="https://imgnews.pstatic.net/image/117/2023/03/07/202303070054585270_1_20230307005604053.jpg?type=w647"
												onerror="imageOnError(this);" width="160" height="95" alt="">
										</div>
										<div class="text_area">
											<strong class="title">‘경기장 난입’ 리버풀 10대 팬, 평생 직관 못 한다</strong>
											<p class="news">[마이데일리 = 런던 유주 정 통신원] 영국 잉글랜드 프리미어리그 리버풀과
												맨체스터 유나이티드의 경기 당시 그라운드에 난입해 선수와 충돌한 10대 리버풀 팬...</p>
											<div class="information">
												<span>마이데일리</span>
											</div>
										</div>
									</a>
								</div></li>
							<li class="today_item"><div class="box2">
									<a
										href="https://sports.news.naver.com/news?oid=076&aid=0003978477"
										class="link_today"
										title="'0대7 굴욕' 자존심 구긴 텐 하흐, 선수단 오전
												9시 집합"
										onclick="clickcr(this, 'rnk*r.list', '076_0003978520', '2', event);"
										data-not-edited="Y">
										<div class="image_area">
											<img
												src="https://imgnews.pstatic.net/image/076/2023/03/07/2023030801000464300046121_20230307004702139.jpg?type=w647"
												onerror="imageOnError(this);" width="160" height="95" alt="">
										</div>
										<div class="text_area">
											<strong class="title">'0대7 굴욕' 자존심 구긴 텐 하흐, 선수단 오전
												9시 집합</strong>
											<p class="news">사진=영국 언론 더선 홈페이지 기사 캡처[스포츠조선 김가을 기자]에릭 텐 하흐 맨유 감독이 자존심을 단단히 구긴 모습이다. 충격적 완패 뒤 선수단을 오전 일...</p>
											<div class="information">
												<span>스포츠조선</span>
											</div>
										</div>
									</a>
								</div></li>
							<li class="today_item"><div class="box2">
									<a
										href="https://sports.news.naver.com/news?oid=139&aid=0002180598"
										class="link_today"
										title="리버풀의 맨유전 ‘5-0, 7-0 대승’, '이 수비수' 선발은 과학"
										onclick="clickcr(this, 'rnk*r.list', '001_0013796254', '3', event);"
										data-not-edited="Y">
										<div class="image_area">
											<img
												src="https://imgnews.pstatic.net/image/139/2023/03/07/0002180598_001_20230307105302414.jpg?type=w647"
												onerror="imageOnError(this);" width="160" height="95" alt="">
										</div>
										<div class="text_area">
											<strong class="title">리버풀의 맨유전 ‘5-0, 7-0 대승’, '이
												수비수' 선발은 과학</strong>
											<p class="news">[스포탈코리아] 한재현 기자= 리버풀이 노스웨스트 라이벌 맨체스터
												유나이티드(이하 맨유)에 융단폭격으로 대승을 거뒀다. 리버풀의 맨유전 대승에는 수비수 이브...</p>
											<div class="information">
												<span>스포탈코리아</span>
											</div>
										</div>
									</a>
								</div></li>
							<li class="today_item"><div class="box2">
									<a
										href="https://sports.news.naver.com/news?oid=117&aid=0003703996"
										class="link_today" title="10월부터 스카우트 파견...맨유는 김민재에 진심이다"
										onclick="clickcr(this, 'rnk*r.list', '468_0000926181', '4', event);"
										data-not-edited="Y">
										<div class="image_area">
											<img
												src="https://imgnews.pstatic.net/image/117/2023/03/07/202303071055869147_1_20230307105603784.jpg?type=w647"
												onerror="imageOnError(this);" width="160" height="95" alt="">
										</div>
										<div class="text_area">
											<strong class="title">10월부터 스카우트 파견...맨유는 김민재에 진심이다</strong>
											<p class="news">[마이데일리 = 최병진 기자] 맨유가 김민재(나폴리)를 관찰하기 위해
												스카우트를 파견했다.김민재는 다가오는 여름 이적시장에서 뜨거운 매물이 될 예정이다. 김...</p>
											<div class="information">
												<span>마이데일리</span>
											</div>
										</div>
									</a>
								</div></li>
							<li class="today_item"><div class="box2">
									<a
										href="https://sports.news.naver.com/news?oid=343&aid=0000120193"
										class="link_today"
										title="벤투 감독, 에콰도르 사령탑 물망...'대화의 문
											열려있다' 긍정 답변"
										onclick="clickcr(this, 'rnk*r.list', '410_0000925522', '5', event);"
										data-not-edited="Y">
										<div class="image_area">
											<img
												src="https://imgnews.pstatic.net/image/343/2023/03/07/0000120193_001_20230307111901348.jpg?type=w647"
												onerror="imageOnError(this);" width="160" height="95" alt="">
										</div>
										<div class="text_area">
											<strong class="title">벤투 감독, 에콰도르 사령탑 물망...'대화의 문
												열려있다' 긍정 답변</strong>
											<p class="news">(베스트 일레븐)한국 대표팀 지휘봉을 내려놓은 파울루 벤투 감독이 에콰도르
												대표팀의 새 사령탑 후보로 거론되고 있다. 포르투갈 '토르세도레스'는 6일(현지시...</p>
											<div class="information">
												<span>베스트일레븐 </span>
											</div>
										</div>
									</a>
								</div></li>
							<li class="today_item"><div class="box2">
									<a
										href="https://sports.news.naver.com/news?oid=436&aid=0000068823"
										class="link_today" title="토트넘, 지루 빠진 밀란 상대한다… 감기로 훈련 불참"
										onclick="clickcr(this, 'rnk*r.list', '018_0005437390', '6', event);"
										data-not-edited="Y">
										<div class="image_area">
											<img
												src="https://imgnews.pstatic.net/image/436/2023/03/07/0000068823_001_20230307111801578.jpg?type=w647"
												onerror="imageOnError(this);" width="160" height="95" alt="">
										</div>
										<div class="text_area">
											<strong class="title">토트넘, 지루 빠진 밀란 상대한다… 감기로 훈련 불참</strong>
											<p class="news">올리비에 지루(AC밀란). 게티이미지코리아토트넘홋스퍼의 유럽축구연맹
												챔피언스리그(UCL) 상대인 AC밀란이 주전 공격수 올리비에 지루의 감기 증세로 전력 손...</p>
											<div class="information">
												<span>서울신문</span>
											</div>
										</div>
									</a>
								</div></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Footer-->
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script
		src="${pageContext.request.contextPath }/resources/js/scripts.js"></script>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
</body>
</html>
