<%@page import="java.util.Date"%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Implicit Objects</title>
</head>
<body>
	<!-- response 내장 객체로 5초마다 JSP 페이지 갱신하기 -->
	<p>
		이 페이지는 5초마다 새로고침 됩니다.
		<%
			response.setIntHeader("Refresh", 5); // 코드의 명확성과 타입 안전성의 이유로 사용
			// response.setHeader("Refresh", "5"); 
		%>
	</p>
	<%= new Date() %>
</body>
</html>