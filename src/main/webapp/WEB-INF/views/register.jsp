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
<div class="register_section">
	<h3>회원가입</h3>
	<p>아이디</p>
	<input type="text" placeholder="아이디를 입력하세요." id="user_id">
	<p>비밀번호</p>
	<input type="password" placeholder="비밀번호를 입력하세요." id="user_pw">
	<p>비밀번호 확인</p>
	<input type="password" placeholder="비밀번호를 입력하세요.">
	<p>이메일</p>
	<div class="email_section">
		<input type="email" placeholder="이메일을 입력하세요." id="user_email">
		<button type="button">인증번호 발송</button>
	</div>
	<div class="emailCheck_section">
		<input type="email" placeholder="인증번호를 입력하세요." id="user_emailCheck">
		<button type="button">확인</button>
	</div>
	<p>휴대폰 번호</p>
	<input type="text" placeholder="휴대폰 번호를 입력하세요" id="user_tel">
	<p>생년월일</p>
	<div class="birth_section">
		<select class="birth_year"></select>
		<select class="birth_month"></select>
		<select class="birth_day"></select>
	</div>
	<button type="button" id="register-btn" onclick="register()">가입하기</button>
</div>


</body>
<script src="resources/js/register.js"></script>
</html>
