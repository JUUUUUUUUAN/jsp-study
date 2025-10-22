<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Filter</title>
</head>
<body>
	<!-- 폼 페이지에서 전송된 요청 파라미터를 필터로 처리하기 -->
	<form action="filter01_process.jsp" method="post">
		<p>이름: <input type="text" name="name"></p>
		<button type="submit">전송</button>
	</form>
</body>
</html>