<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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

    #map {
        width: 900px;
        height: 600px;
        border-top-right-radius: 20px;
        border-top-left-radius: 20px;
        border-bottom-right-radius: 20px;
        border-bottom-left-radius: 20px;
        border: none;
    }

    #login_row {
        margin: 0 auto;
        border-top-right-radius: 20px;
        border-top-left-radius: 20px;
        border-bottom-right-radius: 20px;
        border-bottom-left-radius: 20px;

    }

    .item h3 {
        color: #fff;
        text-transform: uppercase;
        font-size: 24px;
        font-weight: 700;
        margin-bottom: 20px;
    }

    #fixedDiv {
        position: fixed;
        right: 100px;
        top: 43.5%;
        transform: translate(0, -50%);
        width: 300px;
        height: 250px;
        background-color: rgba(255, 255, 255, 0);
        border-top-right-radius: 20px;
        border-top-left-radius: 20px;
        border-bottom-right-radius: 20px;
        border-bottom-left-radius: 20px;
    }

    .button-container {
        width: fit-content;
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

  .thumbnail-jmt {
    border-top-right-radius: 20px;
    border-top-left-radius: 20px;
    border-bottom-right-radius: 20px;
    border-bottom-left-radius: 20px;
  }
  #courses {
    padding-top: 30px;
  }

  .markerTitleTag {
    color: #6b6b6b;
  }

  .markerTitleTag:hover {
    color:#6b6b6b;
  }
</style>


<section class="meetings-page" id="meetings">
    <div class="container">
        <div class="section-heading">
            <h2>View Recommendation</h2>
        </div>
        <div class="col-lg-9 align-self-center" id="login_row">
            <div class="container" id="map03">
                <div id="map"></div>
            </div>
            <button type="button" class="btn btn-default">Seoul</button>
            <button type="button" class="btn btn-default">Busan</button>
            <button type="button" class="btn btn-default">Jeju</button>
        </div>
    </div>
    <div id="fixedDiv" style="padding: 30px;">
        <hr>
        <div class="col-lg-2 button-container main-button-red">

        </div>
        <div class="col-lg-2 button-container main-button-yellow">
            <a href="/marker/add" id="markerAdd" style="background-color: #a12c2f">ADD Marker</a>
            <a href="javascript:void(0)" id="c_btn">CAFE</a>
            <a href="javascript:void(0)" id="r_btn">RESTAURANT</a>
            <a href="javascript:void(0)" id="s_btn">STUDY CAFE</a>
        </div>
    </div>
</section>

<section class="our-courses" id="courses">
  <div class="container">
    <div class="row">
      <div class="col-lg-12">
        <div class="section-heading">
          <h2>Our Popular Courses</h2>
        </div>
      </div>
      <div class="col-lg-12">
        <div class="owl-courses-item owl-carousel">
<c:forEach var="c" items="${marker}">
          <div class="item thumbnail-jmt">
            <a href="/marker/detail?id=${c.id}"><img src="/uimg/${c.img}" style="border-top-right-radius: 20px; border-top-left-radius: 20px;"></a>
            <div class="down-content" style="border-bottom-right-radius: 20px; border-bottom-left-radius: 20px;">
              <h4><a href="/marker/detail?id=${c.id}" class="markerTitleTag">${c.title}</a></h4>
              <div class="info">
                <div class="row">
                  <div class="col-12">
                    <span style="font-size: 13px; color: #bcbebf">${c.detail}</span>
                  </div>
                </div>
              </div>
            </div>
          </div>
</c:forEach>
        </div>
      </div>
    </div>
  </div>
</section>






<script>
    let map03 = {
        map           : null,
        markerss      : [],
        init          : function () {
            this.display();
            $('#c_btn').click(function () {
                map03.markers('C');
            });
            $('#r_btn').click(function () {
                map03.markers('R');
            });
            $('#s_btn').click(function () {
                map03.markers('S');
            });
        },
        display       : function () {
            var mapContainer = document.querySelector('#map03 > #map');
            var mapOption = {
                center: new kakao.maps.LatLng(37.5444568, 127.0572981), // 지도의 중심좌표
                level : 7 // 지도의 확대 레벨
            };
            map = new kakao.maps.Map(mapContainer, mapOption);
            var mapTypeControl = new kakao.maps.MapTypeControl();

            map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

            var zoomControl = new kakao.maps.ZoomControl();
            map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

            var markerPosition = new kakao.maps.LatLng(37.5444568, 127.0572981);

            var marker = new kakao.maps.Marker({
                position: markerPosition
            });

            marker.setMap(map)
            map03.markerss.push(marker);
        },
        go            : function (lat, lng, keyword) {
            var mapContainer = document.querySelector('#map03 > #map');
            var mapOption = {
                center: new kakao.maps.LatLng(lat, lng), // 지도의 중심좌표
                level : 1 // 지도의 확대 레벨
            };
            map = new kakao.maps.Map(mapContainer, mapOption);

            var mapTypeControl = new kakao.maps.MapTypeControl();

            map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

            var zoomControl = new kakao.maps.ZoomControl();
            map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
            var moveLatLon = new kakao.maps.LatLng(lat, lng);
            map.panTo(moveLatLon);

            var markerPosition = new kakao.maps.LatLng(lat, lng);

            var marker = new kakao.maps.Marker({
                position: markerPosition
            });
            marker.setMap(map);
            map03.markerss.push(marker);


        },
        markers       : function (keyword) {
            map03.deleteMarkers();
            $.ajax({
                url    : '/markers',
                data   : {'keyword': keyword},
                success: function (data) {
                    map03.displaymarkers(data);
                }
            });

        },
        displaymarkers: function (positions) {

            var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
            for (var i = 0; i < positions.length; i++) {
                var imageSize = new kakao.maps.Size(20, 30);
                var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
                var markerPosition = new kakao.maps.LatLng(positions[i].lat, positions[i].lng);

                var marker = new kakao.maps.Marker({
                    map     : map,
                    position: markerPosition,
                    title   : positions[i].title,
                    image   : markerImage,
                    target  : positions[i].id

                });
                map03.markerss.push(marker);

                // infoWindow
                var iwContent = '<h2>' + positions[i].title + '</h2>';
                iwContent += '<img src="/uimg/' + positions[i].img + '" style="width:50px">';

                var infowindow = new kakao.maps.InfoWindow({
                    position: markerPosition,
                    content : iwContent
                });

                kakao.maps.event.addListener(marker, 'mouseover', mouseoverListener(marker, infowindow));
                kakao.maps.event.addListener(marker, 'mouseout', mouseoutListener(marker, infowindow));
                kakao.maps.event.addListener(marker, 'click', mouseclickListener(positions[i].id));


                function mouseoverListener(marker, infowindow) {
                    return function () {
                        infowindow.open(map, marker);
                    };
                }

                function mouseoutListener(marker, infowindow) {
                    return function () {
                        infowindow.close();
                    };
                }

                function mouseclickListener(target) {
                    return function () {
                        location.href = '/marker/detail?id=' + target;
                    };
                }

            } // end for

        },
        deleteMarkers : () => {
            // 이전에 생성된 마커를 제거합니다
            for (let i = 0; i < map03.markerss.length; i++) {
                map03.markerss[i].setMap(null);
            }
            map03.markerss = []; // 마커 배열 초기화

        }
    };
    $(function () {
        map03.init();
    })
</script>
