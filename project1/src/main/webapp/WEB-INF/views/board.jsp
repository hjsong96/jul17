<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script type="module" src="https://ryj9d86xjh.execute-api.ap-northeast-2.amazonaws.com/v1/api/fontstream/djs/?sid=gAAAAABktObTyz-ThGGFX4r37eibzD3bEsOwbCE1d8-Qn7DjepOaWDVkRVp8gho2iF2FLe50eehHgfqjOqQlFPNKuPaN-t_tdrnU6XO-4bhgzXsAfJ7_JAQeRJJeRflv0nWDpz6j6JzZW0AJ0Um3ZFTVrJuxQyoretDZprv9pxHT2A_IG-2aHV9SMByVydiXkyUr60DErWdcbgW7hY2StrLJwm4vuGIR4cRyIBEVAu66wYWQD83HG6Y-OtFy_dEyQINw30UzfzaO" charset="utf-8"></script>
<meta charset="UTF-8">
<title>Board</title>
<link rel = "stylesheet" href="./css/board.css">
</head>
<body>
	<h1 style="border-left:15px solid #EF9A9A; padding:0 10px 3px 10px;font-weight:bold;">Board 화면입니다.</h1>
	<div>
	<img alt="heart" src="./img/heart.gif" height="100px";>
	</div>
	<button class="button" onclick="location.href='./index'">메인화면</button>
	<table>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>글쓴이</th>
			<th>날짜</th>
			<th>좋아요</th>
		</tr>
		<c:forEach items="${list }" var="row">
			<!-- onclick 자바스크립트 페이지 이동, ?파라미터=값  -->
			<tr onclick="location.href='./detail?bno=${row.bno }'">
				<td>${row.bno }</td>
				<td class="title">${row.btitle }</td>
				<td>${row.bwrite }</td>
				<td>${row.bdate }</td>
				<td>${row.blike }</td>
			</tr>
		</c:forEach>
	</table>
	<button class="button" onclick="location.href='./write'">글쓰기</button>
	
</body>
</html>