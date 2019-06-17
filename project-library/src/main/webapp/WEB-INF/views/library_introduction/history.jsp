<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
  
<!DOCTYPE html>
<html lang="ko">
    <head>
	    <meta charset="euc-kr">
        <title>카페인 도서관</title>

	    <meta http-equiv="X-UA-Compatible" content="IE=edge" />   
		<meta name="viewport" content="width=device-width, initial-scale=1" />

		<link href="/book/resources/css/sub/base.css" rel="stylesheet" type="text/css" />
		<link href="/book/resources/css/sub/layout.css" rel="stylesheet" type="text/css" />
        <link href="/book/resources/css/sub/board.css" rel="stylesheet" type="text/css" />
		<link href="/book/resources/css/sub/btn.css" rel="stylesheet" type="text/css" /> 		
		<link href="/book/resources/css/sub/ui.css" rel="stylesheet" type="text/css" />
		
		<link href="/book/resources/css/sub/sub01.css" rel="stylesheet" type="text/css" /> 
		<link href="/book/resources/css/sub/sub.css" rel="stylesheet" type="text/css" /> 
		
		<script src="/book/resources/script/jquery-3.3.1.min.js"></script>
		

</head>
<body>

<div id="skipNavi">
	
	<a href="#detail_con">본문 바로가기</a>
	
</div>


<!-- 헤더들어가는 곳 -->
<jsp:include page="/WEB-INF/views/inc/top.jsp"/>
<!-- 헤더들어가는 곳 -->

<div id="sub_visual" class="sub_img01">
	<div class="fix-layout">
		
	</div>
</div>


<section class="fix-layout">
	
	<div id="nav-left">


 <div id="side">
	<nav class="sub_menu">
		<h2 class="sub_title" style="height: 100px;">도서관소개<span>LIBRARY INTRODUCTION</span></h2>

		<ul class="sm_2th">

		 <li><a href="<c:url value="/greeting"/>"><span>인사말</span> <span class="more"><span class="state">에 대한 2차메뉴 닫힘</span><em class="ver"></em><em class="hor"></em></span></a></li>
		 <li class="on"><a href="<c:url value="/history"/>"><span>연혁</span> <span class="more"><span class="state">에 대한 2차메뉴 닫힘</span><em class="ver"></em><em class="hor"></em></span></a></li>
		 <li><a href="<c:url value="/organizationalStatus"/>" ><span>조직현황</span> <span class="more"><span class="state">에 대한 2차메뉴 닫힘</span><em class="ver"></em><em class="hor"></em></span></a></li>
         <li ><a href="<c:url value="/assignedTask"/>"><span>담당업무안내</span> <span class="more"><span class="state">에 대한 2차메뉴 닫힘</span><em class="ver"></em><em class="hor"></em></span></a></li>
		 <li ><a href="<c:url value="/facilityStatus"/>"><span>시설현황</span> <span class="more"><span class="state">에 대한 2차메뉴 닫힘</span><em class="ver"></em><em class="hor"></em></span></a></li>
		 <li><a href="<c:url value="/collectiveData"/>" ><span>소장자료현황</span> <span class="more"><span class="state">에 대한 2차메뉴 닫힘</span><em class="ver"></em><em class="hor"></em></span></a></li>
		 <li ><a href="<c:url value="/directions"/>"><span>오시는길</span> <span class="more"><span class="state">에 대한 2차메뉴 닫힘</span><em class="ver"></em><em class="hor"></em></span></a></li>
		
		 </ul>
	</nav>
</div>


	</div>

	<div id="con">
		
		<div id="detail_con">	

			<ul id="location">
				<li>홈</li>
				<li>도서관소개</li>
				<li>연혁</li>
			</ul>

<h2>연혁</h2>

<div class="basic_box type1">
	<div class="inner">
		<span class="icon icon1"></span>
		<b>카페인 도서관 연혁 THE HISTROY</b>
		<p>부산광역시립 카페인 도서관에 오신것을 환영합니다.
부산광역시립 카페인 도서관의 역사를 소개합니다.</p>
	</div>
