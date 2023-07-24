<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="./css/menu.css">
	<nav>
		<div class="header">
			<div class ="left_menu" >
				<ul>
					<li onclick="link('')">메인</li>
					<li onclick="link('board')">게시판</li>
					<li onclick="link('board2')">게시판2</li>
					<li onclick="link('mooni')">문의사항</li>
					<li onclick="link('notice')">공지</li>
				</ul>
			</div>
			<div class ="right_menu" >
				<ul>
					<c:choose>
						<c:when test="${sessionScope.mname eq null}">
							<li onclick="link('login')"><img alt="login" src="./img/login3.png"></li> 
						</c:when>
						<c:otherwise>
							<li onclick="link('myInfo')">${sessionScope.mid }(${sessionScope.mname })님</li>
							<li onclick="link('logout')"><img alt="login" src="./img/unlock2.png"></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</div>
	</nav>
	<!-- <div style="heightL=:50px; width: 100%;"></div> -->
	<script>
	function link(url) {
			location.href="./"+url;
	}
	</script>
	
</body>
</html>