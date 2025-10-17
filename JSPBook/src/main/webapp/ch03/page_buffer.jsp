<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page buffer="16kb" %>
<!-- 대부분의 JSP 개발에서는 기본값을 그대로 사용 -->
<!-- 너무 크게 잡는다고 성능이 무조건 좋아지지 않음(메모리 낭비) -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Directives Tag</title>
</head>
<body>
	<!-- page 디렉티브 태그에 출력 버퍼 크기를 16KB로 설정하기 -->
	Today is <%= new Date() %><br>
	Today is <%= LocalDate.now() %>
</body>
</html>