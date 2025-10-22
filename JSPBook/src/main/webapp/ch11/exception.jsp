<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Exception</title>
</head>
<body>
	<!-- page 디렉티브 태그에 errorPage와 iserrorPage 속성을 이용하여 예외 처리하기 -->
	<form action="exception_process.jsp" method="post">
		<p>숫자1: <input type="text" name="num1"> </p>
		<p>숫자2: <input type="text" name="num2"> </p>
		<button type="submit">나누기</button>
	</form>
</body>
</html>