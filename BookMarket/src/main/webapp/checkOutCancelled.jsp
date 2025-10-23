<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>주문 취소</title>
	
	<!-- 부트스트랩 연결 -->
	<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
</head>
<body>
	<!-- 주문 취소 페이지 작성하기 -->
	<div class="container py-4">
		<%@ include file="header.jsp" %>
		
    <jsp:include page="title.jsp">
			<jsp:param value="주문 취소" name="title"/>
			<jsp:param value="Order Cancellation" name="subtitle"/>
		</jsp:include>
    
    <div class="row align-items-md-stretch">
    	<h2 class="alert alert-danger">주문이 취소되었습니다.</h2>
    </div>
    <div class="container">
			<p>
				<a href="./books.jsp" class="btn btn-secondary">&laquo; 도서 목록</a>
			</p>
		</div>
    
    <%@ include file="footer.jsp" %>
  </div>
  
  <%
  	// 쿠키에 저장된 배송 정보를 모두 삭제
  	Cookie[] cookies = request.getCookies();
  	for (Cookie cookie : cookies) {
  		String name = cookie.getName();
      if (name.startsWith("Shipping_")) { // Shipping 관련 쿠키만 처리
          cookie.setMaxAge(0);
			  	response.addCookie(cookie);
      }
  	}
  %>
</body>
</html>