</div>
				
					
<div class="history_area">	

	<h4><span>HISTORY</span></h4>
	<ol>
		<li class="hist_l hist_point"  style="transform-origin: 50% 50% 0px; transition:; visibility: visible; opacity: 1; transform: translate3d(0px, 0px, 0px) rotateX(0deg) rotateY(0deg) rotateZ(0deg) scale3d(1, 1, 1);" data-animate-in="preset:slideInLeftShort;duration:1000ms;">
			<dl>
				<dt>2007~현재</dt>				
				<dd><span>2016.12.14</span> 청소년자원봉사 최우수터전 여성가족부 장관상 수상</dd>
				<dd><span>2014.02.27</span>제46회 한국도서관상(단체상) 수상 </dd>
				<dd><span>2012.11.30</span>도서관 개발사업 실시협약 체결(부산진구청 및 사업시행자간) </dd>
				<dd><span>2012.11.05</span>모바일 홈페이지 개통(http://www.bjl.go.kr/mobile) </dd>
				<dd><span>2011.04.15</span>공공도서관 표준자료관리시스템(KOLASⅢ)로 전환 </dd>
				<dd><span>2011.04.01</span>특성화 주제 변경(진학 ⇒ 금융) </dd>
				<dd><span>2010.07.20</span>어린이실 개관시간 연장 시행 </dd>
				<dd><span>2009.05.06</span>공공도서관 개관시간 연장 시행 </dd>
				<dd><span>2008.10.15</span>홈페이지 개편(http://www.bjl.go.kr) </dd>
				<dd><span>2007.09.12</span>무인도서대출반납시스템 설치</dd>
			</dl>
			<p class="bg_list"></p>
		</li>
		<li class="hist_r" style="transform-origin: 50% 50% 0px; transition:; visibility: visible; opacity: 1; transform: translate3d(0px, 0px, 0px) rotateX(0deg) rotateY(0deg) rotateZ(0deg) scale3d(1, 1, 1);" data-animate-in="preset:slideInRightShort;duration:1000ms;">
			<dl>
				<dt>2000~2006</dt>
				<dd><span>2006.10.27</span>디지털자료실 연속간행물실 통합 및 열람실 재배치 </dd>
				<dd><span>2006.05.04</span>전포역 지하철북카페 개설 </dd>
				<dd><span>2004.05.13</span>신개금LG아파트 평생학습마을 개관 </dd>
				<dd><span>2003.04.01</span>디지털자료실 설치 </dd>
				<dd><span>2003.02.18</span>종합자료실 설치 및 자료실 재배치 </dd>
				<dd><span>2001.10.30</span>공공도서관 표준자료관리시스템(KOLASⅡ)로 전환 </dd>
				<dd><span>2001.02.10</span>홈페이지 개설(http://www.bjl.go.kr) </dd>
				<dd><span>2000.11.25</span>평생학습관 지정 </dd>
			</dl>
			<p class="bg_list"></p>
		</li>
		<li class="hist_l" style="transform-origin: 50% 50% 0px; transition:; visibility: visible; opacity: 1; transform: translate3d(0px, 0px, 0px) rotateX(0deg) rotateY(0deg) rotateZ(0deg) scale3d(1, 1, 1);" data-animate-in="preset:slideInLeftShort;duration:1000ms;">
			<dl>
				<dt>1982 ~ 2000</dt>
				<dd><span>2000.11.25</span>평생학습관 지정 </dd>
				<dd><span>1999.12.30</span>도서관 전산업무 UNIX체제로 전환 </dd>
				<dd><span>1998.03.17</span>진학정보 특성화 도서관 지정 </dd>
				<dd><span>1995.01.01</span>부산광역시립도서관으로 명칭 변경(지방자치법 개정) </dd>
				<dd><span>1992.04.01</span>도서관업무 전산화 실시 </dd>
				<dd><span>1982.08.08</span>자료실 개가제 실시 </dd>
				<dd><span>1982.08.17</span>부산직할시립도서관 개관 </dd>
				<dd><span>1982.04.08</span>부산직할시립도서관 설치 조례 제정 (부산직할시 조례 제1716호) </dd>
			</dl>
			<p class="bg_list"></p>
		</li>                                    
		<li class="hist_r" style="transform-origin: 50% 50% 0px; transition:; visibility: visible; opacity: 1; transform: translate3d(0px, 0px, 0px) rotateX(0deg) rotateY(0deg) rotateZ(0deg) scale3d(1, 1, 1);" data-animate-in="preset:slideInRightShort;duration:1000ms;">
			<dl>
				<dt>1962 ~ 1981</dt>
				<dd><span>1981.04.04 </span>'부산시립카페인 도서관' 이 '부산직할시립카페인 도서관'으로 명칭 변경 </dd>
				<dd><span>1978.01.06 </span>'부산시립도서관'이 '부산시립카페인 도서관'으로 명칭 변경</dd>
				<dd><span>1965.05.05</span>‘시민백과의 집’ 시작 </dd>
				<dd><span>1965.05.10 </span>도서관리 규정 제정(부산시교육감 훈령 제3호) </dd>
				<dd><span>1964.01.01 </span>도서관 소속이 부산시에서 부산시교육청 소관으로 변경 </dd>
				<dd><span>1963.08.05 </span>"부산시립도서관"신축 개관 </dd>
				<dd><span>1963.07.22 </span>동광동 구 교육위원회 청사에서 부전동 신축도서관으로 이전 </dd>
				<dd><span>1963.07.20 </span>부산시립도서관열람규칙 제정 </dd>
				<dd><span>1963.06.30 </span>부산시립도서관 완공 </dd>
				<dd><span>1963.05.20 </span>부산시립도서관조례 제정(조례46호) </dd>
				<dd><span>1962.09.01 </span>부산시립도서관 착공 </dd>				
			</dl>
			<p class="bg_list"></p>
		</li>
		
	</ol>
</div>			<!-- content e -->
		</div>
	</div>
	<p class="clr"></p>
</section>

<!-- 푸터들어가는 곳 -->
<jsp:include page="/WEB-INF/views/inc/bottom.jsp"/>
<!-- 푸터들어가는 곳 -->


</body>
</html>