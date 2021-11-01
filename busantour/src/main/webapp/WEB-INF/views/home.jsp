<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
header {
	text-align: center;
}

.mem {
	text-align: center;
}

.container {
	display: flex;
	width: 100%;
	padding: 4% 2%;
	box-sizing: border-box;
	height: 100vh;
}

.box {
	flex: 1;
	overflow: hidden;
	transition: 1s;
	margin: 0 2%;
	box-shadow: 0 20px 30px rgba(0, 0, 0, .1);
	line-height: 0;
}

.box>img {
	width: 150%;
	height: calc(100% - 10vh);
	object-fit: cover;
	transition: 1s;
}

.box>span {
	font-size: 3.8vh;
	display: block;
	text-align: center;
	height: 7vh;
	line-height: 2.6;
}

.box:hover {
	flex: 1 1 40%;
}

.box:hover>img {
	width: 100%;
	height: 100%;
}

footer {
	text-align: center;
}
</style>
<title>Index</title>
</head>
<body>
	<header>
		<a href="/"><img src="../resources/images/title.png"></a>
	</header>
	<section>
		<div class="container">
			<div class="box" onclick="location.href='/member/login'"
				style="cursor: pointer">
				<img src="../resources/images/cherry_blossoms01.JPG"> <span><img
					src="../resources/images/login.png"></span>
			</div>
			<div class="box" onclick="location.href='/sboard/list'"
				style="cursor: pointer">
				<img src="../resources/images/juksung.JPG"> <span><img
					src="../resources/images/epilogue.png"></span>
			</div>
			<div class="box" onclick="location.href='member/membership'"
				style="cursor: pointer">
				<img src="../resources/images/hr_beacon03.JPG"> <span><img
					src="../resources/images/membership.png"></span>
			</div>
		</div>
	</section>

	<footer>&copy; 2021.10 LJO All rights reserved</footer>
</body>
</html>