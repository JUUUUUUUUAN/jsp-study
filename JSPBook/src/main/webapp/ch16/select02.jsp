<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Database SQL</title>
</head>
<body>
	<!-- PreparedStatement 객체를 이용하여 SELECT 쿼리문 실행 결과 값 가져오기 -->
	<%@ include file="dbconn.jsp" %>
	<table border="1" style="width: 300px">
		<tr>
			 <th>아이디</th>
			 <th>비밀번호</th>
			 <th>이름</th>
		</tr>
		<%
			ResultSet rs = null;
			PreparedStatement pstmt = null;
			
			
			try {
				String sql = "SELECT * FROM member";
			
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				while (rs.next()) {
					
		%>
		<tr>
			 <td><%= rs.getString("id") %></td>
			 <td><%= rs.getString("passwd") %></td>
			 <td><%= rs.getString("name") %></td>
		</tr>
	<%
				}
			} catch (SQLException e) {
				out.println("member 테이블 호출에 실패했습니다.<br>");
				out.println("SQLException: " + e.getMessage());
			} finally {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			}
	%>	
	</table>
</body>
</html>