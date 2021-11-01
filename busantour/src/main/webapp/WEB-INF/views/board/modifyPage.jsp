<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Modify Page</title>
</head>
<body>
	<div class="board_wrap">
		<div class="board_title">
			<strong>공지사항</strong>
			<p>공지사항 안내드립니다.</p>
		</div>
		<div class="board_list_wrap">
			<div class="board_view">
				<div class="title">
					<input type="text" name="ep_title" value="${epilogueVO.ep_title}">
				</div>
				<div class="info">
					<dl>
						<dt>번호</dt>
						<dd>
							<input type="text" name="ep_no" value="${epilogueVO.ep_no}"
								readonly="readonly">
						</dd>
					</dl>
					<dl>
						<dt>글쓴이</dt>
						<dd>
							<input type="text" name="ep_writer"
								value="${epilogueVO.ep_writer}" readonly="readonly">
						</dd>
					</dl>

				</div>
				<div class="cont">
					<textarea name="ep_content" rows="3">${epilogueVO.ep_content}</textarea>
				</div>
			</div>
			<div class="bt_wrap">
				<button type="submit" class="btn btn-primary">저장</button>
				<button type="submit" class="btn btn-warning">취소</button>
			</div>
		</div>
	</div>
	﻿
	<script>
		$(document)
				.ready(
						function() {

							var formObj = $("form[role='form']");

							console.log(formObj);

							$(".btn-warning")
									.on(
											"click",
											function() {
												self.location = "/board/listPage?page=${cri.page}&perPageNum=${cri.perPageNum}";
											});

							$(".btn-primary").on("click", function() {
								formObj.submit();
							});

						});
	</script>

</body>
</html>