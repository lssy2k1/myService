<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--  center1--%>
<!-- ***** Main Banner Area Start ***** -->
<style>
    .ancBoard {
        color: #f5a425
    }
</style>

<section class="section main-banner" id="top" data-section="section1">
    <video autoplay muted loop id="bg-video">
        <source src="/assets/images/course-video.mp4" type="video/mp4"/>
    </video>

    <div class="video-overlay header-text">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="caption">
                        <c:choose>
                            <c:when test="${loginStudent==null}">
                                <h6>Hello Student</h6>
                                <h2>Welcome to Education</h2>
                                <p>We provide wide variety of programming courses both back-end and front end. <a
                                        rel="nofollow"
                                        href="/register" target="_blank">Click Here to Join us Right Now</a>.
                                    Expand Your Career Opportunities With Us.</p>
                                <div class="main-button-red">
                                    <div class><a href="/register">Join Us Now!</a></div>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <h6>Hello ${loginStudent.name}님!</h6>
                                <h2>Welcome to DIGICampus</h2>
                                <p>We provide wide variety of programming courses both back-end and front end.
                                    <a rel="nofollow" href="/lecture/allpage" target="_blank">Click Here to View All
                                        Course. </a>
                                    Expand Your Career Opportunities Now With us!</p>
                                <div class="main-button-red">
                                    <div><a href="/att_check" target="_blank">ATTENDANCE</a></div>
                                </div>
                            </c:otherwise>
                        </c:choose>

                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- ***** Main Banner Area End ***** -->

<section class="services">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="owl-service-item owl-carousel">
                    <div class="item">
                        <div class="icon">
                            <img src="https://cdn-icons-png.flaticon.com/512/1126/1126012.png" alt="">
                        </div>
                        <div class="down-content">
                            <h4><a href="/lecture/detail?id=100033" class="ancBoard">New lecture open!</a></h4>
                            <p>수강생분들이 기다리시던 그 강의!</p>
                            <p><span style="font-weight:bold; color: orange">
                                "한입 크기로 잘라 먹는 리액트(React.js)"
                            </span>가 업데이트 되었습니다! 신규 이벤트가로 만나보세요!
                            </p>
                        </div>
                    </div>

                    <div class="item">
                        <div class="icon">
                            <img src="https://cdn-icons-png.flaticon.com/512/2545/2545619.png" alt="">
                        </div>
                        <div class="down-content">
                            <h4><a href="/anc/detail?id=1003"class="ancBoard"> 스터디일지왕</a></h4>
                            <p>4월 스터디일지왕 <span style="font-weight:bold; color: orange">기피티 대리님</span>!</p>
                            <p> 4월 한달 간 29회의 스터디일지를 작성하셨습니다. </p>
                            <p>축하합니다!</p>
                        </div>
                    </div>

                    <div class="item">
                        <div class="icon">
                            <img src="https://cdn-icons-png.flaticon.com/512/2454/2454297.png" alt="">
                        </div>
                        <div class="down-content">
                            <h4><a href="anc/detail?id=1004" class="ancBoard">Happy Birthday!</a></h4>
                            <p>생일 축하합니다! 소중한 <span style="font-weight:bold; color: orange">문대호 대리님</span>! </p>
                            <p><span style="font-weight:bold; color: orange">5월 5일 문대호 대리님</span>의 생일입니다. 많은 축하 부탁드립니다.
                            </p>

                        </div>
                    </div>

                    <div class="item">
                        <div class="icon">
                            <img src="/uimg/강사님.jpeg" alt="">
                        </div>
                        <div class="down-content">
                            <h4><a href="/anc/detail?id=1002" class="ancBoard"><span style="color: orange">긴급공지!</span> 5/15 스승의날 행사안내</a></h4>
                            <p>5/15일 스승의 날을 맞이하여 이진만 강사님께 카네이션 수여식이 있을 예정입니다.</p>
                            <p>DIGI MEMBER분들은 <span style="color: orange">12:50분</span>까지 자리에 착석해주세요!</p>
                        </div>
                    </div>

                    <div class="item">
                        <img style="border-radius: 10px 10px" src="/assets/images/gallery.png">
                    </div>

                </div>
            </div>
        </div>
    </div>
</section>