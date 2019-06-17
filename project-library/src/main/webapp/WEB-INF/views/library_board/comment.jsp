<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카페인 도서관</title>
<link href="/book/resources/css/sub/board.css" rel="stylesheet" type="text/css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
var bno = ${board.num}; // 게시글 번호

var id = '<sec:authentication property="principal.username"/>';
var commentName = '<sec:authentication property="principal.member.name"/>';
// console.log('commentName : ' + commentName);

// commentName = encodeURIComponent(commentName);
// console.log('encodeURIComponent commentName : ' + commentName);


var csrfHeaderName = '${_csrf.headerName}';
var csrfTokenValue = '${_csrf.token}';

// 댓글목록
function commentList(bno){
	var boarderName = '${board.name }';
	
	
	console.log('boarderName:::'+boarderName);

	$.ajax({			url : '/book/comment/list',
		type : 'post',
		data : {bno : bno},
 		beforeSend : function (xhr) {
	            xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
	         }, 
		success : function(data){
			console.log(data);
			var a ='';
			$.each(data, function(key, value){
				
				var dbdate = new Date(value.regDate);
				var dateFormat = dbdate.getFullYear()+"-"+(dbdate.getMonth()+1)+"-" + dbdate.getDate();
				console.log('id : ' + id);
				console.log('valuewriter : ' + value.writer);
				console.log('commentName : ' + commentName);
				if(value.reLev == 0){
				a += '<div class="commentArea" style="border-bottm:1px solid darkgray; margin-bottom: 15px;">';
				a += '<hr>';
				a += '<div class="commentInfo'+value.cno+'">';
				a += value.writer;
				if (value.writer == boarderName){
	 			a += '<span class="writer">작성자</span> ';
	 			}
				a += ' '+'<span class="date">작성일 : '+dateFormat+'</span> ';
				if (value.writer == id){
				a += '<a onclick="commentUpdate('+value.cno+',\''+value.comment+'\');"><span class="update">수정</span></a> ';
				a += '<a onclick="commentDelete('+value.cno+');"><span class="delete">삭제</span> </a>';
				}
				a += '<a onclick="commentReplyInput('+value.cno+',\''+value.reRef+'\');"> <span class="reply">답글 </span></a>';
				if (value.writer == id){
				a += '<a onclick="hideInput()"><span class="cencel">취소</span></a> </div>';
				}
				a += '<div class="commentContent'+value.cno+'"> <p> '+value.comment+'</p>';
// 				a += '<div class="commentinputbox"></div>';
				}else{
					a += '<hr>';
					a += '<div class="commentInfo'+value.cno+'">';
// 					if (value.writer == boarderName){
// 					a += '　　└<span class="writer">작성자</span> ';
// 					}
// 					a += '　└'+value.writer+' / 작성일 : '+dateFormat+' ';
// 					if (value.writer != boarderName){
// 					a += '　　└';
// 					}
					a += '　　└ '+value.writer;
					if (value.writer == boarderName){
	 				a += '<span class="writer">작성자</span> ';
	 				}
// 					if (value.writer != boarderName){
// 	 				a += '　　└';
// 	 				}
					a += ' '+'<span class="date">작성일 : '+dateFormat+'</span> ';
					if (value.writer == id){
					a += '<a onclick="commentUpdate2('+value.cno+',\''+value.comment+'\');"><span class="update">수정</span></a> ';
					a += '<a onclick="commentDelete('+value.cno+');"><span class="delete">삭제</span> </a> ';
					}
					a += '<a onclick="commentReplyInput('+value.cno+',\''+value.reRef+'\', this);"> <span class="reply">답글 </span></a>';
					if (value.writer == id){
					a += '<a onclick="hideInput()"><span class="cencel">취소</span></a>';
					}
					a += '<div class="commentContentReply'+value.cno+'"><p>　　▶ '+value.comment+'</p>';	
					a += '<hr>';
				}
					
				a += '</div></div></div></div>';
			});
			$(".commentList").html(a);
		}
	});
}

