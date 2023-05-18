<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="TemplateMo">
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900" rel="stylesheet">
    <!--JQuery-->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <title>DIGICampus</title>
    <!-- Bootstrap core CSS -->
    <link href="/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!--Kakao Map api-->
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f5f154fb7d1604c83c2bdb25d0f4a23c"></script>
    <!--HighCharts-->
    <script src="https://code.highcharts.com/highcharts.js"></script>
    <script src="https://code.highcharts.com/highcharts-more.js"></script>
    <script src="https://code.highcharts.com/modules/solid-gauge.js"></script>
    <script src="https://code.highcharts.com/modules/exporting.js"></script>
    <script src="https://code.highcharts.com/modules/export-data.js"></script>
    <script src="https://code.highcharts.com/modules/accessibility.js"></script>
    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="/assets/css/fontawesome.css">
    <link rel="stylesheet" href="/assets/css/templatemo-edu-meeting.css">
    <link rel="stylesheet" href="/assets/css/owl.css">
    <link rel="stylesheet" href="/assets/css/lightbox.css">
    <!--https://templatemo.com/tm-569-edu-meeting-->


</head>
<body>
<!-- ***** Header Area Start ***** -->
<header class="header-area header-sticky">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <nav class="main-nav">
                    <!-- ***** Logo Start ***** -->
                    <a href="/" class="logo">
                        <img src="/assets/images/digi_logo.png" alt="digi_logo" style="width: 100px">
                    </a>
                    <!-- ***** Logo End ***** -->
                    <!-- ***** Menu Start ***** -->
                    <ul class="nav">
                        <li><a href="/" class="active">Home</a></li>
                        <c:choose>
                            <c:when test="${loginStudent!=null}">
                                <li><a href="/digimembers">Digi Members</a></li>
                                <li class="has-sub">
                                    <a href="javascript:void(0)">JMTGR</a>
                                    <ul class="sub-menu">
                                        <li><a href="/marker/all">View JMT</a></li>
                                        <li><a href="/marker/add">Add Marker</a></li>
                                    </ul>
                                </li>
                                <li><a href="/anc/allpage">Board</a></li>
<%--                                <li><a href="/apply">Chat</a></li>--%>
                                <li class="has-sub">
                                    <a href="javascript:void(0)">Courses</a>
                                    <ul class="sub-menu">
                                        <li><a href="/lecture/allpage">All Courses</a></li>
                                        <li><a href="/lecture/mycourse?id=${loginStudent.id}">My Course</a></li>
                                    </ul>
                                </li>
                                <li><a href="/study/allpage">Study</a></li>
<%--                                <li class="has-sub">--%>
<%--                                    <a href="javascript:void(0)">Study</a>--%>
<%--                                    <ul class="sub-menu">--%>
<%--                                        <li><a href="/study/allpage">Study Board</a></li>--%>
<%--                                        <li><a href="/study/chart">Study Chart</a></li>--%>
<%--                                    </ul>--%>
<%--                                </li>--%>
                                <li><a href="/att_check">Attendance</a></li>
<%--                                <li class="has-sub">--%>
<%--                                    <!--메뉴명 추후 정정 예정-->--%>
<%--                                    <a href="javascript:void(0)">BlahBlah</a>--%>
<%--                                    <ul class="sub-menu">--%>
<%--                                        <li><a href="/att_check">Attendance</a></li>--%>
<%--                                        <li><a href="#">Diagosis</a></li>--%>
<%--                                    </ul>--%>
<%--                                </li>--%>
                                <li><a href="/mypage">MyPage</a></li>
                                <li><a href="/logout">LOGOUT</a></li>
                            </c:when>
                            <c:otherwise>
                                <li><a href="/login">LOGIN</a></li>
                                <li><a href="/register">JOIN</a></li>
                            </c:otherwise>
                        </c:choose>
                    </ul>
                    <!-- ***** Menu End ***** -->
                </nav>
            </div>
        </div>
    </div>
</header>
<!-- ***** Header Area End ***** -->
<%---------------------------------------center-------------------------------------------%>
<c:choose>
    <c:when test="${center==null}">
        <jsp:include page="center.jsp"/>
    </c:when>
    <c:otherwise>
        <jsp:include page="${center}.jsp"/>
    </c:otherwise>
</c:choose>
<%------------------------------------------END CENTER---------------------------------------------------------------------------%>
<section class="contact-us" id="contact">
    <div class="footer">
        <p>Copyright © 2022 Edu Meeting Co., Ltd. All Rights Reserved.
            <br>Design: <a href="https://templatemo.com" target="_parent" title="free css templates">TemplateMo</a></p>
    </div>
</section>
</body>
<!-- Scripts -->
<!-- Bootstrap core JavaScript -->
<script src="/vendor/jquery/jquery.min.js"></script>
<script src="/vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="/assets/js/isotope.min.js"></script>
<script src="/assets/js/owl-carousel.js"></script>
<script src="/assets/js/lightbox.js"></script>
<script src="/assets/js/tabs.js"></script>
<script src="/assets/js/video.js"></script>
<script src="/assets/js/slick-slider.js"></script>
<script src="/assets/js/custom.js"></script>
<script>
    //according to loftblog tut
    $('.nav li:first').addClass('active');
    var showSection = function showSection(section, isAnimate) {
        var
            direction = section.replace(/#/, ''),
            reqSection = $('.section').filter('[data-section="' + direction + '"]'),
            reqSectionPos = reqSection.offset().top - 0;
        if (isAnimate) {
            $('body, html').animate({
                    scrollTop: reqSectionPos
                },
                800);
        } else {
            $('body, html').scrollTop(reqSectionPos);
        }
    };
    var checkSection = function checkSection() {
        $('.section').each(function () {
            var
                $this = $(this),
                topEdge = $this.offset().top - 80,
                bottomEdge = topEdge + $this.height(),
                wScroll = $(window).scrollTop();
            if (topEdge < wScroll && bottomEdge > wScroll) {
                var
                    currentId = $this.data('section'),
                    reqLink = $('a').filter('[href*=\\#' + currentId + ']');
                reqLink.closest('li').addClass('active').siblings().removeClass('active');
            }
        });
    };
    $('.main-menu, .responsive-menu, .scroll-to-section').on('click', 'a', function (e) {
        e.preventDefault();
        showSection($(this).attr('href'), true);
    });
    $(window).scroll(function () {
        checkSection();
    });
</script>
</html>