<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="module"
	src="https://ryj9d86xjh.execute-api.ap-northeast-2.amazonaws.com/v1/api/fontstream/djs/?sid=gAAAAABktObTyz-ThGGFX4r37eibzD3bEsOwbCE1d8-Qn7DjepOaWDVkRVp8gho2iF2FLe50eehHgfqjOqQlFPNKuPaN-t_tdrnU6XO-4bhgzXsAfJ7_JAQeRJJeRflv0nWDpz6j6JzZW0AJ0Um3ZFTVrJuxQyoretDZprv9pxHT2A_IG-2aHV9SMByVydiXkyUr60DErWdcbgW7hY2StrLJwm4vuGIR4cRyIBEVAu66wYWQD83HG6Y-OtFy_dEyQINw30UzfzaO"
	charset="utf-8"></script>
<meta charset="UTF-8">
<title>Index</title>
<link rel="stylesheet" href="./css/menu.css">
<link rel="shortcut icon" href="./img/favicon.ico" type="image/x-icon">
<link rel="icon" href="./img/favicon.ico" type="image/x-icon">
<link rel="stylesheet" href="./css/board.css">
<script src="./js/jquery-3.7.0.min.js"></script>
<script type="text/javascript">
	$(function() {
		//var list = [];//보드 내용 가져오기
		let totalCount = 0;
		let pageNo = 1;
		//ajax 호출
		ajax_call(1);
		function ajax_call(pageNo) {
			//alert(pageNo);
			$.ajax({
				url : "./boardList2", //http://localhost/boardList2?pageNo=1
				type : "get",
				data : {"pageNo" : pageNo},
				dataType : "json",
				success : function(data) {
					//alert("정상입니다. : " + data.list[0].btitle);
					totalCount = data.totalCount;
					pageNo =data.pageNo;
					let startPage = pageNo;
					let endPage = pageNo + 9;
					console.log(totalCount);
					let list = data.list;
					$(".tableHead").empty();//지워지나요?
					$(".paging").empty();
					//console.log(lists);
					//for each 문
					let html = "";
					$.each(list, function(index){
						html += "<tr>";
						html += "<td>" + list[index].bno + "</td>";
						html += "<td>" + list[index].btitle + "</td>";
						html += "<td>" + list[index].m_name + "</td>";
						html += "<td>" + list[index].bdate + "</td>";
						html += "<td>" + list[index].blike + "</td>";
						html += "</tr>";
					});
					$(".tableHead").append(html);
					
					//for문을 여기로
					/* 
			
					for (let i = 0; i < list.length; i++) {
						$(".tableHead").append(
								"<tr><td>" + list[i].bno + "</td><td>"
										+ list[i].btitle + "</td><td>"
										+ list[i].m_name + "</td><td>"
										+ list[i].bdate + "</td><td>"
										+ list[i].blike + "</td></tr>");
					} */
					//페이징하기
					//$(".paging").text(data.pageNo + ":" + data.totalCount); //현재 내 페이지는
					let pages = totalCount / 10; //내가 보여줄 전체 페이지수 
					//totalCount 나누기 10 했을때 나머지가 있으면 pages + 1 해주세요
					if(totalCount % 10 != 0){pages += 1;}
					startPage = pageNo;
					endPage = startPage + 10 < pages ? startPage + 9 : pages;
					
					//   <<  <  1 2 3 4 5 6 7 8 9 10 > >>
					if(pageNo - 10 > 0){
						$(".paging").append("<button class='start'>◀◀</button>");
					}else{
						$(".paging").append("<button disabled='disabled'>◀◀</button>");
					}
					if(pageNo - 1 > 0){
						$(".paging").append("<button class='backward'>◀</button>");
					}else{
						$(".paging").append("<button disabled='disabled'>◀</button>");
					}
					for (let i=startPage; i <= endPage; i++) {
						$(".paging").append("<button type='button' class='page'>" + i + "</button>");
					}
					if(pageNo + 1 < pages){						
						$(".paging").append("<button class='forward'>▶</button>");
					}else{
						$(".paging").append("<button disabled='disabled'>▶</button>");
					}
					if(pageNo + 10 < pages){
						$(".paging").append("<button class='end'>▶▶</button>");
					}else{
						$(".paging").append("<button disabled='disabled'>▶▶</button>");
					}
				},
				error : function(error) {
					alert("에러가 발생했습니다. : " + error);
				}
			});//ajax end
		}//ajax_call
		
		//on 은 동적으로 동작할 떄 사용해준다. append 가 동적으로 생성되었기 때문이다. {
		$(document).on("click", ".page", function() {//동적으로 생성된 버튼 클릭하기
			let pageNo = $(this).text(); //this 는 내가 클릭한 것에 대해서 가져오기
			//alert(pageNo);
			ajax_call(pageNo);
		});

		$(document).on("click", ".start", function(){
			pageNo = pageNo - 10;
			ajax_call(pageNo);
		});
		$(document).on("click", ".backward", function(){
			pageNo = pageNo - 1;
			ajax_call(pageNo);
		});
		$(document).on("click", ".forward", function(){
			pageNo = pageNo + 1;
			ajax_call(pageNo);
		});
		$(document).on("click", ".end", function(){
			pageNo = pageNo + 10;
			ajax_call(pageNo);
		});
		
	});
	
</script>
</head>
<body>
	<%@ include file="menu.jsp"%>
	<h1
		style="border-left: 15px solid #EF9A9A; padding: 0 10px 3px 10px; font-weight: bold;">게시판2
		화면입니다.</h1>
	<img alt="surprise" src="./img/surprise.gif" height="100px";>
	<table>
		<thead>
			<tr>
				<td>번호</td>
				<td>제목</td>
				<td>글쓴이</td>
				<td>날짜</td>
				<td>읽음</td>
			</tr>
		</thead>
		<tbody class="tableHead"></tbody>
	</table>
	<div class="paging"></div>
</body>
</html>