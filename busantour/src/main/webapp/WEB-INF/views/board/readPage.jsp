<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- Main content -->
<section class="content">
	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">READ BOARD</h3>
				</div>
				<!-- /.box-header -->

				<form role="form" action="modifyPage" method="post">
					<input type="hidden" name="ep_no" value="${epilogueVO.ep_no}">
					<input type="hidden" name="page" value="${cri.page}"> <input
						type="hidden" name="perPageNum" value="${cri.perPageNum}">
				</form>

				<div class="box-body">
					<div class="form-group">
						<label for="exampleInputEmail1">Title</label> <input type="text"
							name='ep_title' class="form-control"
							value="${epilogueVO.ep_title}" readonly="readonly">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">Content</label>
						<textarea class="form-control" name="ep_content" rows="3"
							readonly="readonly">${epilogueVO.ep_content}</textarea>
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">Writer</label> <input type="text"
							name="ep_writer" class="form-control"
							value="${epilogueVO.ep_writer}" readonly="readonly">
					</div>
				</div>
				<!-- /.box-body -->

				<div class="box-footer">
					<button type="submit" class="btn btn-warning-test">Modify</button>
					<button type="submit" class="btn btn-danger">REMOVE</button>
					<button type="submit" class="btn btn-primary">GO LIST</button>
				</div>


				<script>
					$(document).ready(function() {

						var formObj = $("form[role='form']");
						var httpMethod = $("#requestMethod");

						console.log(formObj);

						$(".btn-warning-test").on("click", function() {
							formObj.attr("action", "/board/modifyPage");
							formObj.attr("method", "get");
							console.log("modify");
							formObj.submit();
						});

						$(".btn-danger").on("click", function() {
							formObj.attr("action", "/board/removePage");
							console.log("remove");
							formObj.submit();
						});

						$(".btn-primary").on("click", function() {
							formObj.attr("method", "get");
							formObj.attr("action", "/board/listPage");
							console.log("list");
							formObj.submit();
						});

					});
				</script>




			</div>
			<!-- /.box -->
		</div>
		<!--/.col (left) -->

	</div>
	<!-- /.row -->
</section>
<!-- /.content -->


