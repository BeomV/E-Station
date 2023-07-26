<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false" %>
<html lang="UTF-8">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="resources/css/style.css">
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
				$.ajax({
					url: "openApi.do?addrFilter="+Filtering01+"&addrFilter="+Filtering02+"&pageNum="+pageNum,
					dataType: 'json',
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
			<option>선택없음</option>
		</select>
		<select id="second_area">
			<option>선택없음</option>
		</select>
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
</div>
</body>

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

		var cities = ['서울특별시', '부산광역시', '대구광역시', '인천광역시', '광주광역시', '대전광역시', '울산광역시', '세종시', '경기도', '강원도', '충청북도', '충청남도', '전라북도', '전라남도', '경상북도', '경상남도', '제주도'];
		var seoul_districts = ['강남구', '강동구', '강북구', '강서구', '관악구', '광진구', '구로구', '금천구', '노원구', '도봉구', '동대문구', '동작구', '마포구', '서대문구', '서초구', '성동구', '성북구', '송파구', '양천구', '영등포구', '용산구', '은평구', '종로구', '중구', '중랑구'];

		$.each(cities, function(key, value) {
			$('#first_area')
					.append($("<option></option>")
							.attr("value",key)
							.text(value));
		});







	});
</script>


</html>
