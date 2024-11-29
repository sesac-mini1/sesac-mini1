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
	                		<input id="ticketCheckbox" type="checkbox" name="ticket" class="table-top" <c:out value="${pageMaker.cri.ticket == true ? 'checked':'' }" />>
	                		<img id="ticketImg" src="/resources/assets/ticket-image.png" height="30px"/>
	                	</label>
	                </span>
	                <span id="type-span">
	                	<label>
		                	식당 종류 
			                <select id="typeSelect" name="type">
			                	<option value="" <c:out value="${pageMaker.cri.type == null ? 'selected':'' }" />>전체</option>
			                	<option value="한식" <c:out value="${pageMaker.cri.type == '한식' ? 'selected':'' }" />>한식</option>
			                	<option value="중식" <c:out value="${pageMaker.cri.type == '중식' ? 'selected':'' }" />>중식</option>
			                	<option value="양식" <c:out value="${pageMaker.cri.type == '양식' ? 'selected':'' }" />>양식</option>
			                	<option value="일식" <c:out value="${pageMaker.cri.type == '일식' ? 'selected':'' }" />>일식</option>
			                	<option value="아시안" <c:out value="${pageMaker.cri.type == '아시안' ? 'selected':'' }" />>아시안</option>
			                	<option value="카페" <c:out value="${pageMaker.cri.type == '카페' ? 'selected':'' }" />>카페</option>
			                	<option value="분식" <c:out value="${pageMaker.cri.type == '분식' ? 'selected':'' }" />>분식</option>
			                	<option value="기타" <c:out value="${pageMaker.cri.type == '기타' ? 'selected':'' }" />>기타</option>
			                </select>
	                	</label>
	                </span>
	                <button id='regBtn' type="button" class="btn btn-xs pull-right">글 쓰러가기</button>
	            </div>
	            <!-- /.panel-heading -->
	            <div class="panel-body">
	                <table class="table table-striped table-bordered table-hover">
	                    <thead>
	                        <tr>
	                        	<th class="col-1 text-center">음식 종류</th>
	                        	<th class="col-5 text-center">제목</th>
	                            <th class="col-1 text-center">음식점</th>
	                            <th class="col-2 text-center">별점</th>
	                            <th class="col-1 text-center">추천</th>
	                            <th class="col-1 text-center">작성자</th>
	                            <th class="col-2 text-center">작성일</th>
	                        </tr>
	                    </thead>
	                    <tbody>
	                    	<c:forEach items="${list}" var="board">
	                    	<tr>
	                    		<td class="text-center"><c:out value="${board.type}" /></td>
	                    		<td><a class='move' href='<c:out value="${board.bno}" />'>
	                    			<c:out value="${board.title}" /></a></td>
	                    		
	                    		<!-- 음식점 이름 축약 처리 -->
                    			<td class="truncate" data-bs-toggle="tooltip" title="<c:out value='${board.rname}' />">
                        			<c:out value="${board.rname}" />
                   				 </td>
	                    		<td>
		                    		<c:forEach var="i" begin="1" end="${board.stars}">
									    ⭐
									</c:forEach>
								</td>
	                    		<td><c:out value="${board.recommend}" /></td>
	                    		<!-- 작성자 이름 축약 처리 -->
	                    		<td class="truncate" data-bs-toggle="tooltip" title="<c:out value='${board.writer}' />">
                        			<c:out value="${board.writer}" />
                   				</td>
	                    		<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regDate}" /></td>
	                    	</tr>
	                    	</c:forEach>
	                    </tbody>
	                </table>
	                
	                <div class='row'>
	                	<div class="col-lg-12">
	                	
	                		<form id='searchForm' action="/board/list" method='get'>
	                			<select name='searchType'>
	                				<option value=""
	                					<c:out value="${pageMaker.cri.searchType == null ? 'selected':'' }" />>--</option>
	                				<option value="T"
	                					<c:out value="${pageMaker.cri.searchType == 'T' ? 'selected':'' }" />>제목</option>
	                				<option value="R"
	                					<c:out value="${pageMaker.cri.searchType == 'R' ? 'selected':'' }" />>음식점</option>
	                				<option value="W"
	                					<c:out value="${pageMaker.cri.searchType == 'W' ? 'selected':'' }" />>작성자</option>
	                				<option value="TR"
	                					<c:out value="${pageMaker.cri.searchType == 'TR' ? 'selected':'' }" />>제목 or 음식점</option>
	                				<option value="TW"
	                					<c:out value="${pageMaker.cri.searchType == 'TW' ? 'selected':'' }" />>제목 or 작성자</option>
	                				<option value="TWR"
	                					<c:out value="${pageMaker.cri.searchType == 'TWR' ? 'selected':'' }" />>제목 or 음식점 or 작성자</option>
	                			</select>
	                			<input type="text" name="keyword" id="keyword" value='<c:out value="${pageMaker.cri.keyword }"/>'>
	                			<input type="hidden" name="pageNum" value='<c:out value="${pageMaker.cri.pageNum }"/>'>
	                			<input type="hidden" name="amount" value='<c:out value="${pageMaker.cri.amount }"/>'>
								<input type='hidden' name='ticket' value='${pageMaker.cri.ticket }'>
								<input type='hidden' name='type' value='${pageMaker.cri.type }'>
	                			<button id="searchBtn" class='btn btn-default'>검색</button>
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
		<input type='hidden' name='searchType'
			value='<c:out value="${pageMaker.cri.searchType }"/>'> <input
			type='hidden' name='keyword'
			value='<c:out value="${pageMaker.cri.keyword }"/>'> <input
			type='hidden' name='ticket' value='${pageMaker.cri.ticket }'>
		<input type='hidden' name='type' value='${pageMaker.cri.type }'>
	</form>

	<!-- Modal -->
	<div class="modal" id="myModal" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">확인 모달</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<p>Modal body text goes here.</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" 
					data-bs-dismiss="modal">확인</button>
				</div>
			</div>
		</div>
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
		console.log("Check Modal Result: ", result); // 디버깅 로그 추가
		 
		if (result === '' || history.state) {
			console.log("Modal skipped due to empty result or history state.");
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
	
 	let actionForm = $("#actionForm");
	
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
 	
 	let searchForm = $("#searchForm");

	$("#ticketCheckbox").on("change", function() {
		searchForm.find("input[name='ticket']").val($("#ticketCheckbox").is(":checked"));
		console.log("ticket changed");
		invokeSearch();
	});

	$("#typeSelect").on("change", function() {
		searchForm.find("input[name='type']").val($("#typeSelect").val());
		console.log("type changed");
		invokeSearch();
	});
 	
 	$("#searchForm button").on("click", function(e){
		if(!searchForm.find("option:selected").val()){
			alert("검색종류를 선택하세요");
			return false;
		}
		
		if(!searchForm.find("input[name='keyword']").val()){
			searchForm.find("select").val('').change();
			// alert("키워드를 입력하세요");
		}
		
		e.preventDefault();
		invokeSearch();
 	});

function invokeSearch() {
	 searchForm.find("input[name='pageNum']").val("1");
	 
	 searchForm.submit();
}
	
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

$(document).ready(function () {
    $('[data-bs-toggle="tooltip"]').tooltip(); // 툴팁 활성화
});
</script>
</body>

</html>
