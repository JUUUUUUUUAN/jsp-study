<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Form processing</title>
</head>
<body>
	<!-- textarea 태그로 가입 인사 추가하기 -->
	<h3>회원가입</h3>
	<form action="#" name="member" method="post">
		<p>
			아이디: <input type="text" name="id">
			<input type="button" value="아이디 중복검사">
		</p>
		<p>
			비밀번호: <input type="password" name="passwd"> 
		</p>
		<p>
			이름: <input type="text" neme="name"> 
		</p>
		<p>연락처: 
	 		<select name="phone1">
	 			<option value="010">010</option>
	 			<option value="011">011</option>
	 			<option value="016">016</option>
	 			<option value="017">017</option>
	 			<option value="019">019</option>
	 		</select> - 
			<input type="text" maxlength="4" size="4" name="phone2"> - 
			<input type="text" maxlength="4" size="4" name="phone3">
	 	</p>
		<p>
			성별: 
			<input type="radio" name="gender" value="male" checked="checked">남성 
			<input type="radio" name="gender" value="female">여성 </p>
		<p>
			취미: 
			독서<input type="checkbox" name="hobby1" checked>
			운동<input type="checkbox" name="hobby2"> 
			영화<input type="checkbox" name="hobby3">
		</p>
		<p>
			<textarea rows="3" cols="30" name="comment" placeholder="가입 인사를 입력해주세요."></textarea>
		</p>
		<p>
			<button type="submit">가입하기</button> 
			<button type="reset">다시쓰기</button>
		</p>
	</form>
	
	
	
</body>
</html>