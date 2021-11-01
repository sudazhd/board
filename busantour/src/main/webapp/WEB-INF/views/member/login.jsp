<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../resources/css/login.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>Log In</title>
</head>
<body>
    <form role="form" class="box" action="home" method="post">
        <h1>로그인</h1>
        <input type="text" name="mem_id" placeholder="아이디">
        <input type="password" name="mem_pw" placeholder="비밀번호">
        <input type="submit" value="로그인" class="bt_login">
    </form>
    
</body>
<script>
	$(document).ready(function() {

		var formObj = $("form[role='form']");
		var httpMethod = $("#requestMethod");

		console.log(formObj);

		$(".bt_login").on("click", function() {
			formObj.attr("method", "get");
			formObj.attr("action", "/sboard/list");
			formObj.submit();
		});
	});
</script>
</html>