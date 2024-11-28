<%@	taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

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
<title>글 목록 페이지</title>

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

<!-- Custom Fonts -->
<link href="/resources/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<!-- List page CSS -->
<link href="/resources/css/list.css" rel="stylesheet">
</head>

<body class="d-flex flex-column min-vh-100">
<%@ include file="../includes/header.jsp"%>
<div class="container px-4 px-lg-5">
<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">🌱 새싹이들 맛집 게시판</h1>
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-heading">
                <span id="ticket-span">
                	<label>
                		<input type="checkbox" name="ticket" class="table-top">
                		<img id="ticketImg" src="/resources/assets/ticket-image.png" height="30px"/>
                	</label>
                </span>
                <span id="type-span">
                	<label>
	                	식당 종류 
		                <select name="type">
		                	<option value="">전체</option>
		                	<option value="한식">한식</option>
		                	<option value="중식">중식</option>
		                	<option value="양식">양식</option>
		                	<option value="일식">일식</option>
		                	<option value="아시안">아시안</option>
		                	<option value="카페">카페</option>
		                	<option value="분식">분식</option>
		                	<option value="기타">기타</option>
		                </select>
                	</label>
                </span>
                <button id='regBtn' type="button" class="btn btn-xs pull-right">글 쓰러가기</button>
            </div>
            <!-- /.panel-heading -->
            <div class="panel-body">
                <table width="100%" class="table table-striped table-bordered table-hover">
                    <thead>
                        <tr>
                            <th>추천</th>
                            <th>음식 종류</th>
                            <th>음식점</th>
                            <th>별점</th>
                            <th>제목</th>
                            <th>작성자</th>
                            <th>작성일</th>
                        </tr>
                    </thead>
                    <tbody>
                    	<c:forEach items="${list}" var="board">
                    	<tr>
                    		<td><c:out value="${board.recommend}" /></td>
                    		<td><c:out value="${board.type}" /></td>
                    		<td><c:out value="${board.rname}" /></td>
                    		<td><c:out value="${board.stars}" /></td>
                    		<td><a class='move' href='<c:out value="${board.bno}" />'>
                    			<c:out value="${board.title}" /></a></td>
                    		<td><c:out value="${board.writer}" /></td>
                    		<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regDate}" /></td>
                    	</tr>
                    	</c:forEach>
                    </tbody>
                </table>
                
                <div class='row'>
                	<div class="col-lg-12">
                	
                		<form id='searchForm' action="/board/list" method='get'>
                			<select name='type'>
                				<option value=""
                					<c:out value="${pageMaker.cri.type == null ? 'selected':'' }" />>--</option>
                				<option value="T"
                					<c:out value="${pageMaker.cri.type == 'T' ? 'selected':'' }" />>제목</option>
                				<option value="R"
                					<c:out value="${pageMaker.cri.type == 'R' ? 'selected':'' }" />>음식점</option>
                				<option value="W"
                					<c:out value="${pageMaker.cri.type == 'W' ? 'selected':'' }" />>작성자</option>
                				<option value="TR"
                					<c:out value="${pageMaker.cri.type == 'TR' ? 'selected':'' }" />>제목 or 음식점</option>
                				<option value="TW"
                					<c:out value="${pageMaker.cri.type == 'TW' ? 'selected':'' }" />>제목 or 작성자</option>
                				<option value="TWR"
                					<c:out value="${pageMaker.cri.type == 'TWR' ? 'selected':'' }" />>제목 or 음식점 or 작성자</option>
                			</select>
                			<input type="text" name="keyword" value='<c:out value="${pageMaker.cri.keyword }"/>'>
                			<input type="hidden" name="pageNum" value='<c:out value="${pageMaker.cri.pageNum }"/>'>
                			<input type="hidden" name="amount" value='<c:out value="${pageMaker.cri.amount }"/>'>
                			<button class='btn btn-default'>검색</button>
                		</form>
                	</div>
                </div>
                
                <div class='pull-right'>
                	<ul class="pagination">
                		<c:if test="${pageMaker.prev }" >
                			<li class="paginate_button previous"><a href="${pageMaker.startPage - 1 }">Previous</a></li>
                		</c:if>
                		
                		<c:forEach var="num" begin="${pageMaker.startPage }"
                			end="${pageMaker.endPage}">
                			<li class="paginate_button ${pageMaker.cri.pageNum == num ? "active":"" }">
                				<a href="${num}">${num}</a>
                			</li>
                		</c:forEach>
                		
                		<c:if test="${pageMaker.next }" >
                			<li class="paginate_button next"><a href="${pageMaker.endPage + 1 }">Next</a></li>
                		</c:if>
                	</ul>
                </div>
            </div>
            <!-- end panel-body -->
        </div>
        <!-- end panel -->
    </div>
    </div>
    <form id='actionForm' action="/board/list" method='get'>
		<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum }'>
		<input type='hidden' name='amount' value='${pageMaker.cri.amount }'>
		<input type='hidden' name='type'
			value='<c:out value="${pageMaker.cri.type }"/>'> <input
			type='hidden' name='keyword'
			value='<c:out value="${pageMaker.cri.keyword }"/>'>
	</form>

	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">Modal title</h4>
				</div>
				<div class="modal-body"></div>
				<button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->
