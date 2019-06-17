<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html lang="ko">
    <head>
	    <meta charset="euc-kr">
        <title>희망과 꿈이 있는 부전도서관</title>

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
		<!-- left menu s -->
		
 <div id="side">
	<nav class="sub_menu">
		<h2 class="sub_title" style="height: 100px;">도서관이용<span>LIBRARY USE GUIDE</span></h2>

		<ul class="sm_2th">
		 <li ><a href="<c:url value="/hoursOfUse"/>" ><span>이용시간</span><span class="more"><span class="state">에 대한 2차메뉴 닫힘</span><em class="ver"></em><em class="hor"></em></span></a></li>

		 <li ><a href="<c:url value="/referenceLibrary"/>"><span>자료실소개</span><span class="more"><span class="state">에 대한 2차메뉴 닫힘</span><em class="ver"></em><em class="hor"></em></span></a>

		 </li>
		 <li><a href="<c:url value="/bookMembership"/>" ><span>도서회원가입</span><span class="more"><span class="state">에 대한 2차메뉴 닫힘</span><em class="ver"></em><em class="hor"></em></span></a></li>

		 <li class="on"><a href="<c:url value="/useOfData"/>"><span>자료이용안내</span><span class="more"><span class="state">에 대한 2차메뉴 닫힘</span><em class="ver"></em><em class="hor"></em></span></a>
		   <ul  class="sm_3th">
		   <li><a href="<c:url value="/outsideLoan"/>">관외대출</a></li>
		   <li class="on"><a href="<c:url value="/outsideReading"/>">관내열람</a></li>
		   </ul>

		 </li>
	
		 <li ><a href="<c:url value="/amenities"/>"><span>편의시설</span><span class="more"><span class="state">에 대한 2차메뉴 닫힘</span><em class="ver"></em><em class="hor"></em></span></a></li>
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
				<li>자료이용안내</li>
				<li>관내열람</li>
			</ul>
<!-- /location1 -->

<h2>관내열람</h2>

<div class="basic_box type1">
	<div class="inner">
		<span class="icon icon12"></span>
		<b>관내열람</b>
		<p>자료실에 비치된 모든 자료는 자유롭게 열람할 수 있습니다.<br />
		  <!--  도서관자료를 관외로 대출하려면 독서회원에 가입해야 합니다.<br />
		   독서회원에 가입하더라도 대출되지 않는 자료가 있습니다.<br />
		   관외대출 제한자료:어학사전, 백과사전, 법령, 도감 등의 참고도서 , 연속간행물, 비도서자료, 금융정보자료실 자료 -->
</p>
	</div>
</div>

					
<div class="sub02_icon1">
	<div class="icon_inner">
		<h3>서고자료</h3>
			<ul>
				<li class="sbul ">발행일이 오래되거나 이용빈도가 떨어지는 도서는 서고에 별도 비치됩니다.</li>
				<li class="sbul">서고자료의 이용 : 서명과 청구기호를 적어 직원에게 신청후 열람 </li>
				<li class="sbul">이용가능시간 : 업무마감 10분 전까지 담당자에게 요청하시면 이용 가능</li>
			</ul>
	</div>
</div>
<div class="sub02_icon2">
	<div class="icon_inner">
		<h3>비도서자료</h3>
			<ul>
				<li class="sbul">디지털자료실은 중학생 이상 이용할 수 있습니다.</li>
				<li class="sbul">DVD, CD, CD-ROM 등의 비도서자료는 이용신청서를 기재한 후 담당직원에게 신청하면 지정된 좌석에서 열람할 수 있습니다. </li>	
				<li class="sbul">비도서자료는 관외 대출되지 않습니다.</li>	
			</ul>
	</div>
</div>

<div class="sub02_icon3">
	 <div class="icon_inner">
		<h3>신문, 잡지 등 연속간행물 열람 </h3>
		<ul>
			<li class="sbul">신문, 잡지 등의 연속간행물은 2층 연속간행물실에서 열람할 수 있으며, 관외대출 되지 않습니다.<br /><br /><br /></li>
		</ul>
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