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
		<%
			ResultSet rs = null;
			PreparedStatement pstmt = null; // 권장
			
			String id = request.getParameter("id");
			String passwd = request.getParameter("passwd");
			String name = request.getParameter("name");
			
			try {
				String sql = "SELECT * FROM member WHERE id = ?";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				if (!rs.next()) {
					out.println("member 테이블에 일치하는 아이디가 없습니다.");
				}else {
					// 사용자가 입력한 비밀번호가 일치할 때만 이름을 수정
					String dbPasswd = rs.getString("passwd");
					if (passwd.equals(dbPasswd)) {
						sql = "UPDATE member "
								+ "SET name = ? "
								+ "WHERE id = ?";
						pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, name);
						pstmt.setString(2, id);
						pstmt.executeUpdate();
						out.println("member 테이블을 수정했습니다.");						
					} else {
						out.println("일치하는 비밀번호가 아닙니다.");						
					}
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
</body>
</html>