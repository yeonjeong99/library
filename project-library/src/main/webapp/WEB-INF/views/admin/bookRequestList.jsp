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
<link href="/book/resources/css/sub/member.css" rel="stylesheet" type="text/css" />
<script src="/book/resources/script/jquery-3.3.1.min.js"></script>

 <script type="text/javascript">
var id = '<sec:authentication property="principal.username"/>';
var search = '';
var csrfHeaderName = '${_csrf.headerName}';
var csrfTokenValue = '${_csrf.token}';

function wishSave(e){
	var form = $(e).parent().parent().parent();
	
	console.log(form);
    var formData = new FormData('form========='+form);
    
    var formData = form.serialize();
    console.log('formData========='+formData);
    
  $.ajax({
		url: '/book/admin/bookRequestUpdate',
		data: formData,
		type: 'post',
		beforeSend : function (xhr) {
			xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
		},
		success: function(result){
			console.log('result========='+result);
			if(result==0){
				alert('수정이 실패했습니다.');
				return false;
			}
			alert('결과를 반영했습니다.');
			getListFunction(id, search);
			
		}
	});  
}

function showInsert(e){
	
  	if( $(e).parent().find('.hiddenDiv').css("display") == "none" ){
  		$(e).parent().find('.hiddenDiv').css('display', 'flex');
	}else if ( $(e).parent().find('.hiddenDiv').css("display") == "flex" ){
		$(e).parent().find('.hiddenDiv').css('display', 'none');
	}   
	
}

function countListFunction(id, search){
	var count;
	$.ajax({
		url: '/book/libRequest/bookRequestCount',
		data: {
			memberId: id,
			search: search,
			},
		async : false,
		beforeSend : function (xhr) {
			xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
		},
		type: 'post',
		success: function(result){
			count = result;
			
			console.log('count'+count);
		}
	});

	return count;
	
}

