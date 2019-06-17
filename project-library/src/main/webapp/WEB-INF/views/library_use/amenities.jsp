<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!DOCTYPE html>
<html lang="ko">
    <head>
	    <meta charset="euc-kr">
        <title>희망과 꿈이 있는 부전도서관</title>

	    <meta http-equiv="X-UA-Compatible" content="IE=edge" />   
		<meta name="viewport" content="width=device-width, initial-scale=1" />

		<link href="/book/resources/css/sub/base.css" rel="stylesheet" type="text/css" />
		<link href="/book/resources/css/sub/layout.css" rel="stylesheet" type="text/css" />
        <link href="/book/resources/css/sub/board.css" rel="stylesheet" type="text/css" />
		<link href="/book/resources/css/sub/btn.css" rel="stylesheet" type="text/css" /> 		
		<link href="/book/resources/css/sub/ui.css" rel="stylesheet" type="text/css" />

		<link href="/book/resources/css/sub/sub.css" rel="stylesheet" type="text/css" /> 

		<script src="/book/resources/script/jquery-3.3.1.min.js"></script>

		<link rel="stylesheet" type="text/css" href="/book/resources/css/sub/demos.css" title="style" />

		
		<script type="text/javascript">
		<!--
		$(function() {
			$("#side .sm_2th > li > a").on("focusin mouseenter", function() {
				var $moreState = $(this).children(".more").children(".state");
				
				if(!$(this).parent("li").hasClass("on")) {
					$moreState.text($moreState.text().replace("닫힘", "열림"));
					$(this).next(".sm_3th").stop().slideDown(400);
				}
			})
				
			$("#side .sm_2th > li").on("mouseleave", function() {
				var $moreState = $(this).find("> a .more .state");
				
				if(!$(this).hasClass("on")) {
					$moreState.text($moreState.text().replace("열림", "닫힘"));
					$(this).children(".sm_3th").stop().slideUp(400);
				}
			});

			$("#side .sm_2th li .sm_3th li:last-child a").on("focusout", function() {
				var $moreState = $(this).parents("li").eq(1).find("> a .more .state");

				if(!$(this).parents("li").eq(1).hasClass("on")) {
					$moreState.text($moreState.text().replace("열림", "닫힘"));
					$(this).parents(".sm_3th").stop().slideUp(400);
				}
			});
		});
		$(function(){  
		  $(".sub_menu ul.sm_3th.on").parent("li").addClass("on");

		  var side2Depth = $(".sm_3th").siblings("a").removeClass("link"),//link  
			side3Depth = $(".sm_3th");
		    side2Depth.on("click",function(){
			var side2DepthLink = $(this).attr("href"),
			linkArr = side2DepthLink.split("="),
			moveLink = linkArr[1];
 		  
			  event.preventDefault();
			//  alert(moveLink);
			  if($(this).hasClass("on") === true){
			   
				return false;
			  }else{
				$(this).addClass("open").siblings(side3Depth).addClass("open").parent().addClass("open");
				$(this).next(side3Depth).slideDown(200);
				$(this).parent().siblings(".open").find(side3Depth).slideUp(200);
				$(this).parent().siblings().removeClass("open").children().removeClass("open");
			  }
 		  });
		});

		//-->
		</script>


<!-- 헤더들어가는 곳 -->
<jsp:include page="/WEB-INF/views/inc/top.jsp"/>
<!-- 헤더들어가는 곳 -->

</head>
<body>

<div id="skipNavi">
	
	<a href="#detail_con">본문 바로가기</a>
	
</div>

<div id="sub_visual" class="sub_img02">
	<div class="fix-layout">
		
	</div>
</div>


<section class="fix-layout">
	
	<div id="nav-left">
		
 <div id="side">
	<nav class="sub_menu">
		<h2 class="sub_title" style="height: 100px;">도서관이용<span>LIBRARY USE GUIDE</span></h2>

		<ul class="sm_2th">
		 <li ><a href="<c:url value="/hoursOfUse"/>" ><span>이용시간</span><span class="more"><span class="state">에 대한 2차메뉴 닫힘</span><em class="ver"></em><em class="hor"></em></span></a></li>

		 <li ><a href="<c:url value="/ referenceLibrary"/>"><span>자료실소개</span><span class="more"><span class="state">에 대한 2차메뉴 닫힘</span><em class="ver"></em><em class="hor"></em></span></a>

		 </li>
		 <li><a href="<c:url value="/bookMembership"/>" ><span>도서회원가입</span><span class="more"><span class="state">에 대한 2차메뉴 닫힘</span><em class="ver"></em><em class="hor"></em></span></a></li>

		 <li><a href="<c:url value="/useOfData"/>" ><span>자료이용안내</span><span class="more"><span class="state">에 대한 2차메뉴 닫힘</span><em class="ver"></em><em class="hor"></em></span></a>
		   <ul  class="sm_3th ">
		   <li><a href="<c:url value="/outsideLoan"/>">관외대출</a></li>
		   <li><a href="<c:url value="/outsideReading"/>">관내열람</a></li>
		   </ul>

		 <li class="on"><a href="<c:url value="/amenities"/>"><span>편의시설</span><span class="more"><span class="state">에 대한 2차메뉴 닫힘</span><em class="ver"></em><em class="hor"></em></span></a></li>
		<!-- <li ><a href="/content/?m1=02&m2=10"><span>오시는길</span> <span class="more"><span class="state">에 대한 2차메뉴 닫힘</span><em class="ver"></em><em class="hor"></em></span></a></li>
 -->


 		 </ul>
	</nav>
