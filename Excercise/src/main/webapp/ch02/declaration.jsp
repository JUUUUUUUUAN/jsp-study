<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>declaration</title>
</head>
<body>
	<%!
		String txt = "Hello, Java Server Pages";
	
		String getString() {
			return txt;
		}
	%>
	
	<%= txt %>
</body>
</html>