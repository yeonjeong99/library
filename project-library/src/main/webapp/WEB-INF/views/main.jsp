<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
		<link href="/book/resources/css/main.css" rel="stylesheet" type="text/css" /> 
		<link href="/book/resources/css/sub/sub01.css" rel="stylesheet" type="text/css" /> 
		<link href="/book/resources/css/sub/sub.css" rel="stylesheet" type="text/css" /> 
		<script src="/book/resources/script/jquery-3.3.1.min.js"></script>
		
</head>
<body>

<!-- 헤더들어가는 곳 -->
<jsp:include page="/WEB-INF/views/inc/top.jsp"/>
<!-- 헤더들어가는 곳 --> 

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

<script>

	setInterval(function(){
		$('#contentsFull').find(' > div:visible').find('.conNext').trigger('click');
	},100000);
</script>

<script>

var csrfHeaderName = '${_csrf.headerName}';
var csrfTokenValue = '${_csrf.token}';

function bookRank() {
	$.ajax({
		url : '/book/bookSearch/bookRank',
		type : 'post',
 		beforeSend : function (xhr) {
	            xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
	         }, 
		success : function(data){
		
		console.log("data 확인" + data);
		
		var temp = '<tr style="border-bottom: 1px solid #aba6a6;"><th>순위</th><th style="padding-left:20px;">제목</th><th>대여횟수</th></tr>';
		
			$.each(data, function(index, book){
				temp += '<tr><td style="text-align: center; padding: 6px; border-bottom : 1px solid #dde0e2">'+(index+1)+'</td>';
				temp += '<td style="padding-left:20px; border-bottom : 1px solid #dde0e2">'+book.title+'</td>';
				/* temp += '<td>'+book.author+'</td>';
				temp += '<td>'+book.publisher+'</td>'; */
				temp += '<td style="text-align: center; border-bottom : 1px solid #dde0e2">'+book.rentalCount+'</td></tr>';
			});
			$("#bookRank").html(temp);
		}
	});
}

/*<th>저자</th><th>출판사</th> */

$(document).ready(function(){
	bookRank();	
});
</script>


<!-- 메인영역 끝  -->
<!-- container -->
<div id="container" class="container">
<div class="dv_wrap">
	
</div>

<br/>

<div class="contentsFull" id="contentsFull">
	
	<!-- 1번페이지 -->
	<div class="contentsFull0">
		<h2 class="offscreen">현재 선택된 컨텐츠는 스토리 입니다.</h2>


<div class="smartsearch1"  >
		<div class="smartsearch1Box">
		<a href="/book/bookSearch/booklistSearch" title="새창" class="fl" style="margin-right:10px;"> <img src="/book/resources/images/main/total_sea_icon.png" alt="통합 웹서비스 자료찾기" /></a>
			<p class="clr"></p>
		</div>
</div>
		<div class="group">
			<div class="t02">
 				<div class="holiday box1_1">				
					<h2>이용시간 및 휴관일</h2>
 					<div class="c">
						<img src="/book/resources/images/main/time_main.png" alt="열람실 : 월~일 07:00 ~23:00 종합실 : 화~금 09:00 ~ 22:00 월,토 09:00 ~18:00 어린이실 : 월,토 09:00~18:00, 화~금09:00~20:00 일요일 09:00~17:00"  />
						<div class="fl">
						<a href="/book/directions"><img src="/book/resources/images/main/main_icon01.gif" alt="오시는길" /></a>
						<a href="/book/facilityStatus"><img src="/book/resources/images/main/main_icon02.gif" alt="시설안내" /></a>
						</div>
						<div class="holiday_day">
							<!-- <p class="tit_day">매월 3·4주 월요일, 국경일 휴관입니다.</p> -->
							<p class="h_day">이번달 휴관일 <br />06,17,24일</p>
						</div>
						<p class="clr"></p>
					</div>
 					  	<div class="data_event box1_1">
<br/>
<div class="option">
<a href="?&amp;year=2017&amp;month=5" class="prev">이전</a>
<strong>2019/<span>6</span></strong>
<a href="?&amp;year=2017&amp;month=7" class="next">다음</a>
</div>
<div class="day"><a href="http://www.bjl.go.kr/content/?m1=04&m2=01&m3=03"><table class='closecal_tbl'>
<colgroup><col span='7'></colgroup>
<thead>
	<tr>
		<th scope='col' class='c_rd'>SUN</th>
		<th scope='col'>MON</th>
		<th scope='col'>TUE</th>
		<th scope='col'>WED</th>
		<th scope='col'>THU</th>
		<th scope='col'>FRI</th>
		<th scope='col' class='c_bl'>SAT</th>
	</tr><br/>
