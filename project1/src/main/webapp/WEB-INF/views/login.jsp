<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="module"
	src="https://ryj9d86xjh.execute-api.ap-northeast-2.amazonaws.com/v1/api/fontstream/djs/?sid=gAAAAABktObTyz-ThGGFX4r37eibzD3bEsOwbCE1d8-Qn7DjepOaWDVkRVp8gho2iF2FLe50eehHgfqjOqQlFPNKuPaN-t_tdrnU6XO-4bhgzXsAfJ7_JAQeRJJeRflv0nWDpz6j6JzZW0AJ0Um3ZFTVrJuxQyoretDZprv9pxHT2A_IG-2aHV9SMByVydiXkyUr60DErWdcbgW7hY2StrLJwm4vuGIR4cRyIBEVAu66wYWQD83HG6Y-OtFy_dEyQINw30UzfzaO"
	charset="utf-8"></script>
<meta charset="UTF-8">
<title>Login</title>
<link rel="stylesheet" href="./css/menu.css">
<link rel="stylesheet" href="./css/index.css">
<link rel="shortcut icon" href="./img/favicon.ico" type="image/x-icon">
<link rel="icon" href="./img/favicon.ico" type="image/x-icon">
<script src="./js/jquery-3.7.0.min.js"></script>

<script type="text/javascript">
//스크립트 영역
let text = "<p>올바른 아이디를 입력하세요.</p>"; //전역변수
//호이스팅이 뭐예요? let vs var? json? const


function checkID() {
	//alert("!");
	let msg = document.getElementById("msg")
	msg.innerHTML = "<p>" + document.getElementById("id").value + "아이디를 변경했습니다.</p>"
}


function check() {
	//alert("!")
	let msg = document.getElementById("msg");
	let id = document.getElementById("id"); //id 값 가진거 하나 가져올거야 id는 한개 
	//alert(id.value); //id 안에서 값 가져올거야
	//alert(id.value.length); //id 안에서 값 가져올거야
	if (id.value.length < 2) {
		alert("아이디는 2글자 이상이어야 합니다.");
		msg.innerHTML = text;
		id.focus(); //input창의 id를 의미한다.
		return false;
	} 
	
	let pw = document.getElementById("pw"); 
	if (pw.value.length < 2) {
		alert("암호는 2글자 이상이어야 합니다.");
		pw.focus();
		return false;
	} 
}
//Jquery
$(function(){
	$(".button").click(function(){
		let id = $("#id").val();
		let pw = $("#pw").val();
			if (id.length < 5) {
				alert("아이디를 5글자 이상 입력하세요.");
			} else {
				if (pw.length < 5) {
					alert("암호를 5글자 이상 입력하세요.");
				} else {
					//아이디하고 암호가 정확하게 입력되었습니다.
					let form = $("<form></form>");
					form.attr("method", "post");
					form.attr("action", "./login");
					form.append($("<input/>", {type:"hidden", name:"id", value:id}));
					form.append($("<input/>", {type:"hidden", name:"pw", value:pw}));
					form.appendTo("body");
					form.submit();
				}
			}
		});
	});
</script>
</head>
<body>
	<%@ include file="menu.jsp"%>
	<h1
		style="border-left: 15px solid #EF9A9A; padding: 0 10px 3px 10px; font-weight: bold;">로그인
		화면입니다.</h1>
	<div id="loginBox">
		<div>
			<img alt="surprise" src="./img/surprise.gif" height="100px";>
		</div>
		<div>
			<form action="./login" method="post" onsubmit="return check()"></form>
			<input type="text" name="id" id="id" placeholder="아이디"
				onchange="checkID()"> <input type="password" name="pw"
				id="pw" placeholder="비밀번호">
			<div id="search">
				<a href="">아이디 찾기 |</a> <a href="">비밀번호 찾기 |</a> <a href="./join">회원가입</a>
			</div>
			<button type="submit" class="button">로&nbsp;&nbsp;&nbsp;그&nbsp;&nbsp;&nbsp;인</button>
			<!-- <span id="msg"></span> -->
		</div>
		<!-- TEST -->
		<!-- TEST -->
</body>
</html>