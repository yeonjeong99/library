<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카페인 도서관</title>
<script src="/book/resources/script/jquery-3.3.1.min.js"></script>
<script type="text/javascript">

	function ReturnAndClose(searchItem) {
		console.log("펑션 아이템"+searchItem.TITLE);
		opener.document.frm.title.value = searchItem.TITLE;
		opener.document.frm.author.value = searchItem.AUTHOR;
		opener.document.frm.publisher.value = searchItem.PUBLISHER;
		opener.document.frm.date.value = searchItem.PUBLISH_PREDATE;
		opener.document.frm.isbn.value = searchItem.EA_ISBN;
		window.close();
	}

	function bookSearch(num){
		var startNum = 1;
		
		var pageNum = startNum;
		
		if (num!=null){
			pageNum = num;
		} 
		
		 var form = {
				 pageNum : pageNum,
				 type : document.getElementById("type").value,
				 keyword : document.getElementById("keyword").value
           }
		 
			var csrfHeaderName = '${_csrf.headerName}';
			var csrfTokenValue = '${_csrf.token}';
			
		$.ajax({
			
			url : 'bookRentalSearch',
			type : 'POST',
			data: JSON.stringify(form),
			beforeSend : function (xhr) {
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			},
			contentType : "application/json; charset=utf-8;",
			dataType : "json",
		    success: function(response){
		    	console.log("asdfasdf");
		    	var arrData = response.docs;
              
           	var str = "";
           	
           	var pageSize = response.TOTAL_COUNT;
           	console.log(pageSize);
           	
           	var pageMaxNum = parseInt(pageSize/10);
           	
           	var setNum = response.PAGE_NO;
           	
           	if(pageSize%10 > 0){
           		pageMaxNum=pageMaxNum+1;
           	}

           	 console.log("마지막 페이지"+pageMaxNum);
           	 console.log("현재 페이지"+setNum);
           	 console.log(response);
           	
           	str += "<tr><th>표제</th><th>저자</th><th>출판사</th><th>발행년도</th></tr>";
           	$.each(arrData, function(index, item) {
           		var searchItem = JSON.stringify(item);
           		var y = item.PUBLISH_PREDATE.substr(0, 4);
      		    var m = item.PUBLISH_PREDATE.substr(4, 2);
           		var d = item.PUBLISH_PREDATE.substr(6, 2);

           		var date = y+'년 '+m+'월 '+d+'일'
           		
           		str+= "<tr onclick='ReturnAndClose("+searchItem+")'><td id='title'>"+item.TITLE;
           		if (item.VOL!=""){
           			str += ' '+item.VOL+'권';
           		}
           		str += '</td>';
           		str += '<td class="author">'+item.AUTHOR+'</td>';
           		str += '<td class="publisher">'+item.PUBLISHER+'</td>';
           		str += '<td name="date">'+date+'</td></tr>';
           	});
           	var p = "";
           	for (var i = startNum; i<=pageMaxNum; i++){
           		 p += '<a onclick="javascript:bookSearch('+i+')">'+i+'<a/>&nbsp;&nbsp;';
           		
           	}
          console.log(p);
   			$('#searchResult').html(str);
   		 	$('#pageDiv').html(p);
		    }

		});
	}
	
	$(document).ready(function() {
		$('#searchBtn').on("click", function() {
			if($('#keyword').val()==""){
				alert('검색어를 입력하세요');
				return false;
			}
			bookSearch();
			
			$('#keyword').on('keydown', function(event){
				if (event.keyCode == 13) {
					// 엔터키
					bookSearch();
				}
			});
	});
});
</script>
</head>
<body>
	<div>
	<form id="searchForm" method="post" >
		키워드: <select name="type" id="type">

			<option value="title">제목</option>
			<option value="author">저자</option>
			<option value="publisher">출판사</option>

		</select> 
		<input type="text" name="keyword" id="keyword">
		<input type="hidden" name="maxNum" id="maxNum" value="">
		<input type="hidden" name="setNum" id="setNum" value="">
		
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		
		</form>
		<button id="searchBtn">버튼</button>
	</div>
	<form name="fr">
	<table id="searchResult"  border="1">
	<tr><th>표제</th><th>저자</th><th>출판사</th><th>발행년도</th></tr>
	</table>
	</form>
	<div id="pageDiv"></div>
</body>
</html>