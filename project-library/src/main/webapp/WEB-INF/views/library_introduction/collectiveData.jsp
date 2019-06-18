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

<!-- 사이드 메뉴바 -->
<section class="fix-layout">
	
	<div id="nav-left">

 <div id="side">
	<nav class="sub_menu">
		<h2 class="sub_title" style="height: 100px;">도서관소개<span>LIBRARY INTRODUCTION</span></h2>


		<ul class="sm_2th">

		 <li><a href="<c:url value="/greeting"/>"><span>인사말</span> <span class="more"><span class="state">에 대한 2차메뉴 닫힘</span><em class="ver"></em><em class="hor"></em></span></a></li>
		 <li ><a href="<c:url value="/history"/>"><span>연혁</span> <span class="more"><span class="state">에 대한 2차메뉴 닫힘</span><em class="ver"></em><em class="hor"></em></span></a></li>
		 <li><a href="<c:url value="/organizationalStatus"/>" ><span>조직현황</span> <span class="more"><span class="state">에 대한 2차메뉴 닫힘</span><em class="ver"></em><em class="hor"></em></span></a></li>
         <li ><a href="<c:url value="/assignedTask"/>"><span>담당업무안내</span> <span class="more"><span class="state">에 대한 2차메뉴 닫힘</span><em class="ver"></em><em class="hor"></em></span></a></li>
		 <li ><a href="<c:url value="/facilityStatus"/>"><span>시설현황</span> <span class="more"><span class="state">에 대한 2차메뉴 닫힘</span><em class="ver"></em><em class="hor"></em></span></a></li>
		 <li class="on"><a href="<c:url value="/collectiveData"/>" ><span>소장자료현황</span> <span class="more"><span class="state">에 대한 2차메뉴 닫힘</span><em class="ver"></em><em class="hor"></em></span></a></li>
		 <li ><a href="<c:url value="/directions"/>"><span>오시는길</span> <span class="more"><span class="state">에 대한 2차메뉴 닫힘</span><em class="ver"></em><em class="hor"></em></span></a></li>
		
		 </ul>
	</nav>
</div>


	</div>

	<div id="con">
		
		<div id="detail_con">	
			<ul id="location">
				<li>홈</li>
				<li>도서관이용</li>
				<li>소장자료현황</li>
			</ul>

<h2>소장자료현황</h2>
<h3>도서</h3>

<p>2019년 6월 18일 현재</p>

<div class="mb_scroll">
<table class="tbl_basic">
	<caption>도서 총장서수(2019년 6월 18일 현재)안내</caption>
	<thead>
		<tr>
			<th scope="col">구분</th>
			<th scope="col">계</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>자료수</td>
			<td>2,609</td>
		</tr>
	</tbody>
</table>
</div>

<div class="mb_scroll">

</div>
		</div>
	</div>
	<p class="clr"></p>
</section>

<!-- 푸터들어가는 곳 -->
<jsp:include page="/WEB-INF/views/inc/bottom.jsp"/>
<!-- 푸터들어가는 곳 -->

</body>
</html>