<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Exception</title>
</head>
<body>
	<!-- wep.xml 파일에 오류 코드로 오류 페이지 호출하기 -->
	<form action="errorCode_process.jsp" method="post">
		<p>숫자1: <input type="text" name="num1"> </p>
		<p>숫자2: <input type="text" name="num2"> </p>
		<button type="submit">나누기</button>
	</form>
</body>
</html>