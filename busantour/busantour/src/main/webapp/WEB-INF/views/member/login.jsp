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
	<form role="form" class="box" method="post" name="login">
		<h1>로그인</h1>
		<input type="text" name="mem_id" id="mem_id" placeholder="아이디">
		<input type="password" name="mem_pw" id="mem_pw" placeholder="비밀번호">
		<input type="button" value="로그인" class="bt_login">
	</form>
</body>
<script>
	$(document).ready(function() {

		var formObj = $("form[role='form']");
		var httpMethod = $("#requestMethod");

		console.log(formObj);

		$(".bt_login").on("click", function() {
			if ($("#mem_id").val() == "") {
				alert("아이디를 입력해주세요.");
				$("#mem_id").focus();
				return false;
			} else {
				$.ajax({
					url : "/member/id_chk",
					type : "post",
					dataType : "json",
					data : {
						"mem_id" : $("#mem_id").val()
					},
					success : function(data) {
						if (data == 0) {
							alert("일치하는 아이디가 없습니다.");
						}
					}
				})
			}

			if ($("#mem_pw").val() == "") {
				alert("비밀번호를 입력해주세요.");
				$("#mem_pw").focus();
				return false;
			} else {
				$.ajax({
					url : "/member/pw_chk",
					type : "post",
					dataType : "json",
					data : {
						"mem_id" : $("#mem_id").val(),
						"mem_pw" : $("#mem_pw").val()
					},
					success : function(data) {
						if (data == 0) {
							alert("비밀번호가 일치하지 않습니다.");
						} else{
							formObj.attr("method", "post");
							formObj.attr("action", "/member/login");
							formObj.submit();
						}
					}
				})
			}
		});
	});
</script>
</html>