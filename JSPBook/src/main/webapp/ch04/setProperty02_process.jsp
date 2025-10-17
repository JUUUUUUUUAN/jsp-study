<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Action Tag</title>
</head>
<body>
	<jsp:useBean id="person" class="ch04.com.dao.Person" scope="request" />
	<%-- <jsp:setProperty property="id" name="person"/>
	<jsp:setProperty property="name" name="person"/> --%>
	<!-- 요청 파라미터 id와 name이 자동으로 맵핑되어 자바빈 객체의 프로터피에 저장됨 -->
	
	<!-- 요청 파라미터 이름과 자바빈 프로퍼티 이름이 모두 일치하는 경우 -->
	<jsp:setProperty property="*" name="person"/>
	
	<p>아이디: <%= person.getId() %></p>
	<p>이름: <%= person.getName() %></p>
	
	<!-- EL 표현 언어 -->
	<p>아이디: ${person.id}</p>
	<p>이름: ${person.name}</p>
</body>
</html>