<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Modify Page</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link href="../resources/css/css.css" rel="stylesheet" type="text/css">
</head>
<body>
	<form role="form" method="post" enctype="multipart/form-data">

		<input type="hidden" name="page" value="${cri.page }"> 
		<input type="hidden" name="perPageNum" value="${cri.perPageNum }"> 
		<input type="hidden" name="searchType" value="${cri.searchType }"> 
		<input type="hidden" name="keyword" value="${cri.keyword }">
		<input type="hidden" id="fileNoDel" name="fileNoDel[]" value=""> 
		<input type="hidden" id="fileNameDel" name="fileNameDel[]" value=""> 

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
						<dl class="fileInfo">
							<dt class="f_text">사진업로드</dt>
								<dd class="addFile">
									<input type="file" name="org_file_name" class="org_file_name">
									<button class="fileAdd_btn" type="button">파일추가</button>
								</dd>
								<dd id="fileIndex" class="fileIndex">
									<c:forEach var="file" items="${file }" varStatus="var">
										<div class="delFile">
											<input type="hidden" id="file_no" name="file_no"${var.index} value="${file.file_no }">
											<input type="hidden" id="file_name" name="file_name" value="file_no_${var.index }">
											<a href="#" id="fileName" onclick="return false;"> ${file.org_file_name } </a>(${file.file_size }kb)
											<button id="fileDel" onclick="fn_del('${file.file_no}','file_no_${var.index }');" type="button" class="bt_delFile">파일삭제</button><br>
											
										</div>
									</c:forEach>
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
			
			$(document).on("click","#fileDel", function(){
				$(this).parent().remove();
			})

		});
		
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

</body>
</html>