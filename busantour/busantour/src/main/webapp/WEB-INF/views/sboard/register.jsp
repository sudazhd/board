<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Epilogue Board</title>
<link href="../resources/css/css.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<div class="board_wrap">
		<div class="board_title">
			<strong>여행후기</strong>
			<p>여행 후기를 작성해주세요</p>
		</div>
		<div class="board_write_wrap">
			<form action="register" method="post" enctype="multipart/form-data">

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
								<input type="text" name="ep_writer" value="${memberVO.mem_nick}">
							</dd>
						</dl>
						<dl class="fileInfo">
							<dt class="f_text">사진업로드</dt>
								<dd class="addFile">
								<input type="file" name="org_file_name">
								<button class="fileAdd_btn" type="button" class="bt_addFile">파일추가</button>
							</dd>
							<dd id="fileIndex" class="fileIndex">
									<c:forEach var="file" items="${file }" varStatus="var">
										<div class="delFile">
											<input type="hidden" id="file_no" name="file_no"${var.index} value="${file.file_no }">
											<input type="hidden" id="file_name" name="file_name" value="file_no_${var.index }">
											<button id="fileDel" onclick="fn_del('${file.file_no}','file_no_${var.index }');" type="button" class="bt_delFile">파일삭제</button><br>
											
										</div>
									</c:forEach>
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

</body>

<script type="text/javascript">
	fn_addFile();
	function fn_addFile(){
		var fileIndex = 1;
		$(".fileAdd_btn").on("click", function(){
			$("#fileIndex").append(
				"<div><input type='file' name='file_"+(fileIndex++)+"'>&nbsp;"+"</button>"
				+"<button type='button' id='fileDelBtn'>"+"파일삭제"	+"</button></div>");
		});
		
		$(document).on("click","#fileDelBtn", function(){
			$(this).parent().remove();
			
		});
	}
	
		var fileNoArry = new Array();
		var fileNameArry = new Array();
		function fn_del(value, name){
			fileNoArry.push(value);
			fileNameArry.push(name);
			$("#fileNoDel").attr("value", fileNoArry);
			$("#fileNameDel").attr("value", fileNameArry);
		}
</script>
</html>