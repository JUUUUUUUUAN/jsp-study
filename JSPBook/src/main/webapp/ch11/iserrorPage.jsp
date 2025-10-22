<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="iserrorPage_error.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Exception</title>
</head>
<body>
	<!-- page 디렉티브 태그에 iserrorPage 속성을 이용하여 오류 페이지 호출하기 -->
	name 파라미터: <%= request.getParameter("name").toUpperCase() %><!-- NPE 발생 -->
</body>
</html>