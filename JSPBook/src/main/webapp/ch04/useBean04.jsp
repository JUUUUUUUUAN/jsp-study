<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Action Tag</title>
</head>
<body>
	<!-- useBean 액션 태그에 Person 클래스를 사용하여 아이디, 이름 설정하기 -->
	<jsp:useBean id="person" class="ch04.com.dao.Person" scope="request"></jsp:useBean>
	
	<p>아이디: <%= person.getId() %></p>
	<p>이름: <%= person.getName() %></p>
	
	<%
		person.setId(20251015);
		person.setName("김재현");
	%>
	
	<!-- 내부적으로 setId(), setName()을 자동 호출 -->
	<jsp:setProperty property="id" name="person" value="20330505" />
	<jsp:setProperty property="name" name="person" value="고길동" />
	
	<jsp:include page="useBean02.jsp" />

	<!-- scope="request"이기 때문에,
		수정된 person 객체는 다른 JSP 페이지에서도
		같은 요청(request) 안에서는 그대로 공유됨
		즉, useBean02.jsp에서도 같은 person 객체를 그대로 사용할 수 있음
	 -->

</body>
</html>