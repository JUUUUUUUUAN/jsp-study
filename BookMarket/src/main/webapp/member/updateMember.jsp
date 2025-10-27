<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 수정</title>

<!-- 부트스트랩 연결 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">

	<script type="text/javascript">
	function checkForm(e) {
		if (!document.newMember.id.value) {
			alert("아이디를 입력하세요.");
			e.preventDefault(); // 기본 동작 막기(여기서는 폼 제출 차단)
			return;
		}

		if (!document.newMember.password.value) {
			alert("비밀번호를 입력하세요.");
			e.preventDefault(); // 기본 동작 막기(여기서는 폼 제출 차단)
			return;
		}

		if (document.newMember.password.value !== document.newMember.password_confirm.value) {
			alert("비밀번호를 동일하게 입력하세요.");
			e.preventDefault(); // 기본 동작 막기(여기서는 폼 제출 차단)
			return;
		}
	}
	</script>
</head>
<body>
	<sql:setDataSource var="dataSource"
		url="jdbc:mysql://127.0.0.1:3306/bookmarketdb"
		driver="com.mysql.cj.jdbc.Driver" user="root" password="redsafe0914!" />
	
	<sql:query var="resultSet" dataSource="${dataSource}">
		SELECT * FROM member WHERE id = ?
		<sql:param value="${sessionScope.loginId}" />
	</sql:query>
	
	<div class="container py-4">
		<!-- 헤더 -->
		<%@ include file="/header.jsp"  %>
		
		<!-- 중간 타이틀 영역 -->
    <jsp:include page="/title.jsp">
    	<jsp:param value="회원 수정" name="title"/>
    	<jsp:param value="Membership Updating" name="subtitle"/>
    </jsp:include>
    
    <c:if test="${not empty resultSet.rows}"> <!-- 가져온 회원 정보가 존재한다면 -->
			<c:set var="row" value="${resultSet.rows[0]}" />
			<c:set var="mailParts" value="${fn:split(row.mail, '@')}" />
			<c:set var="mail1" value="${mailParts[0]}" />
			<c:set var="mail2" value="${mailParts[1]}" />
			<c:set var="birthParts" value="${fn:split(row.birth, '/')}" />
			<c:set var="year" value="${birthParts[0]}" />
			<c:set var="month" value="${birthParts[1]}" />
			<c:set var="day" value="${birthParts[2]}" />
			
			<!-- 본문 영역 -->
	    <div class="row align-items-md-stretch">
	    	<form name="newMember" action="processUpdateMember.jsp" method="post" onsubmit="checkForm(event)">
					<div class="mb-3 row">
						<label class="col-sm-2">아이디</label>
						<div class="col-sm-3">
							<input name="id" type="text" class="form-control" placeholder="id" value="${row.id}" readonly>
						</div>
					</div>
					<div class="mb-3 row">
						<label class="col-sm-2">비밀번호</label>
						<div class="col-sm-3">
							<input name="password" type="password" class="form-control" placeholder="password" value="${row.password}">
						</div>
					</div>
					<div class="mb-3 row">
						<label class="col-sm-2">비밀번호 확인</label>
						<div class="col-sm-3">
							<input name="password_confirm" type="password" class="form-control" placeholder="password confirm">
						</div>
					</div>
					<div class="mb-3 row">
						<label class="col-sm-2">성명</label>
						<div class="col-sm-3">
							<input name="name" type="text" class="form-control" placeholder="name" value="${row.name}">
						</div>
					</div>
					<div class="mb-3 row">
						<label class="col-sm-2">성별</label>
						<div class="col-sm-2">
							<input name="gender" type="radio" value="남" ${row.gender eq "남" ? "checked" : ""}> 남 
							<input name="gender" type="radio" value="여" ${row.gender eq "여" ? "checked" : ""}> 여
						</div>
					</div>
					<div class="mb-3 row">
						<label class="col-sm-2">생일</label>
						<div class="col-sm-10">
						  <div class="row">
						  	<div class="col-sm-2">
									<input type="text" name="birthyy" maxlength="4" class="form-control" placeholder="년(4자)" size="6" value="${year}"> 
								</div>
								<div class="col-sm-2">
									<select name="birthmm" class="form-select">
										<option value="">월</option>
										<option value="01" ${month == "01" ? "selected" : ""}>1</option>
										<option value="02" ${month == "02" ? "selected" : ""}>2</option>
										<option value="03" ${month == "03" ? "selected" : ""}>3</option>
										<option value="04" ${month == "04" ? "selected" : ""}>4</option>
										<option value="05" ${month == "05" ? "selected" : ""}>5</option>
										<option value="06" ${month == "06" ? "selected" : ""}>6</option>
										<option value="07" ${month == "07" ? "selected" : ""}>7</option>
										<option value="08" ${month == "08" ? "selected" : ""}>8</option>
										<option value="09" ${month == "09" ? "selected" : ""}>9</option>
										<option value="10" ${month == "10" ? "selected" : ""}>10</option>
										<option value="11" ${month == "11" ? "selected" : ""}>11</option>
										<option value="12" ${month == "12" ? "selected" : ""}>12</option>
									</select> 
								</div>
								<div class="col-sm-2">
									<input type="text" name="birthdd" maxlength="2" class="form-control" placeholder="일" size="4" value="${day}">
								</div>
							</div>
						</div>
					</div>
					<div class="mb-3 row">
						<label class="col-sm-2">이메일</label>
						<div class="col-sm-10">
						  <div class="row">
								<div class="col-sm-4">
									<input type="text" name="mail1" maxlength="50" class="form-control" placeholder="email" value="${mail1}">
								</div> @
								<div class="col-sm-3">
									<select name="mail2" class="form-select">
										<option value="naver.com">naver.com</option>
										<option value="daum.net">daum.net</option>
										<option value="gmail.com">gmail.com</option>
										<option value="nate.com">nate.com</option>
									</select>
								</div>
							</div>		
						</div>		
					</div>
					<div class="mb-3 row">
						<label class="col-sm-2">전화번호</label>
						<div class="col-sm-3">
							<input name="phone" type="text" class="form-control" placeholder="phone" value="${row.phone}">
						</div>
					</div>
					<div class="mb-3 row">
						<label class="col-sm-2">주소</label>
						<div class="col-sm-5">
							<input name="address" type="text" class="form-control" placeholder="address" value="${row.address}">
						</div>
					</div>
					<div class="mb-3 row">
						<div class="col-sm-10">
							<button type="submit" class="btn btn-primary">회원수정</button>
              <a href="deleteMember.jsp" class="btn btn-primary">회원탈퇴</a>
						</div>
					</div>
				</form>
	 		</div>
    
    </c:if>

		
		<!-- 푸터 -->
		<%@ include file="/footer.jsp"  %>
		
  </div>
	
	
</body>
</html>