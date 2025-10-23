<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String user_id = (String) session.getAttribute("userID");
		
		if (user_id == null) {
			response.sendRedirect("session_out.jsp");
		}
	%>
	<p>
		<a href="session_out.jsp?">로그아웃</a>
	</p>
</body>
</html>