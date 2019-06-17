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

</div>

<section class="fix-layout">
	
	<div id="nav-left">


 <div id="side">
	<nav class="sub_menu">
		<h2 class="sub_title" style="height: 100px;">도서관소개<span>LIBRARY INTRODUCTION</span></h2>

		<ul class="sm_2th">

		 <li><a href="<c:url value="/greeting"/>"><span>인사말</span> <span class="more"><span class="state">에 대한 2차메뉴 닫힘</span><em class="ver"></em><em class="hor"></em></span></a></li>
		 <li ><a href="<c:url value="/history"/>"><span>연혁</span> <span class="more"><span class="state">에 대한 2차메뉴 닫힘</span><em class="ver"></em><em class="hor"></em></span></a></li>
		 <li class="on"><a href="<c:url value="/organizationalStatus"/>" ><span>조직현황</span> <span class="more"><span class="state">에 대한 2차메뉴 닫힘</span><em class="ver"></em><em class="hor"></em></span></a></li>
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
				<li>조직현황</li>
			</ul>
					
<h2>조직현황</h2>	

<div class="org_bg">
	<ul>
		<li><div class="n01"><span>관장</span></div>
			<ul>
				<li>
				<div class="n02"><span>도서관운영위원회</span></div>
				<div class="n04"><span>자료선정협의회</span></div>
					<ul class="f_l">
						
						
						<li class="org_left"><div class="n03">총무과
								<ul>
				<li>도서관 운영 계획 수립</li>
				<li>문서 및 보안관리</li>
				<li>자금의 운영&middot;회계 및 결산</li>
				<li>도서관운영위원회 운영</li>
				<li>청사 및 차량관리</li>
				<li>관리, 관수 및 제증명 발급</li>
				<li>기타 타과의 주관에 속하지 아니하는 업무</li>
								</ul>
							</div>
						</li>

						<li class="org_right"><div class="n03">자료봉사과
								<ul>
				<li>도서관 자료 수서, 정리, 보존</li>
				<li>장서점검 및 제적, 장서 통계</li>
				<li>자료선정협의회 운영</li>
				<li>자료의 열람, 대출 및 관리</li>
				<li>자료실 운영 및 도서관 전산화</li>
				<li>시민독서운동 및 문화행사</li>
				<li>독서회 및 독서교실 운영</li>
				<li>평생교육프로그램 개발&middot;운영</li>
								</ul>
							</div>
						</li>

					</ul>
				</li>
			</ul>
		</li>
	</ul>
<p class="clr"></p>
</div>

 <h3>직원현황</h3>
<div class="mb_scroll">
	<table class="tbl_basic">
	<caption>구분 4급 사서직 행정직 기술관리운영직군 합계로 구분하여 직원현황</caption>
	<thead>
	<tr>
		<th scope="col" width="15%">구분</th>
		<th scope="col" width="15%">4급</th>
		<th scope="col" width="15%">사서직</th>
		<th scope="col" width="15%">행정직</th>
		<th scope="col" width="15%">기술관리운영직군</th>
		<th scope="col" width="15%">합계</th>
	</tr>
	</thead>
	<tbody>
		<tr>
			<td>정원</td>
			<td>1</td>
			<td>13</td>
			<td>4</td>
			<td>4</td>
			<td>22</td>
		</tr>
		<tr>
			<td>현원</td>
			<td>1</td>
			<td>12</td>
			<td>4</td>
			<td>4</td>
			<td>21</td>
		</tr>

	</tbody>
	</table>
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