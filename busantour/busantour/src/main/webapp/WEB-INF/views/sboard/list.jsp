<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List Page</title>
<link href="../resources/css/css.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<header>
		<a href="/"><img src="../resources/images/title.png"></a>
	</header>
	<nav>
		<c:if test="${member != null }">
				<h2>${member.mem_id} 님환영 합니다.</h2>
				<button id="bt_logout" class="bt_logout" type="button">로그아웃</button>
				<button id="bt_remove" class="bt_withdraw" type="button">회원탈퇴</button>
		</c:if>
	</nav>
	<div class="board_wrap">
		<div class="board_title">
			<strong>여행후기</strong>
			<div class="list_search">
			
				<select name="searchType">
					<option value="n"
						<c:out value="${cri.searchType == null?'selected':''}"/>>---
					</option>
					<option value="t"
						<c:out value="${cri.searchType eq 't'?'selected':''}"/>>제목</option>
					<option value="c"
						<c:out value="${cri.searchType eq 'c'?'selected':''}"/>>내용</option>
					<option value="w"
						<c:out value="${cri.searchType eq 'w'?'selected':''}"/>>글쓴이</option>
					<option value="tc"
						<c:out value="${cri.searchType eq 'tc'?'selected':''}"/>>제목,내용</option>
					<option value="cw"
						<c:out value="${cri.searchType eq 'cw'?'selected':''}"/>>내용,글쓴이</option>
					<option value="tcw"
						<c:out value="${cri.searchType eq 'tcw'?'selected':''}"/>>제목,내용,글쓴이</option>
				</select> <input type="text" name="keyword" class="keyword" id="keywordInput"
					value="${cri.keyword }">
				<button id="searchBtn">검색</button>

			</div>
		</div>

		<div class="board_list_wrap">
			<div class="board_list">
				<div class="top">
					<div class="num">번호</div>
					<div class="title">제목</div>
					<div class="writer">글쓴이</div>
					<div class="date">작성일</div>
					<div class="count">조회수</div>
				</div>

				<c:forEach items="${list}" var="epilogueVO">
					<div>
						<div class="num">${epilogueVO.ep_no}</div>
						<div class="title">
							<a
								href="/sboard/readPage${pageMaker.makeSearch(pageMaker.cri.page)}&ep_no=${epilogueVO.ep_no}">${epilogueVO.ep_title}</a>
						</div>
						<div class="writer">${epilogueVO.ep_writer}</div>
						<div class="date">
							<fmt:formatDate pattern="yyyy-mm-dd HH:mm"
								value="${epilogueVO.regdate}" />
						</div>
						<div class="count">${epilogueVO.ep_viewcnt}</div>
					</div>
				</c:forEach>
			</div>
			<div class="board_page">
				<ul class="pagination">
					<c:if test="${pageMaker.prev}">
						<li><a
							href="list${pageMaker.makeSearch(pageMaker.startPage -1) }"
							class="bt first">&laquo;</a></li>
					</c:if>

					<c:forEach begin="${pageMaker.startPage}"
						end="${pageMaker.endPage}" var="idx">
						<li
							<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
							<a href="list${pageMaker.makeSearch(idx)}" class="num">${idx}</a>
						</li>
					</c:forEach>

					<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
						<li><a
							href="list${pageMaker.makeSearch(pageMaker.endPage + 1)}"
							class="bt last">&raquo;</a></li>
					</c:if>
				</ul>
			</div>
			<c:if test="${member != null }">
			<div class="bt_wrap">
				<a href="register" class="on">등록</a>
			</div>
			</c:if>
		</div>

	</div>
</body>

<script>
	$(document).ready(
			function() {

				$('#searchBtn').on(
						"click",
						function(event) {
							self.location = "list"
									+ '${pageMaker.makeQuery(1)}'
									+ "&searchType="
									+ $("select option:selected").val()
									+ "&keyword=" + $('#keywordInput').val();
						});
			});

	var result = '${msg}';

	if (result == 'SUCCESS') {
		alert("처리가완료되었습니다.")
	}
	
	$(document).ready(function() {
		
		$("#bt_logout").on("click", function() {
			location.href = "member/logout";
		})

		$("#bt_remove").on("click", function(){
			location.href="member/memberDelete";
		})
	})
</script>

</html>