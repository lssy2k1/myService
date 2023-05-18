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

    .meeting-single-item .down-content {
        background-color: #fff;
        padding-top: 30px;
        border-top-right-radius: 20px;
        border-top-left-radius: 20px;
        border-bottom-right-radius: 20px;
        border-bottom-left-radius: 20px;
        padding-bottom: 30px;
    }

    #fixedDiv {
        position: fixed;
        right: 100px;
        top: 41%;
        transform: translate(0, -50%);
        width: 300px;
        height: 250px;
        background-color: #fff;
        border-top-right-radius: 20px;
        border-top-left-radius: 20px;
        border-bottom-right-radius: 20px;
        border-bottom-left-radius: 20px;
    }

    .button-container {
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        margin-top: 0px;
        margin-bottom: 0px;
        padding-top: 0;
        padding-bottom: 0;
    }

    .button-container a {
        width: 100%;
        margin-bottom: 10px;
        text-align: center;
    }

    input[type="checkbox"]:checked {
        accent-color: #ffc43c;
    }

</style>

<section class="meetings-page" id="meetings">
    <div class="container">
        <div class="section-heading">
            <h2>MY COURSE LIST(${cnt})</h2>
        </div>
        <div class="row">
            <div class="col-lg-10" style="margin-left: 0px;">
                <div class="meeting-single-item" style="border-radius: 20px;background-color: #fff;">
                    <div class="down-content">
                        <c:forEach var="c" items="${mycourse}">
                            <div class="row col-lg-12" style="text-align: center;">
                                <div class="col-lg-3" style="display:flex; justify-content:center; align-items:center;">
                                    <div style="display:flex; flex-direction: row; justify-content:center; align-items:center;">
                                        <input type="checkbox" id="${c.id}" style="margin-right: 10px;" checked>
                                        <p style="font-size: 17px; font-weight: 500; margin-top: 5px;">
                                            <a href="/lecture/detail?id=${c.lectureId}"><img
                                                    src="/uimg/${c.lecture_img}" style="width:100%;"></a></p>
                                    </div>
                                </div>
                                <div class="col-lg-7"
                                     style="margin-top:0px; margin-bottom: 0px; padding-top: 0; padding-bottom: 0;">
                                    <div style="text-align: left">
                                        <p style="font-size: 12px; font-weight: 500; margin-top: 5px;">${c.lecture_topic}</p>
                                        <h5>${c.lecture_title}</h5>
                                        <p style="font-size: 15px; font-weight: 500; margin-top: 5px;"
                                           class="lecture-price"><fmt:formatNumber value="${c.lecture_price}"
                                                                                   pattern="###,###원"/></p>
                                        <p style="font-size: 15px; font-weight: 500; margin-top: 5px;">${c.rdate}</p>
                                    </div>
                                </div>
                                <div class="col-lg-2 button-container main-button-yellow">
                                    <a href="/lecture/cartdelete?id=${c.id}">DELETE</a>
                                    <a href="/lecture/detail?id=${c.lectureId}">Go PAGE</a>
                                </div>
                            </div>
                        </c:forEach>
                        <hr>
                        <div class="row col-lg-12" style="text-align: center;">
                        <div class="col-lg-3 button-container main-button-yellow" style="justify-content: flex-end">
                            <a href="javascript:void(0)" id="checked_del_btn">DELETE SELECTED</a>
                        </div>
                            <div class="col-lg-9" style="text-align: left; padding-left: 20px;">
                                <p style="font-size: 12px;line-height: 1.5;">Those selected courses in My Course List will be kept for a maximum of 6 months.<br>
                                    The List can hold up to 100 courses. </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="fixedDiv" style="padding: 30px;">
        <h5 style="text-align:center; padding-bottom: 10px;">COURSE ENROLLMENT</h5>
        <hr>
        <div class="col-12" style="display: flex; flex-direction: row; justify-content: space-between;">
            <div>
                <p>Total Number of Courses: </p>
            </div>
            <div>
                <p id="sumCnt"></p>
            </div>
        </div>
        <div class="col-12" style="display: flex; flex-direction: row; justify-content: space-between;">
            <div>
                <p>Total Price: </p>
            </div>
            <div>
                <p id="sumPrice"></p>
            </div>
        </div>
        <hr>
        <div class="button-container main-button-yellow">
            <a href="#">START COURSE</a>
        </div>

    </div>
</section>
<script>
    let my_course = {
        init: function () {
            let sumPrice = 0;
            let cnt = 0;
            var checkedCheckboxes = $('input[type="checkbox"]:checked');
            checkedCheckboxes.each(function () {
                var lecturePrice = $(this).closest('.row').find('.lecture-price').text();
                lecturePrice = parseInt(lecturePrice.replace(/[^0-9]/g, ''));
                sumPrice += lecturePrice;
                cnt += 1;
            });
            $('#sumPrice').text('₩'+sumPrice);
            $('#sumCnt').text(cnt);

            // 체크박스 변경 시 이벤트 처리
            $('input[type="checkbox"]').change(function () {
                // 체크된 체크박스만 선택
                var checkedCheckboxes = $('input[type="checkbox"]:checked');
                sumPrice = 0;
                cnt = 0;

                checkedCheckboxes.each(function () {
                    var lecturePrice = $(this).closest('.row').find('.lecture-price').text();
                    lecturePrice = parseInt(lecturePrice.replace(/[^0-9]/g, ''));
                    sumPrice += lecturePrice;
                    cnt += 1;
                });

                $('#sumPrice').text('₩'+sumPrice);
                $('#sumCnt').text(cnt);
            });

            $('#checked_del_btn').click(function () {
                my_course.send();
            });
        },
        send: function(){
            let checkedIds = []; // 체크된 체크박스의 id 값을 담을 배열

            // 체크된 체크박스의 id 값을 추출하여 배열에 추가
            $("input[type='checkbox']:checked").each(function() {
                checkedIds.push($(this).attr("id"));
            });

            if (checkedIds.length > 0) {

                $.ajax({
                    url: '/checkeddelimpl',
                    type: 'post',
                    data: {checkedIds:checkedIds},
                    success: function(response) {
                        location.reload();
                    }
                });
            }
        }
    };

    $(function () {
        my_course.init();
    })
</script>