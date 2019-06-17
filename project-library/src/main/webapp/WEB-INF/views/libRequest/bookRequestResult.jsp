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
			var id = '<sec:authentication property="principal.username"/>';
			var csrfHeaderName = '${_csrf.headerName}';
			var csrfTokenValue = '${_csrf.token}';

		function cancel(num){
			$.ajax({
				url: '/book/libRequest/bookRequestCancel',
				data: {wishNo: num},
				type: 'post',
				beforeSend : function (xhr) {
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
				},
				success: function(result){
					if(result==0){
						alert('수정이 실패했습니다.');
						return false;
					}
					alert('신청을 취소하셨습니다.');
					getListFunction(id);
				}
			});
		}

		function countListFunction(id){
			var count;
			$.ajax({
				url: '/book/libRequest/bookRequestCount',
				data: {
					memberId: id
					},
				async : false,
				beforeSend : function (xhr) {
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
				},
				type: 'post',
				success: function(result){
					count = result;
// 					console.log('count'+count);
				}
			});
			return count;
}
		
		function getListFunction(id, num){
			var memberId = id;
// 			console.log("맴버아이디"+memberId);
			var pageNum = 1;
			if (num >1){
				pageNum = num;
			}
			$.ajax({
				url: '/book/libRequest/bookRequestResult',
				data: {memberId: memberId,
					pageNum: pageNum	
				},
				type: 'post',
				beforeSend : function (xhr) {
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
				},
				success: function(result){
// 					console.log(typeof result);
					var allRowCount = countListFunction(id); // 전체 행 갯수
				    var maxPage = allRowCount / 5 + (allRowCount % 5 == 0 ? 0 : 1);
				    var pageBlockSize = 5;
				    var startPage = (parseInt((pageNum / pageBlockSize)) - (pageNum % pageBlockSize == 0 ? 1 : 0)) * pageBlockSize + 1;
				    var endPage = startPage + pageBlockSize - 1;
				    if (endPage > maxPage) { 
				        endPage = maxPage;
				    }
					var str = "";
					var stat= "";
					str+= " <tr><th>서명</th> <th>저자</th> <th>출판사</th>";
					str+= "<th>신청일</th> <th>신청 결과</th> <th>진행 상황</th> <th>취소</th></tr>";
					$.each(result, function(index, item) {
						var date = new Date(item.regDate);
						var formatDate =  date.getFullYear()+ "-" + (date.getMonth() + 1) + "-" +date.getDate() ;
						str += '<tr><td>'+item.bookTitle+'</td>';
						str += '<td>'+item.bookAuthor+'</td>';
						str += '<td>'+item.bookPublisher+'</td>';
						str += '<td>'+formatDate+'</td>';
						str += '<td>'+item.wishResult+'</td>';
						if (item.wishStatus==0){
							stat="신청중";
						} else if (item.wishStatus==1){
							stat="취소";
						} else if (item.wishStatus==2){
							stat="완료";
						} else if (item.wishStatus==3){
							stat="반려";
						}
						
						str += '<td>'+stat+'</td>';
						str += '<td>';
						
						if (item.wishStatus == 0){
							str += '<button onclick="cancel(&#39;'+item.wishNo+'&#39;)">취소</button>'
						}
						str += '</td></tr>';
					}); 
			
					var p = "";
		           	
		           	if(pageNum>5){
		           	 	p += '<a onclick="getListFunction(&#39;'+id+'&#39;,'+(pageNum-5)+')">이전<a/>&nbsp;&nbsp;';
		           	}
		           	for (var i = startPage; i<=endPage; i++){
		           		
		           		 p += '<a onclick="getListFunction(&#39;'+id+'&#39;,'+i+')">';
		           		if(pageNum==i){
		           			p+= '<span style="color: blue; font-weight: bold;">'
		           		}
		           		 p+=''+i+'<a/>&nbsp;&nbsp;';
		           	}
		           	
		        	if (maxPage>endPage){
		           		p += '<a onclick="getListFunction(&#39;'+id+'&#39;,'+(pageNum+5)+')">다음<a/>&nbsp;&nbsp;';
		           	}
		   		 	$('#pageDiv').html(p);
		   		 	
					$('#wishListTable').html(str);
				}
			});
}

