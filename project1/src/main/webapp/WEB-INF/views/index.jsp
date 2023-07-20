<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html> 
<head>
<script type="module" src="https://ryj9d86xjh.execute-api.ap-northeast-2.amazonaws.com/v1/api/fontstream/djs/?sid=gAAAAABktObTyz-ThGGFX4r37eibzD3bEsOwbCE1d8-Qn7DjepOaWDVkRVp8gho2iF2FLe50eehHgfqjOqQlFPNKuPaN-t_tdrnU6XO-4bhgzXsAfJ7_JAQeRJJeRflv0nWDpz6j6JzZW0AJ0Um3ZFTVrJuxQyoretDZprv9pxHT2A_IG-2aHV9SMByVydiXkyUr60DErWdcbgW7hY2StrLJwm4vuGIR4cRyIBEVAu66wYWQD83HG6Y-OtFy_dEyQINw30UzfzaO" charset="utf-8"></script>
<meta charset="UTF-8">
<title>Index</title>
<link rel = "stylesheet" href="./css/menu.css">
<link rel = "stylesheet" href="./css/index.css">
<link rel="shortcut icon" href="./img/favicon.ico" type="image/x-icon">
<link rel="icon" href="./img/favicon.ico" type="image/x-icon">
</head>
<body>
<%@ include file="menu.jsp" %>
	<h1 style="border-left:15px solid #EF9A9A; padding:0 10px 3px 10px;font-weight:bold;">로그인 화면입니다.</h1>
	<div id="loginBox">
	<div>
		<img alt="surprise" src="./img/surprise.gif" height="100px";>
	</div>
	<div>
		<h1></h1>
		<input type="text" id="id" placeholder="아이디">
		<input type="password" id="pw" placeholder="비밀번호">
		<div id="search">
			<a href="" >아이디 찾기 |</a>	
			<a href="">비밀번호 찾기 |</a>
			<a href="">회원가입</a>
		</div>
		<button class="button" onclick="location.href='login.jsp'">로&nbsp;&nbsp;&nbsp;그&nbsp;&nbsp;&nbsp;인</button>
	</div>
		<!-- TEST -->
		<!-- TEST -->
		
</body>
</html>