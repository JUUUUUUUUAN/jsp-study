<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>로그인</title>
</head>
<body>
	<sql:setDataSource var="dataSource"
		url="jdbc:mysql://127.0.0.1:3306/bookmarketdb"
		driver="com.mysql.cj.jdbc.Driver" user="root" password="redsafe0914!" />
		
	<sql:query var="resultSet" dataSource="${dataSource}">
		SELECT * FROM member WHERE id = ? AND password = ?
		<sql:param value="${param.id}" />
		<sql:param value="${param.password}" />
	</sql:query>
	
	<!-- resultSet.rows: 실제 조회된 행(레코드)들의 리스트
		조회 결과가 없으면 빈 리스트 -->
	<c:choose>
		<c:when test="${not empty resultSet.rows}">
			<c:set var="loginId" value="${param.id}" scope="session" /> <!-- 세션에 로그인한 아이디 저장 -->
			<!-- session.setAttribute("loginId", request.getParameter("id"));와 동일 -->
			<c:redirect url="resultMember.jsp?msg=2" />
		</c:when>
		<c:otherwise>
			<c:redirect url="loginMember.jsp?error=1" />			
		</c:otherwise>
	</c:choose>
	
</body>
</html>