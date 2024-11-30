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
    <link href="/resources/css/home.css" rel="stylesheet" />
    <link href="/resources/css/styles.css" rel="stylesheet" />
    
    <title>홈 페이지</title>
</head>

<body class="d-flex flex-column min-vh-100">
	<%@ include file="includes/header.jsp" %>
    <!-- Page Content-->
    <div class="container px-4 px-lg-5">
        <!-- Heading Row-->
        <div class="row gx-4 gx-lg-5 align-items-center my-5">
            <div id="centered-image" class="col-lg-7"><img class="img-fluid rounded mb-4 mb-lg-0"
                    src="https://sesac.seoul.kr/static/common/images/www/common/sesac_emot_06.png" alt="..." /></div>
            <div class="col-lg-5">
                <h2 id="home_title" class="font-weight-light">새싹 맛지도에 오신 걸 환영합니다!</h2>
                <p>새싹 동대문 캠퍼스 주변의 숨겨진 맛집을 함께 찾아봐요!<br>여러분이 사랑하는 맛집을 리뷰와 사진으로 공유하고,<br>캠퍼스 생활을 더 맛있게 즐겨보세요! 🌱</p>
                 <a id="btn_green" class= "btn btn-primary" href="/board/write">맛집 공유하러 가기!</a>
            </div>
        </div>  
        <!-- Call to Action-->
       <div class="highlight_box">
        
    <!-- 이재혁 -->
    새싹이 PICK한 인기 맛집 (최근 1일)
    </div> <!-- Content Row-->
        <div class="row gx-4 gx-lg-5">
        	<c:forEach items="${popularList }" var="popularBoard">
   	            <div class="col-md-4 mb-5">
	                <div class="card h-100">
	                    <div id="home_card_body" class="card-body">
	                        <h4 class="card-title"><c:out value="${popularBoard.title }" /></h4>
	                        <p class="card-text"><c:out value="${popularBoard.content }" /></p>
	                    </div>
	                    <div class="card-footer">
	                    	<a id="home_card" class="btn btn-primary btn-sm" href="/board/get?bno=<c:out value='${popularBoard.bno }' />">더 보러가기</a>
	                    	<span class="float-end ms-4">❤️ <c:out value="${popularBoard.recommend}" /></span>
	                    </div>
	                </div>
	            </div>
        	</c:forEach>
        </div>
    </div>
<%@ include file="includes/footer.jsp" %>
</body>

</html>