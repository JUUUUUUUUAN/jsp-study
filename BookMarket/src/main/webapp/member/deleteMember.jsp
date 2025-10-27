<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원 탈퇴</title>
</head>
<body>
	<sql:setDataSource var="dataSource"
		url="jdbc:mysql://127.0.0.1:3306/bookmarketdb"
		driver="com.mysql.cj.jdbc.Driver" user="root" password="redsafe0914!" />
		
	<sql:update var="result" dataSource="${dataSource}">
		DELETE FROM member WHERE id = ?
		<sql:param value="${sessionScope.loginId}" />
	</sql:update>
	
	<c:if test="${result >= 1}">
		<!-- 탈퇴한 계정으로 브라우저에 세션이 남아있으면 계속 서비스 접근 가능 DB에서 탈퇴 처리 후 세션을 무효화해야 안전 -->
		<c:import url="logoutMember.jsp"></c:import>
		
		<c:redirect url="resultMember.jsp?msg=0" />
	</c:if>
</body>
</html>