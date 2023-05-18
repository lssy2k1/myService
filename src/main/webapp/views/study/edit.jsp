<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<style>
    .item h3 {
        color: #fff;
        text-transform: uppercase;
        font-size: 24px;
        font-weight: 700;
        margin-bottom: 20px;
    }

    #register_container {
        padding-top: 120px;
    }

    #register_row {
        margin: 0 auto;
        background-color: rgba(255, 255, 255, 0.26);
        padding: 100px 75px 35px 75px;
    }

    .form-group {
        margin-bottom: 10px;
    }

    input[type="file"],
    input[type="text"],
    input[type="password"],
    input[type="number"],
    input[type="email"],
    input[type="datetime-local"],
    textarea {
        height: 50px;
        border-style: none;
        border-radius: 30px;
        background-color: rgb(53, 53, 53);
        color: rgb(227, 227, 227);
        padding-left: 30px;

    }

    input[type="file"]:focus,
    input[type="datetime-local"]:focus,
    input[type="text"]:focus,
    input[type="password"]:focus,
    input[type="number"]:focus,
    input[type="email"]:focus,
    input[type="button"]:focus,
    textarea:focus {
        background-color: rgb(53, 53, 53);
        color: rgb(227, 227, 227);
        box-shadow: none;
        outline: none;
        border: 1px solid #fff;
    }

    input[type="number"]::-webkit-outer-spin-button,
    input[type="number"]::-webkit-inner-spin-button {
        -webkit-appearance: none;
        margin: 0;
    }

    input[type="number"],
    input[type="number"]::placeholder {
        padding-left: 0px;
        text-align: center;
    }

    #edit_btn {
        margin-top: 20px;
        height: 50px;
        border-style: none;
        border-radius: 30px;
        border-radius: 30px;
        color: #fff;
        background-color: #f5a425;
        font-size: 15px;
        font-weight: 500;
    }

    .item p {
        font-size: 11px;
        color: rgb(227, 227, 227);
    }

    #button-group {
        padding: 0px 10px 80px 10px;
    }

    .btns {
        color: #f5a425;
    }

    .form-group p {
        text-align: center;
    }

    input[type="datetime-local"]::-webkit-datetime-edit-text {
        -webkit-appearance: none;
        display: none;
    }

    input[type="datetime-local"] {
        content: attr(data-placeholder);
    }

    input[type="file"]::file-selector-button {
        display: none;
    }

    #contents {
        border-style: none;
        border-radius: 30px;
        background-color: rgb(53, 53, 53);
        color: rgb(227, 227, 227);
        padding-left: 30px;
    }

    #contents:hover {
        background-color: rgb(53, 53, 53);
        color: rgb(227, 227, 227);
        box-shadow: none;
        outline: none;
        border: 1px solid #fff;
    }

    #contents:focus {
        outline: none;
        box-shadow: none;
    }

    .edit_label {
        color: #f5a425;
        font-weight: 600;
    }

    .edit_time {
        margin-bottom: 10px;
    }

</style>

<script>
    let study_edit = {
        init:function (){
            $('#edit_btn').click(function (){
                study_edit.send();
            });
        },
        send:function (){
            $('#study_edit').attr({
                method:'post',
                action:'/study/editimpl',
                enctype: 'multipart/form-data'
            });
            $('#study_edit').submit();
        }
    };
    $(function (){
        study_edit.init();
    });
</script>


<section class="section main-banner" id="top" data-section="section1">
    <video autoplay muted loop id="bg-video">
        <source src="/assets/images/course-video.mp4" type="video/mp4"/>
    </video>
    <div class="video-overlay header-text">
        <div class="container" id="register_container">
            <div class="row">
                <div class="col-lg-6 align-self-center" id="register_row">
                    <div class="col-lg-12">
                        <div class="item">
                            <h3>EDIT YOUR STUDY JOURNAL</h3>
                            <form id="study_edit">
                                <div class="form-group">
                                    <input type="hidden" name="id" class="form-control" id="id"
                                           value="${study.id}">
                                    <input type="hidden" name="writer" class="form-control" id="writer"
                                           value="${study.writer}">
                                </div>
                                <div class="form-group">
                                    <div style="width:50%; float:left;">
                                        <label for="startTime" class="edit_label">From</label>
                                    </div>
                                    <div style="width:50%; float:left;">
                                        <label for="startTime" class="edit_label">Until</label>
                                    </div>
                                    <div class="edit_time" style="width:50%; float:left;">
                                        <input type="datetime-local" name="startTime" id="startTime" style="width: 100%;">
                                    </div>
                                    <div class="edit_time" style="width:50%; float:left;">
                                        <input type="datetime-local" name="endTime" id="endTime" style="width:100%;">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <span class="edit_label">Select File (Original: ${study.fileName_org} )</span>
                                    <input type="file" name="file" class="form-control" id="file">
                                </div>
                                <div class="form-group">
                                    <span class="edit_label">Study Summary</span>
                                    <input type="text" name="contents" class="form-control" id="contents"
                                           placeholder="CONTENTS"
                                           autocomplete="off" value="${study.contents}">
                                </div>

                                <div class="form-group">
                                    <input type="button" class="form-control" id="edit_btn" value="edit">
                                </div>
                                <div class="form-group" id="button-group">
                                    <p>
                                        We will be offering <span class="btns">free coupons</span> to students with
                                        <span class="btns">the highest total study hours.</span><br>
                                        We encourage everyone to participate actively.
                                        and on MyPage.<br></p>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
