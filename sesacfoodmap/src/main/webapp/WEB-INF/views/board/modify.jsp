
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>   
<%@ page session="false" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="/resources/assets/favicon.ico" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="/resources/css/styles.css" rel="stylesheet" />
    <link href="/resources/css/sesac.css" rel="stylesheet" />
    <link href="/resources/css/get.css" rel="stylesheet" />
    <title>글 수정 페이지</title>
   
    <!-- Bootstrap Core CSS -->
    <link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="/resources/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- DataTables CSS -->
    <link href="/resources/vendor/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet">

    <!-- DataTables Responsive CSS -->
    <link href="/resources/vendor/datatables-responsive/dataTables.responsive.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/resources/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- List page CSS -->
    <link href="../resources/css/modify.css" rel="stylesheet" />
    
    
</head>

<body class="d-flex flex-column min-vh-100">

	<%@ include file="../includes/header.jsp" %>
    <!-- Page Content-->
    <div id="modify_body" class="container px-4 px-lg-5">
        <div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">게시글 수정</h1>
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
</div>

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default">

            <div class="panel-heading">Board Read Page</div>
            <!-- /.panel-heading -->
            <div class="panel-body">
            
                <!-- Main Form -->
                <form role="form" action="/board/modify" method="post">
                    <!-- Hidden Fields -->
                    <input type="hidden" name="pageNum" value="<c:out value='${cri.pageNum}'/>">
                    <input type="hidden" name="amount" value="<c:out value='${cri.amount}'/>">
                    <input type="hidden" name="type" value="<c:out value='${cri.type}'/>">
                    <input type="hidden" name="keyword" value="<c:out value='${cri.keyword}'/>">
                    <input type="hidden" name="bno" value="<c:out value='${board.bno}'/>">
                    <input type="hidden" id="boardPassword" name="boardPassword" value="<c:out value='${board.password}'/>">
                    
                    <!-- 음식점 이름 -->
                    <div class="form-group">
                        <label>음식점 이름</label>
                        <input class="form-control" name="rname" value="<c:out value='${board.rname}'/>">
                    </div>
                    
                    <div class="form-group flex-container">
                    
                    <!-- 분류 -->
                    <div class="custom-item">
                        <label>분류</label>
                        <select class="form-control" name="type">
                            <option value="koreanfood" <c:if test="${board.type == '한식'}">selected</c:if>>한식</option>
                            <option value="japanessfood" <c:if test="${board.type == '일식'}">selected</c:if>>일식</option>
                            <option value="chinesefood" <c:if test="${board.type == '중식'}">selected</c:if>>중식</option>
                            <option value="westernfood" <c:if test="${board.type == '양식'}">selected</c:if>>양식</option>
                            <option value="asianfood" <c:if test="${board.type == '아시안'}">selected</c:if>>아시안푸드</option>
                            <option value="cafefood" <c:if test="${board.type == '카페'}">selected</c:if>>카페</option>
                            <option value="snackfood" <c:if test="${board.type == '분식'}">selected</c:if>>분식</option>
                            <option value="etc" <c:if test="${board.type == '기타'}">selected</c:if>>기타</option>
                        </select>
                    </div>
                    
                    <!-- 식권대장 -->
				    <div class="custom-item">
				        <label id="ticket_flex">
				            <input type="checkbox" name="ticket" value="yes" ${board.ticket ? 'checked' : ''}>
				            <img id="ticketImg" src="/resources/assets/ticket-image.png" alt="식권대장" />
				        </label>
				    </div>
                    
                     <!-- 별점 -->
				    <div class="custom-item">
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
				    </div>
				    
		
							
					<!-- 글 제목 -->
                    <div class="form-group">
                        <label>글 제목</label>
                        <input class="form-control" name="title" value="<c:out value='${board.title}'/>">
                    </div>
                    
                    <!-- 내용 -->
                    <div class="form-group">
                        <label>내용</label>
                        <textarea class="form-control" rows="3" name="content"><c:out value="${board.content}"/></textarea>
                    </div>
                    

                    <div class="form-group">
						<label>파일 업로드</label> 
						<input type="file" class="form-control" name="fileUpload" multiple>
					</div>
                    
                    <!-- 버튼 -->
                    <button type="submit" data-oper="modify" class="btn btn-default">수정하기</button>
                    <button id="removeBoard" type="button" data-bno="${board.bno}" class="btn btn-default">삭제하기</button>
                    <button id="listBoard" type="submit" data-oper="list" class="btn btn-default">글 목록</button>
                </form>

            </div>
            <!-- /.panel-body -->
        </div>
        <!-- /.panel -->
    </div>
