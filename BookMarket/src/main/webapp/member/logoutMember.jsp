<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>로그아웃</title>
</head>
<body>
	<%
		// 로그아웃 처리 = 세션 무효화
		if (session != null) session.invalidate();
		response.sendRedirect("loginMember.jsp");
	%>	
</body>
</html>