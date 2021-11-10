<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../resources/css/member.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
		$(document).ready(function(){
			
			$(".bt_cancel").on("click", function(){
				location.href = "/";
			})
		
			$("#submit").on("click", function(){
				if($("#mem_pw").val()==""){
					alert("비밀번호를 입력해주세요.");
					$("#mem_pw").focus();
					return false;
				}
				if($("#mem_nick").val()==""){
					alert("닉네임을 입력해주세요.");
					$("#mem_nick").focus();
					return false;
				}
				if($("#mem_email").val()==""){
					alert("이메일을 입력해주세요.");
					$("#mem_email").focus();
					return false;
				}
				$("#modify").submit();
			});
		})
	</script>
<title>Membership Update</title>
</head>
<body>
	<form role="form" name="modify" id="modify" method="post">
		<div class="insert">
			<table>
				<caption>
					<h2>회원정보수정</h2>
				</caption>
				<tr>
					<td class="col1">아이디</td>
					<td class="col2">
						<input type="text" id="mem_id" name="mem_id" value="${member.mem_id }" readonly="readonly"> 
					</td>
				<tr>
					<td class="col1">비밀번호</td>
					<td class="col2">
						<input type="password" id="mem_pw" name="mem_pw" value="${member.mem_pw }" required>
					</td>
				</tr>
				<tr>
					<td class="col1">닉네임</td>
					<td class="col2">
						<input type="text" id="mem_nick" name="mem_nick" value="${member.mem_nick }" required>
					</td>
				</tr>
				<tr>
					<td class="col3">이메일</td>
					<td class="col4">
						<input type="email" id="mem_email" name="mem_email" value="${member.mem_email }" required>
					</td>
				</tr>
			</table>
			<div class="bt_wrap">
				<button type="submit" id="submit" class="bt_submit">수정</button>
				<button type="button" class="bt_cancel">취소</button>
			</div>
		</div>
	</form>
</body>
</html>