<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Database SQL</title>
</head>
<body>
	<%@ include file="dbconn.jsp" %>
	<%
		request.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		String name = request.getParameter("name");
		
		ResultSet rs = null;
		Statement stmt = null;
		
		try {
			String sql = "SELECT passwd FROM member WHERE id = '" + id + "'";
			
			stmt = conn.createStatement(); // 정적인 쿼리에 사용하는 Statement 객체 생성
			rs = stmt.executeQuery(sql); // SELECT문 실행
			
			if (!rs.next()) {
				out.println("member 테이블에 일치하는 아이디가 없습니다.");	
			} else {
				String dbPasswd = rs.getString("passwd");
				
				// 사용자가 입력한 아이디와 비밀번호가 일치할 때만 이름을 수정
				if (passwd.equals(dbPasswd)) {
					sql = "UPDATE member SET name = '" + name + "' WHERE id = '" + id + "'";
					stmt = conn.createStatement(); // (예외로부터) 안전하게 새로운 Statement 객체 생성
					stmt.executeUpdate(sql); // UPDATE문 실행
					out.println("member 테이블을 수정했습니다.");	
				} else {
					out.println("일치하는 비밀번호가 아닙니다.");						
				}
			}
		} catch (SQLException e) {
			out.println("member 테이블 수정에 실패했습니다.<br>");
			out.println("SQLException: " + e.getMessage());
		} finally {
			if (rs != null) rs.close();
			if (stmt != null) stmt.close();
			if (conn != null) conn.close();
		}
	%>
</body>
</html>