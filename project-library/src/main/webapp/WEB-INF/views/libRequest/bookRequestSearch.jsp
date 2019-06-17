<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카페인 도서관</title>
<script src="<c:url value="/resources/script/jquery-3.3.1.min.js"/>"></script>
<script type="text/javascript">

	function ReturnAndClose(searchItem) {
		console.log("펑션 아이템"+searchItem.TITLE);
		opener.document.frm.bookTitle.value = searchItem.TITLE;
		opener.document.frm.bookAuthor.value = searchItem.AUTHOR;
		opener.document.frm.bookPublisher.value = searchItem.PUBLISHER;
		opener.document.frm.date.value = searchItem.PUBLISH_PREDATE;
		if (searchItem.EA_ISBN != ""){
			opener.document.frm.isbn.value = searchItem.EA_ISBN;
		}else{
			opener.document.frm.isbn.value = searchItem.SET_ISBN;
		}
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
			url : 'getData',
			type : 'post',
			data: JSON.stringify(form),
			beforeSend : function (xhr) {
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			},
			contentType : "application/json; charset=utf-8;",
			dataType : "json",
		    success : function(response){
		    	
	    	var arrData = response.docs;
              
           	var str = "";
           	
           	var pageBlock = 10;
           	var pageCount = 5;
           	
           	var pageSize = response.TOTAL_COUNT;
           	
           	var totalPage = parseInt(pageSize/pageBlock);
           	
         	if(pageSize%10 > 0){
           		totalPage=totalPage+1;
           	}
           	
        	var setNum =  parseInt(response.PAGE_NO);
        	
        	var startPage = startPage = (parseInt((setNum/pageCount)) - (setNum%pageCount==0 ? 1 : 0)) * pageCount + 1;
           	var endPage = (startPage + pageCount) - 1;
          	
        	console.log('startPage = '+startPage);
        	
        	console.log('setNum: '+setNum)
        	console.log('pageCount: '+pageCount)
        	
    
        
        	if (endPage>totalPage){
        		endPage=totalPage;
        	}

        	console.log('endPage: '+endPage)
        	
           	 console.log("마지막 페이지"+totalPage);
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
           	
           	if(setNum>5){
           	 	p += '<a onclick="javascript:bookSearch('+(setNum-5)+')">이전<a/>&nbsp;&nbsp;';
           	}
           	for (var i = startPage; i<=endPage; i++){
           		
           		 p += '<a onclick="javascript:bookSearch('+i+')">';
           		if(setNum==i){
           			p+= '<span style="color: blue; font-weight: bold;">'
           		}
           		 p+=''+i+'<a/>&nbsp;&nbsp;';
           	}
           	
        	if (totalPage>endPage){
           		p += '<a onclick="javascript:bookSearch('+(setNum+5)+')">다음<a/>&nbsp;&nbsp;';
           	}
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
		});
		
		$('#keyword').on('keydown', function(event){
			if (event.keyCode == 13) {
				
				if($('#keyword').val()==""){
					alert('검색어를 입력하세요');
					return false;
				}
				
				bookSearch();
			}
		});
		
	});

</script>
<style type="text/css">
	#searchResult {
	  width: 100%;
	  margin-bottom: 1rem;
	  color: #212529;
}

#searchResult th {
	  color: #495057;
	  background-color: #e9ecef;
	  border-color: #dee2e6;
	  vertical-align: bottom;
	  border-bottom: 2px solid #dee2e6;
}

#searchResult th,
#searchResult td {
	  padding: 0.75rem;
	  vertical-align: top;
	  border-top: 1px solid #dee2e6;
}

#searchResult tr:hover {
	 color: #212529;
	 background-color: rgba(0, 0, 0, 0.075);
	 cursor: pointer;
}
#pageDiv {
	text-align: center;
}

/* 버튼 부트스트랩 */
button{
  background:#1AAB8A;
  color:#fff;
  border:none;
  position:relative;
   height:35px;
  font-size:20px;
  padding:0 2em;
  cursor:pointer;
  transition:800ms ease all;
  outline:none;
  display: block;
  margin-left: 100px;
  margin-bottom: 25px;
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
/* 여기까지 */

#serchDiv{
	width: 50%;
	display: flex;
	border: solid 1px;
	border-color: #dee2e6; 
	height: 50px;
	padding: 10px;

}
#searchBtn{
	flex: none;
	margin: auto 0;
	margin-left: auto;

}
#keyword{
	flex: none;
	height: 31px;
	margin: auto 0;
	border: solid 1px;
	border-color: #dee2e6; 
	width: 65%;
}
#type{
	flex: none;
	height: 35px;
	margin: auto 0;
	border: solid 1px;
	border-color: #dee2e6; 
	margin-right: 15px;
}
</style>
</head>
<body>
<h3>도서 검색창</h3>
	
	
	<form id="searchForm" method="post" onsubmit="return false">
	<div id="serchDiv">
		<select name="type" id="type">

			<option value="title">제목</option>
			<option value="author">저자</option>
			<option value="publisher">출판사</option>

		</select> 
		<input type="text" name="keyword" id="keyword">
		<input type="hidden" name="maxNum" id="maxNum" value="">
		<input type="hidden" name="setNum" id="setNum" value="">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		<button id="searchBtn" type="button">검색</button>
		</div>
		<br>
		</form>
	

	<form name="fr">
	<table id="searchResult">
	<tr><th>표제</th><th>저자</th><th>출판사</th><th>발행년도</th></tr>
	</table>
	</form>
	<div id="pageDiv"></div>
</body>
</html>