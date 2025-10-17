<%@page import="java.time.LocalDateTime"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Action Tag</title>
</head>
<body>
	<!-- include 액션 태그와 param 액션 태그에 제목과 현재 날짜 전달하기 -->
	<h3>param 액션 태그</h3>
	<jsp:include page="param02_data.jsp">
		<jsp:param value="오늘 날짜와 시각" name="title"/>
		<jsp:param value="<%= LocalDateTime.now() %>" name="date"/>
	</jsp:include>
	<p>Jakarta Server page</p>
	
	<%-- <jsp:include>와 함께 포함된 JSP에 데이터 전달 
		사용 예: 공통 header/footer에 동적 타이틀, 사용자명 전달(~님 환영합니다!)
		
		<jsp:include page="header.jsp">
			<jsp:param name="pageTitle" value="상품 목록"/>
			<jsp:param name="loginUser" value="<%= session.getAttribute("userName") %>"/>
		</jsp:include>
	--%>
</body>
</html>