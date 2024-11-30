/**
 <!-- write.js : 조용기 --> 
 */

function validateForm() {
    const titleInput = document.getElementById("title").value.trim(); // 제목 값 가져오기 (공백 제거)
	const starsSelected = document.querySelector('input[name="stars"]:checked'); // 별점 예외처리
	const password = document.getElementById("password").value.trim();
	
	//글제목 예외처리
    if (titleInput.length < 5) {
        alert("제목은 최소 5자 이상이어야 합니다.");
        return false; // 폼 제출 중단
    }
	
	//별점 표기 예외처리
    if (!starsSelected) {
        alert("별점을 선택해주세요."); // 경고 메시지 표시
        return false; // 폼 제출 중단
    }

    //비밀번호 예외 처리
    if (password.length < 4) {
        alert("비밀번호는 최소 4자 이상이어야 합니다.");
        return false; // 폼 제출 중단
    }

    return true; // 조건 충족 시 폼 제출 진행
}

