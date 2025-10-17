<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String txt = request.getParameter("num");

		int num = Integer.parseInt(txt);

		for(int i = 1; i <= 9; i++){
			out.print(i + " * " + num + " = " + (i * num) + "<br>");
		}

		
		/* out.print(num); */
	%>
	
</body>
</html>