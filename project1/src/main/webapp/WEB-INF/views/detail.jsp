<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<script type="module"
	src="https://ryj9d86xjh.execute-api.ap-northeast-2.amazonaws.com/v1/api/fontstream/djs/?sid=gAAAAABktObTyz-ThGGFX4r37eibzD3bEsOwbCE1d8-Qn7DjepOaWDVkRVp8gho2iF2FLe50eehHgfqjOqQlFPNKuPaN-t_tdrnU6XO-4bhgzXsAfJ7_JAQeRJJeRflv0nWDpz6j6JzZW0AJ0Um3ZFTVrJuxQyoretDZprv9pxHT2A_IG-2aHV9SMByVydiXkyUr60DErWdcbgW7hY2StrLJwm4vuGIR4cRyIBEVAu66wYWQD83HG6Y-OtFy_dEyQINw30UzfzaO"
	charset="utf-8"></script>
<meta charset="UTF-8">
<title>Detail</title>
<link rel="stylesheet" href="./css/menu.css">
<link rel="stylesheet" href="./css/detail.css?ver=0.2">
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
	
	//댓글 삭제 버튼 만들기 = 반드시 로그인 하고, 자신의 글인지 확인하는 검사 구문 필요.
	//온클릭이니까 자바스크립트로 처리해야 함.
	function cdel(cno) {
		if (confirm("댓글을 삭제하시겠습니까?")) {
			location.href="./cdel?bno=${dto.bno}&cno="+cno;
		}
	}
	
	
	$(function(){
 		$(".commentBox").hide(); 
		$("#openComment").click(function(){
			$(".commentBox").show("slow");
			$("#openComment").remove();
		});
		
		//댓글 삭제 다른 방법
		$(".cdel").click(function(){
			if (confirm("댓글을 삭제하시겠습니까?")) {
			//alert("삭제합니다." + $(this).parent().css("color", "red")    );
			//alert("삭제합니다." + $(this).parent().siblings(".c_id").text()  );
			let cno = $(this).parent().siblings(".c_id").text();
			//location.href="./cdel?bno=${dto.bno }&cno="+cno;  jquery 로 삭제방법
			let cno_comments = $(this).parents(".comment").remove() //변수처리
			
			$.ajax({
				url: "./cdelR",
				type: "post",
				data: {bno: ${dto.bno}, cno : cno},
				dataType: "json", 
				success:function(data){
					//alert(data.result);
					if (data.result == 1) {
						cno_comments.remove(); //변수에 담긴 html 삭제
						//$(this).parent().parent().parent()
					} else {
						alert("통신에 문제가 발생했습니다. 다시 시도해주세요.")
					}
				},
				error:function(error){
					alert("에러가 발생했습니다.") + error
				}
			});
		}
	});
		//댓글 수정 버튼 만들기 = 반드시 로그인 하고, 자신의 글인지 확인하는 검사 구문 필요.
		//.cedit
		$(".cedit1").click(function() {
			//alert("!")
			// 변수만들기 bno, cno, content, 글쓰기 수정 html
			const bno = "${dto.bno}"; //jstl이 먼저 값을 넣어주고 이후에 string 처리 된다.
			const cno = $(this).parent().siblings(".c_id").text();
			let content = $(this).parents(".commentHead").siblings(".c_comment").text();
			let recommentBox = '<div class="recommentBox">';
			recommentBox += '<form action="./cedit" method="post">';
			recommentBox += '<textarea id="recommenttextarea" name="recomment" placeholder="댓글을 입력하세요">'+content+'</textarea>';
			recommentBox += '<input type="hidden" id="bno" name="bno" value="${dto.bno}">';
			recommentBox += '<input type="hidden" id="cno" name="cno" value="'+cno+'">';
			recommentBox += '<button type="submit" id="recomment">댓글 수정하기</button>';
			recommentBox += '</form>';
			recommentBox += '</div>';
			
			//alert(bno + "/" + cno + "/" + content);
			//내 위치 찾기
			let commentDIV = $(this).parents(".comment");
			//commentDIV.css("color", "red");
			commentDIV.after(recommentBox);
			commentDIV.remove();
			//수정, 삭제, 댓글창 열기 모두 삭제하기
			$(".cedit").remove();
			$(".cdel").remove();
			$("#openComment").remove();
			
		});
		
		//댓글 수정 다른 방법 ajax
		$(".cedit").click(function() {
			if (confirm("수정하시겠습니까?")) {
				//변수만들기 bno, cno, content, 글쓰기 수정 html
				const bno = "${dto.bno }";
				const cno = $(this).parent().siblings(".c_id").text();
				
				let commentDIV = $(this).parents(".comment");
				commentDIV.css("color", "red");
								
 				$.ajax({
					url: "./ceditR",
					type: "post",
					data: {bno: bno, cno : cno},
					dataType: "json", 
					success:function(data){
						if (data.result == 1) {
							let content = $(this).parents(".commentHead").siblings(".c_comment").text();
							let recommentBox = '<div class="recommentBox">';
							recommentBox += '<form action="./cedit" method="post">';
							recommentBox += '<textarea id="recommenttextarea" name="recomment" placeholder="댓글을 입력하세요">'+content+'</textarea>';
							recommentBox += '<input type="hidden" id="bno" name="bno" value="${dto.bno}">';
							recommentBox += '<input type="hidden" id="cno" name="cno" value="'+cno+'">';
							recommentBox += '<button type="submit" id="recomment">댓글 수정하기</button>';
							recommentBox += '</form>';
							recommentBox += '</div>';
							let commentDIV = $(this).parents(".comment");
							commentDIV.after(recommentBox);
							commentDIV.remove();
							//수정, 삭제, 댓글창 열기 모두 삭제하기
							$(".cedit").remove();
							$(".cdel").remove();
							$("#openComment").remove(); 
						
						} else {
							alert("통신에 문제가 발생했습니다. 다시 시도해주세요.")
						}
					},
					error:function(error){
						alert("에러가 발생했습니다.") + error
					}
				});
				
			}
			
		});
		
		
		
		
		//댓글쓰기 몇 글자 썼는지 확인하는 코드 2023-08-08 프레임우크 프로그래밍
		//keyup 텍스트 입력창 : #commenttextarea, 버튼: #comment
		$("#commenttextarea").keyup(function(){//키를 놓을 때 이벤트가 발생
			let text = $(this).val(); 
			if (text.length > 100) {//값의 길이를 뽑아서 text에 저장
				alert("100글자 초과입니다.");
				$(this).val(   text.substr(0,100)   ); 
			}
			$("#comment").text("글쓰기"+ text.length +"/100");
		});
	});
