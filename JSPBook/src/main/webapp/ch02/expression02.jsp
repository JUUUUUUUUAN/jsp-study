<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Scripting Tag</title>
</head>
<body>
	<!-- 표현문 태그로 연산 결과 출력하기 -->
	<%
		int a = 10;
		int b = 20;
		int c = 30;
	%>
	
	<%= a + b + c %>
	
</body>
</html>