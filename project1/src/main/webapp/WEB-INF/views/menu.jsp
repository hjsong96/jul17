<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<nav>
		<ul>
			<li onclick="link('')">메인</li>
			<li onclick="link('board')">게시판</li>
			<li onclick="link('board2')">게시판2</li>
			<li onclick="link('mooni')">문의사항</li>
			<li onclick="link('notice')">공지</li>
			<li onclick="link('login')" style="float: right; margin-top: 10px;"><img alt="login" src="./img/login.png"></li>
		</ul>
	</nav>
	<!-- <div style="heightL=:50px; width: 100%;"></div> -->
	<script>
	function link(url) {
			location.href="./"+url;
	}
	</script>
	
</body>
</html>