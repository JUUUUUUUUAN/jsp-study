<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Scripting Tag</title>
</head>
<body>
	<!-- 스크립틀릿 태그에 지역변수 사용하기 -->
	<!-- 스크립틀릿 태그: 자바 로직 코드를 작성하는데 사용(많이 씀) -->
	<%
		// 지역변수 a, b
		int a = 2;
		int b = 3;
		int sum = a + b;
		out.println("2 + 3 = " + sum);
	%>
	
	
	
	
</body>
</html>