</div>

<!-- /.row -->

<%-- <div id="box">
	<form id="modalForm">
	                <div class="modal-body">
						<div class="form-group">
							<label>비밀번호</label>
							<input type="password" class="form-control" name="password">
						</div>
						<input type="hidden" name="bno" value="${board.bno}">
					</div>
	                <div class="modal-footer">
	                    <button id="modalSubmitBtn" type="button" class="btn btn-primary">확인</button>
	                    <button type="button" class="btn btn-default modalCloseBtn" data-dismiss="modal">취소</button>
	                </div>
                </form>
</div> --%>
            
    <!-- Password Modal -->
<%--   <div class="modal fade" id="passwordModal" tabindex="-1" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">비밀번호 확인</h4>
                </div>
                <form id="modalForm">
	                <div class="modal-body">
						<div class="form-group">
							<label>비밀번호</label>
							<input type="password" class="form-control" name="password">
						</div>
						<input type="hidden" name="bno" value="${board.bno}">
					</div>
	                <div class="modal-footer">
	                    <button id="modalSubmitBtn" type="button" class="btn btn-primary">확인</button>
	                    <button type="button" class="btn btn-default modalCloseBtn" data-dismiss="modal">취소</button>
	                </div>
                </form>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>  --%>
    
    <div class="modal" tabindex="-1">
         <div class="modal-dialog">
            <div class="modal-content">
               <div class="modal-header">
                  <h5 class="modal-title">비밀번호 확인</h5>
                  <button type="button" class="btn-close" data-bs-dismiss="modal"
                     aria-label="Close"></button>
               </div>
               <form id="modalForm">
	                <div class="modal-body">
						<div class="form-group">
							<label>비밀번호</label>
							<input type="password" class="form-control" name="password">
						</div>
						<input type="hidden" name="bno" value="${board.bno}">
					</div>
	                <div class="modal-footer">
	                    <button id="modalSubmitBtn" type="button" class="btn btn-primary">확인</button>
	                    <button type="button" class="btn btn-default modalCloseBtn" data-dismiss="modal">취소</button>
	                </div>
                </form>
            </div>
         </div>
      </div>
      
<%@ include file="../includes/footer.jsp" %>
</body>

<script type="text/javascript">
$(document).ready(function() {
	let pmodal = $(".modal");
	let modalInputPassword = pmodal.find("input[name='password']");
	let bnoValue = `<c:out value="${board.bno}" />`;
	let modalSubmitBtn = $("#modalSubmitBtn");
	
	$("#removeBoard").on("click", function (e) {
		e.preventDefault(); // 기본 동작 방지
		
			// 초기화 작업
			modalInputPassword.val(""); // 비밀번호 초기화
			pmodal.data("bno", bnoValue); // 데이터 설정
			
			// 로그 확인
			console.log("BNO value:", pmodal.data("bno"));
			
			// 모달 열기
			pmodal.show();
		    console.log("Modal opened.");
	
	});

    
	let modalForm = $("#modalForm");
	modalSubmitBtn.click(function(e) {
		modalForm.attr("action", "/board/remove");  // 삭제 경로 설정
		modalForm.attr("method", "post");  // 삭제 경로 설정
		modalForm.submit();  // 폼 전송
		let msg = '${result}';
	    if(msg === 'fail') {
	        alert("글 삭제에 실패했습니다. 비밀번호를 다시 확인하세요.");
	    }
	});
   

	$('.modalCloseBtn').click(function(e) {
	
		modalInputPassword.val("");
		pmodal.hide();
		console.log("Modal closed.");
	})
    
    //글 목록 
    $("#listBoard").on("click", function (e) {
    	 self.location = "/board/list";  // 목록 페이지로 이동
         return;
    });
});

</script>

</html>