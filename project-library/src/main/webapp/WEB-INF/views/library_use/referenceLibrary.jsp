<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!DOCTYPE html>
<html lang="ko">
    <head>
	    <meta charset="euc-kr">
        <title>자료실 소개 페이지</title>

	    <meta http-equiv="X-UA-Compatible" content="IE=edge" />   
		<meta name="viewport" content="width=device-width, initial-scale=1" />

		<link href="/book/resources/css/sub/base.css" rel="stylesheet" type="text/css" />
		<link href="/book/resources/css/sub/layout.css" rel="stylesheet" type="text/css" />
        <link href="/book/resources/css/sub/board.css" rel="stylesheet" type="text/css" />
		<link href="/book/resources/css/sub/btn.css" rel="stylesheet" type="text/css" /> 		
		<link href="/book/resources/css/sub/ui.css" rel="stylesheet" type="text/css" />
		
		<link href="/book/resources/css/sub/sub.css" rel="stylesheet" type="text/css" /> 
		<link rel="stylesheet" type="text/css" href="/book/resources/css/sub/demos.css" title="style" />

		<script src="/book/resources/script/jquery-3.3.1.min.js"></script>

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


<!-- <script type="text/javascript" src="/voicemonds/voicemonDS.js"></script> -->


<!-- <META NAME="GOOGLEBOT" CONTENT="NOINDEX,NOFOLLOW">
 -->

</head>
<body>

<div id="skipNavi">
	
	<a href="#detail_con">본문 바로가기</a>
	
</div>

<script type="text/JavaScript">
<!--
function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}
//-->
</script>

<!-- 기본 레이아웃-->

<!-- Top S -->


<!-- 헤더들어가는 곳 -->
<jsp:include page="/WEB-INF/views/inc/top.jsp"/>
<!-- 헤더들어가는 곳 -->


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
		 <li ><a href="<c:url value="/hoursOfUse"/>" ><span>이용시간</span><span class="more"><span class="state">에 대한 2차메뉴 닫힘</span><em class="ver"></em><em class="hor"></em></span></a></li>

		 <li class="on"><a href="<c:url value="/referenceLibrary"/>"><span>자료실소개</span><span class="more"><span class="state">에 대한 2차메뉴 닫힘</span><em class="ver"></em><em class="hor"></em></span></a>

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

  		<!-- left menu e -->
	</div>

	<div id="con">
		
		<div id="detail_con">	
			<!-- content s -->
			
<!-- location1 -->
<ul id="location">
	<li>홈</li>
	<li>도서관이용</li>
	<li>자료실소개</li>
	<li>종합자료실</li>
</ul>
<!-- /location1 -->

<h2>종합자료실</h2>

<div class="basic_box type1">
	<div class="inner">
		<span class="icon icon4"></span>
		<b>종합자료실</b>
		<p>총류, 철학, 종교, 사회과학, 순수과학, 기술과학,예술, 언어, 문학, 역사 등 주제분야의 일반도서 및 참고도서 등을 개가제로 운영하고 있으며, 자료의 대출 반납 및 다양한 정보를 제공합니다.</p>
	</div>
</div>					
				

      <h3>이용대상 : 중학생이상</h3>

      <h3>이용시간</h3>
	  <div class="mb_scroll">
		<table class="tbl_basic">
      
                    <caption class="abt">이용시간 </caption>
                    <thead>
                    <tr>
                    <th>구분</th>
                    <th>월, 토</th>
                    <th>화~금</th>
                    <th>일요일</th>
                    <th>휴관일</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                    <td>종합자료실</span></td>
                    <td>09:00~18:00</td>
                    <td>09:00~22:00</td>
                    <td>09:00~17:00</td>
                    <td>셋째, 넷째 월요일<br />
                      정부지정공휴일</td>
                    </tr>
                    </tbody>
					</table>
                    </li>
					</div>

                   <h3>소장자료</h3>
      <li>
	 
	 <div class="mb_scroll">
		<table class="tbl_basic">
                    <caption style="text-align:right;">< 2018. 10. 1. 현재 ></caption>
                    <thead>
                    <tr>
                    <th>구분</th>
                    <th>총류</th>
                    <th>철학</th>
                    <th>종교</th>
                    <th>사회과학</th>
                    <th>자연과학 </th>
                    <th>기술과학</th>
                    <th>예술</th>
                    <th>언어</th>
                    <th>문학</th>
                    <th>역사</th>
                    <th>계</th>
                    </tr>
                    </thead>
                    <tbody>
					<tr>
									<td><span>책수</span></td>
									<td>11,848</td>
									<td>14,451</td>
									<td>9,227</td>
									<td>50,332</td>
									<td>7,277</td>
									<td>22,165</td>
									<td>13,455</td>
									<td>10,370</td>
									<td>70,647</td>
									<td>21,356</td>
									<td>231,128</td>


								</tr>
                  
                    </tbody>
					</table>
              </li>

			<h3>이용안내</h3>
			 <div class="mb_scroll">
				
					<p class="sbul">검색용 컴퓨터를 이용하여 원하는 자료의 소장여부와 위치를 확인하실 수 있으며, 관내열람 및 관외대출, 필요한 자료를 복사할 수 있습니다. ( 단, 저작권법에 의해 부분 복사만 가능 )</p>
					<p class="sbul">서고 도서는 업무마감 10분 전까지 담당자에게 요청하시면 이용하실 수 있습니다. </p>
			</div>
				
				<h3>이용코너</h3>
			<div class="mb_scroll">
				<dl>
					
				<dl>
					<dt class="bul">안내데스크</dt>
					<dd class="sbul mg_l20">독서회원가입 및 도서대출은 물론 독서상담, 독서회운영 등 독서권장을 위한 다양한 서비스를 제공합니다. </dd> 
					<!-- <dt class="bul">무인 대출반납기(3대)/(4대) -->
					<dt class="bul">자동대출반납기(3대) / 무인반납기(1대)
					<dd class="sbul mg_l20">이용증을 지참하여 무인 대출/반납기를 이용, 직접 도서를 대출처리하고, 반납할 수 있습니다.</dd>
					<dt class="bul">자료검색 PC(4대)</dt>
					<dd class="sbul mg_l20">자료검색PC를 이용하여 직접 필요한 자료의 도서관 소장여부 및 위치, 대출여부를 확인할 수 있습니다.</dd>
					<dt class="bul">복사기(2대)</dt>
					<dd class="sbul mg_l20">복사카드를 구입하여 직접 필요한 자료를 복사할 수 있습니다. 단, 저작권법에 위배되지 않도록 부분복사해야 합니다.<br /> - 복사카드 구입처 : 안내실(1층), 3,000원/개<br />
					- 복사요금 : A4/장 30원, B4/장 40원</dd>
				</dl>
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