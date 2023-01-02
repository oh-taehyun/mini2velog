<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<h3>게시판</h3>
<a href="${pageContext.request.contextPath }/board/add.do">글작성</a>
<a href="${pageContext.request.contextPath }/board/search.do">검색</a>
<a href="${pageContext.request.contextPath }/board/list.do">전체목록</a>
<a href = "${pageContext.request.contextPath }/board/s_latest.do">최신순</a>
<a href = "${pageContext.request.contextPath }/board/selectByViews.do">조회순</a>
<c:if test="${empty list }">
<h3>조건에 맞는 게시물이 없습니다.</h3><br/>
</c:if>
<c:if test="${not empty list }">
<table border="1">
<c:forEach var="vo" items="${list }">
<tr><th>제목</th><th>내용</th><th>작성자</th><th>날짜</th><th>좋아요</th></tr>
<tr>
	<td><a href="${pageContext.request.contextPath }/board/views.do?post_num=${vo.post_num}&id=${sessionScope.loginId}">${vo.title }</a></td>
	<td>${vo.content }</td>
	<td>${vo.writer }</td>
	<td>${vo.w_date }</td>
	<td>${vo.likes }</td>
</tr>
</c:forEach>
</table>
</c:if>
</body>
</html>