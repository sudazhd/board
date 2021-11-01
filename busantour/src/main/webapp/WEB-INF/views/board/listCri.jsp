<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List Cri</title>
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
				<td><a href='/board/read?ep_no=${epilogueVO.ep_no }'> ${epilogueVO.ep_title}</a></td>
				<td>${epilogueVO.ep_writer}</td>
				<td><fmt:formatDate pattern="yyyy-mm-dd HH:mm" value="${epilogueVO.regdate}"/></td>
				<td><span class="badge bg-red"> ${epilogueVO.ep_viewcnt}</span></td>
			</tr>
		</c:forEach>

	</table>
</body>
<script type="text/javascript">
	var result = '${msg}';

	if (result == 'SUCCESS') {
		alert("처리가완료되었습니다.")
	}

</script>
</html>