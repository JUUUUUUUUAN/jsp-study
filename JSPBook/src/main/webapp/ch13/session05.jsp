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
	<!-- 세션에 저장된 세션 속성 삭제하기 2 -->
	<h4>----- 세션을 삭제하기 전 -----</h4>
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
		
		session.removeAttribute("userId");
	%>
	
	<h4>----- 세션을 삭제한 후 -----</h4>
	<%
		en = session.getAttributeNames();
		i = 0;
		
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