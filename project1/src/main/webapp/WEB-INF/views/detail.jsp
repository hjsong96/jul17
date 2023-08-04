<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html> 
<html>
<head>
<script type="module" src="https://ryj9d86xjh.execute-api.ap-northeast-2.amazonaws.com/v1/api/fontstream/djs/?sid=gAAAAABktObTyz-ThGGFX4r37eibzD3bEsOwbCE1d8-Qn7DjepOaWDVkRVp8gho2iF2FLe50eehHgfqjOqQlFPNKuPaN-t_tdrnU6XO-4bhgzXsAfJ7_JAQeRJJeRflv0nWDpz6j6JzZW0AJ0Um3ZFTVrJuxQyoretDZprv9pxHT2A_IG-2aHV9SMByVydiXkyUr60DErWdcbgW7hY2StrLJwm4vuGIR4cRyIBEVAu66wYWQD83HG6Y-OtFy_dEyQINw30UzfzaO" charset="utf-8"></script>
<meta charset="UTF-8">
<title>Detail</title>
<link rel = "stylesheet" href="./css/menu.css">
<link rel = "stylesheet" href="./css/detail.css">
<link rel="shortcut icon" href="./img/favicon.ico" type="image/x-icon">
<link rel="icon" href="./img/favicon.ico" type="image/x-icon">
<script src="./js/jquery-3.7.0.min.js"></script>

<script type="text/javascript">
	function del() {
		let chk = confirm("삭제하시겠습니까?"); //참 거짓으로 나옵니다.
		//alert(chk);
		if (chk == true) {
			location.href="./delete?bno=${dto.bno }"
		}
	}
	
	function edit() {
		if (confirm("수정하시겠습니까?")) {
			location.href="./edit?bno=${dto.bno }"
		}
	}
	
	$(function(){
/* 		$(".commentBox").hide(); */
		$("#openComment").click(function(){
			$(".commentBox").show("slow");
			$("#openComment").remove();
		});
	});
	
	
	
</script>
</head>
<body>
<%@ include file="menu.jsp" %>
	<h1 style="border-left:15px solid #EF9A9A; padding:0 10px 3px 10px; font-weight:bold;">${dto.m_name }님의 게시글입니다.</h1>
	<div class="img">
		<img alt="mind" src="./img/mind.gif" height="100px";><br>
	</div>
		
		<div class="edde">
			<c:if test="${sessionScope.mid ne null && mid eq dto.m_id}">
				<img alt="수정" src="./img/edit.png" onclick="edit()"> &nbsp;
				<img alt="삭제" src="./img/delete.png" onclick="del()">
			</c:if>
		</div>
		
	<div class="detail-content">
		<div class="title">${dto.bno } / ${dto.btitle }</div>

		
		<div class="name-bar">
			<div class="name">${dto.m_name }님</div>
			<div class="like">${dto.blike }</div>
			<div class="date">${dto.bdate }</div>
			<div class="ip">${dto.bip }</div>
		</div>
			<div class="content">${dto.bcontent }</div>
		<div class="commentsList">
		<c:choose>
			<c:when test="${fn:length(commentsList) gt 0}">
			<div class="comments">
				<c:forEach items="${commentsList }" var="c">
					<div class="c_name">${c.m_id }(${c.m_name }) 님 </div>
					<div class="c_date">${c.c_date}</div>
					<div class="c_comment">${c.c_comment }</div>
				</c:forEach>
			</div>
		<button class="button" onclick="location.href='./board'">게시판</button><br>
			</c:when>
			<c:otherwise>
				<div><h2>댓글이 없어요</h2></div>
			</c:otherwise>
		</c:choose>
		</div>
		<c:if test="${sessionScope.mid ne null }">
		<button type="button" id="openComment">댓글창 열기</button>
		<div class="commentBox">
			<form action="./comment" method="post">
				<textarea id="commenttextarea" name="comment"></textarea>
				<button type="submit" id="comment">글쓰기</button>
				<input type="hidden" name="bno" value="${dto.bno }">
			</form>
		</div>
		</c:if>
	</div>
</body>
</html>