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
  }
  tr{
  	border-bottom: 1px solid #dadada;
  	padding: 10px;
  	background-color: #f3f3f3;
  }
  tr:hover{
  background-color: #f8f9fa;
  }
 .head1{
  width: 320px;
  height: 40px;
  }
  .head2{
  width: 120px;
  height: 40px;
  }
  .button{
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
  margin-left : 505px;
}
.button:hover {background-color: #bdbbbb}

.button:active {
  background-color: #3e8e41;
  box-shadow: 0 5px #666;
  transform: translateY(4px);
}
</style>
</head>
<body>

<div class="box1">
 <table>
      <thead>
        <tr>
          <th class="head1">제목</th><th class="head2">날짜</th>
        </tr>
      </thead>
      <tbody>
      <c:forEach var="noticeBoard" items="${list}">
   
        <tr onclick="location.href='/book/noticeBoard/detail?noticeNo=${noticeBoard.noticeNo}'">
          <td style="padding: inherit; cursor:pointer;">${noticeBoard.subject}</td><td>${noticeBoard.date}</td>
        </tr>
        
      </c:forEach>
      </tbody>
    </table>
    <button type="button" class="button" onclick="window.close()">닫기</button>
</div>	

</body>
</html>