<%@page import="dto.Book"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <jsp:useBean id="bookDAO" class="dao.BookRepository" scope="session" /> --%> 
<%@ page errorPage="exceptionNoBookId.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>배송 정보</title>
</head>
<body>
	<!-- 배송 정보 페이지 작성하기 -->
	<div class="container py-4">
		<%@ include file="header.jsp"  %>
		
    <jsp:include page="title.jsp">
    	<jsp:param value="배송정보" name="title"/>
    	<jsp:param value="Shipping Info" name="subtitle"/>
    </jsp:include>
    
    <div class="row align-items-md-stretch">    	
    	<form action="./processShippingInfo.jsp" method="post">
    		<!-- Quiz 장바구니 아이디 값을 숨겨서 전달하도록 작성 -->
    		<input type="hidden" name="cartId" value="<%= request.getParameter("cartId") %>">
    		<div class="mb-3 row">
					<label class="col-sm-2">성명</label>
					<div class="col-sm-3">
						<input type="text" name="name" class="form-control">
					</div>
				</div>
				
				<div class="mb-3 row">
					<label class="col-sm-2">배송일</label>
					<div class="col-sm-3">
						<input type="text" name="shippingDate" class="form-control">(yyyy/mm/dd)
					</div>
				</div>		
				
				<div class="mb-3 row">
					<label class="col-sm-2">국가명</label>
					<div class="col-sm-3">
						<input type="text" name="country" class="form-control">
					</div>
				</div>
				
				<div class="mb-3 row">
					<label class="col-sm-2">우편번호</label>
					<div class="col-sm-3">
						<input type="text" name="zipCode" class="form-control">
					</div>
				</div>
				
				<div class="mb-3 row">
					<label class="col-sm-2">주소</label>
					<div class="col-sm-5">
						<input type="text" name="addressName" class="form-control">
					</div>
				</div>
				
				<div class="mb-3 row">
					<div class="col-sm-offset-2 col-sm-10">
						<a href="./cart.jsp?cartId=<%= request.getParameter("cartId") %>" class="btn btn-secondary" role="button">
							이전
						</a>
						<button type="submit" class="btn btn-primary">등록</button>
						<a href="./checkOutCancelled.jsp" class="btn btn-secondary" role="button">
							취소
						</a>
					</div>
				</div>
    	</form>
 		</div>
		
		<%@ include file="footer.jsp"  %>
		
  </div>
</body>
</html>