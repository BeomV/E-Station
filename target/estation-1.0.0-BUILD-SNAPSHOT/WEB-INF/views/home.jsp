<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page session="false" %>
<html lang="UTF-8">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="resources/css/style.css">
	<script src="https://kit.fontawesome.com/1652357a48.js" crossorigin="anonymous"></script>
	<title>E-Station</title>
</head>
<body>
<jsp:include page="./top_bottom_menu.jsp"></jsp:include>
<div class="main_top_section">
	<div class="main_top_slide">


	</div>
	<div class="main_top_link">
		<div>
			<h3>어떠한 기능을 찾고 계신가요?</h3>
		</div>
		<div>
			<ul>
				<li>
					<a href="E_selectAll.do">
						<i class="fas fa-map-marked-alt"></i>
						인터넷
					</a>
				</li>
				<li>
					<a>
						<i class="fas fa-map-marked-alt"></i>
						인터넷
					</a>
				</li>
				<li>
					<a>
						<i class="fas fa-map-marked-alt"></i>
						인터넷
					</a>
				</li>
				<li>
					<a>
						<i class="fas fa-map-marked-alt"></i>
						인터넷
					</a>
				</li>
			</ul>
		</div>
	</div>

	<div class="main_top_menu">
		<strong>즐겨찾는 메뉴</strong>
		<ul>
			<li><a>요금조회</a></li>
			<li><a>요금조회2</a></li>
			<li><a>요금조회3</a></li>
		</ul>

	</div>

</div>

<div class="item_section">
	<h3>추천 기능</h3>
	<div class="item_list_slide">
		<p class="item_list_slide_title">타이틀</p>
		<p class="item_list_slide_sub_title">타이틀</p>
	</div>

</div>

<div class="recommend_menu">
	<p class="recommend_menu_title">내가 원하는 상품, 혜택, 요금을 직접 확인하고 비교해보세요!</p>
	<a>추천 상품</a>
</div>
<div class="events_menu">
	<h3>혜택</h3>
	<ul>
		<li><a>1</a></li>
		<li><a>1</a></li>
		<li><a>1</a></li>
		<li><a>1</a></li>
	</ul>
</div>





</body>
</html>
