<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!DOCTYPE html>
<html lang="ko">
    <head>
	    <meta charset="euc-kr">
        <title>도서 회원가입 페이지</title>

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

</head>
<body>

	<div id="skipNavi">

		<a href="#detail_con">본문 바로가기</a>

	</div>

	<script type="text/JavaScript">

</script>

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

		 <li ><a href="<c:url value="/referenceLibrary"/>"><span>자료실소개</span><span class="more"><span class="state">에 대한 2차메뉴 닫힘</span><em class="ver"></em><em class="hor"></em></span></a>

		 </li>
		 <li class="on"><a href="<c:url value="/bookMembership"/>" ><span>도서회원가입</span><span class="more"><span class="state">에 대한 2차메뉴 닫힘</span><em class="ver"></em><em class="hor"></em></span></a></li>

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

			<ul id="location">
				<li>홈</li>
				<li>도서관이용</li>
				<li>도서회원가입</li>
			</ul>

<h2>도서회원가입</h2>

<div class="basic_box type1">
	<div class="inner">
		<span class="icon icon10"></span>
		<b>도서회원가입</b>
		<p>도서회원으로 가입하시면 개인, 직장 혹은 단체에 도서 대출 및 도서관에서 제공하는 다양한 정보를 제공받을 수 있습니다. 회원가입은 무료이며 홈페이지  또는 도서관 방문해서 가입 할 수 있습니다.
</p>
	</div>
</div>
	
	
 
  <h3>도서회원의 종류 </h3>
				<div class="mb_scroll">
					<table class="tbl_basic">
						<caption class="abt">도서회원의 종류</caption>
						<thead>
							<tr>
								<th scope="col" colspan="2">회원종류</th>
								<th scope="col">대상</th>
								<th scope="col">가입장소</th>
								<th scope="col">구비서류</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td align="center" rowspan="3" class="bg_gray01"><span
									class="c_green01" align="center">개인<br>도서회원<br />(책이음)
								</span></td>
								<td align="center">어린이</td>
								<td align="center">유아·초등학생</td>
								<td align="center">어린이실</td>
								<td>가족관계증명서, 주민등록등본, 건강보험증 등,<br>보호자 신분증
								</td>
							</tr>
							<tr>
								<td align="center">청소년</td>
								<td align="center">중·고생, 청소년</td>
								<td align="center">종합자료실</td>
								<td>거주 및 본인 확인이 가능한<br>학생증, 주민등록증, 청소년증
								</td>
							</tr>
							<tr>
								<td align="center">일반</td>
								<td align="center">부산시 거주자<br />(재직 또는 재학 포함)
								</td>
								<td align="center">종합자료실<br>어린이실
								</td>
								<td>거주 및 본인 확인이 가능한 주민등록증, 운전면허증 등<br />(학교 또는 직장만 부산소재인
									경우는 재학(재직)증명서
								</td>
							</tr>
							<tr>
								<td align="center" class="bg_gray01"><span
									class="c_green01">직장<br>도서회원
								</span></td>
								<td align="center">직장·단체</td>
								<td align="center">10인이상의 직장 및<br>단체
								</td>
								<td align="center">종합자료실</td>
								<td>별도 절차에 따름 T.802-6304</td>
							</tr>
							<tr>
								<td>공통조건</span></td>
								<td colspan="4" class="l">·<a
									href="<c:url value="/member/join"/>"
									title="새창" target="_blank"
									style="background: #fbfb9e; text-decoration: underline;">홈페이지에서
										도서회원 가입</a> 또는 도서관 내 회원가입 PC에서 가입 신청후 본인 확인 절차를 거쳐 책이음 회원증 발급(무료)
									<br /> · 타 지역 주소인 이용자의 경우 부산시내 재직 또는 재학 확인을 거쳐 책이음 회원증 발급<br />·
									책이음 회원증은 본인만 이용 가능(가족, 지인 등 이용불가)<br />· 회원증 분실 또는 훼손 등으로 재발급
									신청 시 신청일로 부터 7일 경과 후 이용가능(발급 전까지 대출 불가)<br /> · 만14세 미만 도서회원
									가입시 법정대리인(부모 등)의 이용 동의가 필요함
								</td>
							</tr>

						</tbody>
					</table>
					
					<div class="c mg_t30">
						<a href="<c:url value="/member/join"/>" class="blue" target="_blank" style="color: white;">도서 회원가입 </a>
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