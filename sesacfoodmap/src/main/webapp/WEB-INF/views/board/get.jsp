<%@	taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
   
   	<!-- Bootstrap Core CSS -->
	<link href="/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
    <link href="/resources/css/sesac.css" rel="stylesheet" />
    <link href="/resources/css/get.css" rel="stylesheet" />
    <title>글 읽기 페이지</title>
</head>

<body>
<%@ include file="../includes/header.jsp" %>
	<!-- get.jsp 화면: 이지윤 -->
    <!-- Page content-->
    <div class="container mt-5">
        <div class="row">
            <div class="col-lg-8">
                <!-- Post content-->
                <article>
                    <input type="hidden" name="bno" value="${board.bno}">
                    <!-- Post header-->
                    <header class="mb-4">
                        <!-- Post title-->
                        <h4>[<c:out value="${board.rname}"/>]</h4><h1 class="fw-bolder mb-1"><c:out value="${board.title}" /></h1>
                        <!-- Post meta content-->
                        <div class="text-muted mb-2">
	                        <span class="fst-italic"><c:out value="${board.regDate}" /></span>
			                <span class="float-end ms-4"><c:out value="${board.writer}" /></span>
			                <span class="float-end ms-4" id="likeSpan">❤️ <span id="likeNumber"><c:out value="${board.recommend}" /></span></span>
	                        <span class="float-end">
	                        	<span>별점은</span>
	                        	<c:forEach var="i" begin="1" end="${board.stars}">
								    ⭐
								</c:forEach>								
								<span>(${board.stars}/5)</span>
							</span>
                        </div>
                        <!-- Post categories-->
                        <a class="badge bg-sesac text-decoration-none link-light"><c:out value="${board.type}" /></a>
                        <c:if test="${board.ticket}"><a class="badge bg-sesac text-decoration-none link-light">식권대장</a></c:if>
                		<a id="removeBoard" class="badge bg-secondary text-decoration-none link-light float-end ms-1">삭제</a>
                        <a class="badge bg-secondary text-decoration-none link-light float-end" href="/board/modify?bno=${board.bno}">수정</a>
                    </header>
                    <!-- Preview image figure-->
                    <c:if test="${not empty board.filename}">
                    <figure class="mb-4"><img class="img-fluid rounded" name="fileUpload"
                            src="/resources/uploadImg/${board.bno}/${board.filename}" /></figure>
                    </c:if>
                    <!-- Post content-->
                    <section class="mb-5">
                        <p class="fs-5 mb-4"><c:out value="${board.content}" /></p>
                    </section>
                </article>
                <!-- Comments section-->
                <section class="mb-5">
                    <div class="card bg-light">
                        <div class="card-body">
                            <!-- Comment form-->
                            <form class="addReply flex-wrap d-flex mb-4">
                            	<div class="flex-shrink-0"><img class="rounded-circle"
                                        src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." /></div>
                            	<span class="ms-3 w-85">
                            	<input class="h-85 br-10" placeholder="작성자 이름" name="writer" value="익명이" type="text"/>
                            	<input class="h-85 br-10" placeholder="비밀번호" name="password" type="password"/>
                                <input value="등록" type="button" id="addReplyBtn" class="h-85 mb-1 me-auto btn btn-sesac" />
                                <input type="hidden" name='bno' value="${board.bno}" />  
                            	<textarea class="form-control" rows="3" name="content"
                                    placeholder="게시글이 마음에 드셨나요? 멋진 댓글을 남겨보세요!"></textarea>
                            	</span>
                            </form>
                            <div class="reply">
                            	<!-- comments 위치 -->
	                   		</div>
	                   		<div class="panel-footer">
	                   			<!-- 페이징 자리 -->
	                   		</div>
                        </div>
                    </div>
                </section>
            </div>
        </div>
    </div>
    <!-- Reply Modal -->
	<div class="modal" id="replyModal" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">댓글 모달</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label>작성자</label>
						<input type="text" class="form-control" name="writer">
					</div>
					<div class="form-group">
						<label>내용</label>
						<textarea rows="3" class="form-control" name="content"></textarea>
					</div>
					<div class="form-group">
						<label>비밀번호</label>
						<input type="password" class="form-control" name="password">
					</div>
				</div>
				<div class="modal-footer">
					<button id="modalModifyBtn" type="button" class="btn btn-danger">수정</button>
                    <button id="modalRemoveBtn" type="button" class="btn btn-danger">삭제</button>
                    <button id="modalCloseBtn" type="button" class="btn btn-default" data-bs-dismiss="modal">취소</button>
				</div>
			</div>
          	<!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- end reply modal -->
    <!-- Password Modal -->
    <form id="modalForm" action="/board/remove" method="">
	    <div class="modal" id="passwordModal" tabindex="-1">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">비밀번호 확인</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label>비밀번호</label>
							<input type="password" class="form-control" name="password" id="pwOnly">
						</div>
						<input type="hidden" name="bno" value="${board.bno}">
					</div>
					<div class="modal-footer">
						<button id="modalSubmitBtn" type="button" class="btn btn-primary">확인</button>
		             	<button type="button" class="btn btn-default modalCloseBtn" data-bs-dismiss="modal">취소</button>
		          	</div>
				</div>
	            <!-- /.modal-content -->
	        </div>
	        <!-- /.modal-dialog -->
	    </div>
	</form>
    <!-- /.end password modal -->
