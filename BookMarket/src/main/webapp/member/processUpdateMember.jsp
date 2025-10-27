<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원 수정</title>
</head>
<body>
	<sql:setDataSource var="dataSource"
		url="jdbc:mysql://127.0.0.1:3306/bookmarketdb"
		driver="com.mysql.cj.jdbc.Driver" user="root" password="redsafe0914!" />
		
	<sql:update var="result" dataSource="${dataSource}">
		UPDATE member
		SET password = ?, name = ?, gender = ?, birth = ?, mail = ?, phone = ?, address = ?
		WHERE id = ?
		<sql:param value="${param.password}" />
		<sql:param value="${param.name}" />
		<sql:param value="${param.gender}" />
		<sql:param value="${param.birthyy}/${param.birthmm}/${param.birthdd}" />
		<sql:param value="${param.mail1}@${param.mail2}" />
		<sql:param value="${param.phone}" />
		<sql:param value="${param.address}" />
		<sql:param value="${param.id}" />
	</sql:update>
	
	<c:if test="${result >= 1}">
		<c:redirect url="resultMember.jsp?msg=0" />
	</c:if>
</body>
</html>