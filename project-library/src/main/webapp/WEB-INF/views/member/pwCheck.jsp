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
.password,.password2{
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
	var password = frm.password.value;  // string 타입
	var password2 = frm.password2.value;
	if (password.length == 0) { // id == ''
		alert('비밀번호를 입력하세요.');
		frm.password.focus();
		return false;
	} 
	if (password != password2){
		alert('입력한 비밀번호가 서로 다릅니다');
		frm.password2.focus();
		return false;
	}else{
		var form=document.forms['frm'];
		form.action='/book/member/passUpdate'
		form.submit();
	}
	
	
	
	
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
<h1>password</h1>

<form action="<c:url value="/member/passUpdate"/>" method="post" id="findidform" name="frm" onsubmit="return formCheck();">
<fieldset>
<legend>change</legend>
<c:out value= "${error }"/>
<label>Password</label>
<input type="password" name="password" required class="password"><br>
<label>Retype Password</label>
<input type="password" name="password2" class="password2"><br>


<span id="dupCheck"></span>
<br>
</fieldset>
<div class="clear"></div>
<div id="buttons">
<input type="button" value="비밀번호 변경" class="dup" onclick="idDupCheck()">
</div>
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
<input type="hidden" name="idDB" value="${idDB }">
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