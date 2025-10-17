<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Form processing</title>
</head>
<body>
	<!-- form 태그와 input 태그로 간단한 회원 가입 양식 만들기 -->
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
	 		<input type="text" maxlength="4" size="4" name="phone1"> - 
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
			<button type="submit">가입하기</button> 
			<button type="reset">다시쓰기</button>
		</p>
	</form>
	
	
	
</body>
</html>