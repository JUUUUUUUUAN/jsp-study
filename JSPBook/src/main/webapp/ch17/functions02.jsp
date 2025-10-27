<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL</title>
</head>
<body>
	<%-- 문자열 분리하고 연결하기 --%>
	<c:set var="texts" value="${fn:split('Hello, Java Server Pages!', ' ')}" />	

	<c:forEach var="i" begin="0" end="${fn:length(texts) - 1}" >
		<p>text[${i}] = ${texts[i]}</p>
	</c:forEach>

	<c:forEach var="text" items="${texts}" >
		<p>${text}</p>
	</c:forEach>

	<p>
		<c:out value="${fn:join(texts, '-')}"></c:out>
	</p>
</body>
</html>