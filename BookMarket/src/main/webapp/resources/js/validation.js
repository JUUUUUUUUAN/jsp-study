/**
 * 
 */
function checkAddBook(e) {
	const bookId = document.getElementById("bookId");
	const name = document.getElementById("name");
	const unitPrice = document.getElementById("unitPrice");
	const unitsInStock = document.getElementById("unitsInStock");
	const description = document.getElementById("description");

	// 도서아이디 체크
	// '[도서 코드]\nISBN과 숫자를 조합하여 8~15자까지 입력하세요.\n첫 글자는 반드시 ISBN으로 시작하세요.'
	// 정규 표현식 사용
	const regExpBookId = /^ISBN[0-9]{4,11}$/; 
	if(!regExpBookId.test(bookId.value)){
		alert('[도서 코드]\nISBN과 숫자를 조합하여 8~15자까지 입력하세요.\n첫 글자는 반드시 ISBN으로 시작하세요.');
		bookid.focus();
		e.preventDefault();
		return;
	}
	
	// 도서명 체크
	// '[도서명]\n최소 4자에서 최대 50자까지 입력하세요.'
	if(name.value.length < 4 || name.value.length > 50){
		alert('[도서명]\n최소 4자에서 최대 50자까지 입력하세요.');
		name.focus();
		e.preventDefault();
		return;
	}
	
	// 도서 가격 체크
	// '[가격]\n숫자만 입력하세요.'
	// '[가격]\n음수를 입력할 수 없습니다.'
	if(unitPrice.value.length === 0 || isNaN(unitPrice.value)){
		alert('[가격]\n숫자만 입력하세요.');
		unitPrice.focus();
		e.preventDefault();
		return;
	}
	if(unitPrice.value < 0){
			alert('[가격]\n음수를 입력할 수 없습니다.');
			unitPrice.focus();
			e.preventDefault();
			return;
		}
	
		// (참고) 만약 소수점 이하 최대 2자리까지 허용하는 숫자를 체크하는 정규식
		/^\d+(\.\d{1,2})?$/ 
	
	// 재고 수 체크
	// "[재고 수]\n숫자만 입력하세요."
	if(unitsInStock.value === 0 || isNaN(unitsInStock.value)){
			alert('[재고 수]\n숫자만 입력하세요.');
			unitsInStock.focus();
			e.preventDefault();
			return;
		}
	
	// 상세설명 체크
	// "[상세설명]\n최소 100자 이상 입력하세요."
	if(description.value.length <= 100){
			alert("[상세설명]\n최소 100자 이상 입력하세요.");
			description.focus();
			e.preventDefault();
			return;
		}	

}
