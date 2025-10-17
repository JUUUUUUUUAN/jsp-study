<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Scripting Tag</title>
</head>
<body>
	<!-- 선언문 태그에 전역메소드 사용하기 -->
	<!-- 선언문 태그 -->
	<%! int sum(int a, int b){
		return a + b;
	}	
	%>
	
	<!-- 스크립틀릿 태그 -->
	<% 
		out.println("2 + 3 = " + sum(2, 3));	
	%>
	
	
	
	
</body>
</html>