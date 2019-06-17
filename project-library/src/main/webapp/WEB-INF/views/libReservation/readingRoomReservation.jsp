<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카페인 도서관</title>
<script type="text/javascript" src="<c:url value="/resources/script/jquery-3.3.1.min.js"/>"></script>

<style type="text/css">
#container{
	display: flex;
	width: 100%;
}
#gridDiv{
	width: 70%;
	display: grid;
	grid-template-columns: repeat(10, 1fr);
}
#sideDiv{
	width: 25%;
	text-align: center;
}
.desk{
	background-color: #F2F2F2;
	border: solid 1px;
	border-color: black;
	border-radius: 0.5em;
	margin-right: 15px;
	margin-left: 15px;
	margin-bottom: 10px;
	margin-top: 10px;
	text-align: center;
	cursor: pointer;
}

.desk.red{
	background-color: #FA5858;
	pointer-events: none;
}

.desk.green{
	background-color: #2ecc71;
}

h2{
	cursor: pointer;
}

#noticeTable{
	padding-top: 100px;
	padding-left: 100px;
	padding-bottom: 100px;
}

#noticeTable td{
    padding-bottom: 30px;
    padding-right: 30px;
}
.notice{
	border: solid 1px;
	border-color: black;
	border-radius: 0.5em;
	width: 100px;
	height: 60px;
}
#notice1{
	background-color: #F2F2F2;
}

#notice2{
	background-color: #FA5858;
}

#notice3{
	background-color: #2ecc71;
}

/* 버튼 부트스트랩 */
button{
  background:#1AAB8A;
  color:#fff;
  border:none;
  position:relative;
  height:60px;
  font-size:1.6em;
  padding:0 2em;
  cursor:pointer;
  transition:800ms ease all;
  outline:none;
  display: block;
  margin-left: 100px;
  margin-bottom: 25px;
}
button:hover{
  background:#fff;
  color:#1AAB8A;
}
button:before,button:after{
  content:'';
  position:absolute;
  top:0;
  right:0;
  height:2px;
  width:0;
  background: #1AAB8A;
  transition:400ms ease all;
}
button:after{
  right:inherit;
  top:inherit;
  left:0;
  bottom:0;
}
button:hover:before,button:hover:after{
  width:100%;
  transition:800ms ease all;
}
/* 여기까지 */
</style>
<script type="text/javascript">
var id = '<sec:authentication property="principal.username"/>';
var csrfHeaderName = '${_csrf.headerName}';
var csrfTokenValue = '${_csrf.token}';


function extensionTime(){
	var count = 0;
	$.ajax({
		url: '/book/libReservation/extensionTime',
		type: 'post',
		async : false,
		data: {
			memberId: id
			},
		beforeSend : function (xhr) {
			xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
		},
		success: function(result){
			count = result;
		}
	});
	
	return count;
}

function memberReadingRoom(){
	$.ajax({
		url: '/book/libReservation/memberReadingRoom',
		type: 'post',
		data: {
			memberId: id
			},
		beforeSend : function (xhr) {
			xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
		},
		success: function(result){
			var str = "";
			if (result==0){
				str += "<button  onclick='deskResrv()'>이용 신청</button>";
			}else{
				str += "<button  onclick='extesionDesk()'>이용 연장</button>";
			}
			$('#btnDiv').html(str);
		}
	});
}

function extesionDesk(){
	var count = extensionTime();
	
	if (count==0){
		alert('연장은 한번만 허용합니다.');
		return false;
	}
	console.log(id);
	$.ajax({
		url: '/book/libReservation/extesionDesk',
		type: 'post',
		data: {
			memberId: id
			},
		beforeSend : function (xhr) {
			xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
		},
		success: function(result){
			alert('사용 시간을 2시간 연장했습니다.');
			readingRoom();
			memberReadingRoom();
		}
	});
}


function addClass(e){
	$('#gridDiv').find('.green').removeClass('green');
	$(e).toggleClass("green");
}

function readingRoom(status){
	console.log('새로고침');
	console.log(status);
	$.ajax({
		url: '/book/libReservation/readingRoomReservation',
		type: 'post',
		beforeSend : function (xhr) {
			xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
		},
		success: function(result){
			var str = "";
			$.each(result, function(index, item) {
				if (item.deskStatus>0){
					str += "<div class='desk red'>";
				}else if(status==item.deskNo){
					str += "<div class='desk green'>";
				}else{
					str += "<div class='desk' onclick='addClass(this)'>";
				}
				str += "<input type='hidden' name='deskNo' value='"+item.deskNo+"'>";
				str += "<h3>"+item.deskNo+"번</h3>";
				str += "</div>";
				
				
			});
			$('#gridDiv').html(str);
		}
	});
}


function deskResrv(){ 
	var deskNo = 0;

	if ($('.green').find('input[name=deskNo]').val() != undefined){
		deskNo = $('.green').find('input[name=deskNo]').val();
	}
	
	console.log(deskNo);
	if(deskNo==0){
		alert('좌석을 먼저 선택해주세요');
		return false;
	}
	
	 if(confirm(deskNo+'번 좌석 이용 신청 하시겠습니까?')){
	 	$.ajax({
			url: '/book/libReservation/deskReservation',
			data: {
					memberId: id,
					deskNo: deskNo
					},
			type: 'post',
			beforeSend : function (xhr) {
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			},
			success: function(result){
				console.log("result:::: "+result);
				if(result==0){
					alert('좌석 신청이 실패하셨습니다.');
					return false;
				}
				
				alert(id+'님 '+deskNo+'번 좌석을 신청하셨습니다.');
				//commentFunction(id);
				readingRoom();
				memberReadingRoom();
			}
		}); 
	}else{
		return false;
	} 
	
}

	$(document).ready(function(){
		
		readingRoom(status);
		memberReadingRoom();
		
		setInterval(function(){
			var status = $('.green').find('input[name=deskNo]').val();
			
			readingRoom(status);
			memberReadingRoom();
			
		}, 10000);

		
	});
</script>
</head>

<body<%-- onselectstart="return false" oncontextmenu='return false' --%> >
<!-- 헤더들어가는 곳 -->
<jsp:include page="/WEB-INF/views/inc/top.jsp"/>
<!-- 헤더들어가는 곳 -->



<div id="container">
<div id="gridDiv">
</div>

<div id="sideDiv">
<table id="noticeTable">
<tr><td>
<div class="notice" id="notice1"></div>
</td><td>
<h3 class="noticeH">이용 가능</h3>
</td></tr>
<tr><td>
<div class="notice" id="notice2"></div>
</td><td>
<h3 class="noticeH">이용 중</h3>
</td></tr>
<tr><td>
<div class="notice" id="notice3"></div>
</td><td>
<h3 class="noticeH">선택</h3>
</td></tr>
</table>
<div id="btnDiv">

</div>
</div>
</div>
<!-- 푸터들어가는 곳 -->
<jsp:include page="/WEB-INF/views/inc/bottom.jsp"/>
<!-- 푸터들어가는 곳 -->
</body>
</html>