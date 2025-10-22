<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Exception</title>
</head>
<body>
	<%
		try {
			String strNum1 = request.getParameter("num1");
			String strNum2 = request.getParameter("num2");
			int num1 = Integer.parseInt(strNum1);
			int num2 = Integer.parseInt(strNum2);
			int result = num1 / num2;
			out.print(num1 + " / " + num2 + " = " + result);
		} catch (NumberFormatException e) {
				// 예외 발생 시 tryCatch_error.jsp로 이동하도록 작성
				// RequestDispatcher dispatcher = request.getRequestDispatcher("tryCatch_error.jsp");
				// dispatcher.forward(request, response);
		
				// (테스트) 리다이렉트 사용 시 데이터 유지 X
				response.sendRedirect("tryCatch_error.jsp");
		}
	
	
		// (참고) <jsp:forward> 액션 태그와 비교
		// dispatcher.forward();는 서블릿 자바 코드
		// <jsp:forward>는 JSP용 태그 문법이고, JSP가 서블릿으로 변화 시 내부적으로 dispatcher.forward()를 호출
	%>
</body>
</html>