<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL</title>
</head>
<body>
	<!-- 웹 브라우저 헤더를 변수에 설정하고 설정한 변수 삭제하기 -->
	browser 변수 값 설정(scope 속성을 명시하지 않으면 기본 스코프는 page)
	scope: pageContext, request, session, application
	<c:set var="browser" value="${header['User-Agent']}" />
	<%-- 변환 코드:
		pageContext.setAttribute("browser", request.getHeader("User-Agent"));
	--%>
	<c:out value="${browser}" /> <!-- 변수 값을 HTML로 안전하게 출력(escape) 해주는 태그 -->
	<p>
		browser 변수 제거 후
		<c:remove var="browser"/>
		<c:out value="${browser}" />
	</p>
	
	<%-- (참고) EL(표현 언어) 
		JSP 페이지에서 자바 코드를 최소화하면서 객체에 접근하고 값을 출력할 수 있는 간단한 표현 언어
		${...} 구문을 사용하여 객체 속성, 컬렉션, Map 값, 스코프 변수 등에 접근 가능
		JSTL과 함께 사용하면 조건문, 반복문, 함수 등 다양한 기능 구현 가능
	--%>
	
	<!-- 1) 변수 참조 -->
	${userName}           <!-- 스코프를 명시하지 않으면 pageScope/requestScope/sessionScope/applicationScope 순서로 검색 -->
	${user.age}           <!-- user 객체의 age 속성(user.getAge()와 동일) -->
	${user.address.city}  <!-- 중첩된 속성 접근 가능 -->
	
	<!-- 2) 컬렉션/맵 접근 -->
	${userList[0].name}    <!-- List의 첫 번째 요소 name -->
	${userMap['key']}      <!-- Map에서 key 값 가져오기 -->
	
	<!-- 3) 연산 -->
	${1 + 2}            <!-- 3 -->
	${price * quantity} <!-- 곱셈 -->
	${empty browser}    <!-- null 또는 빈 문자열 체크 -->
	${not empty browser}
	
	<!-- 4) 논리 연산 -->
	${age > 18}       <!-- true/false -->
	${gender == 'M'}  <!-- 비교 -->
	${gender != 'M'}
	${gender eq 'M'}  <!-- 비교(가독성) -->
	${gender ne 'M'}
	
	<!-- 5) 스코프 지정 
		EL은 기본적으로 page -> request -> session -> application 순서로 변수 탐색 -->
	${pageScope.temp}
	${requestScope.name}
	${sessionScope.user}
	${applicationScope.count}
	<!-- 스코프를 명시하면 명확하게 변수 위치를 지정 가능 -->
	
	<!-- 6) 자주 쓰는 EL 내장 객체들 
		param: 요청 파라미터, 예: ${param.id}
		paramValues: 같은 이름의 파라미터 여러 개, 예: ${paramValues.hobby[0]}
		header: HTTP 요청 헤더, 예: ${header['User-Agent']}
		cookie: 쿠키 값, 예: ${cookie.userId.value}
		sessionScope: 세션 스코프 변수, 예: ${sessionScope.user.name}
			=> 예: session.getAttribute("user").getName(); 과 동일
	-->
</body>
</html>