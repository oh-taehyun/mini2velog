<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Velog Story: 글쓰기</title>

<!-- 구글폰트 - Montserrat -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700&display=swap"
	rel="stylesheet">

<!-- Pretendard 폰트 -->
<link rel="stylesheet" as="style" crossorigin
	href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css" />

<!-- 스타일시트 추가 -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/board/addStyle.css" />

<!-- feather icon -->
<script
	src="https://cdn.jsdelivr.net/npm/feather-icons/dist/feather.min.js"></script>


<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/js/BoardDetail.js?ver=26"></script>
</head>
<body>
	<div class="site__container">
		<!-- header영역 -->
		<header class="site__header">
			<div class="nav">
				<h1 class="logo">
					Velog<span>story</span>
				</h1>
				<ul class="nav-menu">
					<li class="nav-menu__item"><a href="#">home</a></li>
					<li class="nav-menu__item"><a href="#">about</a></li>
					<li class="nav-menu__item"><a
						href="${pageContext.request.contextPath }/board/list.do">blog</a>
					</li>
					<li class="nav-menu__item contact"><a href="#">contact</a></li>
				</ul>
			</div>
		</header>
		<!-- post 영역 -->
		<main class="post">
			<div class="container">
				<div class="content">
					<article class="post-content">
						<form action="${pageContext.request.contextPath }/board/add.do" method="post" enctype="multipart/form-data">
							<input type="hidden" name="writer" value="${sessionScope.loginId}" readonly>
							<input type="text" name="title" placeholder="제목을 입력해주세요"><br>
							<input type="file" name="file">
							<textarea name="content" placeholder="내용을 입력해주세요"></textarea>
							<input type="submit" value="글 쓰기">
						</form>
					</article>
					<div>
						<input type="button" class="commentWtBt" value="글 목록"
							onclick="listAll()">
					</div>
				</div>
			</div>
		</main>
		<footer class="footer">
			<p class="site__information">ⓒ2022 BlogStory - All right
				Reserved.</p>
		</footer>
	</div>
	<!-- feather icon -->
	<script>
		feather.replace();
	</script>
</body>
</html>