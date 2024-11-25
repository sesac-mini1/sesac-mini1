
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
        <h1 class="page-header">게시글 수정하기</h1>
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default">
        
            <div id="board_green" class="panel-heading">Board Read Page</div>
            <!-- /.panel-heading -->
            <div class="panel-body">
            
            	<form role="form" action="/board/modify" method="post">
            
            		<!-- 추가 -->
            		<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
            		<input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
            		<input type='hidden' name='type' value='<c:out value="${cri.type}"/>'/>
            		<input type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/>'/>
            		
            		<div class="form-group">
	            		<label>음식점 이름</label> <input class="form-control" name='title' value='<c:out value="${board.title}"/>' >
	            	</div>
	            	
	            	<div class="form-group">
	            		<label>글 제목</label> <input class="form-control" name='title' value='<c:out value="${board.title}"/>' >
	            	</div>
	            	
	            	<div class="form-group">
	            		<label>내용</label>
	            		<textarea class="form-control" rows="3" name='content' ><c:out value="${board.content}"/></textarea>
	            	</div>
	            	
	            	<button id="btn_green" type="submit" data-oper='modify' class="btn btn-default">수정</button>
	            	<button id="btn_green" type="submit" data-oper='remove' class="btn btn-default">삭제</button>
	            	<button id="btn_green" type="submit" data-oper='list' class="btn btn-default">글 목록</button>
            
            	</form>
            	
            </div>
            <!-- end panel-body -->
        </div>
        <!-- end panel -->
    </div>
</div>
<!-- /.row -->
            
<script type="text/javascript">

	$(function() {
		
		var formObj = $("form");
		
		$('button').on("click", function(e) {
			
			e.preventDefault();
			
			var operation = $(this).data("oper");
			
			console.log(operation);
			
			if(operation === 'remove'){
				formObj.attr("action", "/board/remove");
				
			}else if(operation === 'list'){
				//move to list
				formObj.attr("action", "/board/list").attr("method","get");
				var pageNumTag = $("input[name='pageNum']").clone();
				var amountTag = $("input[name='amount']").clone();
				var keywordTag = $("input[name='keyword']").clone();
				var typeTag = $("input[name='type']").clone();
				
				formObj.empty();
				
				formObj.append(pageNumTag);
				formObj.append(amountTag);
				formObj.append(leywordTag);
				formObj.append(typeTag);
				
			}
			
			formObj.submit();
			
		});
	});
	
</script>
    </div>
<%@ include file="../includes/footer.jsp" %>
</body>

</html>