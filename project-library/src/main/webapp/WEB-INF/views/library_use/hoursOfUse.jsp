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

		<link rel="stylesheet" type="text/css" href="/book/resources/css/sub/demos.css" title="style" />

<!-- 자료이용안내 펼치기 -->
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

	<script type="text/JavaScript">

</script>


<div id="sub_visual" class="sub_img02">
	<div class="fix-layout">
		<h2><img src="" alt="" /></h2>
		
	</div>
</div>


<section class="fix-layout">
	
	<div id="nav-left">
		<!-- left menu s -->
		
 <div id="side">
	<nav class="sub_menu">
		<h2 class="sub_title" style="height: 100px;">도서관이용<span>LIBRARY USE GUIDE</span></h2>

		<ul class="sm_2th">
		 <li class="on"><a href="<c:url value="/hoursOfUse"/>" ><span>이용시간</span><span class="more"><span class="state">에 대한 2차메뉴 닫힘</span><em class="ver"></em><em class="hor"></em></span></a></li>

		 <li ><a href="<c:url value="/referenceLibrary"/>"><span>자료실소개</span><span class="more"><span class="state">에 대한 2차메뉴 닫힘</span><em class="ver"></em><em class="hor"></em></span></a>
		 </li>
		 
		 <li><a href="<c:url value="/bookMembership"/>" ><span>도서회원가입</span><span class="more"><span class="state">에 대한 2차메뉴 닫힘</span><em class="ver"></em><em class="hor"></em></span></a></li>

		 <li><a href="<c:url value="/useOfData"/>" ><span>자료이용안내</span><span class="more"><span class="state">에 대한 2차메뉴 닫힘</span><em class="ver"></em><em class="hor"></em></span></a>
		   <ul  class="sm_3th ">
		   <li><a href="<c:url value="/outsideLoan"/>">관외대출</a></li>
		   <li><a href="<c:url value="/outsideReading"/>">관내열람</a></li>
		   </ul>

		 <li><a href="<c:url value="/amenities"/>"><span>편의시설</span><span class="more"><span class="state">에 대한 2차메뉴 닫힘</span><em class="ver"></em><em class="hor"></em></span></a></li>
		<!-- <li ><a href="/content/?m1=02&m2=10"><span>오시는길</span> <span class="more"><span class="state">에 대한 2차메뉴 닫힘</span><em class="ver"></em><em class="hor"></em></span></a></li>
 -->


 		 </ul>
	</nav>
</div>

	</div>

	<div id="con">
		
		<div id="detail_con">	

			<ul id="location">
				<li>홈</li>
				<li>도서관이용</li>
				<li>이용시간</li>
			</ul>

<h2>이용시간</h2>

<div class="basic_box type1">
	<div class="inner">
		<span class="icon icon1"></span>
		<b>카페인 도서관 이용시간</b>
		<p>카페인 도서관에 오신것을 환영합니다.
카페인 도서관의 이용시간을 소개합니다.</p>
	</div>
</div>

<h3>휴관일</h3>
		<div class="mb_scroll"> 
		<table class="tbl_basic">
		<caption>정기휴관일 임시휴관일로 구분하여 휴관일 안내 정보테이블입니다.</caption>
		<thead>
		<tr>
			
			<th scope="col">정기휴관일</th>
			<th scope="col">임시휴관일</th>
		</tr>
		</thead>
	   <tbody>
		<tr>
		  
		  <td>매월 3, 4째 월요일</td>
		  <td rowspan="2">기타 관장이 필요하다고 인정하는 날 </td>
		</tr>
		<tr>
		  <td>국경일, 정부지정공휴일</td>
		</tr>
		</tbody>
		</table>
		</div>

	<h3>이용시간</h3>
		<div class="mb_scroll">
		<table class="tbl_basic">
		<caption>구 분 	월· 토요일 	화~금요일 	일요일 로 구분하여 이용시간 안내정보입니다.</caption>
		<thead>
		<tr>
			
			<th scope="col">구 분</th>
			<th scope="col">월· 토요일 </th>
			<th scope="col">화~금요일 </th>
			<th scope="col">일요일 </th>
		</tr>
		</thead>
	   <tbody>
			<tr>
			  <td>종합자료실</td>
			  <td rowspan="4">09:00 ~ 18:00 </td>
			  <td>09:00 ~ 22:00 </td>
			  <td rowspan="4">09:00 ~ 17:00 </td>
			</tr>
			<tr>
			  <td>연속간행물실<br />금융정보자료실</td>
			  <td rowspan="2">09:00 ~ 18:00 </td>
			</tr>
			<tr>
			  <td>디지털자료실</td>
			</tr>
			<tr>
			  <td>어린이실</td>
			  <td>09:00 ~ 18:00</td>
			</tr>
			<tr>
			  <td>일반열람실</td>
			  <td colspan="3">07:00 ~ 23:00</td>
			</tr>
		</tbody>
		</table>
		</div>



<h3>무인반납기 이용시간</h3> 
		<div class="mb_scroll">
		<table class="tbl_basic">
                    <caption class="abt">요일 시간 장소로 구분하여 무인반납기 이용시간정보 입니다.</caption>
                    <thead>
                    <tr>
                    <th scope="col">요일</th>
                    <th scope="col">시간</th>
                    <th scope="col">장소</th>
                    </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td  >월, 토</td>
                        <td>18:00 ~ 23:00</td>
                        <td rowspan="4">어린이실 앞 복도</td>
                      </tr>
					  <tr>
                        <td >화~금</td>
                        <td>22:00 ~ 23:00</td>
                      </tr>
					   <tr>
                        <td >일</td>
                        <td>17:00 ~ 23:00</td>
                      </tr>
					  <tr>
                        <td >휴관일</td>
                        <td>07:00 ~ 19:00</td>
                      </tr>
                    </tbody>
      </table>
	  </div>
  <h3>도서관 정기 휴관일</h3>
		<div class="mb_scroll">
		<table class="tbl_basic">
     
                    <caption>정기 휴관일</caption>
                    <thead>
                    <tr>
                    <th scope="col">지역구분</th>
                    <th scope="col">매월 1, 2째 월요일 </th>
                    <th scope="col">매월 3, 4째 월요일 </th>
                    <th scope="col">매월 마지막 월요일</th>
                    </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td >중구, 서구</td>
                        <td>중앙, 사하도서관 </td>
                        <td>구덕도서관</td>
                        <td rowspan="3">시민도서관</td>
                      </tr>
                      <tr>
                        <td >금정구, 북구, 해운대구</td>
                        <td>반송, 구포도서관 </td>
                        <td>서동, 해운대도서관 </td>
                        
                      </tr>
                      <tr>
                       <td >동래구, 부산진구, 연제구</td>
                        <td>명장도서관</td>
                        <td>연산, 부전도서관</td>
                        
                      </tr>
                      <tr>
                        <td >공통</td>
                        <td colspan="3">국경일, 정부 지정 공휴일 </td>
                      </tr>
                    </tbody>
      </table>
			</div>
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