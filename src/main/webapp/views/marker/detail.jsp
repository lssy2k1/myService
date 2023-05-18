<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- Bootstrap core JavaScript -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<style>

    section.heading-page h2 {
        padding-left: 200px;
        margin-top: 20px;
        margin-bottom: 20px;
        text-align: center;
        font-size: 36px;
        text-transform: uppercase;
        font-weight: 800;
        color: #fff;
        letter-spacing: 1px;
    }

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

</style>

<section class="meetings-page" id="meetings">
    <div class="container">
        <div class="section-heading">
            <h2>View Recommendation</h2>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="row">
                    <div class="col-lg-9" style="margin: 0 auto;">
                        <div class="meeting-single-item">
                            <div class="thumb">
                                <div class="price">
                                    <span><img src="/assets/images/rating.png" id="starRate">${marker.star}</span>
                                </div>
                                <img src="/uimg/${marker.img}"
                                     style="border-top-right-radius: 20px;border-top-left-radius: 20px;" alt="">
                            </div>
                            <div class="down-content">
                                <h4>${marker.title}</h4>
                                <p>Writer: ${marker.writer}</p>
                                <div class="row col-lg-12" style="text-align: left; margin-top: 30px;">
                                    <p style="font-size: 14px; font-weight: 400; ; padding-right: 20px;">${marker.detail}</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-12" style="margin:0 auto;">
                            <div class="main-button-red">
                                <a href="javascript:history.back()">Back To Course List</a>
                                <c:choose>
                                    <c:when test="${obj.writer==loginStudent.id}">
                                        <a href="/marker/edit?id=${marker.id}">EDIT</a>
                                        <a href="/marker/delete?id=${marker.id}">DELETE</a>
                                    </c:when>
                                    <c:otherwise>
                                    </c:otherwise>
                                </c:choose>
                            </div>
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
                    <img src="/uimg/${marker.img}" alt="">
                    <div style="text-align: center;">
                        <%--                        <span><img src="/assets/images/rating.png" id="starRate">${lecture.rating}</span>--%>
                        <%--                        <span><fmt:formatNumber value="${lecture.price}" type="number" pattern = "###,###원"/></span>--%>
                    </div>
                    <div style="text-align: center;">
                        <span style="font-size: 12px">${marker.title}</span>
                    </div>
                </div>
            </div>
            <div class="modal-body">
                <p id="cart_msg" style="text-align: center;">Would You Like to Add it to Your List?</p>
            </div>
            <div class="modal-footer">
                <div class="main-button-yellow" style="text-align: center;">
                    <a href="#" id="cart_btn">ADD to List</a>
                    <a href="#" id="go_cart">My List</a>
                    <a href="#" id="cartModalClose" data-dismiss="modal">Close</a>
                </div>
            </div>
        </div>
    </div>
</div>