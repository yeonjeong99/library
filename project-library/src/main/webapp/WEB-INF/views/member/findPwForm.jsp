<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style>
input{
border-radius: 7px;
}
label{
	height:35px;
	width:80px;
}
.dup{
  display: inline-block;
  padding: 5px 13px;
  font-size: 13px;
  cursor: pointer;
  text-align: center;
  text-decoration: none;
  outline: none;
  color: #fff;
  background-color: #383d41;
  border: none;
  border-radius: 7px;
  box-shadow: 2px 4px 0px 0px #999;
  margin-top: 10px;
}
.dup:hover {background-color: #bdbbbb}

.dup:active {
  background-color: #3e8e41;
  box-shadow: 0 5px #666;
  transform: translateY(4px);
}
.id,.email{
	height:35px;
	width:200px;
	border-radius : 7px;
}

</style>
<meta charset="UTF-8">
<title>카페인 도서관</title>

<script src="/resources/script/jquery-3.3.1.min.js"></script>

<script>


function idDupCheck() {
	// id값이 공백이면 "아이디 입력하세요." 포커스 주기.
	var id = frm.username.value;  // string 타입
	if (id.length == 0) { // id == ''
		alert('아이디 입력하세요.');
		frm.username.focus();
		return;
	}
	
	var email = frm.email.value;  // string 타입
	if (email.length == 0) { // id == ''
		alert('이메일을 입력하세요.');
		frm.email.focus();
		return;
	}
	

	
	
	var form=document.forms['frm'];
	form.action='/book/member/pwCheck'
	form.submit();
	
	
	// 현재 창 기준으로 새 창 열기
// 	var childWindow = window.open('/book/member/idCheck?email='+email, '', 'width=400,height=200');
}
</script>
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
<div style="text-align: center; height: 600px;">
<article style="padding-top: 100px;">
<h1>Find</h1>

<form action="<c:url value="/member/pwCheck"/>" method="post" id="findpwform" name="frm" onsubmit="return formCheck();">
<fieldset>
<legend>password Form</legend>

<c:if test = "${result ne null && result ne '' }">
	<h3 > ${result}</h3>
	
</c:if>


<label>User ID</label>
<input type="text" name="username" class="id" required><br>

<label>E-Mail</label>
<input type="email" name="email" class="email" required>

<span id="dupCheck"></span>
<br>
</fieldset>
<div class="clear"></div>
<div id="buttons">
<input type="submit" value="비밀번호 찾기" class="dup" onclick="idDupCheck()">
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