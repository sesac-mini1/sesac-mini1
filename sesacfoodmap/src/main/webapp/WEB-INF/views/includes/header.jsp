<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <link href="../resources/css/header.css" rel="stylesheet" />
    
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<nav id="header_color" class="navbar navbar-expand-lg navbar-dark" style="background-color: #57bb6d;">
    <div class="container">
        <a id="navbar-brand" href="/">
            <img id="navbar-logo" src="https://sesac.seoul.kr/static/common/images/www/temp/thumbnail.png" alt="로고" />
            새싹 맛지도
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
            data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
            aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                <li id="navbar-menu" class="nav-item"><a id="home-link" class="nav-link active" href="/">홈</a></li>
                <li id="navbar-menu" class="nav-item"><a id="board-link" class="nav-link active" aria-current="page" href="/board/list">게시판</a></li>
                <li id="navbar-menu" class="nav-item"><a id="write-link" class="nav-link active" href="/board/write">게시하기</a></li>
            </ul>
        </div>
    </div>
</nav>

<script> // 이지윤
    $(document).ready(function () {
        // 현재 URL 경로 가져오기
        const currentPath = window.location.pathname;

        // 모든 nav-link에서 active 클래스 제거
        $('.nav-link').removeClass('active');

        if (currentPath === '/') {
            $('#home-link').addClass('active');
        }
        else if (currentPath === '/board/list') {
            $('#board-link').addClass('active');
        } 
        else if (currentPath === '/board/write') {
            $('#write-link').addClass('active');
        } 
    });
</script>