</thead>
<tbody>
						 <td> &nbsp; </td>
										 <td> &nbsp; </td>
										 <td> &nbsp; </td>
										 <td> &nbsp; </td>
										 <td> &nbsp; </td>
										 <td> &nbsp; </td>
															 <td class='c_bl'><a onclick="javascript:alert('등록된 일정이 없습니다.');return false;" title="등록된 일정이 없습니다." >1</a></td>
									   </tr>
									   <tr>
															 <td class='c_rd '><a onclick="javascript:alert('등록된 일정이 없습니다.');return false;" title="등록된 일정이 없습니다." >2</a></td>
															 <td><a onclick="javascript:alert('등록된 일정이 없습니다.');return false;" title="등록된 일정이 없습니다." >3</a></td>
															 <td><a onclick="javascript:alert('등록된 일정이 없습니다.');return false;" title="등록된 일정이 없습니다." >4</a></td>
															 <td><a onclick="javascript:alert('등록된 일정이 없습니다.');return false;" title="등록된 일정이 없습니다." >5</a></td>
															 <td><a onclick="javascript:alert('◎현충일');return false;" title="◎현충일" style='color:red; font-weight:bold;'>6</a></td>
															 <td><a onclick="javascript:alert('등록된 일정이 없습니다.');return false;" title="등록된 일정이 없습니다." >7</a></td>
															 <td class='c_bl'><a onclick="javascript:alert('등록된 일정이 없습니다.');return false;" title="등록된 일정이 없습니다." >8</a></td>
									   </tr>
									   <tr>
															 <td class='c_rd '><a onclick="javascript:alert('등록된 일정이 없습니다.');return false;" title="등록된 일정이 없습니다." >9</a></td>
															 <td><a onclick="javascript:alert('등록된 일정이 없습니다.');return false;" title="등록된 일정이 없습니다." >10</a></td>
															 <td><a onclick="javascript:alert('등록된 일정이 없습니다.');return false;" title="등록된 일정이 없습니다." >11</a></td>
															 <td><a onclick="javascript:alert('등록된 일정이 없습니다.');return false;" title="등록된 일정이 없습니다." >12</a></td>
															 <td><a onclick="javascript:alert('등록된 일정이 없습니다.');return false;" title="등록된 일정이 없습니다." >13</a></td>
															 <td><a onclick="javascript:alert('등록된 일정이 없습니다.');return false;" title="등록된 일정이 없습니다." >14</a></td>
															 <td class='c_bl'><a onclick="javascript:alert('등록된 일정이 없습니다.');return false;" title="등록된 일정이 없습니다." >15</a></td>
									   </tr>
									   <tr>
															 <td class='c_rd '><a onclick="javascript:alert('등록된 일정이 없습니다.');return false;" title="등록된 일정이 없습니다." >16</a></td>
															 <td><a onclick="javascript:alert('◎휴관일');return false;" title="◎휴관일" style='color:red; font-weight:bold;'>17</a></td>
															 <td><a onclick="javascript:alert('등록된 일정이 없습니다.');return false;" title="등록된 일정이 없습니다." >18</a></td>
															 <td><a onclick="javascript:alert('등록된 일정이 없습니다.');return false;" title="등록된 일정이 없습니다." >19</a></td>
															 <td><a onclick="javascript:alert('등록된 일정이 없습니다.');return false;" title="등록된 일정이 없습니다." >20</a></td>
															 <td><a onclick="javascript:alert('등록된 일정이 없습니다.');return false;" title="등록된 일정이 없습니다." >21</a></td>
															 <td class='c_bl'><a onclick="javascript:alert('등록된 일정이 없습니다.');return false;" title="등록된 일정이 없습니다." >22</a></td>
									   </tr>
									   <tr>
															 <td class='c_rd '><a onclick="javascript:alert('등록된 일정이 없습니다.');return false;" title="등록된 일정이 없습니다." >23</a></td>
															 <td><a onclick="javascript:alert('◎휴관일');return false;" title="◎휴관일" style='color:red; font-weight:bold;'>24</a></td>
															 <td><a onclick="javascript:alert('등록된 일정이 없습니다.');return false;" title="등록된 일정이 없습니다." >25</a></td>
															 <td><a onclick="javascript:alert('등록된 일정이 없습니다.');return false;" title="등록된 일정이 없습니다." >26</a></td>
															 <td><a onclick="javascript:alert('등록된 일정이 없습니다.');return false;" title="등록된 일정이 없습니다." >27</a></td>
															 <td><a onclick="javascript:alert('등록된 일정이 없습니다.');return false;" title="등록된 일정이 없습니다." >28</a></td>
															 <td class='c_bl'><a onclick="javascript:alert('등록된 일정이 없습니다.');return false;" title="등록된 일정이 없습니다." >29</a></td>
									   </tr>
									   <tr>
															 <td class='c_rd '><a onclick="javascript:alert('등록된 일정이 없습니다.');return false;" title="등록된 일정이 없습니다." >30</a></td>
										 <td>&nbsp;</td>
												 <td>&nbsp;</td>
												 <td>&nbsp;</td>
												 <td>&nbsp;</td>
												 <td>&nbsp;</td>
												 <td>&nbsp;</td>
						
	
