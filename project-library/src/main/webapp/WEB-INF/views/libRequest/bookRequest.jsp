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

<script src="<c:url value="/resources/script/jquery-3.3.1.min.js"/>"></script>
<script type="text/javascript">
function bookSearchWindow() {
   
   // 현재 창 기준으로 새 창 열기
   var childWindow = window.open('/book/libRequest/bookRequestSearch', '', 'width=1200,height=700');
}
</script>
<style type="text/css">
   /* 버튼 부트스트랩 */
button{
  background:#1AAB8A;
  color:#fff;
  border:none;
  position:relative;
  height:35px;
  font-size:20px;
  padding:0 2em;
  cursor:pointer;
  transition:800ms ease all;
  outline:none;
  display: inline-block;
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
#reqTable {
     width: 70%;
     color: #212529;
     margin: 50px 50px;
}

#reqTable th {
     color: #495057;
     background-color: #e9ecef;
     border-color: #dee2e6;
     vertical-align: bottom;
     border-bottom: 2px solid #dee2e6;
}

#reqTable th,
#reqTable td {
     padding: 0.75rem;
     vertical-align: top;
     border-top: 1px solid #dee2e6;
}


h3{
display: inline-block;
margin-right: 30px;
}

#headerDiv{
width: 70%;
margin: auto;
text-align: center;
}
#footerDiv{ 
width: 70%;
margin: auto;
text-align: right;
margin-left: 30px;
}
.roDiv{
   border: none;
   cursor: default;
   width: 100%;
   height: 100%;
}
#cause{
   width: 100%;
   height: 100%;
   border-color: #e9ecef;
}
</style>

</head>
<body>
      	<sec:authorize access = "isAuthenticated()">
		   <input type="hidden"
		      value="<sec:authentication var="memberId" property="principal.username"/>" />
  			</sec:authorize>
   <!-- 헤더들어가는 곳 -->
   <jsp:include page="/WEB-INF/views/inc/top.jsp" />
   <!-- 헤더들어가는 곳 -->

   <div id="skipNavi">

      <a href="#detail_con">본문 바로가기</a>

   </div>

   <script type="text/javascript">
   
   function requestCheck(){
   		var form = document.frm;
   		console.log(form);
   		
   		if($('input[name=bookTitle]').val()==""){
   			alert('내용을 입력하세요');
   			return false;
   		}
    
   		form.submit();

   }
   
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
                  자료 찾기<span>USER COMMUNITY</span>
               </h2>

               <ul class="sm_2th">
               
                  <sec:authorize access = "isAuthenticated()">
                  <li><a href="/book/libRequest/bookRequest"><span>구매 희망 도서 신청</span><span class="more"><span class="state">에 대한 2차메뉴 닫힘</span><em class="ver"></em><em class="hor"></em></span></a></li>
                  </sec:authorize>
                  
                  <li><a href="/book/bookSearch/booklistSearch"><span>도서 검색</span><span class="more"><span class="state">에 대한 2차메뉴 닫힘</span><em class="ver"></em><em class="hor"></em></span></a></li>
                  <!-- <li><a href="" ><span>Q&A</span><span class="more"><span class="state">에 대한 2차메뉴 닫힘</span><em class="ver"></em><em class="hor"></em></span></a></li> -->
               </ul>
            </nav>
         </div>

         <!-- left menu e -->
      </div>
      <div id="con">
         <div id="detail_con">

            <sec:authorize access="isAnonymous()">
             잘못들어왔어
         </sec:authorize>

         <div id="container">
<div id="headerDiv">
<h3>도서 검색을 먼저 하세요</h3>
<button type="button" onclick="bookSearchWindow()">도서 검색</button>
</div>
<form action="<c:url value="/libRequest/bookRequest"/>" name="frm" method="post">
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
<input type="hidden" name="memberId" value="<sec:authentication property="principal.username"/>">
<table id="reqTable">
<tr><th scope="row">제목</th><td><input type="text" name="bookTitle" class="roDiv" readonly></td></tr>
<tr><th scope="row">저자</th><td><input type="text" name="bookAuthor" class="roDiv" readonly></td></tr>
<tr><th scope="row">출판사</th><td><input type="text" name="bookPublisher" class="roDiv" readonly></td></tr>
<tr><th scope="row">발행년도</th><td><input type="text" name="date" class="roDiv" readonly></td></tr>
<tr><th scope="row">ISBN</th><td><input type="text" name="isbn" class="roDiv" readonly></td></tr>
<tr><th scope="row">사유</th><td><input type="text" name="wishCause" id="cause"></td></tr>
</table>
<div id="footerDiv">
<button type="button" onclick="requestCheck()">신청</button>
</div>
</form>
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