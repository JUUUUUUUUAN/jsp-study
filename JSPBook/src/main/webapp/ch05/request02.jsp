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
	<!-- request 내장 객체로 모든 HTTP 헤더 정보 값 출력하기 -->
	<%
		Enumeration<String> en = request.getHeaderNames(); // 모든 헤더 이름 가져오기
		
		while(en.hasMoreElements()){ // 가져올 헤더 이름이 있으면 반복 
			String headerName = en.nextElement();
			String headerValue = request.getHeader(headerName);
			
			// out.println(headerName + ":" + headerValue);
	%>
	
	<%= headerName %> : <%= headerValue %><br>		
	
	<% 		
		}
	%>

</body>
</html>