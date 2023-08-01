<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="module" src="https://ryj9d86xjh.execute-api.ap-northeast-2.amazonaws.com/v1/api/fontstream/djs/?sid=gAAAAABktObTyz-ThGGFX4r37eibzD3bEsOwbCE1d8-Qn7DjepOaWDVkRVp8gho2iF2FLe50eehHgfqjOqQlFPNKuPaN-t_tdrnU6XO-4bhgzXsAfJ7_JAQeRJJeRflv0nWDpz6j6JzZW0AJ0Um3ZFTVrJuxQyoretDZprv9pxHT2A_IG-2aHV9SMByVydiXkyUr60DErWdcbgW7hY2StrLJwm4vuGIR4cRyIBEVAu66wYWQD83HG6Y-OtFy_dEyQINw30UzfzaO" charset="utf-8"></script>
<meta charset="UTF-8">
<title>Register</title>
<link rel="stylesheet" href="./css/menu.css">
<link rel="stylesheet" href="./css/join.css">
<script src="./js/jquery-3.7.0.min.js"></script>
<script type="text/javascript">
$(function() {
	$("#idCheck").click(function(){
		let id = $("#id").val();
		if (id == "" || id.length < 5 ) {
			//alert("5글자 이상이어야 합니다.")
			$("#resultMSG").text("아이디는 5글자 이상이어야 합니다.");
			$("#resultMSG").css("color", "red");
			$("#id").focus();
		} else {
			$.ajax({
				url:"./checkID",  //나 어디로 
				type:"post",    // 무슨 타입으로
				data: {"id": id}, //이름은 id, 뒤는 실제 값   -> checkID?id=hadine
				dataType: "html", //되돌아오는 타입은 어떤 타입으로 되돌아올거야?
				success: function(data){
					$("#resultMSG").text("data : " + data);
				}, //성공했을 때
				error: function(request, status, error){
					$("#resultMSG").text("error : " + error);
					console.log(status);
				} //실패했을 때
			});
			
			//$("#resultMSG").text("사용 가능한 아이디 입니다.");
			//$("#resultMSG").css("color", "green");
		}
		return false
	});
});


</script>



</head>
<body>
	<%@ include file="menu.jsp"%>
	<h1 style="border-left:15px solid #EF9A9A; padding:0 10px 3px 10px;font-weight:bold;">회원가입 화면입니다.</h1>
	<form action="./join" method="post">
	<div class="all-area">
		<div class="top-area">
			<h1>MALLANG WORLD</h1>
			<img class="eat" alt="eat" src="./img/eat.gif" height="100px";>
		</div>
		<div class="topbox-area">
			<div class="id-area">
				<input type="text" name="id" id="id" placeholder="아이디">
				<button id="idCheck">중복검사</button><br>
				<span id="resultMSG"></span>
			</div>
			<div class="pw-area">
				<input type="password" name="pw" id="pw" placeholder="비밀번호">
			</div>
			<div class="pwCheck-area">
				<input type="password" name="pwCheck" id="pwCheck" placeholder="비밀번호 재확인" >
			</div>
		</div>
		<div class="middlebox-area">
			<div class="name-area">
				<input type="text" name="name" id="name" placeholder="이름">
			</div>
			<div class="address-area">
				<input type="text" name="address" id="address" placeholder="주소">
			</div>		
			<div class="mbti-area">
				<!-- <label for="lang">mbti</label><br> -->
				  	<select name="mbti" id="mbti">
					    <option value="choose">mbti를 선택하세요</option>
					    <optgroup label="내향형">
					    <option value="ISTJ">ISTJ</option>
					    <option value="ISFJ">ISFJ</option>
					    <option value="INFJ">INFJ</option>
					    <option value="INTJ">INTJ</option>
					    <option value="ISTP">ISTP</option>
					    <option value="ISFP">ISFP</option>
					    <option value="INFP">INFP</option>
					    <option value="INTP">INTP</option>
					    </optgroup>
					    <optgroup label="외향형">
					    <option value="ESTP">ESTP</option>
					    <option value="ESFP">ESFP</option>
					    <option value="ENFP">ENFP</option>
					    <option value="ENTP">ENTP</option>
					    <option value="ESTJ">ESTJ</option>
					    <option value="ESFJ">ESFJ</option>
					    <option value="ENFJ">ENFJ</option>
					    <option value="ENTJ">ENTJ</option>
					    </optgroup>
				 	 </select>
			</div>
			<div class="birth-area">
				<input type="date" name="birth" id="birth" placeholder="생년월일">
			</div>	
			<div class="gender-area">
			     <input type="radio" id="f" value ="0" name="gender"><label for="f">여성</label>
			     <input type="radio" id="m" value ="1" name="gender"><label for="m">남성</label>
			</div>	
		</div>
		<div class="bottombox-area">
			<button type="submit" >가&nbsp;입&nbsp;하&nbsp;기</button><br>
			<button type="reset">취&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;소</button>
		</div>
	</div>
	</form>
</body>
</html>