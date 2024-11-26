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
    <title>글 작성 페이지</title>
   
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

   
    <link href="/resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

 
    <link href="/resources/css/write.css" rel="stylesheet">
</head>

<body>
<%@ include file="../includes/header.jsp" %>
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
                
                <form role="form" action="/board/register" method="post">
                <div class="form-group">
                  		<label>음식점 이름</label> <input class="form-control"
                  			name='title'>
                  				</div>
                
                	<div class="form-group">
                  		<label>글 제목</label> <input class="form-control"
                  			name='title'>
                  				</div>
                  			
                  			<div class="form-group">
                  			<label>내용</label>
                  			<textarea class="form-control rows="3" name='content'></textarea>
                    		</div>
                    		
                    		<div class="form-group">
							    <label id="ticket_flex">
							        <input type="checkbox" name="isPublic" value="yes">
								    <img id="ticketImg" src="/resources/assets/ticket-image.png" height="30px" />
								
								  </label>
							</div>
                    		
                    		<div class="form-group">
                    			<label>작성자</label><input class="form-control" name='writer'>
                    		</div>
                    		
                    		<!-- 분류 select box 추가 -->
                    		<div class="form-group">
                        		<label>분류</label>
                        			<select class="form-control" name="category">
			                            <option value="koreanfood">한식</option>
			                            <option value="japanessfood">일식</option>
			                            <option value="chinesefood">중식</option>
			                            <option value="westernfood">양식</option>
			                            <option value="asianfood">아시안푸드</option>
			                            <option value="cafefood">카페</option>
			                            <option value="snackfood">분식</option>
			                            <option value="etc">기타</option>
			                     	</select>
			                </div>
			                
			                <!-- 파일 업로드 -->
							<form action="/upload" method="post" enctype="multipart/form-data">
							    <div class="form-group">
							        <label>파일 업로드</label>
							        <input type="file" class="form-control" name="fileUpload" multiple> 
							    </div>
							</form>
							
							<!-- 비밀번호 입력 -->
							<div class="form-group">
							    <label>비밀번호 입력</label>
							    <input type="password" class="form-control" name="password" placeholder="비밀번호를 입력하세요">
							</div>
                    		
                    		<button type="summit" class="btn btn-default">등록하기</button>
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
<%@ include file="../includes/footer.jsp" %>

</body>

</html>