// 댓글등록
function commentInsert(){
	console.log('insert');
	var insertData = $('#commentInsertForm').serialize(); // commentInsertForm의 내용을 가져오는작업
	
	
	$.ajax({
		url : '/book/comment/insert',
		data : insertData,
		type : 'POST',
        beforeSend : function (xhr) {
           xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
        }, 
		success : function(result){
	 		if(result != 0){ 
	 			console.log('입력성공');
				commentList(bno); // 댓글작성 후 댓글목록 reload
				$('[name=comment]').val('');
				
			}else if(result == 0){
				alert('인서트 실패');
			} 
			console.log('result::::: '+result);
		}
	});
}

// 댓글수정 - 댓글내용 출력을 input 폼으로 변경
function commentUpdate(cno, comment){
	var a ='';
	
	a += '<div class="input-group" style="margin-top: 10px;">';
	a += '<input type="text" style="display:inline-block; margin-right:5px; border-radius:.25em;  " class="form-control" name="comment'+cno+'" value="'+comment+'"/>';
	a += '<span class="input-group-btn"><button class="btn" type="button" onclick="commentUpdateProc('+cno+');">수정</button></span>';
	a += '</div>';
	
	$('.commentContent' + cno).append(a);
}

//대댓글수정 - 댓글내용 출력을 input 폼으로 변경
function commentUpdate2(cno, comment){
	var d ='';
	
	d += '<div class="input-group" style="margin-top: 10px;">';
	d += '<input type="text" style="display:inline-block; margin-right:5px; border-radius:.25em;   " class="form-control" name="comment'+cno+'" value="'+comment+'"/>';
	d += '<span class="input-group-btn"><button class="btn" type="button" onclick="commentUpdateProc('+cno+');">수정</button></span>';
	d += '</div>';
	
	$('.commentContentReply' + cno).append(d);
}




// 댓글수정
function commentUpdateProc(cno){
	var updateComment = $('[name=comment'+cno+']').val();
	
	$.ajax({
		url : '/book/comment/update',
		type : 'post',
 		   beforeSend : function (xhr) {
	           xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
	        },  
		data : {'comment' : updateComment, 'cno' : cno},
		success : function(data){
			if(data != 0) 
				commentList(bno); // 댓글 수정후 목록 출력
		}
	});
}

// 댓글삭제
function commentDelete(cno){
	if(confirm("정말 삭제하시겠습니까?") == true){
		$.ajax({
			url : '/book/comment/delete/',
			type : 'post',
	 		   beforeSend : function (xhr) {
		           xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
		        },   
	        data : {'cno' : cno},
			success : function(data){
				console.log("삭제하는중"+data);
				if(data != 0){

					$(".input-reply").each(function() {
					    $(this).addClass("divHide");
					});
					
					//document.getElementsByClassName('input-reply').css('display', 'none');
					commentList(bno); //댓글 삭제 후 목록 출력
					
				}
			}
		});
	} else {
		return;
	}
	

}



// 댓글에 댓글달기 inputbox 호출
function commentReplyInput(cno,reRef){
	
	console.log('cno : ' + cno);
	console.log('reRef : ' + reRef);

	


 	var b ='';
	b += '<form id="commentReplyForm" method="POST" name="commentReplybox">';
	b += '<div class="input-reply divShow">';
	b += '<input style="width:825px; height:60px; border:1px solid #ced4da; margin-right:5px;" type="text" class="reply-control" id="commentreplytext" name="comment" placeholder="내용을 입력해주세요">';
	b += '<span class="input-reply-btn"><button class="btnReply" type="button">등록</button></sapn>';
	b += '</div>';
	b += '<input type="hidden" name="reRef" value="' + reRef + '" >';
	b += '<input type="hidden" name="writer" value='+id+' >';
	b += '<input type="hidden" name="bno" value="${board.num}" >';
	b += '<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>';
	b += '</form>';
	
	
	$(".commentinputbox").html(b);
}