</div>	
<!-- /.container -->	
<script type="text/javascript">

$(document).ready(function() {	<!-- $(document).ready(function())을  -->
	
	var result = '<c:out value="${result}"/>';
	
	console.log("Result value: ", result);

	checkModal(result);
	
	history.replaceState({},null,null);
	
	function checkModal(result) {
		
		if (result === '' || history.state) {
			return;
		}
		
		if (parseInt(result) > 0) {
			$(".modal-body").html("게시글 " + parseInt(result) + "번이 등록되었습니다.");
		}
		
		if (result === 'remove') {
            $(".modal-body").html("삭제되었습니다.");
        }
		
		if (result === 'modify') {
			$(".modal-body").html("수정되었습니다.");
		}
		
		$("#myModal").modal("show");
	}
	
	$("#regBtn").on("click", function() {
		
		self.location = "/board/write";
		
	});
	
 	var actionForm = $("#actionForm");
	
 	$(".paginate_button a").on("click", function(e) {
		
		e.preventDefault();
		
		console.log('click');
		
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.attr("action", "/board/list");
		actionForm.submit();
	});
 	
 	$(".move").on("click", function(e){
 		
 		e.preventDefault();
 		actionForm.find("input[name='bno']").remove();
 		actionForm.append("<input type='hidden' name='bno' value='"+$(this).attr("href")+"'>");
 		actionForm.attr("action", "/board/get");
 		actionForm.submit();
 		
 	});
 	
 	var searchForm = $("#searchForm");
 	
 	$("#searchForm button").on("click", function(e){
 		
 		if(!searchForm.find("option:selected").val()){
 			alert("검색종류를 선택하세요");
 			return false;
 		}
 		
 		if(!searchForm.find("input[name='keyword']").val()){
 			alert("키워드를 입력하세요");
 			return false;
 		}
 		
 		searchForm.find("input[name='pageNum']").val("1");
 		e.preventDefault();
 		
 		searchForm.submit();
 		
 	});
	
});

</script>

<%@ include file="../includes/footer.jsp"%>
<!-- Bootstrap Core JavaScript -->
<script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>

<!-- Metis Menu Plugin JavaScript -->
<script src="/resources/vendor/metisMenu/metisMenu.min.js"></script>

<!-- DataTables JavaScript -->
<script src="/resources/vendor/datatables/js/jquery.dataTables.min.js"></script>
<script
	src="/resources/vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
<script
	src="/resources/vendor/datatables-responsive/dataTables.responsive.js"></script>

<!-- Custom Theme JavaScript -->
<script src="/resources/dist/js/sb-admin-2.js"></script>

<!-- Page-Level Demo Scripts - Tables - Use for reference -->
<script>
   $(document).ready(function() {
       $('#dataTables-example').DataTable({
           responsive: true
       });
       $(".side-bar-nav")
       	.attr("class", "sidebar-nav navbar-collapse collapse")
       	.attr("aria-expanded", "false")
       	.attr("style", "height: 1px");
   });
</script>
</body>

</html>