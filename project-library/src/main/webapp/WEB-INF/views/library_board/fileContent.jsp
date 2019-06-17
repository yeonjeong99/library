<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

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

<h2>자유게시판 </h2>


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
				
				<form name="frm">
					<table class="tstyle_view">
						<caption>작성자, 작성일시, 조회수 등 상세내용표입니다.</caption>
						<thead>
							<tr>
								<th>
									<p class="subject">${board.subject }</p>
									
								</th>
							</tr>
							
							<tr>
								<td class="rc">
								<%-- 	<span>
										<strong>게시글 번호</strong>
										${board.num}
									</span> --%>
									<span>
										<strong>작성일</strong>
										${board.regDate}
									</span>
									<span>
										<strong>작성자</strong>
										${board.name}
									</span>
									<span>
										<strong>조회수</strong>
										${board.readcount}
									</span>
								</td>
							</tr>
						</thead>
						<tbody>
						<c:if test="${not empty attachList}">
						<tr class="add_file">
							<td>
								<ul>
								<c:forEach var="attach" items="${attachList}">
									<li>
									<c:if test="${attach.filetype eq 'I'}">
											<a href="javascript:location.href='/book/board/download?fileName=${attach.uploadpath}/${attach.uuid}_' + encodeURIComponent('${attach.filename}')">
											<img src="/resources/images/center/p_png_s.gif">
											${attach.filename}
											</a>
										</c:if>
										<c:if test="${attach.filetype eq 'O'}">
											<a href="javascript:location.href='/book/board/download?fileName=${attach.uploadpath}/${attach.uuid}_' + encodeURIComponent('${attach.filename}')">
											<img src="/resources/images/center/p_etc_s.gif">
											${attach.filename}
											</a>
										</c:if>
									</li>
									</c:forEach>
								</ul>
								
							</td>
						</tr>
						</c:if>
							<tr>
								<td class="tb_contents">		
								<c:if test="${not empty attachList}">
								<c:forEach var="attach" items="${attachList}">
								<c:if test="${attach.filetype eq 'I'}">
								<img src="/book/upload/${attach.uploadpath}/s_${attach.uuid}_${attach.filename}" style="margin-bottom: 20px; ">
								</c:if>
								</c:forEach>
								</c:if>
								<br>
								${board.content}
								</td>
							</tr>
							
						</tbody>
					</table>
					<input type="hidden" name='${_csrf.parameterName}' value='${_csrf.token}'>
					<div class="btn_set r">
					      	<sec:authorize access = "isAuthenticated()">
					      	<sec:authentication var="memberId" property="principal.username"/>

							</sec:authorize>
					<c:if test="${memberId eq board.name}">												
						<input type="button" value="수정하기" class="btn_board" onclick="location.href='<c:url value="/board/fileModify?num=${board.num}&pageNum=${param.pageNum}';"/>">
						<input type="button" value="삭제하기" class="btn_board" onclick="location.href='<c:url value="/board/fileDelete?num=${board.num}&pageNum=${param.pageNum}';"/>">
					</c:if>
			      	<sec:authorize access="hasRole('ROLE_ADMIN')">
			      	<input type="button" value="수정하기" class="btn_board" onclick="location.href='<c:url value="/board/fileModify?num=${board.num}&pageNum=${param.pageNum}';"/>">
						<input type="button" value="삭제하기" class="btn_board" onclick="location.href='<c:url value="/board/fileDelete?num=${board.num}&pageNum=${param.pageNum}';"/>">
			      	
			      	</sec:authorize>
						<input type="button" value="목록" class="btn_board" onclick="location.href='<c:url value="/board/filelist';"/>">
						<%-- <input type="reset" value="삭제하기" class="btn_board" onclick="location.href='/board/delete?num=${board.num}&pageNum=${param.pageNum}';">
						<input type="button" value="목록" class="btn_board" onclick="location.href='/board/list?pageNum=${param.pageNum}';" > --%>
					</div> <!-- btn_set r -->
			</form>
			<!-- 세션에 id값이 있으면 글쓰기 버튼이 보이게 설정 -->
			<!-- 댓글 -->
			<jsp:include page="/WEB-INF/views/library_board/comment.jsp"/>
			</div><!--detail_wrap  -->
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