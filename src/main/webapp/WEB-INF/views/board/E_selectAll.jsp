<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false" %>
<html lang="UTF-8">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="resources/css/style.css">
	<link rel="stylesheet" href="resources/css/map.css">
	<script src="https://kit.fontawesome.com/1652357a48.js" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		$(document).ready(function(){

			var chargeTp = {
				'1': '완속',
				'2': '급속'
			}

			var pageNum = 1;

			var cpStatMap = {
				'0': '상태확인불가',
				'1': '충전가능',
				'2': '충전중',
				'3': '고장/점검',
				'4': '통신장애',
				'5': '통신미연결',
				'8': '확인불가',
				'9': '충전예약'
			};

			var cpTpMap = {
				'1': 'B타입(5핀)',
				'2': 'C타입(5핀)',
				'3': 'BC타입(5핀)',
				'4': 'BC타입(7핀)',
				'5': 'DC차데모',
				'6': 'AC3상',
				'7': 'DC콤보',
				'8': 'DC차데모+DC콤보',
				'9': 'DC차데모+AC3상',
				'10': 'DC차데모+DC콤보, AC3상'
			};

			var totalPages;
			var Filtering01 = '';
			var Filtering02 = '';


			function loadData() {
				var filterValue = (Filtering01 ? Filtering01 : "") + "," + (Filtering02 ? Filtering02 : "");
				$.ajax({
					url: "openApi.do",
					data: {
						addrFilter: filterValue,
						pageNum: pageNum
					},
					success: function(data) {
						console.log(data);

						totalPages = data.totalPages;

						$("#list").empty(); // 기존 목록을 비웁니다.

						$.each(data.data, function(index, item) {
							// HTML 문자열 생성
							var li =
									'<li>' +
									'<div class="charger_list_info">' +
									'<h3>' + item.csNm + '</h3>' +
									'<i class="fas fa-angle-up"></i>' +
									'</div>' +
									'<div class="charger_list_detail">' +
									'<p class="charger_address">' + item.addr + '</p>' +
									'<span>' +
									'<p>' + item.cpNm + '</p>' +
									'<p>' + chargeTp[item.chargeTp] + '</p>' +
									'</span>' +
									'<p>' + cpTpMap[item.cpTp] + '</p>' +
									'<div class="charger_status">' +
									'<P>' + cpStatMap[item.cpStat] + '</P>' +
									'</div>' +
									'<input type="hidden" class="latitude" value="' + item.lat + '"/>' +
									'<input type="hidden" class="longitude" value="' + item.longi + '"/>' +
									'</div>' +
									'</li>';

							// 생성된 HTML 문자열을 #list에 추가
							$('#list').append(li);
						});
					},
					error:function(xhr,status,error){
						console.log('xhr.status:', xhr.status);
					}
				});
			}

			// 페이지 로드 시 첫 번째 페이지를 로드합니다.
			loadData();

			$('#search_area').click(function(){
				Filtering01 = $('#first_area').val();
				Filtering02 = $('#second_area').val();
				loadData();
				console.log(Filtering01,Filtering02);
			});

			$("#prev_page").click(function() {
				if (pageNum > 1) { // 첫 페이지에서는 더 이상 이전으로 가지 않습니다.
					pageNum = pageNum - 1;
					loadData(); // 페이지가 바뀌었으므로 새 페이지를 로드합니다.
				}else if( pageNum <= 1){
					alert("첫 번째 페이지입니다.");
				}
				console.log(pageNum);
			});

			$("#next_page").click(function() {
				if(pageNum < totalPages){
					pageNum = pageNum + 1;
					console.log(pageNum);
					loadData(); // 페이지가 바뀌었으므로 새 페이지를 로드합니다.

				}else{
					alert("마지막 페이지입니다.");
				}

				console.log(totalPages);
			});


		});
	</script>

	<title>Document</title>
</head>
<body style="padding-bottom: 35vw;">
<jsp:include page="../top_bottom_menu.jsp"></jsp:include>
<div class="top_menu_section">
	<ul>
		<li><a>충전소</a></li>
		<li><a>충전소</a></li>
		<li><a>충전소</a></li>
		<li><a>충전소</a></li>
	</ul>
</div>

<div class="map_menu_section">

	<h3>전기차 충전소</h3>

	<div class="charger_list_filter">
		<select id="first_area">
			<option value="">선택없음</option>
		</select>
		<select id="second_area">
			<option value="">선택없음</option>
		</select>
		<button type="button" id="search_area">검색</button>

	</div>

	<div class="charger_list">
		<ul id="list">

		</ul>

<%--		<li>--%>
<%--			<div class="charger_list_info">--%>
<%--				<h3>csNm</h3>--%>
<%--				<p class="charger_address">addr <i class="fas fa-angle-up"></i></p>--%>
<%--			</div>--%>
<%--			<div class="charger_list_detail">--%>
<%--                    <span>--%>
<%--                        <p>cpNm</p>--%>
<%--                        <p>chargeTp</p>--%>
<%--                    </span>--%>

<%--				<p>cpTp</p>--%>
<%--				<div class="charger_status">--%>
<%--					<P>cpStat</P>--%>
<%--&lt;%&ndash;					<strong>충전가능</strong>&ndash;%&gt;--%>
<%--				</div>--%>
<%--			</div>--%>
<%--		</li>--%>

	</div>
	<div class="charger_list_page">
		<a id="prev_page"><i class="fa-solid fa-angle-left"></i></a>
		<a id="next_page"><i class="fa-solid fa-angle-right"></i></a>
	</div>

	<div class="map_popup">
		<i class="fa-solid fa-xmark"></i>
		<div id="map"></div>
	</div>


