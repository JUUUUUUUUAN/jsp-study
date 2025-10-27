<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL</title>
</head>
<body>
	<!-- 웹 브라우저 헤더를 변수에 설정하고 설정한 변수 삭제하기 -->
	<form action="core02_process.jsp" method="post">
		<p>숫자: <input type="text" name="number"></p>
		<button type="submit">전송</button>
	</form>
</body>
</html>
