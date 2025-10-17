<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 현재 JSP 페이지에서 표현 언어를 사용할 수 없도록 설정 -->
<%@ page isELIgnored="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Directives Tag</title>
</head>
<body>
	<!-- page 디렉티브 태그에 표현 언어를 사용할 수 없도록 설정하기 -->
	<%
		// request 내장 객체에 속성과 값을 저장
		request.setAttribute("RequestAttribute", "request 내장 객체");
	%>
	
	<!-- 값을 출력하기 위해 표현 언어 사용 -->
	${requestScope.RequestAttribute}
</body>
</html>