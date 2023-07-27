<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>
</head>
<body>
		아이디(input text)
		비밀번호(input text)
		비밀번호 확인(input text)
		이름(input text)
		주소(input text)
		mbti(드롭다운)
		생년월일(input 달력)
	<div>
		<div>
			<div>
				<input type="text" name="id" id="id" placeholder="아이디">
			</div>
			<div>
				<input type="text" name="pw" id="pw" placeholder="비밀번호">
			</div>
			<div>
				<input type="text" name="pwCheck" id="pwCheck" placeholder="비밀번호 재확인" >
			</div>
		</div>
		<div>
			<div>
				<input type="text" name="name" id="name" placeholder="이름">
			</div>
			<div>
				<input type="text" name="address" id="address" placeholder="주소">
			</div>		
			<div>
				<input type="text" name="mbti" id="mbti" placeholder="mbti">
			</div>
			<div>
				<input type="date" name="date" id="date" placeholder="생년월일">
			</div>	
		</div>
		<div>
			<button type="submit" >가&nbsp;입&nbsp;하&nbsp;기</button>
		</div>
	</div>
</body>
</html>