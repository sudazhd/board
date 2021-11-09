<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpServletRequest" import="javax.servlet.http.HttpServletResponse" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../resources/css/home.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		
		$("#bt_logout").on("click", function() {
			location.href = "member/logout";
		})
		
		$("#bt_update").on("click", function(){
			location.href="member/memberUpdate";
		})
		$("#bt_remove").on("click", function(){
			location.href="member/memberDelete";
		})
	})
</script>

<title>Index</title>
</head>
<body>
	<header>
		<a href="/"><img src="../resources/images/title.png"></a>
	</header>
	<nav>
		<c:if test="${member != null }">
				<p>${member.mem_id}님환영 합니다.</p>
			<div>
				<button id="bt_logout" class="bt_logout" type="button">로그아웃</button>
				<button id="bt_remove" class="bt_remove" type="button">회원탈퇴</button>
			</div>
		</c:if>
	</nav>
	<section>
		<div class="container">
			<c:if test="${member == null }">
				<div class="box" onclick="location.href='/member/login'" style="cursor: pointer">
					<img src="../resources/images/cherry_blossoms01.JPG">
					<span><img src="../resources/images/login.png"></span>
				</div>
			</c:if>
			<div class="box" onclick="location.href='/sboard/list'"
				style="cursor: pointer">
				<img src="../resources/images/juksung.JPG"> 
				<span><img src="../resources/images/epilogue.png"></span>
			</div>
			<c:if test="${member == null }">
			<div class="box" onclick="location.href='member/membership'" style="cursor: pointer">
				<img src="../resources/images/hr_beacon03.JPG"> 
				<span><img src="../resources/images/membership.png"></span>
			</div>
			</c:if>
			<c:if test="${member != null }">
				<div class="box" onclick="location.href='member/memberUpdate'" style="cursor: pointer">
				<img src="../resources/images/chunji.JPG"> 
				<span><img src="../resources/images/memberUpdate.png"></span>
			</div>
			</c:if>
		</div>
	</section>

	<footer>&copy; 2021.10 LJO All rights reserved</footer>
</body>
</html>