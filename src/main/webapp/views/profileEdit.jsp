<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>DIGI CAM |${student.name}</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content=""/>
    <meta name="keywords" content=""/>
    <meta name="author" content=""/>

    <link rel="shortcut icon" href="favicon.ico">

    <link href="https://fonts.googleapis.com/css?family=Quicksand:300,400,500,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Playfair+Display:400,400i,700" rel="stylesheet">

    <!-- Animate.css -->
    <link rel="stylesheet" href="/css/animate.css">
    <!-- Icomoon Icon Fonts-->
    <link rel="stylesheet" href="/css/icomoon.css">
    <!-- Bootstrap  -->
    <link rel="stylesheet" href="/css/bootstrap.css">
    <!-- Flexslider  -->
    <link rel="stylesheet" href="/css/flexslider.css">
    <!-- Owl Carousel -->
    <link rel="stylesheet" href="/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/css/owl.theme.default.min.css">
    <!-- Theme style  -->
    <link rel="stylesheet" href="/css/style.css">

    <!-- Modernizr JS -->
    <script src="/js/modernizr-2.6.2.min.js"></script>
    <!-- FOR IE9 below -->
    <!--[if lt IE 9]>
    <script src="/js/respond.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <![endif]-->
    <style>
        #digicam {
            display: block;
            width: 100px;
            float: left;
            top: 10px;
            left: 10px;
            position: fixed;
            z-index: 1020;
        }

        h1, h2, h3, h4, h5, #colorlib-logo {
            font-family: "Quicksand", Arial, sans-serif;
        }

        #preview {
            border-radius: 50%;
            width: 230px;
            height: 230px;
            margin: 0 50px 25px 50px;
        }

        .date_radio {
            display: flex;
            justify-content: space-between;
            padding: 0 10px
        }
    </style>
    <script>
        let profileEdit = {
            init: function () {
                document.getElementById('update_btn').addEventListener('click', function () {
                    // alert("hi");
                    profileEdit.send();
                });
                // document.getElementById('pwd2').addEventListener('keyup', function () {
                //     var pwd1 = document.getElementById('pwd').value;
                //     var pwd2 = this.value;
                //     if (pwd1 == pwd2) {
                //         document.getElementById('check_pwd').textContent = '비밀번호가 일치합니다.';
                //     } else {
                //         document.getElementById('check_pwd').textContent = '비밀번호가 일치하지 않습니다.';
                //     }
                // });
            },
            send: function () {
                document.getElementById('profile_form').setAttribute('method', 'post');
                document.getElementById('profile_form').setAttribute('action', '/student/updateimpl');
                document.getElementById('profile_form').setAttribute('enctype', 'multipart/form-data');
                document.getElementById('profile_form').submit();
            },
        };

        window.addEventListener('DOMContentLoaded', function () {
            profileEdit.init();
        });
    </script>
    <script>
        // 파일 미리보기 해주는 스크립트
        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    document.getElementById('preview').src = e.target.result;
                };
                reader.readAsDataURL(input.files[0]);
            } else {
                document.getElementById('preview').src = "";
            }
        }
    </script>

</head>
<body>
<a href="/">
    <img id="digicam" src="/assets/images/digi_logo.png"></a>