</script>
</head>
<body>
	<%@ include file="menu.jsp"%>
	<h1
		style="border-left: 15px solid #EF9A9A; padding: 0 10px 3px 10px; font-weight: bold;">${dto.m_name }님의
		게시글입니다.</h1>
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
		<div class="title">${dto.bno }/${dto.btitle }</div>


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
							<div class="comment">
								<div class="commentHead">
									<div class="c_name">${c.m_id }(${c.m_name })
										님
										<c:if
											test="${sessionScope.mid ne null && sessionScope.mid eq c.m_id}">
											<img alt="수정" src="./img/edit2.png" class="cedit" onclick="cedit()"> &nbsp;
											<form action=""></form>
											<img alt="삭제" src="./img/delete2.png" class="cdel"
												onclick="cdel1(${c.c_no})">
										</c:if>
									</div>
									<div class="c_date">${c.c_date}</div>
									<div class="c_id">${c.c_no}</div>
								</div> <!-- comentHead -->
								<div class="c_comment">${c.c_comment }</div>
							</div> <!-- comment -->
						</c:forEach>
					</div> <!-- comments -->
				</c:when>
				<c:otherwise>
					<div>
						<h2>댓글이 없어요</h2>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
		<c:if test="${sessionScope.mid ne null }">
			<button type="button" id="openComment">댓글창 열기</button><button class="button" onclick="location.href='./board'">게시판 돌아가기</button>
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