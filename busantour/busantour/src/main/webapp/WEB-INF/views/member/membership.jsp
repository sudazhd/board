<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Membership</title>
<link rel="stylesheet" href="../resources/css/member.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
		$(document).ready(function(){
			$(".bt_cancel").on("click", function(){
				location.href = "/";
			})
			
			$("#submit").on("click", function(){
				if($("#mem_id").val()==""){
					alert("아이디를 입력해주세요.");
					$("#mem_id").focus();
					return false;
				}
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
				var id_chkVal = $("#id_chk").val();
				if(id_chkVal == "N"){
					alert("중복확인 버튼을 눌러주세요.");
				}else if(idChkVal == "Y"){
					$("#membership").submit();
				}
			});
		})
		
		function fn_id_chk(){
			$.ajax({
				url : "/member/id_chk",
				type : "post",
				dataType : "json",
				data : {"mem_id" : $("#mem_id").val()},
				success : function(data){
					if(data == 1){
						alert("중복된 아이디입니다.");
					} else if(data == 0){
						$("#id_chk").attr("value", "Y");
						alert("사용가능한 아이디입니다.");
					}
				}
			})
		}
		
		function fn_pw_chk(){
			if(document.getElementById("mem_pw").value != document.getElementById("mem_pw_ck").value){
				alert("패스워드가 다릅니다.");
			} else {
				alert("패스워드가 일치합니다.");
			}
		}
		
	</script>
</head>
<body>

	<form role="form" name="membership" action="membership" method="post">
		<div class="insert">
			<table>
				<caption>
					<h2>회원가입</h2>
				</caption>
				<tr>
					<td class="col1">아이디</td>
					<td class="col2">
						<input type="text" id="mem_id" name="mem_id" placeholder="아이디" required autofocus> 
						<input type="button" class="id_chk" name="id_chk" value="아이디 중복체크" onclick="fn_id_chk()">
					</td>
				<tr>
					<td class="col1">비밀번호</td>
					<td class="col2">
						<input type="password" id="mem_pw" name="mem_pw" placeholder="비밀번호" required>
					</td>
				</tr>
				<tr>
					<td class="col1">비밀번호 확인</td>
					<td class="col2">
						<input type="password" id="mem_pw_ck" placeholder="비밀번호 확인" required>
						<input type="button" class="pw_chk" name="pw_chk" value="비밀번호 확인" onclick="fn_pw_chk()">
						<p>비밀번호는 8자리 이상이어야 하며 영문과 숫자, 특수문자를 반드시 포함해야 합니다.</p>
					</td>
				</tr>
				<tr>
					<td class="col1">닉네임</td>
					<td class="col2">
						<input type="text" id="mem_nick" name="mem_nick" placeholder="닉네임" required>
					</td>
				</tr>
				<tr>
					<td class="col3">이메일</td>
					<td class="col4">
						<input type="email" id="mem_email" name="mem_email" placeholder="이메일" required>
					</td>
				</tr>
			</table>
			<div class="bt_wrap">
				<button type="submit" id="submit" class="bt_submit">등록</button>
				<button type="button" class="bt_cancel">취소</button>
			</div>
		</div>
	</form>
</body>

</html>