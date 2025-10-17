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
		/* 폼(입력양식)에서 입력한 한글을 처리하도록 request 내장 객체의 메소드에 문자 인코딩 설정 */
		request.setCharacterEncoding("utf-8");
		String userId = request.getParameter("id");
		String userPw = request.getParameter("passwd");
	%>
	<p>아이디: <% out.println(userId); %></p>
	<p>비밀번호: <% out.println(userPw); %></p>
	
	<!-- 단순 값 출력은 표현문 태그로 -->
	<p>아이디: <%= userId %></p>
	<p>비밀번호: <%= userPw %></p>

	<!-- (참고) EL 표현 언어 사용 시 -->
	<p>아이디: ${param.id}</p>
	<p>비밀번호: ${param.passwd}</p>
</body>
</html>