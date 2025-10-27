<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>로그인</title>
	
	<!-- 부트스트랩 연결 -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<div class="container py-4">
		<!-- 헤더(메뉴) 영역 -->
		<%@ include file="/header.jsp" %>

		<!-- 중간 타이틀 영역 -->
    <jsp:include page="/title.jsp">
    	<jsp:param value="회원 로그인" name="title"/>
    	<jsp:param value="Membership Login" name="subtitle"/>
    </jsp:include>

		<!-- 본문 영역 -->
    <div class="container text-center">
			<div class="col-md-4 mx-auto">
				<h3 class="form-signin-heading">Please sign in</h3>
				
				<c:if test="${not empty param.error}">
					<div class="alert alert-danger">아이디와 비밀번호를 확인해 주세요.	</div>
				</c:if>
				
  			<form class="form-signin" action="processLoginMember.jsp" method="post">
    			<div class="form-floating mb-3">     
     				<input type="text" class="form-control" name="id" id="floatingInput" placeholder="ID" required autofocus>
     				<label for="floatingInput">ID</label>
    			</div>
    			<div class="form-floating mb-3">     
  	 				<input type="password" class="form-control" name="password" placeholder="Password">
	    			<label for="floatingPassword">Password</label>
					</div>
  				<button type="submit" class="btn btn-lg btn-success w-100">로그인</button>
  			</form>
			</div>
		</div>
		
		<!-- 푸터(바닥글) 영역 -->
    <%@ include file="/footer.jsp" %>
  </div>
</body>
</html>