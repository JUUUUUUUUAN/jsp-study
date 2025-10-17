<%@page import="java.util.Date"%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Implicit Objects</title>
</head>
<body>
	<!-- response 내장 객체로 오류 응답 코드와 오류 메시지 보내기 -->
	<%
		//response.sendError(404, "요청 페이지를 찾을 수 없습니다.");
		// 권장 방식: 상수 사용(가독성 + 유지보수성)
		//response.sendError(HttpServletResponse.SC_NOT_FOUND, "요청 페이지를 찾을 수 없습니다.");
	
		// setStatus 테스트
		// 단순히 응답 상태 코드만 설정(에러 처리 로직 실행 안됨)
		// 정상 응답인데 코드만 다르게 주고 싶을 때 사용
		response.setStatus(404);
	%>
	
	<h2>HTTP 응답 상태 코드</h2>
	
</body>
</html>