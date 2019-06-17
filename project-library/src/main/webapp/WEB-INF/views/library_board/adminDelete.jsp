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

		<script src="/book/resources/script/jquery-3.3.1.min.js"></script>

</head>
<body>

<!-- 헤더들어가는 곳 -->
<jsp:include page="/WEB-INF/views/inc/top.jsp"/>
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
	<div class="fix-layout">
		
	</div>
</div>


<section class="fix-layout">
	
	<div id="nav-left">
		<!-- left menu s -->
		
 <div id="side">
<nav class="sub_menu">
		<h2 class="sub_title" style="height: 100px;">열린마당<span>USER COMMUNITY</span></h2>

		<ul class="sm_2th">
			 <li class="on"><a href="<c:url value="/admin/filelist"/>"><span>공지사항</span><span class="more"><span class="state">에 대한 2차메뉴 닫힘</span><em class="ver"></em><em class="hor"></em></span></a></li>
			 <li ><a href="/book/questions"><span>자주하는질문</span><span class="more"><span class="state">에 대한 2차메뉴 닫힘</span><em class="ver"></em><em class="hor"></em></span></a></li>
			 <li ><a href="/book/admin/filelist" ><span>자유게시판</span><span class="more"><span class="state">에 대한 2차메뉴 닫힘</span><em class="ver"></em><em class="hor"></em></span></a></li>
			 <!-- <li><a href="" ><span>Q&A</span><span class="more"><span class="state">에 대한 2차메뉴 닫힘</span><em class="ver"></em><em class="hor"></em></span></a></li> -->
			   </ul>
	</nav>
</div>

 		<!-- left menu e -->
	</div>

	<div id="con">
		
		<div id="detail_con">	
			<!-- content s -->
			<!-- location1 -->
<ul id="location">
	<li>홈</li>
	<li>열린마당</li>
	<li>공지사항</li>
</ul>
<!-- /location1 -->

<h2>공지사항</h2>
					
					<!--inner -->
				</div>
				<!-- basic_box -->
				<form name="bbsForm" method="post" enctype="multipart/form-data" action="<c:url value="/admin/fileDelete"/>" >
				<input type="hidden" name='${_csrf.parameterName}' value='${_csrf.token}'>
				<input type="hidden" name="num" value="${param.num}">
				<input type="hidden" name="pageNum" value="${param.pageNum}"> 
				<table class="tstyle_write">
					<caption>제목, 작성자, 비밀번호, 공개/비공개 등 내용입력표입니다.</caption>
					<colgroup>
						<col width="25%">
						<col>
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">비밀번호</th>
							<td>
								<input class="wps_30" type="password" name="pass">
							</td>
						</tr>
					</tbody>
				</table>
				<div class="btn_set r">
					<input type="submit" value="삭제하기" class="blue">
					<input type="button" value="목록" class="btn_board" onclick="location.href='<c:url value="/admin/filelist';"/>">
				</div>
				</form>
			</div> <!--detail_wrap  -->
			
			<!-- 세션에 id값이 있으면 글쓰기 버튼이 보이게 설정 -->
		</div>
		
		<!-- wrap -->
	</section>
	<!-- 게시판 -->
	<!-- 본문들어가는 곳 -->
	<!-- 푸터들어가는 곳 -->
	<footer>
		<jsp:include page="/WEB-INF/views/inc/bottom.jsp" />
	</footer>
	<!-- 푸터들어가는 곳 -->
</body>
</html>