<%@page import="java.util.Date"%>
<%@ page language="java" contentType="application/msword"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Directives Tag</title>
</head>
<body>
	<!-- page 디렉티브 태그에 콘텐츠 유형을 마이크로소프트 워드 문서로 설정하기 -->
	<%
		// 저장될 파일명을 지정
		response.setHeader("Content-Disposition", "attachment; filename=\"page_contentType01.doc\"");
	%>
	Today is: <%= new Date() %>
</body>
</html>