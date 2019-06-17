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
						관리자 페이지<span>USER COMMUNITY</span>
					</h2>

					<ul class="sm_2th">
						<li class="on"><a href="/book/admin/adminMemberList"><span>회원 리스트</span><span class="more"><span class="state">에 대한 2차메뉴 닫힘</span><em class="ver"></em><em class="hor"></em></span></a></li>
						<li><a href="/book/admin/adminBookRental"><span>도서 대여</span><span class="more"><span class="state">에 대한 2차메뉴 닫힘</span><em class="ver"></em><em class="hor"></em></span></a></li>
						<li><a href="/book/admin/adminBookReturn"><span>도서 반납</span><span class="more"><span class="state">에 대한 2차메뉴 닫힘</span><em class="ver"></em><em class="hor"></em></span></a></li>
						<li><a href="/book/admin/bookRequestList"><span>사용자 희망 도서</span><span class="more"><span class="state">에 대한 2차메뉴 닫힘</span><em class="ver"></em><em class="hor"></em></span></a></li>
					</ul>
				</nav>
			</div>

			<!-- left menu e -->
		</div>

		<div id="con">

			<div id="detail_con">
				<!-- content s -->
				<!-- location1 -->

				<!-- /location1 -->

				<h2>회원 리스트</h2>

<div style="width: 1000px; height: 600px; overflow: scroll;" >
		<form action="/admin/adminMemberList" id="frm">


<table border="3" >
		<thead>
			<tr>
				<td>선택<input type="checkbox" name="checAll" id="chAll"></td>
				<td>아이디</td>
				<!-- <td>비밀번호</td> -->
				<td>이름</td>
				<td>성별</td>
				<td>이메일</td>
				<td>가입날짜</td>
				
				<!-- <td>삭제</td><td>수정</td> -->
			</tr>
		</thead>
		
		 <tbody>

			<%-- <%
           for (Member member : list){
              Timestamp reg_date = member.getReg_date();
              String strDate = sdf.format(reg_date); 
              %> --%>

		<c:forEach items="${list}" var="member">
        <tr>
            <td><input type="checkbox" value="${member.memberId}" class="delCheck" name="chBoxId"/> </td>
            <td >${member.memberId}</td>
           <%--  <td>${member.password}</td> --%>
            <td>${member.name}</td>
            
            <td>${member.gender}</td>
            <td>${member.email}</td>   
            <td>${member.regDate}</td>       
      
            <%-- <td><a href="MemberDeleteAction.do?id=${member.id}">삭제</a></td> --%>
            <%-- <td><a href="memberupdate.do?id=${member.id}">수정</a></td> --%>
        </tr>
        </div>
        
        </c:forEach>
    </table>
    

</form>
</div>
				<br>
				
				<form action="/book/member/memberInfoUpdate">
					<input class="submit" type="submit" value="뭐할까">
				</form>
	</section>

	<!-- 푸터들어가는 곳 -->
	<footer>
		<jsp:include page="/WEB-INF/views/inc/bottom.jsp" />
	</footer>
	<!-- 푸터들어가는 곳 -->


<script>
$(document).ready(function() {
	   $('#chAll').click(function() {
		   if ($('#chAll').is(':checked')){
		         $('input:checkbox[name=chBoxId]').prop('checked', true);      
		      } else {
		         $('input:checkbox[name=chBoxId]').prop('checked', false);
		      } 
	  	 });
	       
	   });
</script>

</body>
</html>
<!-- bottom e -->