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
	<!-- 표현문 태그로 현재 날짜 출력하기 -->
	<!-- 표현문 태그: 변수, 계산식, 메소드 호출 결과를 문자열 형태로 출력하는데 사용(많이 씀) -->
	<%-- <p>Today's date: <%= new java.util.Date() %></p> --%>
	<p>Today's date: <%= new Date() %></p>
	
</body>
</html>