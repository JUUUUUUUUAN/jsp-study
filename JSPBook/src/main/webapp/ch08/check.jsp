<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Validation</title>
</head>
<body>
	<!-- 폼 페이지에서 입력한 아이디와 비밀번호 값이 숫자인지 검사하기 -->
	<form name="frm">
		<p>이름: <input type="text" name="name"></p>
		<button type="submit" onclick="checkForm(event)">전송</button>
	</form>
	
	<script type="text/javascript">
		function checkForm(e) {
			const str = document.frm.name.value;
			
			// const regExp = /^[a-z|A-Z|ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
			// 의미?
			// ^: 문자열의 시작
			// []: 범위 중에 한 문자 
			// a~z, |(파이프 문자), A~Z, 또 |, ㄱ~ㅎ, |, ㅏ~ㅣ, |, 가~힣 중 하나의 문자와 매치 
			// 끝에 $ 없음 -> 문자열의 첫 글자만 검사하고, 그 뒤는 신경 쓰지 않음
			
			// 첫 글자가 영문자 또는 한글인 경우만 통과시키려면 아래와 같이 작성
			// const regExp = /^[a-zA-Zㄱ-ㅎㅏ-ㅣ가-힣]/;
			// 범위 지정 시에는 |를 넣지 않고 연속해서 써야 함
			
			// 문자 전체가 영문/한글로만 이루어져야 함: ^[a-zA-Zㄱ-ㅎㅏ-ㅣ가-힣]+$
			// 숫자까지 추가하면: ^[a-zA-Z0-9ㄱ-ㅎㅏ-ㅣ가-힣]+$
			
			// 숫자로 시작
			const regExp = /^[0-9]/;
			
			if (regExp.test(str)) {
				alert("이름은 숫자로 시작할 수 없습니다.");
				e.preventDefault;
				return;
			}
			
		}
	</script>
</body>
</html>