function getListFunction(id, search, num){
	console.log('검색 시작');
	
	var pageNum = 1;
	
	if (num >1){
		pageNum = num;
	}
	
	$.ajax({
		url: '/book/libRequest/bookRequestResult',
		data: {
				memberId: id,
				search: search,
				pageNum: pageNum
				},
		beforeSend : function (xhr) {
			xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
		},
		type: 'post',
		success: function(result){
			
			 // =========================================
		    // 페이지 블록 구하기 작업
		    // =========================================
		   	var allRowCount = countListFunction(id, search); // 전체 행 갯수
		    
		    var maxPage = allRowCount / 5 + (allRowCount % 5 == 0 ? 0 : 1);
		    // 1페이지 ~ maxPage 페이지까지 존재함.
		    // -> 페이지 블록단위로 끊어줌

		    // 시작페이지번호(1) 끝페이지번호(10)
		    // 1 2 3 4 5 6 7 8 9 10 -- [블록구성 10개]

		    // 시작페이지번호(11) 끝페이지번호(20)
		    // 11 12 13 14 15 16 17 18 19 20 -- [블록구성 10개]

		    // 시작페이지번호(21) 끝페이지번호(23)
		    // 21 22 23 -- [블록구성 3개]

		    // 한 페이지블록을 구성하는 페이지갯수
		    var pageBlockSize = 5;

		    // 시작페이지번호 구하기
		    var startPage = (parseInt((pageNum / pageBlockSize)) - (pageNum % pageBlockSize == 0 ? 1 : 0)) * pageBlockSize + 1;
		    // 끝페이지번호 구하기
		    var endPage = startPage + pageBlockSize - 1;
		    if (endPage > maxPage) { // 마지막 블록에서 끝페이지번호 구하기
		        endPage = maxPage;
		    }
		    console.log("allRowCount="+allRowCount);
			console.log("startPage="+startPage);
			console.log("endPage="+endPage);
			console.log(typeof result);
			console.log(result);
			var str = "";
			var stat= "";
			str+= " <li><div id='listHeader'><div class='title'>서명</div> <div class='author'>저자</div> <div>출판사</div> <div>서지번호</div>";
			str+= " <div>신청일</div>  <div>진행 상황</div> </div></li>";
			$.each(result, function(index, item) {
				var date = new Date(item.regDate);
				var formatDate =  date.getFullYear()+ "-" + (date.getMonth() + 1) + "-" +date.getDate() ;
				str += '<li><div class="listBody" onclick="showInsert(this)"><div class="title">'+item.bookTitle+'</div>';
				str += '<div class="author">'+item.bookAuthor+'</div>';
				str += '<div>'+item.bookPublisher+'</div>';
				str += '<div>'+item.isbn+'</div>';
				str += '<div>'+formatDate+'</div>';
				if (item.wishStatus==0){
					stat="신청중";
				} else if (item.wishStatus==1){
					stat="취소";
				} else if (item.wishStatus==2){
					stat="완료";
				} else if (item.wishStatus==3){
					stat="반려";
				}
		
				str += '<div>'+stat+'</div></div>';
				str +='<form class="saveForm">';
				str += '<div class="hiddenDiv"><div class="cause"><h6>신청사유</h6>'+item.wishCause+'</div>';
				if (item.wishResult!=""){
				str += '<div class="result">'+item.wishResult+'</div>';
				}else{
				
					str += '<input type="hidden" name="wishNo" value="'+item.wishNo+'">';
					str +='<div class="resultIns"><textarea rows="2" cols="50" name="wishResult"></textarea></div>';
					str +='<div><input type="radio" name=wishStatus  value="1" /> 취소<br>';
					str +='<input type="radio" name=wishStatus  value="2" /> 완료<br>';
					str +='<input type="radio" name=wishStatus  value="3" /> 반려</div>';
					str +='<div><button class="innerBtn" type="button" onclick="wishSave(this)">저장</button></div>';
					str +='<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">';
				}
				
				str +='</div></form>';

				str += '</li>';
			}); 
			
			var p = "";
           	
           	if(pageNum>5){
           	 	p += '<a onclick="getListFunction(&#39;'+id+'&#39;,&#39;'+search+'&#39;,'+(pageNum-5)+')">이전<a/>&nbsp;&nbsp;';
           	}
           	for (var i = startPage; i<=endPage; i++){
           		
           		 p += '<a onclick="getListFunction(&#39;'+id+'&#39;,&#39;'+search+'&#39;,'+i+')">';
           		if(pageNum==i){
           			p+= '<span style="color: blue; font-weight: bold;">'
           		}
           		 p+=''+i+'<a/>&nbsp;&nbsp;';
           	}
           	
        	if (maxPage>endPage){
           		p += '<a onclick="getListFunction(&#39;'+id+'&#39;,&#39;'+search+'&#39;,'+(pageNum+5)+')">다음<a/>&nbsp;&nbsp;';
           	}
   		 	$('#pageDiv').html(p);
			
			$('#wishListUl').html(str);
		}
	});
	
}

$(document).ready(function() {
	

/* if (id != 'admin'){
	alert('관리자 페이지입니다.')
	history.back();
} */
	
getListFunction(id, search);
	
});
</script>
<style type="text/css">
#container{
	width: 90%;
  color: #212529;
  text-align: center;
  margin: auto;
}
 #wishListUl li{
 	list-style: none;
 	
 }
 #listHeader div {
	  color: #495057;
	  background-color: #e9ecef;
	  border-color: #dee2e6;
	  border-bottom: 2px solid #dee2e6;
	  border-left: 2px solid white;
	  height: 50px;
 }
 .listBody div{
	  border-color: #dee2e6;
	  vertical-align: bottom;
	  border-bottom: 2px solid #dee2e6;
	  border-left: 2px solid white;
 }
 #listHeader, .listBody{
	display: flex;
 	flex-direction: row;
 }
 #listHeader{
 	cursor: default;
 }
