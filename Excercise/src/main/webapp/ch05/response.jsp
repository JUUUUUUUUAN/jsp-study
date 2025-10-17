<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<p><a href="response_data.jsp">Google 홈페이지로 이동하기</a></p>
	<%
		response.setIntHeader("Refresh", 5);
	%>
	<p><%= Calendar.getInstance().getTime() %></p>
</body>
</html>