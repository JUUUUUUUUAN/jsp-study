<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원가입</title>
</head>
<body>
	<sql:setDataSource var="dataSource"
		url="jdbc:mysql://127.0.0.1:3306/bookmarketdb"
		driver="com.mysql.cj.jdbc.Driver" user="root" password="redsafe0914!" />
		
	<sql:update var="result" dataSource="${dataSource}">
		INSERT INTO member(id, password, name, gender, birth, mail, phone, address, regist_day)
		VALUES (?, ?, ?, ?, ?, ?, ?, ?, NOW())
		<sql:param value="${param.id}" />
		<sql:param value="${param.password}" />
		<sql:param value="${param.name}" />
		<sql:param value="${param.gender}" />
		<sql:param value="${param.birthyy}/${param.birthmm}/${param.birthdd}" />
		<sql:param value="${param.mail1}@${param.mail2}" />
		<sql:param value="${param.phone}" />
		<sql:param value="${param.address}" />
	</sql:update>
	
	<c:if test="${result >= 1}">
		<c:redirect url="resultMember.jsp?msg=1" />
	</c:if>
</body>
</html>