<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>도서 삭제</title>
	<!-- 도서 정보 삭제 페이지 -->
	<%@include file="dbconn.jsp" %>
	<%
		String bookId = request.getParameter("id");
		
		try {
			String sql = "DELETE FROM book "
					   + "WHERE b_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bookId);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			out.println("SQLException: " + e.getMessage());				
		} finally {
			if (rs != null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
	%>
</body>
</html>