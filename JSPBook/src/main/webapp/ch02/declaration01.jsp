<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Scripting Tag</title>
</head>
<body>
	<%-- 1. JSP 주석 --%>
	<%-- 개발자 메모용, 클라이언트에 안 보이게 할 때 --%>
	
	<!-- 2. HTML 주석 --> 
	<!-- HTML 문서에도 남겨야 할 때 -->
	<!-- 클라이언트가 소스 보기를 하면 볼 수 있음 -->
	
	<!-- 선언문 태그에 전역변수(클래스 멤버변수) 사용하기 -->
	<!-- 선언문 태그: 자바 변수나 메소드를 정의하는데 사용(거의 안씀) -->
	<%! int data = 50; %>
	
	<!-- 스크립틀릿 태그 -->
	<% 
		// 3. 자바 주석(// 또는 /* */)
		// 자바 코드 내부(JSP 스크립틀릿이나 선언부 안)에서 사용하는 주석
		out.println("Value: " + data);	
	%>
	
	
	
	
</body>
</html>