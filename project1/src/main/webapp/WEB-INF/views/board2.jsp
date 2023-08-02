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
<link rel="stylesheet" href="./css/board.css">
<script src="./js/jquery-3.7.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		//보드 내용 가져오기
		var lists = [];
		$.ajax({
			url : "./boardList2",
			type : "get",
			data: {"pageNo" : 1},
			dataType: "json",
			success: function(data) {
				//alert("정상입니다. : " + data);
			},
			error: function(error) {
				//alert("에러가 발생했습니다. : " + error);
			}
		});
		
		
		const list = [{bno:1, btitle: '제목입니다', m_name : '홍길동', bdate: '2023-08-02', blike: 15},{bno:1, btitle: '제목입니다', m_name : '홍길동', bdate: '2023-08-02', blike: 15},{bno:1, btitle: '제목입니다', m_name : '홍길동', bdate: '2023-08-02', blike: 15},{bno:1, btitle: '제목입니다', m_name : '홍길동', bdate: '2023-08-02', blike: 15},{bno:1, btitle: '제목입니다', m_name : '홍길동', bdate: '2023-08-02', blike: 15},{bno:1, btitle: '제목입니다', m_name : '홍길동', bdate: '2023-08-02', blike: 15},{bno:1, btitle: '제목입니다', m_name : '홍길동', bdate: '2023-08-02', blike: 15},{bno:1, btitle: '제목입니다', m_name : '홍길동', bdate: '2023-08-02', blike: 15},{bno:1, btitle: '제목입니다', m_name : '홍길동', bdate: '2023-08-02', blike: 15},{bno:1, btitle: '제목입니다', m_name : '홍길동', bdate: '2023-08-02', blike: 15}]; 
		//alert(list)
		//alert(list.length);
		//alert(list[0].btitle);
		
		for (let i = 0; i < list.length; i++) {
			$(".tableHead").append("<tr><td>"+list[i].bno+"</td><td>"+list[i].btitle+"</td><td>"+list[i].m_name+"</td><td>"+list[i].bdate+"</td><td>"+list[i].blike+"</td></tr>");
		}
	});
</script>
</head>
<body>
<%@ include file="menu.jsp" %>
	<h1 style="border-left:15px solid #EF9A9A; padding:0 10px 3px 10px;font-weight:bold;">게시판2 화면입니다.</h1>
		<img alt="surprise" src="./img/surprise.gif" height="100px";>
	<table class="tableHead">
		<tr>
			<td>번호</td>
			<td>제목</td>
			<td>글쓴이</td>
			<td>날짜</td>
			<td>읽음</td>
		</tr>
	</table>
</body>
</html>