<%@ include file="../includes/footer.jsp" %>
</body>
<script type="text/javascript" src="/resources/js/reply.js"></script>
<script type="text/javascript"> //이재혁
function clickLike() { 
	let bnoValue = `<c:out value="${board.bno}" />`;
	// like 버튼 중간 검증 과정이 있으면 좋음
	$.ajax({
		type: 'post',
		url: `/board/likeup`,
		data: JSON.stringify(bnoValue),
		contentType: "application/json; charset=utf-8",
		success: function (result, status, xhr) {
			if (result = "success"){
				let likeNum = parseInt(document.getElementById("likeNumber").innerHTML);
				document.getElementById("likeNumber").innerHTML = likeNum + 1;
			}
		},
		error: function (xhr, status, err) {
			if (err) {
				error(err);
			}
		}
	});
}

$(document).ready(()=>{
	document.getElementById("likeSpan").addEventListener("click", clickLike);
});
</script>
<script type="text/javascript">  //이지윤
$(function(){
	let bnoValue = `<c:out value="${board.bno}" />`;
	let replyUL = $(".reply");
	
	let pageNum = 1;
	let replyPageFooter = $(".panel-footer");
	
	showList(1);
	
	function showList(page) {
		console.log("show list: " + page);
		replyService.getList({bno:bnoValue,page:page||1}, function(replyCnt, list) {
			console.log("replyCnt: " + replyCnt);
			console.log("list: " + list);
			
			if (page == -1) {
				pageNum = Math.ceil(replyCnt/10.0);
				showList(pageNum);
				return;
			}
			
			let str = "";
			if (list == null || list.length == 0) {
				return;
			}
			for (let i = 0, len = list.length || 0; i < len; i++) {
				str += `<div class="cnoCLass d-flex mb-4" data-cno='\${list[i].cno}'>
                    		<div class="flex-shrink-0"><img class="rounded-circle"
                    		src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." /></div>
            				<div class="ms-3">
                				<div class="fw-bold">
                					\${list[i].writer}
                					<small class="text-muted">\${replyService.displayTime(list[i].regDate)}</small>
                					<span class="updateReplyBtn badge bg-secondary text-decoration-none link-light ms-2">수정</span>
                					<span class="removeReplyBtn badge bg-secondary text-decoration-none link-light">삭제</span>
               					</div>
               					\${list[i].content}
               				</div>
               			</div>`;
			}
			replyUL.html(str);
			showReplyPage(replyCnt);
		});
	} //end showList
	
	let addReply = $(".addReply");
	let inputContent = addReply.find("textarea[name='content']");
	let inputWriter = addReply.find("input[name='writer']");
	let inputPassword = addReply.find("input[name='password']");
	
	let addReplyBtn = $("#addReplyBtn");
	
	addReplyBtn.on("click", function(e){
		let reply = {
			content: inputContent.val(),
			writer: inputWriter.val(),
			password: inputPassword.val(),
			bno: bnoValue 
		};
		if(reply.content === null || reply.content === '') {
			alert("댓글 내용이 없습니다. 댓글을 작성한 뒤 등록 버튼을 눌러주세요.")
		} else {
			replyService.add(reply, function(result) {
				alert("성공적으로 댓글이 등록되었습니다.");
				inputContent.val("");
				inputWriter.val("익명이");
				inputPassword.val("");
				showList(1);
			});
		}
	});
	
	let modal = $(".modal");
	let rmodal = $("#replyModal");
	let pmodal = $("#passwordModal");
	let modalRemoveBtn = $("#modalRemoveBtn");
	let modalModifyBtn = $("#modalModifyBtn");
	let modalSubmitBtn = $("#modalSubmitBtn");
	let modalInputContent = modal.find("textarea[name='content']");
	let modalInputWriter = modal.find("input[name='writer']");
	let modalInputPassword = modal.find("input[name='password']");
	
	$("#removeBoard").on("click", function (e) {
		if(confirm("정말로 글을 삭제하시겠습니까?")){
			modalInputPassword.val("");
			pmodal.data("bno", bnoValue);
			
			pmodal.modal("show");
		} else{
			alert("삭제를 취소하였습니다.");
		}
	});
	
	$(document).on("click", ".updateReplyBtn", function (e) {
		let cno = $(this).closest(".cnoCLass").data("cno");
		//console.log(`log:\${cno}`);
		replyService.get(cno, function(reply){
			modalInputContent.val(reply.content).removeAttr("readonly");
			modalInputWriter.val(reply.writer).attr("readonly", "readonly");
			modalInputPassword.val("");
			rmodal.data("cno", reply.cno);
			
			modalRemoveBtn.hide();
			modalModifyBtn.show();
			rmodal.modal("show");
		});
	});
	
	$(document).on("click", ".removeReplyBtn", function (e) {
		let cno = $(this).closest(".cnoCLass").data("cno");
		//console.log(`log:\${cno}`);
		if(confirm("정말로 댓글을 삭제하시겠습니까?")){
			replyService.get(cno, function(reply){
				modalInputContent.val(reply.content).attr("readonly", "readonly");
				modalInputWriter.val(reply.writer).attr("readonly", "readonly");
				modalInputPassword.val("");
				rmodal.data("cno", reply.cno);
				
				modalModifyBtn.hide();
				modalRemoveBtn.show();
				rmodal.modal("show");
			});
		} else{
			alert("댓글 삭제를 취소하였습니다.");
		}
	});
	
	modalModifyBtn.click(function(e) {
		let reply = {cno: modal.data("cno"), content: modalInputContent.val(), 
				password: modalInputPassword.val()};
		replyService.update(reply, function(result) {
            alert('성공적으로 댓글을 수정하였습니다.'); // 성공 시 알림
            rmodal.modal("hide");
            showList(pageNum);
	    }, function(error) {
	    	alert('댓글 수정에 실패하였습니다. 비밀번호를 다시 확인하세요.')
	    });
	});
	
	modalRemoveBtn.click(function(e) {
		let param = {cno:modal.data("cno"),password:modalInputPassword.val()};
		console.log(param.cno + ", " + param.password);
		replyService.remove(param, function(result){
			alert("성공적으로 댓글을 삭제하였습니다.");
			rmodal.modal("hide");
			showList(pageNum);
		}, function(error) {
			alert("댓글 삭제에 실패하였습니다. 비밀번호를 다시 확인하세요")
		});	
	});
	
	let modalForm = $("#modalForm");
	modalSubmitBtn.click(function(e) {
		modalForm.attr("action", "/board/remove");  // 삭제 경로 설정
		modalForm.attr("method", "post");  // 삭제 경로 설정
		modalForm.submit();  // 폼 전송
	});
	let msg = '${result}';
    if(msg === 'fail') {
        alert("글 삭제에 실패했습니다. 비밀번호를 다시 확인하세요.");
    }
	
	$('.modalCloseBtn').click(function(e) {
		modal.modal("hide");
		modalInputContent.val("");
		modalInputWriter.val("");
		modalInputPassword.val("");
	})
	
	function showReplyPage(replyCnt) {
		let endNum = Math.ceil(pageNum / 10.0) * 10;
		let startNum = endNum - 9;
		
		let prev = startNum != 1;
		let next = false;
		
		if (endNum * 10 >= replyCnt) {
			endNum = Math.ceil(replyCnt/10.0);
		}
		
		if (endNum * 10 < replyCnt) {
			next = true;
		}
		
		let str = "<ul class='pagination pull-right'>";
		
		if (prev) {
			str += `<li class='page-item'><a class='page-link'
					href='(\${startNum} - 1)'>Previous</a></li>`;
		}
		
		for (let i = startNum; i <= endNum; i++) {
			let active = pageNum == i ? "active":"";
			str += `<li class='page-item \${active}'><a class='page-link'
					href='\${i}'>\${i}</a></li>`;
		}
		
		if (next) {
			str += `<li class='page-item'><a class='page-link' 
					href='(\${endNum} + 1)'>Next</a></li>`;
		}
		str += "</ul></div>"
		
		console.log(str);
		
		replyPageFooter.html(str);
	}
	
	replyPageFooter.on("click", "li a", function(e){
		e.preventDefault();
		console.log("page click");
		
		let targetPageNum = $(this).attr("href");
		console.log("targetPageNum:" + targetPageNum);
		pageNum = targetPageNum;
		
		showList(pageNum);
	});
});
</script>
</html>