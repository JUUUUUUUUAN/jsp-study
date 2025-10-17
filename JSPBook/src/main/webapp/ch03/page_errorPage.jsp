<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 이동할 특정 오류 페이지 설정 -->
<%@ page errorPage="page_errorPage_error.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Directives Tag</title>
</head>
<body>
	<!-- page 디렉티브 태그에 이동할 특정 오류 페이지 작성하기 -->
	<!-- 1. 웹 서버(톰캣)가 제공하는 기본 오류 페이지 확인 -->
	<%
		String str = null;
		out.println(str.toString());
	%>
</body>
</html>