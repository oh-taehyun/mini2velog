<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<!--
	Phantom by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>KOSTA VELOG</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="${pageContext.request.contextPath }/index/assets/css/main.css" />
		<noscript><link rel="stylesheet" href="${pageContext.request.contextPath }/index/assets/css/noscript.css" /></noscript>
	</head>
	<body class="is-preload">
		<!-- Wrapper -->
			<div id="wrapper">
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
      			        	  <c:if test="${sessionScope.loginId!=null }">
       			    	         <a href="${pageContext.request.contextPath }/board/mydetail.do?id=${sessionScope.loginId}">my blog</a>
      				          </c:if>
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
						<div class="inner">
							<header>
								<div class="nav2">
									<ul class="nav-menu2">
      			       	  				 <li class="nav-menu__item">
      			        		 	 	    <a href="${pageContext.request.contextPath }/board/list.do">전체목록</a>
      			        				 </li>
      			        			 	 <li class="nav-menu__item">
     			         	 		   		<a href="${pageContext.request.contextPath }/board/s_latest.do">최신순</a>
      			        				 </li>
       			      					 <li class="nav-menu__item">
       			    		    	   		<a href="${pageContext.request.contextPath }/board/selectByViews.do">조회순</a>
      				  	       			 </li>
    				      	 		 </ul>
    				      	 	 </div>
							</header>
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
						</div>
					</div>

			</div> 

		<!-- Scripts -->
			<script src="${pageContext.request.contextPath }/index/assets/js/jquery.min.js"></script>
			<script src="${pageContext.request.contextPath }/index/assets/js/browser.min.js"></script>
			<script src="${pageContext.request.contextPath }/index/assets/js/breakpoints.min.js"></script>
			<script src="${pageContext.request.contextPath }/index/assets/js/util.js"></script>
			<script src="${pageContext.request.contextPath }/index/assets/js/main.js"></script>

	</body>
</html>