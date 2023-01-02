<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Awesome Search Box</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">

	<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/index/assets/css/search.css?ver=7
	" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />

</head>
  <body>
    				 <header class="site__header">
     			 	  <div class="nav">
     			   	    <h1 class="logo">Velog<span>story</span></h1>
       			   	  <ul class="nav-menu">
      			       	   <li class="nav-menu__item">
      			        	      <a href="${pageContext.request.contextPath }/index/start.jsp">home</a>
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
    <div class="container h-100">
    <div class="up">
      <div class="d-flex justify-content-center h-100" >
      <p id="p" >제목으로 검색:</p> 
        <form class="searchbar" action="${pageContext.request.contextPath }/board/search.do" method="post">
          <input class="search_input" type="text" name="title" placeholder="Search...">
          <input type="hidden" value="1" name="s">
          <button  class="search_icon"><i class="fas fa-search"></i></button>
        </form>
	    <p id="p" >작성자로 검색:</p> 
        <form class="searchbar" action="${pageContext.request.contextPath }/board/search.do" method="post">
          <input class="search_input" type="text" name="writer" placeholder="Search...">
           <input type="hidden" value="2" name="s">
           <button  class="search_icon"><i class="fas fa-search"></i></button>
        </form>
      </div>
      </div>
    </div>

 
    

<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
  </body>
</html>