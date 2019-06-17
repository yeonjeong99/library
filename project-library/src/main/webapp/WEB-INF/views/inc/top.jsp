<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <!-- 헤더가 들어가는 곳 -->
<header>
  <!-- Bootstrap core CSS -->
  <link href="<c:url value="/resources/css/bootstrap.min.css"/>" rel="stylesheet" type="text/css">

  <!-- Custom styles for this template -->
  <link href="<c:url value="/resources/css/modern-business.css"/>" rel="stylesheet" type="text/css">
  	
</header>
<body>
  <!-- Bootstrap core JavaScript -->
  <script src="<c:url value="/resources/js/jquery.min.js" />"></script>
  <script src="<c:url value="/resources/js/bootstrap.bundle.min.js" />"></script>
  
  <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <a class="navbar-brand" href="<c:url value="/"/>">Library</a>
      <div style="color: white;">
      	<sec:authorize access = "isAuthenticated()">
      	<sec:authentication var="memberId" property="principal.username"/>
		${memberId}님 접속 &nbsp;&nbsp;<a onclick="noticeWindow()">알림</a>
		</sec:authorize>
	</div>
	
	<button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
	
      <div class="collapse navbar-collapse" id="navbarResponsive">
      <ul class="navbar-nav ml-auto"><br>
      	<li>
	   		<sec:authorize access = "isAnonymous()">
		 		<a class="nav-link" href=" <c:url value="/member/login"/> ">로그인</a>
			</sec:authorize>
		</li>
	      	<br>
	      	<li>
			   <sec:authorize access = "isAnonymous()">
     				 <a class="nav-link" href="<c:url value="/member/join"/>">신규회원가입</a>
   				</sec:authorize>
   			</li>
   			<li>
	   			<sec:authorize access = "isAuthenticated()">
		      		<a class="nav-link" href="javascript:document.getElementById('logoutForm').submit();">로그아웃</a>
		      		<form action="<c:url value="/member/logout"/>" method="post" id="logoutForm">
		      			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		      		</form>
	   			</sec:authorize>
   			</li><br/>
          	<li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownPortfolio" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
             	 도서관 소개
            </a>
            
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio">
              <a class="dropdown-item" href="<c:url value="/greeting"/>">인사말</a>
              <a class="dropdown-item" href="<c:url value="/history"/>">연혁</a>
              <a class="dropdown-item" href="<c:url value="/organizationalStatus"/>">조직 현황</a>
              <a class="dropdown-item" href="<c:url value="/assignedTask"/>">담당 업무 안내</a>
              <a class="dropdown-item" href="<c:url value="/facilityStatus"/>">시설 현황</a>
              <a class="dropdown-item" href="<c:url value="/collectiveData"/>">소장 자료 현황</a>
              <a class="dropdown-item" href="<c:url value="/directions"/>">오시는 길</a>
            </div>
         	 </li><br>
          	<li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownPortfolio" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
             	 도서관 이용
            </a>
            
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio">
              <a class="dropdown-item" href="<c:url value="/hoursOfUse"/>">이용 시간</a>
              <a class="dropdown-item" href="<c:url value="/referenceLibrary"/>">자료실 소개</a>
              <a class="dropdown-item" href="<c:url value="/bookMembership"/>">도서 회원 가입</a>
              <a class="dropdown-item" href="<c:url value="/outsideLoan"/>">자료 이용 안내</a>
              <a class="dropdown-item" href="<c:url value="/libReservation/readingRoomReservation"/>">열람실 신청</a>
              <a class="dropdown-item" href="<c:url value="/amenities"/>">편의 시설</a>
            </div>
          	</li>
          	
          	<br>
          	
			<li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownPortfolio" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              	자료 찾기
            </a>
            
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio">
            
              <sec:authorize access = "isAuthenticated()">
              <a class="dropdown-item" href="<c:url value="/libRequest/bookRequest"/>">구매희망도서신청</a>
              </sec:authorize>
              
              <%-- <a class="dropdown-item" href="<c:url value="/newBook"/>">새로 들어온 책</a> --%>
              <a class="dropdown-item" href="<c:url value="/bookSearch/booklistSearch"/>">도서 검색</a>

            </div>
          </li><br>
          
          
			<li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownPortfolio" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
             	열린 마당
            </a>
            
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio">
              <a class="dropdown-item" href="<c:url value="/admin/filelist"/>">공지 사항</a>
              <a class="dropdown-item" href="<c:url value="/questions"/>">자주하는 질문</a>
              <a class="dropdown-item" href="<c:url value="/board/filelist"/>">자유 게시판</a>
              <%-- <a class="dropdown-item" href="<c:url value="/board/list"/>">Q&A</a> --%>
            </div>
          </li>
          
          <br>
          
          <sec:authorize access = "isAuthenticated()">
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownPortfolio" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            	마이 페이지
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio">
            
              <a class="dropdown-item" href="<c:url value="/libRequest/bookRequestResult"/>">내 희망도서 신청정보</a>
              <a class="dropdown-item" href="<c:url value="/member/myView?id=${memberId}"/>">내 정보</a>
              
              <!-- get 방식  -->
              <%-- ?id=${memberId} --%>
              
              <!-- post로 아이디 넘기기 -->
              <%-- <a href="javascript:document.getElementById('frm').submit()"></a>
              <form action="/book/member/myView" id="frm" method="post">
              	<input type="hidden" name="id" value="${memberId}">
              </form> --%> 
              
              <a class="dropdown-item" href="<c:url value='/member/memberInfoUpdate'/>">회원정보수정</a>
            </div>
          </li>
          </sec:authorize>
          
          <br>
          
               <sec:authorize access="hasRole('ROLE_ADMIN')" var="isAdmin"/>
   			   <c:if test = "${isAdmin eq true }">
                    <li class="nav-item dropdown">
	   				<sec:authorize access = "isAuthenticated()">
	   				<a class="nav-link dropdown-toggle" href="#" id="navbarDropdownPortfolio" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	   				관리자 페이지
	   				</a>
	   				<div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio">
		            <a class="dropdown-item" href="<c:url value="/admin/adminMemberList"/>">회원 리스트</a>
		            <a class="dropdown-item" href="<c:url value="/admin/adminBookRental"/>">도서 대여</a>
		            <a class="dropdown-item" href="<c:url value="/admin/adminBookReturn"/>">도서 반납</a>
		                          <a class="dropdown-item" href="<c:url value="/admin/bookRequestList"/>">사용자 희망도서</a>
            		</div>
					</sec:authorize>
					 </li>
				</c:if>

          
          </ul>
          </div>
          </div>
          </nav>
          
<script src="<c:url value="/resources/script/jquery-3.3.1.min.js"/>"></script>
<script type="text/javascript">
function noticeWindow() {
	// 현재 창 기준으로 새 창 열기
	var childWindow = window.open('/book/noticeBoard/notifyform?memberId=${memberId}', '', 'width=800,height=500');
}
</script>
</body>