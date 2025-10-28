<%@page import="dao.BookRepository"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="org.apache.jasper.compiler.Node.UseBean"%>
<%@page import="dto.Book"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <jsp:useBean id="bookDAO" class="dao.BookRepository" scope="session" /> --%> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>도서 정보</title>
	
	<!-- 부트스트랩 연결 -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
	
	<!-- 장바구니에 등록하기 위한 핸들러 함수 작성 -->
	<script type="text/javascript">
		function addToCart(){
			if (confirm('도서를 장바구니에 추가하시겠습니까?')){
				document.addForm.submit();
			} else {
				document.addForm.reset();
			}
		}
	</script>
</head>
<body>
	<div class="container py-4">
		<%@ include file="header.jsp"  %>
		
    <jsp:include page="title.jsp">
    	<jsp:param value="도서목록" name="title"/>
    	<jsp:param value="Booklist" name="subtitle"/>
    </jsp:include>
    
    <%-- <%
			// Quiz
			// 도서 목록 페이지로부터 전달되는 도서 아이디를 가져오도록 작성
			String bookId = request.getParameter("id");
    	//out.print(bookId);
			// BookRepository 클래스로 bookDAO라는 이름의 자바빈을 생성하고
			// 도서 아이디를 이용하여 도서 정보 가져오기	
			// Book book = bookDAO.getBookById(bookId);
			
			// BookRepository 공유 객체로 변경
			BookRepository dao = BookRepository.getInstance();
			Book book = dao.getBookById(bookId);
    %> --%>
		
		<sql:setDataSource var="dataSource"
		url="jdbc:mysql://127.0.0.1:3306/bookmarketdb"
		driver="com.mysql.cj.jdbc.Driver" user="root" password="redsafe0914!" />
    <div class="row align-items-md-stretch">
    
    <sql:query var="resultSet" dataSource="${dataSource}">
    	SELECT * FROM book WHERE b_id = ?
    	<sql:param value="${param.id}"></sql:param>
    </sql:query>
    
    <c:if test="${not empty resultSet.rows }">
    	<c:set var="row" value="${resultSet.rows[0]}"></c:set>
	    	<div class="col-md-5">
	    		<!-- 웹 내부 접근 시 -->
	    		<%-- <img alt="도서이미지" src="./resources/images/<%= book.getFilename() %>" style="width: 70%"> --%>
	    		<!-- 외부 폴더 접근 시  -->
	    		<img alt="도서이미지" src="<%= request.getContextPath() %>/images/${row.b_filename}" style="width: 70%">
	    	</div>
	      <div class="col-md-6">
	      	<!-- Quiz: 도서 정보로 채워넣기(데이터 동적 바인딩) -->
					<h3><b>${row.b_name}</b></h3>
					<p>${row.b_description}</p>
					<p>
						<b>도서코드</b>: <span class="badge text-bg-danger">${row.b_id}</span>
					</p>							
					<p>
						<b>저자</b>: ${row.b_author}
					</p>	
					<p><b>출판사</b>: ${row.b_publisher}</p>	
					<p><b>출판일</b>: ${row.b_releaseDate}</p>				
					<p><b>분류</b>]on: ${row.b_category}</p>
					<p><b>재고수</b>: ${row.b_unitsInStock}</p>
					<h4>${row.b_unitPrice} 원</h4>
					<p>
						<form action="./addCart.jsp?id=${row.b_id}" method="post" name="addForm">
							<input type="hidden" name="bookId" value="${row.b_id}">
							<a href="#" class="btn btn-info" onclick="addToCart()">도서주문 &raquo;</a> 					
							<a href="./cart.jsp" class="btn btn-warning">장바구니 &raquo;</a>
							<a href="./books.jsp" class="btn btn-secondary">도서목록 &raquo;</a>
						</form>
					</p>
	      </div>
	 		</div>
    </c:if>
		
		<%@ include file="footer.jsp"  %>
		
  </div>
</body>
</html>