.listBody{
	cursor: pointer;
}


 .listBody div,
  #listHeader div {
	flex: none;
	flex-basis: 12%;
 }
 
 .listBody .title,
  #listHeader .title{
	flex-basis: 27%;
 }
 
  .listBody .author,
  #listHeader .author{
	flex-basis: 19%;
 }

.hiddenDiv{
	display: none;
	flex-direction: row;
	height: 70px;
}


 .hiddenDiv .cause{
	flex-basis: 27%;
 }
 
  .hiddenDiv .result{
	flex-basis: 67.5%;
 }

  .hiddenDiv .resultIns{
	flex-basis: 43.2%;
 }
 
 .hiddenDiv div{
	flex: none;
	flex-basis: 12%;
	  border-color: #dee2e6;
	  vertical-align: bottom;
	  border-bottom: 2px solid #dee2e6;
	  border-left: 2px solid white;
	  background-color: #FAFAFA;
}
#buttonDiv{
	width: 90%;
	margin: auto;
	
}
	/* 버튼 부트스트랩 */
button{
  background:#1AAB8A;
  color:#fff;
  border:none;
  position:relative;
  height:50px;
  font-size:1.6em;
  padding:0 2em;
  cursor:pointer;
  transition:800ms ease all;
  outline:none;
  display: inline-block;
  margin-bottom: 25px;
  margin-left: 40px;
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


	/* 버튼 부트스트랩 */
.innerBtn{
  background:#1AAB8A;
  color:#fff;
  border:none;
  position:relative;
  height:30px;
  font-size:15px;
  padding:0 2em;
  cursor:pointer;
  transition:800ms ease all;
  outline:none;
  display: inline-block;
  margin-bottom: 25px;
  margin-left: 40px;
}
.innerBtn:hover{
  background:#fff;
  color:#1AAB8A;
}
.innerBtn:before,.innerBtn:after{
  content:'';
  position:absolute;
  top:0;
  right:0;
  height:2px;
  width:0;
  background: #1AAB8A;
  transition:400ms ease all;
}
.innerBtn:after{
  right:inherit;
  top:inherit;
  left:0;
  bottom:0;
}
.innerBtn:hover:before,.innerBtn:hover:after{
  width:100%;
  transition:800ms ease all;
}
/* 여기까지 */

textarea{
	resize: none;
	height: 80%;
	width: 95%;
}
#pageDiv{
	text-align: center;
	font-size: 25px;
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

	<script type="text/JavaScript">
<!--
function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}
//-->
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
						<li><a href="/book/admin/adminBookReturn"><span>도서 반납</span><span class="more"><span class="state">에 대한 2차메뉴 닫힘</span><em class="ver"></em><em class="hor"></em></span></a></li>
						<li class="on"><a href="/book/admin/bookRequestList"><span>사용자 희망 도서</span><span class="more"><span class="state">에 대한 2차메뉴 닫힘</span><em class="ver"></em><em class="hor"></em></span></a></li>
					</ul>
				</nav>
			</div>

			<!-- left menu e -->
		</div>

		<div id="con">

			<div id="detail_con">
				<!-- content s -->
		
<div id="buttonDiv">
<button onclick="getListFunction('admin', '')">전체</button>
<button onclick="getListFunction('admin', '0')">신청중</button>
<button onclick="getListFunction('admin', '1')">취소</button>
<button onclick="getListFunction('admin', '2')">완료</button>
<button onclick="getListFunction('admin', '3')">반려</button>
</div>

<br>
<div id="container">
	<ul id="wishListUl">
	
	</ul>
</div>

<br>

<div id="pageDiv">
</div>
				<br>
	</section>

	<!-- 푸터들어가는 곳 -->
	<footer>
		<jsp:include page="/WEB-INF/views/inc/bottom.jsp" />
	</footer>
	<!-- 푸터들어가는 곳 -->

</body>
</html>
<!-- bottom e -->