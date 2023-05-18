<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- Bootstrap core JavaScript -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

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

    #starRate {
        width: 20px;
        margin-bottom: 2px;
        margin-right: 2px;
    }

    #first {
        cursor: pointer;
        width: 20px;
    }

    .lecture_attr {
        font-size: 20px;
        font-weight: 500;
    }
</style>

<script>
    let lecture_cart = {
        init: function () {
            $('#go_cart').hide();


            $('#cart_btn').click(function () {
                let studentId = '${loginStudent.id}';
                let lectureId = ${lecture.id};
                $.ajax({
                    url: '/cartimpl',
                    data: {studentId:studentId, lectureId:lectureId},
                    success: function (result) {
                        if(result == 0){
                            $('#cart_msg').html('Sorry, Already in Your List!');
                        } else if(result == 1){
                            $('#cart_btn').hide();
                            $('#go_cart').show();
                            $('#cartModalClose').text('Continue');
                            $('#cart_msg').html('Added to Your List!');
                        }
                    }
                });
            });
        }
    };
    $(function () {
        lecture_cart.init();
    });
</script>


<section class="meetings-page" id="meetings">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="row">
                    <div class="col-lg-9" style="margin: 0 auto;">
                        <div class="meeting-single-item">
                            <div class="thumb">
                                <div class="price">
                                    <span><img src="/assets/images/rating.png" id="starRate">${lecture.rating}</span>
                                </div>
                                <div class="date">
                                    <h6>TOPIC <span>${lecture.topic}</span></h6>
                                </div>
                                <a href="${lecture.target}"><img src="/uimg/${lecture.img}" style="border-top-right-radius: 20px;border-top-left-radius: 20px;" alt=""></a>
                            </div>
                            <div class="down-content">
                                <a href="${lecture.target}"><h4>${lecture.title}</h4></a>
                                <p>Teacher: ${lecture.teacher}</p>
                                <div class="row col-lg-12" style="text-align: center; margin-top: 30px;">
                                    <div class="col-lg-3">
                                        <div>
                                            <h5>Topic</h5>
                                            <p style="font-size: 17px; font-weight: 500; margin-top: 5px;">${lecture.topic}</p>
                                        </div>
                                    </div>
                                    <div class="col-lg-3">
                                        <div>
                                            <h5>Duration</h5>
                                            <p style="font-size: 15px; font-weight: 500; margin-top: 5px;">${lecture.length}</p>
                                        </div>
                                    </div>
                                    <div class="col-lg-3">
                                        <div>
                                            <h5>Price</h5>
                                            <p style="font-size: 15px; font-weight: 500; margin-top: 5px;">
                                                <fmt:formatNumber value="${lecture.price}" type="number" pattern = "###,###원"/></p>
                                        </div>
                                    </div>
                                    <div class="col-lg-3">
                                        <div>
                                            <h5>ADD LIST</h5>
                                            <p class="lecture_attr"><img src="/assets/images/lecture_cart.png" id="first" data-toggle="modal"
                                            data-target="#cartModal"></p>
                                        </div>
                                    </div>
                                </div>
                                <p class="description">
                                    This is a video course about ${lecture.topic} and has received a rating
                                    of ${lecture.rating} out of 5 stars.<br>
                                    The total duration of this course is ${lecture.length} hours, and it will be taught
                                    by instructor ${lecture.teacher}.<br>
                                    For more information <a href="${lecture.target}">Click Here</a>
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-12" style="margin:0 auto;">
                        <div class="main-button-red">
                            <a href="javascript:history.back()">Back To Course List</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>


<!-- Modal -->
<div class="modal fade" id="cartModal" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <div class="thumb">
                    <img src="/uimg/${lecture.img}" alt="">
                    <div style="text-align: center;">
<%--                        <span><img src="/assets/images/rating.png" id="starRate">${lecture.rating}</span>--%>
<%--                        <span><fmt:formatNumber value="${lecture.price}" type="number" pattern = "###,###원"/></span>--%>
                    </div>
                    <div style="text-align: center;">
<span style="font-size: 12px">${lecture.title}</span>
                    </div>
                </div>
            </div>
            <div class="modal-body">
                <p id="cart_msg" style ="text-align: center;">Would You Like to Add it to Your List?</p>
            </div>
            <div class="modal-footer">
                <div class="main-button-yellow" style="text-align: center;">
                    <a href="#" id="cart_btn">ADD to List</a>
                    <a href="/lecture/mycourse?id=${loginStudent.id}" id="go_cart">My List</a>
                    <a href="#" id="cartModalClose" data-dismiss="modal">Close</a>
                </div>
            </div>
        </div>
    </div>
</div>