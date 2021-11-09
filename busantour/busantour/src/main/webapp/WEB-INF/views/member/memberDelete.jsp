<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
			
			$(".bt_submit").on("click", function(){
				if($("#mem_pw").val()==""){
					alert("비밀번호를 입력해주세요.");
					$("#mem_pw").focus();
					return false;
				}
				$.ajax({
					url : "/member/pw_chk",
					type : "POST",
					dataType : "json",
					data : $("#delForm").serializeArray(),
					success: function(data){
						
						if(data==0){
							alert("패스워드가 틀렸습니다.");
							return;
						}else{
							if(confirm("회원탈퇴하시겠습니까?")){
								$("#delForm").submit();
							}
						}
					}
				})
		})
	</script>
<title>Member Delete</title>
</head>
<body>
	<form role="form" id="delForm" action="/member/memberDelete" method="post">
		<div class="insert">
			<table>
				<caption>
					<h2>회원탈퇴</h2>
				</caption>
				<tr>
					<td class="col1">아이디</td>
					<td class="col2">
						<input type="text" id="mem_id" name="mem_id" value="${member.mem_id }" readonly="readonly">
					</td>
				<tr>
					<td class="col1">비밀번호</td>
					<td class="col2">
						<input type="password" id="mem_pw" name="mem_pw" value="" required>
					</td>
				</tr>
				<tr>
					<td class="col1">닉네임</td>
					<td class="col2">
						<input type="text" id="mem_nick" name="mem_nick" value="${member.mem_nick }" readonly="readonly">
					</td>
				</tr>
				<tr>
					<td class="col3">이메일</td>
					<td class="col4">
						<input type="email" id="mem_email" name="mem_email" value="${member.mem_email }" readonly="readonly">
					</td>
				</tr>
			</table>
			<div class="bt_wrap">
				<button type="submit" class="bt_submit">회원탈퇴</button>
				<button type="button" class="bt_cancel">취소</button>
			</div>
		</div>
	</form>
	<div>
		<c:if test="${msg == false}">
					비밀번호가 맞지 않습니다.
				</c:if>
	</div>
</body>
</html>