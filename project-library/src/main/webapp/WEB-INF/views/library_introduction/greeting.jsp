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
	<div  class="fix-layout">
		
	</div>
</div>

<!-- 사이드 메뉴바 -->
<section class="fix-layout">
	
	<div id="nav-left">

 <div id="side">
	<nav class="sub_menu">
		<h2 class="sub_title" style="height: 100px;">도서관 소개<span>LIBRARY INTRODUCTION</span></h2>


		<ul class="sm_2th">

		 <li  class="on" ><a href="<c:url value="/greeting"/>"><span>인사말</span> <span class="more"><span class="state">에 대한 2차메뉴 닫힘</span><em class="ver"></em><em class="hor"></em></span></a></li>
		 <li ><a href="<c:url value="/history"/>"><span>연혁</span> <span class="more"><span class="state">에 대한 2차메뉴 닫힘</span><em class="ver"></em><em class="hor"></em></span></a></li>
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
				<li>카페인 도서관소개</li>
				<li>인사말</li>
			</ul>

<h2>인사말</h2>
<div class="greeting">
	<p class="mg_b20">지혜와 문화의 길, 따스한 삶이 있는 카페인 도서관</p>
	
	<div>
		<span style="color:#000; font-size:20px;">카페인 도서관을 방문해 주셔서 감사합니다.</span><br />
		우리 카페인 도서관은 부산의 중심가에 위치하여 1963년 개관 이래 많은 부산 시민들이 이용하며, 부산 시민들과 오래도록 함께하고 있습니다.<br /><br /><br />

		사회의 발전과 변화에 맞춰 카페인 도서관도 책이라는 구심점 아래에서 항상 변화와 마주하고 있습니다. 우리 카페인 도서관도 다양한 독서문화행사와 평생학습강좌를 운영하여
		시민들이 지역에서 문화를 즐기고 직접 참여 할 수 있도록 하고 있으며 보다 나은 서비스를 제공하기 위해 노력하고 있습니다.<br /><br /><br />

		더불어 우리 카페인 도서관은 금융정보 특성화 카페인 도서관으로서 보다 특화되고 전문적인 서비스를 제공하는 등 평생학습공간으로서의 역할을 다하고자 합니다.<br /><br />

		일상에서 늘 맞이하는 책 속에는 지식과 지혜가 담겨 있으며, 또한 책은 우리의 과거와 현재, 미래를 비치고 있습니다. 우리 카페인 도서관을 찾는 모든 분들이 책 속에 담긴 지식과 지혜를 품고서 아름다운 삶의 길을 걸으시기 바랍니다.<br /><br />

		감사합니다.<br /><br />

		부산광역시립카페인 도서관장 책 갈 피
	</div>
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