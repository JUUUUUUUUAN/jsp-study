<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Exception</title>
</head>
<body>
	<%
		String strNum1 = request.getParameter("num1");
		String strNum2 = request.getParameter("num2");
		int num1 = Integer.parseInt(strNum1);
		int num2 = Integer.parseInt(strNum2);
		int result = num1 / num2;
		out.print(num1 + " / " + num2 + " = " + result);
	%>
</body>
</html>