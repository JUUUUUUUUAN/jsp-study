<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Action Tag</title>
</head>
<body>
	<!-- 자바빈즈 Person를 생성하고 useBean 액션 태그에 Person 클래스를 사용하여 아이디, 이름 출력하기 -->
	<jsp:useBean id="person" class="ch04.com.dao.Person" scope="request" />
	
	<p>아이디: <%= person.getId() %></p>
	<p>이름: <%= person.getName() %></p>
	
	<!-- JSP 액션 태그 사용 시 내부적으로 getId(), getName()을 자동 호출 -->
	<p>아이디: <jsp:getProperty property="id" name="person"/></p>
	<p>이름: <jsp:getProperty property="name" name="person"/></p>
	
	<!-- (참고) EL 표현 연어 사용 시 -->
	<p>아이디: ${person.id}</p>
	<p>이름: ${person.name}</p>
	
	<!-- JSP에서 Java 코드는 점점 분리하는 추세
		밑으로 갈수록 더 추천하는 방식 -->
		
		
</body>
</html>