</div>
</body>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=51e973ccd6478e2c5b4b2b25288d026b"></script>
<script src="resources/js/map.js"></script>
<script>
	$(document).ready(function(){

		$(document).on("click", ".charger_list_info", function(){
			console.log("test");
			$(this).siblings(".charger_list_detail").slideToggle(300);
			var icon = $(this).find('i');

			if(icon.hasClass('fa-angle-down')) {
				icon.removeClass('fa-angle-down');
				icon.addClass('fa-angle-up');
			} else {
				icon.removeClass('fa-angle-up');
				icon.addClass('fa-angle-down');
			}
		});

		var cities = ['서울특별시', '부산광역시', '대구광역시', '인천광역시', '광주광역시', '대전광역시', '울산광역시', '세종특별자치시', '경기도', '강원도', '충청북도', '충청남도', '전라북도', '전라남도', '경상북도', '경상남도', '제주특별자치도'];
		var seoul_districts = ['강남구', '강동구', '강북구', '강서구', '관악구', '광진구', '구로구', '금천구', '노원구', '도봉구', '동대문구', '동작구', '마포구', '서대문구', '서초구', '성동구', '성북구', '송파구', '양천구', '영등포구', '용산구', '은평구', '종로구', '중구', '중랑구'];
		var busan_districts = ['중구', '서구', '동구', '영도구', '부산진구', '동래구', '남구', '북구', '해운대구', '사하구', '금정구', '강서구', '연제구', '수영구', '사상구', '기장군'];
		var daegu_districts = ['중구', '동구', '서구', '남구', '북구', '수성구', '달서구', '달성군'];
		var incheon_districts = ['중구', '동구', '남구', '연수구', '남동구', '부평구', '계양구', '서구', '강화군', '옹진군'];
		var gwangju_districts = ['동구', '서구', '남구', '북구', '광산구'];
		var daejeon_districts = ['동구', '중구', '서구', '유성구', '대덕구'];
		var ulsan_districts = ['중구', '남구', '동구', '북구', '울주군'];
		var gyeonggi_districts = ['수원시', '성남시', '의정부시', '안양시', '부천시', '광명시', '평택시', '동두천시', '안산시', '고양시', '과천시', '구리시', '남양주시', '오산시', '시흥시', '군포시', '의왕시', '하남시', '용인시', '파주시', '이천시', '안성시', '김포시', '화성시', '광주시', '양주시', '포천시', '여주시', '연천군', '가평군', '양평군'];
		var gangwon_districts = ['춘천시', '원주시', '강릉시', '동해시', '태백시', '속초시', '삼척시', '홍천군', '횡성군', '영월군', '평창군', '정선군', '철원군', '화천군', '양구군', '인제군', '고성군', '양양군'];
		var chungbuk_districts = ['청주시', '충주시', '제천시', '보은군', '옥천군', '영동군', '증평군', '진천군', '괴산군', '음성군', '단양군'];
		var chungnam_districts = ['천안시', '공주시', '보령시', '아산시', '서산시', '논산시', '계룡시', '당진시', '금산군', '부여군', '서천군', '청양군', '홍성군', '예산군', '태안군'];
		var jeonbuk_districts = ['전주시', '군산시', '익산시', '정읍시', '남원시', '김제시', '완주군', '진안군', '무주군', '장수군', '임실군', '순창군', '고창군', '부안군'];
		var jeonnam_districts = ['목포시', '여수시', '순천시', '나주시', '광양시', '담양군', '곡성군', '구례군', '고흥군', '보성군', '화순군', '장흥군', '강진군', '해남군', '영암군', '무안군', '함평군', '영광군', '장성군', '완도군', '진도군', '신안군'];
		var gyeongbuk_districts = ['포항시', '경주시', '김천시', '안동시', '구미시', '영주시', '영천시', '상주시', '문경시', '경산시', '군위군', '의성군', '청송군', '영양군', '영덕군', '청도군', '고령군', '성주군', '칠곡군', '예천군', '봉화군', '울진군', '울릉군'];
		var gyeongnam_districts = ['창원시', '진주시', '통영시', '사천시', '김해시', '밀양시', '거제시', '양산시', '의령군', '함안군', '창녕군', '고성군', '남해군', '하동군', '산청군', '함양군', '거창군', '합천군'];
		var jeju_districts = ['제주시', '서귀포시'];

		var districts = {
			'서울특별시': seoul_districts,
			'부산광역시': busan_districts,
			'대구광역시': daegu_districts,
			'인천광역시': incheon_districts,
			'광주광역시': gwangju_districts,
			'대전광역시': daejeon_districts,
			'울산광역시': ulsan_districts,
			'경기도': gyeonggi_districts,
			'세종특별자치시': '',
			'강원도': gangwon_districts,
			'충청북도': chungbuk_districts,
			'충청남도': chungnam_districts,
			'전라북도': jeonbuk_districts,
			'전라남도': jeonnam_districts,
			'경상북도': gyeongbuk_districts,
			'경상남도': gyeongnam_districts,
			'제주특별자치도': jeju_districts
		};
		// Add other cities' districts here

		$.each(cities, function(index, city) {
			$('#first_area').append($("<option></option>").attr("value", city).text(city));
		});

		$('#first_area').change(function() {
			var city = $(this).val();
			var district_list = districts[city];
			$('#second_area').empty();

			if(district_list){
				$.each(district_list, function(key, value) {
					$('#second_area').append($("<option></option>").attr("value",value).text(value));
				});
			}else{
				$('#second_area').append($("<option></option>").attr("value","").text('선택없음'));
			}
		});
		//...








	});
</script>


</html>