</div>

  		<!-- left menu e -->
	</div>

	<div id="con">
		
		<div id="detail_con">	
			<!-- content s -->
			<!-- location1 -->
<ul id="location">
	<li>홈</li>
	<li>도서관이용</li>
	<li>편의시설</li>
</ul>
<!-- /location1 -->

<h2>복사, 프린터</h2>

<div class="basic_box type1">
	<div class="inner">
		<span class="icon icon14"></span>
		<b>복사, 프린터</b>
		<p>복사를 원하시는 분은 종합자료실, 연속간행물실에서 이용하실 수 있으며 모든 좌석에서 프린터를 이용할 수 있습니다. 복사 및 프린터 이용시에는 안내실에서 판매하는 복사카드를 사용하시기 바랍니다.</p>
	</div>
</div>
			

<div id="tab_depth01" class="w25">
	<ul>
		<li class="active"><a href="/content/?m1=02&amp;m2=06&amp;m3=01" class="active">복사,프린터</a></li>
		<li class=""><a href="" class="">사물함</a></li>
		<li class=""><a href="" class="">무선인터넷이용</a></li>
		<li class=""><a href="" class="">주차, 옥외 휴게실</a></li>
	</ul>
</div>


<ul>
	<h3>복사</h3>
		<li class="sbul">이용장소 : 종합자료실 2대, 연속간행물실 1대 </li>
		<li class="sbul"> 이용방법 :  복사카드를 카드리더기에 넣어 이용합니다.</li>
		<li class="sbul"> 복사카드 구입처 :  안내실(1층), 3,000원/개 </li>
		<li class="sbul"> 복사요금 :  A4/장 30원, B4/장 40원</li>
		<span class="mg_l10"> * 저작권법에 따라 부분복사만 가능 합니다. </span>
		<ul>
			<li class="btn_set fl mg_l15">
				<a href="http://www.law.go.kr/lsSc.do?menuId=0&p1=&subMenu=1&nwYn=1&section=&tabNo=&query=%EC%A0%80%EC%9E%91%EA%B6%8C%EB%B2%95#undefined" class="blue"  target="_blank" style="color: white;">저작권법 보기</a>
			</li>
		</ul>
		
</ul>
<p class="clr"></p>

<ul>
<h3>프린터</h3>
<li class="sbul"> 대상 :  원문DB, 문서, WEB DB, 인터넷정보 등 PC출력 자료 </li>
<li class="sbul"> 출력 방법 :  복사카드 사용(카드구매 : 안내실, 1매당 3,000원)</li>
<li class="sbul"> 출력 요금  <br />
   - 원문DB :  1면당 50원＋저작권료 (판매용 1면당 5원, 전송 1파일당 20원/비매품 1면당 3원)<br />
   - 문서출력, 인터넷정보, WEB DB 등 :  1면당 50원 </li>
<li class="sbul">모든 좌석에서 프린터를 이용할 수 있습니다. </li>
</ul>



<!--<ul class="f_left p_b_20">
<h3>도서관 보상금제도 안내</h3>
<li class="sbul">2004년 7월 1일부터 도서관에서 원문DB를 이용하는 경우 복사 비용과 별도로 소정의 저작권 보상금을 부과하도록 하는 제도(저작권법 제31조 ) </li>
<li class="sbul">도서관 보상금이란 이용자가 지적재산권자의 허락없이 저작물을 이용하기위하여 문화관광부장관이 정한 저작재산권자단체(한국복사전송권관리센터 )에 공탁하는 보상금임.
</li>
<li class="sbul">보상금 부과 기준<br />
 - 판매용 단행본/연속간행물:출력(1면당 5원)/전송(1파일당 20원)<br />
 - 비매용 단행본/연속간행물 : 출력(1면당 3원) </li>
</ul>-->


</div>
					 
		</div>
	<p class="clr"></p>
</section>


<!-- 푸터들어가는 곳 -->
<jsp:include page="/WEB-INF/views/inc/bottom.jsp"/>
<!-- 푸터들어가는 곳 -->


</body>
</html>