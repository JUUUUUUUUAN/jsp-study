<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %> <!-- exception 내장 객체 사용 가능 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<p>오류가 발생하였습니다.</p>
	<p>예외 유형(클래스명): <%= exception.getClass().getName() %></p>
	<p>오류 메시지: <%= exception.getMessage() %></p>
	<p>예외 유형(클래스명) + 오류 메시지: <%= exception.toString() %> </p>
	
	
</body>
</html>