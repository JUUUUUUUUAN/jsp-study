<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- (참고)
	pageEncoding="UTF-8" -> 서버(JSP 처리 시점)에서 JSP 파일을 UTF-8로 해석
	contentType="text/html; charset="UTF-8" -> 클라이언트(브라우저)에게 "응답은 UTF-8 이야"라고 알려줌 
	
	일반적으로 둘 다 설정해 두는 게 안전(한글 깨짐 방지)
-->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Directives Tag</title>
</head>
<body>
	<!-- page 디렉티브 태그에 Date 클래스를 이용하여 현재 날짜 출력하기 -->
	Today is <%= new Date() %>
	Today is <%= LocalDate.now() %>
</body>
</html>