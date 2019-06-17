<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카페인 도서관</title>
<style>
  table {
    border-collapse: collapse;
    color: #454a4e;
  }
  th{
    border-bottom: 1px solid #dadada;
    padding: 10px;
    background-color: #dadada;
    width: 440px;
  }
  tr{
  	border-bottom: 1px solid #dadada;
  	padding: 10px;
  	background-color: #f3f3f3;
  	height: 40px;
  }
 .content{
 height: 150px;
 padding: 10px;
 }
 .subject{
 padding: 10px;
 }
 .button1{
 margin-left : 335px;
 }
.button2{
 padding: 10px;
 }
.button1,.button2{
  display: inline-block;
  padding: 5px 13px;
  font-size: 13px;
  cursor: pointer;
  text-align: center;
  text-decoration: none;
  outline: none;
  color: #fff;
  background-color: #383d41;
  border: none;
  border-radius: 7px;
  box-shadow: 2px 4px 0px 0px #999;
  margin-top: 10px;
}
.button2:hover {background-color: #bdbbbb}

.button2:active {
  background-color: #3e8e41;
  box-shadow: 0 5px #666;
  transform: translateY(4px);
}
.button1:hover {background-color: #bdbbbb}

.button1:active {
  background-color: #3e8e41;
  box-shadow: 0 5px #666;
  transform: translateY(4px);
}

</style>
</head>
<body>

 <table>
      <thead>
        <tr>
          <th>제목</th>
        </tr>
      </thead>
      
      <tbody>
        <tr>
          <td class="subject">${detail.subject}</td>
        </tr>
        
        <tr>
       	  <th>내용</th> 
        </tr>
        
        <tr>
          <td class="content">${detail.content}</td>
        </tr>
        
      </tbody>
    </table>
    <form action="/book/noticeBoard/delete" method="post">
    	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	    <input type="hidden" name="noticeNo" value="${detail.noticeNo}">
	     <button type="button" class="button1" onclick="javascript:history.back()">이전</button>
	    <button type="submit" class="button2">글삭제</button>
    </form>

</body>
</html>