</tbody>


</table>
</a>
		
	
</div>
</div>

			</div>

			</div>

			<div class="holiday_day_mod">
				<!-- <p class="tit_day">매월 3·4주 월요일, 국경일 휴관입니다.</p> -->
				<p class="h_day">이번달 휴관일 : 06,17,24일</p>
			</div>

			<div class="t02_1">
				<div class="iconm box1_1">
					<ul>
						<li><a href="<c:url value="/libReservation/readingRoomReservation"/>"  title="새창으로 열림" class="con_i01">열람실 신청</a></li>
						<li><a href="/book/libRequest/bookRequest" class="con_i02">비치희망자료신청</a></li>
 						<sec:authorize access = "isAnonymous()">
						<li><a href="/book/member/join" title="새창으로 열림" class="con_i05">도서회원가입</a></li>
						</sec:authorize>
						<li><a href="<c:url value="/board/filelist"/>" class="con_i06">자유게시판</a></li>
					</ul>
				</div>
				<div class="clr popupzone box1_1" id="c1m1"  style="background-color: white; padding: 25px;">
					<h3 style="color: #555;">인기 도서</h3>
					
					<table id="bookRank" style="font-size: 14px;">
						<hr>
					</table>
				</div>
			</div>
			<div class="t02_2">
				<div class="notice box1_1">
					<div class="m_notice">
				<ul class="m_tab02">
				   <li class="on" id="t_notice1">
					   <a href="#notice1_more" onclick="changemTab02(1);return false;" onfocus="changemTab02(1);"  class="tab_txt">공지사항</a>
					   <ul class="list" id="v_notice1">
					   
					   <ul>
						<li>
							<a href="/book/admin/fileDetail?num=1&pageNum=1">
								<span>· 2019년 비치희망도서 신청 안내</span>
							</a>
						</li>	
						
						<li>
							<a href="/book/admin/fileDetail?num=2&pageNum=1">
								<span>· 2019년 장서점검에 따른 휴실 안내</span>
							</a>
						</li>
						
						<li>
							<a href="/book/admin/fileDetail?num=3&pageNum=1">
								<span>· 부산광역시 도서관 통합미인증 회원 이용제한 안내</span>
							</a>
						</li>				   
					   </ul>
					   
						<span id="notice1_more" style="display:block;">
						<a href="<c:url value="/admin/filelist"/>" class="mnoti_more">
						<img src="/book/resources/images/main/btn_more.gif" alt="공지사항 더보기" />
						</a></span>
				   </li>
		</ul>
	</div>
	
</div>			

	<div class="mobb" style="margin-top:16px;">
		<a href="">
			<img alt="올해의 BOOK 여행하는 인간 " src="/book/resources/images/sub/sosig.png">
		</a>
	</div>	
			</div>
			
			
		</div>
	</div>
	<!-- 1번페이지 끝-->
</div>
<div class="contents0"></div>
<div class="contents1"></div>
</div>

<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

<!-- 푸터들어가는 곳 -->
<jsp:include page="/WEB-INF/views/inc/bottom.jsp"/>
<!-- 푸터들어가는 곳 -->  

</body>
</html>