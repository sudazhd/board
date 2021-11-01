<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Epilogue Board</title>
<link href="../resources/css/css.css" rel="stylesheet" type="text/css">
<style>
iframe {
	width: 0px;
	height: 0px;
	border: 0px;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<div class="board_wrap">
		<div class="board_title">
			<strong>여행후기</strong>
			<p>여행 후기를 작성해주세요</p>
		</div>
		<div class="board_write_wrap">
			<form action="register" method="post">

				<div class="board_write">
					<div class="title">
						<dl>
							<dt>제목</dt>
							<dd>
								<input type="text" name="ep_title" placeholder="제목을 입력하세요">
							</dd>
						</dl>
					</div>
					<div class="info">
						<dl>
							<dt>글쓴이</dt>
							<dd>
								<input type="text" name="ep_writer" placeholder="글쓴이를 입력하세요">
							</dd>
						</dl>
						<dl>
							<dt>사진업로드</dt>
							<dd>
								<input type="file" name="file">
							</dd>
						</dl>
					</div>
					<div class="cont">
						<textarea name="ep_content" rows="3" placeholder="내용을 입력하세요"></textarea>
					</div>
				</div>
				<div class="bt_wrap">
					<button type="submit" class="bt_submit">등록</button>
					<a href="list">취소</a>
				</div>
			</form>
		</div>
	</div>

	<iframe name="zeroFrame"></iframe>

<!-- 	<script>
		$(".bt_list").on("click", function() {
			console.log("list");
			formObj.attr("method", "get");
			formObj.attr("action", "/sboard/list");
			formObj.submit();
		});
	</script> -->
</body>
</html>