<div id="colorlib-page">
    <div class="container-wrap">
        <a href="#" class="js-colorlib-nav-toggle colorlib-nav-toggle" data-toggle="collapse" data-target="#navbar"
           aria-expanded="false" aria-controls="navbar"><i></i></a>
        <aside id="colorlib-aside" role="complementary" class="border js-fullheight">
            <div class="text-center">
                <div class="author-img"
                     style="background-image: url('/uimg/${student.img}') "></div>
                <h1 id="colorlib-logo"><a href="/mypage">${student.name}</a></h1>
                <span class="position">
                       <c:choose>
                           <c:when test="${student.digi_sdate == '220201'}">
                               KB KOOKMIN BANK DIGI CAM 1TH
                           </c:when>
                           <c:when test="${student.digi_sdate =='230201'}">
                               KB KOOKMIN BANK DIGI CAM 2TH
                           </c:when>
                       </c:choose>
                    </span>
            </div>
        </aside>

        <div id="colorlib-main">
            <section class="colorlib-contact" data-section="contact">
                <div class="colorlib-narrow-content">
                    <div class="row">
                        <div class="col-md-6 col-md-offset-3 col-md-pull-3 animate-box"
                             data-animate-effect="fadeInLeft">
                            <span class="heading-meta">Change your story :)</span>
                            <h2 class="colorlib-heading">Profile Edit</h2>
                        </div>
                    </div>
                    <form id="profile_form" action="">
                        <div class="row">
                            <div class="col-md-5">
                                <div id="preview_box"><img src="/uimg/${student.img}"
                                                           id="preview"/></div>
                                <div class="form-group">
                                    <label>PROFILE IMG : </label>
                                    <input type="hidden" id="id" name="id" value="${student.id}">
                                    <input type="hidden" id="name" name="name" value="${student.name}">
                                    <input type="hidden" id="img" name="img" value="${student.img}">
                                    <input type="file" class="form-control"
                                           id="imgfile" name="imgfile" onchange="readURL(this)"
                                           placeholder="Profile image">

                                </div>


                                <div class="form-group">
                                    <label>WITH KB : </label> <input type="date" name="com_sdate" id="com_sdate"
                                                                     class="form-control">
                                    <p>${student.com_sdate}</p>
                                </div>
                                <div class="form-group">
                                    <label>WITH DIGI : </label>
                                    <div class="date_radio">
                                        <input type="radio" name="digi_sdate" id="digi_sdate1" value="220201">Digi
                                        Campus 1기
                                        <input type="radio" name="digi_sdate" id="digi_sdate2" value="230201">Digi
                                        Campus 2기
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label>MBTI :</label>
                                    <select class="form-control" id="mbti" name="mbti">
                                        <option>ISTJ</option>
                                        <option>ISFJ</option>
                                        <option>INFJ</option>
                                        <option>INTJ</option>
                                        <option>ISTP</option>
                                        <option>ISFP</option>
                                        <option>INFP</option>
                                        <option>INTP</option>
                                        <option>ESTP</option>
                                        <option>ESFP</option>
                                        <option>ENFP</option>
                                        <option>ENTP</option>
                                        <option>ESTJ</option>
                                        <option>ESFJ</option>
                                        <option>ENFJ</option>
                                        <option>ENTJ</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-7 col-md-push-1">
                                <div class="row">
                                    <div class="col-md-10 col-md-offset-1 col-md-pull-1 animate-box"
                                         data-animate-effect="fadeInRight">
                                        <%--                                        <div class="form-group">--%>
                                        <%--&lt;%&ndash;                                            <input type="hidden" name="pwd" value="${student.pwd}" }>&ndash;%&gt;--%>
                                        <%--&lt;%&ndash;                                            <input type="password" name="pwd" id="pwd" class="form-control"&ndash;%&gt;--%>
                                        <%--&lt;%&ndash;                                                   placeholder="Please enter your password.">&ndash;%&gt;--%>
                                        <%--                                        </div>--%>
                                        <div class="form-group">
                                            <textarea style="resize: none;" name="detail" id="detail" cols="30" rows="7"
                                                      class="form-control"
                                                      placeholder="Please provide an introduction about yourself.">${student.detail}</textarea>
                                        </div>
                                        <div class="form-group">
                                            <input type="email" name="email" id="email" class="form-control"
                                                   value="${student.email}" placeholder="Email">
                                        </div>
                                        <div class="form-group">
                                            <input type="number" name="contact" id="contact" class="form-control"
                                                   value="${student.contact}" placeholder="Contact">
                                        </div>
                                        <div class="form-group">
                                            <input type="text" name="facebook" id="facebook" class="form-control"
                                                   value="${student.facebook}" placeholder="Facebook ID...">
                                        </div>

                                        <div class="form-group">
                                            <input type="text" name="insta" id="insta" class="form-control"
                                                   value="${student.insta}" placeholder="Instagram ID...">
                                        </div>
                                        <div class="form-group">
                                            <input id="update_btn" type="button"
                                                   class="btn btn-primary btn-send-message"
                                                   value="EDIT">
                                        </div>

                                    </div>

                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </section>

        </div><!-- end:colorlib-main -->
    </div><!-- end:container-wrap -->
</div><!-- end:colorlib-page -->

<!-- jQuery -->
<script src="/js/jquery.min.js"></script>
<!-- jQuery Easing -->
<script src="/js/jquery.easing.1.3.js"></script>
<!-- Bootstrap -->
<script src="/js/bootstrap.min.js"></script>
<!-- Waypoints -->
<script src="/js/jquery.waypoints.min.js"></script>
<!-- Flexslider -->
<script src="/js/jquery.flexslider-min.js"></script>
<!-- Owl carousel -->
<script src="/js/owl.carousel.min.js"></script>
<!-- Counters -->
<script src="/js/jquery.countTo.js"></script>


<!-- MAIN JS -->
<script src="/js/main.js"></script>
<script>
    // 기존 회원이 선택한 MBTI 값을 가져옵니다.
    var selectedMBTI = "${student.mbti}";

    // MBTI 선택 옵션들의 NodeList를 가져옵니다.
    var mbtiOptions = document.querySelectorAll('#mbti option');

    var selectedDIGIDATE = "${student.digi_sdate}";

    // digi_sdate 라디오 버튼의 NodeList를 가져옵니다.
    var digiDateOptions = document.querySelectorAll('input[name="digi_sdate"]');

    // NodeList를 Array로 변환하여 각 옵션을 순회하며 선택 여부를 확인합니다.
    Array.from(mbtiOptions).forEach(function (option) {
        if (option.value === selectedMBTI) {
            // 기존 회원이 선택한 MBTI와 일치하는 옵션을 선택합니다.
            option.selected = true;
        }
    });

    // NodeList를 Array로 변환하여 각 라디오 버튼을 순회하며 선택 여부를 확인합니다.
    Array.from(digiDateOptions).forEach(function (radio) {
        if (radio.value === selectedDIGIDATE) {
            // 기존 회원이 선택한 digi_sdate와 일치하는 라디오 버튼을 선택합니다.
            radio.checked = true;
        }
    });

    var comSdateInput = document.getElementById("com_sdate");
    var comSdateValue = "${student.com_sdate}";

    // 값이 존재하는 경우
    if (comSdateValue) {
        // 년, 월, 일 분리
        var year = comSdateValue.substr(0, 2);
        var month = comSdateValue.substr(2, 2);
        var day = comSdateValue.substr(4, 2);

        // 날짜 형식으로 변환
        var formattedDate = "20" + year + "-" + month + "-" + day;

        // 날짜 값을 <input type="date"> 요소에 설정
        comSdateInput.value = formattedDate;
    }
</script>
</body>
</html>

