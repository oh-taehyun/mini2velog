<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="${pageContext.request.contextPath }/index/assets/css/main.css" />
<title>Login</title>
<script type="text/javascript">
const a = () => {
	let win = open("${pageContext.request.contextPath }/member/joinForm.jsp", "win", "width=400,height=500");
	
}
const b=()=>{
	let win = open("${pageContext.request.contextPath }/member/findId.jsp", "win", "width=300,height=300");
}
</script>
</head>
<body>
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
       			    	         <a href="${pageContext.request.contextPath }/board/list.do?id=${sessionScope.loginId}">blog</a>
      				          </li>
       				         <li class="nav-menu__item contact">
       				         	 <c:if test="${sessionScope.loginId==null }">
       				             	<a href="${pageContext.request.contextPath }/member/login.do">login</a>
     				             </c:if>
     				             <c:if test="${sessionScope.loginId!=null }">
       				            	 <a href="${pageContext.request.contextPath }/member/logout.do">logout</a>
     				             </c:if>
     				         </li>
    				   </ul>
     				   </div>
  				  </header>
  				  <div id="main">
						<div class="inner">
						<form action="${pageContext.request.contextPath }/member/login.do" method="post">
						<table>
							<tr><th rowspan='6'><img src="${pageContext.request.contextPath }/resources/img/로그인.jpg"style="width:200px; height:200px;"></th></tr>
							<tr><td>아이디로 로그인하기</td></tr>
							<tr><td><input type="text" name="id" placeholder="아이디를 입력해 주세요."></td></tr>
							<tr><td><input type="password" name="pwd" placeholder="비밀번호를 입력해 주세요."></td></tr>
							<tr><td><input type="submit" value="login">
							<input type="button" value="회원가입" onclick="a()"></td></tr>
							<tr><td><a href="#"onclick="b()">아이디를 잊으셨나요?</a></td></tr>
						</table>
						</form>
						</div>
					</div>
     </div>
</body>
</html>