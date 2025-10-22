<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Session</title>
</head>
<body>
	<!-- 세션 아이디와 웹 사이트에서 유지한 시간 출력하기 -->
	<%
		// Map에 저장된 세션 객체의 아이디
		String session_id = session.getId();
	
		// 세션이 생성된 시간
		long start_time = session.getCreationTime(); // 밀리초
		
		// 세션에 마지막으로 접근한 시간
		long last_time = session.getLastAccessedTime(); // 밀리초
	
		// 웹 사이트에 머문 시간
		long used_time = (last_time - start_time) / (1000 * 60); // 분 단위로 환산
		
		out.println("세션 아이디: " + session_id + "<br>");
		out.println("요청 시작 시간: " + start_time + "<br>");
		out.println("요청 마지막 시간: " + last_time + "<br>");
		out.println("웹 사이트에서 경과 시간: " + used_time + "<br>");
	%>
	
	
	
	
	
</body>
</html>