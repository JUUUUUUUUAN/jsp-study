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
		String name = request.getParameter("name");
		String address = request.getParameter("address");
		String email = request.getParameter("email");
		
		StringBuffer sb = new StringBuffer();
		
		sb.append(name);
		sb.append(address);
		sb.append(email);
		
		out.println(sb);
		
	%>
</body>
</html>