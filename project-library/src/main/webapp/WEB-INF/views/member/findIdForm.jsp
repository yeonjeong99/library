<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style>
label{
	height:35px;
	width:80px;
}
input{
border-radius: 7px;
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
.id{
	height:35px;
	width:200px;
	border-radius : 7px;
}
</style>
<meta charset="UTF-8">
<title>카페인 도서관</title>

<script src="/resources/script/jquery-3.3.1.min.js"></script>

<script>
var csrfHeaderName = '${_csrf.headerName}';
var csrfTokenValue = '${_csrf.token}';

function idDupCheck() {
	// id값이 공백이면 "아이디 입력하세요." 포커스 주기.
	var email = frm.email.value;  // string 타입
	if (email.length == 0) { // id == ''
		alert('이메일을 입력하세요.');
		frm.email.focus();
		return;
	}
	
	console.log(email);

	
/* 	form.action='/member/idCheck'
	form.submit(); */
	
	
	$.ajax({
		url : '/book/member/idCheck',
		type : 'POST',
		data : {
			email : email
		},
		beforeSend : function (xhr) {
			xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
		},
		  success: function(result){
			  var id = result;
			  if(id.length==0){
				  alert('아이디 찾기에 실패했습니다.');
				  return false;
			  }
			  var childWindow = window.open('/book/member/idCheck?id='+id, '', 'width=200,height=80');
		  }
		
	});
	
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
<h1 >Find</h1>

<form id="findidform" name='frm'>
<fieldset>
<legend>Id Form</legend>

<label>E-Mail</label>
<input type="email" name="email" class="id" required>

<span id="dupCheck" ></span>
<br>
</fieldset>
<div class="clear"></div>
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
</form>
<input type="button" value="ID 찾기" class="dup" onclick="idDupCheck()">
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