<%@page import="java.time.LocalDateTime"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Implicit Objects</title>
</head>
<body>
	<!-- out 내장 객체로 오늘의 날짜 및 시각 출력하기 -->
	<%
		out.println("오늘의 날짜 및 시각<br>");
		out.println(Calendar.getInstance().getTime() + "<br>");
		LocalDateTime now = LocalDateTime.now();
		out.println(now + " " + now.getDayOfWeek());
	%>
</body>
</html>