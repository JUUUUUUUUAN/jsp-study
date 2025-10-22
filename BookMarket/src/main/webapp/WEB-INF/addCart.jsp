<%@page import="java.util.ArrayList"%>
<%@page import="dto.Book"%>
<%@page import="dao.BookRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 장바구니에 들어가는 페이지 작성하기 -->
	<%
		// 1. 요청 파라미터 검증
		// 쿼리 스트링으로 보낸 데이터
		String id = request.getParameter("id");
		// hidden으로 보낸 데이터
		String bookId = request.getParameter("bookId");
		
		if (id == null || id.trim().isEmpty()) {
			response.sendRedirect("books.jsp");
			return;
		}
		
		// 2. 도서 조회
		BookRepository dao = BookRepository.getInstance();
		Book book = dao.getBookById(id);
		if (book == null) {
			response.sendRedirect("exceptionNoBookId.jsp");
			return;
		}
		
		// 3. 세션에서 장바구니 정보 가져오기(없으면 새로 생성)
		// "cartlist"
		ArrayList<Book> cartList = (ArrayList<Book>) session.getAttribute("cartlist");
		if (cartList == null) {
			cartList = new ArrayList<Book>();
			session.setAttribute("cartlist", cartList);
			// 장바구니 정보를 세션에 저장
			// 실무에서는 보통 DB에 저장하지만 상황에 따라 다름
		}
		
		// 4. 장바구니에 동일 도서가 있으면 수량 +1, 없으면 새로 추가
		/* for (int i = 0; i < cartList.size(); i++) {
			Book book1 = cartList.get(i);
			if(book1.getBookId().equals(id)){
				int quantity = book1.getQuantity();
				book1.setQuantity(quantity++);
			}
		} */
		boolean found = false;
		for ( Book item : cartList){
			if(item.getBookId().equals(id)){
				item.setQuantity(item.getQuantity() + 1);
				found = true;
				break;
			}
		}
		
		if (!found) {
			// 새 객체로 복사해서 추가(직접 참조 방지)
			// 원본 데이터가 변경될 위험을 방지하기 위해 새 객체로 복사해서 장바구니에 넣는 것이 안전
			Book cartItem = new Book(book);
			cartItem.setQuantity(1);
			cartList.add(cartItem);
		}
		
		// 5. 상세 페이지로 리다이렉트
		response.sendRedirect("book.jsp?id=" + id);
		
	%>
</body>
</html>