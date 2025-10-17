<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Action Tag</title>
</head>
<body>
	<!-- include 액션 태그로 현재 날씨와 시간을 출력하는 페이지로 이동하기 -->
	<h2>include 액션 태그</h2>
	<h3>동적 include</h3>
	<h4>JSP가 실행될 때 포함될 페이지를 별도로 실행하고, 그 출력 결과(HTML)를 현재 페이지에 삽입</h4>
	<h4>변수/스크립틀릿 등은 공유되지 않음</h4>
	<jsp:include page="include_date.jsp" />
	<p>--------------------------------</p>
	
	
	<h2>include 디렉티브 태그와 비교</h2>
	<h3>정적 include</h3>
	<h4>JSP 파일이 서블릿 코드로 변환되기 전에 그대로 복사되어 붙여넣기 됨(즉, 하나의 JSP처럼 동작)</h4>
	<h4>변수/선언문/스크립틀릿 등 모두 공유 가능</h4>
	<%@ include file="include_date.jsp" %>
	<%= test %>
	
	<%-- 정리: 
		<%@ include %>: 정적 포함 - JSP 파일 내용을 "복붙"해서 하나의 JSP로 컴파일
		<jsp:include />: 동적 포함 - JSP를 별도 실행하고 그 결과(HTML)를 삽입
	--%>
	
</body>
</html>