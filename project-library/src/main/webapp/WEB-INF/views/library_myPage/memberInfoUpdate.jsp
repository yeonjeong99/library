<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카페인 도서관</title>

<link href="/book/resources/css/sub/member.css" rel="stylesheet" type="text/css" />

</head>
<body>

<div id="wrap">
<!-- 헤더들어가는 곳 -->
<jsp:include page="/WEB-INF/views/inc/top.jsp"/>
<!-- 헤더들어가는 곳 -->

<!-- 본문들어가는 곳 -->
<!-- 본문메인이미지 -->
<div id="sub_img_member"></div>
<!-- 본문메인이미지 -->
<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>

</ul>
</nav>
<!-- 왼쪽메뉴 -->
<!-- 본문내용 -->
<div style="height: 500px; text-align: center;">
<article>
<h1>Login</h1>
<c:out value= "${error }"/>
<c:out value = "${logout }"/>
<form action="<c:url value="/member/memberInfoUpdate"/>" id="join" method="post">

	   		<sec:authorize access = "isAnonymous()">
		 		잘못들어왔어
			</sec:authorize>

   			<sec:authorize access = "isAuthenticated()">
	      		<input type="hidden" name="memberId" id = "memberId" value = "<sec:authentication property="principal.username"/>"><br>
   			</sec:authorize>

<fieldset>
<legend>회원정보 수정</legend>
<h3>회원정보를 수정하려면 비밀번호를 다시 한 번 입력해 주세요.</h3>



<label>Password</label>
<input type="password" name="password"><br>
</fieldset>
<div class="clear"></div>
<div id="buttons">
<input type="submit" value="로그인" class="submit">
</div>
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">

</form>
</article>
<!-- 본문내용 -->
<!-- 본문들어가는 곳 -->
</div>

<div class="clear"></div>
<!-- 푸터들어가는 곳 -->
<jsp:include page="/WEB-INF/views/inc/bottom.jsp"/>
<!-- 푸터들어가는 곳 -->
</div>
</body>
</html>