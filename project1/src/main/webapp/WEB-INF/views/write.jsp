<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="module" src="https://ryj9d86xjh.execute-api.ap-northeast-2.amazonaws.com/v1/api/fontstream/djs/?sid=gAAAAABktObTyz-ThGGFX4r37eibzD3bEsOwbCE1d8-Qn7DjepOaWDVkRVp8gho2iF2FLe50eehHgfqjOqQlFPNKuPaN-t_tdrnU6XO-4bhgzXsAfJ7_JAQeRJJeRflv0nWDpz6j6JzZW0AJ0Um3ZFTVrJuxQyoretDZprv9pxHT2A_IG-2aHV9SMByVydiXkyUr60DErWdcbgW7hY2StrLJwm4vuGIR4cRyIBEVAu66wYWQD83HG6Y-OtFy_dEyQINw30UzfzaO" charset="utf-8"></script>
<meta charset="UTF-8">
<title>Write</title>
<link rel = "stylesheet" href="./css/write.css">
</head>
<body>
	<h1 style="border-left:15px solid #EF9A9A; padding:0 10px 3px 10px;font-weight:bold;">글쓰기 화면입니다.</h1>
	<div class="img">
		<img alt="mind" src="./img/mind.gif" height="100px";>
	</div>
	<div class="writeDiv"> 
		<form action="./write" method="post">
		<input type="text" name="title" placeholder="제목을 입력하세요." maxlength="30">
		<textarea name="content"></textarea>
		<button class="button" onclick="location.href='./board'">저장하기</button>
		</form>
	</div>
</body>
</html>