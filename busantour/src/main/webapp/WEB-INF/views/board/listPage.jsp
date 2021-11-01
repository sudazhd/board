<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List Page</title>
</head>
<body>
	<table class="table table-bordered">
		<tr>
			<th style="width: 10px">No.</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th style="width: 60px">조회수</th>
		</tr>

		<c:forEach items="${list}" var="epilogueVO">
			<tr>
				<td>${epilogueVO.ep_no}</td>
				<td><a href="/board/readPage${pageMaker.makeQuery(pageMaker.cri.page)}&ep_no=${epilogueVO.ep_no}">${epilogueVO.ep_title}</a></td>
				<td>${epilogueVO.ep_writer}</td>
				<td><fmt:formatDate pattern="yyyy-mm-dd HH:mm" value="${epilogueVO.regdate}"/></td>
				<td><span class="badge bg-red"> ${epilogueVO.ep_viewcnt}</span></td>
			</tr>
		</c:forEach>

	</table>
	
	<div class="text-center">
		<ul class="pagination">

			<c:if test="${pageMaker.prev}">
				<li><a href="listPage${pageMaker.makeQuery(pageMaker.startPage -1) }">&laquo;</a></li>
			</c:if>

			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
				<li <c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
					<a href="listPage${pageMaker.makeQuery(idx)}">${idx}</a>
				</li>
			</c:forEach>

			<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
				<li><a href="listPage${pageMaker.makeQuery(pageMaker.endPage + 1)}">&raquo;</a></li>
			</c:if>
		</ul>
		
</body>
<script type="text/javascript">
	
	var result = '${msg}';
	
	if (result == 'SUCCESS') {
		alert("처리가완료되었습니다.")
	}
	
		

</script>

</html>