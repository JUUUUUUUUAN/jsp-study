<%@page import="dao.BookRepository"%>
<%@page import="dto.Book"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <jsp:useBean id="bookDAO" class="dao.BookRepository" scope="session" /> --%> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>도서 목록</title>
	
	<!-- 부트스트랩 연결 -->
	<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
	
	<script type="text/javascript">
		function deleteConfirm(id){
			if (confirm('해당 도서를 삭제합니다!')) {
				location.href = './deleteBook.jsp/id=' + id;
			}
			
		}
	</script>
</head>
<body>
	<!-- 도서 편집 페이지 -->
	<%
		String edit = request.getParameter("edit");
	%>
	
	<div class="container py-4">
	<%@ include file="header.jsp"  %>
	
   <jsp:include page="title.jsp">
   	<jsp:param value="도서목록" name="title"/>
   	<jsp:param value="Booklist" name="subtitle"/>
   </jsp:include>

	<%@ include file="dbconn.jsp" %>
		<%
			/* BookRepository bookDAO = BookRepository.getInstance();
			List<Book> listOfBooks = bookDAO.getAllBooks();
      	for ( int i = 0; i < listOfBooks.size(); i++) {
      		Book book = listOfBooks.get(i); */
		%>

    <div class="row align-items-md-stretch text-center">
      <%
      	// book 테이블의 모든 데이터를 가져오도록 작성
      	try {
      		String sql ="SELECT * FROM book";
      		pstmt = conn.prepareStatement(sql);
      		rs = pstmt.executeQuery();
      		
      		// 가져온 레고드들을 반복하여 동적 바인딩
      	while (rs.next()) {
      		String id = rs.getString("b_id");
      		String name = rs.getString("b_name");
      		int unitPrice = rs.getInt("b_unitPrice");
      		String author = rs.getString("b_author");
      		String description = rs.getString("b_description");
      		String publisher = rs.getString("b_publisher");
      		String category = rs.getString("b_category");
      		int unitsInStock = rs.getInt("b_unitsInStock");
      		String releaseDate = rs.getString("b_releaseDate");
      		String condition = rs.getString("b_condition");
      		String fileName = rs.getString("b_fileName");
      	
      %>
      
      <div class="col-md-4">
      	<div class="h-100 p-2" >
      		<img alt="도서이미지" src="<%= request.getContextPath() %>/images/<%= fileName %>" style="width: 250px; height: 350px">
      		<h5><b><%= name %></b></h5>
      		<p>
	      		<%= author %>
	      		<br>
	      		<%= publisher %> | <%= releaseDate %>
      		</p>
      		<p><%= description.substring(0, 60) %> </p>
      		<p><%= unitPrice %>원.</p>
      		<p>
      			<%
      				if("update".equals(edit)){	
      			%>
      				<a href="./updateBook.jsp?id=<%= rs.getString("b_id") %>" class="btn btn-success" role="button">
      					수정 &raquo;
      				</a>
      			<%
      				} else if ("delete".equals(edit)){
      			%>
							<a href="javascript:void(0)" class="btn btn-danger" role="button" onclick="deleteConfirm('<%= rs.getString("b_id")%>')">
      					삭제 &raquo;
      				</a>     					
      			<%
      				}      			
      			%>	
      		</p>     		
      	</div>
      </div>
      
      <% 
      		}
      	} catch (SQLException e) {
      		out.println("SQLException: " + e.getMessage());
      	} finally {
      		if (rs != null) rs.close();
      		if (pstmt != null) pstmt.close();
      		if (conn != null) conn.close();
      	}
      %>
 		</div>
		
		<%@ include file="footer.jsp"  %>
  </div>
</body>
</html>