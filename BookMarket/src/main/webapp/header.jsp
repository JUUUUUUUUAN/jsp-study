<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 헤더(메뉴) 영역 -->
	<header class="pb-3 mb-4 border-bottom">
		<div class="container">
			<div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
		    <a href="./welcome.jsp" class="d-flex align-items-center text-dark text-decoration-none mb-3 mb-md-0 me-md-auto">
		    	<!-- 홈 아이콘 -->
			    <svg width="32" height="32" fill="currentColor" class="bi bi-house-fill" viewBox="0 0 16 16">
			  		<path d="M8.707 1.5a1 1 0 0 0-1.414 0L.646 8.146a.5.5 0 0 0 .708.708L8 2.207l6.646 6.647a.5.5 0 0 0 .708-.708L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.707 1.5Z"/>
			  		<path d="m8 3.293 6 6V13.5a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 13.5V9.293l6-6Z"/>
					</svg>
					<!-- 홈 메뉴 -->
			    <span class="fs-4">Home</span>
		    </a>
    
		    <!-- 메뉴 추가 -->
		    <!-- c:url 태그 사용 시 컨텍스트 경로(context path) 자동 포함(즉, 절대 경로를 써도 안전) -->
		    <ul class="nav nav-pills">
		    	<c:choose>
		    		<c:when test="${empty sessionScope.loginId}">
		    			<li class="nav-item">
		    				<a href="<c:url value="/member/loginMember.jsp" />" class="nav-link">로그인</a>
		    			</li>
		    			<li class="nav-item">
		    				<a href="<c:url value="/member/addMember.jsp" />" class="nav-link">회원가입</a>
		    			</li>
		    		</c:when>
		    		<c:otherwise>
		    			<li style="padding-top: 7px">
		    				[${sessionScope.loginId}님]
		    			</li>
		    			<li class="nav-item">
		    				<a href="<c:url value="/member/logoutMember.jsp" />" class="nav-link">로그아웃</a>
		    			</li>
		    			<li class="nav-item">
		    				<a href="<c:url value="/member/updateMember.jsp" />" class="nav-link">회원수정</a>
		    			</li>
		    		</c:otherwise>
		    	</c:choose>
		    	
		    	<li class="nav-item">
		    		<a href="./books.jsp" class="nav-link">도서 목록</a>
		    	</li>
		    	<li class="nav-item">
		    		<a href="./addBook.jsp" class="nav-link">도서 등록</a>
		    	</li>
		    	<li class="nav-item">
		    		<a href="./editBook.jsp?edit=update" class="nav-link">도서 수정</a>
		    	</li>
		    	<li class="nav-item">
		    		<a href="./editBook.jsp?edit=delete" class="nav-link">도서 삭제</a>
		    	</li>
		    </ul>
    	</div>
    </div>
   </header>
</body>
</html>