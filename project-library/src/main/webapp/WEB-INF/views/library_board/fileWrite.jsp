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

<script type="text/javascript">
	function doSubmit(form){
		if (document.bbsForm.chk_privacy.checked){
		}else{
			alert('개인정보 수집 및 이용 동의 확인해 주십시요.');
			return false;
		}
		
		if(document.bbsForm.subject.value == ""){
			alert('제목 입력해 주십시요.');
			document.bbsForm.subject.focus();
			return false;
		}
		
		if (document.bbsForm.pass.value == ""){
			alert('비밀번호 입력해 주십시요.');
			document.bbsForm.pass.focus();
			return false;
		}else{
			if(document.bbsForm.pass.value.length < 4){
				alert('비밀번호 4자 이상 입력해주세요.');
				document.bbsForm.pass.focus();
				return false;
			}
		}
	
		document.bbsForm.submit();
	}
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
			 <li ><a href="<c:url value="/admin/filelist"/>"><span>공지사항</span><span class="more"><span class="state">에 대한 2차메뉴 닫힘</span><em class="ver"></em><em class="hor"></em></span></a></li>
			 <li ><a href="/book/questions"><span>자주하는질문</span><span class="more"><span class="state">에 대한 2차메뉴 닫힘</span><em class="ver"></em><em class="hor"></em></span></a></li>
			 <li class="on"><a href="/book/board/filelist" ><span>자유게시판</span><span class="more"><span class="state">에 대한 2차메뉴 닫힘</span><em class="ver"></em><em class="hor"></em></span></a></li>
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
	<li>자유게시판</li>
</ul>
<!-- /location1 -->

<h2>자유게시판</h2>

<div class="basic_box type1">
	<div class="inner">
		<span class="icon icon12"></span>
		<b>자유게시판</b>
		<p>상업적인 광고성 글이나 불건전한 내용, 정치·종교적인 내용, 일방적인 비방이나 욕설 등은 예고없이 삭제되며, 건전한 게시판 문화와 홈페이지 운영을 위해 실명제로 운영되고 있음을 알려드립니다. <br />
		- 간단한 문의사항은 "자주하는 질문" 을 먼저 확인해주시기 바랍니다.  <br />
- <span class="red">본문 또는 첨부파일 내에 개인정보(주민등록번호, 성명, 연락처 등)가 포함 된 게시글은 예고없이 삭제되니 유의하시기 바랍니다.</span>  <br />
- <span class="red">개인정보를 포함하여 게시하는 경우에는 불특정 다수에게 개인정보가 노출되어 악용될 수 있으며, 특히 타인의 개인정보가 노출되는 경우에는 개인정보보호법에 따라 처벌받을 수 있음을 알려드립니다.</span> <br />
- 비밀번호 입력시 개인정보와 관련된 번호(주민번호, 휴대폰, 전화번호 등) 사용을 자제해주세요. </p>
	</div>
</div>
					<!--inner -->
				</div>
				<!-- basic_box -->
				<form name="bbsForm" method="post" enctype="multipart/form-data" action="<c:url value="/board/fileWrite"/>" >
				<input type="hidden" name='${_csrf.parameterName}' value='${_csrf.token}'>
				<div id="agree">
					<ul>
						<li class="sbul">· 개인정보의 수집 및 이용 목적
							<ul>
								<li class="ssbul">- 부산광역시립부전도서관 민원사무 처리를 위한 이용자의 신원 확인 업부에만
									이용.</li>
							</ul>
						</li>
						<li class="sbul">· 수집하려는 개인정보 항목
							<ul>
								<li class="ssbul">- 성명</li>
							</ul>
						</li>
						<li class="sbul">· 개인정보의 보유 및 이용 기간 : 게시 종료일까지
							<ul>
								<li class="ssbul">- 귀하는 개인정보 수집·이용에 동의하지 않으실 수 있습니다.(단,
									글쓰기를 위한 최소한의 정보인 필수정보 미입력시 글쓰기 불가)</li>
							</ul>
						</li>
					</ul>
				</div>
				<!--agree  -->
				<div class="r mg_b20">
					<input type="checkbox" name="chk_privacy" value="Y"> 개인정보
					수집 및 이용에 대해서 동의합니다.
				</div>
				<!-- r mg_b20 -->
				<table class="tstyle_write">
					<caption>제목, 작성자, 비밀번호, 공개/비공개 등 내용입력표입니다.</caption>
					<colgroup>
						<col width="25%">
						<col>
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">글쓴이</th>
							
							<td>
							<input type="hidden" value="<sec:authentication var="name" property="principal.member.name"/>">
							<input type="hidden" value="<sec:authentication var="id" property="principal.username"/>">
							<input class="wps_30" type="text" name="name"
								value="${id}" readonly="readonly"> 
								</td>
						</tr>
						
						<tr>
							<th scope="row">비밀번호</th>
							<td>
								<input class="wps_30" type="password" name="pass">
							</td>
						</tr>
						
						<tr>
							<th scope="row">첨부파일</th>
							<td>
								<input class="textBox_02" type="file" multiple="multiple" name="files">
								<br>
							</td>
						</tr>
							
						<tr>
							<th scope="row">제목</th>
							<td>
								<input type="text" name="subject" id="subject" class="wps_90">
							</td>
						</tr>
						
						<tr>
							<th scope="row">내용</th>
							<td>
								<input class="textBox_02" type="hidden" name="chkhtml" value="N">
								<textarea id="content" name="content" style="width:100%; height: 300px; border:1px solid #cccccc;"></textarea>
							</td>
						</tr>
					</tbody>
				</table>
				
				<div class="btn_set r">
					<input type="button" value="확인하기" class="blue" onclick="doSubmit()">
					<input type="reset" value="다시쓰기" class="btn_board">
					<input type="button" value="목록" class="btn_board" onclick="location.href='<c:url value="/board/filelist';"/>">
				</div>
				<input type="hidden" name="writer" value="<sec:authentication property="principal.username"/>">
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