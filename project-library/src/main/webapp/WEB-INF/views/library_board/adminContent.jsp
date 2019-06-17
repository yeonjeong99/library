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

		<link href="<c:url value="/resources/css/freeBoard.css"/>" rel="stylesheet" type="text/css">

		<script src="/book/resources/script/jquery-3.3.1.min.js"></script>
		<script type="text/javascript">
		</script>
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
				
				<form name="frm">
					<table class="tstyle_view">
						<caption>작성자, 작성일시, 조회수 등 상세내용표입니다.</caption>
						<thead>
							<tr>
								<th>
									<p class="subject">${adminboard.subject }</p>
									
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
										${adminboard.regDate }
									</span>
									<span>
										<strong>작성자</strong>
										${adminboard.name }
									</span>
									<span>
										<strong>조회수</strong>
										${adminboard.readcount }
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
											<a href="javascript:location.href='/book/admin/download?fileName=${attach.uploadpath}/${attach.uuid}_' + encodeURIComponent('${attach.filename}')">
											<img src="/resources/images/center/p_png_s.gif">
											${attach.filename}
											</a>
										</c:if>
										<c:if test="${attach.filetype eq 'O'}">
											<a href="javascript:location.href='/book/admin/download?fileName=${attach.uploadpath}/${attach.uuid}_' + encodeURIComponent('${attach.filename}')">
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
								${adminboard.content}
								</td>
							</tr>
							
						</tbody>
					</table>
					<input type="hidden" name='${_csrf.parameterName}' value='${_csrf.token}'>
					<sec:authorize access="hasRole('ROLE_ADMIN')" var="isAdmin">
					<c:if test = "${isAdmin eq true }">
					<div class="btn_set r">												
						<input type="button" value="수정하기" class="btn_board" onclick="location.href='<c:url value="/admin/fileModify?num=${adminboard.num}&pageNum=${param.pageNum}';"/>">
						<input type="button" value="삭제하기" class="btn_board" onclick="location.href='<c:url value="/admin/fileDelete?num=${adminboard.num}&pageNum=${param.pageNum}';"/>">
						<input type="button" value="목록" class="btn_board" onclick="location.href='<c:url value="/admin/filelist';"/>">
						<%-- <input type="reset" value="삭제하기" class="btn_board" onclick="location.href='/admin/delete?num=${board.num}&pageNum=${param.pageNum}';">
						<input type="button" value="목록" class="btn_board" onclick="location.href='/admin/list?pageNum=${param.pageNum}';" > --%>
					</div> <!-- btn_set r -->
					</c:if>
					</sec:authorize>
			</form>
			<!-- 세션에 id값이 있으면 글쓰기 버튼이 보이게 설정 -->
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