<%@	taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<!-- Favicon-->
<link rel="icon" type="image/x-icon"
	href="/resources/assets/favicon.ico" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="/resources/css/styles.css" rel="stylesheet" />
<title>글 작성 페이지</title>

<!-- Bootstrap Core CSS -->
<link href="/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="/resources/vendor/metisMenu/metisMenu.min.css"
	rel="stylesheet">

<!-- DataTables CSS -->
<link
	href="/resources/vendor/datatables-plugins/dataTables.bootstrap.css"
	rel="stylesheet">

<!-- DataTables Responsive CSS -->
<link
	href="/resources/vendor/datatables-responsive/dataTables.responsive.css"
	rel="stylesheet">

<!-- Custom CSS -->
<link href="/resources/dist/css/sb-admin-2.css" rel="stylesheet">


<link href="/resources/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">


<link href="/resources/css/write.css" rel="stylesheet">
</head>

<body>
	<%@ include file="../includes/header.jsp"%>
	<div class="container px-4 px-lg-5">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">게시글 작성</h1>
			</div>
			<!-- /.col-lg-12 -->
		</div>
		<!-- /.row -->

		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">

					<div class="panel-heading">Board Register</div>
					<!-- /.panel-heading -->
					<div class="panel-body">

						<form role="form" action="/board/write" method="post"
							enctype="multipart/form-data">
							<div class="form-group">
								<label>음식점 이름</label> 
								<input class="form-control" name='rname'>
							</div>
							
						<div class="form-group">
								<label id="ticket_flex"> 
								<input type="checkbox" name="ticket" value="yes"> 
								<img id="ticketImg"
									src="/resources/assets/ticket-image.png" height="30px" />
								</label>
						</div>
						
						<!-- 분류 select box 추가 -->
							<div class="form-group">
								<label>분류</label> 
								<select class="form-control" name="type">
									<option value="한식">한식</option>
									<option value="일식">일식</option>
									<option value="중식">중식</option>
									<option value="양식">양식</option>
									<option value="아시안">아시안푸드</option>
									<option value="카페">카페</option>
									<option value="분식">분식</option>
									<option value="기타">기타</option>
								</select>
							</div>
							
						<!-- 별점 추가 -->
						<input type="hidden" id="bno" name="bno" value="${board.bno}" />
						    <div class="form-group">
						        <label>별점</label>
						        <div class="rating">
						            <input type="radio" name="stars" value="5" id="5">
						            <label for="5">☆</label>
						            <input type="radio" name="stars" value="4" id="4">
						            <label for="4">☆</label>
						            <input type="radio" name="stars" value="3" id="3">
						            <label for="3">☆</label>
						            <input type="radio" name="stars" value="2" id="2">
						            <label for="2">☆</label>
						            <input type="radio" name="stars" value="1" id="1">
						            <label for="1">☆</label>
						        </div>
						    </div>
													
							
							<div class="form-group">
								<label>글 제목</label> 
								<input class="form-control" name='title'>
							</div>

							<div class="form-group">
								<label>내용</label>
								<textarea class="form-control" rows="3" name='content'></textarea>
							</div>

							

							<div class="form-group">
								<label>작성자</label>
								<input class="form-control" name='writer'>
							</div>


							<!-- 파일 업로드 -->

							<div class="form-group">
								<label>파일 업로드</label> 
								<input type="file" class="form-control" name="file">
							</div>


							<!-- 비밀번호 입력 -->
							<div class="form-group">
								<label>비밀번호 입력</label>
								<input type="password" class="form-control" 
								name="password" placeholder="비밀번호를 입력하세요">
							</div>

							<button type="submit" class="btn btn-default">등록하기</button>
							<button type="reset" class="btn btn-default">되돌리기</button>
						</form>
					</div>
					<!-- end panel-body -->
				</div>
				<!-- end panel body-->
			</div>
			<!-- end panel-->
		</div>
	</div>
	<!-- /.row -->
	<%@ include file="../includes/footer.jsp"%>
	
	<script>
	
        document.querySelectorAll('input[name="rating"]').forEach((star) => {
            star.addEventListener('change', (event) => {
                const stars = event.target.value; // 선택된 별점 값
                const bno = document.querySelector('#bno').value; // 게시글 번호

                fetch(`/board/${bno}/stars`, {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded',
                    },
                    body: `stars=${stars}`,
                })
                    .then((response) => {
                        if (response.ok) {
                            alert('별점이 저장되었습니다.');
                        } else {
                            alert('별점 저장 실패');
                        }
                    })
                    .catch((error) => console.error('Error:', error));
            });
        });
    </script>
</body>

</html>
