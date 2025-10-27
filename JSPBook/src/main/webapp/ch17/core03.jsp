<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL</title>
</head>
<body>
	<!-- 구구단 출력하기 -->
	<h3>구구단</h3>
	<table>
		<c:forEach var="i" begin="1" end="9">
			<tr>
				<c:forEach var="j" begin="1" end="9">
					<td style="width: 100px">${i} * ${j} = ${i * j}</td>
				</c:forEach>
			</tr>
		</c:forEach>
	</table>
	
	<br>
	
	<!-- (참고) vatStatus 속성: 반복 상태를 담는 특별한 객체
	반복문이 몇 번째 반복인지, 마지막 반복인지, 혹은 인덱스 정보 등 반복 관련 정보를 얻고 싶을 때 사용 -->
	<c:forEach var="i" begin="2" end="5" varStatus="loop">
		${i}번째 반복,
		index=${loop.index},	<!-- begin 값부터 시작하는 인덱스 -->
		count=${loop.count},	<!-- 1부터 시작하는 카운트 -->
		first=${loop.first},	<!-- 첫번째 반복이면 true -->
		last=${loop.last}			<!-- 마지막 반복이면 true -->
		<br>
	</c:forEach>
</body>
</html>