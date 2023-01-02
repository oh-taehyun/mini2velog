<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="chrome">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
<title>Velog Story</title>
<!-- 구글폰트 - Montserrat -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700&display=swap" rel="stylesheet">

    <!-- Pretendard 폰트 -->
    <link rel="stylesheet" as="style" crossorigin
          href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css"/>

    <!-- 스타일시트 추가 -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/MyDetail.css?ver=777" />
		<noscript><link rel="stylesheet" href="${pageContext.request.contextPath }/index/assets/css/noscript.css" /></noscript>
    <!-- feather icon -->
    <script src="https://cdn.jsdelivr.net/npm/feather-icons/dist/feather.min.js"></script>
</head>
<body>

<div class="site__container">
    <!-- header영역 -->
    <div id="wrapper">
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
<!-- Main -->
<div id="main">
	<h2 class="intmain">${vo.name }'s blog page</h2>
	<div class="intcon">${vo.intro }</div>
	<div class="div-button">
	<c:if test="${vo.id == sessionScope.loginId}">
	<button class="button-go" onclick="location.href='${pageContext.request.contextPath }/board/add.do?writer=${vo.id }'">새 글쓰기</button>
	<button class="button-go" onclick="location.href='${pageContext.request.contextPath }/member/out.do?id=${sessionScope.loginId}'">탈퇴</button>
	</c:if>
	<button class="button-go" onclick="location.href='${pageContext.request.contextPath }/todo/list.do?writer=${vo.id }'">To-Do List</button>
	</div>
	<div class="intcon2">글목록</div>
	<div class="inner">
	<c:if test="${empty list }">
		<div class="intcon3">등록된 글이 없습니다</div><br/>
	</c:if>
	<c:if test="${not empty list }">
		<section class="tiles">
			<c:forEach var="vo" items="${list }">
				<article class="style1">
					<span class="image">
						<img src="${pageContext.request.contextPath }/index/images/pic09.jpg" alt="" />
					</span>
					<a href="${pageContext.request.contextPath }/board/views.do?post_num=${vo.post_num}&id=${sessionScope.loginId}"><!-- 개인페이지이동 -->
						<h2>${vo.title }</h2>
						<div class="content">
							<p id="content">${vo.content }</p>
						</div>
					</a>
				</article>
			</c:forEach>
		</section>
	</c:if>
	</div>
</div>
</div>




 <footer class="footer">
        <p class="site__information">
            ⓒ2022 BlogStory - All right Reserved.
        </p>
    </footer>
</div>
<script>
    feather.replace();
</script>
    		<!-- Scripts -->
			<script src="${pageContext.request.contextPath }/index/assets/js/jquery.min.js"></script>
			<script src="${pageContext.request.contextPath }/index/assets/js/browser.min.js"></script>
			<script src="${pageContext.request.contextPath }/index/assets/js/breakpoints.min.js"></script>
			<script src="${pageContext.request.contextPath }/index/assets/js/util.js"></script>
			<script src="${pageContext.request.contextPath }/index/assets/js/main.js"></script>
</body>
</html>