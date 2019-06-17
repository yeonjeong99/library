<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

		<link href="/book/resources/css/sub/member.css" rel="stylesheet" type="text/css" />
		<link href="/book/resources/css/sub/layout.css" rel="stylesheet" type="text/css" />

		<script src="/book/resources/script/jquery-3.3.1.min.js"></script>


<meta charset="UTF-8">
<title>카페인 도서관</title>

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
<!-- 
스프링 시큐리티 로그인처리 url인 /login으로 접속
user Id는 스프링이 처리할 수 있는 username으로 적용
자동 로그인도 마찬가지로 스프링이  처리할수 있는 remember-me로 적용
 -->

<div style="height: 500px; text-align: center;">
<article style="margin-top: 100px">
<h1>Login</h1>
<c:out value= "${error }"/>
<c:out value = "${logout }"/>
<form action="<c:url value="/login"/>" id="join" method="post">
<fieldset>
<legend>Login Info</legend>
<label>User ID</label>
<input type="text" name="username" class="username"><br>
<label>Password</label>
<input type="password" name="password" class="password"><br><br>
<label>자동 로그인</label>
<input type="checkbox" name="remember-me">Remember Me<br>
</fieldset>

<p>	
<a class="dropdown-item" href="<c:url value='/member/findIdForm'/>">아이디찾기</a>
<a class="dropdown-item" href="<c:url value='/member/findPwForm'/>">비밀번호찾기</a>
</p>

<div class="clear"></div>
<div id="buttons">
<input type="submit" value="로그인" class="submit">
<input type="reset" value="초기화" class="cancel">
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