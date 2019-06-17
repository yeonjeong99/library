<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>카페인 도서관</title>

<link href="/book/resources/css/sub/member.css" rel="stylesheet" type="text/css" />

<script src="/resources/script/jquery-3.3.1.min.js"></script>
<script>
$(function () {
	
	$('input[name=memberId]').on('keyup', function (event) {
		var id = $(this).val();
		console.log('id 변수 타입: ' + typeof id);
		console.log('id: ' + id);
		
		$.ajax({
			url: '/book/member/joinIdCheckJson',
			data: {userid:member_id},  // userid=id입력값
			success: function (isDup) {
				console.log('result 변수 타입: ' + typeof(isDup));
				console.log('result: ' + isDup);
				
				if (isDup) {// id중복
					$('span#dupCheck').html('이미 존재하는 아이디입니다.').css('color', 'red');
				} else { // id중복아님
					$('span#dupCheck').html('사용 가능한 아이디입니다.').css('color', 'green');
				}
				
			}
		});
		
	});
	
});
</script>
<script>
function formCheck() {
	// ID는 3글자 이상 입력해야함
	if (frm.member_id.value.length < 3) { // frm.id.value == ''
		alert('ID는 3글자 이상 입력해야 합니다.');
		frm.member_id.focus();
		return false;
	}
	
	
	if (frm.password.value != frm.password2.value) {
		alert('패스워드 입력이 서로 다릅니다.\n다시 입력하세요.');
		frm.pass.focus();
		return false;
	}
	if (frm.email.value != frm.email2.value) {
		alert('이메일주소 입력이 서로 다릅니다.\n다시 입력하세요.');
		frm.email.focus();
		return false;
	}
	return true;
}

function idDupCheck() {
	// id값이 공백이면 "아이디 입력하세요." 포커스 주기.
	var id = frm.memberId.value;  // string 타입
	if (id.length == 0) { // id == ''
		alert('아이디 입력하세요.');
		frm.memberId.focus();
		return;
	}
	
	// 현재 창 기준으로 새 창 열기
	var childWindow = window.open('/book/member/joinIdCheck?userid='+id, '', 'width=400,height=200');
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
<br/>
<!-- 왼쪽메뉴 -->
<!-- 본문내용 -->
<div style="text-align: center; height: 600px;">
<article>
<h1>Join Us</h1>

<form action="<c:url value="/member/join"/>" method="post" id="join" name="frm" onsubmit="return formCheck();">
<fieldset>
<legend>Basic Info</legend>
<label>User ID</label>
<input type="text" name="memberId" class="id" required>
<input type="button" value="ID 중복확인" class="dup" onclick="idDupCheck()">
<span id="dupCheck"></span>
<br>
<label>Password</label>
<input type="password" name="password" required><br>
<label>Retype Password</label>
<input type="password" name="password2"><br>
<label>Name</label>
<input type="text" name="name" required><br>
<label>E-Mail</label>
<input type="email" name="email" required><br>
<label>Retype E-Mail</label>
<input type="email" name="email2"><br>
</fieldset>

<fieldset>

<!-- <legend>Optional</legend>
<label>생년월일</label>
<input type="date" name="birthday"><br> -->

<label class="gender">성별</label>
<input type="radio" name="gender" value="여">여자
<input type="radio" name="gender" value="남">남자<br> 

</p>
<!-- <label>Address</label>
<input type="text" name="address"><br> -->

<label>Phone Number</label>
<input type="text" name="tel"><br>

<!-- <label>Mobile Phone Number</label>
<input type="text" name="mtel"><br> -->
</fieldset>
<div class="clear"></div>
<div id="buttons"><br>
<input type="submit" value="회원가입" class="submit">
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