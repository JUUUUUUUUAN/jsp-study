<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Filter</title>
</head>
<body>
	<p>입력된 id 값: <%= request.getParameter("id") %></p>
	<p>입력된 pw 값: <%= request.getParameter("passwd") %></p>
</body>
</html>