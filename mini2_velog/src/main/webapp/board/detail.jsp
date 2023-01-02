<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/BoardDetail.css" />
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/BoardDetail.js?ver=5">
</script>
<script type="text/javascript">
loginId = '${sessionScope.loginId}';
post_num = "${vo.post_num }";
</script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/boardedit.js?ver=9">
</script>
</head>
<body>
<h3>detail</h3>
<a href="${pageContext.request.contextPath }/board/list.do">돌아가기</a><br/>
<form action="${pageContext.request.contextPath }/board/like.do">
<table border="1">
	<tr><th>제목</th><th>내용</th><th>작성자</th><th>날짜</th><th>조회수</th><th colspan="2">좋아요</th>
	<c:if test="${vo.writer==sessionScope.loginId }">
	<th>수정</th><th>삭제</th>
	</c:if>
	</tr>
<tr>
	<td id="title">${vo.title }</td>
	<td id="content">${vo.content }</td>
	<td >${vo.writer }</td>
	<td>${vo.w_date }</td>
	<td>${vo.views }</td>
	<td>${vo.likes }</td><td><input type="image" src="${pageContext.request.contextPath }/resources/img/like.png" alt="좋아요"></td>
	<c:if test="${vo.writer eq sessionScope.loginId }">
	<td><input type='button' value='수정' onclick='showEdit()'></td>
	</c:if>
</tr>
</table>
<input type="hidden" name="post_num" value="${vo.post_num }">
<input type="hidden" name="id" value="${sessionScope.loginId}">
</form>

<!-- 삭제 -->
<c:if test="${sessionScope.loginId eq vo.writer}">
<form action="${pageContext.request.contextPath }/board/delete.do">
<input type="submit" value="삭제">
<input type="hidden" name="post_num" value="${vo.post_num }">
</form>
</c:if>

<!-- 다운로드 -->
<c:if test="${vo.fname != null }">
<form action="${pageContext.request.contextPath }/board/downfile.do">
<input type="submit" value="다운로드">
<input type="hidden" id="post_num" name="post_num" value="${vo.post_num }">
<input type="hidden" name="fname" value="${vo.fname }">
</form>
</c:if>

<h4>댓글작성</h4>
<form action = "${pageContext.request.contextPath }/reply/add.do" method="post" >
<input type="hidden" value="${ sessionScope.loginId}" name="writer">
<input type="hidden" name="post_num" value="${vo.post_num }">
<table>
<tr><td><input type="text" name="content"></td></tr>
<tr><td><input type="submit" placeholder="댓글 작성" value="작성"></td></tr>
</table>
</form>

<span id="repCnt"></span>

<div id="repList"></div>

<div  id="hidden" style="display: none;">
제목:<input type="text" id="bedit_title" value="${vo.title }"><br/>
내용:<textarea cols="45" rows="15" id="bedit_content"  >${vo.content }</textarea><br/>
작성자:<input type="text" id="bedit_writer" readonly value="${vo.writer }"><br/>
날짜:<input type="text" id="bedit_wDate" readonly value="${vo.w_date }"><br/>
<input type="button" value="수정완료" onclick="b_edit(${vo.post_num })">
<input type="button" value="취소" onclick="bcancel()"><br/>
</div>

</body>
</html>