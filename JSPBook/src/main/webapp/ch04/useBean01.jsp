<%@page import="java.time.LocalDateTime"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Action Tag</title>
</head>
<body>
	<!-- 자바빈(JavaBean)
		데이터를 표현을 목적으로 하는 자바 클래스로
		데이터 전달용 객체(VO, DTO)를 JSP에서 다룰 때 주로 사용
	 -->

	<!-- useBean 액션 태그와 Date 클래스를 사용하여 현재 날짜와 시각 출력하기 -->
	
	<!-- 자바빈으로 Date 클래스를 사용하도록 useBean 액션 태그 작성 -->
	<jsp:useBean id="date" class="java.util.Date" /> <!-- scope="page"가 기본값 -->
	
	<p>오늘의 날짜 및 시각</p>
	<%= date %>
	
	
	<!-- (정리) useBean과 page import 차이
		useBean
		JSP에서 "데이터빈(자바빈)"을 다룰 때 사용
		JSP가 자동으로 객체 생성 + 스코프 관리 + 재사용 + 속성 관리를 해줌
		자바 코드와 관리 포인트를 줄일 수 있음
		MVC 패턴의 View 단에서 DTO/VO를 다룰 때 적합
		
		page import="..."
		단순히 클래스를 불러와 JSP 코드 내에서 직접 사용
		유틸 클래스 호출이나 수동 객체 생성에 사용(매 요청마다 새롭게 객체 생성됨)
		예: java.util.Date
	-->
	
	<!-- 스코프별 "재사용" 가능 범위
		scope	       생존 기간	                 재사용 가능 조건	                     예시
		page	       JSP 페이지 내 한정	         동일 JSP 안에서만	                   한 페이지 내에서만 사용
		request	     하나의 요청/응답 주기 동안	     같은 요청 안에서 forward 시 재사용 가능	 
		session	     브라우저 세션 유지 기간 동안	   동일 사용자(세션) 요청 간 재사용	       장바구니, 로그인 정보
		application	 서버 실행 중 전체	           모든 사용자와 요청에서 재사용	           전역 설정, 캐시
  -->
</body>
</html>