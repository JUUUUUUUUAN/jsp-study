<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info="Date 클래스를 이용한 날짜 출력하기"%>
<!-- (참고) 웹 컨테이너가 setServletInfo() 메소드를 생성 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Directives Tag</title>
</head>
<body>
	<!-- page 디렉티브 태그에 현재 웹 페이지의 설명 작성하기 -->
	Today is <%= new Date() %>
	Today is <%= LocalDate.now() %>
</body>
</html>