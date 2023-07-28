<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Members</title>
<link rel="stylesheet" href="./css/menu.css">
</head>
<body>
	<%@ include file="menu.jsp"%>
	<div>
	<h1>회원게시판</h1>
	<%-- ${list } --%>
	<c:forEach items="${list }" var="m">
		${m.no } / ${m.id } / ${m.name } / ${m.birth } / ${m.mbti } / ${m.gender } <br>
	</c:forEach>
	
	</div>





</body>
</html>