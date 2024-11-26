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
                        <a class="badge bg-sesac text-decoration-none link-light" href="#!"><c:out value="${board.type}" /></a>
                        <%-- <c:if test="${board.ticket} == true"> --%><a class="badge bg-sesac text-decoration-none link-light" href="#!">식권대장</a><%-- </c:if> --%>
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
                            <form class="flex-wrap d-flex mb-4">
                            	<div class="flex-shrink-0"><img class="rounded-circle"
                                        src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." /></div>
                            	<span class="w-90">
                            	<input class="" placeholder="작성자 이름" value="익명이" type="text" name="writer"/>
                            	<input class="" placeholder="비밀번호" type="password" name="password"/>
                                <button class="btn btn-sesac" type="submit">등록</button>    
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
	                                    	<c:out value="${comments.writer}"/>Commenter Name
	                                    	<a class="badge bg-secondary text-decoration-none link-light ms-2" href="#">수정</a>
	                                    	<a class="badge bg-secondary text-decoration-none link-light" href="#">삭제</a>
	                                    </div>
	                                     When I look at the universe and all the ways the universe wants to kill us, I find
	                                    it hard to reconcile that with statements of beneficence.
	                                    <c:out value="${comments.content}" />
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

</html>