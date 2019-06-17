<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

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

<link href="<c:url value="/resources/css/freeBoard.css"/>" rel="stylesheet" type="text/css">

<link href="/book/resources/css/sub/member.css" rel="stylesheet" type="text/css" />

<script src="/book/resources/script/jquery-3.3.1.min.js"></script>

 
 <style>
 	input {
	background-color: #D5D5D5;
}
 </style>

</head>
<body>

	<input type="hidden"
		value="<sec:authentication var="memberId" property="principal.username"/>" />

	<!-- 헤더들어가는 곳 -->
	<jsp:include page="/WEB-INF/views/inc/top.jsp" />
	<!-- 헤더들어가는 곳 -->

	<div id="skipNavi">

		<a href="#detail_con">본문 바로가기</a>

	</div>


	<div id="sub_visual" class="sub_img07">
		<div class="fix-layout"></div>
	</div>


	<section class="fix-layout">

		<div id="nav-left">
			<!-- left menu s -->

			<div id="side">
				<nav class="sub_menu">
					<h2 class="sub_title" style="height: 100px;">
						마이 페이지<span>USER COMMUNITY</span>
					</h2>

					<ul class="sm_2th">
						<li><a href="/book/libRequest/bookRequestResult"><span>내 희망도서 신청정보</span><span class="more"><span class="state">에 대한 2차메뉴 닫힘</span><em class="ver"></em><em class="hor"></em></span></a></li>
						<li ><a href="/book/member/myView?id=${memberId}"><span>내 정보</span><span class="more"><span class="state">에 대한 2차메뉴 닫힘</span><em class="ver"></em><em class="hor"></em></span></a></li>
						<li class="on"><a href="/book/member/memberInfoUpdate"><span>정보 수정</span><span class="more"><span class="state">에 대한 2차메뉴 닫힘</span><em class="ver"></em><em class="hor"></em></span></a></li>
						<!-- <li><a href="" ><span>Q&A</span><span class="more"><span class="state">에 대한 2차메뉴 닫힘</span><em class="ver"></em><em class="hor"></em></span></a></li> -->
					</ul>
				</nav>
			</div>

			<!-- left menu e -->
		</div>

		<div id="con">

			<div id="detail_con">
				<!-- content s -->
				<sec:authorize access="isAnonymous()">
		 		잘못들어왔어
			</sec:authorize>

				<sec:authorize access="isAuthenticated()">
					<input type="hidden" id="memberId"
						value="<sec:authentication property="principal.username"/>">
					<br>



			<!-- 게시판 -->
			
			<article>
			<h1>회원정보수정 상세 페이지 </h1>
			<br>
			<form action="<c:url value="/member/memberupdate"/>" method="post" name="frm">
			<!-- onsubmit="return formCheck();" -->
			<fieldset>
			<label>User ID : </label>
			<input type="text" name="memberId" class="id" value="${memberVO.memberId }" readonly="readonly">
			<span id="dupCheck"></span>
			<br>
			<label>Password : </label>
			<input type="password" name="password" value=""><br>
			<label>Retype Password : </label>
			<input type="password" name="password2" value=""><br>
			<label>Name : </label>
			<input type="text" name="name" value="${memberVO.name}"><br>
			<label>E-Mail : </label>
			<input type="email" name="email" value="${memberVO.email}"><br>
			<label>Retype E-Mail : </label>
			<input type="email" name="email2" value=""><br>
			</fieldset>
			
			<fieldset>
			<label>성별</label>
			<p>
			<input type="radio" name="gender" value="여">여자
			<input type="radio" name="gender" value="남">남자<br>
			</p>
			<label>Phone Number : </label>
			<input type="text" name="tel" value="${memberVO.tel}"><br>
			</fieldset>
			<div class="clear"></div>
			
			<hr>
			
			<div id="buttons">
			<input type="submit" value="정보수정" class="submit">
			<input type="reset" value="초기화" class="cancel">
			</div>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			</form>
			
			<div class="clear"></div>
			
			</article>


				</sec:authorize>
				
				
	</section>

	<!-- 푸터들어가는 곳 -->
	<footer>
		<jsp:include page="/WEB-INF/views/inc/bottom.jsp" />
	</footer>
	<!-- 푸터들어가는 곳 -->


</body>
</html>
<!-- bottom e -->