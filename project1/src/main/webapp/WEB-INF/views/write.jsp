<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="module" src="https://ryj9d86xjh.execute-api.ap-northeast-2.amazonaws.com/v1/api/fontstream/djs/?sid=gAAAAABktObTyz-ThGGFX4r37eibzD3bEsOwbCE1d8-Qn7DjepOaWDVkRVp8gho2iF2FLe50eehHgfqjOqQlFPNKuPaN-t_tdrnU6XO-4bhgzXsAfJ7_JAQeRJJeRflv0nWDpz6j6JzZW0AJ0Um3ZFTVrJuxQyoretDZprv9pxHT2A_IG-2aHV9SMByVydiXkyUr60DErWdcbgW7hY2StrLJwm4vuGIR4cRyIBEVAu66wYWQD83HG6Y-OtFy_dEyQINw30UzfzaO" charset="utf-8"></script>
<meta charset="UTF-8">
<title>Write</title>
<link rel="stylesheet" href="./css/menu.css">
<link rel="stylesheet" href="./css/write.css">
<link rel="shortcut icon" href="./img/favicon.ico" type="image/x-icon">
<link rel="icon" href="./img/favicon.ico" type="image/x-icon">

<!-- include libraries(jQuery, bootstrap) -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

</head>
<body>
<%@ include file="menu.jsp" %>
	<h1 style="border-left:15px solid #EF9A9A; padding:0 10px 3px 10px; font-weight:bold; font-family: Sandoll Studywithme;">Board 화면입니다.</h1>
	<div class="img">
		<img alt="mind" src="./img/mind.gif" height="100px";>
	</div>
	<div class="writeDiv">
		<form action="./write" method="post">
			<input type="text" name="title" placeholder="제목을 입력하세요."
				maxlength="30">
			<textarea name="content" id="summernote"></textarea>
			<button class="button" type="submit" onclick="location.href='./board'">저장하기</button>
			<!-- type="submit" => 제출버튼. 폼데이터로 데이터 전송 -->
		</form>
	</div>
	<script type="text/javascript">
	/* JQuery 문법 : 문서가 모두 로딩되었다면, 익명함수를 실행하세요. */
	/* textarea에 서머노트를 실행해주세요. */
			$(document).ready(function() {
			  $('#summernote').summernote({
				height: 450  
				  });
			});
	</script>
</body>
</html>