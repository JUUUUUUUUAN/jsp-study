<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Implicit Objects</title>
</head>
<body>
	<%
		// 폼(입력양식)에서 입력한 한글을 처리하도록 request 내장 객체의 메소드에 문자 인코딩 설정
		request.setCharacterEncoding("utf-8");
		
		String userId = request.getParameter("id");
		String userPw = request.getParameter("passwd");
		
	%>
	<p>아이디 : <%= userId %></p>
	<p>비밀번호 : <%= userPw %></p>
	
	<!-- EL 사용 시 -->
	<!-- param -> request.getParameter()와 동일한 역할 -->
	<p>아이디 : ${param.id}</p>
	<p>비밀번호 : ${param.passwd}</p>
</body>
</html>