<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Velog Story</title>

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
	href="${pageContext.request.contextPath }/resources/css/BoardDetail.css?ver=5" />

<!-- feather icon -->
<script
	src="https://cdn.jsdelivr.net/npm/feather-icons/dist/feather.min.js"></script>

<!--     원래 detail.jsp -->
<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/js/BoardDetail.js?ver=28">
	
</script>
<script type="text/javascript">
	loginId = '${sessionScope.loginId}';
	post_num = "${vo.post_num }";
</script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/js/boardedit.js?ver=13">
	
</script>
</head>
<body>
	<div class="site__container">
		<!-- header영역 -->
   				 <header class="site__header">
     			 	  <div class="nav">
     			   	    <h1 class="logo">Velog<span>story</span></h1>
       			   	  <ul class="nav-menu">
      			       	   <li class="nav-menu__item">
      			        	      <a href="${pageContext.request.contextPath }/index/start.jsp">home</a>
      			        	  </li>
      			        	  <li class="nav-menu__item">
     			          	     <a href="${pageContext.request.contextPath }/board/search.do">search</a>
      			        	  </li>
       			      		  <li class="nav-menu__item">
      			        	  
       			    	         <a href="${pageContext.request.contextPath }/board/mydetail.do?id=${sessionScope.loginId}">my blog</a>
      				          
      				          </li>
       				         <li class="nav-menu__item contact">
       				         	 <c:if test="${sessionScope.loginId==null }">
       				             	<a href="${pageContext.request.contextPath }/member/login.do" >login</a>
     				             </c:if>
     				             <c:if test="${sessionScope.loginId!=null }">
       				            	 <a href="${pageContext.request.contextPath }/member/logout.do">logout</a>
     				             </c:if>
     				         </li>
    				   </ul>
     				   </div>
  				  </header>
		<!-- post 영역 -->

		<main class="post">
			<div class="container">
				<!-- 헤더영역 -->
				<div class="content">
					<header class="post-header">

						<h2 class="post-header__title" id="title">${vo.title }</h2>
						<ul class="post-header__info">
							<li class="post-header__date"><i data-feather="calendar"></i>
								${vo.w_date }</li>
							<li class="post-header__author"><i data-feather="user"></i>
								<a
								href="${pageContext.request.contextPath }/board/mydetail.do?id=${vo.writer}">
									${vo.writer }</a></li>
						</ul>
						<c:if test="${vo.writer eq sessionScope.loginId }">
							<input type='button' class="contentBt" value='수정' onclick='showEdit()'>
							<form action="${pageContext.request.contextPath }/board/delete.do">
								<input type="submit" class="contentBt" value="삭제">
								<input type="hidden" name="post_num" value="${vo.post_num }">
							</form>
						</c:if>
					</header>

					<article class="post-content">
						<c:if test="${vo.fname != null }">
							<form
								action="${pageContext.request.contextPath }/board/downfile.do">

								<span style="float: right;">첨부파일명: ${vo.fname}&nbsp;<input
									type="submit" class="filedown" value="다운로드"></span><br /> <br />
								<br /> <input type="hidden" id="post_num" name="post_num"
									value="${vo.post_num }"> <input type="hidden"
									name="fname" value="${vo.fname }">
							</form>
						</c:if>
						<p id="content" style="margin-bottom: 100px;">${vo.content }</p>

						<div id="hidden" style="display: none;">
							<table class="editFormSize" >
								<tr><td><input type="text" id="bedit_title" class="editContent" value="${vo.title }" placeholder="제목을 입력하세요" style="width:100%; height:40px;"></td>
								<tr><td><textarea cols="90" rows="15" id="bedit_content" class="editContent" placeholder="당신의 이야기를 적어보세요..." style="resize:none">${vo.content }</textarea></td>
								<tr><td><input type="button" class="editBt" value="수정완료" onclick="b_edit(${vo.post_num })" style="margin-right:30px;">
							<input type="button" class="editBt" value="취소" onclick="bcancel()"></td>
							</table>
							
						</div>
						<!-- 글쓴이 -->
						<div class="author">
							<div class="author__top">
								<div class="author__info">
									<figure class="author__avatar">
										<img src="./src/user_01.png" alt="">
									</figure>
									<ul>
										<li class="author__job">Author</li>
										<li class="author__name">${vo.writer }</li>
									</ul>
								</div>

							</div>
							<p class="author__introduce">${Intro}</p>
						</div>

						<!-- 					여기서 article 닫으면 안됨 -->
						<!-- 댓글 -->
						<div class="comment">
							<h2 class="comment__title">
								<i data-feather="message-circle"></i> <span id="repCnt"></span>
							</h2>
							<!-- 						추가된 부분 댓글작성 -->
							<c:if test="${ sessionScope.loginId != null}">
								<form action="${pageContext.request.contextPath }/reply/add.do"
									method="post">
									<input type="hidden" value="${ sessionScope.loginId}"
										name="writer"> <input type="hidden" name="post_num"
										value="${vo.post_num }">
									<table>
										<tr>
											<td><textarea name="content" rows=5 cols=92
													class="conmmentWrite" placeholder="댓글을 작성하세요"></textarea></td>
										</tr>
										<tr>
											<td><input type="submit" class="commentWtBt"
												value="댓글 작성"></td>
										</tr>
									</table>
								</form>
							</c:if>
						</div>
						<div class="comment" id="repList">
							<!--                         댓글하나 -->
						</div>
						<!-- 					여기서 article 닫아줘야함 -->
					</article>
					<div>
						<input type="button" class="commentWtBt" value="글 목록"
							onclick="listAll()">
					</div>
				</div>
				<!-- 				content클래스닫는 태그 -->

				<aside class="floating left">
					<div class="buttons">
						<button class="button">
							<i data-feather="message-circle"></i>
							<!--                         댓글 -->
							<span id="repCnt2"></span>
						</button>
						<button class="button" type="button" onclick="heartUpDown()">
							<i data-feather="heart"></i>
							<!--                         좋아요 -->
							${vo.likes }
						</button>

					</div>
				</aside>
				<button class="floating right" type="button" onclick="up()">
					<i data-feather="arrow-up"></i>
				</button>
				<!-- 여기서 container 닫는 div 태그 필요 -->
				<!-- 그리고 여기서 메인 닫음 -->
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