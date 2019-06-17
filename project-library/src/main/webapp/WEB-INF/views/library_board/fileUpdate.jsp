<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <title>희망과 꿈이 있는 부전도서관</title>
 
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
<script>
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
	
	
	$(document).ready(function () {
	/* 	$('button#btn').on('click', function () {
			$('div#newUploadFiles').append('<input type="file" name="newFiles" multiple="multiple"><br>');
		});  */
		
		$('span#del').on('click', function () {
			var $li = $(this).closest('li');
			
			$li.children('input[type="hidden"]').attr('name', 'delFiles');
//			$td.children('td#deltd').remove();
			$li.children('div.attach-item').remove();
			
//	 		var a = $li.children('input[type="hidden"]').data('del');
//	 		alert(a);
		});
		
		$('form#bbsForm').on('submit', function (e) {
			e.preventDefault();
			
			$('input[name="oldFiles"]').each(index, function() {
				
			});
		});
		
	});
</script>
<body>
	<!-- 헤더들어가는 곳 -->
	<jsp:include page="/WEB-INF/views/inc/top.jsp" />

	<!-- 헤더들어가는 곳 -->
	
	
	<div id="sub_visual" class="sub_img07">
		<div class="fix-layout">
			<h2>
				<img src="/resources/images/icon2.png">
			</h2>
		</div>
	</div>
	<!-- 본문들어가는 곳 -->
	<section class="fix-layout">
		<!-- 메인이미지 -->
		<!-- 메인이미지 -->
		<div id="nav_left">
			<!-- 왼쪽메뉴 -->
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
			<!-- side -->
			<!-- 왼쪽메뉴 -->
		</div>
		<!-- nav_left -->
		<!-- 게시판 -->
		<div id="wrap">
			<div id="detail_wrap">
				<h1>
					자유게시판
					<%-- [전체글개수: ${pageInfoMap.allRowCount}] --%>
				</h1>

				<div class="basic_box">
					<div class="inner">
						<span class="icon"></span> <b>자유게시판</b>
						<p>
							상업적인 광고성 글이나 불건전한 내용, 정치·종교적인 내용, 일방적인 비방이나 욕설 등은 예고없이 삭제되며, 건전한
							게시판 문화와 홈페이지 운영을 위해 실명제로 운영되고 있음을 알려드립니다. <br> - 간단한 문의사항은
							"자주하는 질문" 을 먼저 확인해주시기 바랍니다. <br> -<span class="red">본문
								또는 첨부파일 내에 개인정보(주민등록번호, 성명, 연락처 등)가 포함 된 게시글은 예고없이 삭제되니 유의하시기
								바랍니다.</span> <br> - <span class="red"> 개인정보를 포함하여 게시하는 경우에는
								불특정 다수에게 개인정보가 노출되어 악용될 수 있으며, 특히 타인의 개인정보가 노출되는 경우에는 개인정보보호법에
								따라 처벌받을 수 있음을 알려드립니다.</span> <br> - 비밀번호 입력시 개인정보와 관련된 번호(주민번호,
							휴대폰, 전화번호 등) 사용을 자제해주세요.
						</p>
					</div>
					
					
					<!--inner -->
				</div>
				<!-- basic_box -->
				<form name="bbsForm" method="post" enctype="multipart/form-data" action="<c:url value="/board/fileModify"/>" >
				<input type="hidden" name='${_csrf.parameterName}' value='${_csrf.token}'>
				<input type="hidden" name="num" value="${param.num}">
				<input type="hidden" name="pageNum" value="${param.pageNum}"> 
			
			
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
							<input type="hidden" value="<sec:authentication var="name" property="principal.username"/>">
							
							<input class="wps_30" type="text" name="name"
								value="${board.name}" readonly="readonly"> 
								</td>
						</tr>
						
						<tr>
							<th scope="row">비밀번호</th>
							<td>
						      	<sec:authorize access="hasRole('ROLE_ADMIN')"><input class="wps_30" type="password" name="pass" value="${board.pass}"></sec:authorize>
							   	<sec:authorize access="!hasRole('ROLE_ADMIN')"><input class="wps_30" type="password" name="pass"></sec:authorize>
							</td>
						</tr>
						
						<tr>
							<th scope="row">첨부파일</th>
							<td>
								<input type="file" name="newFiles" multiple="multiple">
					
								<br>
							</td>
						</tr>
							
						<tr>
							<th scope="row">제목</th>
							<td>
								<input type="text" name="subject" id="subject" class="wps_90" value="${board.subject}">
							</td>
						</tr>
						<c:if test="${not empty attachList}">
						<tr>
							<th scope="row">파일</th>
							<td class="deltd">
							<ul>
							<c:forEach var="attach" items="${attachList}">
							<li>
								<div class="attach-item">
								<c:if test="${attach.filetype eq 'I'}">
									<img src="/resources/images/center/p_png_s.gif">
								</c:if>
								<c:if test="${attach.filetype eq 'O'}">
									<img src="/resources/images/center/p_etc_s.gif">
								</c:if>
								${attach.filename}
								<span id="del" style="color: red; font-weight: bold;">X</span>
								</div>
								<input type="hidden" name="oldFiles" value="${attach.uploadpath}/${attach.uuid}_${attach.filename}">
							</li>
							</c:forEach>
							</ul>
							</td>
							<!-- <td id="newUploadFiles"></td> -->
						</tr>
						</c:if>
						<tr>
							<th scope="row">내용</th>
							<td>
								<input class="textBox_02" type="hidden" name="chkhtml" value="N">
						<%-- 		<c:if test="${not empty attachList}">
								<c:forEach var="attach" items="${attachList}">
								<c:if test="${attach.filetype eq 'I'}">
								<img src="/book/upload/${attach.uploadpath}/s_${attach.uuid}_${attach.filename}" style="margin-bottom: 20px; ">
								</c:if>
								</c:forEach>
								</c:if> --%>
								
								<textarea id="content" name="content" style="width:100%; height: 300px; border:1px solid #cccccc; text-align: left;">${board.content}</textarea>
							</td>
						</tr>
					</tbody>
				</table>
				
				<div class="btn_set r">
				<input type="submit" value="파일글수정" class="blue">
					<input type="reset" value="다시쓰기" class="btn_board">
					<input type="button" value="목록" class="btn_board" onclick="location.href='<c:url value="/board/filelist';"/>">
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