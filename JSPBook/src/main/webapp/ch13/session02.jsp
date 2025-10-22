<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Session</title>
</head>
<body>
	<!-- 세션에 저장된 속성 값 가져와 출력하기 -->
	<%
		String user_id = (String) session.getAttribute("userId");
		String user_pw = (String) session.getAttribute("userPw");
		
		out.println("설정된 세션의 속성 값 [1]: " + user_id + "<br>");
		out.println("설정된 세션의 속성 값 [2]: " + user_pw + "<br>");
	%>
	
	
</body>
</html>