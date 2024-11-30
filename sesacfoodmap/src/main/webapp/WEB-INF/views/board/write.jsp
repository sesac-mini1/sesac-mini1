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

<!-- Custom CSS -->
<link href="/resources/dist/css/sb-admin-2.css" rel="stylesheet">


<link href="/resources/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<link href="/resources/css/write.css" rel="stylesheet">

<script type="text/javascript" src="/resources/js/write.js"></script>
</head>

<!-- 조용기 -->
<body>
	<%@ include file="../includes/header.jsp"%>
	<div class="container px-4 px-lg-5">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">게시글 작성</h1>
			</div>
			<!-- /.col-lg-12 --> 
			<!-- write.jsp 화면: 조용기 -->
		</div>
		<!-- /.row -->

		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">

					<div class="panel-heading">글 쓰기</div>
					<!-- /.panel-heading -->
					<div class="panel-body">

						<form role="form" action="/board/write" method="post"
							enctype="multipart/form-data" onsubmit="return validateForm()">
							<div class="form-group">
								<label>음식점 이름</label> 
								<input class="form-control" name='rname'>
							</div>
							<!-- 분류 select box 추가 -->
					<div class="form-group flex-container">
				    <!-- 분류 -->
				    <div class="custom-item">
				        <label class="me-3" for="type">
				        	<span class="label-top">분류</span>
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
				        </label>
				        
				    </div>
				
				    <!-- 식권대장 -->
				    <div class="custom-item">
				        <label id="ticket_flex">
				            <input type="checkbox" name="ticket">
				            <img id="ticketImg" src="/resources/assets/ticket-image.png" alt="식권대장" />
				        </label>
				    </div>
				
				    <!-- 별점 -->
				    <div class="custom-item">
				        <label  class="me-3">
					        <span class="label-top">별점</span>
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
				        </label>
				    </div>
				</div>
							<div class="form-group">
								<label>글 제목</label> 
								<input class="form-control" name='title' id='title'>
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
								<input type="file" class="form-control" id="file-name" name="file" accept="image/*">
							</div>


							<!-- 비밀번호 입력 -->
							<div class="form-group">
								<label>비밀번호 입력</label>
								<input type="password" class="form-control" 
								name="password" id="password" placeholder="비밀번호를 입력하세요">
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
</body>

</html>