$(document).on('click', '.btnReply', function () {

	var replyData = $('#commentReplyForm').serialize(); // commentInsertForm의 내용을 가져오는작업
	
	commentReply(replyData);
});


// 댓글에 댓글달기
function commentReply(replyData){
	console.log(replyData);
	console.log();

	

	$.ajax({
		url : '/book/comment/reply',
		data : replyData,
		type : 'POST',
	    beforeSend : function (xhr) {
	       xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
	    }, 
		success : function(result){
			console.log('success');
	 		if(result != 0){ 
	 			commentList(bno); // 댓글작성 후 댓글목록 reload
	 			$('[name=comment]').val('');
	 			
	 			
	 			console.log('댓글 입력창 숨기기');
				$(".input-reply").each(function() {
				    $(this).addClass("divHide");
				});
				
			}else if(result == 0){
				alert('인서트 실패');
			} 
			console.log('result::::: '+result);
		}
	});
}

function hideInput(){
	console.log('댓글 입력창 숨기기');
	$(".input-reply").each(function() {
	    $(this).addClass("divHide");
	});
	
	
	$(".input-group").each(function() {
	    $(this).addClass("divHide");
	});
}



// 댓글에 댓글목록
function commentReplyList(bno){
	
	$.ajax({
		url : '/book/comment/list',
		type : 'POST',
		data : {bno: bno},
 		beforeSend : function (xhr) {
	            xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
	         }, 
		success : function(data){
			console.log(data);
			var c ='';
			$.each(data, function(key, value){
				
				c += '<div class="commentArea" style="border-bottm:1px solid darkgray; margin-bottom: 15px;">';
				
				c += '<div class="commentInfo'+value.cno+'">'+'댓글번호 : ' +value.cno+' / 작성자 : '+value.writer;
				c += '<a onclick="commentUpdate('+value.cno+',\''+value.comment+'\');">수정</a>';
				c += '<a onclick="commentDelete('+value.cno+');"> 삭제 </a> </div>';
				c += '<div class="commentInputTextBox'+value.cno+'"> </div>';
				a += '<div class="commentContent'+value.cno+'"> <p> 내용 : '+value.comment+'</p>';
				c += '<div class="commentContentReply'+value.cno+'"> <p> 대댓글내용 : '+value.commentreplytext +'</p>'; 
				c += '</div></div>';
			});
			$(".commentReplyList").html(c);
		}
	});
} 


$(document).ready(function(){
 	commentList(bno); // 페이지 로딩시 댓글목록 출력
	
	
	$('.btn').click(function(){
		
			commentInsert(); // Insert 함수호출 
			

	});
	
	$('#comment').on('keydown', function(event){
		if (event.keyCode == 13) {
			
			if($('#comment').val()==""){
				alert('내용을 입력하세요');
				return false;
			}
			
			commentInsert(); // Insert 함수호출 
		}
	});
	
	
	

});

</script>
</head>
<body>
<div class="container">
	<label for="content"></label>
	<form id="commentInsertForm" method="POST" onsubmit="return false">
<%-- 	  	<input type="hidden" name="reRef" value="${param.reRef }"/>
        <input type="hidden" name="reLev" value="${param.reLev }"/>
        <input type="hidden" name="reSeq" value="${param.reSeq }"/> --%>
		<div class="input-gruop">
			<%-- <input type="hidden" name="bno" value="${param.bno }"> --%>
			<input type="hidden" name="bno" value="${board.num}">
<%-- 			<input type="hidden" name="name" value="${board.name}"> --%>
			<input  type="text" class="form-control" id="comment" name="comment" placeholder="내용을 입력해주세요">
				<button class="btn" type="button" name="commentInsertBtn">등록</button>
		</div>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		<input type="hidden" name="writer" value="<sec:authentication property="principal.username"/>">
	</form>
</div>

<div class="container">
	<div class="commentList"></div>
</div>

<div class="container2">
	<div class="commentinputbox"></div>
</div>

<div class="container3">
	<div class="commentReplyList"></div>
</div>

</body>
</html>