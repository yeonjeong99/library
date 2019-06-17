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


<script type="text/javascript">
var csrfHeaderName = '${_csrf.headerName}';
var csrfTokenValue = '${_csrf.token}';
$(function () {
	getAllReservationList();
	
	$('#inputMemberId').on('keyup', function (event) {
		var memberId = $(this).val();
// 		console.log('memberId 변수 타입: ' + typeof memberId);
// 		console.log('memberId: ' + memberId);
		
		$.ajax({
			url: '/book/admin/adminBookRentalIdSearch',
			data: {memberId : memberId},  // userid=id입력값
			success: function (result) {
				
				var str = "";
				
				$.each(result, function(index, item) { // index: 순번 , item: result를 풀어서 담아둔것.
					str+= "<li onclick='memberIdSearch(&#39;"+item.memberId+"&#39; &#44; &#39;"+item.name+"&#39;)' >"+item.memberId+" ("+item.name+")"+"</li>";
				});
				
				$('#memberIdSearchResult').html(str);
			}
		});

	});
	
	$('#inputBookCode').on('keyup', function (event) {
		var bookCode = $(this).val();
		
		$.ajax({
			url: '/book/admin/adminBookRentalCodeSearch',
			data: {bookCode : bookCode},  // userid=id입력값
			success: function (result) {
				
				var str = "";
				
				$.each(result, function(index, item) { // index: 순번 , item: result를 풀어서 담아둔것.
					str+= "<li onclick='bookCodeSearch(&#39;"+item.bookNo+"&#39; &#44; &#39;"+item.title+"&#39;)'>("+item.bookNo+") "+item.title+"</li>";
				});
				
				$('#bookCodeSearchResult').html(str);
			}
		});
		
	});
});
	
function memberIdSearch(id,name){ // 대여중인 도서 5권 이상이면 값 안넘어가고 alert 주기.

	var memberId= id;
	var result = id+" ("+name+")";
	var isStackFull = true;
	
	$.ajax({
		url: '/book/admin/getMemberRentalCount',
		data: {memberId : memberId},
		type: 'post',
		beforeSend : function (xhr) {
			xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
		},
		async: false,
		success: function (data) {
			if (data >=5){
				console.log("data:::"+data);
				alert('대여한 도서가 이미 5권 이상입니다. 먼저 도서를 반납해 주세요.');
				$('input[name=memberId]').val('');
				$('input[name=bookCode]').val('');
				isStackFull = false;
				return isStackFull;
			} 
			$('input[name=memberId]').val(memberId);
			$('#memberIdSearchResult').html(result);
		}
	});
	return isStackFull;
}
function bookCodeSearch(bookNo,title){ 
	var bookCode= bookNo;
	var result = bookNo+" ("+title+")";
	
	$.ajax({
		url: '/book/admin/getBookisRental',
		data: {bookCode : bookCode},
		type: 'post',
		beforeSend : function (xhr) {
			xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
		},
		success: function (data) {
			if (data ==1){
				alert('이미 대여중인 도서입니다.');
				return false;
			} 
			$('input[name=bookCode]').val(bookCode);
			$('#bookCodeSearchResult').html(result);
		}
	});
}

function bookRentalProcess(){

	var memberId = $('input[name=memberId]').val();
	var bookCode = $('input[name=bookCode]').val();
	
	
	
	var isStackFull = memberIdSearch(memberId,bookCode);
	console.log(isStackFull);
	
	
	
	
	
	if (memberId =='' || bookCode =='' || memberId ==null || bookCode ==null ){
		alert('값을 입력하세요.');
		return false;
	}
	
	if(isStackFull==false){
		console.log("isStackFull false 이프")
		return false;
	}
	console.log("true isStackFull 이프")
	
	
	$.ajax({
		url: '/book/admin/adminBookRentalIdSearch',
		data: {memberId : memberId},  // userid=id입력값
		success: function (result) {
			var str = "";
			$.each(result, function(index, item) { // index: 순번 , item: result를 풀어서 담아둔것.
// 				console.log('item.bookOverdue: '+item.bookOverdue);
// 				console.log('item.memberId: '+item.memberId);
				if(item.bookOverdue>=1){
// 					console.log('bookOverdue: 1이상일때.');
					alert(item.memberId+' 님은 연체 상태입니다. 연체도서를 먼저 반납 후 대여하세요.');
					return false;
				} 
// 					console.log('bookOverdue: 0 정상일때.');
					bookRentalAction(item.memberId);
			});
		}
	});
}

