<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Action Tag</title>
</head>
<body>
	<!-- 자바빈즈 Calculator를 생성하고 useBean 액션 태그에 Calculator 클래스를 사용하여 숫자 출력하기 -->
	
	<jsp:useBean id="bean" class="ch04.com.dao.Calculator"></jsp:useBean>
	
	<%
		int m = bean.process(5);
		out.print("5의 3제곱: " + m);
	%>
</body>
</html>