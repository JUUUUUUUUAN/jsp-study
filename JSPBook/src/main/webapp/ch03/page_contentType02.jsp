<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- (참고)
	pageEncoding="UTF-8" -> 서버(JSP 처리 시점)에서 JSP 파일을 UTF-8로 해석
	contentType="text/html; charset="UTF-8" -> 클라이언트(브라우저)에게 "응답은 UTF-8 이야"라고 알려줌 
	
	일반적으로 둘 다 설정해 두는 게 안전(한글 깨짐 방지)
-->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Directives Tag</title>
</head>
<body>
	<!-- page 디렉티브 태그에 콘텐츠 유형을 XML 문서로 한글 출력 설정하기 -->
	<!-- JSP는 직접 XML 문서를 생성하는 용도가 아니기 때문에 
		필요하면 응답 헤더로 XML임을 지정하는게 안전-->
	
	<%
		response.setContentType("text/xml; charset=UTF-8");
	%>
	<h2>contentType 디렉티브 태그</h2>
	<h4>text/xml: XML 출력</h4>
	<h4>charset=UTF-8: 문자 인코딩</h4>
</body>
</html>