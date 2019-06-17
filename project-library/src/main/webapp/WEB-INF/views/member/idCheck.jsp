<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카페인 도서관</title>
<script>
// function useIdAndClose() {
// 	// 현재창을 띄운 부모창의 참조는 window.opener
// 	// 현재창 의미하는 window는 일반적으로 생략가능
// 	opener.document.frm.id.value = document.fr.userid.value;
	
// 	// 현재 창 닫기  window.close();  close();
// // 	window.close();
// }
</script>
</head>
<body>

<table>
	<th>회원님의 아이디는</th>
</table>
<c:choose>
	<c:when test="${requestScope.isDuplicated}">
		
	</c:when>
	<c:otherwise>
	
	${id } 입니다.
	</c:otherwise>
</c:choose>

<form action="/book/member/joinIdCheck" method="get" name="fr">
<%-- 	<input type="text" name="userid" value="${param.userid}"> --%>
<!-- 	<input type="submit" value="중복체크"> -->
</form>

</body>
</html>