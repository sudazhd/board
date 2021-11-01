<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Modify Page</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link href="../resources/css/css.css" rel="stylesheet" type="text/css">
</head>
<body>
	<form role="form" method="post">

		<input type="hidden" name="page" value="${cri.page }"> <input
			type="hidden" name="perPageNum" value="${cri.perPageNum }"> <input
			type="hidden" name="searchType" value="${cri.searchType }"> <input
			type="hidden" name="keyword" value="${cri.keyword }">

		<div class="board_wrap">
			<div class="board_title">
				<strong>여행 후기</strong>
				<p>여행 후기</p>
			</div>
			<div class="board_list_wrap">
				<div class="board_write">
					<div class="title">
						<dl>
							<dt>제목</dt>
							<dd>
								<input type="text" name="ep_title"
									value="${epilogueVO.ep_title}">
							</dd>
						</dl>
					</div>
					<div class="info">
						<dl>
							<dt>글쓴이</dt>
							<dd>
								<input type="text" name="ep_writer"
									value="${epilogueVO.ep_writer}">
							</dd>
						</dl>
					</div>
					<div class="cont">
						<textarea name="ep_content" rows="3"><pre>${epilogueVO.ep_content}</pre></textarea>
					</div>

				</div>
				<div class="bt_wrap">
					<button type="submit" class="bt_modify">수정</button>
					<a href="list">취소</a>
				</div>
			</div>
		</div>

	</form>
	﻿
	<script>
		$(document).ready(function() {

			var formObj = $("form[role='form']");

			console.log(formObj);

			$(".bt_modify").on("click", function() {
				formObj.submit();
			});

			$(".bt_list").on("click", function() {
				console.log("list");
				formObj.attr("method", "get");
				formObj.attr("action", "/sboard/list");
				formObj.submit();
			});

		});
	</script>

</body>
</html>