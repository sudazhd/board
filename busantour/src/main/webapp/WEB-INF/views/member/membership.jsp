<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../resources/css/member.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>Membership</title>
</head>
<body>
	<form role="form" action="membership" method="post">
		<div class="insert">
			<table>
				<caption>
					<h2>회원가입</h2>
				</caption>
				<tr>
					<td class="col1">아이디</td>
					<td class="col2"><input type="text" id="mem_id" name="mem_id"
						placeholder="아이디" required autofocus> <input type="button"
						class="bt_id_ck" value="아이디 중복체크"></td>
				<tr>
					<td class="col1">비밀번호</td>
					<td class="col2"><input type="password" id="mem_pw"
						name="mem_pw" placeholder="비밀번호" required></td>
				</tr>
				<tr>
					<td class="col1">비밀번호 확인</td>
					<td class="col2"><input type="password" id="mem_pw_ck"
						placeholder="비밀번호 확인" required> <input type="button"
						class="bt_pw_ck" value="비밀번호 확인">
						<p>비밀번호는 8자리 이상이어야 하며 영문과 숫자, 특수문자를 반드시 포함해야 합니다.</p></td>
				</tr>
				<tr>
					<td class="col1">닉네임</td>
					<td class="col2"><input type="text" id="mem_nick"
						name="mem_nick" placeholder="닉네임" required></td>
				</tr>
				<tr>
					<td class="col3">이메일</td>
					<td class="col4"><input type="email" id="mem_email"
						name="mem_email" placeholder="이메일" required></td>
				</tr>
			</table>
			<div class="bt_wrap">
				<button type="submit" class="bt_submit">등록</button>
				<a href="/" class="bt_cancel">취소</a>
			</div>
		</div>
	</form>
</body>

</html>