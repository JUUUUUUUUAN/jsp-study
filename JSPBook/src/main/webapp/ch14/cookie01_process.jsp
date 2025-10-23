<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cookie</title>
</head>
<body>
	<%
		String user_id = request.getParameter("id");
		String user_pw = request.getParameter("passwd");
	
		// 간단한 로그인 검증
		if ("admin".equals(user_id) && "1234".equals(user_pw) ) {
			Cookie cookie_id = new Cookie("userId", user_id);
			Cookie cookie_pw = new Cookie("userPw", user_pw);
			
			// (중요) 자주 쓰는 쿠키 설정
			// cookie_id.setPath("/"); // 모든 경로에서 접근 가능
			// cookie_id.setHttpOnly(true); // JavaScript로 접근 불가(보안 강화)
			// cookie_id.setSecure(true); // HTTPS에서만 전송(사용)
			// cookie_id.setMaxAge(60 * 5); // 5분 유효
			
			response.addCookie(cookie_id);
			response.addCookie(cookie_pw);
			
			out.println("쿠키 생성이 성공했습니다.<br>");
			out.println(user_id + "님 환영합니다.<br>");
		} else {
			out.println("쿠키 생성이 실패했습니다.<br>");			
		}
	%>
	
	<!-- 쿠키 사용 예 
		1. 로그인 유지(<-- 세션 ID가 저장된 세션 쿠키)
		2. 장바구니 정보 저장(거의 안 씀) => 요새는 세션 기반, DB 기반, 로컬 스토리지 기반
		3. 방문 기록 또는 사용자 설정 유지(예: 아이디 기억하기)
		4. 광고/트래킹 용도(특히 제3자 쿠키)
	-->
	
	
</body>
</html>