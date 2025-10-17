<%@page import="dto.Book"%>
<%@page import="dao.BookRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="bookDAO" class="dao.BookRepository" scope="session" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 등록</title>
</head>
<body>
	<!-- 신규 도서 등록 처리 페이지 만들기 -->
	<%
		// 1. 도서 등록 페이지에서 넘어오는 요청 파라미터 얻기
			String bookId = request.getParameter("bookId");
			String name = request.getParameter("name");
			String unitPrice = request.getParameter("unitPrice");
			String author = request.getParameter("author");
			String publisher = request.getParameter("publisher");
			String releaseDate = request.getParameter("releaseDate");
			String description = request.getParameter("description");
			String category = request.getParameter("category");
			String unitsInStock = request.getParameter("unitsInStock");
			String condition = request.getParameter("condition");
			
			/* out.print(bookId); */
			
			// 간단한 기본 유효성 검사 추가
			int price;
			
			// 도서 가격이 입력되지 않은 경우 0으로, 입력된 경우 정수형으로 변경
			if (unitPrice.isEmpty()) { // 문자열이 비어 있는지 확인
				price = 0;
			} else {
				price = Integer.parseInt(unitPrice);
			}
			
			long stock;
			
			if (unitsInStock.isEmpty()) { // 문자열이 비어 있는지 확인
				stock = 0;
			} else {
				stock = Long.parseLong(unitsInStock);
			}
	
		// 2. BookRepository 객체 얻기
			BookRepository br = BookRepository.getInstance();
			
		// 3. Book 객체 생성 후 요청 파라미터 값 담기
			Book book = new Book();
			book.setBookId(bookId);
			book.setName(name);
			book.setUnitPrice(price);
			book.setAuthor(author);
			book.setPublisher(publisher);
			book.setReleaseDate(releaseDate);
			book.setDescription(description);
			book.setCategory(category);
			book.setUnitsInStock(stock);
			book.setCondition(condition);
			
		
		// 4. addBook() 메소드로 저장
			br.addBook(book);
		
		// 5. books.jsp 페이지로 강제 이동하도록 작성
			response.sendRedirect("books.jsp");
	%>
</body>
</html>