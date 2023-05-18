<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- Bootstrap core JavaScript -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<style>
    section.meetings-page h6 {
        margin-top: 0px;
        font-size: 15px;
        text-transform: uppercase;
        font-weight: 600;
        color: #fff;
        letter-spacing: 1px;
        text-align: center;
    }

    section.meetings-page h2 {
        margin-top: 20px;
        margin-bottom: 20px;
        font-size: 36px;
        text-transform: uppercase;
        font-weight: 800;
        color: #fff;
        letter-spacing: 1px;
        text-align: center;
    }

    .form-control {
        margin: 10px;
    }

    #marker_form {
        margin: 0 5%;
    }

    #register_btn {
        margin: 0 45% 3% 45%;
        width: 80px;
    }

    #preview_box {
        margin: 2% 35%;
    }

    #preview {
        width: 100%;
        height: 100%;
    }
</style>

<script>

    let marker_add = {
        init: function () {
            $('#register_btn').click(function () {
                // alert('hi')
                marker_add.send();
            })
        },
        send: function () {
            $('#marker_form').attr({
                method : 'post',
                action : '/marker/editimpl',
                enctype: 'multipart/form-data'
            });
            $('#marker_form').submit();
        }

    };
    $(function () {
            marker_add.init();
        }
    )
</script>
<script>
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
<section class="meetings-page" id="meetings">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="meeting-single-item">
                            <div class="thumb">
                                <div class="price">
                                    <span>Digi-Mon들에게 당신의 HOT🔥&JMT 맛집🍚 카페☕를 알려주세요!</span>
                                    <span>추첨을 통해 소정의 사은품을 드립니다🧨🧨</span>
                                </div>
                                <div class="date">
                                    <img style="width: 50px"
                                         src="https://scontent-gmp1-1.xx.fbcdn.net/v/t39.30808-6/327207971_1123648701638688_1531155838137942191_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=j5TGy18HgYwAX-BR7rX&_nc_ht=scontent-gmp1-1.xx&oh=00_AfB44StggwciTL2-OhuShJArsmO0rXIp0sRwJzYn1rXJJw&oe=646B3D64">
                                </div>
                                <a href="#"><img src="/assets/images/jmt.jpg" alt=""></a>
                            </div>
                            <div class="down-content">
                                <form id="marker_form">
                                    <input type="hidden" id="writer" name="writer" value="${marker.writer}">
                                    <div class="form-group">
                                        <input type="title" class="form-control" id="title" name="title"
                                               placeholder="Enter title..." value="${marker.title}">
                                    </div>
                                    <div style="margin-left: 0.2px" class="form-group row">
                                        <div class="col-sm-6">
                                            <select class="form-select" id="keyword" name="keyword">
                                                <option value="C">Cafe</option>
                                                <option value="R">Restaurant</option>
                                                <option value="S">Study Cafe</option>
                                            </select>
                                        </div>
                                        <div class="col-sm-6">
                                            <select class="form-select" id="star" name="star">
                                                <option value="5">⭐⭐⭐⭐⭐</option>
                                                <option value="4">⭐⭐⭐⭐</option>
                                                <option value="3">⭐⭐⭐</option>
                                                <option value="2">⭐⭐</option>
                                                <option value="1">⭐</option>
                                            </select>
                                        </div>
                                    </div>


                                    <div class="form-group row">
                                        <div class="col-sm-6">
                                            <input type="number" class="form-control"
                                                   id="lat" name="lat" placeholder="Enter lat" value="${marker.lat}">
                                        </div>
                                        <div class="col-sm-6">
                                            <input type="number" class="form-control"
                                                   name="lng" id="lng" placeholder="Enter lng" value="${marker.lng}">
                                        </div>
                                    </div>


                                    <div class="form-group">
                                            <textarea type="text" style="resize: none" class="form-control" id="detail"
                                                      name="detail"
                                                      placeholder="Enter detail...">${marker.detail}</textarea>
                                    </div>
                                    <div class="form-group">
                                        <input type="file" class="form-control"
                                               id="imgfile" name="imgfile" onchange="readURL(this)"
                                               placeholder="Input image">
                                        <div id="preview_box"><img id="preview"/></div>
                                    </div>

                                    <button type="button" id="register_btn"
                                            class="btn btn-warning float-right">등록
                                    </button>
                                    <hr>

                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>