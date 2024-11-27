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
    <link href="/resources/css/sesac.css" rel="stylesheet" />
    <title>글 읽기 페이지</title>
</head>

<body>
<%@ include file="../includes/header.jsp" %>
    <!-- Page content-->
    <div class="container mt-5">
        <div class="row">
            <div class="col-lg-8">
                <!-- Post content-->
                <article>
                    <!-- Post header-->
                    <header class="mb-4">
                        <!-- Post title-->
                        <h4>[<c:out value="${board.rname}"/>]</h4><h1 class="fw-bolder mb-1"><c:out value="${board.title}" /></h1>
                        <!-- Post meta content-->
                        <div class="text-muted mb-2">
	                        <span class="fst-italic"><c:out value="${board.regDate}" /></span>
			                <span class="float-end ms-4"><c:out value="${board.writer}" /></span>
			                <span class="float-end ms-4">❤️ <c:out value="${board.recommend}" /></span>
	                        <span class="float-end">⭐ <c:out value="${board.stars}" /></span>
                        </div>
                        <!-- Post categories-->
                        <a class="badge bg-sesac text-decoration-none link-light"><c:out value="${board.type}" /></a>
                        <c:if test="${board.ticket}"><a class="badge bg-sesac text-decoration-none link-light">식권대장</a></c:if>
                		<a class="badge bg-secondary text-decoration-none link-light float-end ms-1" type="submit">삭제</a>
                        <a class="badge bg-secondary text-decoration-none link-light float-end" type="submit">수정</a>
                    </header>
                    <!-- Preview image figure-->
                    <figure class="mb-4"><img class="img-fluid rounded"
                            src=`resources/imgs/${board.filename}` alt="이미지가 없음" /></figure>
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
                            <form class="chat flex-wrap d-flex mb-4">
                            	<div class="flex-shrink-0"><img class="rounded-circle"
                                        src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." /></div>
                            	<span class="ms-3 w-85">
                            	<input class="h-85 br-10" placeholder="작성자 이름" name="writer" value="익명이" type="text"/>
                            	<input class="h-85 br-10" placeholder="비밀번호" name="password" type="password"/>
                                <input value="등록" type="button" id="addReplyBtn" class="h-85 mb-1 me-auto btn btn-sesac" />
                                <input type="hidden" name='bno' value="${board.bno}" />  
                            	<textarea class="form-control" rows="3" name="content"
                                    placeholder="Join the discussion and leave a comment!"></textarea>
                            	</span>
                            </form>
                            <div class="chat">
                            	<!-- comments-->
	                            <div class="d-flex mb-4">
	                                <div class="flex-shrink-0"><img class="rounded-circle"
	                                        src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." /></div>
	                                <div class="ms-3">
	                                    <div class="fw-bold">
	                                    	작성자
	                                    	날짜
	                                    	<a id="updateReplyBtn" class="badge bg-secondary text-decoration-none link-light ms-2" href="#">수정</a>
                							<a id="removeReplyBtn" class="badge bg-secondary text-decoration-none link-light" href="#">삭제</a>
	                                    </div>
	                                     When I look at the universe and all the ways the universe wants to kill us, I find
	                                    it hard to reconcile that with statements of beneficence.
	                                </div>
	                            </div>
	                   		</div>
                        </div>
                    </div>
                </section>
            </div>
        </div>
    </div>
<%@ include file="../includes/footer.jsp" %>
</body>
<script type="text/javascript" src="/resources/js/reply.js"></script>
<script type="text/javascript">
$(function(){
	let bnoValue = `<c:out value="${board.bno}" />`;
	let replyUL = $(".chat");
	
	showList(1);
	
	function showList(page) {
		replyService.getList({bno:bnoValue,page:page||1}, function(list) {
			let str = "";
			if (list == null || list.length == 0) {
				replyUL.html("");
				
				return;
			}
			for (let i = 0, len = list.length || 0; i < len; i++) {
				str += `<div class="d-flex mb-4" data-cno='\${list[i].cno}'>
                    		<div class="flex-shrink-0"><img class="rounded-circle"
                    		src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." /></div>
            				<div class="ms-3">
                				<div class="fw-bold">
                					\${list[i].writer}
                					<small class="text-muted">\${replyService.displayTime(list[i].regDate)}</small>
                					<a id="updateReplyBtn" class="badge bg-secondary text-decoration-none link-light ms-2" href="#">수정</a>
                					<a id="removeReplyBtn" class="badge bg-secondary text-decoration-none link-light" href="#">삭제</a>
               					</div>
               					\${list[i].content}
               				</div>
               			</div>`;
			}
			replyUL.html(str);
		});
	}
		
	let chat = $(".chat");
	let inputContent = chat.find("textarea[name='content']")
	let inputWriter = chat.find("input[name='writer']")
	let inputPassword = chat.find("input[name='password']")
	
	let addReplyBtn = $("#addReplyBtn");
	let updateReplyBtn = $("#updateReplyBtn");
	let removeReplyBtn = $("#removeReplyBtn");
	
	addReplyBtn.on("click", function(e){
		let reply = {
			content: inputContent.val(),
			writer: inputWriter.val(),
			password: inputPassword.val(),
			bno: bnoValue 
		};
		replyService.add(reply, function(result) {
			alert(result);
			
			showList(1);
		});
	});
});
</script>
</html>