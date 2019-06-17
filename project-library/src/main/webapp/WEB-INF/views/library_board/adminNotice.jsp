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
			 <li ><a href="/book/board/filelist" ><span>자유게시판</span><span class="more"><span class="state">에 대한 2차메뉴 닫힘</span><em class="ver"></em><em class="hor"></em></span></a></li>
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


<form name="search" method="get" style="margin:0px">
<input type=hidden name="pagetype" value="">
<input type=hidden name="pageno" value="1">
<input type=hidden name="bbsid" value="6200">
<input type=hidden name="cafeid" value="">
<input type=hidden name="ref_code" value="">
<input type=hidden name="qstr" value="&m1=07&m2=04&m3=&bbsid=6200&cafeid=&ref_code=">
<input type=hidden name="m1" value="07">
<input type=hidden name="m2" value="04">	
		<div>
					<div id="total">
						<span>Total : ${pageInfoMap.allRowCount}</span>
					</div>

					<div class="table_search">
						<form action="/book/admin/filelist" method="get">
							<input type="text" name="search" class="input_box"
								value="${search}" placeholder="검색어를 입력하세요."> 
								<input type="submit" value="검색" class="btnwriter">
						</form>
					</div>
				</div>
					<table id="notice">
					<tr>
						<th class="tno">번호</th>
						<th class="ttitle">제목</th>
						<th class="twrite">글쓴이</th>
						<th class="tdate">날짜</th>
						<th class="tread">조회수</th>
					</tr>
					<c:choose>
						<c:when test="${not empty list}">
							<%-- pageInfoMap.allRowCount gt 0 --%>
							<%-- 
		*forEach 반복할때마다 pageScope 영역객체에 저장
		pageContext.setAttribute("board", list 요소 한개); 
	--%>
							<c:forEach var="adminboard" items="${list}">
								<tr>
									<td>${adminboard.num}</td>
									<td class="left"
										onclick="location.href='/book/admin/fileDetail?num=${adminboard.num}&pageNum=${pageInfoMap.pageNum}'"
										id="subject" style="cursor: pointer"><c:if
											test="${adminboard.reLev gt 0}">
											<!-- 답글일때 -->
											<c:set var="wid" value="${adminboard.reLev * 10}" />
											<%-- 답글 들여쓰기 레벨 값 저장용 --%>
											<img src="/images/center/level.gif"
												style="width: ${wid}px; height: 13px;">
											<img src="/images/center/re.gif">
										</c:if> ${adminboard.subject}</td>
									<td class="twrite">${adminboard.name}</td>
									<td class="tdate"><fmt:formatDate value="${adminboard.regDate}"
											pattern="yyyy.MM.dd" /></td>
									<td class="tread">${adminboard.readcount}</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="5">게시판 글 없음</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</table>
				<div class=table_search>
					<form>
					<sec:authorize access="hasRole('ROLE_ADMIN')" var="isAdmin">
						<c:if test = "${isAdmin eq true }">
							<input type="button" value="글쓰기" class="btnwriter"
								onclick="location.href = '/book/admin/fileWrite';">
								</c:if>
						</sec:authorize>
					</form>
				</div>
			</div>
			<!-- 세션에 id값이 있으면 글쓰기 버튼이 보이게 설정 -->

			<div class="clear"></div>
			<div id="page_control">
				<c:if test="${pageInfoMap.allRowCount gt 0}">
					<!-- 이전 블록이 존재하는지 확인 -->
					<c:if test="${pageInfoMap.startPage gt pageInfoMap.pageBlockSize}">
						<a
							href="/book/admin/filelist?pageNum=${pageInfoMap.startPage - pageInfoMap.pageBlockSize}&search=${search}">이전</a>
					</c:if>

					<c:forEach var="i" begin="${pageInfoMap.startPage}"
						end="${pageInfoMap.endPage}" step="1">
						<c:choose>
							<c:when test="${i eq pageInfoMap.pageNum}">
								<a href="/book/admin/filelist?pageNum=${ i }&search=${search}"><span
									style="color: red; font-weight: bold;">${ i }</span></a>
							</c:when>
							<c:otherwise>
								<a href="/book/admin/filelist?pageNum=${ i }&search=${search}">${ i }</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>

					<!-- 다음 블록이 존재하는지 확인 -->
					<c:if test="${pageInfoMap.endPage lt pageInfoMap.maxPage}">
						<a
							href="/book/admin/filelist?pageNum=${pageInfoMap.startPage + pageInfoMap.pageBlockSize}&search=${search}">다음</a>
					</c:if>
				</c:if>
			</div>
		</div>
	</section>
	
			<!-- content e -->
		</div>
	</div>
	<p class="clr"></p>
</section>

<!-- 푸터들어가는 곳 -->
	<footer>
		<jsp:include page="/WEB-INF/views/inc/bottom.jsp" />
	</footer>
	<!-- 푸터들어가는 곳 -->

</body>
</html><!-- bottom e -->