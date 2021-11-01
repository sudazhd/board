<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Modify</title>
</head>
<body>
	<form role="form" method="post">
	
	<input type="hidden" name="page" value="${cri.page}">
	<input type="hidden" name="perPageNum" value="${cri.perPageNum}">
	<input type='hidden' name='ep_no' value="${epilogueVO.ep_no}" /> 
	<input id="requestMethod" type="hidden" name="_method" value="" />
	
		<div class="box-body">
			<div class="form-group">
				<label for="exampleInputEmail1">No.</label> 
				<input type="text" name="ep_no" class="form-control" value="${epilogueVO.ep_no}" readonly="readonly">
			</div>
			<div class="form-group">
				<label for="exampleInputEmail1">Title</label> 
				<input type="text" name="ep_title" class="form-control"	value="${epilogueVO.ep_title}">
			</div>
			<div class="form-group">
				<label for="exampleInputPassword1">Content</label>
				<textarea name="ep_content" class="form-control" rows="3">${epilogueVO.ep_content}</textarea>
			</div>
			<div class="form-group">
				<label for="exampleInputEmail1">Writer</label> 
				<input type="text" name="ep_writer" class="form-control" value="${epilogueVO.ep_writer}">
			</div>
		</div>
		<!-- /.box-body -->
		
	</form>
	<div class="box-footer">
		<button type="submit" class="btn btn-primary">SAVE</button>
		<button type="submit" class="btn btn-warning">CANCEL</button>
	</div>
	﻿
	<script>
		$(document).ready(function() {

			var formObj = $("form[role='form']");

			console.log(formObj);

			$(".btn-warning").on("click", function() {
				self.location = "/board/listPage?page=${cri.page}&perPageNum=${cri.perPageNum}";
			});

			$(".btn-primary").on("click", function() {
				formObj.submit();
			});

		});
	</script>

</body>
</html>