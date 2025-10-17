<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Directives Tag</title>
</head>
<body>
	<!-- taglib 태그에 JSTL의 Core 태그를 설정하여 1부터 10까지 출력하기 -->
	<!-- 반복문 태그: 변수 k가 1부터 10까지 1씩 증가하도록 JSTL Core 태그들 중 반복문 태그 사용 -->
	<c:forEach var="k" begin="1" end="10" step="1">
		<!-- 출력 태그 -->
		<c:out value="${k}" />
	</c:forEach>
</body>
</html>