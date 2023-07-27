<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page session="false" %>
<html lang="UTF-8">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="resources/css/style.css">
	<script src="https://kit.fontawesome.com/1652357a48.js" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<title>E-Station</title>
</head>
<body>
<jsp:include page="./top_bottom_menu.jsp"></jsp:include>

<div class="login_section">
	<h3>로그인</h3>
	<p>아이디</p>
	<input type="text" placeholder="아이디를 입력하세요" id="user_id">
	<p>비밀번호</p>
	<input type="password" placeholder="비밀번호를 입력하세요" id="user_pw">
	<div class="login_function">
            <span>
                <a>아이디 찾기</a>
                <a>비밀번호 찾기</a>
            </span>
		<a>회원가입</a>
	</div>
	<button type="button" id="login-btn" onclick="login()">로그인하기</button>



	<div class="SNS_login">
		간편로그인
	</div>
</div>


</body>
<script src="resources/js/login.js"></script>
</html>
