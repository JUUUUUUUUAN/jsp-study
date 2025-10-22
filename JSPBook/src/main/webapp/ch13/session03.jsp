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
	<!-- 세션에 저장된 모든 속성 이름과 값 가져와 출력하기 -->
	<%
	String name;
	String value;
	
	Enumeration<String> en = session.getAttributeNames();
	int i = 0;
	while (en.hasMoreElements()) {
		i++;
		name = en.nextElement();
		value = session.getAttribute(name).toString();
		out.println("설정된 세션의 속성 이름 [" + i + "]: " + name + "<br>");
		out.println("설정된 세션의 속성 값 [" + i + "]: " + value + "<br>");
	}
	
	
	%>
</body>
</html>