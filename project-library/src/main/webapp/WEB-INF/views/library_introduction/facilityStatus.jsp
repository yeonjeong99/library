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

		<!-- <link rel="stylesheet" type="text/css" href="//www.bjl.go.kr/script/themes/base/ui.all.css" title="style" />
		<link rel="stylesheet" type="text/css" href="//www.bjl.go.kr/script/ui/demos.css" title="style" />
    	<link rel="shortcut icon" href="http://www.bjl.go.kr/img/bjl.ico" type="image/x-icon" /> -->

</head>
<body>

<!-- 헤더들어가는 곳 -->
<jsp:include page="/WEB-INF/views/inc/top.jsp"/>
<!-- 헤더들어가는 곳 -->

<div id="skipNavi">
	
	<a href="#detail_con">본문 바로가기</a>
	
</div>

<div id="sub_visual" class="sub_img01">
	<div class="fix-layout">
		
	</div>
</div>


<section class="fix-layout">
	
	<div id="nav-left">


<!-- 사이드 메뉴바 -->
<div id="side">
	<nav class="sub_menu">
		<h2 class="sub_title" style="height: 100px;">도서관소개<span>LIBRARY INTRODUCTION</span></h2>

		<ul class="sm_2th">

		 <li><a href="<c:url value="/greeting"/>"><span>인사말</span> <span class="more"><span class="state">에 대한 2차메뉴 닫힘</span><em class="ver"></em><em class="hor"></em></span></a></li>
		 <li ><a href="<c:url value="/history"/>"><span>연혁</span> <span class="more"><span class="state">에 대한 2차메뉴 닫힘</span><em class="ver"></em><em class="hor"></em></span></a></li>
		 <li><a href="<c:url value="/organizationalStatus"/>" ><span>조직현황</span> <span class="more"><span class="state">에 대한 2차메뉴 닫힘</span><em class="ver"></em><em class="hor"></em></span></a></li>
         <li ><a href="<c:url value="/assignedTask"/>"><span>담당업무안내</span> <span class="more"><span class="state">에 대한 2차메뉴 닫힘</span><em class="ver"></em><em class="hor"></em></span></a></li>
		 <li class="on"><a href="<c:url value="/facilityStatus"/>"><span>시설현황</span> <span class="more"><span class="state">에 대한 2차메뉴 닫힘</span><em class="ver"></em><em class="hor"></em></span></a></li>
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
					<li>시설현황</li>
				</ul>
					
<h2>시설현황</h2>	
<div class="facilities_top bg_img1">
	<div>
		대지 및 건물
		<span>
			<ul>
				<li class="fs15 mg_b5">대지면적&nbsp;&nbsp;: 4,112.1 (1,243.9) ㎡(평)</li>
				<li class="fs15 mg_b5">건축연면적 : 2,704 (818) ㎡(평)</li>
				<li class="fs15 mg_b5">건물내역
				
					<ul>
						<li class="fs13">- 지하층 : 271.8 (82.2)</li>
						<li class="fs13">- 1층 : 1,216.1(367.9)</li>
						<li class="fs13">- 2층 : 1,216.1 (367.9)</li>
					</ul>
					
				</li>
			</ul>
		</span>
	</div>
	
</div>

 
<h3>층별배치도</h3>
<div class="box2 type2 margin_t_20">
  <div class="point_line"><div class="line"></div></div>
  <div class="inner_box c">	
	<div class="img_original">
	  <img src="/book/resources/images/map_01.jpg" alt="1층 평면도" />
	  <a href="/book/resources/images/map_01.jpg"><i></i>원본 이미지 보기</a>
	</div>
  </div>
</div>

<div class="box2 type2 margin_t_20">
  <div class="point_line"><div class="line"></div></div>
  <div class="inner_box c">	
	<div class="img_original">
	  <img src="/book/resources/images/map_02.jpg"  alt="2층 평면도" />
	  <a href="/book/resources/images/map_02.jpg"><i></i>원본 이미지 보기</a>
	</div>
  </div>
</div>


<div class="mb_scroll">
	<table class="tbl_basic">

  <caption>실별현황</caption>
  <thead>
  <tr>
    <th colspan="2">구분</th>
    <th>실별</th>
    <th>면적(㎡)</th>
    <th>좌석수</th>
    <th>용도</th>
  </tr>
  </thead>
  <tbody>
  <tr>
    <td rowspan="8">자료실<br />및<br />기타</td>
    <td rowspan="3">1층</td>
    <td>종합자료실</td>
    <td>463.8</td>
    <td>45</td>
    <td align="left">전주제의 일반도서 및 참고자료 </td>
  </tr>
  <tr>
    <td>어린이실</td>
    <td>151.2</td>
    <td>32</td>
    <td align="left">아동도서, 백과사전, 아동잡지, 신문 등 </td>
  </tr>
  <tr>
    <td>보존서고(1)(2)</td>
    <td>243</td>
    <td>&nbsp;</td>
    <td align="left">보존문서 및 자료 </td>
  </tr>
  <tr>
    <td rowspan="5">2층</td>
    <td>연속간행물실/<br />
금융정보자료실</td>
    <td>194.4</td>
    <td>72</td>
    <td align="left">신문, 잡지, 법령집, 금융정보자료 </td>
  </tr>
  <tr>
    <td>디지털자료실</td>
    <td>229.2</td>
    <td>35</td>
    <td align="left">인터넷, 국회원문, cd-rom, dvd 등 각종<br>
      전자자료</td>
  </tr>
  <tr>
    <td>문화교실</td>
    <td>49.7</td>
    <td>42</td>
    <td align="left">교양강좌, 평생교육 </td>
  </tr>
  <tr>
    <td>회의실</td>
    <td>30.8</td>
    <td>25</td>
    <td align="left">독서회, 간담회 등 회의공간 </td>
  </tr>
  <tr>
    <td>보존서고(3)</td>
    <td>24.7</td>
    <td>&nbsp;</td>
    <td align="left">논문자료 서고 </td>
  </tr>
  <tr>
    <td>열람실</td>
    <td>2층</td>
    <td>열람실</td>
    <td>218.7</td>
    <td>194</td>
    <td align="left">자율학습공간</td>
  </tr>
  <tr>
    <td colspan="3">합 계</td>
    <td>1605.5</td>
    <td>445</td>
    <td align="left">&nbsp;</td>
  </tr>
  </tbody>
</table>

		</div>
	</div>
	<p class="clr"></p>
</section>

<!-- 푸터들어가는 곳 -->
<jsp:include page="/WEB-INF/views/inc/bottom.jsp"/>
<!-- 푸터들어가는 곳 -->

</body>
</html>