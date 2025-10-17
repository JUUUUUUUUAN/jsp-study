<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Form processing</title>
</head>
<body>
	<table border="1">
		<tr>
			<th>요청 파라미터 이름</th>
			<th>요청 파라미터 값</th>
		</tr>
		
		<%
			Enumeration<String> paramNames = request.getParameterNames();
			
			while (paramNames.hasMoreElements()) {
				String name = paramNames.nextElement();
				out.println("<tr>");
				out.println("<td>" + name + "</td>");
				String paramValue = request.getParameter(name);
				out.println("<td>" + paramValue + "</td>");
				out.println("</tr>");
			}
		%>
	</table>
</body>
</html>