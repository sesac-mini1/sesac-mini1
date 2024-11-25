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

<body>
	<%@ include file="includes/header.jsp" %>
    <!-- Page Content-->
    <div class="container px-4 px-lg-5">
        <!-- Heading Row-->
        <div class="row gx-4 gx-lg-5 align-items-center my-5">
            <div id="centered-image" class="col-lg-7"><img class="img-fluid rounded mb-4 mb-lg-0"
                    src="https://sesac.seoul.kr/static/common/images/www/common/sesac_emot_06.png" alt="..." /></div>
            <div class="col-lg-5">
                <h2 id="home_title" class="font-weight-light">새싹 맛지도에 오신 걸 환영합니다!</h2>
                <p>새싹 동대문 캠퍼스 주변의 숨겨진 맛집을 함께 찾아봐요! <br>여러분이 사랑하는 맛집을 리뷰와 사진으로 공유하고,<br> 캠퍼스 생활을 더 맛있게 즐겨보세요! 🌱</p>
                 <a id="btn_green" class= "btn btn-primary" href="#!">맛집 공유하러 가기!</a>
            </div>
        </div>  
        <!-- Call to Action-->
       <div class="highlight_box">
    새싹이 PICK한 맛집
  </div> <!-- Content Row-->
        <div class="row gx-4 gx-lg-5">
            <div class="col-md-4 mb-5">
                <div class="card h-100">
                    <div id="home_card_body" class="card-body">
                        <h4 class="card-title">내가 제일 좋아하는 청마루 !!</h4>
                        <p class="card-text">내가 제일 좋아하는 청마루 !! 여기는 특히 육회비빔밥이랑 뚝배기 불고기가 가장 맛있었당 !! 다른 것도 다 맛있당 ~~ 육회비빔밥은 13,000원 뚝배기 불고기는 12,000원인가?? 암튼 ~~</p>
                    </div>
                    <div class="card-footer"><a id="home_card" class="btn btn-primary btn-sm" href="#!">More Info</a></div>
                </div>
            </div>
            <div class="col-md-4 mb-5">
                <div class="card h-100">
                    <div id="home_card_body" class="card-body">
                        <h4 class="card-title">내가 제일 좋아하는 청마루 !!</h4>
                        <p class="card-text">내가 제일 좋아하는 청마루 !! 여기는 특히 육회비빔밥이랑 뚝배기 불고기가 가장 맛있었당 !! 다른 것도 다 맛있당 ~~ 육회비빔밥은 13,000원 뚝배기 불고기는 12,000원인가?? 암튼 ~~</p>
                    </div>
                    <div class="card-footer"><a id="home_card" class="btn btn-primary btn-sm" href="#!">More Info</a></div>
                </div>
            </div>
            <div class="col-md-4 mb-5">
                <div class="card h-100">
                    <div id="home_card_body" class="card-body">
                        <h4 class="card-title">내가 제일 좋아하는 청마루 !!</h4>
                        <p class="card-text">내가 제일 좋아하는 청마루 !! 여기는 특히 육회비빔밥이랑 뚝배기 불고기가 가장 맛있었당 !! 다른 것도 다 맛있당 ~~ 육회비빔밥은 13,000원 뚝배기 불고기는 12,000원인가?? 암튼 ~~내가 제일 좋아하는 청마루 !! 여기는 특히 육회비빔밥이랑 뚝배기 불고기가 가장 맛있었당 !! 다른 것도 다 맛있당 ~~ 육회비빔밥은 13,000원 뚝배기 불고기는 12,000원인가??</p>
                    </div>
                    <div class="card-footer"><a id="home_card" class="btn btn-primary btn-sm" href="#!">More Info</a></div>
                </div>
            </div>
        </div>
    </div>
<%@ include file="includes/footer.jsp" %>
</body>

</html>