$(document).ready(function() {
// 	console.log('id는====='+id);
	getListFunction(id);
});
</script>
<style type="text/css">
	#wishListTable {
	  width: 1100px;
	  margin-bottom: 1rem;
	  color: #212529;
}

#wishListTable th {
	  color: #495057;
	  background-color: #e9ecef;
	  border-color: #dee2e6;
	  vertical-align: bottom;
	  border-bottom: 2px solid #dee2e6;
}

#wishListTable th,
#wishListTable td {
	  padding: 0.75rem;
	  vertical-align: top;
	  border-top: 1px solid #dee2e6;
	  width: 105px;
}

#wishListTable tr:hover {
	 color: #212529;
	 background-color: rgba(0, 0, 0, 0.075);
	 cursor: pointer;
}
/* 버튼 부트스트랩 */
button{
  background:#1AAB8A;
  color:#fff;
  border:none;
  position:relative;
  height:40px;
  font-size:20px;
  padding:0 2em;
  cursor:pointer;
  transition:800ms ease all;
  outline:none;
  display: block;
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
#pageDiv{
	text-align: center;
	font-size: 25px;
}
/* 여기까지 */
</style>

</head>
<body>

<input type="hidden" value="<sec:authentication var="memberId" property="principal.username"/>"/>

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
		<h2 class="sub_title" style="height: 100px;">마이 페이지<span>USER COMMUNITY</span></h2>

		<ul class="sm_2th">
			 <li class="on"><a href="/book/libRequest/bookRequestResult"><span>내 희망도서 신청정보</span><span class="more"><span class="state">에 대한 2차메뉴 닫힘</span><em class="ver"></em><em class="hor"></em></span></a></li>
			 <li ><a href="/book/member/myView?id=${memberId}"><span>내 정보</span><span class="more"><span class="state">에 대한 2차메뉴 닫힘</span><em class="ver"></em><em class="hor"></em></span></a></li>
			 <li ><a href="/book/member/memberInfoUpdate"><span>정보 수정</span><span class="more"><span class="state">에 대한 2차메뉴 닫힘</span><em class="ver"></em><em class="hor"></em></span></a></li>
			 <!-- <li><a href="" ><span>Q&A</span><span class="more"><span class="state">에 대한 2차메뉴 닫힘</span><em class="ver"></em><em class="hor"></em></span></a></li> -->
			   </ul>
	</nav>
</div>

 		<!-- left menu e -->
	</div>

	<div id="con">
		
		<div id="detail_con">	
			<!-- content s -->

	<h1>내 희망 신청 도서</h1>
	<table id="wishListTable">

	</table>
	
	<div id="pageDiv">

	</div>
				<div class=table_search>
				
				</div>
			</div>
			<!-- 세션에 id값이 있으면 글쓰기 버튼이 보이게 설정 -->

			<div class="clear"></div>
			<div id="page_control">
				<c:if test="${pageInfoMap.allRowCount gt 0}">
					<!-- 이전 블록이 존재하는지 확인 -->
					<c:if test="${pageInfoMap.startPage gt pageInfoMap.pageBlockSize}">
						<a
							href="/book/board/filelist?pageNum=${pageInfoMap.startPage - pageInfoMap.pageBlockSize}&search=${search}">이전</a>
					</c:if>

					<c:forEach var="i" begin="${pageInfoMap.startPage}"
						end="${pageInfoMap.endPage}" step="1">
						<c:choose>
							<c:when test="${i eq pageInfoMap.pageNum}">
								<a href="/book/board/filelist?pageNum=${ i }&search=${search}"><span
									style="color: red; font-weight: bold;">${ i }</span></a>
							</c:when>
							<c:otherwise>
								<a href="/book/board/filelist?pageNum=${ i }&search=${search}">${ i }</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>

					<!-- 다음 블록이 존재하는지 확인 -->
					<c:if test="${pageInfoMap.endPage lt pageInfoMap.maxPage}">
						<a
							href="/book/board/filelist?pageNum=${pageInfoMap.startPage + pageInfoMap.pageBlockSize}&search=${search}">다음</a>
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