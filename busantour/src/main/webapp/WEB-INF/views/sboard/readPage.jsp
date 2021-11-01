<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List Page</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link href="../resources/css/css.css" rel="stylesheet" type="text/css">
</head>
<body>

	<form role="form" action="modifyPage" method="post">
		<input type="hidden" name="ep_no" value="${epilogueVO.ep_no }">
		<input type="hidden" name="page" value="${cri.page }"> <input
			type="hidden" name="perPageNum" value="${cri.perPageNum }"> <input
			type="hidden" name="searchType" value="${cri.searchType }"> <input
			type="hidden" name="keyword" value="${cri.keyword }">

	</form>

	<div class="board_wrap">
		<div class="board_title">
			<strong>여행 후기</strong>
			<p>여행 후기</p>
		</div>
		<div class="board_list_wrap">
			<div class="board_view">
				<div class="title">${epilogueVO.ep_title}</div>
				<div class="info">
					<dl>
						<dt>번호</dt>
						<dd>${epilogueVO.ep_no}</dd>
					</dl>
					<dl>
						<dt>글쓴이</dt>
						<dd>${epilogueVO.ep_writer}</dd>
					</dl>
					<dl>
						<dt>작성일</dt>
						<dd>${epilogueVO.regdate}</dd>
					</dl>
					<dl>
						<dt>조회수</dt>
						<dd>${epilogueVO.ep_viewcnt}</dd>
					</dl>
				</div>
				<div class="cont">${epilogueVO.ep_content}</div>
			</div>

		</div>
		<div class="bt_wrap">
			<button type="submit" class="bt_modify">수정</button>
			<button type="submit" class="bt_remove">삭제</button>
			<button type="submit" class="bt_list">목록</button>
		</div>
	</div>


	<script>
		$(document).ready(function() {

			var formObj = $("form[role='form']");
			var httpMethod = $("#requestMethod");

			console.log(formObj);

			$(".bt_modify").on("click", function() {

				console.log("move modify");
				formObj.attr("action", "/sboard/modifyPage");
				formObj.attr("method", "get");
				formObj.submit();
			});

			$(".bt_remove").on("click", function() {
				console.log("remove");
				formObj.attr("action", "/sboard/removePage");
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

