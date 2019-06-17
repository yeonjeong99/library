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
var id = '<sec:authentication property="principal.username"/>';
var csrfHeaderName = '${_csrf.headerName}';
var csrfTokenValue = '${_csrf.token}';

	$(document).ready(function(){
		var bookCode = "";
		getAllHistoryList();
	});
	
	function bookCodeSearch(){ // bookCode 값을 읽어와서 대여된 적 있는 도서인지 검색.
		bookCode = 'book'+$('#bookCode').val();
		console.log(bookCode);
	 	$.ajax({
			url: '/book/admin/adminBookReturn',
			data: {	bookCode: bookCode},
			type: 'post',
			beforeSend : function (xhr) {
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			},

			success: function(result){
				
				console.log(result);
				
				if (result.resTimeVO==null ){ // restime 테이블에 값이 없으면 대여된 적 없는 도서이다.
					alert('해당 도서는 대여된 적이 없습니다.');
					return false;
				}
				
				var startDate = new Date(result.resTimeVO.startTime);
				var startFormat =  startDate.getFullYear()+ "-" + (startDate.getMonth() + 1) + "-" +startDate.getDate() ;
				var endDate = new Date(result.resTimeVO.endTime);
				var endFormat =  endDate.getFullYear()+ "-" + (endDate.getMonth() + 1) + "-" +endDate.getDate() ;
				
				var now = new Date();

				var gap = (endDate.getTime() - now.getTime()) / (1000*60*60*24); // 연체정보를 불러옴.
				var overDue = '';
				if (gap > 0) {
					overDue = '정상';
				} else {
					overDue = '연체';
					alert('연체된 도서입니다.');
				}
				
				var str = "";
				str+= " <tr><th>bookCode</th> <th>MemberId</th> <th>BookExtension</th> <th>bookStatus</th> ";
				str+= "     <th>startTime</th> <th>endTime</th> <th>overDue</th> <th>연체금납부</th> <th></th> </tr>";
				
				str+= "<tr><td>"+result.bookCode+"</td> <td>"+result.memberId+"</td> <td>"+result.bookExtension+"</td>";
				str+= "<td>"+result.bookStatus+"</td> <td>"+startFormat+"</td> <td>"+endFormat+"</td> <td>"+overDue+"</td> ";
				str+= '<td><input type="checkbox" id = "user_CheckBox"></td>';
				str+= '<td>';
				if (result.bookStatus == 1){
					str += '<button onclick="returnBook()" id = "clickBtn">반납</button>';
				}
				str += '</td></tr>';
				
				if(result==false){
					return false;
				}
				$('#bookSearchResult').html(str);
			}
		}); 
	}
		function returnBook(){ // 반납버튼 클릭시 반납처리하는 제이쿼리 & ajax
			// $(".checkBtn").click(function(){}); 이 아니라 function으로 들어올 경우 $(this)를 제대로 인식 못한다. 
			// 그러므로 button id값 or class값을 직접 선언하여 가져오는 것이 좋다.
			if (confirm("반납 처리 하시겠습니까??") == true) {
				var str = "";
				var clickBtn =$("#clickBtn");
				var tr = clickBtn.parent().parent();
				var td = tr.children();
				var bookCode = td.eq(0).text();
				var memberId = td.eq(1).text();
				var checkBox = false;
				
				if (document.getElementById("user_CheckBox").checked == true){
// 					console.log("true 진입");
					checkBox= true;
				}
				
// 				console.log("checkbox:::"+checkBox);
// 				console.log("tr:::"+tr.text());
				
					$.ajax({
						url : '/book/admin/adminBookReturnResult',
						data : { // 파라메터 이름 : 파라메터 값 서버에서 찾을 땐 파라메터 이름 가지고 찾는다. 
							bookCode : bookCode,
							memberId : memberId,
							isDuty : checkBox
						},
						type: 'post',
						beforeSend : function (xhr) {
							xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
						},
						success : function(result) {
							if (result == 1) {
								alert('반납되었습니다.');
								$('#bookSearchResult').html('');
								getAllHistoryList();
							} else {
								alert('반납에 실패하였습니다.\n 관리자에게 문의하세요');
							}
						}
					});
			} else {
				return;
			}
		}
		
		function getAllHistoryList(){
			$.ajax({
				url: '/book/admin/getAllBookHistoryList',
				type: 'post',
				beforeSend : function (xhr) {
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
				},
				success: function (result) {
// 		 			console.log('result: '+result);
					var str = "<tr><th>도서제목</th><th>사용자 아이디</th><th>반납일</th></tr>";
					$.each(result, function(index, item) { // index: 순번 , item: result를 풀어서 담아둔것.
						
						var tempReturnDate = new Date(item.returnDate);
						var returnDateFormat =  tempReturnDate.getFullYear()+ "-" + (tempReturnDate.getMonth() + 1) + "-" +tempReturnDate.getDate() ;
						str += "<tr><td>"+item.title+"</td>";
						str += "<td>"+item.memberId+"</td>";
						str += "<td>"+returnDateFormat+"</td></tr>";
					});
					$('#bookReturnResult').html(str);
				}
			});
		}
		
</script>

<style>
#bookCode{
background-color: #D5D5D5;
}

#tableReturn{
height: 600px;
overflow: scroll;
}

#con{
	height: 1200px;
}
#bookReturnResult td{
	width: 32%;
}
</style>

</head>
<body>

	<input type="hidden"
		value="<sec:authentication var="memberId" property="principal.username"/>" />

	<!-- 헤더들어가는 곳 -->
	<jsp:include page="/WEB-INF/views/inc/top.jsp" />
	<!-- 헤더들어가는 곳 -->

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
						<li><a href="/book/admin/adminBookRental"><span>도서 대여</span><span class="more"><span class="state">에 대한 2차메뉴 닫힘</span><em class="ver"></em><em class="hor"></em></span></a></li>
						<li  class="on"><a href="/book/admin/adminBookReturn"><span>도서 반납</span><span class="more"><span class="state">에 대한 2차메뉴 닫힘</span><em class="ver"></em><em class="hor"></em></span></a></li>
						<li><a href="/book/admin/bookRequestList"><span>사용자 희망 도서</span><span class="more"><span class="state">에 대한 2차메뉴 닫힘</span><em class="ver"></em><em class="hor"></em></span></a></li>
					</ul>
				</nav>
			</div>

			<!-- left menu e -->
		</div>

		<div id="con">

			<div id="detail_con">
				<!-- content s -->
				<div id="container">

					<div style="height: 100px; text-align: center;"
						id="bookSearchInsert">
						<article>
							<br>
							<legend>Book Return</legend>
							<hr>
							<p>반납하실 Book_Code를 입력해주세요</p>
							<input type="text" name="bookCode" id="bookCode"> <br>
							<br>
							<button onclick="bookCodeSearch()" class="submit">검색</button>
							<br><br><hr><br>

						<div id="tableSearch">
							<table border="1" id="bookSearchResult">
							</table>
						</div>
							<br><hr><br>
							<div id="tableReturn">
								<table border="1" id="bookReturnResult">
								</table>
							</div>
						</article>
						<br><br><br><br><br><br><br><br>
					</div>
				</div><br>
	</section>

	<!-- 푸터들어가는 곳 -->
	<footer>
		<jsp:include page="/WEB-INF/views/inc/bottom.jsp" />
	</footer>
	<!-- 푸터들어가는 곳 -->

</body>
</html>
<!-- bottom e -->