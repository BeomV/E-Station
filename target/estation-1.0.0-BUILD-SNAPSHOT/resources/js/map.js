$(document).on('click', '.charger_address', function() {
    $('.map_popup').show();
    // 위도와 경도 값을 얻음
    var lat = $(this).closest('li').find('.latitude').val();
    var lon = $(this).closest('li').find('.longitude').val();

    // 현재 클릭된 항목의 부모 li를 찾음
    var parentLi = $(this).closest('li');

    // latitude와 longitude 입력 필드에 값을 설정

    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new kakao.maps.LatLng(lat, lon), // 지도의 중심좌표
            level: 3 // 지도의 확대 레벨
        };

    var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

    // 마커가 표시될 위치입니다
    var markerPosition  = new kakao.maps.LatLng(lat, lon);

    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        position: markerPosition
    });

    // 마커가 지도 위에 표시되도록 설정합니다
    marker.setMap(map);

    // 아래 코드는 지도 위의 마커를 제거하는 코드입니다
    // marker.setMap(null);

});

$(document).on('click', '.fa-solid.fa-xmark', function() {
    // $('.map_popup').css('display','none');
    $('.map_popup').hide()
});
