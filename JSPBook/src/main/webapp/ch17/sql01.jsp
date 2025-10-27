<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL</title>
</head>
<body>
	<%-- <sql:query> 태그로 SELECT 쿼리문 실행하기 --%>
	
	<!-- DB 연결 정보를 설정하고, JSTL 내부적으로 사용할 DataSource 객체를 생성 -->
	<!-- DataSource란? DB 연결을 관리하는 객체(Connection을 생성/재사용) -->
	<sql:setDataSource var="dataSource"
		url="jdbc:mysql://127.0.0.1:3306/jspbookdb"
		driver="com.mysql.cj.jdbc.Driver" user="root" password="redsafe0914!" />
	
	<!-- 앞에서 만든 dataSource에 담긴 객체를 참조하여 Connection을 얻어 SQL을 실행 -->
	<sql:query var="resultSet" dataSource="${dataSource}">
		SELECT * FROM member
	</sql:query>
	
	<table>
		<tr>
			<!-- items: 자바의 for-each문과 같은 역할 -->
			<c:forEach var="columnName" items="${resultSet.columnNames}">
				<th style="width: 100px">
					<c:out value="${columnName}" />
				</th>
			</c:forEach>
		</tr>
		
		<c:forEach var="row" items="${resultSet.rowsByIndex}">
			<tr>
				<c:forEach var="column" items="${row}">
					<td>
						<c:if test="${column != null }">
							<c:out value="${column}" />
						</c:if>
						<c:if test="${column == null }">
							&nbsp;
						</c:if>
					</td>
				</c:forEach>
			</tr>
		</c:forEach>
	</table>
	
	<!-- JSTL SQL 태그의 Result 객체가 제공하는 프로퍼티
		columnNames: 컬럼명 목록, 예: ["id", "passwd", "name"], List<String> 타입
		rows: 컬럼명/값 형태의 행 리스트, 각 행을 Map으로 표현, List<Map<String, Object>> 타입
		rowsByIndex: 2차원 배열 형태의 행 리스트, List<List<Object>> 타입(인덱스 기반 접근용)
		rowCount: 결과 행의 수
		updateCount: 갱신된 행의 수(SELECT 아닐 경우) 
	-->
</body>
</html>