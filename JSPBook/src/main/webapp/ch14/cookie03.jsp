<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cookie</title>
</head>
<body>
	<!-- 쿠키 객체 저장된 모든 쿠키 삭제하기 -->
	<%
		Cookie[] cookies = request.getCookies();
		
		for(Cookie cookie : cookies) {
			// cookie.setMaxAge(0);
			cookie.setMaxAge(10);
			response.addCookie(cookie);
			// (참고) Domain, Path가 다르면 서로 다른 쿠키
			
			// 유효 기간 설정
			// 1) Max-Age: 초 단위로 쿠키의 수명을 지정(예: 3600초 = 1시간)
			// 		브라우저가 이 쿠키를 받으면, 내부적으로 Expires를 계산하여 저장
			// 		setMaxAge()를 사용하여 지정 가능
			// 2) Expires: 만료 시점을 날짜/시간으로 지정
			// 		Set-Cookie 헤더를 직접 생성 시 Expires를 절대 시점으로 지정 가능
			// 		형식: Fri, DD-Mon-YYYY HH:MM:SS GMT
			// 		예시: Set-Cookie: userId=kimjh; Expires=Sun, 19 Oct 2025 18:00:00 GMT; Path=/; HttpOnly
			
			// 값에 따른 동작
			// Max-Age(또는 Expires) 없거나 Max-Age < 0: 세션 쿠키, 세션 종료 시(브라우저 닫을 때) 삭제
			// Max-Age > 0: 지정된 초 동안 유지
			// Max-Age = 0: 즉시 삭제
							
			// 실무에서는 Cookie 객체 + setMaxAge() 사용이 일반적이며, 브라우저 내부적으로 Expires를 계산해서 관리
		}
		
		response.sendRedirect("cookie02.jsp");
	%>
</body>
</html>