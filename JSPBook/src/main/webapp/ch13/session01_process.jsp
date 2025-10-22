<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Session</title>
</head>
<body>
	<%
		String user_id = request.getParameter("id");
		String user_pw = request.getParameter("passwd");
	
		if ("admin".equals(user_id) && "1234".equals(user_pw)) {
			session.setAttribute("userId", user_id);
			session.setAttribute("userPw", user_pw);
			out.println("세션 설정이 성공했습니다.<br>");
			out.println(user_id + "님 환영합니다.");
		} else {
			out.println("세션 설정이 실패했습니다.<br>");
		}
	%>
	
	<!-- 세션 객체는 "클라이언트별로 하나"
		서버(컨테이너) 입장에서는 각 클라이언트마다 별도의 HttpSession 객체가 존재
	
		즉, 한 사용자가 브라우저를 통해 접속하면 세션 객체가 하나 생성되고,
		다른 사용자가 접속하면 또 다른 세션 객체가 생성됨
		
		사용자 A -> 세션 1
		사용자 B -> 세션 2
		사용자 C -> 세션 3
		
		결론: 서버 전체에서 세션 객체가 하나만 존재하는 것은 아니고,
		클라이언트(세션 ID) 단위로 개별적으로 생성됨
		
		참고: 브라우저 탭끼리는 쿠키 기반 세션 공유라 같은 세션을 쓰지만,
		프라이빗 모드로 열면 별도 세션이 생성됨
 	-->
 	
 	<!-- (참고) 세션 객체 관리 방식
		서블릿 컨테이너(Tomcat, Jetty 등)는 내부적으로
		Map<String, HttpSession> 구조로 세션을 관리합니다.
		
		Key: JSESSIONID (세션 ID)
		Value: HttpSession 객체
		
		클라이언트 요청 시, 서버는 쿠키나 URL 파라미터를 통해
		해당 클라이언트의 세션 ID를 확인하고 Map에서 해당 세션 객체를 찾아 제공
	-->
	
</body>
</html>