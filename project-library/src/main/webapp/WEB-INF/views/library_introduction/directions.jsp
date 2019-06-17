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

<div id="side">
	<nav class="sub_menu">
		<h2 class="sub_title" style="height: 100px;">도서관소개<span>LIBRARY INTRODUCTION</span></h2>

		<ul class="sm_2th">

		 <li><a href="<c:url value="/greeting"/>"><span>인사말</span> <span class="more"><span class="state">에 대한 2차메뉴 닫힘</span><em class="ver"></em><em class="hor"></em></span></a></li>
		 <li ><a href="<c:url value="/history"/>"><span>연혁</span> <span class="more"><span class="state">에 대한 2차메뉴 닫힘</span><em class="ver"></em><em class="hor"></em></span></a></li>
		 <li><a href="<c:url value="/organizationalStatus"/>" ><span>조직현황</span> <span class="more"><span class="state">에 대한 2차메뉴 닫힘</span><em class="ver"></em><em class="hor"></em></span></a></li>
         <li ><a href="<c:url value="/assignedTask"/>"><span>담당업무안내</span> <span class="more"><span class="state">에 대한 2차메뉴 닫힘</span><em class="ver"></em><em class="hor"></em></span></a></li>
		 <li ><a href="<c:url value="/facilityStatus"/>"><span>시설현황</span> <span class="more"><span class="state">에 대한 2차메뉴 닫힘</span><em class="ver"></em><em class="hor"></em></span></a></li>
		 <li><a href="<c:url value="/collectiveData"/>" ><span>소장자료현황</span> <span class="more"><span class="state">에 대한 2차메뉴 닫힘</span><em class="ver"></em><em class="hor"></em></span></a></li>
		 <li class="on"><a href="<c:url value="/directions"/>"><span>오시는길</span> <span class="more"><span class="state">에 대한 2차메뉴 닫힘</span><em class="ver"></em><em class="hor"></em></span></a></li>
		
		 </ul>
	</nav>
</div>

	</div>

	<div id="con">
		
		<div id="detail_con">	
			<!-- content s -->
			<!-- location1 -->
<ul id="location">
	<li>홈</li>
	<li>도서관소개</li>
	<li>오시는길</li>
</ul>
<!-- /location1 -->

<h2>오시는길</h2>
<!-- * 카카오맵 - 지도퍼가기 -->
<!-- 1. 지도 노드 -->
<div id="daumRoughmapContainer1560420309997" class="root_daum_roughmap root_daum_roughmap_landing"></div>

<!--
	2. 설치 스크립트
	* 지도 퍼가기 서비스를 2개 이상 넣을 경우, 설치 스크립트는 하나만 삽입합니다.
-->
<script charset="UTF-8" class="daum_roughmap_loader_script" src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>

<!-- 3. 실행 스크립트 -->
<script charset="UTF-8">
	new daum.roughmap.Lander({
		"timestamp" : "1560420309997",
		"key" : "tw3c",
		"mapWidth" : "640",
		"mapHeight" : "360"
	}).render();
</script>

<h3>교통편 안내</h3>
<ul class="lst_local">
	<li class="ic1"><span>버스</span>20, 169-1, 133, 138-1, 5-1, 10, 29, 43, 52, 57, 80, 111 </li>
	<li class="ic2"><span>도시철도</span>도시철도 1,2호선 서면역 하차, 2,4,6,8,10번 출구(도보 10분)</li>
</ul>

<h3>주소 및 연락처</h3>
<ul class="lst_local">
	<li class="ic1"><span>주소</span>부산 부산진구 중앙대로 708 부산파이낸스센터 4,5층 </li>
	<li class="ic2"><span>전화번호</span><a href="tle:051-802-5901">051.753.5600</a>(ARS로 각실에 연결) FAX : 051.753.9999</li>
</ul>
<table class="tbl_basic">
	<caption>실명 전화번호로 구분하여 도서관 연락처 정보입니다.</caption>
	<colgroup><col class="wps_25"/><col /><col /><col /></colgroup>
	<thead>
	<tr>
		<th scope="col">실명</th>
		<th scope="col">전화번호</th>
		<th scope="col">실명</th>
		<th scope="col">전화번호</th>
	</tr>
	</thead>
	<tbody>
	  <tr>
		<td>종합자료실</td>
		<td>1번</td>
		<td>자료봉사과</td>
		<td>4번</td>
	  </tr>
	  <tr>
		<td>어린이실</td>
		<td>2번</td>
		<td>사서계</td>
		<td>5번</td>
	  </tr>
	  <tr>
		<td>연속실/디지털실/금융정보실</td>
		<td>3번</td>
		<td>총무과</td>
		<td>6번</td>
	  </tr>
	  <tr>
		<td colspan="4">당직실 </span>(야간) <a href="tel:051-802-0502">802-0502</a></td>
	  </tr>
	</tbody>
</table>

<h3>주차장 이용안내</h3>

<ul>
  
  <li class="sbul">운영시간 : 07:00~23:00</li>
  <li class="sbul">주차면수 : 일반 6면, 장애우 1면</li>
  <li class="sbul">이용안내 : 5부제 참여차량만 주차<br /><span class="red fs13">* 주차면수 부족으로 가급적 대중교통 수단을 이용하시기를 권합니다.</span></li>

</ul>


			<!-- content e -->
		</div>
	</div>
	<p class="clr"></p>
</section>

<!-- 푸터들어가는 곳 -->
<jsp:include page="/WEB-INF/views/inc/bottom.jsp"/>
<!-- 푸터들어가는 곳 -->


</body>
</html>