function bookRentalAction(memberId) {
	var bookCode = $('input[name=bookCode]').val();
// 	console.log('bookRentalAction: ' + memberId + bookCode);
	$.ajax({
		url: '/book/admin/adminBookRentalResult',
		data: {memberId : memberId,
			   bookCode : bookCode},
		type: 'post',
		beforeSend : function (xhr) {
			xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
		},
		success: function (result) {
			if (result ==1){
				
				getAllReservationList();
				alert('대여 완료.');
			} else {
				alert('시스템 오류.');
			}
		}
	});
}
function getAllReservationList(){
	$.ajax({
		url: '/book/admin/adminBookReservationGetAllList',
		type: 'post',
		beforeSend : function (xhr) {
			xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
		},
		success: function (result) {
// 			console.log('result: '+result);
			var str = "<tr><th>도서코드</th><th>사용자 아이디</th><th>반납기한</th></tr>";
			$.each(result, function(index, item) { // index: 순번 , item: result를 풀어서 담아둔것.
				
				var tempEndTime = new Date(item.resTimeVO.endTime);
				var EndTimeFormat =  tempEndTime.getFullYear()+ "-" + (tempEndTime.getMonth() + 1) + "-" +tempEndTime.getDate() ;
				
				str += "<tr><td>"+item.bookCode+"</td>";
				str += "<td>"+item.memberId+"</td>";
				str += "<td>"+EndTimeFormat+"</td></tr>";
			});
			$('#bookRentalResult').html(str);
		}
	});
	
}

</script>

<style type="text/css">
#bookCodeSearchResult{
height: 300px;
overflow: scroll;
}

#memberIdSearchResult{
height: 300px;
overflow: scroll;
}

#inputMemberId {
background-color: #D5D5D5;
}

#inputBookCode{
background-color: #D5D5D5;
width: 300px;
}

#rentalBtn{
width: 80px;
}

#bookRentalResultDiv{
height: 600px;
overflow: scroll;
}

input[name=memberId] {
background-color: #D5D5D5;
}

input[name=bookCode]{
background-color: #D5D5D5;
width: 300px;
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

	<script type="text/javascript">
$(document).ready(function(){
	$(".allsch").on('click', function( e ) {
		  $("#topsearch").attr('class','smartsearchover');
		
	});
	$(".closesch").on('click', function( e ) {
		  $("#topsearch").attr('class','smartsearch');
	});
 
 });
</script>

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
						<li><a href="/book/admin/adminMemberList"><span>회원 리스트</span><span class="more"><span class="state">에 대한 2차메뉴 닫힘</span><em class="ver"></em><em class="hor"></em></span></a></li>
						<li class="on"><a href="/book/admin/adminBookRental"><span>도서 대여</span><span class="more"><span class="state">에 대한 2차메뉴 닫힘</span><em class="ver"></em><em class="hor"></em></span></a></li>
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
			<div id = "bodyContainerDiv">
		<div id = "bookRentalDiv">
			<table id="bookRentalTable">
		
				<tr>
					<th id = "inputMemberIdTh">사용자 아이디</th>
					<th id = "inputBookCodeTh" >도서 번호</th>
				</tr>
				<tr>
					<td><input type="text" id = "inputMemberId" /></td>
					<td><input type="text" id = "inputBookCode" /></td>
					
				</tr>
				<tr>
					<td>
						<ul id="memberIdSearchResult"></ul>
					</td>
					<td>
						<ul  id="bookCodeSearchResult"></ul>
					</td>
				</tr>
				
				<tr>
				<td>
				<input type="text"  name = "memberId" readonly="readonly"/>
				<input type="text"  name = "bookCode" readonly="readonly"/>
				
				<input id = "rentalBtn" type = "button" value ="대여" onclick="bookRentalProcess()"/>
				</td>
				</tr>
		
			</table>
			
			<br><hr><hr><br>
		
		</div>
		<div id = "bookRentalResultDiv">
			<table border="1" id="bookRentalResult">
			</table>
		</div>
	
	</div>
		
	</section>

	<!-- 푸터들어가는 곳 -->
	<footer>
		<jsp:include page="/WEB-INF/views/inc/bottom.jsp" />
	</footer>
	<!-- 푸터들어가는 곳 -->

</body>
</html>
<!-- bottom e -->